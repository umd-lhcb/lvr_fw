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
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_MISC.ALL;
--USE IEEE.NUMERIC_STD.ALL;

library proasic3;
use proasic3.all;

-- NOTE:  THE SYNPLIFY LIBRARY NEEDS TO BE COMMENTED OUT FOR MODELSIM PRESYNTH SIMS SINCE MODELSIM DOES NOT RECOGNIZE IT
library synplify;
use synplify.attributes.all;

entity SLOW_PULSE_EN_GEN is
	port 	(
    		CLK_5M_GL			:	IN	STD_LOGIC;			-- FPGA MASTER CLOCK--ASSUMED TO BE 5 MHZ
    		MASTER_RST_B		:	IN	STD_LOGIC;			-- ACTIVE LOW RESET
			CNT_EN				:	IN	STD_LOGIC;			-- ACTIVE HIGH COUNT ENABLE
			SIM_25KX			:	IN	STD_LOGIC;			-- SPECIAL SIM MODE--SPEEDS UP BY 25,000 TIMES (250 MSEC=10USEC)

    		MS250_CLK_EN		:	OUT	STD_LOGIC			-- OUTPUT PULSE SIGNIFIES 250 MSEC INTERVAL--SUITABLE FOR USE AS A CLOCK ENABLE.
			);
end SLOW_PULSE_EN_GEN;

architecture RTL of SLOW_PULSE_EN_GEN is

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ATTRIBUTE SYN_RADHARDLEVEL OF RTL : ARCHITECTURE IS "TMR";
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


	SIGNAL	MS250_CLK_EN_SIG, N_MS250_CLK_EN_SIG		:	STD_LOGIC;						-- INTERNAL SIGNAL COPY SENT TO THE PORT
	SIGNAL	CNT_VAL, N_CNT_VAL							:	INTEGER RANGE 0 TO (2**21)-1 ;	-- COUNTER REGISTER

-- NORMAL 1 SEC COUNT TERMINAL VALUE
	CONSTANT	MS250_CNT								:	INTEGER RANGE 0 TO (2**21)-1	:=	1249999;	

-- SPECIAL SIM MODE GENERATES A 10 MICROSECOND COUNT TERMINAL VALUE
	CONSTANT	SIM_CNT									:	INTEGER RANGE 0 TO (2**21)-1	:=	49;

begin

-- PROCESS FOR ALL REGISTERS
	REG:PROCESS(CLK_5M_GL, MASTER_RST_B)
		
		BEGIN

		IF MASTER_RST_B	= '0'	THEN
			MS250_CLK_EN_SIG	<=	'0';
			CNT_VAL				<=	 0 ;

		ELSIF (CLK_5M_GL'EVENT AND CLK_5M_GL='1')	THEN
			MS250_CLK_EN_SIG	<=	N_MS250_CLK_EN_SIG;
			CNT_VAL				<=	N_CNT_VAL;

		END IF;

		END PROCESS REG;

-- PROCESS FOR COMBINATORIAL LOGIC THAT CREATES THE TIMEOUT INTERVAL 250 MICROSECOND (10 USEC FOR SIM MODE)
	MS250:PROCESS(CNT_VAL, SIM_25KX, CNT_EN)

		VARIABLE TERM_CNT_VAL	:	INTEGER RANGE 0 TO (2**21)-1;

		BEGIN
			
			IF SIM_25KX = '1' THEN 										-- USE SIM_25KX TO SELECT EITHER:
				TERM_CNT_VAL := SIM_CNT;								-- THE SPECIAL SIM MODE TERMINAL COUNT
			ELSE														-- OR
				TERM_CNT_VAL := MS250_CNT;								-- THE NORMAL OP MODE TERMINAL COUNT
			END IF;
			
						
			IF 		(CNT_EN = '0' )				THEN					-- CHECK FOR DISABLED COUNTER FIRST
				N_CNT_VAL				<=	 0;							-- KEEP COUNT VALUE RESET WHEN DISABLED
				N_MS250_CLK_EN_SIG		<=	'0';						-- KEEP TIMEOUT CLOCK EANBLE SIGNAL CLEARED AS WELL

			ELSIF 	(CNT_VAL < TERM_CNT_VAL)	THEN					-- CHECK THE SPECIFIED TERMINAL COUNT LIMIT
				N_CNT_VAL				<=	CNT_VAL + 1;				-- KEEP COUNTING IF NOT AT TERMINAL COUNT VALUE
				N_MS250_CLK_EN_SIG		<=	'0';

			ELSE														-- TIMEOUT ACHIEVED
				N_CNT_VAL				<=	 0;							-- SO CLEAR THE COUNTER VALUE
				N_MS250_CLK_EN_SIG		<=	'1';						-- PULSE THE TIMEOUT SIGNAL FOR 1 CLOCK PERIOD

			END IF;
		
		END PROCESS MS250;

-- SEND A COPY OF THE INTERNAL SIGNAL TO THE ENTITY OUTPUT PORT
MS250_CLK_EN	<=	MS250_CLK_EN_SIG;

end RTL;
