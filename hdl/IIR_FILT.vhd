--------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MARYLAND
--
-- File: IIR_FILT.vhd
-- File history:
--      <Rev - // Mar 28, 2017  INITIAL
--
-- Description: THIS MODULE PERFORMS A IIR LOW PASS DOUBLE POLE FILTER OF THE INPUT SIGNAL. THERE IS A 2 CLOCK PIPELINE DELAY THAT RESULTS
--            	IN A STEP RESPONSE TIME CONSTANT OF ABOUT SEVERAL USEC ASSUMING A 5 MHZ SAMPLE RATE.  THE FULL SETTLE TIME IS <10 USEC.
-- 				LASTLY, HYSTERISIS IS APPLIED TO THE FILTERED RESULT USING THE INPUT DEFINED THRESHOLDS.
--
-- Targeted device: <Family::ProASIC3> <Die::A3PN125> <Package::100 VQFP>
-- Author: TOM O'BANNON
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_MISC.ALL;
--USE IEEE.NUMERIC_STD.ALL;

library proasic3;
use proasic3.all;

-- NOTE:  THE SYNPLIFY LIBRARY NEEDS TO BE COMMENTED OUT FOR MODELSIM PRESYNTH SIMS SINCE MODELSIM DOES NOT RECOGNIZE IT
library synplify;
use synplify.attributes.all;

entity IIR_FILT is
port (
		MASTER_RST_B		:	IN	STD_LOGIC;							-- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
		CLK_5M_GL			:	IN	STD_LOGIC;
		
		SIG_IN				:	IN	STD_LOGIC_VECTOR(0 DOWNTO 0);		-- !!!!! ASSUME THIS SIGNAL IS ALREADY SYNCHRONIZED TO THE 5 MHZ CLOCK !!!!!!!!!
		THRESH_UPPER		:	IN	STD_LOGIC_VECTOR(7 DOWNTO 0);		-- UPPER HYSTERISIS THRESHOLD (IE RISING SIGNAL THRESHOLD)
		THRESH_LOWER		:	IN	STD_LOGIC_VECTOR(7 DOWNTO 0);		-- LOWER HYSTERISIS THRESHOLD (IE FALLING SIGNAL THRESHOLD)
		FILT_SIGOUT			:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);		-- SIGNAL NUMERIC VALUE FROM THE FILTER FUNCTION 

		P_SIGOUT			:	OUT	STD_LOGIC							-- FINAL SIGNAL BIT VALUE AFTER THE FILTER FUNCTION AND HYSTERISIS HAVE BEEN APPLIED
	);
end IIR_FILT;

architecture RTL of IIR_FILT is



	


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 ATTRIBUTE SYN_RADHARDLEVEL OF RTL : ARCHITECTURE IS "TMR";
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE INTERNAL SIGNALS
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

SIGNAL	N_SIG_IN_DEL, SIG_IN_DEL		:	STD_LOGIC_VECTOR(0 DOWNTO 0);				-- STORE A DELAYED VERSION OF THE INPUT SIGNAL
SIGNAL	SUM_IN_A, N_SUM_IN_A			: 	INTEGER RANGE 0 TO 32;						-- MULTIPLY SUM OF INPUT LOGIC BIT AND DELAYED VERSION BY DECIMAL 16
SIGNAL	FILT_OUT, N_FILT_OUT			: 	INTEGER RANGE 0 TO 255;						-- UPPER 8 MSB'S OF THE FILTER CALC

TYPE THRESHOLD_STATE	IS (INIT, RISING, FALLING, ERR_STATE);							-- DEFINE THE STATES FOR THE MACHINE STATE MANAGEING THE ACTIVE HYSTERISIS THRESHOLD
SIGNAL THRESH_VAL, N_THRESH_VAL			:	THRESHOLD_STATE ;

SIGNAL	SIGOUT, N_SIGOUT				: STD_LOGIC;									-- FINAL OUTPUT BIT AFTER FILTER AND HYSTERISIS APPLIED

