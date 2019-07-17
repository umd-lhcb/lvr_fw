--------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MARYLAND
--
-- File: TOP_LV_REGUL_CNTL.vhd
-- File history:
--      REV - // JAN 7, 2019  INITIAL UPDATE
--              REV A // APR 8, 2019  INCCLUDES FAILSAFE UPDATES
--
-- Description: LV REGULATOR SERIAL CONTROL INTERFACE
--      FUNCTIONS:
--                      1) UNDER-VOLTAGE LOCKOUT FAILSAFE--CHECK EACH OF 4 FUSES
--                                              A) REQUIRES THAT EACH FUSE SECTION TREATED AS SEPARATE INDEPENDENT CONTROL CENTERS
--                                      2) BOARD OVER-TEMPERATURE FAILSAFE CHECK
--                                              A) LATCHED CONDITION FOR ENTIRE BOARD
--                      3) SPI SERIAL COMM
--                      4) REGULATOR CHANNEL SEQUENCE CONTROLS

--              THERE ARE 2 SERIAL COMM OPTIONS:
--                      (A) SINGLE GBT-SCA SPI SLAVE WHEN ADDR_SEL(4:0)= 1F HEX
--                                      NOTE THAT THIS SPI PORT OPERATES AS A SHIFT REGISTER DRIVEN BY THE GBT-SCA SPI CLOCK.  
--                                      A CLOCK BOUNDARY CROSSING IS INITIATED ONCE THE SPI CLOCK STOPS

--                      (B) DAISY CHAINED RS-485 ASYNC SERIAL INTERFACE (LEGACY INTERFACE NOT IMPLEMENTED)

--
-- Targeted device: <Family::ProASIC3N> <Die::A3PN250> <Package::100 VQFP>
-- Author: TOM O'BANNON
--
-- ////////////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////////////
-- CAUTION:  SIM_MODE CONSTANT NEEDS TO BE MANUALLY UPDATED!!!!!
--                              (A) SLOW_PULSE_EN_GEN HAS A SPECIAL SIM INPUT OPTION
--                              (B) MAIN_SEQUENCER_NEW CONSTANT DEL_CNT_VAL CAN BE CHANGED TO SPEED SIM
-- ////////////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////////////
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_MISC.all;
--USE IEEE.NUMERIC_STD.ALL;

library proasic3;
use proasic3.all;

-- NOTE:  THE SYNPLIFY LIBRARY NEEDS TO BE COMMENTED OUT FOR MODELSIM PRESYNTH SIMS SINCE MODELSIM DOES NOT RECOGNIZE IT
--library synplify;
--use synplify.attributes.all;

entity TOP_LVR_GEN3_CNTL is
  port (
    CLK40MHZ_OSC : in std_logic;        -- pin 57, EXTERNAL 3.3V 40 MHZ CLOCK 
    POR_FPGA     : in std_logic;  -- pin 93, ACTIVE LOW RESET --DEDICATED RC TIME CONSTANT---NEEDS SCHMITT-TRIGGER!

-- UNDER-VOLTAGE LOCKOUT AND FUSE STATUS DETECTION      
    FPGA_FUSE_1_2_OK : in std_logic_vector(0 downto 0);  -- pin 42, UNDER-VOLTAGE LOCKOUT FAILSAFE INPUT ('1'= INPUT FUSED RAIL FOR CH1&2 ABOVE THRESHOLD)
    FPGA_FUSE_3_4_OK : in std_logic_vector(0 downto 0);  -- pin 41, UNDER-VOLTAGE LOCKOUT FAILSAFE INPUT ('1'= INPUT FUSED RAIL FOR CH3&4 ABOVE THRESHOLD)
    FPGA_FUSE_5_6_OK : in std_logic_vector(0 downto 0);  -- pin 40, UNDER-VOLTAGE LOCKOUT FAILSAFE INPUT ('1'= INPUT FUSED RAIL FOR CH5&6 ABOVE THRESHOLD)
    FPGA_FUSE_7_8_OK : in std_logic_vector(0 downto 0);  -- pin 36, UNDER-VOLTAGE LOCKOUT FAILSAFE INPUT ('1'= INPUT FUSED RAIL FOR CH7&8 ABOVE THRESHOLD)

-- OVER-TEMPERATURE FAILSAFE
    TEMP_OK : in std_logic_vector(0 downto 0);  -- pin 43, BOARD TEMPERATURE FAILSAFE OK ('0'= ABOVE THE OVER-TEMP THRESHOLD--ie fault)

-- DIP SWITCH INPUTS

    -- OPERATION AND FAILSAFE MODES: DIP SW SETTINGS
    MODE_DCYC_NORMB : in std_logic;  -- pin 31, SCHEMA MODE 0   '1' = SPECIAL TEST LOW DUTY CYCLE MODE
    --                                             '0' = NORMAL OP WITH STAGGERED ENABLE SEQUENCES (19.6608 MS PER CHANNEL)
    MODE_WDT_EN     : in std_logic;  -- pin 30, SCHEMA MODE 1       '1' = WATCH DOG TIMER ENABLED
    --                                                 '0' = WATCH DOG TIMER DISABLED
    MODE_DIAG_NORMB : in std_logic;  -- pin 29, SCHEMA MODE 2   '1' = DISABLE FRAME ERROR CHECKING
    --                                                     '0' = NORMAL OPERATION FRAME ERROR CHECK ENABLED
    -- MASTER-SLAVE CHANNEL GROUP ENABLES: DIP SW SETTINGS
    -- '0' = DISABLED STATE WHERE SPECIFIED CHANNELS TREATED INDEPENDENTLY      
    -- '1' = ENABLED STATE WHERE SPECIFIED CHANNELS ARE TREATED AS A MASTER-SLAVE PAIR  
    CH1_2_MS_CFG_EN : in std_logic;  -- pin 21, BIT 0:  CH1_2_MS_CFG_EN = CHANNELS 1 & 2
    CH3_4_MS_CFG_EN : in std_logic;  -- pin 20, BIT 1:  CH3_4_MS_CFG_EN = CHANNELS 3 & 4
    CH5_6_MS_CFG_EN : in std_logic;  -- pin 19, BIT 2:  CH5_6_MS_CFG_EN = CHANNELS 5 & 6
    CH7_8_MS_CFG_EN : in std_logic;  -- pin 16, BIT 3:  CH7_8_MS_CFG_EN = CHANNELS 7 & 8

    -- MANUAL CHANNEL GROUP ENABLES FOR STAND-ALONE TESTS:  DIP SW SETTINGS
    MAN_EN_CH_4TO1 : in std_logic;  -- pin 15, (Schema was CH5_6_W_STDBY_E) NCHANNELS 5 & 6 TREATED AS REDUNDANT PAIR WHNE ='1'
    MAN_EN_CH_8TO5 : in std_logic;  -- pin 13, (Schema was CH7_8_W_STDBY_EN) CHANNELS 7 & 8 TREATED AS REDUNDANT PAIR WHNE ='1'

    TEMP_FAILSAFE_EN : in std_logic;  -- pin 11, '1' = TEMPERATURE FAILSAFE IS ENABLED
    STDBY_OFFB       : in std_logic;  -- PIN 10, '0'=ALL CHANNELS OFF, '1'= STANDBY AT V_OS OUT--READY TO OPERATE

-- RS-485               
    RX_FPGA : in  std_logic;            -- pin 97, RS_485 SERIAL RX STREAM
    TX_FPGA : out std_logic;            -- pin 98, RS_485 SERIAL TX STREAM

    PRI_RX_EN_BAR : out std_logic;  -- pin 96, ENABLE FOR THE RX OUTPUT--SHOULD BE STUCK AT '0'
    PRI_TX_EN     : out std_logic;      -- pin 94, ENABLE FOR THE TX OUTPUT--

    ADDR_SEL : in std_logic_vector(4 downto 0);  -- pins {28, 27, 26, 23, 22} DIP SW FOR MODULE ADDRESS--THIS IS ONLY NEEDED FOR THE DAISY-CHAINED RS-485 INTERFACE

-- GBT-SCA SPI
    SCA_CLK_OUT    : in  std_logic;  -- pin 35, SPI CLOCK FROM THE SPI MASTER
    SCA_RESET_OUT  : in  std_logic;  -- pin 34, OPTIONAL RESET FROM THE SPI MASTER
    SCA_DAT_IN     : out std_logic;  -- pin 3, SERIAL DATA FROM FPGA TO THE SPI MASTER
    SCA_DAT_OUT    : in  std_logic;  -- pin 2, SERIAL DATA TO THE FPGA FROM THE SPI MASTER
    POR_OUT_TO_SCA : out std_logic;  -- pin 6, RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE


-- CHANNEL ENABLES
    P_CH_MREG_EN : out std_logic_vector(7 downto 0);  -- pins {62, 65, 71, 76, 80, 83, 92, 86} CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
    P_CH_IAUX_EN : out std_logic_vector(7 downto 0);  -- pins {61, 64, 70, 73, 79, 82, 85, 90} CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
    P_CH_VOSG_EN : out std_logic_vector(7 downto 0);  -- pins {60, 63, 69, 72, 78, 81, 84, 91} CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

-- MONITOR AND STATUS SIGNALS
    PWR_OK_LED : out std_logic;  -- pin 95,     STATUS YELLOW LED INDICATING AT LEAST ONE CHANNEL IS ACTIVE
    --                         SINGLE BLINK - CHANNEL ENABLE / DISABLE EVENT
    STATUS_LED : out std_logic;  -- pin 77,     STEADY=UVL'S OK, SINGLE BLINK=SEU AND/OR WDT

-- DIAGNOSTIC & TEST I/O
    BUF5M_J11_15_TCONN : out std_logic;  -- PIN 35, (SCHEMA ALIAS= CS2_SEL_EN) 5 MHZ CLOCK BUFFER

-- UNUSED FPGA I/O BEING TIED TO SPECIFIED SAFE STATE
    UNUSED_1     : in  std_logic;  -- PIN 59, 3V3 BANK, NOT ROUTED FOR USE, BUT HAS 3V3 PULLUP PRESENT
    UNUSED_2     : in  std_logic;  -- PIN 58, 3V3 BANK, NOT ROUTED FOR USE, BUT HAS GND PULLDN PRESENT
    J11_25_TCONN : in  std_logic;       -- pin 45, (SCHEMA ALIAS= SCLK_BUS)
    J11_27_TCONN : in  std_logic;       -- pin 44, (SCHEMA ALIAS= SDAT_BUS)
    J11_17_TCONN : out std_logic;  -- PIN 32, (SCHEMA ALIAS= CS3_SEL_EN) UNUSED I/O PIN
    J11_19_TCONN : out std_logic;  -- PIN 8,  (SCHEMA ALIAS= CS4_SEL_EN) UNUSED I/O PIN
    J11_21_TCONN : out std_logic;  -- PIN 7,  (SCHEMA ALIAS= CS5_SEL_EN) UNUSED I/O PIN
    J11_23_TCONN : out std_logic  -- PIN 5,  (SCHEMA ALIAS= CS6_SEL_EN) UNUSED I/O PIN
    );

