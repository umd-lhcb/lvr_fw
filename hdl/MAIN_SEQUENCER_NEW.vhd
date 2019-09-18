--------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MARYLAND
--
-- File: MAIN_SEQUENCER_NEW.vhd
-- File history:
--      <Rev - // Mar 30, 2017  INITIAL basis for the design that was tested for SEU performance at CERN CHARM
--              <Rev A // Feb 26, 2019  MAJOR UPDATE FOR GEN 3 LVR config
--              <REV B // APR  8, 2019  MAJOR UPDATE THAT TURNS THIS INTO A 2 CHANNEL MODULE THAT MATCHES THE FUSE GROUPING.
--                                                              (EACH FUSE GROUP HAS 2 CHANNELS)

-- Description: THIS MOUDULE IS THE MAIN CONTROL SEQUENCER FOR A PAIR OF CHANNELS

--              
--                              THE SEQUENCER WAITS FOR STDBY_OFFB_B=1 BEFORE PROCEEDING:
--                              IF ABOVE TRUE, THEN THE NEW MASTER CHANNEL ENABLE BYTE IS LATCHED.
-- 
--                              THE REQUIRED TURN SEQUENCE IS AS FOLLOWS.  THE UPDATES ARE INITIATED BY THE CMND_WORD_STB PULSE.  
--                              SET THE STDBY_OFFB_B BIT AND REG_CH_CMD_EN BITS ACCORDING TO THE DESIRED TURN SEQUENCE:

--                                      OPTION 1) GROUP TURN ON WHEN:
--                                                      * ARM_MODE= '1' (FORCES WAIT FOR GLOBAL TRIGGER EVENT)
--                                                      * STDBY_OFFB_B BIT = '1' OR '0', DEPENDING UPON DESIRED TIMING OF THE V_OS OUTPUT STEP
--                                                      * SET ALL DESIRED CHANNELS TO BE ENABLED VIA REG_CH_CMD_EN 
--                                                      * INITIATE A GLOBAL TRIGGER EVENT.  

--                                      OPTION 2) INDIVIDUAL AND IMMEDIATE CHANNEL TURN ON WHEN:
--                                                      * ARM_MODE= '0' (ENABLES CHANNELS TO BE IMMEDIATELY ENABLED)
--                                                      * STDBY_OFFB_B BIT = '1' OR '0', DEPENDING UPON DESIRED TIMING OF THE V_OS OUTPUT STEP
--                                                      * REG_CH_CMD_EN SET ALL DESIRED CHANNELS
--                                                      * INITIATE A GLOBAL TRIGGER EVENT.  

--                                      THE SEQUENCER THEN SEQUENTIALLY ENABLES EACH CHANNEL FROM FROM LSB TO MSB ORDER.  
--                                      EACH CHANNEL ENABLE REQUIRES 3 DELAY STEPS THAT ARE EACH 2^^32 X 200 NS = 6.5536 MSEC (19.66MSEC)

-- Targeted device: <Family::ProASIC3> <Die::A3PN125> <Package::100 VQFP>
-- Author: TOM O'BANNON
--
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

entity MAIN_SEQUENCER_NEW is
  port (
    MASTER_RST_B : in std_logic;  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
    CLK_5M_GL    : in std_logic;        -- MASTER 5 MHZ CLOCK

    REG_CH_CMD_EN : in std_logic_vector(1 downto 0);  -- REGISTER CHANNEL COMMAND ENABLES
    CMND_WORD_STB : in std_logic;  -- SINGLE CLOCK PULSE STROBE INDICATES AN UPDATED COMMAND WORD

    STDBY_OFFB_B : in std_logic;  -- '1' = FORCED V_OS OUTPUT ENABLED, '0' = NORMAL V_OS TIMING STEP

    DTYCYC_EN : in std_logic;  -- '1' ENABLES A LOW DUTY CYCLE MODE TO LIMIT THERMAL LOADS FOR SPECIAL TESTS
    V_IN_OK   : in std_logic;  -- UNDER-VOLTAGE LOCKOUT:  V_IN ABOVE THRESHOLD WHEN ='1'
    TEMP_OK   : in std_logic;  -- '1' MEANS THE TEMPERATURE IS BELOW THE MAX VALUE

    SIM_MODE_EN : in integer;  -- '1' IS SPECIAL SIM MODE WITH REDUCED TIMEOUT INTERVALS

-- THE MASTER-SLAVE CONFIG DETERMINES THE ENABLE FOR THE V_OS OP AMPL!
    CHA_B_MS_CFG_EN : in std_logic;  -- pin 21, BIT 0:  CHA_B_MS_CFG_EN = ADJACENT CHANNELS A & 

    P_CH_MREG_EN : out std_logic_vector(1 downto 0);  -- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
    P_CH_IAUX_EN : out std_logic_vector(1 downto 0);  -- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
    P_CH_VOSG_EN : out std_logic_vector(1 downto 0);  -- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

    P_SEQ_STEPVAL : out std_logic_vector(3 downto 0)  -- INDICATES PRESENT SEQUENCE STEP
    );
