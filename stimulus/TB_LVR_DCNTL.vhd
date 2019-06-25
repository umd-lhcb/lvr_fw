--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TB_LVR_DCNTL.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::ProASIC3> <Die::A3PN060> <Package::100 VQFP>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_MISC.ALL;
-- USE IEEE.NUMERIC_STD.ALL;

library proasic3;
use proasic3.all;

--library synplify;
--use synplify.attributes.all;

entity TB_LVR_DCNTL is


end TB_LVR_DCNTL;
architecture behavioral of TB_LVR_DCNTL is
-- signal, component etc. declarations
	CONSTANT	EXT_CLK_PERIOD		:	TIME := 25 NS;		-- 40 MHZ CLOCK
	SIGNAL		SYSCLK40MHZ			:	STD_LOGIC := '0';
	SIGNAL		RESET_B				:	STD_LOGIC := '0';

	SIGNAL		TEST_SIG			:	STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	
	SIGNAL		P_SERIAL_TX			:	STD_LOGIC;							-- SERIAL TX STREAM
	SIGNAL		SIM_TX_STROBE		:	STD_LOGIC;							-- USED A SIM TEST STROBE
	
	SIGNAL		MOD_ADDR			:	STD_LOGIC_VECTOR(3 DOWNTO 0);		-- HADRWIRED MODULE ADDRESS

	SIGNAL		P_CH_MREG_EN_B		:	STD_LOGIC_VECTOR(7 DOWNTO 0);		-- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE LOW
	SIGNAL		P_CH_IAUX_EN		:	STD_LOGIC_VECTOR(7 DOWNTO 0);		-- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
	SIGNAL		P_CH_VOSG_EN		:	STD_LOGIC_VECTOR(7 DOWNTO 0);		-- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH

	SIGNAL		CH_STAT_LED			:	STD_LOGIC;							-- STATUS YELLOW LED INDICATING AT LEAST ONE CHANNEL IS ACTIVE
	
	SIGNAL		UVL_1V5_IN			:	STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	SIGNAL		UVL_VOP_IN			:	STD_LOGIC_VECTOR(0 DOWNTO 0) := "0";
	SIGNAL		EXT_CH_EN_PORT		:	STD_LOGIC_VECTOR(7 DOWNTO 0) := "11111111";
	
	
	
	COMPONENT TOP_LV_REGUL_CNTL	IS
		port(
				CLK40MHZ            :   IN  STD_LOGIC;                          -- EXTERNAL 3.3V 40 MHZ CLOCK 
				DEV_RST_B           :   IN  STD_LOGIC;                          -- ACTIVE LOW RESET --DEDICATED RC TIME CONSTANT---NEEDS SCHMITT-TRIGGER!
				
				MAN_GPIO_ENABLES	:	IN	STD_LOGIC_VECTOR(0 DOWNTO 0);		-- ENABLES MANUAL GPIO PORT---AKA MASTER_SLAVEB_SEL FOR SPECIAL THIS TEST VERSION
				
				UVL_1V5_IN			:	IN	STD_LOGIC_VECTOR(0 DOWNTO 0);		-- UNDER-VOLTAGE LOCKOUT FAILSAFE INPUT ('1'= V_OP_RAIL FELL BELOW THRESHOLD)
				UVL_VOP_IN			:	IN	STD_LOGIC_VECTOR(0 DOWNTO 0);		-- UNDER-VOLTAGE LOCKOUT FAILSAFE INPUT ('1'= V_OP_RAIL FELL BELOW THRESHOLD)
				EXT_CH_EN_PORT		:	IN	STD_LOGIC_VECTOR(7 DOWNTO 0);		-- SCA_GPIO / MANUAL PARALLEL JUMPER PORT INPUTS TO MANUALLY CONTROL THE REGULATOR CHANNELS

				P_MASTER_RST_B		:	OUT	STD_LOGIC;
				P_CLK_5M_GL			:	OUT	STD_LOGIC;
				
				RX_SIG_IN			:	IN	STD_LOGIC_VECTOR(0 DOWNTO 0);
				P_SERIAL_TX			:	OUT	STD_LOGIC_VECTOR(0 DOWNTO 0);		-- SERIAL TX STREAM
				P_SER_TX_EN			:	OUT	STD_LOGIC;							-- SERIAL TX DRIVER ENABLE
				
				MOD_ADDR			:	IN	STD_LOGIC_VECTOR(3 DOWNTO 0);		-- HADRWIRED MODULE ADDRESS

				P_CH_MREG_EN_B		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);		-- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE LOW
				P_CH_IAUX_EN		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);		-- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
				P_CH_VOSG_EN		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);		-- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH
				
				CH_STAT_LED			:	OUT	STD_LOGIC							-- STATUS YELLOW LED INDICATING AT LEAST ONE CHANNEL IS ACTIVE

			);
	end component;

	