end TOP_LVR_GEN3_CNTL;

architecture RTL of TOP_LVR_GEN3_CNTL is


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--  attribute SYN_RADHARDLEVEL of RTL : architecture is "TMR";
--  attribute SYN_HIER of RTL         : architecture is "FIRM";
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- NOTES:  !!!!!        SPECIFIC I/O FEATURES (EG HYSTERISIS ) NEED TO BE ASSIGNED IN THE CONSTRAINTS FILE  !!!!
--                 !!!!!        THE SYN_ENCODING FOR EACH OF THE STATE MACHINES NEEDS TO HAVE A "SAFE, ORIGINAL" fsm ENCODING SEPECIFIED IN THE SYNTH CONSTRAINT FILE     !!!!!!!
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE COMPONENTS
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- IIR FILTER WITH SEVERAL USES:
--              (1) THE RS-485 SERIAL RECEIVE SIGNAL (ONLY--NOT USED FOR THE GBT-SCA SPI SLAVE PORT)            FILTERED RESULT:  FILTD_RS485RX
--              (2) TEMP_OK                                                                                                                                                                     FILTERED RESULT:  FILTD_TEMP_OK
--              (3) FPGA_FUSE_X_Y_OK (4 FILTERS FOR 4 SIGNALS)                                                                                          FILTERED RESULTS: UVL_OK_CH1A2, UVL_OK_CH3A4, UVL_OK_CH5A6, UVL_OK_CH7A8
  component IIR_FILT is
    port (
      MASTER_RST_B : in std_logic;  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    : in std_logic;

      SIG_IN       : in  std_logic_vector(0 downto 0);  -- INPUT SIGNAL TO BE FILTERED
      THRESH_UPPER : in  std_logic_vector(7 downto 0);  -- UPPER HYSTERISIS THRESHOLD (IE RISING SIGNAL THRESHOLD)
      THRESH_LOWER : in  std_logic_vector(7 downto 0);  -- LOWER HYSTERISIS THRESHOLD (IE FALLING SIGNAL THRESHOLD)
      FILT_SIGOUT  : out std_logic_vector(7 downto 0);  -- RESULTING SIGNAL FILTER VALUE 
      P_SIGOUT     : out std_logic  -- FINAL SIGNAL BIT VALUE AFTER THE FILTER FUNCTION AND HYSTERISIS HAVE BEEN APPLIED

      );
  end component;

  -- SPI interface with TCM
  component spi_slave is
    port (
      CLK5M_OSC    : in std_logic;      -- INTERNAL GENERATED 5 MHZ CLOCK 
      MASTER_RST_B : in std_logic;      -- INTERNAL ACTIVE LOW RESET

      SCA_CLK_OUT : in  std_logic;  -- CLOCK INPUT TO THE FPGA FROM THE SCA MASTER USED FOR BOTH TX AND RX
      SCA_DAT_OUT : in  std_logic;  -- SERIAL DATA INPUT TO THE FPGA FROM THE SCA MASTER
      SCA_DAT_IN  : out std_logic;  -- SERIAL DATA OUTPUT FROM THE FPGA TO THE SCA MASTER

      SPI_TX_WORD : in  std_logic_vector(31 downto 0);  -- 32 BIT SERIAL WORD TO BE TRANSMITTED
      SPI_RX_WORD : out std_logic_vector(31 downto 0);  -- RECEIVED SERIAL FRAME
      SPI_RX_STRB : out std_logic;  -- SINGLE 5MHZ CLOCK PULSE SIGNIFIES A NEW SERIAL FRAME IS AVAILABLE.

      P_TX_32BIT_REG : out std_logic_vector(31 downto 0);
      P_STATE_ID     : out std_logic_vector(3 downto 0)

      );
  end component;

