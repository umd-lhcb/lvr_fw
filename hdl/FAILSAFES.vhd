--------------------------------------------------------------------------------
-- File history:
--      INIT, APRIL 5, 2019
--      
--
-- Description: 
--
-- FAILSAFES 	
--				OVER-TEMPERATURE:  		THE LVR WILL BE LATCHED INTO A STATE WHERE ALL OUTPUTS ARE OFF
--										THE LATCHED STATE CAN ONLY BE CLEARED BY A POWER CYCLE EVENT
--										THE OVER TEMPERATURE CONDITION MUST PERSIST FOR AT LEAST ____ PERIOD

--				UNDER-VOLTAGE-LOCKOUT	THERE IS ONE FAILSAFE PER INPUT FUSE GROUP ASSOCIATED WITH 2 OUTPUT CHANNELS
--										THE TRANSITION BETWEEN STATES MUST PERSIST AT LEAST ____ PERIOD.

-- Targeted device: <Family::ProASIC3> <Die::A3PN250> <Package::100 VQFP>
-- Author: Tom O'Bannon
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity FAILSAFES is
port (
    		CLK_5M_GL			:	IN	STD_LOGIC;								-- FPGA MASTER CLOCK--ASSUMED TO BE 5 MHZ
    		MASTER_RST_B		:	IN	STD_LOGIC;								-- ACTIVE LOW RESET

			TEMP_OK				:	IN	STD_LOGIC;								-- '1'= TEMPERATURE IS BELOW MAX THRESHOLD
			V_IN_OK_RAW			:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);			-- '1'= VOLTAGE IS ABOVE THE MINIMUM REQUIRED TO OPERATE
			MS250_CLK_EN		:	IN	STD_LOGIC;								-- CLOCK ENABLE THAT OCCURS AT A 250 MSEC INTERVAL
			
			LATCHED_T_FAULT		:	OUT	STD_LOGIC;								-- A TEMPERATURE FAULT REQUIRES RESET OR POWER CYCLE TO CLEAR THE LATCHED STATE
			V_IN_OK				:	OUT	STD_LOGIC_VECTOR(3 DOWNTO 0)			-- FILTERED VERSION
		);
end FAILSAFES;
architecture architecture_FAILSAFES of FAILSAFES is

	SIGNAL		L_T_FAULT, N_L_T_FAULT		:	STD_LOGIC;							-- FILTERED AND LATCHED TEMPERATURE FAULT
	SIGNAL		T_FLT_CNT, N_T_FLT_CNT		:	INTEGER RANGE 0 TO (2**4)-1;		-- COUNT OF OVER-TEMP STATE AT 4 HZ RATE
	CONSTANT	T_FLT_VAL					:	INTEGER RANGE 0 TO (2**4)-1 := 15;	-- DECLARE A FAULT IF IT PERSISTS AT LEAST 4 SECONDS
	
	SIGNAL		F_V_IN_OK, N_F_V_IN_OK		:	STD_LOGIC_VECTOR(3 DOWNTO 0);		-- FILTERED VERSION OF V_IN_OK
	SIGNAL		V_OK_1CNT, N_V_OK_1CNT		:	INTEGER RANGE 0 TO (2**4)-1;		-- COUNT OF UVL STATE AT 4 HZ RATE
	CONSTANT	V_OK_VAL					:	INTEGER RANGE 0 TO (2**4)-1 := 15;	-- DECLARE V_IN IS OK IF IT PERSISTS AT LEAST 4 SECONDS

begin

-- architecture body
  
