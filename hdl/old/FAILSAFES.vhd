--------------------------------------------------------------------------------
-- File history:
--      INIT, APRIL 5, 2019
--      
--
-- Description: 
--
-- FAILSAFES    
--                              OVER-TEMPERATURE:               THE LVR WILL BE LATCHED INTO A STATE WHERE ALL OUTPUTS ARE OFF
--                                                                              THE LATCHED STATE CAN ONLY BE CLEARED BY A POWER CYCLE EVENT
--                                                                              THE OVER TEMPERATURE CONDITION MUST PERSIST FOR AT LEAST ____ PERIOD

--                              UNDER-VOLTAGE-LOCKOUT   THERE IS ONE FAILSAFE PER INPUT FUSE GROUP ASSOCIATED WITH 2 OUTPUT CHANNELS
--                                                                              THE TRANSITION BETWEEN STATES MUST PERSIST AT LEAST ____ PERIOD.

-- Targeted device: <Family::ProASIC3> <Die::A3PN250> <Package::100 VQFP>
-- Author: Tom O'Bannon
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity FAILSAFES is
  port (
    CLK_5M_GL    : in std_logic;  -- FPGA MASTER CLOCK--ASSUMED TO BE 5 MHZ
    MASTER_RST_B : in std_logic;        -- ACTIVE LOW RESET

    TEMP_OK      : in std_logic;  -- '1'= TEMPERATURE IS BELOW MAX THRESHOLD
    V_IN_OK_RAW  : in std_logic_vector(3 downto 0);  -- '1'= VOLTAGE IS ABOVE THE MINIMUM REQUIRED TO OPERATE
    MS250_CLK_EN : in std_logic;  -- CLOCK ENABLE THAT OCCURS AT A 250 MSEC INTERVAL

    LATCHED_T_FAULT : out std_logic;  -- A TEMPERATURE FAULT REQUIRES RESET OR POWER CYCLE TO CLEAR THE LATCHED STATE
    V_IN_OK         : out std_logic_vector(3 downto 0)  -- FILTERED VERSION
    );
end FAILSAFES;
architecture architecture_FAILSAFES of FAILSAFES is

  signal L_T_FAULT, N_L_T_FAULT : std_logic;  -- FILTERED AND LATCHED TEMPERATURE FAULT
  signal T_FLT_CNT, N_T_FLT_CNT : integer range 0 to (2**4)-1;  -- COUNT OF OVER-TEMP STATE AT 4 HZ RATE
  constant T_FLT_VAL            : integer range 0 to (2**4)-1 := 15;  -- DECLARE A FAULT IF IT PERSISTS AT LEAST 4 SECONDS

  signal F_V_IN_OK, N_F_V_IN_OK : std_logic_vector(3 downto 0);  -- FILTERED VERSION OF V_IN_OK
  signal V_OK_1CNT, N_V_OK_1CNT : integer range 0 to (2**4)-1;  -- COUNT OF UVL STATE AT 4 HZ RATE
  constant V_OK_VAL             : integer range 0 to (2**4)-1 := 15;  -- DECLARE V_IN IS OK IF IT PERSISTS AT LEAST 4 SECONDS

begin

-- architecture body