-- RS-485 SERIAL RECEIVE MODULE
  component SERIAL_RX is
    port (
      MASTER_RST_B : in std_logic;  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    : in std_logic;
      RX_INPUT     : in std_logic;  -- FINAL RX SIGNAL BIT STREAM AFTER THE FILTER FUNCTION AND HYSTERISIS HAVE BEEN APPLIED
      MODULE_ADDR  : in std_logic_vector(4 downto 0);  -- HARDWIRED ADDRESS OF THIS MODULE

      RX_WORD       : out std_logic_vector(14 downto 0);  -- FINAL RECEIVED RX WORD
      RX_ODD_PARITY : out std_logic;    -- ODD PARITY FOR THE RX_WORD
      RX_PARITY_ERR : out std_logic;  -- LATCHED VESRION OF THE LAST RX PARITY ERROR
      RX_STRB       : out std_logic  -- SINGLE CLOCK PULSE STRB INDICATES THE RX_WORD WAS UPDATED
      );
  end component;

-- RS-485 SERIAL TRANSMIT MODULE
  component SERIAL_TX is
    port (
      MASTER_RST_B : in std_logic;  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    : in std_logic;
      TX_WORD      : in std_logic_vector(14 downto 0);  -- PARALLEL WORD TO BE TRANSMITTED (NOTE--BIT 15 IS ODD PARITY CALCULATED AS SERIAL TX IS SENT)
      TX_STRB      : in std_logic;  -- SINGLE CLOCK PULSE STRB INDICATES NEW TX_WORD READY FOR TX

      P_TX_EN    : out std_logic;       -- SERIAL TX DRIVER ENABLE
      SER_TX_BIT : out std_logic        -- TX BIT STREAM
      );
  end component;

-- MAIN COMMUNICATION AND SEQUENCER MOPDULE
  component MAIN_SEQUENCER_NEW is
    port (
      MASTER_RST_B : in std_logic;  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    : in std_logic;      -- MASTER 5 MHZ CLOCK

      REG_CH_CMD_EN : in std_logic_vector(1 downto 0);  -- REGISTER CHANNEL COMMAND ENABLES (7...0)
      CMND_WORD_STB : in std_logic;  -- SINGLE CLOCK PULSE STROBE INDICATES AN UPDATED COMMAND WORD

      STDBY_OFFB_B : in std_logic;  -- ENABLES THE V_OS OUTPUT FOR EVERY CHANNEL COMMANDED TO BE ENABLED.

      DTYCYC_EN : in std_logic;  -- '1' ENABLES A LOW DUTY CYCLE MODE TO LIMIT THERMAL LOADS FOR SPECIAL TESTS
      V_IN_OK   : in std_logic;  -- UNDER-VOLTAGE LOCKOUT:  V_IN ABOVE THRESHOLD WHEN ='1'
      TEMP_OK   : in std_logic;  -- '1' MEANS THE TEMPERATURE IS BELOW THE MAX VALUE

      SIM_MODE_EN : in std_logic;  -- '1' IS SPECIAL SIM MODE WITH REDUCED INTERVAL TIMEOUTS

-- THE MASTER-SLAVE CONFIG DETERMINES THE ENABLE FOR THE V_OS OP AMPL!  
      CHA_B_MS_CFG_EN : in std_logic;  -- ADJACENT CHANNELS A AND B IN THE SAME FUSE GROUP

      P_CH_MREG_EN : out std_logic_vector(1 downto 0);  -- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
      P_CH_IAUX_EN : out std_logic_vector(1 downto 0);  -- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
      P_CH_VOSG_EN : out std_logic_vector(1 downto 0);  -- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

      P_SEQ_STEPVAL : out std_logic_vector(3 downto 0)  -- INDICATES PRESENT SEQUENCE STEP
      );
  end component;

--===========SPECIAL TEST COMPONENTS:==============
  component SLOW_PULSE_EN_GEN is
    port (
      CLK_5M_GL    : in std_logic;  -- FPGA MASTER CLOCK--ASSUMED TO BE 5 MHZ
      MASTER_RST_B : in std_logic;      -- ACTIVE LOW RESET
      CNT_EN       : in std_logic;      -- ACTIVE HIGH COUNT ENABLE
      SIM_25KX     : in std_logic;  -- SPECIAL SIM MODE--SPEEDS UP BY 25,000 TIMES (0.25SEC=10USEC)

      MS250_CLK_EN : out std_logic  -- OUTPUT PULSE SIGNIFIES 1 SEC INTERVAL--SUITABLE FOR USE AS A CLOCK ENABLE.
      );
  end component;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE INTERNAL SIGNALS
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  signal MASTER_RST_B   : std_logic;    -- POR_FPGA SYNC'D TO THE 40 MHZ CLOCK
  signal DEL0_DEV_RST_B : std_logic;  -- SYNC FF FOR FOR GENERATING THE MASTER_RST_B

  signal CLK_5M_GL, N_CLK_5M_GL : std_logic;  -- GENERATED 5 MHZ CLOCK--MASTER CLOCK!!!!
  signal REFCNT, N_REFCNT       : integer range 0 to 3;  -- COUNTER USED TO GENERATE THE CLK_5M_GL

  signal SIGOUT_VOP_UVL : std_logic;  -- FINAL SIGNAL OUT AFTER FILTER AND HYSTERISIS APPLIED

  signal SLOW_PLS_STB                     : std_logic;  -- THIS IS A PULSE THAT IS ONE 5MHZ CLOCK PERIOD WIDE AT 0.25SEC RATE
  constant SIM_MODE_EN                    : std_logic := '0';  -- SPECIAL SIM MODE REDUCES TERMINAL COUNT FOR SLOW_PLS_STB INTERVAL TIMEOUT
  signal DC50_TEST_STRB, N_DC50_TEST_STRB : std_logic;  -- THIS IS A 50% DUTY CYCLE 2 HZ SIGNAL VERSION OF SLOW_PLS_STB

  constant UPPER_HYS_THRESH : std_logic_vector(7 downto 0) := "01001100";  -- UPPER HYSTERISIS THRESHOLD = 76 COUNTS OF 255 (ACTUALLY 240 WITH TRUNCATION EFFECTS)
  constant LOWER_HYS_THRESH : std_logic_vector(7 downto 0) := "00101100";  -- UPPER HYSTERISIS THRESHOLD =  44 COUNTS OF 255 (ACTUALLY 240 WITH TRUNCATION EFFECTS)

  signal CH_MREG_EN : std_logic_vector(7 downto 0);  -- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
  signal CH_IAUX_EN : std_logic_vector(7 downto 0);  -- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
  signal CH_VOSG_EN : std_logic_vector(7 downto 0);  -- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

