--------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MARYLAND
--
-- File: SPECTEST_DET_CHANGE.vhd
-- File history:
--      <Rev - // MAY 6, 2017  INITIAL
--
-- Description: THIS IS A SPECIAL TEST SUPPORT MOPDULE.  IT IS A MODULO THREE COUNTER THAT INCREMENTS WHENEVER A CHANGE IN ANY BIT WITHIN 
---				THE INPUT WORD IS DETECTED.

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


entity SPECTEST_DET_CHANGE is
port (
		MASTER_RST_B		:	IN	STD_LOGIC;							-- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
		CLK_5M_GL			:	IN	STD_LOGIC;							-- MASTER 5 MHZ CLOCK
		
		COMPLETED_MAIN_SEQ	:	IN	STD_LOGIC;							-- PULSE INDICATES THAT A FULL PASS THRU THE MAIN SEQUENCE HAS BEEN COMPLETED

		CH_MREG_EN_B		:	IN	STD_LOGIC_VECTOR(7 DOWNTO 0);		-- CHANNEL ENABLE SIGNALS: MAIN REGULATOR IC, ACTIVE LOW
		CH_IAUX_EN			:	IN	STD_LOGIC_VECTOR(7 DOWNTO 0);		-- CHANNEL ENABLE SIGNALS: IAUX REGULATOR IC, ACTIVE HIGH
		CH_VOSG_EN			:	IN	STD_LOGIC_VECTOR(7 DOWNTO 0);		-- CHANNEL ENABLE SIGNALS: VOS_GEN REGULATOR IC, ACTIVE HIGH
		
		P_MOD3_CNT			:	OUT STD_LOGIC_VECTOR(1 DOWNTO 0)		-- MODULO 3 COUNT OF DETECTED STATE CHANGES IN ANY OF THE 24 REGULATOR CHANNEL ENABLE SIGNALS
	 );
end SPECTEST_DET_CHANGE;

architecture RTL of SPECTEST_DET_CHANGE is
ATTRIBUTE SYN_RADHARDLEVEL OF RTL : ARCHITECTURE IS "TMR";

SIGNAL N_MOD3_CNTR, MOD3_CNTR					:	STD_LOGIC_VECTOR(1 DOWNTO 0);	-- MODULO 3 COUNTER
SIGNAL N_PREV_WORD_STATE, PREV_WORD_STATE		:	STD_LOGIC_VECTOR(23 DOWNTO 0);	-- LATCHED AND CONCATINATED VERSION OF THE 3 THREE DIFFERENT CHANNEL ENABLE BYTES

-- DEFINE THE STATES FOR THE STATE MACHINE USED TO DETECT CHANGES IN THE 24 ENABLE SIGNALS
TYPE DET_SM_STATES IS( INIT, START_CHECKS );
SIGNAL DET_SM, N_DET_SM		:	DET_SM_STATES;

begin

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE ALL REGISTERS USED WITH THE 5 MHZ CLOCK
REG:PROCESS(CLK_5M_GL, MASTER_RST_B)
	BEGIN
		IF MASTER_RST_B = '0' THEN
			MOD3_CNTR				<=	"00";
			PREV_WORD_STATE			<=	(OTHERS	=>	'0');
			DET_SM					<=	INIT;
			
		ELSIF (CLK_5M_GL'EVENT AND CLK_5M_GL='1') THEN
			MOD3_CNTR				<=	N_MOD3_CNTR;
			PREV_WORD_STATE			<=	N_PREV_WORD_STATE;
			DET_SM					<=	N_DET_SM
		
		END IF;
		
	END PROCESS;
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE PROCESS THAT DETECTS CHANGES TO THE STATE OF THE ENABLE BITS
DET_CHANGE:PROCESS()
	BEGIN
	
		N_PREV_WORD_STATE	<=	CH_MREG_EN_B & CH_IAUX_EN & CH_VOSG_EN;						-- SAVE A COPY OF ALL 24 ENABLE BITS
	
	
		CASE DET_SM IS

			WHEN INIT			=>				
				N_MOD3_CNTR			<=	"00";												-- INITIALIZE THE MODULO 3 COUNTER
				
				IF COMPLETED_MAIN_SEQ = '1'  THEN											-- WAIT HERE UNTIL THE ENABLE OUTPUTS HAVE BEEN PROGRAMMED 
					N_DET_CHANGE		<=	START_CHECKS;
				ELSE
					N_DET_CHANGE		<=	INIT;
				END IF;
				
			WHEN START_CHECKS	=>															-- START CONTINUOUS CHECKS OF BIT FLIPS
				N_DET_CHANGE		<=	START_CHECKS;										-- STAY HERE ESSENTUALLY UNTIL A RESET
			
				IF PREV_WORD_STATE	= CH_MREG_EN_B & CH_IAUX_EN & CH_VOSG_EN	THEN
					N_MOD3_CNTR		<=	MOD3_CNTR;											-- NO CHANGE DETECTED
				ELSE
					N_MOD3_CNTR		<=	MOD3_CNTR + "1";									-- CHANGE DETECTED, SO INCREMENT THE MODOLU THREE COUNTER
				END IF;
		
		END CASE;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ASSIGN INTERNAL SIGNALS TO EXTERNAL PORTS
P_MOD3_CNTR			<=	MOD3_CNTR;

end RTL;
