--------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MARYLAND, College Park. 
--
-- File: SLOW_PULSE_EN_GEN.vhd
-- File history:
--      Rev 1.0: 7-29-2013: INITIAL BUILD
--      REV 2.0: 5-6-2017: MODIFIED TO RE-USE WITH A 5 MHZ MASTER CLOCK IN A3PNXXX DEVICE
--      REV 3.0: 2-14-2019: MODIFIED TO OUTPUT PERIOD OF 250 MSEC
--
-- Description: 
--
-- This module generates a single output pulse for every elapsed 1 second interval whenever it is enabled.  The output pulses are 
-- 1 clock period wide.
--
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

entity SLOW_PULSE_EN_GEN is
  port (
    CLK_5M_GL    : in std_logic;  -- FPGA MASTER CLOCK--ASSUMED TO BE 5 MHZ
    MASTER_RST_B : in std_logic;        -- ACTIVE LOW RESET
    CNT_EN       : in std_logic;        -- ACTIVE HIGH COUNT ENABLE
    SIM_25KX     : in std_logic;  -- SPECIAL SIM MODE--SPEEDS UP BY 25,000 TIMES (250 MSEC=10USEC)

    MS250_CLK_EN : out std_logic  -- OUTPUT PULSE SIGNIFIES 250 MSEC INTERVAL--SUITABLE FOR USE AS A CLOCK ENABLE.
    );
end SLOW_PULSE_EN_GEN;

architecture RTL of SLOW_PULSE_EN_GEN is

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--ATTRIBUTE SYN_RADHARDLEVEL OF RTL : ARCHITECTURE IS "TMR";
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


  signal MS250_CLK_EN_SIG, N_MS250_CLK_EN_SIG : std_logic;  -- INTERNAL SIGNAL COPY SENT TO THE PORT
  signal CNT_VAL, N_CNT_VAL                   : integer range 0 to (2**21)-1;  -- COUNTER REGISTER

-- NORMAL 1 SEC COUNT TERMINAL VALUE
  constant MS250_CNT : integer range 0 to (2**21)-1 := 1249999;

-- SPECIAL SIM MODE GENERATES A 10 MICROSECOND COUNT TERMINAL VALUE
  constant SIM_CNT : integer range 0 to (2**21)-1 := 49;

begin

-- PROCESS FOR ALL REGISTERS
  REG : process(CLK_5M_GL, MASTER_RST_B)

  begin

    if MASTER_RST_B = '0' then
      MS250_CLK_EN_SIG <= '0';
      CNT_VAL          <= 0;

    elsif (CLK_5M_GL'event and CLK_5M_GL = '1') then
      MS250_CLK_EN_SIG <= N_MS250_CLK_EN_SIG;
      CNT_VAL          <= N_CNT_VAL;

    end if;

  end process REG;

-- PROCESS FOR COMBINATORIAL LOGIC THAT CREATES THE TIMEOUT INTERVAL 250 MICROSECOND (10 USEC FOR SIM MODE)
  MS250 : process(CNT_VAL, SIM_25KX, CNT_EN)

    variable TERM_CNT_VAL : integer range 0 to (2**21)-1;

  begin

    if SIM_25KX = '1' then              -- USE SIM_25KX TO SELECT EITHER:
      TERM_CNT_VAL := SIM_CNT;          -- THE SPECIAL SIM MODE TERMINAL COUNT
    else                                -- OR
      TERM_CNT_VAL := MS250_CNT;        -- THE NORMAL OP MODE TERMINAL COUNT
    end if;


    if (CNT_EN = '0') then              -- CHECK FOR DISABLED COUNTER FIRST
      N_CNT_VAL          <= 0;          -- KEEP COUNT VALUE RESET WHEN DISABLED
      N_MS250_CLK_EN_SIG <= '0';  -- KEEP TIMEOUT CLOCK EANBLE SIGNAL CLEARED AS WELL

    elsif (CNT_VAL < TERM_CNT_VAL) then  -- CHECK THE SPECIFIED TERMINAL COUNT LIMIT
      N_CNT_VAL          <= CNT_VAL + 1;  -- KEEP COUNTING IF NOT AT TERMINAL COUNT VALUE
      N_MS250_CLK_EN_SIG <= '0';

    else                                -- TIMEOUT ACHIEVED
      N_CNT_VAL          <= 0;          -- SO CLEAR THE COUNTER VALUE
      N_MS250_CLK_EN_SIG <= '1';  -- PULSE THE TIMEOUT SIGNAL FOR 1 CLOCK PERIOD

    end if;

  end process MS250;

-- SEND A COPY OF THE INTERNAL SIGNAL TO THE ENTITY OUTPUT PORT
  MS250_CLK_EN <= MS250_CLK_EN_SIG;

end RTL;