-- THESE SIGNALS ARE USED TO DEBOUNCE THE DIP SWITCHES USED FOR MANUAL TESTS (MAN_EN_CH_4TO1, MAN_EN_CH_8TO5, and STDBY_OFFB_B)
  signal N_MAN_EN_CH_4TO1_A, MAN_EN_CH_4TO1_A : std_logic;
  signal N_MAN_EN_CH_4TO1_B, MAN_EN_CH_4TO1_B : std_logic;
  signal N_MAN_EN_CH_8TO5_A, MAN_EN_CH_8TO5_A : std_logic;
  signal N_MAN_EN_CH_8TO5_B, MAN_EN_CH_8TO5_B : std_logic;

  signal N_STDBY_OFFB_A, STDBY_OFFB_A : std_logic;
  signal N_STDBY_OFFB_B, STDBY_OFFB_B : std_logic;

  signal N_DTYCYC_CNT, DTYCYC_CNT : integer range 0 to (2**5)-1;  -- DUTY CYCLE COUNTER
  constant DTYCYC_TIME            : integer range 0 to (2**5)-1 := 19;  -- DUTY CYCLE COUNTER TIMEOUT INTERVAL (20 * 0.250 SEC)~5%
  signal N_DTYCYC_EN, DTYCYC_EN   : std_logic;  -- LOCAL ENABLE USED FOR THE SPECIAL TEST LOW DUTY CYCLE OP MODE

-- THESE ARE THE DEBOUNCED VERSIONS OF THE DIP SWITCHES
  signal N_VAL_MAN_EN_CH_4TO1, VAL_MAN_EN_CH_4TO1 : std_logic;
  signal N_VAL_MAN_EN_CH_8TO5, VAL_MAN_EN_CH_8TO5 : std_logic;

  signal N_VAL_STDBY_OFFB, VAL_STDBY_OFFB : std_logic;


  signal N_REGISTER_CH_CMD_CH, REGISTER_CH_CMD_CH : std_logic_vector(7 downto 0);  -- REGISTER COMMAND FOR CHANNEL ENABLES

  signal SEQ_12STEPVAL : std_logic_vector(3 downto 0);  -- USED FOR DEBUG OF THE MAINSEQUENCER STATE MACHINE
  signal SEQ_34STEPVAL : std_logic_vector(3 downto 0);  -- USED FOR DEBUG OF THE MAINSEQUENCER STATE MACHINE
  signal SEQ_56STEPVAL : std_logic_vector(3 downto 0);  -- USED FOR DEBUG OF THE MAINSEQUENCER STATE MACHINE
  signal SEQ_78STEPVAL : std_logic_vector(3 downto 0);  -- USED FOR DEBUG OF THE MAINSEQUENCER STATE MACHINE

  signal FILTD_TEMP_OK                                          : std_logic;  -- FILTERED VERSION OF THE TEMP_OK STATUS
  signal UVL_OK_CH1A2, UVL_OK_CH3A4, UVL_OK_CH5A6, UVL_OK_CH7A8 : std_logic;  -- UVL FOR THE 4 CHANNEL PAIRS 


  -- SPI variables
  signal SPI_TX_WORD        : std_logic_vector(31 downto 0) := x"dbdb1234";  -- 32 BIT SERIAL WORD TO BE TRANSMITTED
  signal SPI_RX_WORD        : std_logic_vector(31 downto 0);  -- RECEIVED SERIAL FRAME
  signal SPI_RX_STRB        : std_logic;  -- SINGLE 5MHZ CLOCK PULSE SIGNIFIES A NEW SERIAL FRAME IS AVAILABLE.
  signal SPI_P_TX_32BIT_REG : std_logic_vector(31 downto 0);
  signal SPI_P_STATE_ID     : std_logic_vector(3 downto 0);

