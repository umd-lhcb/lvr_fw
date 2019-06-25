----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Fri Jan 11 16:15:40 2019
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: tb_iirFilt.vhd
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
use ieee.std_logic_1164.all;

entity tb_iirFilt is
end tb_iirFilt;

architecture behavioral of tb_iirFilt is

    constant SYSCLK_PERIOD 	: time := 200 ns; -- 5MHZ

    signal SYSCLK 			: std_logic := '0';
    signal NSYSRESET 		: std_logic := '0';
	
	SIGNAL TEST_INPUT		: std_logic_vector(0 to 0) := "0";
	SIGNAL FILT_OUT			: STD_LOGIC_VECTOR(7 DOWNTO 0);
		
	CONSTANT THRESH_LOWER	: STD_LOGIC_VECTOR(7 DOWNTO 0) := "00101100";	--	44 DEC
	CONSTANT THRESH_UPPER	: STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001100";	--  76 DEC

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- instantiate the iir filter component
    component IIR_FILT
        -- ports
        port( 
            -- Inputs
            MASTER_RST_B 	: in std_logic;
            CLK_5M_GL 		: in std_logic;
            SIG_IN 			: in std_logic_vector(0 to 0);
            THRESH_UPPER 	: in std_logic_vector(7 downto 0);
            THRESH_LOWER 	: in std_logic_vector(7 downto 0);

            -- Outputs
            FILT_SIGOUT 	: out std_logic_vector(7 downto 0);
            P_SIGOUT 		: out std_logic

            -- Inouts

        );
    end component;

begin

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- generate a reset
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

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

	
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- GENERATE AN INPUT SIGNAL TO EVAL FILTER + HYSTERISIS
	
	PROCESS
		BEGIN


			TEST_INPUT		<=	"0";						--PLAN SERIAL PERIOD = 156.25KHZ (32 CLOCK PERIODS = 6.4 USEC)

-- GENERATE TEST_INPUT SEQUENCE
			WAIT FOR ( SYSCLK_PERIOD * 50 );				--START EVENT AT 10 uSEC
			TEST_INPUT		<=	"1";
			
			WAIT FOR ( SYSCLK_PERIOD * 482 );				--END EVENT AT 96.4 uSEC
			TEST_INPUT		<=	"0";
			
			WAIT;

		END PROCESS;

	
	
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Instantiate Unit Under Test:  IIR_FILT

    IIR_FILT_0 : IIR_FILT
        -- port map
        port map( 
            -- Inputs
            MASTER_RST_B 	=> NSYSRESET,
            CLK_5M_GL 		=> SYSCLK,
            SIG_IN 			=> TEST_INPUT,
            THRESH_UPPER 	=> THRESH_UPPER,
            THRESH_LOWER 	=> THRESH_LOWER,

            -- Outputs
            FILT_SIGOUT 	=> FILT_OUT,
            P_SIGOUT 		=> open

            -- Inouts

        );

end behavioral;

