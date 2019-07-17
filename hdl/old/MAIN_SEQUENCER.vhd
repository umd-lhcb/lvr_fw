--------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MARYLAND
--
-- File: MAIN_SEQUENCER.vhd
-- File history:
--      <Rev - // Mar 30, 2017  INITIAL
--
-- Description: THIS MOUDULE IS THE MAIN COMMUNICATION AND CONTROL SEQUENCER
---					FRAME PACKET CONSISTS OF 16 BITS + 2 START AND 2 STOP BITS.
--					LSB ASSUMED FIRST
--					THE START AND STOP BITS ARE ALL LOGIC '1'
--					15		ODD PARITY (APPLIES TO 15 DATA BITS ONLY (14:0) AND CHECKED BY THE SERIAL_RX_MODULE)
--					14		TBD
--					13..12	MODE 
--					11..8	MODULE ADDRESS
--					7..0	CHANNEL ENABLES
--		
--					THE SEQUENCER WAITS FOR A SER_WORD_STB BEFORE PROCEEDING:
--					IF ABOVE TRUE, THEN THE NEW MASTER CHANNEL ENABLE BYTE IS LATCHED.
--					THE SEQUENCER THEN SEQUENTIALLY ENABLES EACH CHANNEL FROM FROM LSB TO MSB ORDER.  
--					EACH CHANNEL ENABLE REQUIRES 3 DELAY STEPS THAT ARE EACH 2^^32 X 200 NS = 6.5536 MSEC (19.66MSEC)

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

entity MAIN_SEQUENCER is
port (
		MASTER_RST_B			:	IN	STD_LOGIC;							-- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
		CLK_5M_GL				:	IN	STD_LOGIC;							-- MASTER 5 MHZ CLOCK
		
		SIGOUT_VOP_UVL			:	IN	STD_LOGIC;							-- UNDER-VOLTAGE LOCKOUT FAILSAFE ('1' = V_OP_RAIL FELL BELOW THE THRESHOLD)

		REGISTER_CH_CMD_EN		:	IN	STD_LOGIC_VECTOR(7 DOWNTO 0);		-- REGISTER CHANNEL COMMAND ENABLES
		SER_WORD_STB			:	IN	STD_LOGIC;							-- SINGLE CLOCK PULSE STROBE INDICATES AN UPDATED SERIAL WORD
		
		STDBY_OP_B				:	IN	STD_LOGIC;							-- '1' = FORCED V_OS OUTPUT ENABLED, '0' = NORMAL V_OS TIMING STEP
		
		P_CH_MREG_EN			:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);		-- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
		P_CH_IAUX_EN			:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);		-- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
		P_CH_VOSG_EN			:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);		-- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH
		
		P_COMPLETED_SEQ			:	OUT	STD_LOGIC;							-- PULSE INDICATES SEQUENCE COMPLETED
		
		CH_ACTIVE_STAT			:	OUT	STD_LOGIC							-- '1' INDICATES AT LEAST ONE CHANNEL ACTIVE
	);
end MAIN_SEQUENCER;

architecture RTL of MAIN_SEQUENCER is

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ATTRIBUTE SYN_RADHARDLEVEL OF RTL : ARCHITECTURE IS "TMR";
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE INTERNAL SIGNALS
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- DEFINE THE STATES FOR THE MACHINE STATE MANAGEING THE ACTIVE HYSTERISIS THRESHOLD
TYPE SEQ_SM_STATES	IS (
							INIT, TEST_CH0_EN,  TEST_CH1_EN, TEST_CH2_EN, TEST_CH3_EN, TEST_CH4_EN, TEST_CH5_EN, TEST_CH6_EN, TEST_CH7_EN, 
							CH_1ST_STEP, CH_2ND_STEP, CH_3RD_STEP, SEQ_DONE, HOLD_AT_UVL, CHK_IF_UVL_CLEAR
						);															
SIGNAL SEQUENCER_STATE, N_SEQUENCER_STATE			: SEQ_SM_STATES ;
SIGNAL RET_STATE, N_RET_STATE						: SEQ_SM_STATES ;