-- DEBUG
  signal IIR_OVT_FILT   : std_logic_vector(7 downto 0);
  signal IIR_UVL12_FILT : std_logic_vector(7 downto 0);
  signal IIR_UVL34_FILT : std_logic_vector(7 downto 0);
  signal IIR_UVL56_FILT : std_logic_vector(7 downto 0);
  signal IIR_UVL78_FILT : std_logic_vector(7 downto 0);

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
begin
-- THIS PROCESS SYNCHRONIZES THE EXTERNAL POR_FPGA SIGNAL TO THE 40 MHZ CLOCK
-- HOWEVER, THE GENERATED 5 MHZ CLOCK IS SYNCHRONOUSLY STARTED BY RELEASE OF THE MASTER_RST_B
  SYNC_DEV_RST_B : process(POR_FPGA, CLK40MHZ_OSC)
  begin
    if POR_FPGA = '0' then
      DEL0_DEV_RST_B <= '0';
      MASTER_RST_B   <= '0';

    elsif (CLK40MHZ_OSC'event and CLK40MHZ_OSC = '1') then
      DEL0_DEV_RST_B <= POR_FPGA;
      MASTER_RST_B   <= DEL0_DEV_RST_B;

    end if;

  end process SYNC_DEV_RST_B;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- REGISTERS USED TO GENERATE A 5 MHZ CLOCK (DIV-BY-4 FOLLOWED BY DIV-BY-2)
  GENCLKREG : process(MASTER_RST_B, CLK40MHZ_OSC)
  begin
    if MASTER_RST_B = '0' then
      CLK_5M_GL <= '0';
      REFCNT    <= 0;

    elsif (CLK40MHZ_OSC'event and CLK40MHZ_OSC = '1') then
      CLK_5M_GL <= N_CLK_5M_GL;
      REFCNT    <= N_REFCNT;

    end if;

  end process GENCLKREG;

-- PROCESS TO GENERATE THE 5 MHZ CLOCK
  GEN_5M_CLK : process(REFCNT, CLK_5M_GL)
  begin
    if REFCNT > 2 then
      N_REFCNT    <= 0;
      N_CLK_5M_GL <= not(CLK_5M_GL);

    else
      N_REFCNT    <= REFCNT + 1;
      N_CLK_5M_GL <= CLK_5M_GL;
    end if;
  end process;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE ALL REGISTERS THAT USE THE 5 MHZ CLOCK
  REG5M : process(CLK_5M_GL, MASTER_RST_B)
  begin
    if MASTER_RST_B = '0' then          -- FF OUTPUTS

      DC50_TEST_STRB <= '0';

      MAN_EN_CH_4TO1_A <= '0';
      MAN_EN_CH_4TO1_B <= '0';

      MAN_EN_CH_8TO5_A <= '0';
      MAN_EN_CH_8TO5_B <= '0';

      VAL_MAN_EN_CH_4TO1 <= '0';
      VAL_MAN_EN_CH_8TO5 <= '0';

      STDBY_OFFB_A <= '0';
      STDBY_OFFB_B <= '0';

      VAL_STDBY_OFFB <= '0';

      REGISTER_CH_CMD_CH <= "00000000";  -- REGISTER COMMAND FOR CHANNEL ENABLES

      DTYCYC_CNT <= DTYCYC_TIME;  -- DUTY CYCLE INTERVAL COUNTER FOR SPECIAL TEST
      DTYCYC_EN  <= '0';  -- LOCAL SIGNAL USED THE LOW DUTY CYCLE SPECIAL TEST MODE

    elsif (CLK_5M_GL'event and CLK_5M_GL = '1') then  -- CORRESPONDING FF INPUTS

      DC50_TEST_STRB <= N_DC50_TEST_STRB;

      MAN_EN_CH_4TO1_A <= N_MAN_EN_CH_4TO1_A;
      MAN_EN_CH_4TO1_B <= N_MAN_EN_CH_4TO1_B;

      MAN_EN_CH_8TO5_A <= N_MAN_EN_CH_8TO5_A;
      MAN_EN_CH_8TO5_B <= N_MAN_EN_CH_8TO5_B;

      VAL_MAN_EN_CH_4TO1 <= N_VAL_MAN_EN_CH_4TO1;
      VAL_MAN_EN_CH_8TO5 <= N_VAL_MAN_EN_CH_8TO5;

      STDBY_OFFB_A <= N_STDBY_OFFB_A;
      STDBY_OFFB_B <= N_STDBY_OFFB_B;

      VAL_STDBY_OFFB <= N_VAL_STDBY_OFFB;

      REGISTER_CH_CMD_CH <= N_REGISTER_CH_CMD_CH;

      DTYCYC_CNT <= N_DTYCYC_CNT;
      DTYCYC_EN  <= N_DTYCYC_EN;

    end if;

  end process;

-- --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- -- placeholder
-- -- PROCESS THAT WAITS FOR >35 '0' BITS FOLLOWED BY 2 START BITS IN THE FILTERED RS485 RX LINE AND THEN GENERATES 36 CLOCK CYCLES 



-- --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- -- placeholder
-- -- PROCESS THAT PERFORMS THE MUX SELECTION OF EITHER THE RS485 OR THE SPI POR CLOCK AND SERIAL DATA SOURCES 



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- For Local stand-alone test
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEBOUNCE THE DIP SWITCHES
-- PRIMARY OUTPUTS FOR THIS PROCESS ARE 3 DEBOUNCED DIP SWITCH SIGNALS USED FOR MANUAL CHANNEL ENABLE:
--      1) VAL_MAN_EN_CH_4TO1
--      2) VAL_MAN_EN_CH_8TO5
--      3) VAL_STDBY_OFFB
  DEBOUNCE : process(MAN_EN_CH_4TO1, MAN_EN_CH_4TO1_A, MAN_EN_CH_4TO1_B,
                     MAN_EN_CH_8TO5, MAN_EN_CH_8TO5_A, MAN_EN_CH_8TO5_B,
                     STDBY_OFFB, STDBY_OFFB_A, STDBY_OFFB_B,
                     SLOW_PLS_STB, DC50_TEST_STRB
                     )
  begin

    -- THIS IS THE DEBOUNCE SAMPLING.
    if SLOW_PLS_STB = '1' then  -- TEST STROBE IS A SINGLE 5MHZ CLOCK PERIOD THAT OCCURS EVERY 250MSEC
      N_DC50_TEST_STRB <= not(DC50_TEST_STRB);  -- CREATE A 50% DUTY CYCLE VERSION 

      N_MAN_EN_CH_4TO1_A <= MAN_EN_CH_4TO1;  -- SAMPLE THE DIP SWITCHES AT 250 MSEC INTERVALS VIA A 2 DEEP PIPELINE FOR DEBOUNCE
      N_MAN_EN_CH_4TO1_B <= MAN_EN_CH_4TO1_A;

      N_MAN_EN_CH_8TO5_A <= MAN_EN_CH_8TO5;
      N_MAN_EN_CH_8TO5_B <= MAN_EN_CH_8TO5_A;

      N_STDBY_OFFB_A <= STDBY_OFFB;
      N_STDBY_OFFB_B <= STDBY_OFFB_A;
    else
      N_DC50_TEST_STRB <= DC50_TEST_STRB;

      N_MAN_EN_CH_4TO1_A <= MAN_EN_CH_4TO1_A;  -- REMEMBER THE LAST SAMPLE IF NOT A SAMPLE UPDATE
      N_MAN_EN_CH_4TO1_B <= MAN_EN_CH_4TO1_B;

      N_MAN_EN_CH_8TO5_A <= MAN_EN_CH_8TO5_A;
      N_MAN_EN_CH_8TO5_B <= MAN_EN_CH_8TO5_B;

      N_STDBY_OFFB_A <= STDBY_OFFB_A;
      N_STDBY_OFFB_B <= STDBY_OFFB_B;
    end if;

    -- 
    if (MAN_EN_CH_4TO1 and MAN_EN_CH_4TO1_A and MAN_EN_CH_4TO1_B) = '1' then  -- THIS IS THE MANUAL DIP SWITCH ENABLE FOR CHANNELS 1 TO 4
      N_VAL_MAN_EN_CH_4TO1 <= '1';
    else
      N_VAL_MAN_EN_CH_4TO1 <= '0';
    end if;

    if (MAN_EN_CH_8TO5 and MAN_EN_CH_8TO5_A and MAN_EN_CH_8TO5_B) = '1' then  -- THIS IS THE MANUAL DIP SWITCH ENABLE FOR CHANNELS 5 TO 8
      N_VAL_MAN_EN_CH_8TO5 <= '1';
    else
      N_VAL_MAN_EN_CH_8TO5 <= '0';
    end if;

    if (STDBY_OFFB and STDBY_OFFB_A and STDBY_OFFB_B) = '1' then  -- THIS IS THE MANUAL DIP SWITCH FOR THE STANDBY / OFF SIGNAL
      N_VAL_STDBY_OFFB <= '1';
    else
      N_VAL_STDBY_OFFB <= '0';
    end if;

  end process DEBOUNCE;


-- MUX IN THE MANUAL VERSUS 
-- SERIAL CONTROL VERSUS
-- LOW DUTY CYCLE SPECIAL TEST OPERATION SIGNALS
  CTRLMUX : process(VAL_MAN_EN_CH_8TO5, VAL_MAN_EN_CH_4TO1)
  begin

    if VAL_MAN_EN_CH_8TO5 = '1' then
      N_REGISTER_CH_CMD_CH(7 downto 4) <= "1111";
    else
      N_REGISTER_CH_CMD_CH(7 downto 4) <= "0000";
    end if;

    if VAL_MAN_EN_CH_4TO1 = '1' then
      N_REGISTER_CH_CMD_CH(3 downto 0) <= "1111";
    else
      N_REGISTER_CH_CMD_CH(3 downto 0) <= "0000";
    end if;

    SIGOUT_VOP_UVL <= '0';              -- TEMP--NOT USING THIS YET!

  end process CTRLMUX;

