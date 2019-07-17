--------------------------------------------------------------------------------
-- Company: University of Maryland
--
-- File: SPI_ALT.vhd
-- File history:
--      INIT, APRIL 3, 2019
--      
--
-- Description: 
--
-- SPI PORT:    SLAVE IMPLEMENTATION WITHOUT USING SLAVE SELECTS
--                              NOTE:  THE CLOCK FOR THE INTERFACE ORIGINATES FROM THE SCA MASTER IN ALL DATA EXCHANGES
--                              DATA RATE = 312.5 Kbps (IE ACTUAL SERIAL CLOCK FREQUENCY = LHC 40MHZ / 128 )
--                                      
--      SCA_CLK_OUT             :       CLOCK INPUT TO THE FPGA FROM THE SCA MASTER
--      SCA_DAT_IN              :       DATA OUTPUT FROM THE FPGA TO THE SCA MASTER
--      SCA_DAT_OUT             :       DATA INPUT TO THE FPGA FROM THE SCA MASTER
--
-- Targeted device: <Family::ProASIC3> <Die::A3PN250> <Package::100 VQFP>
-- Author: Tom O'Bannon
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

entity spi_slave is
  port (
    CLK5M_OSC    : in std_logic;        -- INTERNAL GENERATED 5 MHZ CLOCK 
    MASTER_RST_B : in std_logic;        -- INTERNAL ACTIVE LOW RESET

    SCA_CLK_OUT : in  std_logic;  -- CLOCK INPUT TO THE FPGA FROM THE SCA MASTER USED FOR BOTH TX AND RX
    SCA_DAT_OUT : in  std_logic;  -- SERIAL DATA INPUT TO THE FPGA FROM THE SCA MASTER
    SCA_DAT_IN  : out std_logic;  -- SERIAL DATA OUTPUT FROM THE FPGA TO THE SCA MASTER

    SPI_TX_WORD : in  std_logic_vector(31 downto 0);  -- 32 BIT SERIAL WORD TO BE TRANSMITTED
    SPI_RX_WORD : out std_logic_vector(31 downto 0);  -- RECEIVED SERIAL FRAME
    SPI_RX_STRB : out std_logic;  -- SINGLE 5MHZ CLOCK PULSE SIGNIFIES A NEW SERIAL FRAME IS AVAILABLE.

    P_TX_32BIT_REG : out std_logic_vector(31 downto 0);
    P_STATE_ID     : out std_logic_vector(3 downto 0)

    );
end spi_slave;

architecture RTL of spi_slave is

  signal RX_32BIT_SREG, N_RX_32BIT_SREG : std_logic_vector(31 downto 0);  -- 32 BIT SHIFT REGISTER DEDICATED FOR ACTIVE SPI RECEIVE

  attribute syn_preserve                    : boolean;
  attribute syn_preserve of RX_32BIT_SREG   : signal is true;
  attribute syn_preserve of N_RX_32BIT_SREG : signal is true;

  signal TX_32BIT_SREG, N_TX_32BIT_SREG : std_logic_vector(31 downto 0);  -- 32 BIT SHIFT REGISTER DEDICATED FOR ACTIVE SPI TRANSMIT

  signal TX_32BIT_REG, N_TX_32BIT_REG : std_logic_vector(31 downto 0);  -- 32 BIT FIXED REGISTER DEDICATED FOR ACTIVE SPI TRANSMIT

  signal CLK_FCNT, N_CLK_FCNT     : integer range 0 to 32;  -- SPI FRAME COUNTER
  signal CLK_FCNT_1C, CLK_FCNT_2C : integer range 0 to 32;  -- USED FOR CLOCK BOUNDARY CROSSING

  signal I_SCA_DAT_IN, N_I_SCA_DAT_IN : std_logic;  -- INTERNAL SIGNAL FOR SCA TX SERIAL DATA LINE

  signal SPI_CLR, N_SPI_CLR             : std_logic;  -- SIGNAL USED TO CLEAR SPI REGSITERS
  signal CLK_FCNT_EN, N_CLK_FCNT_EN     : std_logic;  -- ENABLE FOR THE FRAME COUNTER
  signal I_SPI_RX_STRB, N_I_SPI_RX_STRB : std_logic;  -- SINGLE CLOCK PULSE STROBE INDICATES NEW SPI WORD RECEIVED
  signal I_SPI_RX_WORD, N_I_SPI_RX_WORD : std_logic_vector(31 downto 0) := x"ABCDEF12";  -- INTERNAL 32 BIT SHIFT REGISTER DEDICATED FOR ACTIVE SPI RECEIVE

  -- DEFINE THE STATES FOR THE MACHINE STATE MANAGING THE SPI PORT
  type SPI_SM_STATES is (INIT, DET_NULLCLK, EN_DET_FRAME1CNT, PIPELINE_DELAY, DET_FRAME_DONE, PROCESS_FRAME);
  signal SPI_SM, N_SPI_SM : SPI_SM_STATES;

  signal SCA_CLK_OUT_1C, SCA_CLK_OUT_2C : std_logic;  -- USED FOR CLOCK BOUNDARY CROSSING

  signal NULLCLK_CNT, N_NULLCLK_CNT : integer range 0 to 31;  -- COUNT OF THE NUMBER OF CLK-NULL SAMPLES

