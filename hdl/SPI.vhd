--------------------------------------------------------------------------------
-- Company: University of Maryland
--
-- File: SPI.vhd
-- File history:
--      INIT, APRIL 3, 2019
--      
--
-- Description: 
--
-- SPI PORT: 	SLAVE IMPLEMENTATION WITHOUT USING SLAVE SELECTS
--				NOTE:  THE CLOCK FOR THE INTERFACE ORIGINATES FROM THE SCA MASTER IN ALL DATA EXCHANGES
--				DATA RATE = 156 Kbps (IE ACTUAL SERIAL CLOCK FREQUENCY = LHC 40MHZ / 256 )
--					
-- 	SCA_CLK_OUT		:  	CLOCK INPUT TO THE FPGA FROM THE SCA MASTER
-- 	SCA_DAT_IN		:	DATA OUTPUT FROM THE FPGA TO THE SCA MASTER
-- 	SCA_DAT_OUT		:	DATA INPUT TO THE FPGA FROM THE SCA MASTER
--
-- Targeted device: <Family::ProASIC3> <Die::A3PN250> <Package::100 VQFP>
-- Author: Tom O'Bannon
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity SPI is
port (
        CLK5M_OSC          		:   IN  STD_LOGIC;                      	-- INTERNAL GENERATED 5 MHZ CLOCK 
        MASTER_RST_B           	:   IN  STD_LOGIC;                         	-- INTERNAL ACTIVE LOW RESET

		SCA_CLK_OUT				:  	IN	STD_LOGIC;							-- CLOCK INPUT TO THE FPGA FROM THE SCA MASTER USED FOR BOTH TX AND RX
		SCA_DAT_OUT				:	IN	STD_LOGIC;							-- SERIAL DATA INPUT TO THE FPGA FROM THE SCA MASTER

		SCA_DAT_IN				:	OUT	STD_LOGIC;							-- SERIAL DATA OUTPUT FROM THE FPGA TO THE SCA MASTER
		
		SCA_RX_WORD				:	OUT STD_LOGIC_VECTOR(31 DOWN TO 0);		-- RECEIVED SERIAL FRAME
		SCA_RX_STRB				:	OUT	STD_LOGIC;							-- SINGLE 5MHZ CLOCK PULSE SIGNIFIES A NEW SERIAL FRAME IS AVAILABLE.


	);
end SPI;
architecture architecture_SPI of SPI is

	signal RX_LIVE36BIT_SREG, N_RX_LIVE36BIT_SREG 			: STD_LOGIC_VECTOR(35 DOWNTO 0);		-- 36 BIT SHIFT REGISTER DEDICATED FOR ACTIVE SPI RECEIVE
	signal RX_4x_SAMPLE, N_RX_4X_SAMPLE 					: STD_LOGIC_VECTOR( 3 DOWNTO 0);		--  4 BIT SAMPLE SEQUENCE USED TO QUALIFY EACH BIT INPUT FOR THE RX SHIFT REG

	signal TX_LIVE36BIT_SREG, N_TX_LIVE36BIT_SREG 			: STD_LOGIC_VECTOR(35 DOWNTO 0);		-- 36 BIT SHIFT REGISTER DEDICATED FOR ACTIVE SPI TRANSMIT

begin

-- architecture body

REG


end architecture_SPI;
