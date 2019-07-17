--------------------------------------------------------------------------------
-- File history:
--      INIT, APRIL 5, 2019
--      
--
-- Description: 
--
-- UVL_FAILSAFE	
--				UNDER-VOLTAGE-LOCKOUT	THERE IS ONE FAILSAFE PER INPUT FUSE GROUP ASSOCIATED WITH 2 OUTPUT CHANNELS
--										THE TRANSITION BETWEEN STATES MUST PERSIST AT LEAST 4 SECONDS BEFORE CHANGING STATES

-- Targeted device: <Family::ProASIC3> <Die::A3PN250> <Package::100 VQFP>
-- Author: Tom O'Bannon
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity UVL_FAILSAFE is
port (
    		CLK_5M_GL			:	IN	STD_LOGIC;								-- FPGA MASTER CLOCK--ASSUMED TO BE 5 MHZ
    		MASTER_RST_B		:	IN	STD_LOGIC;								-- ACTIVE LOW RESET

			V_IN_OK_RAW			:	IN	STD_LOGIC;								-- '1'= VOLTAGE IS ABOVE THE MINIMUM REQUIRED TO OPERATE
			MS250_CLK_EN		:	IN	STD_LOGIC;								-- CLOCK ENABLE THAT OCCURS AT A 250 MSEC INTERVAL
			
			V_IN_OK_STAT		:	OUT	STD_LOGIC								-- FILTERED VERSION OF STATUS
		);
end UVL_FAILSAFE;
architecture RTL of UVL_FAILSAFE is

	SIGNAL		F_V_IN_OK, N_F_V_IN_OK		:	STD_LOGIC;							-- FILTERED VERSION OF V_IN_OK
	SIGNAL		V_OK_CNT, N_V_OK_CNT		:	INTEGER RANGE 0 TO (2**4)-1;		-- COUNT OF UVL STATE AT 4 HZ RATE
	CONSTANT	V_OK_VAL					:	INTEGER RANGE 0 TO (2**4)-1 := 15;	-- DECLARE V_IN IS OK IF IT PERSISTS AT LEAST 4 SECONDS

begin

-- architecture body
  
-- PROCESS FOR ALL REGISTERS
REG:PROCESS(CLK_5M_GL, MASTER_RST_B)
		
		BEGIN

		IF MASTER_RST_B	= '0'							THEN
			F_V_IN_OK				<=	 '0' ;
			V_OK_CNT				<=	  0 ;

		ELSIF (CLK_5M_GL'EVENT AND CLK_5M_GL='1'	)	THEN
			F_V_IN_OK				<=	N_F_V_IN_OK;
			V_OK_CNT				<=	N_V_OK_CNT;

		END IF;

		END PROCESS REG;   

-- PROCESS FOR COMBINATORIAL LOGIC THAT PERFORMS THE FILTERING

FILTCNT:PROCESS(MS250_CLK_EN, V_OK_CNT, V_IN_OK_RAW, F_V_IN_OK)

		BEGIN

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		-- THIS IS THE COUNTER BEING USED TO FILTER THE UNDER VOLTAGE LOCKOUT BIT
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		IF MS250_CLK_EN = '1' THEN														-- UPDATE FAULT COUNTER AT 4 HZ RATE

			IF V_OK_CNT = 0											THEN				-- CHECK TO SEE IF TERMINAL FAULT COUNT ALREADY ACHIEVED
				N_V_OK_CNT		<=	0;													-- IF ALREADY 0, THEN FAULT STAYS LATCHED
			
			ELSIF (V_IN_OK_RAW = '1'  AND  V_OK_CNT < V_OK_CNT) 	THEN				-- COUNT UNTIL FULL TERMINAL COUNT ACHIEVED
				N_V_OK_CNT		<=	V_OK_CNT + 1;
				
			ELSIF (V_IN_OK_RAW = '0') 								THEN				-- COUNT NOT 0, BUT TEMPERATURE NOT OK, SO COUNT DOWN
				N_V_OK_CNT		<=	V_OK_CNT - 1;
				
			ELSE																		-- COUNT MUST BE AT TERMINAL COUNT V_OK_CNT
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
			
			ELSIF (V_OK_CNT = V_OK_CNT) 							THEN				-- UPPER TERMINAL COUNT ACHIEVED
				N_F_V_IN_OK		<=	'0';												-- SO NO FAULT PRESENT
							
			ELSE
				N_F_V_IN_OK		<=	F_V_IN_OK;											-- NO NEED TO CHANGE THE FAULT SETTING DETECTED
			
			END IF;
			
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	END PROCESS FILTCNT;

V_IN_OK_STAT		<=	F_V_IN_OK;

end RTL;