-- PROCESS FOR ALL REGISTERS
REG:PROCESS(CLK_5M_GL, MASTER_RST_B)
		
		BEGIN

		IF MASTER_RST_B	= '0'							THEN
			L_T_FAULT				<=	'1';										-- START OUT 'FAULTED' UNTIL OUTPUT IS FILTERED
			T_FLT_CNT				<=	T_FLT_VAL / 2;								-- SET COUNT TO MID VALUE
			
			F_V_IN_OK				<=	 "0000" ;
			V_OK_CNT				<=	 0 ;

		ELSIF (CLK_5M_GL'EVENT AND CLK_5M_GL='1'	)	THEN
			L_T_FAULT				<=	N_L_T_FAULT;
			T_FLT_VAL				<=	N_T_FLT_VAL;
			
			F_V_IN_OK				<=	N_F_V_IN_OK;
			V_OK_CNT				<=	N_V_OK_CNT;

		END IF;

		END PROCESS REG;   

-- PROCESS FOR COMBINATORIAL LOGIC THAT PERFORMS THE FILTERING

FILTCNT:PROCESS(TEMP_OK)

		BEGIN

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		-- THIS IS THE COUNTER BEING USED TO FILTER THE OVER-TEMPERATURE BIT
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		IF MS250_CLK_EN = '1' THEN														-- UPDATE FAULT COUNTER AT 4 HZ RATE

			IF T_FLT_CNT = 0										THEN				-- CHECK TO SEE IF TERMINAL FAULT COUNT ALREADY ACHIEVED
				N_T_FLT_CNT		<=	0;													-- IF ALREADY 0, THEN FAULT STAYS LATCHED
			
			ELSIF (TEMP_OK = '1'  AND  T_FLT_CNT < T_FLT_VAL) 		THEN				-- COUNT UNTIL FULL TERMINAL COUNT ACHIEVED
				N_T_FLT_CNT		<=	T_FLT_CNT + 1;
				
			ELSIF (TEMP_OK = '0') 									THEN				-- COUNT NOT 0, BUT TEMPERATURE NOT OK, SO COUNT DOWN
				N_T_FLT_CNT		<=	T_FLT_CNT - 1;
				
			ELSE																		-- COUNT MUST BE AT TERMINAL COUNT T_FLT_VAL
				N_T_FLT_CNT		<=	T_FLT_CNT;
			
			END IF;
		
		ELSE
		
			N_T_FLT_CNT		<=	T_FLT_CNT;
			
		END IF;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		-- THIS IS THE LOGIC USED TO EITHER CLEAR THE INITIAL OR DECLARE AN OVER TEMPERATURE FAULT
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			IF T_FLT_CNT = 0										THEN				-- CHECK TO SEE IF TERMINAL FAULT COUNT  ACHIEVED
				N_L_T_FAULT		<=	'1';												-- KEEP THE DECLARED FAULT SETTING
			
			ELSIF (T_FLT_CNT = T_FLT_VAL) 							THEN				-- UPPER TERMINAL COUNT ACHIEVED
				N_L_T_FAULT		<=	'0';												-- SO NO FAULT PRESENT
							
			ELSE
				N_L_T_FAULT		<=	L_T_FAULT;											-- NO NEED TO CHANGE THE FAULT SETTING DETECTED
			
			END IF;


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		-- THIS IS THE COUNTER BEING USED TO FILTER THE UNDER VOLTAGE LOCKOUT BIT
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		IF MS250_CLK_EN = '1' THEN														-- UPDATE FAULT COUNTER AT 4 HZ RATE

			IF V_OK_CNT = 0											THEN				-- CHECK TO SEE IF TERMINAL FAULT COUNT ALREADY ACHIEVED
				N_V_OK_CNT		<=	0;													-- IF ALREADY 0, THEN FAULT STAYS LATCHED
			
			ELSIF (TEMP_OK = '1'  AND  V_OK_CNT < T_FLT_VAL) 		THEN				-- COUNT UNTIL FULL TERMINAL COUNT ACHIEVED
				N_V_OK_CNT		<=	V_OK_CNT + 1;
				
			ELSIF (TEMP_OK = '0') 									THEN				-- COUNT NOT 0, BUT TEMPERATURE NOT OK, SO COUNT DOWN
				N_V_OK_CNT		<=	V_OK_CNT - 1;
				
			ELSE																		-- COUNT MUST BE AT TERMINAL COUNT T_FLT_VAL
				N_V_OK_CNT		<=	V_OK_CNT;
			
			END IF;
		
		ELSE
		
			N_V_OK_CNT		<=	V_OK_CNT;
			
		END IF;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		-- THIS IS THE LOGIC USED TO DECLARE THE UNDER VOLTAGE STATUS
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			IF V_OK_CNT = 0											THEN				-- CHECK TO SEE IF TERMINAL FAULT COUNT  ACHIEVED
				N_F_V_IN_OK		<=	'1';												-- KEEP THE DECLARED FAULT SETTING
			
			ELSIF (V_OK_CNT = T_FLT_VAL) 							THEN				-- UPPER TERMINAL COUNT ACHIEVED
				N_F_V_IN_OK		<=	'0';												-- SO NO FAULT PRESENT
							
			ELSE
				N_F_V_IN_OK		<=	L_T_FAULT;											-- NO NEED TO CHANGE THE FAULT SETTING DETECTED
			
			END IF;
			
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



end architecture_FAILSAFES;