-- PROCESS FOR ALL REGISTERS
  REG : process(CLK_5M_GL, MASTER_RST_B)

  begin

    if MASTER_RST_B = '0' then
      L_T_FAULT <= '1';  -- START OUT 'FAULTED' UNTIL OUTPUT IS FILTERED
      T_FLT_CNT <= T_FLT_VAL / 2;       -- SET COUNT TO MID VALUE

      F_V_IN_OK <= "0000";
      V_OK_CNT  <= 0;

    elsif (CLK_5M_GL'event and CLK_5M_GL = '1') then
      L_T_FAULT <= N_L_T_FAULT;
      T_FLT_VAL <= N_T_FLT_VAL;

      F_V_IN_OK <= N_F_V_IN_OK;
      V_OK_CNT  <= N_V_OK_CNT;

    end if;

  end process REG;

-- PROCESS FOR COMBINATORIAL LOGIC THAT PERFORMS THE FILTERING

  FILTCNT : process(TEMP_OK)

  begin

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    -- THIS IS THE COUNTER BEING USED TO FILTER THE OVER-TEMPERATURE BIT
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if MS250_CLK_EN = '1' then          -- UPDATE FAULT COUNTER AT 4 HZ RATE

      if T_FLT_CNT = 0 then  -- CHECK TO SEE IF TERMINAL FAULT COUNT ALREADY ACHIEVED
        N_T_FLT_CNT <= 0;    -- IF ALREADY 0, THEN FAULT STAYS LATCHED

      elsif (TEMP_OK = '1' and T_FLT_CNT < T_FLT_VAL) then  -- COUNT UNTIL FULL TERMINAL COUNT ACHIEVED
        N_T_FLT_CNT <= T_FLT_CNT + 1;

      elsif (TEMP_OK = '0') then  -- COUNT NOT 0, BUT TEMPERATURE NOT OK, SO COUNT DOWN
        N_T_FLT_CNT <= T_FLT_CNT - 1;

      else  -- COUNT MUST BE AT TERMINAL COUNT T_FLT_VAL
        N_T_FLT_CNT <= T_FLT_CNT;

      end if;

    else

      N_T_FLT_CNT <= T_FLT_CNT;

    end if;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    -- THIS IS THE LOGIC USED TO EITHER CLEAR THE INITIAL OR DECLARE AN OVER TEMPERATURE FAULT
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if T_FLT_CNT = 0 then  -- CHECK TO SEE IF TERMINAL FAULT COUNT  ACHIEVED
      N_L_T_FAULT <= '1';               -- KEEP THE DECLARED FAULT SETTING

    elsif (T_FLT_CNT = T_FLT_VAL) then  -- UPPER TERMINAL COUNT ACHIEVED
      N_L_T_FAULT <= '0';               -- SO NO FAULT PRESENT

    else
      N_L_T_FAULT <= L_T_FAULT;  -- NO NEED TO CHANGE THE FAULT SETTING DETECTED

    end if;


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    -- THIS IS THE COUNTER BEING USED TO FILTER THE UNDER VOLTAGE LOCKOUT BIT
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if MS250_CLK_EN = '1' then          -- UPDATE FAULT COUNTER AT 4 HZ RATE

      if V_OK_CNT = 0 then  -- CHECK TO SEE IF TERMINAL FAULT COUNT ALREADY ACHIEVED
        N_V_OK_CNT <= 0;    -- IF ALREADY 0, THEN FAULT STAYS LATCHED

      elsif (TEMP_OK = '1' and V_OK_CNT < T_FLT_VAL) then  -- COUNT UNTIL FULL TERMINAL COUNT ACHIEVED
        N_V_OK_CNT <= V_OK_CNT + 1;

      elsif (TEMP_OK = '0') then  -- COUNT NOT 0, BUT TEMPERATURE NOT OK, SO COUNT DOWN
        N_V_OK_CNT <= V_OK_CNT - 1;

      else  -- COUNT MUST BE AT TERMINAL COUNT T_FLT_VAL
        N_V_OK_CNT <= V_OK_CNT;

      end if;

    else

      N_V_OK_CNT <= V_OK_CNT;

    end if;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    -- THIS IS THE LOGIC USED TO DECLARE THE UNDER VOLTAGE STATUS
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if V_OK_CNT = 0 then   -- CHECK TO SEE IF TERMINAL FAULT COUNT  ACHIEVED
      N_F_V_IN_OK <= '1';               -- KEEP THE DECLARED FAULT SETTING

    elsif (V_OK_CNT = T_FLT_VAL) then   -- UPPER TERMINAL COUNT ACHIEVED
      N_F_V_IN_OK <= '0';               -- SO NO FAULT PRESENT

    else
      N_F_V_IN_OK <= L_T_FAULT;  -- NO NEED TO CHANGE THE FAULT SETTING DETECTED

    end if;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



  end architecture_FAILSAFES;
