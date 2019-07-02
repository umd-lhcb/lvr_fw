--------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MARYLAND
--
-- File: IIR_FILT.vhd
-- File history:
--      <Rev - // Mar 28, 2017  INITIAL
--
-- Description: THIS MODULE PERFORMS A IIR LOW PASS DOUBLE POLE FILTER OF THE INPUT SIGNAL. THERE IS A 2 CLOCK PIPELINE DELAY THAT RESULTS
--              IN A STEP RESPONSE TIME CONSTANT OF ABOUT SEVERAL USEC ASSUMING A 5 MHZ SAMPLE RATE.  THE FULL SETTLE TIME IS <10 USEC.
--                              LASTLY, HYSTERISIS IS APPLIED TO THE FILTERED RESULT USING THE INPUT DEFINED THRESHOLDS.
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
library synplify;
use synplify.attributes.all;

entity IIR_FILT is
  port (
    MASTER_RST_B : in std_logic;  -- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
    CLK_5M_GL    : in std_logic;

    SIG_IN       : in  std_logic_vector(0 downto 0);  -- !!!!! ASSUME THIS SIGNAL IS ALREADY SYNCHRONIZED TO THE 5 MHZ CLOCK !!!!!!!!!
    THRESH_UPPER : in  std_logic_vector(7 downto 0);  -- UPPER HYSTERISIS THRESHOLD (IE RISING SIGNAL THRESHOLD)
    THRESH_LOWER : in  std_logic_vector(7 downto 0);  -- LOWER HYSTERISIS THRESHOLD (IE FALLING SIGNAL THRESHOLD)
    FILT_SIGOUT  : out std_logic_vector(7 downto 0);  -- SIGNAL NUMERIC VALUE FROM THE FILTER FUNCTION 

    P_SIGOUT : out std_logic  -- FINAL SIGNAL BIT VALUE AFTER THE FILTER FUNCTION AND HYSTERISIS HAVE BEEN APPLIED
    );
end IIR_FILT;

architecture RTL of IIR_FILT is






--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  attribute SYN_RADHARDLEVEL of RTL : architecture is "TMR";
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE INTERNAL SIGNALS
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  signal N_SIG_IN_DEL, SIG_IN_DEL : std_logic_vector(0 downto 0);  -- STORE A DELAYED VERSION OF THE INPUT SIGNAL
  signal SUM_IN_A, N_SUM_IN_A     : integer range 0 to 32;  -- MULTIPLY SUM OF INPUT LOGIC BIT AND DELAYED VERSION BY DECIMAL 16
  signal FILT_OUT, N_FILT_OUT     : integer range 0 to 255;  -- UPPER 8 MSB'S OF THE FILTER CALC

  type THRESHOLD_STATE is (INIT, RISING, FALLING, ERR_STATE);  -- DEFINE THE STATES FOR THE MACHINE STATE MANAGEING THE ACTIVE HYSTERISIS THRESHOLD
  signal THRESH_VAL, N_THRESH_VAL : THRESHOLD_STATE;

  signal SIGOUT, N_SIGOUT : std_logic;  -- FINAL OUTPUT BIT AFTER FILTER AND HYSTERISIS APPLIED

begin

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE ALL REGISTERS USED WITH THE 5 MHZ CLOCK
  REG5M : process(CLK_5M_GL, MASTER_RST_B)
  begin
    if MASTER_RST_B = '0' then
      SIG_IN_DEL <= "0";
      SUM_IN_A   <= 0;
      FILT_OUT   <= 0;
      THRESH_VAL <= INIT;
      SIGOUT     <= '0';

    elsif (CLK_5M_GL'event and CLK_5M_GL = '1') then
      SIG_IN_DEL <= N_SIG_IN_DEL;
      SUM_IN_A   <= N_SUM_IN_A;
      FILT_OUT   <= N_FILT_OUT;
      THRESH_VAL <= N_THRESH_VAL;
      SIGOUT     <= N_SIGOUT;

    end if;

  end process;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE THE IIR FILTER
  IIR_FILT : process(SIG_IN, SIG_IN_DEL, FILT_OUT, SUM_IN_A)
    variable TMP_SUM_IN_B : integer range 0 to 32767;

  begin

    N_SIG_IN_DEL <= SIG_IN;

    N_SUM_IN_A <= (CONV_INTEGER(SIG_IN) + CONV_INTEGER(SIG_IN_DEL)) * 16;

    TMP_SUM_IN_B := FILT_OUT * 3;
    TMP_SUM_IN_B := TMP_SUM_IN_B / 4;
    N_FILT_OUT   <= (SUM_IN_A) + TMP_SUM_IN_B;
  end process;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE THE HYSTERISIS FUNCTION
-- 
  HYSTERISIS : process(THRESH_VAL, FILT_OUT, SIGOUT, THRESH_LOWER, THRESH_UPPER)
  begin

    case THRESH_VAL is
      when INIT =>  -- ASSUME FIRST EVER TRANSITION FROM MUST BE FROM LOW TO HIGH (HOPEFULLY THE FRAME START BIT!)
        if FILT_OUT > THRESH_UPPER then
          N_SIGOUT     <= '1';
          N_THRESH_VAL <= FALLING;
        else
          N_SIGOUT     <= '0';
          N_THRESH_VAL <= INIT;
        end if;

      when RISING =>
        if FILT_OUT > THRESH_UPPER then
          N_SIGOUT     <= '1';
          N_THRESH_VAL <= FALLING;
        else
          N_SIGOUT     <= SIGOUT;
          N_THRESH_VAL <= THRESH_VAL;
        end if;

      when FALLING =>
        if FILT_OUT < THRESH_LOWER then
          N_SIGOUT     <= '0';
          N_THRESH_VAL <= RISING;
        else
          N_SIGOUT     <= SIGOUT;
          N_THRESH_VAL <= THRESH_VAL;
        end if;

      when ERR_STATE =>
        N_THRESH_VAL <= INIT;  -- GOT HERE BY ERROR (NEED 4 STATES (IE POWER OF 2) SINCE 'OTHERS' NOT ALWAYS A RELIABLE FAULT HANDLER)
        N_SIGOUT     <= SIGOUT;         -- DEFAULT ASSIGNMENT

    end case;

  end process;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ASSIGN INTERNAL SIGNALS TO EXTERNAL PORTS
  FILT_SIGOUT <= CONV_STD_LOGIC_VECTOR(FILT_OUT, 8);
  P_SIGOUT    <= SIGOUT;


end RTL;
