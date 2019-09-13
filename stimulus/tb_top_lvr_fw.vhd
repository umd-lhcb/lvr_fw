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
-- File: TB_TOP_LVR_FW.vhd
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_MISC.all;
USE IEEE.NUMERIC_STD.ALL;

library proasic3;
use proasic3.all;

--library synplify;
--use synplify.attributes.all;


entity TB_TOP_LVR_FW is
end TB_TOP_LVR_FW;

architecture behavioral of TB_TOP_LVR_FW is

  constant CLK40MHZ_PERIOD : time := 25 ns;  -- 40MHZ

  signal CLK40MHZ    : std_logic := '0';
  signal NSYSRESET : std_logic := '0';

  -- SPI signals
  signal clk312khz : std_logic := '0';
  signal counter_clk312khz : integer := 0;
  signal sca_data_reg, sca_data_reg_in : std_logic_vector(31 downto 0) := x"12345678";

  signal SCA_CLK_OUT, sca_clk_mask      : std_logic;
  signal SCA_RESET_OUT    : std_logic;
  signal SCA_DAT_OUT      : std_logic;
  signal SCA_DAT_IN       : std_logic;

  signal CH_MREG_EN : std_logic_vector(7 downto 0);
  signal CH_IAUX_EN : std_logic_vector(7 downto 0);
  signal CH_VOSG_EN : std_logic_vector(7 downto 0);

  signal TEMPSIMPROBE : std_logic;

  signal CH_ENABLE : std_logic;

  signal CH_ACTIVE_STAT : std_logic;
  signal STDBY_OFFB     : std_logic;

  signal MAINSEQ_STATE : std_logic_vector(3 downto 0);

  signal TEMP_OK    : std_logic_vector(0 downto 0);
  signal FUSE_12_OK : std_logic_vector(0 downto 0);
  signal FUSE_34_OK : std_logic_vector(0 downto 0);

  component TOP_LVR_FW
  generic (
    SIM_MODE_EN : integer range 0 to 1 := 0  -- Set to 1 by test bench in simulation 
    );  
    -- ports
    port(
      -- Inputs
      CLK40MHZ_OSC       : in std_logic;
      POR_FPGA         : in std_logic;
      FPGA_FUSE_1_2_OK : in std_logic_vector(0 downto 0);
      FPGA_FUSE_3_4_OK : in std_logic_vector(0 downto 0);
      FPGA_FUSE_5_6_OK : in std_logic_vector(0 downto 0);
      FPGA_FUSE_7_8_OK : in std_logic_vector(0 downto 0);
      TEMP_OK          : in std_logic_vector(0 downto 0);
      MODE_DCYC_NORMB  : in std_logic;
      MODE_WDT_EN      : in std_logic;
      MODE_DIAG_NORMB  : in std_logic;
      CH1_2_MS_CFG_EN  : in std_logic;
      CH3_4_MS_CFG_EN  : in std_logic;
      CH5_6_MS_CFG_EN  : in std_logic;
      CH7_8_MS_CFG_EN  : in std_logic;
      MAN_EN_CH_4TO1   : in std_logic;
      MAN_EN_CH_8TO5   : in std_logic;
      TEMP_FAILSAFE_EN : in std_logic;
      STDBY_OFFB       : in std_logic;
      RX_FPGA          : in std_logic;
      ADDR_SEL         : in std_logic_vector(4 downto 0);
      SCA_CLK_OUT      : in std_logic;
      SCA_RESET_OUT    : in std_logic;
      SCA_DAT_OUT      : in std_logic;
      UNUSED_1         : in std_logic;
      UNUSED_2         : in std_logic;
      J11_25_TCONN     : in std_logic;
      J11_27_TCONN     : in std_logic;

      -- Outputs
      TX_FPGA            : out std_logic;
      PRI_RX_EN_BAR      : out std_logic;
      PRI_TX_EN          : out std_logic;
      SCA_DAT_IN         : out std_logic;
      POR_OUT_TO_SCA     : out std_logic;
      P_CH_MREG_EN       : out std_logic_vector(7 downto 0);
      P_CH_IAUX_EN       : out std_logic_vector(7 downto 0);
      P_CH_VOSG_EN       : out std_logic_vector(7 downto 0);
      PWR_OK_LED         : out std_logic;
      STATUS_LED         : out std_logic;
      BUF5M_J11_15_TCONN : out std_logic;
      J11_17_TCONN       : out std_logic;
      J11_19_TCONN       : out std_logic;
      J11_21_TCONN       : out std_logic;
      J11_23_TCONN       : out std_logic

      -- Inouts

      );
  end component;

