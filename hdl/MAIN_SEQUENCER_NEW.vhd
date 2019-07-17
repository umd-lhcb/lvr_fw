--------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MARYLAND
--
-- File: MAIN_SEQUENCER_NEW.vhd
-- File history:
--      <Rev - // Mar 30, 2017  INITIAL basis for the design that was tested for SEU performance at CERN CHARM
--		<Rev A // Feb 26, 2019 	MAJOR UPDATE FOR GEN 3 LVR config
--		<REV B // APR  8, 2019 	MAJOR UPDATE THAT TURNS THIS INTO A 2 CHANNEL MODULE THAT MATCHES THE FUSE GROUPING.
--								(EACH FUSE GROUP HAS 2 CHANNELS)

-- Description: THIS MOUDULE IS THE MAIN CONTROL SEQUENCER FOR A PAIR OF CHANNELS

--		
--				THE SEQUENCER WAITS FOR STDBY_OFFB_B=1 BEFORE PROCEEDING:
--				IF ABOVE TRUE, THEN THE NEW MASTER CHANNEL ENABLE BYTE IS LATCHED.
-- 
--				THE REQUIRED TURN SEQUENCE IS AS FOLLOWS.  THE UPDATES ARE INITIATED BY THE CMND_WORD_STB PULSE.  
--				SET THE STDBY_OFFB_B BIT AND REG_CH_CMD_EN BITS ACCORDING TO THE DESIRED TURN SEQUENCE:

--					OPTION 1) GROUP TURN ON WHEN:
--							* ARM_MODE= '1' (FORCES WAIT FOR GLOBAL TRIGGER EVENT)
--							* STDBY_OFFB_B BIT = '1' OR '0', DEPENDING UPON DESIRED TIMING OF THE V_OS OUTPUT STEP
--							* SET ALL DESIRED CHANNELS TO BE ENABLED VIA REG_CH_CMD_EN 
--							* INITIATE A GLOBAL TRIGGER EVENT.  

--					OPTION 2) INDIVIDUAL AND IMMEDIATE CHANNEL TURN ON WHEN:
--							* ARM_MODE= '0' (ENABLES CHANNELS TO BE IMMEDIATELY ENABLED)
--							* STDBY_OFFB_B BIT = '1' OR '0', DEPENDING UPON DESIRED TIMING OF THE V_OS OUTPUT STEP
--							* REG_CH_CMD_EN SET ALL DESIRED CHANNELS
--							* INITIATE A GLOBAL TRIGGER EVENT.  

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
--library synplify;
--use synplify.attributes.all;

entity MAIN_SEQUENCER_NEW is
port (
		MASTER_RST_B			:	IN	STD_LOGIC;							-- RESET WITH ASYNC ASSERT, BUT SYNCHRONIZED TO THE 40 MHZ CLOCK EDGE
		CLK_5M_GL				:	IN	STD_LOGIC;							-- MASTER 5 MHZ CLOCK
		
		REG_CH_CMD_EN			:	IN	STD_LOGIC_VECTOR(1 DOWNTO 0);		-- REGISTER CHANNEL COMMAND ENABLES
		CMND_WORD_STB			:	IN	STD_LOGIC;							-- SINGLE CLOCK PULSE STROBE INDICATES AN UPDATED COMMAND WORD
		
		STDBY_OFFB_B			:	IN	STD_LOGIC;							-- '1' = FORCED V_OS OUTPUT ENABLED, '0' = NORMAL V_OS TIMING STEP
		
		DTYCYC_EN				:	IN	STD_LOGIC;							-- '1' ENABLES A LOW DUTY CYCLE MODE TO LIMIT THERMAL LOADS FOR SPECIAL TESTS
		V_IN_OK					:	IN	STD_LOGIC;							-- UNDER-VOLTAGE LOCKOUT:  V_IN ABOVE THRESHOLD WHEN ='1'
		TEMP_OK					:	IN	STD_LOGIC;							-- '1' MEANS THE TEMPERATURE IS BELOW THE MAX VALUE
		
		SIM_MODE_EN				:	IN	STD_LOGIC;							-- '1' IS SPECIAL SIM MODE WITH REDUCED TIMEOUT INTERVALS

-- THE MASTER-SLAVE CONFIG DETERMINES THE ENABLE FOR THE V_OS OP AMPL!
		CHA_B_MS_CFG_EN			:	IN	STD_LOGIC;							-- pin 21, BIT 0:	CHA_B_MS_CFG_EN = ADJACENT CHANNELS A & 
	
		P_CH_MREG_EN			:	OUT STD_LOGIC_VECTOR(1 DOWNTO 0);		-- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
		P_CH_IAUX_EN			:	OUT STD_LOGIC_VECTOR(1 DOWNTO 0);		-- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
		P_CH_VOSG_EN			:	OUT STD_LOGIC_VECTOR(1 DOWNTO 0);		-- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH
		
		P_SEQ_STEPVAL			:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0)		-- INDICATES PRESENT SEQUENCE STEP
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
TYPE SEQ_SM_STATES	IS (
							INIT, WAIT_STEP,
							CH_1ST_STEP, CH_2ND_STEP, CH_3RD_STEP, STANDBY_HOLD, OPERATE_HOLD, SEQ_DONE, HOLD_AT_UVL, CHK_IF_UVL_CLEAR
						);															