begin

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE ALL REGISTERS USED WITH THE 5 MHZ CLOCK
REG5M:PROCESS(CLK_5M_GL, MASTER_RST_B)	
	BEGIN
		IF MASTER_RST_B = '0' THEN
			SIG_IN_DEL	<=	 "0";
			SUM_IN_A	<=	  0;
			FILT_OUT	<=	  0;
			THRESH_VAL	<=	INIT;
			SIGOUT		<=	 '0';
			
		ELSIF (CLK_5M_GL'EVENT AND CLK_5M_GL='1') THEN
			SIG_IN_DEL	<=	N_SIG_IN_DEL;
			SUM_IN_A	<=	N_SUM_IN_A;
			FILT_OUT	<=	N_FILT_OUT;
			THRESH_VAL	<=	N_THRESH_VAL;
			SIGOUT		<=	N_SIGOUT;
		
		END IF;
		
	END PROCESS;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE THE IIR FILTER
IIR_FILT:PROCESS(SIG_IN, SIG_IN_DEL, FILT_OUT, SUM_IN_A)
	VARIABLE TMP_SUM_IN_B	: INTEGER RANGE 0 TO 32767;

	BEGIN
	
		N_SIG_IN_DEL	<=	SIG_IN;
	
		N_SUM_IN_A		<=	(CONV_INTEGER(SIG_IN) + CONV_INTEGER(SIG_IN_DEL) ) * 16;
		
		TMP_SUM_IN_B	:=	FILT_OUT * 3;
		TMP_SUM_IN_B	:=	TMP_SUM_IN_B / 4;
		N_FILT_OUT		<=	( SUM_IN_A ) + TMP_SUM_IN_B;
	END PROCESS;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE THE HYSTERISIS FUNCTION
-- 
HYSTERISIS:PROCESS(THRESH_VAL, FILT_OUT, SIGOUT, THRESH_LOWER, THRESH_UPPER)
	BEGIN
		
		CASE THRESH_VAL IS
			WHEN INIT 		=>							-- ASSUME FIRST EVER TRANSITION FROM MUST BE FROM LOW TO HIGH (HOPEFULLY THE FRAME START BIT!)
				IF FILT_OUT		> THRESH_UPPER	THEN
					N_SIGOUT		<=	'1';
					N_THRESH_VAL	<=	FALLING;
				ELSE
					N_SIGOUT		<=	'0';
					N_THRESH_VAL	<=	INIT;				
				END IF;
		
			WHEN RISING 	=>
				IF FILT_OUT		> THRESH_UPPER	THEN
					N_SIGOUT		<=	'1';
					N_THRESH_VAL	<=	FALLING;
				ELSE
					N_SIGOUT		<=	SIGOUT;
					N_THRESH_VAL	<=	THRESH_VAL;				
				END IF;
			
			WHEN FALLING 	=>
				IF FILT_OUT		< THRESH_LOWER	THEN
					N_SIGOUT		<=	'0';
					N_THRESH_VAL	<=	RISING;
				ELSE
					N_SIGOUT		<=	SIGOUT;
					N_THRESH_VAL	<=	THRESH_VAL;				
				END IF;
			
			WHEN ERR_STATE	=>
					N_THRESH_VAL	<=	INIT;				-- GOT HERE BY ERROR (NEED 4 STATES (IE POWER OF 2) SINCE 'OTHERS' NOT ALWAYS A RELIABLE FAULT HANDLER)
					N_SIGOUT		<=	SIGOUT;				-- DEFAULT ASSIGNMENT
				
		END CASE;
		
	END PROCESS;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ASSIGN INTERNAL SIGNALS TO EXTERNAL PORTS
FILT_SIGOUT		<=	CONV_STD_LOGIC_VECTOR(FILT_OUT, 8);
P_SIGOUT		<=	SIGOUT;

		
end RTL;