end MAIN_SEQUENCER_NEW;

architecture RTL of MAIN_SEQUENCER_NEW is

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--ATTRIBUTE SYN_RADHARDLEVEL OF RTL : ARCHITECTURE IS "TMR";
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE INTERNAL SIGNALS
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- DEFINE THE STATES FOR THE MACHINE STATE MANAGEING THE ACTIVE HYSTERISIS THRESHOLD
  type SEQ_SM_STATES is (
    INIT, WAIT_STEP,
    CH_1ST_STEP, CH_2ND_STEP, CH_3RD_STEP, STANDBY_HOLD, OPERATE_HOLD, SEQ_DONE, HOLD_AT_UVL, CHK_IF_UVL_CLEAR
    );
  signal SEQUENCER_STATE, N_SEQUENCER_STATE : SEQ_SM_STATES;
  signal RET_STATE, N_RET_STATE             : SEQ_SM_STATES;

  signal N_PREV_M_CH_EN, PREV_M_CH_EN : std_logic_vector(1 downto 0);  -- COPY THE CHANNEL ENABLE UPDATE TO 'NEW

  signal N_CH_MREG_EN, CH_MREG_EN : std_logic_vector(1 downto 0);  -- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
  signal N_CH_IAUX_EN, CH_IAUX_EN : std_logic_vector(1 downto 0);  -- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
  signal N_CH_VOSG_EN, CH_VOSG_EN : std_logic_vector(1 downto 0);  -- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

  signal N_CH_ACTIVE_STAT, CH_ACTIVE_STAT : std_logic;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  signal N_DEL_CNTR, DEL_CNTR             : integer range 0 to (2**15) - 1;  -- DELAY INTERVAL COUNTER
  signal DEL_CNT_VAL                      : integer range 0 to (2**15) - 1;  -- MAX DELAY COUNTER RELOAD VALUE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  signal N_SEQ_STEPVAL, SEQ_STEPVAL : std_logic_vector(3 downto 0);  -- PuLSE INDICATES SEQUENCE WAS COMPLETED