-- LOW DUTY CYCLE COUNTER FOR SPECIAL TESTS: GENERATES DTYCYC_EN
  LDCCNT : process(MODE_DCYC_NORMB, DTYCYC_CNT, SLOW_PLS_STB, DTYCYC_EN)
  begin

    case MODE_DCYC_NORMB is

      when '0' =>  -- NORMAL OP MODE, SO LOW CYCLE FUNCTION IS INACTIVED                                                                        
        N_DTYCYC_CNT <= DTYCYC_TIME;
        N_DTYCYC_EN  <= '1';  -- THIS BIT ONLY ACTIVE FOR SPECIAL TEST MODE WITH THE LOW DUTY CYCLE
      -- BIT STUCK AT '1' LEAVES DOWNSTREAM SIGNALS IN CONTINUOS OP MODE
      when '1' =>  -- SPECIAL TEST LOW DUTY CYCLE MODE IS ACTIVE

        if SLOW_PLS_STB = '1' then  -- ONLY UPDATE WHEN THIS STROBE IS PULSED (1 CLOCK CYCLE STROBE)
          if DTYCYC_CNT = 0 then        -- LOW DUTY CYCLE MODE IS SELECTED
            N_DTYCYC_CNT <= DTYCYC_TIME;  -- RELOAD COUNTER ON 0 COUNT
            N_DTYCYC_EN  <= '1';  -- THIS BIT ONLY ACTIVE FOR SPECIAL TEST MODE WITH THE LOW DUTY CYCLE FOR 250 MSEC
          else
            N_DTYCYC_CNT <= DTYCYC_CNT - 1;
            N_DTYCYC_EN  <= '0';  -- THIS BIT ONLY ACTIVE FOR SPECIAL TEST MODE WITH THE LOW DUTY CYCLE FOR 250 MSEC
          end if;

        else                            -- KEEP SIGNAL STATES UNCHANGED

          N_DTYCYC_CNT <= DTYCYC_CNT;
          N_DTYCYC_EN  <= DTYCYC_EN;

        end if;

      when others =>  NULL;
    end case;

  end process LDCCNT;

  spi_slave_pm : spi_slave
    port map (
      CLK5M_OSC    => CLK_5M_GL,        -- INTERNAL GENERATED 5 MHZ CLOCK 
      MASTER_RST_B => SCA_RESET_OUT,    -- INTERNAL ACTIVE LOW RESET

      SCA_CLK_OUT => SCA_CLK_OUT,  -- CLOCK INPUT TO THE FPGA FROM THE SCA MASTER USED FOR BOTH TX AND RX
      SCA_DAT_OUT => SCA_DAT_OUT,  -- SERIAL DATA INPUT TO THE FPGA FROM THE SCA MASTER
      SCA_DAT_IN  => SCA_DAT_IN,  -- SERIAL DATA OUTPUT FROM THE FPGA TO THE SCA MASTER

      SPI_TX_WORD => SPI_TX_WORD,       -- 32 BIT SERIAL WORD TO BE TRANSMITTED
      SPI_RX_WORD => SPI_RX_WORD,       -- RECEIVED SERIAL FRAME
      SPI_RX_STRB => SPI_RX_STRB,  -- SINGLE 5MHZ CLOCK PULSE SIGNIFIES A NEW SERIAL FRAME IS AVAILABLE.

      P_TX_32BIT_REG => SPI_P_TX_32BIT_REG,
      P_STATE_ID     => SPI_P_STATE_ID
      );


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- INSTANTIATE THE SEQUENCER MODULES

--------------------------------
-- CHANNELS 1 & 2
--------------------------------
  CONTROL12 : MAIN_SEQUENCER_NEW
    port map (
      MASTER_RST_B => MASTER_RST_B,  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    => CLK_5M_GL,        -- MASTER 5 MHZ CLOCK

      REG_CH_CMD_EN => REGISTER_CH_CMD_CH(1 downto 0),  -- REGISTER CHANNEL COMMAND ENABLES (7...0)
      CMND_WORD_STB => SLOW_PLS_STB,  -- SINGLE CLOCK PULSE STROBE INDICATES CHECK FOR AN UPDATED EN COMMAND WORD

      STDBY_OFFB_B => STDBY_OFFB_B,  -- ENABLES THE V_OS OUTPUT FOR EVERY CHANNEL COMMANDED TO BE ENABLED.

      DTYCYC_EN => DTYCYC_EN,  -- '1' ENABLES A LOW DUTY CYCLE MODE TO LIMIT THERMAL LOADS FOR SPECIAL TESTS
      V_IN_OK   => UVL_OK_CH1A2,  -- UNDER-VOLTAGE LOCKOUT:  V_IN ABOVE THRESHOLD WHEN ='1'
      TEMP_OK   => FILTD_TEMP_OK,  -- '1'= TEMPERATURE IS BELOW MAX ALLOWED

      SIM_MODE_EN => SIM_MODE_EN,  -- '1' IS SPECIAL SIM MODE WITH REDUCED TIMEOUTS.....

-- THE MASTER-SLAVE CONFIG DETERMINES THE ENABLE FOR THE V_OS OP AMPL!
      CHA_B_MS_CFG_EN => CH1_2_MS_CFG_EN,  -- pin 21, BIT 0:    CH1_2_MS_CFG_EN = CHANNELS 1 & 2

      P_CH_MREG_EN => CH_MREG_EN(1 downto 0),  -- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
      P_CH_IAUX_EN => CH_IAUX_EN(1 downto 0),  -- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
      P_CH_VOSG_EN => CH_VOSG_EN(1 downto 0),  -- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

      P_SEQ_STEPVAL => SEQ_12STEPVAL  -- DEBUG:  INDICATES PRESENT SEQUENCE STEP
      );

--------------------------------
-- CHANNELS 3 & 4
--------------------------------
  CONTROL34 : MAIN_SEQUENCER_NEW
    port map (
      MASTER_RST_B => MASTER_RST_B,  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    => CLK_5M_GL,        -- MASTER 5 MHZ CLOCK

      REG_CH_CMD_EN => REGISTER_CH_CMD_CH(3 downto 2),  -- REGISTER CHANNEL COMMAND ENABLES (7...0)
      CMND_WORD_STB => SLOW_PLS_STB,  -- SINGLE CLOCK PULSE STROBE INDICATES CHECK FOR AN UPDATED EN COMMAND WORD

      STDBY_OFFB_B => STDBY_OFFB_B,  -- ENABLES THE V_OS OUTPUT FOR EVERY CHANNEL COMMANDED TO BE ENABLED.

      DTYCYC_EN => DTYCYC_EN,  -- '1' ENABLES A LOW DUTY CYCLE MODE TO LIMIT THERMAL LOADS FOR SPECIAL TESTS
      V_IN_OK   => UVL_OK_CH3A4,  -- UNDER-VOLTAGE LOCKOUT:  V_IN ABOVE THRESHOLD WHEN ='1'
      TEMP_OK   => FILTD_TEMP_OK,  -- '1'= TEMPERATURE IS BELOW MAX ALLOWED

      SIM_MODE_EN => SIM_MODE_EN,  -- '1' IS SPECIAL SIM MODE WITH REDUCED TIMEOUTS.....

-- THE MASTER-SLAVE CONFIG DETERMINES THE ENABLE FOR THE V_OS OP AMPL!
      CHA_B_MS_CFG_EN => CH3_4_MS_CFG_EN,  -- pin 20, BIT 1:    CH3_4_MS_CFG_EN = CHANNELS 3 & 4

      P_CH_MREG_EN => CH_MREG_EN(3 downto 2),  -- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
      P_CH_IAUX_EN => CH_IAUX_EN(3 downto 2),  -- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
      P_CH_VOSG_EN => CH_VOSG_EN(3 downto 2),  -- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

      P_SEQ_STEPVAL => SEQ_34STEPVAL  -- DEBUG:  INDICATES PRESENT SEQUENCE STEP
      );