-- FOR DEBUG    
  signal STATE_ID : std_logic_vector(3 downto 0);
begin

-- architecture body

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE THE SPI INPUT AND OUTPUT DATA SHIFT REGISTERS WHICH OPERATES DIRECTLY FROM THE SPI CLOCK
-- DEFINE THE FRAME COUNT WHICH COUNTS CLOCK CYCLES DURING THE ACTIVE CLOCK CYCLES OF A 32-CYCLE DATA FRAME
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE THE D FF'S
  SREG_DFF : process(SCA_CLK_OUT, SPI_CLR)
  begin
    if SPI_CLR = '1' then  -- AN EXTERNAL STATE MACHINE FORCES SYNCHRONIZATION OF THE SPI 
      RX_32BIT_SREG <= (others => '0');
      TX_32BIT_SREG <= (others => '0');
      CLK_FCNT      <= 0;               -- FIRST TRANSITION GOES TO 1

      I_SCA_DAT_IN <= '0';

    elsif RISING_EDGE(SCA_CLK_OUT) then
      RX_32BIT_SREG <= N_RX_32BIT_SREG;
      TX_32BIT_SREG <= N_TX_32BIT_SREG;
      CLK_FCNT      <= N_CLK_FCNT;

      I_SCA_DAT_IN <= N_I_SCA_DAT_IN;

    end if;

  end process;