begin

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE ALL REGISTERS USED WITH THE 5 MHZ CLOCK
  REG5M : process(CLK_5M_GL, MASTER_RST_B, DEL_CNT_VAL)
  begin
    if MASTER_RST_B = '0' then
      SEQUENCER_STATE <= INIT;
      PREV_M_CH_EN    <= (others => '0');  -- DEFAULT CASE IS NO CHANNELS ENABLED
      CH_MREG_EN      <= (others => '0');  -- DEFAULT CASE IS OFF
      CH_IAUX_EN      <= (others => '0');  -- DEFAULT CASE IS OFF
      CH_VOSG_EN      <= (others => '0');  -- DEFAULT CASE IS OFF
      RET_STATE       <= INIT;
      DEL_CNTR        <= DEL_CNT_VAL;
      SEQ_STEPVAL     <= "0000";
      CH_ACTIVE_STAT  <= '0';

    elsif (CLK_5M_GL'event and CLK_5M_GL = '1') then
      SEQUENCER_STATE <= N_SEQUENCER_STATE;
      N_PREV_M_CH_EN <= PREV_M_CH_EN;  -- THIS IS A COPY OF THE NEWEST EXTERNAL COMMAND (REG_CH_CMD_EN)
      PREV_M_CH_EN    <= REG_CH_CMD_EN;
      CH_MREG_EN      <= N_CH_MREG_EN;
      CH_IAUX_EN      <= N_CH_IAUX_EN;
      CH_VOSG_EN      <= N_CH_VOSG_EN;
      RET_STATE       <= N_RET_STATE;
      DEL_CNTR        <= N_DEL_CNTR;
      SEQ_STEPVAL     <= N_SEQ_STEPVAL;
      CH_ACTIVE_STAT  <= N_CH_ACTIVE_STAT;

    end if;

  end process;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- INSTANTIATE THE MAIN SEQUENCER AND CONTROL MODULE
  MAIN_SEQUENCER : process(SIM_MODE_EN, DTYCYC_EN, SEQ_STEPVAL,
                           SEQUENCER_STATE, RET_STATE, DEL_CNTR, CH_VOSG_EN, CH_IAUX_EN, CH_MREG_EN,
                           CHA_B_MS_CFG_EN, V_IN_OK, TEMP_OK,
                           REG_CH_CMD_EN, PREV_M_CH_EN, STDBY_OFFB_B, CH_ACTIVE_STAT
                           )


  begin
    -- DEFAULT ASSIGNMENTS GET OVERRIDEN BELOW AS NEEDED

    N_CH_MREG_EN <= CH_MREG_EN;
    N_CH_IAUX_EN <= CH_IAUX_EN;
    N_CH_VOSG_EN <= CH_VOSG_EN;
    N_RET_STATE  <= RET_STATE;
    N_DEL_CNTR   <= DEL_CNTR;

    N_SEQ_STEPVAL <= SEQ_STEPVAL;


    -- MUX FOR SPECIAL SIM MODE WHICH HAS SHORTER TIMEOUT INTERVALS

    if SIM_MODE_EN = 1 then
      DEL_CNT_VAL <= (2**5) - 1;  -- MAX DELAY COUNTER RELOAD VALUE FOR SPECIAL SIM MODE
    else
      DEL_CNT_VAL <= (2**15) - 1;  -- MAX DELAY COUNTER RELOAD VALUE FOR NORMAL OPERATING MODE
    end if;

-- TEST FOR AN ACTIVE CHANNEL:
--      *UVL NEEDS TO BE SATISFIED ALONG WITH AT LEAST ONE CHANNEL ENABLE.
    if (REG_CH_CMD_EN(0) = '1' or REG_CH_CMD_EN(1) = '1') then
      N_CH_ACTIVE_STAT <= '1';
    else
      N_CH_ACTIVE_STAT <= '0';
    end if;


-- THIS IS A VERY SIMPLIFIED VERSION THAT ONLY HANDLES THE FOLLOWING CONOP SEQUENCE:
    -- 1) FIRST, SET THE MASTER_SLAVE CH GROUP DIP SWITCHES ACCORDING TO THE WIRED CHANNEL CONFIGS!!!!!!
    -- 2) THEN, TOGGLE STNDBY_OFFB DIP SWITCH FROM "0" TO "1" TO TRANSITION ALL CHANNELS FROM FULL OFF TO STANDBY STATE, WAITING WITH THE OUTPUTS AT VOS
    -- 3) NEXT, ENABLE CHANNEL OUTPUTS 8-TO-5 AND/OR 4-TO-1 WITH ASSOCIATED DIP SWITCH TOGGLE

    case SEQUENCER_STATE is

      when INIT =>                      -- 

        N_CH_MREG_EN <= "00";           -- KEEP DISABLED 
        N_CH_IAUX_EN <= "00";           -- KEEP DISABLED 
        N_CH_VOSG_EN <= "00";           -- KEEP DISABLED

        if (STDBY_OFFB_B = '1') then  -- TRANSITION TO THE STANDBY STATE WHEN EANBLED
          N_SEQUENCER_STATE <= CH_1ST_STEP;
        else
          N_SEQUENCER_STATE <= INIT;    -- WAIT HERE UNTIL STANDBY IS REQUESTED
        end if;

        N_DEL_CNTR <= DEL_CNT_VAL;      -- INITIALIZE THE DELAY COUNTER

        N_SEQ_STEPVAL <= "0000";        -- SEND PRESENT SEQUENCE STEP

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- V_OS GENERATOR SIGNAL.  (IE THIS IS ONLY THE V_OS OP AMP AND NOT THE CHANNEL OUTPUT)
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when CH_1ST_STEP =>  -- ENABLE THE VOS GENERATOR SIGNAL FOR THE SPECIFIED CHANNEL ID'S
                                   -- 
        N_CH_MREG_EN <= "00";           -- KEEP DISABLED 
        N_CH_IAUX_EN <= "00";           -- KEEP DISABLED 
        N_CH_VOSG_EN <= "11";           -- ENABLE THE V_OS GEN SIGNALS

        N_SEQUENCER_STATE <= WAIT_STEP;  -- GO AND WAIT FOR THE CIRCUITS HIT STEADY STATE
        N_RET_STATE       <= CH_2ND_STEP;  -- THEN GO TO THE 2ND SEQUENCE STEP, ONCE WAIT IS COMPLETE
        N_DEL_CNTR        <= DEL_CNT_VAL;  -- RE-INITIALIZE THE DELAY COUNTER BEFORE USING IT

        N_SEQ_STEPVAL <= "0001";        -- SEND PRESENT SEQUENCE STEP

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- I_AUX CIRCUIT ENABLE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when CH_2ND_STEP =>  -- ENABLE THE IAUX SIGNAL FOR THE SPECIFIED CHANNEL ID'S

        N_CH_MREG_EN <= "00";           -- KEEP DISABLED 
        N_CH_IAUX_EN <= "11";           -- ENABLE ALL ACTIVE CHANNELS
        N_CH_VOSG_EN <= "11";  -- KEEP THE V_OS GEN SIGNAL ENABLED IF CHANNEL IS ENABLED

        N_SEQUENCER_STATE <= WAIT_STEP;  -- GO AND WAIT FOR THE CIRCUITS HIT STEADY STATE
        N_RET_STATE       <= CH_3RD_STEP;  -- THEN HOLD AT THE STANDBY STATE SEQUENCE STEP, ONCE WAIT IS COMPLETE
        N_DEL_CNTR        <= DEL_CNT_VAL;  -- RE-INITIALIZE THE DELAY COUNTER BEFORE USING IT

        N_SEQ_STEPVAL <= "0010";        -- SEND PRESENT SEQUENCE STEP

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- MREG CIRCUIT ENABLE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when CH_3RD_STEP =>  -- ENABLE THE MREG SIGNAL FOR THE SPECIFIED CHANNEL ID'S

        N_CH_MREG_EN <= "11";           -- KEEP DISABLED 
        N_CH_IAUX_EN <= "11";           -- ENABLE ALL ACTIVE CHANNELS
        N_CH_VOSG_EN <= "11";  -- KEEP THE V_OS GEN SIGNAL ENABLED IF CHANNEL IS ENABLED

        N_SEQUENCER_STATE <= WAIT_STEP;  -- GO AND WAIT FOR THE CIRCUITS HIT STEADY STATE
        N_RET_STATE       <= STANDBY_HOLD;  -- THEN HOLD AT THE STANDBY STATE SEQUENCE STEP, ONCE WAIT IS COMPLETE
        N_DEL_CNTR        <= DEL_CNT_VAL;  -- RE-INITIALIZE THE DELAY COUNTER BEFORE USING IT

        N_SEQ_STEPVAL <= "0011";        -- SEND PRESENT SEQUENCE STEP

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- STANDBY HOLD STATE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when STANDBY_HOLD =>              -- HOLD HERE WHILE IN STANDBY

        if (STDBY_OFFB_B = '1' and CH_ACTIVE_STAT = '0') then  -- HOLD HERE WHILE IN STANDBY
          N_SEQUENCER_STATE <= STANDBY_HOLD;

        elsif (STDBY_OFFB_B = '1' and CH_ACTIVE_STAT = '1') then  -- GO TO OPERATE HOLD OIF THERE IS NOW AN ACTIVE CHANNEL COMMAND
          N_SEQUENCER_STATE <= OPERATE_HOLD;

        else
          N_SEQUENCER_STATE <= INIT;  -- GO BACK TO INIT IF STDBY_OFFB = '0' !!!!

        end if;

        N_CH_MREG_EN <= "11";           -- KEEP VOS_GEN ENABLED 
        N_CH_IAUX_EN <= "11";           -- ENABLE ALL ACTIVE CHANNELS
        N_CH_VOSG_EN <= "11";  -- KEEP THE V_OS GEN SIGNAL ENABLED IF CHANNEL IS ENABLED

        N_SEQ_STEPVAL <= "0100";        -- SEND PRESENT SEQUENCE STEP

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- OPERATE HOLD STATE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when OPERATE_HOLD =>              -- STAY HERE FOR OPERATE MODE

        if (STDBY_OFFB_B = '1' and CH_ACTIVE_STAT = '0') then  -- GO BACK TO STANDBY WHEN ALL CHANNELS COMMANDED OFF
          N_SEQUENCER_STATE <= STANDBY_HOLD;

        --elsif (STDBY_OFFB_B = '1' and CH_ACTIVE_STAT = '1') then  -- STAY IN OPERATE HOLD IF THERE IS AT LEAST 1 ACTIVE CHANNEL COMMAND
        elsif (STDBY_OFFB_B = '1' and ((REG_CH_CMD_EN = prev_m_ch_en)
               or (CH_MREG_EN = "11" and CH_IAUX_EN = "11" and CH_VOSG_EN = "11"))) then 
          N_SEQUENCER_STATE <= OPERATE_HOLD;

        else
          N_SEQUENCER_STATE <= INIT;  -- GO BACK TO INIT IF STDBY_OFFB = '0' !!!!

        end if;


        -- VOS_GEN OP AMP ENABLES CONTROLS THE ACTUAL CHANNEL OUTPUT FUNCTION!
        if CHA_B_MS_CFG_EN = '1' then   -- MASTER IS INDEX 0, SLAVE IS INDEX 1
          N_CH_MREG_EN <= "11";           -- KEEP ENABLED 
          N_CH_IAUX_EN <= "11";           -- ENABLE ALL ACTIVE CHANNELS
          N_CH_VOSG_EN(0) <= not(REG_CH_CMD_EN(0) and DTYCYC_EN);  -- TURN OFF THE MASTER CH VOS_GEN OP AMP (IF ENABLED) TO TURN ON THE OUTPUT VOLTAGE .... 
          N_CH_VOSG_EN(1) <= '1';  -- ... BUT KEEP SLAVE CH VOS_GEN OP AMP ENABLED.
        else                            -- 2 SEPARATE MASTER CHANNELS HERE
          N_CH_VOSG_EN(0) <= '0';  -- SO, TURN OFF THE MASTER CH VOS_GEN OP AMP IF CHANNEL COMMANDED TO BE ON
          N_CH_VOSG_EN(1) <= '0';  -- SO, TURN OFF THE MASTER CH VOS_GEN OP AMP IF CHANNEL COMMANDED TO BE ON
          N_CH_IAUX_EN(0) <= REG_CH_CMD_EN(0) and DTYCYC_EN;  -- SO, TURN OFF THE MASTER CH VOS_GEN OP AMP IF CHANNEL COMMANDED TO BE ON
          N_CH_IAUX_EN(1) <= REG_CH_CMD_EN(1) and DTYCYC_EN;  -- SO, TURN OFF THE MASTER CH VOS_GEN OP AMP IF CHANNEL COMMANDED TO BE ON
          N_CH_MREG_EN(0) <= REG_CH_CMD_EN(0) and DTYCYC_EN;  -- SO, TURN OFF THE MASTER CH VOS_GEN OP AMP IF CHANNEL COMMANDED TO BE ON
          N_CH_MREG_EN(1) <= REG_CH_CMD_EN(1) and DTYCYC_EN;  -- SO, TURN OFF THE MASTER CH VOS_GEN OP AMP IF CHANNEL COMMANDED TO BE ON
        end if;

        N_SEQ_STEPVAL <= "0101";        -- SEND PRESENT SEQUENCE STEP

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- WAIT STATE--IS REUSED STATE MACHINE SEQMENT, SO ALWAYS REQUIRES A STATE MACHINE RETURN STATE WHEN DONE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when WAIT_STEP =>
        if DEL_CNTR = 0 then  -- PROCEED ONCE DELAY COUNTER IS FINISHED
          N_DEL_CNTR        <= DEL_CNT_VAL;  -- RE-INITIALIZE THE DELAY COUNTER
          N_SEQUENCER_STATE <= RET_STATE;  -- THIS MUST BE SUPPLIED FROM THE PREVIOUS STATE MACHINE STEP!
        else
          N_DEL_CNTR        <= DEL_CNTR - 1;  -- DECREMENT THE DELAY COUNTER
          N_SEQUENCER_STATE <= WAIT_STEP;  -- WAIT HERE UNTIL THE TIEMOUT INTERVAL IS COMPLETE.                         
        end if;

        N_SEQ_STEPVAL <= "1111";        -- SEND PRESENT SEQUENCE STEP



      when others =>
        N_SEQUENCER_STATE <= INIT;

    end case;

--++++++++++++++++++++++++++++++++++++++++++++++++++++
-- THIS IS THE UNDER-VOLTAGE LOCKOUT HANDLER.
-- THESE STATEMENTS OVERRIDE THE ONES ABOVE.            
    if (V_IN_OK = '0' or TEMP_OK = '0') then  -- V_IN_OK MUST BE ='1' TO BE ABOVE THE MIN V INPUT THRESHOLD!

      N_SEQUENCER_STATE <= INIT;

      N_CH_MREG_EN <= "00";             -- DISABLE ALL CHANNELS IMMEDIATELY
      N_CH_IAUX_EN <= "00";
      N_CH_VOSG_EN <= "00";

    end if;


--++++++++++++++++++++++++++++++++++++++++++++++++++++                  


  end process MAIN_SEQUENCER;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ASSIGN INTERNAL SIGNALS TO EXTERNAL PORTS

  P_CH_MREG_EN <= CH_MREG_EN;
  P_CH_IAUX_EN <= CH_IAUX_EN;
  P_CH_VOSG_EN <= CH_VOSG_EN;

  P_SEQ_STEPVAL <= SEQ_STEPVAL;

end RTL;