SIGNAL SEQUENCER_STATE, N_SEQUENCER_STATE		: SEQ_SM_STATES ;
SIGNAL RET_STATE, N_RET_STATE					: SEQ_SM_STATES ;

SIGNAL	N_PREV_M_CH_EN, PREV_M_CH_EN			: STD_LOGIC_VECTOR(1 DOWNTO 0);			-- COPY THE CHANNEL ENABLE UPDATE TO 'NEW

SIGNAL	N_CH_MREG_EN, CH_MREG_EN				: STD_LOGIC_VECTOR(1 DOWNTO 0);			-- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE HIGH
SIGNAL	N_CH_IAUX_EN, CH_IAUX_EN				: STD_LOGIC_VECTOR(1 DOWNTO 0);			-- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
SIGNAL	N_CH_VOSG_EN, CH_VOSG_EN				: STD_LOGIC_VECTOR(1 DOWNTO 0);			-- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

SIGNAL	N_CH_ACTIVE_STAT, CH_ACTIVE_STAT		: STD_LOGIC;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SIGNAL	N_DEL_CNTR, DEL_CNTR					: INTEGER RANGE 0 TO (2**15) - 1;		-- DELAY INTERVAL COUNTER
SIGNAL	DEL_CNT_VAL								: INTEGER RANGE 0 TO (2**15) - 1 ;		-- MAX DELAY COUNTER RELOAD VALUE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

SIGNAL  N_SEQ_STEPVAL, SEQ_STEPVAL				: STD_LOGIC_VECTOR(3 DOWNTO 0);				-- PuLSE INDICATES SEQUENCE WAS COMPLETED