-- DEFINE D FF INPUTS THAT OPERATE DIRECTLY OFF THE SPI CLOCK HERE
  SREG_DFFI : process(RX_32BIT_SREG, SCA_DAT_OUT, CLK_FCNT, CLK_FCNT_EN, TX_32BIT_REG, TX_32BIT_SREG)
  begin
    -- THIS IS THE RX PATH
    N_RX_32BIT_SREG(31 downto 0) <= RX_32BIT_SREG(30 downto 0) & SCA_DAT_OUT;  -- THESE ARE THE D FF INPUTS FOR THE SHIFT REGISTER 
                                        -- SCA SPI SENDS MSb FIRST TO THE FPGA

    -- THIS COUNTS THE FRAME BITS
    if CLK_FCNT = 32 then
      N_CLK_FCNT <= 0;  -- NORMAL COUNT OP IS 1 THRU 32,WHERE 0 IS A HOLD / INIT VAL
    elsif CLK_FCNT_EN = '1' then  -- THIS COUNTS THE SERIAL FRAME CLOCK CYCLES WHEN ENABLED
      N_CLK_FCNT <= CLK_FCNT + 1;
    else
      N_CLK_FCNT <= CLK_FCNT;
    end if;

    N_I_SCA_DAT_IN <= TX_32BIT_SREG(31);  -- FPGA SPI SENDS MSb OUT FIRST TO SCA

    N_TX_32BIT_SREG <= TX_32BIT_SREG;   -- DEFAULT ASSIGNMENT

    case CLK_FCNT is
      when 0 =>
        N_TX_32BIT_SREG <= TX_32BIT_REG;  -- *** SAMPLE EXTERAL DATA TO BE TRANSMITTED HERE ***
        N_I_SCA_DAT_IN  <= TX_32BIT_SREG(31);  -- FPGA SPI SENDS MSb OUT FIRST TO SCA
      when 1 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(30);
      when 2 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(29);
      when 3 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(28);
      when 4 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(27);
      when 5 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(26);
      when 6 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(25);
      when 7 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(24);
      when 8 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(23);
      when 9 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(22);
      when 10 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(21);
      when 11 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(20);
      when 12 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(19);
      when 13 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(18);
      when 14 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(17);
      when 15 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(16);
      when 16 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(15);
      when 17 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(14);
      when 18 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(13);
      when 19 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(12);
      when 20 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(11);
      when 21 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(10);
      when 22 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(9);
      when 23 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(8);
      when 24 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(7);
      when 25 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(6);
      when 26 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(5);
      when 27 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(4);
      when 28 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(3);
      when 29 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(2);
      when 30 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(1);
      when 31 =>
        N_I_SCA_DAT_IN <= TX_32BIT_SREG(0);
      when 32 =>
        N_I_SCA_DAT_IN <= '1'; -- Error if all 33 cases were not covered

    end case;



  end process;


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE THE REGISTERS THAT OPERATE FROM THE 5 MHZ CLOCK

  REG_5M : process(CLK5M_OSC, MASTER_RST_B)
  begin

    if MASTER_RST_B = '0' then
      SPI_SM        <= INIT;
      CLK_FCNT_EN   <= '0';
      SPI_CLR       <= '0';
      I_SPI_RX_STRB <= '0';
      I_SPI_RX_WORD <= (others => '0');

      CLK_FCNT_1C <= 0;
      CLK_FCNT_2C <= 0;

      SCA_CLK_OUT_1C <= '0';
      SCA_CLK_OUT_2C <= '0';

      NULLCLK_CNT <= 0;

      TX_32BIT_REG <= (others => '0');

    elsif RISING_EDGE(CLK5M_OSC) then
      SPI_SM        <= N_SPI_SM;
      CLK_FCNT_EN   <= N_CLK_FCNT_EN;
      SPI_CLR       <= N_SPI_CLR;
      I_SPI_RX_STRB <= N_I_SPI_RX_STRB;
      I_SPI_RX_WORD <= N_I_SPI_RX_WORD;

      CLK_FCNT_1C <= CLK_FCNT;          -- CLOCK BOUNDARY CROSSING
      CLK_FCNT_2C <= CLK_FCNT_1C;       -- CLOCK BOUNDARY CROSSING

      SCA_CLK_OUT_1C <= SCA_CLK_OUT;     -- CLOCK BOUNDARY CROSSING
      SCA_CLK_OUT_2C <= SCA_CLK_OUT_1C;  -- CLOCK BOUNDARY CROSSING

      NULLCLK_CNT <= N_NULLCLK_CNT;

      TX_32BIT_REG <= N_TX_32BIT_REG;

    end if;
  end process;


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  THIS PROCESS CONTROLS THE SPI INPUT AND OUTPUT SHIFT REGISTERS AS WELL AS THE SPI CLOCK COUNT FOR THE FRAME
--  CLOCK BOUNDARY CROSSING IS INHERENTLY SYNCHRONOUS FOR THE CONTROL SIGNALS ONCE THE STATE MACHINE IS SYNCHRONIZED TO THE SPI FRAME
--  HOWEVER, DOUBLE REGISTERS ARE USED TO SAMPLE THE CLK_FCNT AS WELL AS THE SPI CLOCK

  SPI : process(SPI_SM, CLK_FCNT_2C, SCA_CLK_OUT_2C, RX_32BIT_SREG, NULLCLK_CNT, I_SPI_RX_WORD, CLK_FCNT_EN, SPI_CLR, SPI_TX_WORD, TX_32BIT_REG,
                STATE_ID)
  begin

    -- DEFAULT ASSIGNMENTS THAT GET OVER-WRITTEN BELOW AS NEEDED:
    N_NULLCLK_CNT   <= NULLCLK_CNT;
    N_I_SPI_RX_STRB <= '0';
    N_SPI_CLR       <= SPI_CLR;
    N_CLK_FCNT_EN   <= CLK_FCNT_EN;
    N_I_SPI_RX_WORD <= I_SPI_RX_WORD;
    N_TX_32BIT_REG  <= TX_32BIT_REG;

    case SPI_SM is

      when INIT =>

        N_CLK_FCNT_EN <= '0';           -- DISABLE TO THE FRAME COUNTER
        N_SPI_CLR     <= '1';  -- SEND OUT A CLEAR TO INITIALIZE THE FRAME COUNTER AND SPI INPUT DATA REGISTER

        N_SPI_SM <= DET_NULLCLK;  -- GO WAIT FOR DETECTION OF A NULL CLOCK CONDITION TO SYNCH THE SPI FRAME

        N_NULLCLK_CNT <= 0;             -- INITIALIZE THE NULL CLOCK COUNTER

        STATE_ID <= "0000";

      when DET_NULLCLK =>  -- WAIT HERE UNTIL THE SPI CLOCK IS NULL FOR AT LEASTY 3/4 SPI CLOCK PERIOD
        N_CLK_FCNT_EN <= '0';           -- DISABLE TO THE FRAME COUNTER
        N_SPI_CLR     <= '1';  -- SEND OUT A CLEAR TO INITIALIZE THE FRAME COUNTER AND SPI INPUT DATA REGISTER

        if NULLCLK_CNT > 17 then  -- ONE SPI CLOCK PERIOD COUNT WHILE HIGH IS 5MHZ/312KHZ/2 = ~ 8 COUNTS
          N_NULLCLK_CNT <= 0;           -- IF NULL CLOCK, THEN CLEAR THE CNT
          N_SPI_SM      <= EN_DET_FRAME1CNT;  -- AND GO WAIT FOR THE NEXT FRAME TO BE COMPLETED

        elsif SCA_CLK_OUT_2C = '0' then  -- ONLY COUNT DURING THE LOGIC LOW PORTION OF THE SPI CLOCK SIGNAL
          N_NULLCLK_CNT <= NULLCLK_CNT + 1;
          N_SPI_SM      <= DET_NULLCLK;  -- STAY HERE UNTIL NULL DETECTED

        else
          N_NULLCLK_CNT <= 0;  -- ONLY GET HERE IF THE SPI CLOCK IS ACTIVE
          N_SPI_SM      <= DET_NULLCLK;  -- STAY HERE UNTIL NULL DETECTED

        end if;

        STATE_ID <= "0001";


      when EN_DET_FRAME1CNT =>  -- ENABLE THE DET FRAME CNT AND ALSO RELEASE THE CLEAR
        N_CLK_FCNT_EN <= '1';           -- ENABLE THE FRAME COUNTER
        N_SPI_CLR     <= '0';           -- DISABLE THE SPI_CLR
        N_SPI_SM      <= PIPELINE_DELAY;  -- GO WAIT ONE MORE CLOCK CYCLE TO ALLOW FOR THE CLOCK BOUNDARY CROSSING

        STATE_ID <= "0010";


      when PIPELINE_DELAY =>  -- NEED A PIPELINE DELAY TO ACCOUNT FOR THE CLOCK BOUNDARY CROSSING REGISTERS
        N_SPI_SM <= DET_FRAME_DONE;

        STATE_ID <= "0011";

      when DET_FRAME_DONE =>  -- WAIT HERE UNTIL 32 SPI CLOCK PERIODS HAVE BEEN DETECTED.


        if CLK_FCNT_2C = 32 then
          N_SPI_SM <= PROCESS_FRAME;
        else
          N_SPI_SM <= DET_FRAME_DONE;
        end if;

        N_TX_32BIT_REG <= SPI_TX_WORD;  -- COPY THE DATA WORD TO BE TRANSMITTED DURING NEXT FRAME INTO A REGISTER

        STATE_ID <= "0100";

      when PROCESS_FRAME =>
        N_I_SPI_RX_WORD <= RX_32BIT_SREG;  -- SEND OUT A COPY THE RECEIVED SERIAL 32 BIT WORD
        N_I_SPI_RX_STRB <= '1';  -- SINGLE CLOCK PULSE STROBE INDICATES NEW FRAME READY
        N_SPI_SM        <= INIT;

        STATE_ID <= "0101";


      when others =>
        N_SPI_SM <= INIT;

        STATE_ID <= "0110";

    end case;

  end process;

-- ASSIGN INTERNAL SIGNALS TO EXTERNAL PORTS
  SPI_RX_STRB <= I_SPI_RX_STRB;
  SPI_RX_WORD <= I_SPI_RX_WORD;

  SCA_DAT_IN <= I_SCA_DAT_IN;
  P_STATE_ID <= STATE_ID;

  P_TX_32BIT_REG <= TX_32BIT_REG;

end RTL;