begin

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- GENERATE A RESET SIGNAL EVENT
  process
    variable vhdl_initial : boolean := true;

  begin
    if (vhdl_initial) then
      -- Assert Reset
      NSYSRESET <= '0';
      wait for (CLK40MHZ_PERIOD * 10);

      NSYSRESET <= '1';
      wait;
    end if;
  end process;


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  -- Clock Driver
  CLK40MHZ <= not CLK40MHZ after (CLK40MHZ_PERIOD / 2.0);

  
  Divide_Frequency : process(clk40mhz)
  begin
    if clk40mhz'event and clk40mhz = '1' then
      if counter_clk312khz = 64 then
        counter_clk312khz <= 1;
        if clk312khz = '1' then
          clk312khz <= '0';
        else
          clk312khz <= '1';
        end if;
      else
        counter_clk312khz <= counter_clk312khz + 1;
      end if;
    end if;
  end process Divide_Frequency;
  
  sca_data_reg <= x"12345678" when (sca_reset_out = '0') else
                sca_data_reg(30 downto 0) & sca_data_reg(31) when falling_edge(sca_clk_out) else
                sca_data_reg;

  sca_data_reg_in <= x"abababab" when (sca_reset_out = '0') else
                sca_data_reg_in(30 downto 0) & sca_dat_in when rising_edge(sca_clk_out) else
                sca_data_reg_in;

  SCA_CLK_mask <= '0', '1' after 32.5 us, '0' after 135 us, '1' after 141 us, '0' after 243.5 us, '1' after 251 us, '0' after 352 us;
  SCA_CLK_OUT   <= sca_clk_mask and clk312khz;
  SCA_RESET_OUT <= '1', '0' after 10 us, '1' after 20 us;
  SCA_DAT_OUT   <= sca_data_reg(31);

  
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- GENERATE AN INPUT SIGNAL TO TRIGGER A CHANNEL ENABLE EVENT

  process
  begin


    CH_ENABLE  <= '0';
    STDBY_OFFB <= '0';

    TEMP_OK    <= "0";
    FUSE_12_OK <= "0";
    FUSE_34_OK <= "0";

    wait for (CLK40MHZ_PERIOD * 20000);   -- 0.5 MSEC
    STDBY_OFFB <= '1';

    wait for (CLK40MHZ_PERIOD * 20000);   -- SET TEMP = OK
    TEMP_OK    <= "1";
    FUSE_12_OK <= "0";
    FUSE_34_OK <= "0";

    wait for (CLK40MHZ_PERIOD * 20000);  -- SET TEMP = OK & ONE OF THE INPUTS TO BE ABOVE UVL MIN
    TEMP_OK    <= "1";
    FUSE_12_OK <= "1";
    FUSE_34_OK <= "0";
    CH_ENABLE  <= '1';

    wait for (CLK40MHZ_PERIOD * 20000);   --
    TEMP_OK    <= "1";
    FUSE_12_OK <= "1";
    FUSE_34_OK <= "1";

    wait for (CLK40MHZ_PERIOD * 20000);   --
    TEMP_OK    <= "0";
    FUSE_12_OK <= "1";
    FUSE_34_OK <= "1";

    wait for (CLK40MHZ_PERIOD * 20000);   --
    TEMP_OK    <= "0";
    FUSE_12_OK <= "1";
    FUSE_34_OK <= "1";

    wait for (CLK40MHZ_PERIOD * 20000);   --
    TEMP_OK    <= "1";
    FUSE_12_OK <= "1";
    FUSE_34_OK <= "1";

    wait for (CLK40MHZ_PERIOD * 20000);   --
    CH_ENABLE <= '1';

    wait for (CLK40MHZ_PERIOD * 20000);   --
    CH_ENABLE <= '1';

    wait;

  end process;
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  -- Instantiate Unit Under Test:  TOP_LVR_FW
  TOP_LVR_FW_0 : TOP_LVR_FW
    generic map(
      SIM_MODE_EN => 1)
    -- port map
    port map(
      -- Inputs
      CLK40MHZ_OSC       => CLK40MHZ,
      POR_FPGA         => NSYSRESET,
      FPGA_FUSE_1_2_OK => FUSE_12_OK,
      FPGA_FUSE_3_4_OK => FUSE_34_OK,
      FPGA_FUSE_5_6_OK => "0",
      FPGA_FUSE_7_8_OK => "0",
      TEMP_OK          => TEMP_OK,
      MODE_DCYC_NORMB  => '0',
      MODE_WDT_EN      => '0',
      MODE_DIAG_NORMB  => '0',
      CH1_2_MS_CFG_EN  => '0',
      CH3_4_MS_CFG_EN  => '1',
      CH5_6_MS_CFG_EN  => '0',
      CH7_8_MS_CFG_EN  => '0',
      MAN_EN_CH_4TO1   => CH_ENABLE,
      MAN_EN_CH_8TO5   => CH_ENABLE,
      TEMP_FAILSAFE_EN => '0',
      STDBY_OFFB       => STDBY_OFFB,
      RX_FPGA          => '0',
      ADDR_SEL         => (others => '0'),
      SCA_CLK_OUT      => SCA_CLK_OUT,
      SCA_RESET_OUT    => SCA_RESET_OUT,
      SCA_DAT_OUT      => SCA_DAT_OUT,
      UNUSED_1         => '0',
      UNUSED_2         => '0',
      J11_25_TCONN     => '0',
      J11_27_TCONN     => '0',

      -- Outputs
      TX_FPGA            => TEMPSIMPROBE,
      PRI_RX_EN_BAR      => open,
      PRI_TX_EN          => open,
      SCA_DAT_IN         => SCA_DAT_IN,
      POR_OUT_TO_SCA     => open,
      P_CH_MREG_EN       => CH_MREG_EN,
      P_CH_IAUX_EN       => CH_IAUX_EN,
      P_CH_VOSG_EN       => CH_VOSG_EN,
      PWR_OK_LED         => open,
      STATUS_LED         => CH_ACTIVE_STAT,
      BUF5M_J11_15_TCONN => open,
      J11_17_TCONN       => MAINSEQ_STATE(0),
      J11_19_TCONN       => MAINSEQ_STATE(1),
      J11_21_TCONN       => MAINSEQ_STATE(2),
      J11_23_TCONN       => MAINSEQ_STATE(3)

      -- Inouts

      );

end behavioral;