begin

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- DEFINE ALL REGISTERS USED WITH THE 5 MHZ CLOCK
REG5M:PROCESS(CLK_5M_GL, MASTER_RST_B, DEL_CNT_VAL)	
	BEGIN
		IF MASTER_RST_B = '0' THEN
			SEQUENCER_STATE			<=	INIT;
			PREV_M_CH_EN			<=	(OTHERS => '0');									-- DEFAULT CASE IS NO CHANNELS ENABLED
			CH_MREG_EN				<=	(OTHERS => '0');									-- DEFAULT CASE IS OFF
			CH_IAUX_EN				<=	(OTHERS => '0');									-- DEFAULT CASE IS OFF
			CH_VOSG_EN				<=	(OTHERS => '0');									-- DEFAULT CASE IS OFF
			RET_STATE				<=	INIT;
			DEL_CNTR				<=	DEL_CNT_VAL;
			SEQ_STEPVAL				<=	"0000";
			CH_ACTIVE_STAT			<=	'0';
			
		ELSIF (CLK_5M_GL'EVENT AND CLK_5M_GL='1') THEN
			SEQUENCER_STATE			<=	N_SEQUENCER_STATE;
			PREV_M_CH_EN			<=	N_PREV_M_CH_EN;
			CH_MREG_EN				<=	N_CH_MREG_EN;
			CH_IAUX_EN				<=	N_CH_IAUX_EN;
			CH_VOSG_EN				<=	N_CH_VOSG_EN;
			RET_STATE				<=	N_RET_STATE;	
			DEL_CNTR				<=	N_DEL_CNTR;
			SEQ_STEPVAL				<=	N_SEQ_STEPVAL;
			CH_ACTIVE_STAT			<=	N_CH_ACTIVE_STAT;
		
		END IF;
		
	END PROCESS;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- INSTANTIATE THE MAIN SEQUENCER AND CONTROL MODULE
MAIN_SEQUENCER:PROCESS(	SIM_MODE_EN, DTYCYC_EN, SEQ_STEPVAL,
						SEQUENCER_STATE, RET_STATE, DEL_CNTR, CH_VOSG_EN, CH_IAUX_EN, CH_MREG_EN,
						CHA_B_MS_CFG_EN, V_IN_OK, TEMP_OK,
						REG_CH_CMD_EN, PREV_M_CH_EN, STDBY_OFFB_B, CH_ACTIVE_STAT
						)


	BEGIN
	-- DEFAULT ASSIGNMENTS GET OVERRIDEN BELOW AS NEEDED
		N_PREV_M_CH_EN		<=	PREV_M_CH_EN;			-- THIS IS A COPY OF THE NEWEST EXTERNAL COMMAND (REG_CH_CMD_EN)

		N_CH_MREG_EN		<=	CH_MREG_EN;
		N_CH_IAUX_EN		<=	CH_IAUX_EN;
		N_CH_VOSG_EN		<=	CH_VOSG_EN;
		N_RET_STATE			<=	RET_STATE;
		N_DEL_CNTR			<=	DEL_CNTR;
		
		N_SEQ_STEPVAL		<=	SEQ_STEPVAL;


	-- MUX FOR SPECIAL SIM MODE WHICH HAS SHORTER TIMEOUT INTERVALS
	
		IF SIM_MODE_EN = '1' THEN 
			DEL_CNT_VAL		<=	(2**5) - 1;					-- MAX DELAY COUNTER RELOAD VALUE FOR SPECIAL SIM MODE
		ELSE
			DEL_CNT_VAL		<=	(2**15) - 1;				-- MAX DELAY COUNTER RELOAD VALUE FOR NORMAL OPERATING MODE
		END IF;

-- TEST FOR AN ACTIVE CHANNEL:
--	*UVL NEEDS TO BE SATISFIED ALONG WITH AT LEAST ONE CHANNEL ENABLE.
		IF ( REG_CH_CMD_EN(0) = '1' OR REG_CH_CMD_EN(1) = '1')	THEN 
			N_CH_ACTIVE_STAT	<=	'1';
		ELSE
			N_CH_ACTIVE_STAT	<=	'0';
		END IF;
		

-- THIS IS A VERY SIMPLIFIED VERSION THAT ONLY HANDLES THE FOLLOWING CONOP SEQUENCE:
	-- 1) FIRST, SET THE MASTER_SLAVE CH GROUP DIP SWITCHES ACCORDING TO THE WIRED CHANNEL CONFIGS!!!!!!
 	-- 2) THEN, TOGGLE STNDBY_OFFB DIP SWITCH FROM "0" TO "1" TO TRANSITION ALL CHANNELS FROM FULL OFF TO STANDBY STATE, WAITING WITH THE OUTPUTS AT VOS
	-- 3) NEXT, ENABLE CHANNEL OUTPUTS 8-TO-5 AND/OR 4-TO-1 WITH ASSOCIATED DIP SWITCH TOGGLE

		CASE SEQUENCER_STATE IS

			WHEN INIT				=>													-- 

				N_CH_MREG_EN			<=	"00";										-- KEEP DISABLED 
				N_CH_IAUX_EN			<=	"00";										-- KEEP DISABLED 
				N_CH_VOSG_EN			<=	"00";										-- KEEP DISABLED

				IF 	(STDBY_OFFB_B = '1')		THEN									-- TRANSITION TO THE STANDBY STATE WHEN EANBLED
					N_SEQUENCER_STATE	<=	CH_1ST_STEP;
				ELSE
					N_SEQUENCER_STATE	<=	INIT;										-- WAIT HERE UNTIL STANDBY IS REQUESTED
				END IF;

				N_DEL_CNTR				<=	DEL_CNT_VAL;								-- INITIALIZE THE DELAY COUNTER

				N_SEQ_STEPVAL			<=	"0000";										-- SEND PRESENT SEQUENCE STEP
				
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- V_OS GENERATOR SIGNAL.  (IE THIS IS ONLY THE V_OS OP AMP AND NOT THE CHANNEL OUTPUT)
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

			WHEN CH_1ST_STEP	=>															-- ENABLE THE VOS GENERATOR SIGNAL FOR THE SPECIFIED CHANNEL ID'S
																							-- 
				N_CH_MREG_EN			<=	"00";											-- KEEP DISABLED 
				N_CH_IAUX_EN			<=	"00";											-- KEEP DISABLED 
				N_CH_VOSG_EN			<=	"11";											-- ENABLE THE V_OS GEN SIGNALS

				N_SEQUENCER_STATE		<=	WAIT_STEP;										-- GO AND WAIT FOR THE CIRCUITS HIT STEADY STATE
				N_RET_STATE				<=	CH_2ND_STEP;									-- THEN GO TO THE 2ND SEQUENCE STEP, ONCE WAIT IS COMPLETE
				N_DEL_CNTR				<=	DEL_CNT_VAL;									-- RE-INITIALIZE THE DELAY COUNTER BEFORE USING IT

				N_SEQ_STEPVAL			<=	"0001";											-- SEND PRESENT SEQUENCE STEP

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- I_AUX CIRCUIT ENABLE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

			WHEN CH_2ND_STEP	=>															-- ENABLE THE IAUX SIGNAL FOR THE SPECIFIED CHANNEL ID'S

				N_CH_MREG_EN			<=	"00";											-- KEEP DISABLED 
				N_CH_IAUX_EN			<=	"11";											-- ENABLE ALL ACTIVE CHANNELS
				N_CH_VOSG_EN			<=	"11";											-- KEEP THE V_OS GEN SIGNAL ENABLED IF CHANNEL IS ENABLED
				
				N_SEQUENCER_STATE		<=	WAIT_STEP;										-- GO AND WAIT FOR THE CIRCUITS HIT STEADY STATE
				N_RET_STATE				<=	CH_3RD_STEP;									-- THEN HOLD AT THE STANDBY STATE SEQUENCE STEP, ONCE WAIT IS COMPLETE
				N_DEL_CNTR				<=	DEL_CNT_VAL;									-- RE-INITIALIZE THE DELAY COUNTER BEFORE USING IT

				N_SEQ_STEPVAL			<=	"0010";											-- SEND PRESENT SEQUENCE STEP
				
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- MREG CIRCUIT ENABLE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

			WHEN CH_3RD_STEP	=>															-- ENABLE THE MREG SIGNAL FOR THE SPECIFIED CHANNEL ID'S

				N_CH_MREG_EN			<=	"11";											-- KEEP DISABLED 
				N_CH_IAUX_EN			<=	"11";											-- ENABLE ALL ACTIVE CHANNELS
				N_CH_VOSG_EN			<=	"11";											-- KEEP THE V_OS GEN SIGNAL ENABLED IF CHANNEL IS ENABLED
				
				N_SEQUENCER_STATE		<=	WAIT_STEP;										-- GO AND WAIT FOR THE CIRCUITS HIT STEADY STATE
				N_RET_STATE				<=	STANDBY_HOLD;									-- THEN HOLD AT THE STANDBY STATE SEQUENCE STEP, ONCE WAIT IS COMPLETE
				N_DEL_CNTR				<=	DEL_CNT_VAL;									-- RE-INITIALIZE THE DELAY COUNTER BEFORE USING IT

				N_SEQ_STEPVAL			<=	"0011";											-- SEND PRESENT SEQUENCE STEP
				
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- STANDBY HOLD STATE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

			WHEN STANDBY_HOLD	=>															-- HOLD HERE WHILE IN STANDBY

				IF 		(STDBY_OFFB_B = '1'	AND CH_ACTIVE_STAT = '0')	THEN				-- HOLD HERE WHILE IN STANDBY
							N_SEQUENCER_STATE	<=	STANDBY_HOLD;

				ELSIF 	(STDBY_OFFB_B = '1'	AND CH_ACTIVE_STAT = '1')	THEN				-- GO TO OPERATE HOLD OIF THERE IS NOW AN ACTIVE CHANNEL COMMAND
							N_SEQUENCER_STATE	<=	OPERATE_HOLD;

				ELSE
							N_SEQUENCER_STATE	<=	INIT;									-- GO BACK TO INIT IF STDBY_OFFB = '0' !!!!

				END IF;
				
				N_CH_MREG_EN			<=	"11";											-- KEEP VOS_GEN ENABLED 
				N_CH_IAUX_EN			<=	"11";											-- ENABLE ALL ACTIVE CHANNELS
				N_CH_VOSG_EN			<=	"11";											-- KEEP THE V_OS GEN SIGNAL ENABLED IF CHANNEL IS ENABLED

				N_SEQ_STEPVAL			<=	"0100";											-- SEND PRESENT SEQUENCE STEP
				
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- OPERATE HOLD STATE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

			WHEN OPERATE_HOLD	=>															-- STAY HERE FOR OPERATE MODE

				IF 		(STDBY_OFFB_B = '1'	AND CH_ACTIVE_STAT = '0')	THEN				-- GO BACK TO STANDBY WHEN ALL CHANNELS COMMANDED OFF
							N_SEQUENCER_STATE	<=	STANDBY_HOLD;

				ELSIF 	(STDBY_OFFB_B = '1'	AND CH_ACTIVE_STAT = '1')	THEN				-- STAY IN OPERATE HOLD IF THERE IS AT LEAST 1 ACTIVE CHANNEL COMMAND
							N_SEQUENCER_STATE	<=	OPERATE_HOLD;

				ELSE
							N_SEQUENCER_STATE	<=	INIT;									-- GO BACK TO INIT IF STDBY_OFFB = '0' !!!!

				END IF;
				
				N_CH_MREG_EN			<=	"11";											-- KEEP ENABLED 
				N_CH_IAUX_EN			<=	"11";											-- ENABLE ALL ACTIVE CHANNELS

			-- VOS_GEN OP AMP ENABLES CONTROLS THE ACTUAL CHANNEL OUTPUT FUNCTION!
						IF CHA_B_MS_CFG_EN = '1'	THEN									-- MASTER IS INDEX 0, SLAVE IS INDEX 1
							N_CH_VOSG_EN(0)		<=	NOT(REG_CH_CMD_EN(0) AND DTYCYC_EN);	-- TURN OFF THE MASTER CH VOS_GEN OP AMP (IF ENABLED) TO TURN ON THE OUTPUT VOLTAGE .... 
							N_CH_VOSG_EN(1)		<=	'1' ;									-- ... BUT KEEP SLAVE CH VOS_GEN OP AMP ENABLED.
						ELSE																-- 2 SEPARATE MASTER CHANNELS HERE
							N_CH_VOSG_EN(0)		<=	NOT(REG_CH_CMD_EN(0) AND DTYCYC_EN);	-- SO, TURN OFF THE MASTER CH VOS_GEN OP AMP IF CHANNEL COMMANDED TO BE ON
							N_CH_VOSG_EN(1)		<=	NOT(REG_CH_CMD_EN(1) AND DTYCYC_EN);	-- SO, TURN OFF THE MASTER CH VOS_GEN OP AMP IF CHANNEL COMMANDED TO BE ON
						END IF;

				N_SEQ_STEPVAL			<=	"0101";											-- SEND PRESENT SEQUENCE STEP

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- WAIT STATE--IS REUSED STATE MACHINE SEQMENT, SO ALWAYS REQUIRES A STATE MACHINE RETURN STATE WHEN DONE
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

			WHEN WAIT_STEP		=>
				IF DEL_CNTR = 0	THEN														-- PROCEED ONCE DELAY COUNTER IS FINISHED
					N_DEL_CNTR			<=	DEL_CNT_VAL;									-- RE-INITIALIZE THE DELAY COUNTER
					N_SEQUENCER_STATE	<=	RET_STATE;										-- THIS MUST BE SUPPLIED FROM THE PREVIOUS STATE MACHINE STEP!
				ELSE
					N_DEL_CNTR			<=	DEL_CNTR - 1;									-- DECREMENT THE DELAY COUNTER
					N_SEQUENCER_STATE	<=	WAIT_STEP;										-- WAIT HERE UNTIL THE TIEMOUT INTERVAL IS COMPLETE.				
				END IF;

				N_SEQ_STEPVAL			<=	"1111";											-- SEND PRESENT SEQUENCE STEP

				

			WHEN OTHERS 			=>
				N_SEQUENCER_STATE	<=	INIT;
				
		END CASE;

