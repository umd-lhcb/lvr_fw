----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Wed Feb 27 10:40:46 2019
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TB_TOP_LVR_GEN3_CNTL.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::ProASIC3> <Die::A3P250> <Package::100 VQFP>
-- Author: <Name>
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;library IEEE;

use IEEE.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_MISC.ALL;
-- USE IEEE.NUMERIC_STD.ALL;

library proasic3;
use proasic3.all;

--library synplify;
--use synplify.attributes.all;


entity TB_TOP_LVR_GEN3_CNTL is
end TB_TOP_LVR_GEN3_CNTL;

architecture behavioral of TB_TOP_LVR_GEN3_CNTL is

    constant SYSCLK_PERIOD : time := 25 ns; -- 40MHZ

    signal SYSCLK 		: std_logic := '0';
    signal NSYSRESET 	: std_logic := '0';
	
	SIGNAL	CH_MREG_EN	: std_logic_vector(7 downto 0);
	SIGNAL	CH_IAUX_EN	: std_logic_vector(7 downto 0);
	SIGNAL	CH_VOSG_EN	: std_logic_vector(7 downto 0);
	
	SIGNAL	TEMPSIMPROBE	:	STD_LOGIC;
	
	SIGNAL	CH_ENABLE		:	STD_LOGIC;
	
	SIGNAL	CH_ACTIVE_STAT	:	STD_LOGIC;
	SIGNAL	STDBY_OFFB		:	STD_LOGIC;
	
	SIGNAL	MAINSEQ_STATE	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	SIGNAL 	TEMP_OK			:	STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL	FUSE_12_OK		:	STD_LOGIC_VECTOR(0 DOWNTO 0);
	SIGNAL	FUSE_34_OK		:	STD_LOGIC_VECTOR(0 DOWNTO 0);

    component TOP_LVR_GEN3_CNTL
        -- ports
        port( 
            -- Inputs
            CLK40M_OSC 				: in std_logic;
            POR_FPGA 				: in std_logic;
            FPGA_FUSE_1_2_OK 		: in std_logic_vector(0 DOWNTO 0);
            FPGA_FUSE_3_4_OK		: in std_logic_vector(0 DOWNTO 0);
            FPGA_FUSE_5_6_OK 		: in std_logic_vector(0 DOWNTO 0);
            FPGA_FUSE_7_8_OK 		: in std_logic_vector(0 DOWNTO 0);
            TEMP_OK 				: in std_logic_vector(0 DOWNTO 0);
            MODE_DCYC_NORMB 		: in std_logic;
            MODE_WDT_EN 			: in std_logic;
            MODE_DIAG_NORMB 		: in std_logic;
            CH1_2_MS_CFG_EN 		: in std_logic;
            CH3_4_MS_CFG_EN 		: in std_logic;
            CH5_6_MS_CFG_EN 		: in std_logic;
            CH7_8_MS_CFG_EN 		: in std_logic;
            MAN_EN_CH_4TO1 			: in std_logic;
            MAN_EN_CH_8TO5 			: in std_logic;
            TEMP_FAILSAFE_EN 		: in std_logic;
            STDBY_OFFB 				: in std_logic;
            RX_FPGA 				: in std_logic;
            ADDR_SEL 				: in std_logic_vector(4 downto 0);
            SCA_CLK_OUT 			: in std_logic;
            SCA_RESET_OUT 			: in std_logic;
            SCA_DAT_OUT 			: in std_logic;
            UNUSED_1				: in std_logic;
            UNUSED_2 				: in std_logic;
            J11_25_TCONN 			: in std_logic;
            J11_27_TCONN 			: in std_logic;

            -- Outputs
            TX_FPGA 				: out std_logic;
            PRI_RX_EN_BAR 			: out std_logic;
            PRI_TX_EN 				: out std_logic;
            SCA_DAT_IN 				: out std_logic;
            POR_OUT_TO_SCA 			: out std_logic;
            P_CH_MREG_EN 			: out std_logic_vector(7 downto 0);
            P_CH_IAUX_EN		 	: out std_logic_vector(7 downto 0);
            P_CH_VOSG_EN 			: out std_logic_vector(7 downto 0);
            PWR_OK_LED 				: out std_logic;
            STATUS_LED 				: out std_logic;
            BUF5M_J11_15_TCONN 		: out std_logic;
            J11_17_TCONN 			: out std_logic;
            J11_19_TCONN 			: out std_logic;
            J11_21_TCONN 			: out std_logic;
            J11_23_TCONN 			: out std_logic

            -- Inouts

			);
    end component;

