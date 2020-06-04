library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_MISC.all;
use IEEE.NUMERIC_STD.all;

library proasic3;
use proasic3.all;

entity TB_TOP_LVR_FW is
end TB_TOP_LVR_FW;

architecture behavioral of TB_TOP_LVR_FW is

  constant CLK40MHZ_PERIOD : time := 25 ns;  -- 40MHZ
  constant SPI_PERIOD : time := 3.2 us;  -- 312.5 kHZ

  signal CLK40MHZ  : std_logic := '0';
  signal NSYSRESET : std_logic := '0';

  -- SPI signals
  signal clk312khz                     : std_logic                     := '0';
  signal sca_data_reg, sca_data_reg_in : std_logic_vector(31 downto 0) := x"12345678";
  signal sca_data_reg2                 : std_logic_vector(31 downto 0) := x"1234F078";

  signal SCA_CLK_OUT, sca_clk_mask, sca_dat_out_mask : std_logic;
  signal SCA_RESET_OUT                               : std_logic;
  signal SCA_DAT_OUT                                 : std_logic;
  signal SCA_DAT_IN                                  : std_logic;

  signal CH_MREG_EN : std_logic_vector(8 downto 1);
  signal CH_IAUX_EN : std_logic_vector(8 downto 1);
  signal CH_VOSG_EN : std_logic_vector(8 downto 1);

  signal IN_TEMP_OK    : std_logic;

  signal IN_INVOLTAGE_OK     : std_logic_vector(4 downto 1);
  signal SW3_DUTYCYCLE_MODE  : std_logic;
  signal SW4_SLAVE_PAIRS     : std_logic_vector(4 downto 1);
  signal SW2_SW5_CHANNEL_ON  : std_logic_vector(8 downto 1);
  

  component TOP_LVR_FW
    generic (
      SIM_MODE_EN : integer range 0 to 1 := 0              -- Set to 1 by test bench in simulation 
      );
    -- ports
    port(
      CLK40M_OSC       : in std_logic;                     -- pin 57, external 3.3v 40 mhz clock 
      IN_POWERON_RST_B : in std_logic;                     -- pin 93, active low reset --dedicated rc time constant---needs schmitt-trigger!
      IN_INVOLTAGE_OK  : in std_logic_vector(4 downto 1);  -- pins 36, 40-42: under-voltage lockout failsafe ('1'= above threshold)
      IN_TEMP_OK       : in std_logic;                     -- pin 43: over-temperature failsafe'0'= above the over-temp threshold

-------------------------- DIP SWITCHES --------------------------    
      SW2_SW5_CHANNEL_ON : in std_logic_vector(8 downto 1);  -- pins 27, 26, 23, 22, 15, 13, 11, 10: channels that can be turned on
      SW3_DUTYCYCLE_MODE : in std_logic;                     -- pin 31: '1' = special test low duty cycle mode
      sw3_free_pins      : in std_logic_vector(4 downto 2);  -- pins 30, 29, 28
      SW4_SLAVE_PAIRS    : in std_logic_vector(4 downto 1);  -- pins 21, 20, 19, 16: switch defining slave/master pairs

-------------------------- SPI INTERFACE --------------------------    
      sca_clk_out   : in  std_logic;    -- pin 35, spi clock from the spi master
      sca_reset_out : in  std_logic;    -- pin 34, optional reset from the spi master
      sca_dat_in    : out std_logic;    -- pin 3, serial data from fpga to the spi master
      sca_dat_out   : in  std_logic;    -- pin 2, serial data to the fpga from the spi master

      -- spi debug signals
      db_sca_dat_out : out std_logic;
      db_sca_clk_out : out std_logic;
      db_clk5mhz     : out std_logic;
      db_spi_strobe  : out std_logic;
      db_spi_state   : out std_logic_vector(2 downto 0);
      db_spi_cnt     : out std_logic_vector(1 downto 0);

-------------------------- CHANNEL ENABLES --------------------------    
      OUT_CHANNEL_MREG : out std_logic_vector(8 downto 1);  -- pins {62, 65, 71, 76, 80, 83, 92, 86} main regulator ic, active high
      OUT_CHANNEL_IAUX : out std_logic_vector(8 downto 1);  -- pins {61, 64, 70, 73, 79, 82, 85, 90} iaux regulator ic, active high
      OUT_CHANNEL_VOSG : out std_logic_vector(8 downto 1);  -- pins {60, 63, 69, 72, 78, 81, 84, 91} vos_gen regulator ic, active high

-------------------------- MONITOR AND STATUS --------------------------    
      PWR_OK_LED : out std_logic;       -- pin 95,     status yellow led indicating at least one channel is active
      STATUS_LED : out std_logic        -- pin 77,     steady=uvl's ok, single blink=seu and/or wdt

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
  CLK312KHZ <= not CLK312KHZ after (SPI_PERIOD / 2.0);


  sca_data_reg <= x"1100C9F9" when (sca_reset_out = '0') else
                  sca_data_reg(30 downto 0) & sca_data_reg(31) when falling_edge(sca_clk_out) else
                  sca_data_reg;

  sca_data_reg2 <= x"1000F2C2" when (sca_reset_out = '0') else
                   sca_data_reg2(30 downto 0) & sca_data_reg2(31) when falling_edge(sca_clk_out) else
                   sca_data_reg2;

  sca_data_reg_in <= x"abababab" when (sca_reset_out = '0') else
                     sca_data_reg_in(30 downto 0) & sca_dat_in when rising_edge(sca_clk_out) else
                     sca_data_reg_in;

  SCA_CLK_OUT      <= sca_clk_mask and clk312khz;
  SCA_DAT_OUT      <= sca_data_reg(31) when sca_dat_out_mask = '1' else sca_data_reg2(31);


-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- GENERATE AN INPUT SIGNAL TO TRIGGER A CHANNEL ENABLE EVENT
  process
  begin

    IN_TEMP_OK    <= '1';
    IN_INVOLTAGE_OK    <= "1111";

    SW3_DUTYCYCLE_MODE <= '0';
    SW4_SLAVE_PAIRS    <= "0001";
    SW2_SW5_CHANNEL_ON <= x"FF";
    SCA_CLK_mask     <= '0';
    
    SCA_DAT_OUT_mask <= '1';
    SCA_RESET_OUT    <= '1';
    wait for SPI_PERIOD*5;  

    SCA_RESET_OUT    <= '0';
    wait for SPI_PERIOD*5;  

    SCA_RESET_OUT    <= '1';
    wait for SPI_PERIOD*15;  

    SCA_CLK_mask     <= '1';  ------- SPI command
    wait for SPI_PERIOD*32;
    
    SCA_CLK_mask     <= '0';
    IN_INVOLTAGE_OK    <= "1010";
    wait for 16 us;  

    SCA_CLK_mask     <= '1';  ------- SPI command
    wait for SPI_PERIOD*32;

    IN_INVOLTAGE_OK    <= "1111";
    SCA_CLK_mask     <= '0';
    IN_TEMP_OK    <= '0';
    wait for 17.5 us;  

    SCA_CLK_mask     <= '1';  ------- SPI command
    wait for SPI_PERIOD*32;

    IN_TEMP_OK    <= '1';
    SCA_CLK_mask     <= '0';
    wait for SPI_PERIOD*500;


    SCA_DAT_OUT_mask <= '0';
    SCA_CLK_mask     <= '1';  ------- SPI command
    wait for SPI_PERIOD*32;

    SCA_CLK_mask     <= '0';
    wait for SPI_PERIOD*50;
    
    SCA_DAT_OUT_mask <= '1';
    SCA_CLK_mask     <= '1';  ------- SPI command
    wait for SPI_PERIOD*32;

    SCA_CLK_mask     <= '0';
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
      CLK40M_OSC         => CLK40MHZ,
      IN_POWERON_RST_B   => NSYSRESET,
      IN_INVOLTAGE_OK    => IN_INVOLTAGE_OK,
      IN_TEMP_OK         => IN_TEMP_OK,
      SW3_DUTYCYCLE_MODE => SW3_DUTYCYCLE_MODE,
      SW4_SLAVE_PAIRS    => SW4_SLAVE_PAIRS,
      SW2_SW5_CHANNEL_ON => SW2_SW5_CHANNEL_ON,
      sw3_free_pins => "000",

      SCA_CLK_OUT   => SCA_CLK_OUT,
      SCA_RESET_OUT => SCA_RESET_OUT,
      SCA_DAT_OUT   => SCA_DAT_OUT,

      -- Outputs
      SCA_DAT_IN       => SCA_DAT_IN,
      OUT_CHANNEL_MREG => CH_MREG_EN,
      OUT_CHANNEL_IAUX => CH_IAUX_EN,
      OUT_CHANNEL_VOSG => CH_VOSG_EN,

      PWR_OK_LED         => open,
      STATUS_LED         => open

      );

end behavioral;

