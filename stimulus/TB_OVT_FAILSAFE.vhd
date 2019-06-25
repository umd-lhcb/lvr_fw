----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Wed Apr 10 08:47:37 2019
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: TB_OVT_FAILSAFE.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::ProASIC3> <Die::A3PN250> <Package::100 VQFP>
-- Author: <Name>
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity TB_OVT_FAILSAFE is
end TB_OVT_FAILSAFE;

architecture behavioral of TB_OVT_FAILSAFE is

    constant SYSCLK_PERIOD 	: time := 200 ns; 	-- 5MHZ
    constant SIMCLK_PERIOD 	: time := 20000 ns; -- 100KHZ

    signal SYSCLK 			: std_logic := '0';
    signal NSYSRESET 		: std_logic := '0';
	
	signal HZ4X1000_SIMCLK	: STD_LOGIC := '0';

    component OVT_FAILSAFE
        -- ports
        port( 
            -- Inputs
            CLK_5M_GL 		: in std_logic;
            MASTER_RST_B 	: in std_logic;
            TEMP_OK 		: in std_logic;
            MS250_CLK_EN 	: in std_logic;

            -- Outputs
            LATCHED_T_FAULT : out std_logic

            -- Inouts

        );
    end component;

begin

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

    -- Clock Driver
    SYSCLK 				<= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

	-- secondary clock en driver (IS NEED TO SIMULATE A FASTER VERSION OF THE 4 HZ CLOCK EN)
	HZ4X1000_SIMCLK 	<= NOT HZ4X1000_SIMCLK after (SIMCLK_PERIOD / 2.0 );

	PROCESS
		BEGIN
		
		IF NSYSRESET	= '0'	THEN
			MS250_CLK_EN		<=	'0';
			CNT_VAL				<=	 0 ;

		ELSIF (CLK_5M_GL'EVENT AND CLK_5M_GL='1')	THEN
			MS250_CLK_EN		<=	N_MS250_CLK_EN_SIG;
			CNT_VAL				<=	N_CNT_VAL;

		END IF;

	MS250_CLK_EN		<=	

    -- Instantiate Unit Under Test:  OVT_FAILSAFE
    OVT_FAILSAFE_0 : OVT_FAILSAFE
        -- port map
        port map( 
            -- Inputs
            CLK_5M_GL 		=> SYSCLK,
            MASTER_RST_B 	=> NSYSRESET,
            TEMP_OK 		=> '0',
            MS250_CLK_EN 	=> SYSCLK,

            -- Outputs
            LATCHED_T_FAULT =>  open

            -- Inouts

        );

end behavioral;