begin

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- GENERATE A RESET SIGNAL EVENT
    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '0';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '1';
            wait;
        end if;
    end process;

 
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- GENERATE AN INPUT SIGNAL TO TRIGGER A CHANNEL ENABLE EVENT
	
	PROCESS
		BEGIN


			CH_ENABLE		<=	'0';
			STDBY_OFFB		<=	'0';
			
			TEMP_OK			<=	"0";
			FUSE_12_OK		<=	"0";
			FUSE_34_OK		<=	"0";

			WAIT FOR ( SYSCLK_PERIOD * 20000 );			-- 0.5 MSEC
			STDBY_OFFB		<=	'1';

			WAIT FOR ( SYSCLK_PERIOD * 20000 );			-- SET TEMP = OK
			TEMP_OK			<=	"1";
			FUSE_12_OK		<=	"0";
			FUSE_34_OK		<=	"0";

			WAIT FOR ( SYSCLK_PERIOD * 20000 );			-- SET TEMP = OK & ONE OF THE INPUTS TO BE ABOVE UVL MIN
			TEMP_OK			<=	"1";
			FUSE_12_OK		<=	"1";
			FUSE_34_OK		<=	"0";
			CH_ENABLE		<=	'1';

			WAIT FOR ( SYSCLK_PERIOD * 20000 );			--
			TEMP_OK			<=	"1";
			FUSE_12_OK		<=	"1";
			FUSE_34_OK		<=	"1";

			WAIT FOR ( SYSCLK_PERIOD * 20000 );			--
			TEMP_OK			<=	"0";
			FUSE_12_OK		<=	"1";
			FUSE_34_OK		<=	"1";

			WAIT FOR ( SYSCLK_PERIOD * 20000 );			--
			TEMP_OK			<=	"0";
			FUSE_12_OK		<=	"1";
			FUSE_34_OK		<=	"1";

			WAIT FOR ( SYSCLK_PERIOD * 20000 );			--
			TEMP_OK			<=	"1";
			FUSE_12_OK		<=	"1";
			FUSE_34_OK		<=	"1";

			WAIT FOR ( SYSCLK_PERIOD * 20000 );			--
			CH_ENABLE		<=	'1';
			
			WAIT FOR ( SYSCLK_PERIOD * 20000 );			--
			CH_ENABLE		<=	'1';

			WAIT;

		END PROCESS;
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    -- Instantiate Unit Under Test:  TOP_LVR_GEN3_CNTL
    TOP_LVR_GEN3_CNTL_0 : TOP_LVR_GEN3_CNTL
        -- port map
        port map( 
            -- Inputs
            CLK40M_OSC 			=> SYSCLK,
            POR_FPGA 			=> NSYSRESET,
            FPGA_FUSE_1_2_OK 	=> FUSE_12_OK,
            FPGA_FUSE_3_4_OK 	=> FUSE_34_OK,
            FPGA_FUSE_5_6_OK 	=> "0",
            FPGA_FUSE_7_8_OK 	=> "0",
            TEMP_OK 			=> TEMP_OK,
            MODE_DCYC_NORMB 	=> '1',
            MODE_WDT_EN 		=> '0',
            MODE_DIAG_NORMB 	=> '0',
            CH1_2_MS_CFG_EN 	=> '0',
            CH3_4_MS_CFG_EN 	=> '1',
            CH5_6_MS_CFG_EN 	=> '0',
            CH7_8_MS_CFG_EN 	=> '0',
            MAN_EN_CH_4TO1 		=> CH_ENABLE,
            MAN_EN_CH_8TO5 		=> CH_ENABLE,
            TEMP_FAILSAFE_EN 	=> '0',
            STDBY_OFFB 			=> STDBY_OFFB,
            RX_FPGA 			=> '0',
            ADDR_SEL 			=> (others=> '0'),
            SCA_CLK_OUT 		=> SYSCLK,
            SCA_RESET_OUT 		=> '0',
            SCA_DAT_OUT 		=> '0',
            UNUSED_1 			=> '0',
            UNUSED_2 			=> '0',
            J11_25_TCONN 		=> '0',
            J11_27_TCONN 		=> '0',

            -- Outputs
            TX_FPGA 			=> TEMPSIMPROBE,
            PRI_RX_EN_BAR 		=> open,
            PRI_TX_EN 			=> open,
            SCA_DAT_IN 			=> open,
            POR_OUT_TO_SCA 		=> open,
            P_CH_MREG_EN 		=> CH_MREG_EN,
            P_CH_IAUX_EN 		=> CH_IAUX_EN,
            P_CH_VOSG_EN 		=> CH_VOSG_EN,
            PWR_OK_LED 			=> open,
            STATUS_LED 			=> CH_ACTIVE_STAT,
            BUF5M_J11_15_TCONN 	=> open,
            J11_17_TCONN 		=> MAINSEQ_STATE(0),
            J11_19_TCONN 		=> MAINSEQ_STATE(1),
            J11_21_TCONN 		=> MAINSEQ_STATE(2),
            J11_23_TCONN 		=> MAINSEQ_STATE(3)

            -- Inouts
  
        );

end behavioral;