--++++++++++++++++++++++++++++++++++++++++++++++++++++
-- THIS IS THE UNDER-VOLTAGE LOCKOUT HANDLER.
-- THESE STATEMENTS OVERRIDE THE ONES ABOVE.		
		IF (V_IN_OK = '0' OR TEMP_OK = '0')	THEN								-- V_IN_OK MUST BE ='1' TO BE ABOVE THE MIN V INPUT THRESHOLD!
		
			N_SEQUENCER_STATE	<=	INIT;
			
			N_CH_MREG_EN		<=	"00";												-- DISABLE ALL CHANNELS IMMEDIATELY
			N_CH_IAUX_EN		<=	"00";
			N_CH_VOSG_EN		<=	"00";
			
			N_PREV_M_CH_EN		<=	"00";												-- CLEAR THE PRESENT OPERATING STATE (NOTE, PREV_M_CH_EN ALWAYS CONTAINS THE MOST RECENT COMMANDED VALUE)
		
		END IF;


--++++++++++++++++++++++++++++++++++++++++++++++++++++			
		
		
	END PROCESS MAIN_SEQUENCER;
	
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ASSIGN INTERNAL SIGNALS TO EXTERNAL PORTS
		
P_CH_MREG_EN	<=	CH_MREG_EN;
P_CH_IAUX_EN	<=	CH_IAUX_EN;
P_CH_VOSG_EN	<=	CH_VOSG_EN;

P_SEQ_STEPVAL	<=	SEQ_STEPVAL;

end RTL;