SIGNAL	N_NEW_M_CH_EN, NEW_M_CH_EN					: STD_LOGIC_VECTOR(7 DOWNTO 0);			-- COPY THE CHANNEL ENABLE UPDATE TO 'NEW
SIGNAL	N_OP_M_CH_EN, OP_M_CH_EN					: STD_LOGIC_VECTOR(7 DOWNTO 0);			-- THIS IS THE PRESENT OPERATING CHANNEL ENABLE STATES

SIGNAL	N_CH_MREG_EN, CH_MREG_EN					: STD_LOGIC_VECTOR(7 DOWNTO 0);			-- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
SIGNAL	N_CH_IAUX_EN, CH_IAUX_EN					: STD_LOGIC_VECTOR(7 DOWNTO 0);			-- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
SIGNAL	N_CH_VOSG_EN, CH_VOSG_EN					: STD_LOGIC_VECTOR(7 DOWNTO 0);			-- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

SIGNAL	N_CH_ID, CH_ID								: INTEGER RANGE 0 TO 7;					-- CHANNEL ID

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SIGNAL	N_DEL_CNTR, DEL_CNTR						: INTEGER RANGE 0 TO (2**15) - 1;					-- DELAY INTERVAL COUNTER
CONSTANT DEL_CNT_VAL								: INTEGER RANGE 0 TO (2**15) - 1 := (2**15) - 1;	-- MAX DELAY COUNTER RELOAD VALUE
-- SPECIAL SIM MODE CONSTANT
-- CONSTANT DEL_CNT_VAL							: INTEGER RANGE 0 TO (2**15) - 1 := (2**5) - 1;		-- MAX DELAY COUNTER RELOAD VALUE FOR SPECIAL SIM MODE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

SIGNAL  N_COMPLETED_SEQ, COMPLETED_SEQ				: STD_LOGIC;							-- PLSE INDICATES SEQUENCE WAS COMPLETED