--------------------------------
-- CHANNELS 5 & 6
--------------------------------
  CONTROL56 : MAIN_SEQUENCER_NEW
    port map (
      MASTER_RST_B => MASTER_RST_B,  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    => CLK_5M_GL,        -- MASTER 5 MHZ CLOCK

      REG_CH_CMD_EN => REGISTER_CH_CMD_CH(5 downto 4),  -- REGISTER CHANNEL COMMAND ENABLES (7...0)
      CMND_WORD_STB => SLOW_PLS_STB,  -- SINGLE CLOCK PULSE STROBE INDICATES CHECK FOR AN UPDATED EN COMMAND WORD

      STDBY_OFFB_B => STDBY_OFFB_B,  -- ENABLES THE V_OS OUTPUT FOR EVERY CHANNEL COMMANDED TO BE ENABLED.

      DTYCYC_EN => DTYCYC_EN,  -- '1' ENABLES A LOW DUTY CYCLE MODE TO LIMIT THERMAL LOADS FOR SPECIAL TESTS
      V_IN_OK   => UVL_OK_CH5A6,  -- UNDER-VOLTAGE LOCKOUT:  V_IN ABOVE THRESHOLD WHEN ='1'
      TEMP_OK   => FILTD_TEMP_OK,  -- '1'= TEMPERATURE IS BELOW MAX ALLOWED

      SIM_MODE_EN => SIM_MODE_EN,  -- '1' IS SPECIAL SIM MODE WITH REDUCED TIMEOUTS.....

-- THE MASTER-SLAVE CONFIG DETERMINES THE ENABLE FOR THE V_OS OP AMPL!
      CHA_B_MS_CFG_EN => CH5_6_MS_CFG_EN,  -- pin 19, BIT 2:    CH5_6_MS_CFG_EN = CHANNELS 5 & 6


      P_CH_MREG_EN => CH_MREG_EN(5 downto 4),  -- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
      P_CH_IAUX_EN => CH_IAUX_EN(5 downto 4),  -- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
      P_CH_VOSG_EN => CH_VOSG_EN(5 downto 4),  -- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

      P_SEQ_STEPVAL => SEQ_56STEPVAL  -- DEBUG:  INDICATES PRESENT SEQUENCE STEP
      );