begin

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- GENERATE A RESET SIGNAL EVENT
    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            RESET_B <= '0';
            wait for ( EXT_CLK_PERIOD * 10 );
            
            RESET_B <= '1';
            wait;
        end if;
    end process;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Clock Driver
    SYSCLK40MHZ  	<= not SYSCLK40MHZ after (EXT_CLK_PERIOD / 2.0 );

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- GENERATE AN INPUT SIGNAL TO TRIGGER A TRANSMIT FRAME START
	
	PROCESS
		BEGIN


			SIM_TX_STROBE		<=	'0';
			
			WAIT FOR ( EXT_CLK_PERIOD * 100 );			--
			SIM_TX_STROBE		<=	'1';
			
			WAIT FOR ( EXT_CLK_PERIOD * 20 );			--
			SIM_TX_STROBE		<=	'0';

			WAIT;

		END PROCESS;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- GENERATE AN INPUT SIGNAL TO TRIGGER A UNDER-VOLTAGE LOCKOUT EVENT
	
	PROCESS
		BEGIN


			UVL_VOP_IN		<=	"0";
			UVL_1V5_IN		<=	"0";

-- TEST UVL_VOP_IN FIRST (THIS ALSO ACTIVES A CHANGES IN ENABLES)			
			WAIT FOR ( EXT_CLK_PERIOD * 180000 );			--EVENT AT 4.5 mSEC
			UVL_VOP_IN		<=	"1";
			UVL_1V5_IN		<=	"0";
			
			WAIT FOR ( EXT_CLK_PERIOD * 800 );				--20USEC PULSE...PULSE NEEDS TO BE SUFFIECIENTLY LONG TO GET THRU THE IIR FILTER
			UVL_VOP_IN		<=	"0";
			UVL_1V5_IN		<=	"0";

-- TEST UVL_1V5_VOP NEXT (THIS IS A STAND-ALONE FUNCTION FOR NOW)
			WAIT FOR ( EXT_CLK_PERIOD * 119200 );			--EVENT AT 7.5 mSEC
			UVL_VOP_IN		<=	"0";
			UVL_1V5_IN		<=	"1";
			
			WAIT FOR ( EXT_CLK_PERIOD * 800 );				--20USEC PULSE...PULSE NEEDS TO BE SUFFIECIENTLY LONG TO GET THRU THE IIR FILTER
			UVL_VOP_IN		<=	"0";
			UVL_1V5_IN		<=	"0";
			
			
			
			WAIT;

		END PROCESS;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- INSTANTIATE UNIT UNDER TEST

TOP_LV_REGUL_CNTL_0	:	TOP_LV_REGUL_CNTL

	PORT MAP(
				CLK40MHZ            =>	SYSCLK40MHZ,
				DEV_RST_B           =>	RESET_B,

				MAN_GPIO_ENABLES	=>	"1",						-- SET AS A MASTER:  ENABLES MANUAL GPIO PORT---AKA MASTER_SLAVEB_SEL FOR SPECIAL THIS TEST VERSION
				
				UVL_1V5_IN			=>	UVL_1V5_IN,					-- UNDER-VOLTAGE LOCKOUT FAILSAFE INPUT ('1'= V_OP_RAIL FELL BELOW THRESHOLD)
				UVL_VOP_IN			=>	UVL_VOP_IN,					-- UNDER-VOLTAGE LOCKOUT FAILSAFE INPUT ('1'= V_OP_RAIL FELL BELOW THRESHOLD)
				EXT_CH_EN_PORT		=>	EXT_CH_EN_PORT,				-- SCA_GPIO / MANUAL PARALLEL JUMPER PORT INPUTS TO MANUALLY CONTROL THE REGULATOR CHANNELS
				
				P_MASTER_RST_B		=>	OPEN,
				P_CLK_5M_GL			=>	OPEN,
		
				RX_SIG_IN			=>	TEST_SIG,
				P_SERIAL_TX			=>	TEST_SIG,					-- SERIAL TX STREAM
				P_SER_TX_EN			=>	OPEN,						-- SERIAL TX DRIVER ENABLE
				
				MOD_ADDR			=>	"0000",						-- HARDWIRED MODULE ADDRESS

				P_CH_MREG_EN_B		=>	OPEN,						-- CHANNEL ENABLE SIGNAL: MAIN REGULATOR IC, ACTIVE LOW
				P_CH_IAUX_EN		=>	OPEN,						-- CHANNEL ENABLE SIGNAL: IAUX REGULATOR IC, ACTIVE HIGH
				P_CH_VOSG_EN		=>	OPEN,						-- CHANNEL ENABLE SIGNAL: VOS_GEN REGULATOR IC, ACTIVE HIGH
				
				CH_STAT_LED			=>	OPEN						-- STATUS YELLOW LED INDICATING AT LEAST ONE CHANNEL IS COMMANDED ACTIVE

			);


end behavioral;