begin

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE ALL REGISTERS USED WITH THE 5 MHZ CLOCK
REG5M:PROCESS(CLK_5M_GL, MASTER_RST_B)	
	BEGIN
		IF MASTER_RST_B = '0' THEN
			SEQUENCER_STATE			<=	INIT;
			NEW_M_CH_EN				<=	(OTHERS => '0');									-- DEFAULT CASE IS NO CHANNELS ENABLED
			OP_M_CH_EN				<=	(OTHERS => '0');									-- DEFAULT CASE IS NO OPERATING CHANNELS ENABLED
			CH_MREG_EN				<=	(OTHERS => '0');									-- DEFAULT CASE IS OFF
			CH_IAUX_EN				<=	(OTHERS => '0');									-- DEFAULT CASE IS OFF
			CH_VOSG_EN				<=	(OTHERS => '0');									-- DEFAULT CASE IS OFF
			CH_ID					<=	0;
			RET_STATE				<=	INIT;
			DEL_CNTR				<=	DEL_CNT_VAL;
			COMPLETED_SEQ			<=	'0';
			
		ELSIF (CLK_5M_GL'EVENT AND CLK_5M_GL='1') THEN
			SEQUENCER_STATE			<=	N_SEQUENCER_STATE;
			NEW_M_CH_EN				<=	N_NEW_M_CH_EN;
			OP_M_CH_EN				<=	N_OP_M_CH_EN;
			CH_MREG_EN				<=	N_CH_MREG_EN;
			CH_IAUX_EN				<=	N_CH_IAUX_EN;
			CH_VOSG_EN				<=	N_CH_VOSG_EN;
			CH_ID					<=	N_CH_ID;
			RET_STATE				<=	N_RET_STATE;	
			DEL_CNTR				<=	N_DEL_CNTR;
			COMPLETED_SEQ			<=	N_COMPLETED_SEQ;
		
		END IF;
		
	END PROCESS;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- INSTANTIATE THE MAIN SEQUENCER AND CONTROL MODULE
MAIN_SEQUENCER:PROCESS(	SEQUENCER_STATE, SER_WORD_STB, RET_STATE, DEL_CNTR, CH_ID, CH_VOSG_EN, CH_IAUX_EN, CH_MREG_EN, 
						REGISTER_CH_CMD_EN, NEW_M_CH_EN, OP_M_CH_EN, SIGOUT_VOP_UVL, STDBY_OP_B )
	BEGIN
	-- DEFAULT ASSIGNMENTS GET OVERRIDEN BELOW AS NEEDED
		N_NEW_M_CH_EN		<=	NEW_M_CH_EN;
		N_OP_M_CH_EN		<=	OP_M_CH_EN;

		N_CH_MREG_EN		<=	CH_MREG_EN;
		N_CH_IAUX_EN		<=	CH_IAUX_EN;
		N_CH_VOSG_EN		<=	CH_VOSG_EN;
		N_CH_ID				<=	CH_ID;
		N_RET_STATE			<=	RET_STATE;
		N_DEL_CNTR			<=	DEL_CNTR;
		
		N_COMPLETED_SEQ		<=	'0';
	
		CASE SEQUENCER_STATE IS
		
			WHEN INIT 			=>															--
				IF SER_WORD_STB = '1' THEN													-- WAIT HERE UNTIL A NEW SERIAL WORD ARRIVES	
					N_NEW_M_CH_EN			<=	REGISTER_CH_CMD_EN(7 DOWNTO 0);
					N_SEQUENCER_STATE		<=	TEST_CH0_EN;
				ELSE
					N_SEQUENCER_STATE		<=	INIT;
				END IF;
				
				N_DEL_CNTR			<=	DEL_CNT_VAL;										-- RE-INITIALIZE THE DELAY COUNTER

			WHEN TEST_CH0_EN	=>	
				IF NEW_M_CH_EN(0) = OP_M_CH_EN(0)		THEN								-- DO NOTHING IF NO CHANGE REQUESTED
					N_SEQUENCER_STATE		<=	TEST_CH1_EN;

				ELSIF NEW_M_CH_EN(0) = 	'0'				THEN								-- TURN OFF THE CHANNEL IMMEDIATELY
					N_CH_MREG_EN(0)			<=	'0';
					N_CH_IAUX_EN(0)			<=	'0';
					N_CH_VOSG_EN(0)			<=	'1';
					N_SEQUENCER_STATE		<=	TEST_CH1_EN;

				ELSE																		-- INVOLKE SEQUENCE STEPS TO TURN ON THE CHANNEL
					N_SEQUENCER_STATE		<=	CH_1ST_STEP;
					N_CH_ID					<=  0;
					N_RET_STATE				<=	TEST_CH1_EN;
				END IF;

			WHEN TEST_CH1_EN	=>	
				IF NEW_M_CH_EN(1) = OP_M_CH_EN(1)		THEN								-- DO NOTHING IF NO CHANGE REQUESTED
					N_SEQUENCER_STATE		<=	TEST_CH2_EN;

				ELSIF NEW_M_CH_EN(1) = 	'0'				THEN								-- TURN OFF THE CHANNEL IMMEDIATELY
					N_CH_MREG_EN(1)			<=	'0';
					N_CH_IAUX_EN(1)			<=	'0';
					N_CH_VOSG_EN(1)			<=	'1';
					N_SEQUENCER_STATE		<=	TEST_CH2_EN;

				ELSE																		-- INVOLKE SEQUENCE STEPS TO TURN ON THE CHANNEL
					N_SEQUENCER_STATE		<=	CH_1ST_STEP;
					N_CH_ID					<=  1;
					N_RET_STATE				<=	TEST_CH2_EN;
				END IF;

			WHEN TEST_CH2_EN	=>	
				IF NEW_M_CH_EN(2) = OP_M_CH_EN(2)		THEN								-- DO NOTHING IF NO CHANGE REQUESTED
					N_SEQUENCER_STATE		<=	TEST_CH3_EN;

				ELSIF NEW_M_CH_EN(2) = 	'0'				THEN								-- TURN OFF THE CHANNEL IMMEDIATELY
					N_CH_MREG_EN(2)			<=	'0';
					N_CH_IAUX_EN(2)			<=	'0';
					N_CH_VOSG_EN(2)			<=	'1';
					N_SEQUENCER_STATE		<=	TEST_CH3_EN;

				ELSE																		-- INVOLKE SEQUENCE STEPS TO TURN ON THE CHANNEL
					N_SEQUENCER_STATE		<=	CH_1ST_STEP;
					N_CH_ID					<=  2;
					N_RET_STATE				<=	TEST_CH3_EN;
				END IF;

			WHEN TEST_CH3_EN	=>	
				IF NEW_M_CH_EN(3) = OP_M_CH_EN(3)		THEN								-- DO NOTHING IF NO CHANGE REQUESTED
					N_SEQUENCER_STATE		<=	TEST_CH4_EN;

				ELSIF NEW_M_CH_EN(3) = 	'0'				THEN								-- TURN OFF THE CHANNEL IMMEDIATELY
					N_CH_MREG_EN(3)			<=	'0';
					N_CH_IAUX_EN(3)			<=	'0';
					N_CH_VOSG_EN(3)			<=	'1';
					N_SEQUENCER_STATE		<=	TEST_CH4_EN;

				ELSE																		-- INVOLKE SEQUENCE STEPS TO TURN ON THE CHANNEL
					N_SEQUENCER_STATE		<=	CH_1ST_STEP;
					N_CH_ID					<=  3;
					N_RET_STATE				<=	TEST_CH4_EN;
				END IF;

			WHEN TEST_CH4_EN	=>	
				IF NEW_M_CH_EN(4) = OP_M_CH_EN(4)		THEN								-- DO NOTHING IF NO CHANGE REQUESTED
					N_SEQUENCER_STATE		<=	TEST_CH5_EN;

				ELSIF NEW_M_CH_EN(4) = 	'0'				THEN								-- TURN OFF THE CHANNEL IMMEDIATELY
					N_CH_MREG_EN(4)			<=	'0';
					N_CH_IAUX_EN(4)			<=	'0';
					N_CH_VOSG_EN(4)			<=	'1';
					N_SEQUENCER_STATE		<=	TEST_CH5_EN;

				ELSE																		-- INVOLKE SEQUENCE STEPS TO TURN ON THE CHANNEL
					N_SEQUENCER_STATE		<=	CH_1ST_STEP;
					N_CH_ID					<=  4;
					N_RET_STATE				<=	TEST_CH5_EN;
				END IF;

			WHEN TEST_CH5_EN	=>	
				IF NEW_M_CH_EN(5) = OP_M_CH_EN(5)		THEN								-- DO NOTHING IF NO CHANGE REQUESTED
					N_SEQUENCER_STATE		<=	TEST_CH6_EN;

				ELSIF NEW_M_CH_EN(5) = 	'0'				THEN								-- TURN OFF THE CHANNEL IMMEDIATELY
					N_CH_MREG_EN(5)			<=	'0';
					N_CH_IAUX_EN(5)			<=	'0';
					N_CH_VOSG_EN(5)			<=	'1';
					N_SEQUENCER_STATE		<=	TEST_CH6_EN;

				ELSE																		-- INVOLKE SEQUENCE STEPS TO TURN ON THE CHANNEL
					N_SEQUENCER_STATE		<=	CH_1ST_STEP;
					N_CH_ID					<=  5;
					N_RET_STATE				<=	TEST_CH6_EN;
				END IF;

			WHEN TEST_CH6_EN	=>	
				IF NEW_M_CH_EN(6) = OP_M_CH_EN(6)		THEN								-- DO NOTHING IF NO CHANGE REQUESTED
					N_SEQUENCER_STATE		<=	TEST_CH7_EN;

				ELSIF NEW_M_CH_EN(6) = 	'0'				THEN								-- TURN OFF THE CHANNEL IMMEDIATELY
					N_CH_MREG_EN(6)			<=	'0';
					N_CH_IAUX_EN(6)			<=	'0';
					N_CH_VOSG_EN(6)			<=	'1';
					N_SEQUENCER_STATE		<=	TEST_CH7_EN;

				ELSE																		-- INVOLKE SEQUENCE STEPS TO TURN ON THE CHANNEL
					N_SEQUENCER_STATE		<=	CH_1ST_STEP;
					N_CH_ID					<=  6;
					N_RET_STATE				<=	TEST_CH7_EN;
				END IF;

			WHEN TEST_CH7_EN	=>	
				IF NEW_M_CH_EN(7) = OP_M_CH_EN(7)		THEN								-- DO NOTHING IF NO CHANGE REQUESTED
					N_SEQUENCER_STATE		<=	SEQ_DONE;

				ELSIF NEW_M_CH_EN(7) = 	'0'				THEN								-- TURN OFF THE CHANNEL IMMEDIATELY
					N_CH_MREG_EN(7)			<=	'0';
					N_CH_IAUX_EN(7)			<=	'0';
					N_CH_VOSG_EN(7)			<=	'1';
					N_SEQUENCER_STATE		<=	SEQ_DONE;

				ELSE																		-- INVOLKE SEQUENCE STEPS TO TURN ON THE CHANNEL
					N_SEQUENCER_STATE		<=	CH_1ST_STEP;
					N_CH_ID					<=  7;
					N_RET_STATE				<=	SEQ_DONE;
				END IF;

			WHEN CH_1ST_STEP	=>															-- ENABLE THE VOS GENERATOR SIGNAL FOR THE SPECIFIED CHANNEL ID

				IF DEL_CNTR = 0 THEN										

					CASE CH_ID IS
						WHEN 0	=>															-- CHANNEL 0 CASE
							N_CH_MREG_EN(0)		<=	'0';
							N_CH_IAUX_EN(0)		<=	'0';
							N_CH_VOSG_EN(0)		<=	'1';
						WHEN 1	=>															-- CHANNEL 1 CASE
							N_CH_MREG_EN(1)		<=	'0';
							N_CH_IAUX_EN(1)		<=	'0';
							N_CH_VOSG_EN(1)		<=	'1';
						WHEN 2	=>															-- CHANNEL 2 CASE
							N_CH_MREG_EN(2)		<=	'0';
							N_CH_IAUX_EN(2)		<=	'0';
							N_CH_VOSG_EN(2)		<=	'1';
						WHEN 3	=>															-- CHANNEL 3 CASE
							N_CH_MREG_EN(3)		<=	'0';
							N_CH_IAUX_EN(3)		<=	'0';
							N_CH_VOSG_EN(3)		<=	'1';
						WHEN 4	=>															-- CHANNEL 4 CASE
							N_CH_MREG_EN(4)		<=	'0';
							N_CH_IAUX_EN(4)		<=	'0';
							N_CH_VOSG_EN(4)		<=	'1';
						WHEN 5	=>															-- CHANNEL 5 CASE
							N_CH_MREG_EN(5)		<=	'0';
							N_CH_IAUX_EN(5)		<=	'0';
							N_CH_VOSG_EN(5)		<=	'1';
						WHEN 6	=>															-- CHANNEL 6 CASE
							N_CH_MREG_EN(6)		<=	'0';
							N_CH_IAUX_EN(6)		<=	'0';
							N_CH_VOSG_EN(6)		<=	'1';
						WHEN 7	=>															-- CHANNEL 7 CASE
							N_CH_MREG_EN(7)		<=	'0';
							N_CH_IAUX_EN(7)		<=	'0';
							N_CH_VOSG_EN(7)		<=	'1';
					END CASE;
					
					N_DEL_CNTR			<=	DEL_CNT_VAL;									-- RE-INITIALIZE THE DELAY COUNTER
					N_SEQUENCER_STATE	<=	CH_2ND_STEP;
				ELSE
					N_DEL_CNTR			<=	DEL_CNTR - 1;									-- DECREMENT THE DELAY COUNTER
					N_SEQUENCER_STATE	<=	CH_1ST_STEP;
				
				END IF;


			WHEN CH_2ND_STEP	=>															-- ENABLE THE IAUX SIGNAL FOR THE SPECIFIED CHANNEL ID

				IF DEL_CNTR = 0 THEN										

					CASE CH_ID IS
						WHEN 0	=>															-- CHANNEL 0 CASE
							N_CH_MREG_EN(0)		<=	'0';
							N_CH_IAUX_EN(0)		<=	'1';
							N_CH_VOSG_EN(0)		<=	'1';
						WHEN 1	=>															-- CHANNEL 1 CASE
							N_CH_MREG_EN(1)		<=	'0';
							N_CH_IAUX_EN(1)		<=	'1';
							N_CH_VOSG_EN(1)		<=	'1';
						WHEN 2	=>															-- CHANNEL 2 CASE
							N_CH_MREG_EN(2)		<=	'0';
							N_CH_IAUX_EN(2)		<=	'1';
							N_CH_VOSG_EN(2)		<=	'1';
						WHEN 3	=>															-- CHANNEL 3 CASE
							N_CH_MREG_EN(3)		<=	'0';
							N_CH_IAUX_EN(3)		<=	'1';
							N_CH_VOSG_EN(3)		<=	'1';
						WHEN 4	=>															-- CHANNEL 4 CASE
							N_CH_MREG_EN(4)		<=	'0';
							N_CH_IAUX_EN(4)		<=	'1';
							N_CH_VOSG_EN(4)		<=	'1';
						WHEN 5	=>															-- CHANNEL 5 CASE
							N_CH_MREG_EN(5)		<=	'0';
							N_CH_IAUX_EN(5)		<=	'1';
							N_CH_VOSG_EN(5)		<=	'1';
						WHEN 6	=>															-- CHANNEL 6 CASE
							N_CH_MREG_EN(6)		<=	'0';
							N_CH_IAUX_EN(6)		<=	'1';
							N_CH_VOSG_EN(6)		<=	'1';
						WHEN 7	=>															-- CHANNEL 7 CASE
							N_CH_MREG_EN(7)		<=	'0';
							N_CH_IAUX_EN(7)		<=	'1';
							N_CH_VOSG_EN(7)		<=	'1';
					END CASE;
					
					N_DEL_CNTR			<=	DEL_CNT_VAL;									-- RE-INITIALIZE THE DELAY COUNTER
					N_SEQUENCER_STATE	<=	CH_3RD_STEP;
				ELSE
					N_DEL_CNTR			<=	DEL_CNTR - 1;									-- DECREMENT THE DELAY COUNTER
					N_SEQUENCER_STATE	<=	CH_2ND_STEP;
				
				END IF;
				

			WHEN CH_3RD_STEP	=>															-- ENABLE THE MASTER REGULATOR SIGNAL FOR THE SPECIFIED CHANNEL ID

				IF DEL_CNTR = 0 THEN										

					CASE CH_ID IS
						WHEN 0	=>															-- CHANNEL 0 CASE
							N_CH_MREG_EN(0)		<=	'1';
							N_CH_IAUX_EN(0)		<=	'1';
							N_CH_VOSG_EN(0)		<=	'1';
						WHEN 1	=>															-- CHANNEL 1 CASE
							N_CH_MREG_EN(1)		<=	'1';
							N_CH_IAUX_EN(1)		<=	'1';
							N_CH_VOSG_EN(1)		<=	'1';
						WHEN 2	=>															-- CHANNEL 2 CASE
							N_CH_MREG_EN(2)		<=	'1';
							N_CH_IAUX_EN(2)		<=	'1';
							N_CH_VOSG_EN(2)		<=	'1';
						WHEN 3	=>															-- CHANNEL 3 CASE
							N_CH_MREG_EN(3)		<=	'1';
							N_CH_IAUX_EN(3)		<=	'1';
							N_CH_VOSG_EN(3)		<=	'1';
						WHEN 4	=>															-- CHANNEL 4 CASE
							N_CH_MREG_EN(4)		<=	'1';
							N_CH_IAUX_EN(4)		<=	'1';
							N_CH_VOSG_EN(4)		<=	'1';
						WHEN 5	=>															-- CHANNEL 5 CASE
							N_CH_MREG_EN(5)		<=	'1';
							N_CH_IAUX_EN(5)		<=	'1';
							N_CH_VOSG_EN(5)		<=	'1';
						WHEN 6	=>															-- CHANNEL 6 CASE
							N_CH_MREG_EN(6)		<=	'1';
							N_CH_IAUX_EN(6)		<=	'1';
							N_CH_VOSG_EN(6)		<=	'1';
						WHEN 7	=>															-- CHANNEL 7 CASE
							N_CH_MREG_EN(7)		<=	'1';
							N_CH_IAUX_EN(7)		<=	'1';
							N_CH_VOSG_EN(7)		<=	'1';
					END CASE;
					
					N_DEL_CNTR			<=	DEL_CNT_VAL;									-- RE-INITIALIZE THE DELAY COUNTER
					N_SEQUENCER_STATE	<=	RET_STATE;										-- JUMP TO THE RETURN STATE
				ELSE
					N_DEL_CNTR			<=	DEL_CNTR - 1;									-- DECREMENT THE DELAY COUNTER
					N_SEQUENCER_STATE	<=	CH_3RD_STEP;
				
				END IF;
				
			WHEN SEQ_DONE			=>
				N_SEQUENCER_STATE	<=	INIT;
				N_OP_M_CH_EN 		<=	NEW_M_CH_EN ;										-- UPDATE THE TO THE PRESENT OP VALUE FOR CH ENABLES
				N_COMPLETED_SEQ		<=	'1';												-- GENERATE A PULSE EACH TIME THE SEQUENCE COMPLETED
				
			WHEN HOLD_AT_UVL		=>	
				IF SIGOUT_VOP_UVL = '0' THEN												-- WAIT HERE UNTIL THE UVL INDICATES IT IS CLEARED 
					N_SEQUENCER_STATE	<=	CHK_IF_UVL_CLEAR;
				ELSE
					N_SEQUENCER_STATE	<=	HOLD_AT_UVL;
				END IF;
				
				N_DEL_CNTR			<=	DEL_CNT_VAL;										-- RE-INITIALIZE THE DELAY COUNTER
						
			WHEN CHK_IF_UVL_CLEAR	=>														-- PROCEED TO RESTART CHANNELS AFTER A FORCED DELAY
				IF DEL_CNTR = 	0 	THEN													-- NOTE: IF SIGOUT_VAL = '0' WHILE WAITING, THEN THE STATEMENT BELOW FORCES STEP BACK TO HOLD_AT_UVL
					N_SEQUENCER_STATE	<=	TEST_CH0_EN;									-- RE-CHECK THE CHANNEL OP STATUS AGAINST THE MOST RECENT OP_M_CH_EN 
					N_DEL_CNTR			<=	DEL_CNT_VAL;									-- RE-INITIALIZE THE DELAY COUNTER
				
				ELSE																		-- COUNT OUT THE DELAY AS LONG AS SIGOUT_VOP_UVL STAYS DE-ASSERTED
					N_SEQUENCER_STATE	<=	CHK_IF_UVL_CLEAR;				
					N_DEL_CNTR			<=	DEL_CNTR - 1;									-- DECREMENT THE DELAY COUNTER
				
				END IF;

			
		END CASE;

--++++++++++++++++++++++++++++++++++++++++++++++++++++
-- THIS IS THE UNDER-VOLTAGE LOCKOUT HANDLER.
-- THESE STATEMENTS OVERRIDE THE ONES ABOVE.		
		IF SIGOUT_VOP_UVL = '1' 	THEN
		
			N_SEQUENCER_STATE	<=	HOLD_AT_UVL;
			
			N_CH_MREG_EN		<=	"00000000";												-- DISABLE ALL CHANNELS IMMEDIATELY
			N_CH_IAUX_EN		<=	"00000000";
			N_CH_VOSG_EN		<=	"00000000";
			
			N_OP_M_CH_EN		<=	"00000000";												-- CLEAR THE PRESENT OPERATING STATE (NOTE, N_NEW_M_CH_EN ALWAYS CONTAINS THE MOST RECENT COMMANDED VALUE)
		
		END IF;

-- ALWWAYS WANT TO STORE A NEW SERIAL WORD WHEN IT ARRIVES
		IF SER_WORD_STB = '1' THEN	
			N_NEW_M_CH_EN		<=	REGISTER_CH_CMD_EN(7 DOWNTO 0);
		END IF;

--++++++++++++++++++++++++++++++++++++++++++++++++++++			
		
		
	END PROCESS;
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ASSIGN INTERNAL SIGNALS TO EXTERNAL PORTS
		
CH_ACTIVE_STAT	<=	NEW_M_CH_EN(7) OR NEW_M_CH_EN(6) OR NEW_M_CH_EN(5) OR NEW_M_CH_EN(4) OR NEW_M_CH_EN(3) OR NEW_M_CH_EN(2) OR NEW_M_CH_EN(1) OR NEW_M_CH_EN(0);

P_CH_MREG_EN	<=	CH_MREG_EN;
P_CH_IAUX_EN	<=	CH_IAUX_EN;
P_CH_VOSG_EN	<=	CH_VOSG_EN;

P_COMPLETED_SEQ	<=	COMPLETED_SEQ;

end RTL;