--------------------------------
-- CHANNELS 7 & 8
--------------------------------
  CONTROL78 : MAIN_SEQUENCER_NEW
    port map (
      MASTER_RST_B => MASTER_RST_B,  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    => CLK_5M_GL,        -- MASTER 5 MHZ CLOCK

      REG_CH_CMD_EN => REGISTER_CH_CMD_CH(7 downto 6),  -- REGISTER CHANNEL COMMAND ENABLES (7...0)
      CMND_WORD_STB => SLOW_PLS_STB,  -- SINGLE CLOCK PULSE STROBE INDICATES CHECK FOR AN UPDATED EN COMMAND WORD

      STDBY_OFFB_B => STDBY_OFFB_B,  -- ENABLES THE V_OS OUTPUT FOR EVERY CHANNEL COMMANDED TO BE ENABLED.

      DTYCYC_EN => DTYCYC_EN,  -- '1' ENABLES A LOW DUTY CYCLE MODE TO LIMIT THERMAL LOADS FOR SPECIAL TESTS
      V_IN_OK   => UVL_OK_CH7A8,  -- UNDER-VOLTAGE LOCKOUT:  V_IN ABOVE THRESHOLD WHEN ='1'
      TEMP_OK   => FILTD_TEMP_OK,  -- '1'= TEMPERATURE IS BELOW MAX ALLOWED

      SIM_MODE_EN => SIM_MODE_EN,  -- '1' IS SPECIAL SIM MODE WITH REDUCED TIMEOUTS.....

-- THE MASTER-SLAVE CONFIG DETERMINES THE ENABLE FOR THE V_OS OP AMPL!
      CHA_B_MS_CFG_EN => CH7_8_MS_CFG_EN,  -- pin 16, BIT 3:    CH7_8_MS_CFG_EN = CHANNELS 7 & 8

      P_CH_MREG_EN => CH_MREG_EN(7 downto 6),  -- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
      P_CH_IAUX_EN => CH_IAUX_EN(7 downto 6),  -- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
      P_CH_VOSG_EN => CH_VOSG_EN(7 downto 6),  -- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

      P_SEQ_STEPVAL => SEQ_78STEPVAL  -- DEBUG:  INDICATES PRESENT SEQUENCE STEP
      );

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- INSTANTIATE A 4 HZ PULSE GENERATOR USED FOR SPECIAL TEST TO STRB THE TX FUNCTION             
  TX_PROMPT : SLOW_PULSE_EN_GEN
    port map (
      CLK_5M_GL    => CLK_5M_GL,    -- FPGA MASTER CLOCK--ASSUMED TO BE 5 MHZ
      MASTER_RST_B => MASTER_RST_B,     -- ACTIVE LOW RESET
      CNT_EN       => '1',              -- ACTIVE HIGH COUNT ENABLE
      SIM_25KX     => SIM_MODE_EN,  -- SPECIAL SIM MODE--SPEEDS UP  (1SEC=1000USEC)

      MS250_CLK_EN => SLOW_PLS_STB  -- OUTPUT PULSE SIGNIFIES 0.250 SEC INTERVAL--SUITABLE FOR USE AS A CLOCK ENABLE.
      );

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- INSTANTIATE THE FAILSAFE FILTER COMPONENTS

  OVT_FS : IIR_FILT
    port map (
      MASTER_RST_B => MASTER_RST_B,  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    => CLK_5M_GL,     -- FPGA MASTER CLOCK--ASSUMED TO BE 5 MHZ

      SIG_IN       => TEMP_OK,  -- '1'= TEMPERATURE IS BELOW MAX THRESHOLD (INPUT SIGNAL TO BE FILTERED)
      THRESH_UPPER => "01110111",  -- (125dec is maxfiltval) UPPER HYSTERISIS THRESHOLD (IE RISING SIGNAL THRESHOLD)
      THRESH_LOWER => "00001000",  -- LOWER HYSTERISIS THRESHOLD (IE FALLING SIGNAL THRESHOLD)
      FILT_SIGOUT  => IIR_OVT_FILT,     -- RESULTING SIGNAL FILTER VALUE 
      P_SIGOUT     => FILTD_TEMP_OK  -- FINAL SIGNAL BIT VALUE AFTER THE FILTER FUNCTION AND HYSTERISIS HAVE BEEN APPLIED
      );


  UVL_12FUSE : IIR_FILT
    port map (
      MASTER_RST_B => MASTER_RST_B,  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    => CLK_5M_GL,     -- FPGA MASTER CLOCK--ASSUMED TO BE 5 MHZ

      SIG_IN       => FPGA_FUSE_1_2_OK,  -- '1'= INPUT VOLTAGE IS ABOVE THE MIN THRESHOLD (INPUT SIGNAL TO BE FILTERED)
      THRESH_UPPER => "01110111",  -- (125dec is maxfiltval)UPPER HYSTERISIS THRESHOLD (IE RISING SIGNAL THRESHOLD)
      THRESH_LOWER => "00001000",  -- LOWER HYSTERISIS THRESHOLD (IE FALLING SIGNAL THRESHOLD)
      FILT_SIGOUT  => IIR_UVL12_FILT,   -- RESULTING SIGNAL FILTER VALUE 
      P_SIGOUT     => UVL_OK_CH1A2  -- FINAL SIGNAL BIT VALUE AFTER THE FILTER FUNCTION AND HYSTERISIS HAVE BEEN APPLIED
      );


  UVL_34FUSE : IIR_FILT
    port map (
      MASTER_RST_B => MASTER_RST_B,  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    => CLK_5M_GL,     -- FPGA MASTER CLOCK--ASSUMED TO BE 5 MHZ

      SIG_IN       => FPGA_FUSE_3_4_OK,  -- '1'= INPUT VOLTAGE IS ABOVE THE MIN THRESHOLD (INPUT SIGNAL TO BE FILTERED)
      THRESH_UPPER => "01110111",  -- (125dec is maxfiltval)UPPER HYSTERISIS THRESHOLD (IE RISING SIGNAL THRESHOLD)
      THRESH_LOWER => "00001000",  -- LOWER HYSTERISIS THRESHOLD (IE FALLING SIGNAL THRESHOLD)
      FILT_SIGOUT  => IIR_UVL34_FILT,   -- RESULTING SIGNAL FILTER VALUE 
      P_SIGOUT     => UVL_OK_CH3A4  -- FINAL SIGNAL BIT VALUE AFTER THE FILTER FUNCTION AND HYSTERISIS HAVE BEEN APPLIED
      );


  UVL_56FUSE : IIR_FILT
    port map (
      MASTER_RST_B => MASTER_RST_B,  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    => CLK_5M_GL,     -- FPGA MASTER CLOCK--ASSUMED TO BE 5 MHZ

      SIG_IN       => FPGA_FUSE_5_6_OK,  -- '1'= INPUT VOLTAGE IS ABOVE THE MIN THRESHOLD (INPUT SIGNAL TO BE FILTERED)
      THRESH_UPPER => "01110111",  -- (125dec is maxfiltval)UPPER HYSTERISIS THRESHOLD (IE RISING SIGNAL THRESHOLD)
      THRESH_LOWER => "00001000",  -- LOWER HYSTERISIS THRESHOLD (IE FALLING SIGNAL THRESHOLD)
      FILT_SIGOUT  => IIR_UVL56_FILT,   -- RESULTING SIGNAL FILTER VALUE 
      P_SIGOUT     => UVL_OK_CH5A6  -- FINAL SIGNAL BIT VALUE AFTER THE FILTER FUNCTION AND HYSTERISIS HAVE BEEN APPLIED
      );


  UVL_78FUSE : IIR_FILT
    port map (
      MASTER_RST_B => MASTER_RST_B,  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
      CLK_5M_GL    => CLK_5M_GL,     -- FPGA MASTER CLOCK--ASSUMED TO BE 5 MHZ

      SIG_IN       => FPGA_FUSE_7_8_OK,  -- '1'= INPUT VOLTAGE IS ABOVE THE MIN THRESHOLD (INPUT SIGNAL TO BE FILTERED)
      THRESH_UPPER => "01110111",  -- (125dec is maxfiltval)UPPER HYSTERISIS THRESHOLD (IE RISING SIGNAL THRESHOLD)
      THRESH_LOWER => "00001000",  -- LOWER HYSTERISIS THRESHOLD (IE FALLING SIGNAL THRESHOLD)
      FILT_SIGOUT  => IIR_UVL78_FILT,   -- RESULTING SIGNAL FILTER VALUE 
      P_SIGOUT     => UVL_OK_CH7A8  -- FINAL SIGNAL BIT VALUE AFTER THE FILTER FUNCTION AND HYSTERISIS HAVE BEEN APPLIED
      );



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- ASSIGN INTERNAL SIGNALS TOP EXTERNAL PORTS
  POR_OUT_TO_SCA     <= MASTER_RST_B;   -- COPY OF INTERNAL FPGA RESET
  BUF5M_J11_15_TCONN <= CLK_5M_GL;      -- COPY OF INTERNAL 5MHZ CLOCK

  P_CH_MREG_EN <= CH_MREG_EN;  -- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
  P_CH_IAUX_EN <= CH_IAUX_EN;  -- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
  P_CH_VOSG_EN <= CH_VOSG_EN;  -- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

-- UNUSED PINS
  J11_17_TCONN <= '0';  -- PIN 32, (SCHEMA ALIAS= CS3_SEL_EN) UNUSED I/O PIN
  J11_19_TCONN <= '0';  -- PIN 8,  (SCHEMA ALIAS= CS4_SEL_EN) UNUSED I/O PIN
  J11_21_TCONN <= '0';  -- PIN 7,  (SCHEMA ALIAS= CS5_SEL_EN) UNUSED I/O PIN
  J11_23_TCONN <= '0';  -- PIN 5,  (SCHEMA ALIAS= CS6_SEL_EN) UNUSED I/O PIN

  TX_FPGA       <= DTYCYC_EN;           -- '0';  using this as a temp probe pin
  PRI_RX_EN_BAR <= '0';
  PRI_TX_EN     <= '1';                 -- CAN BE USED AS A TEST STROBE TRIGGER
--  SCA_DAT_IN    <= SLOW_PLS_STB;        -- '0';  using this as a temp probe pin

-- temp assignments!
-- LED LIGHTS WHEN SIGNAL IS LOW
  PWR_OK_LED <= UVL_OK_CH1A2 or UVL_OK_CH3A4 or UVL_OK_CH5A6 or UVL_OK_CH7A8;  -- AT LEAST ONE FUSED VOLTAGE IS ABOVE V MIN
  STATUS_LED <= FILTD_TEMP_OK;          -- TEMPERATURE IS BELOW THE MAX.

end RTL;
