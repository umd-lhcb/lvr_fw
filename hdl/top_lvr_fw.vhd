--------------------------------------------------------------------------------
-- Description: LV regulator serial control interface
--      functions:
--                      1) under-voltage lockout failsafe--check each of 4 fuses
--                                              a) requires that each fuse section treated as separate independent control centers
--                                      2) board over-temperature failsafe check
--                                              a) latched condition for entire board
--                      3) spi serial comm
--                      4) regulator channel sequence controls

--                      (a) single gbt-sca spi slave when addr_sel(4:0)= 1f hex
--                                      note that this spi port operates as a shift register driven by the gbt-sca spi clock.  
--                                      a clock boundary crossing is initiated once the spi clock stops


--
-- Targeted device: <family::ProASIC3> <die::A3PN250> <package::100 VQFP>
-- Authors: Tom O'Bannon, Manuel Franco Sevilla
--------------------------------------------------------------------------------

library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;
--use ieee.numeric_std.all;

library proasic3;
use proasic3.all;

-- note:  the synplify library needs to be commented out for modelsim presynth sims since modelsim does not recognize it
--library synplify;
--use synplify.attributes.all;

entity top_lvr_fw is
  generic (
    SIM_MODE_EN : integer range 0 to 1 := 0              -- set to 1 by test bench in simulation 
    );
  port (
    CLK40M_OSC       : in std_logic;                     -- pin 57, external 3.3v 40 mhz clock 
    IN_POWERON_RST_B : in std_logic;                     -- pin 93, active low reset --dedicated rc time constant---needs schmitt-trigger!
    IN_INVOLTAGE_OK  : in std_logic_vector(4 downto 1);  -- pins 36, 40-42: under-voltage lockout failsafe ('1'= above threshold)
    IN_TEMP_OK       : in std_logic;                     -- pin 43: over-temperature failsafe'0'= above the over-temp threshold

-------------------------- DIP SWITCHES --------------------------    
    SW2_SW3_CHANNEL_ON_BAR : in std_logic_vector(8 downto 1);  -- pins 22, 23, 26, 27, 28, 29, 30, 31: channels that can be turned on
    SW4_SLAVE_PAIRS_BAR    : in std_logic_vector(4 downto 1);  -- pins 16, 19, 20, 21: switch defining slave/master pairs
    SW5_DEFAULT_TURNON_BAR : in std_logic;                     -- pin 15: '1' = channels turn on by default
    SW5_DUTYCYCLE_MODE_BAR : in std_logic;                     -- pin 13: '1' = special test low duty cycle mode

-------------------------- SPI INTERFACE --------------------------    
    sca_clk_out   : in  std_logic;      -- pin 35, spi clock from the spi master
    sca_reset_out : in  std_logic;      -- pin 34, optional reset from the spi master
    sca_dat_in    : out std_logic;      -- pin 3, serial data from fpga to the spi master
    sca_dat_out   : in  std_logic;      -- pin 2, serial data to the fpga from the spi master

-------------------------- DEBUG to J11 CONNECTOR  --------------------------    
    J11_DEBUG     : out std_logic_vector(7 downto 0);  -- pins {6, 45, 44, 5, 7, 8, 32, 33}

-------------------------- CHANNEL ENABLES --------------------------    
    OUT_CHANNEL_MREG : out std_logic_vector(8 downto 1);  -- pins {62, 65, 71, 76, 80, 83, 92, 86} main regulator ic, active high
    OUT_CHANNEL_IAUX : out std_logic_vector(8 downto 1);  -- pins {61, 64, 70, 73, 79, 82, 85, 90} iaux regulator ic, active high
    OUT_CHANNEL_VOSG : out std_logic_vector(8 downto 1);  -- pins {60, 63, 69, 72, 78, 81, 84, 91} vos_gen regulator ic, active high

-------------------------- MONITOR AND STATUS --------------------------    
    PWR_OK_LED : out std_logic;         -- pin 95,     status yellow led indicating at least one channel is active
    STATUS_LED : out std_logic          -- pin 77,     steady=uvl's ok, single blink=seu and/or wdt

    );

end top_lvr_fw;

architecture rtl of top_lvr_fw is


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--attribute syn_radhardlevel of rtl : architecture is "tmr";
--attribute syn_hier of rtl         : architecture is "firm";
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- notes:  !!!!!        specific i/o features (eg hysteresis ) need to be assigned in the constraints file  !!!!
--                 !!!!!        the syn_encoding for each of the state machines needs to have a "safe, original" fsm encoding 
  --- specified in the synth constraint file     !!!!!!!
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- iir filter with several uses:
--              (2) IN_TEMP_OK       filtered result:  filtd_temp_ok
--              (3) IN_INVOLTAGE_OK (4 filters for 4 signals)                                                                                  
  component iir_filt is
    port (
      master_rst_b : in std_logic;      -- reset with async assert, but synchronized to the 40 mhz clock edge
      clk_5m_gl    : in std_logic;

      sig_in       : in  std_logic;                     -- input signal to be filtered
      thresh_upper : in  std_logic_vector(8 downto 1);  -- upper hysterisis threshold (ie rising signal threshold)
      thresh_lower : in  std_logic_vector(8 downto 1);  -- lower hysterisis threshold (ie falling signal threshold)
      filt_sigout  : out std_logic_vector(8 downto 1);  -- resulting signal filter value 
      p_sigout     : out std_logic                      -- final signal bit value after the filter function and hysterisis have been applied

      );
  end component;

  component clkbuf
    port (pad : in std_logic; y : out std_logic);
  end component;


  -- spi interface with tcm
  component spi_slave is
    port (
      clk5mhz_osc  : in std_logic;      -- internal generated 5 mhz clock 
      master_rst_b : in std_logic;      -- internal active low reset

      spi_clk  : in  std_logic;         -- clock input to the fpga from the sca master used for both tx and rx
      spi_mosi : in  std_logic;         -- serial data input to the fpga from the sca master
      spi_miso : out std_logic;         -- serial data output from the fpga to the sca master

      spi_tx_word : in  std_logic_vector(31 downto 0);  -- 32 bit serial word to be transmitted
      spi_rx_word : out std_logic_vector(31 downto 0);  -- received serial frame
      spi_rx_strb : out std_logic;                      -- single 5mhz clock pulse signifies a new serial frame is available.
      SPI_TIMEOUT_PULSE : out std_logic;  -- Pulse indicating previous command timed out

      p_tx_32bit_reg : out std_logic_vector(31 downto 0);
      clk_fcnt_out   : out std_logic_vector(4 downto 0);
      p_state_id     : out std_logic_vector(3 downto 0)

      );
  end component;

-- main communication and sequencer mopdule
  component main_sequencer_new is
    port (
      master_rst_b : in std_logic;      -- reset with async assert, but synchronized to the 40 mhz clock edge
      clk_5m_gl    : in std_logic;      -- master 5 mhz clock

      channels_ready : in std_logic_vector(1 downto 0);  -- channels in a ready state (110 or 111)
      channels_on    : in std_logic_vector(1 downto 0);  -- channels on (110)

-- the master-slave config determines the enable for the v_os op ampl!  
      master_slave_pair : in std_logic;  -- adjacent channels a and b in the same fuse group

      cmnd_word_stb : in std_logic;     -- [unused] single clock pulse strobe indicates an updated command word

      dtycyc_en : in std_logic;         -- '1' enables a low duty cycle mode to limit thermal loads for special tests

      sim_mode_en : in integer;         -- '1' is special sim mode with reduced interval timeouts

      OUT_CHANNEL_MREG : out std_logic_vector(1 downto 0);  -- channel enable signal: main regulator ic, active high
      OUT_CHANNEL_IAUX : out std_logic_vector(1 downto 0);  -- channel enable signal: iaux regulator ic, active high
      OUT_CHANNEL_VOSG : out std_logic_vector(1 downto 0);  -- channel enable signal: vos_gen regulator ic, active high

      p_seq_stepval : out std_logic_vector(3 downto 0)  -- indicates present sequence step
      );
  end component;

--===========special test components:==============
  component slow_pulse_en_gen is
    port (
      clk_5m_gl    : in std_logic;      -- fpga master clock--assumed to be 5 mhz
      master_rst_b : in std_logic;      -- active low reset
      cnt_en       : in std_logic;      -- active high count enable
      sim_25kx     : in integer;        -- special sim mode--speeds up by 25,000 times (0.25sec=10usec)

      ms250_clk_en : out std_logic      -- output pulse signifies 1 sec interval--suitable for use as a clock enable.
      );
  end component;


-- ccc config as 3 global buffers
  component ccc_glob_3xbuff is

    port(
      powerdown : in  std_logic;
      clka      : in  std_logic;
      lock      : out std_logic;
      gla       : out std_logic;
      glb       : out std_logic;
      glc       : out std_logic;
      sdin      : in  std_logic;
      sclk      : in  std_logic;
      sshift    : in  std_logic;
      supdate   : in  std_logic;
      mode      : in  std_logic;
      sdout     : out std_logic;
      clkb      : in  std_logic;
      clkc      : in  std_logic
      );
  end component;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- define internal signals
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  signal gb_clk40mhz_osc : std_logic;   -- global clock buffer
  signal gb_spi_rst_b    : std_logic;   -- global combined internal fpga reset

  signal master_rst_b   : std_logic;    -- IN_POWERON_RST_B sync'd to the 40 mhz clock
  signal del0_dev_rst_b : std_logic;    -- sync ff for for generating the master_rst_b

  signal clk_5m_gl, n_clk_5m_gl : std_logic;             -- generated 5 mhz clock--master clock!!!!
  signal refcnt, n_refcnt       : integer range 0 to 3;  -- counter used to generate the clk_5m_gl

  signal slow_pls_stb                     : std_logic;  -- this is a pulse that is one 5mhz clock period wide at 0.25sec rate
  signal dc50_test_strb, n_dc50_test_strb : std_logic;  -- this is a 50% duty cycle 2 hz signal version of slow_pls_stb

  signal ch_mreg_en : std_logic_vector(8 downto 1);  -- channel enable signal: main regulator ic, active high
  signal ch_iaux_en : std_logic_vector(8 downto 1);  -- channel enable signal: iaux regulator ic, active high
  signal ch_vosg_en : std_logic_vector(8 downto 1);  -- channel enable signal: vos_gen regulator ic, active high

-- these signals are used to debounce the dip switches used for manual tests (SW2_SW3_CHANNEL_ON_BAR)
  signal n_sw2_sw5_channel_on_a, sw2_sw5_channel_on_a         : std_logic_vector(8 downto 1);
  signal n_sw2_sw5_channel_on_b, sw2_sw5_channel_on_b         : std_logic_vector(8 downto 1);
-- these are the debounced versions of the dip switches
  signal n_active_switch_constraints, active_switch_constraints : std_logic_vector(8 downto 1);  --constraints coming from external switch
  signal total_channel_constraints : std_logic_vector(8 downto 1);  --constraints coming from external switch, temperature, and undervoltage

  signal n_dtycyc_cnt, dtycyc_cnt : integer range 0 to (2**5)-1;        -- duty cycle counter
  constant dtycyc_time            : integer range 0 to (2**5)-1 := 19;  -- duty cycle counter timeout interval (20 * 0.250 sec)~5%
  signal n_dtycyc_en, dtycyc_en   : std_logic;                          -- local enable used for the special test low duty cycle op mode

  signal filtd_temp_ok : std_logic;     -- filtered version of the IN_TEMP_OK status

  signal channels_ready, channels_on             : std_logic_vector(8 downto 1) := (others => '0');  ---active lvr channels
  signal channels_to_be_ready, channels_to_be_on : std_logic_vector(8 downto 1) := (others => '0');  --to be active lvr channels
  signal channels_desired_ready, channels_desired_on : std_logic_vector(8 downto 1) := (others => '0');  --to be active lvr channels
  signal channel_is_slave                        : std_logic_vector(8 downto 1) := (others => '0');  --which channels are slaves (1,3,5,7 always master, so '0')
  signal channel_involtage_ok                    : std_logic_vector(4 downto 1) := (others => '0');  --which channels have ok input voltage

  signal dutycycle_mode, spi_dutycycle_mode : std_logic := '0';

  -- spi variables
  signal spi_tx_word                : std_logic_vector(31 downto 0) := x"dcb02019";  -- 32 bit serial word to be transmitted
  signal spi_rx_word                : std_logic_vector(31 downto 0);                 -- received serial frame
  signal spi_rx_strb                : std_logic;  -- single 5mhz clock pulse signifies a new serial frame is available.
  signal spi_timeout_pulse, spi_timeout                : std_logic := '0'; 
  signal spi_p_tx_32bit_reg         : std_logic_vector(31 downto 0);
  signal spi_p_state_id             : std_logic_vector(3 downto 0);
  signal clk_fcnt_out               : std_logic_vector(4 downto 0);
  signal sca_clk_out_buf, spi_rst_b : std_logic;
  signal read_fpga_params, bad_parity : std_logic := '0';

  constant fw_version : std_logic_vector(11 downto 0) := x"202";
-- debug
  signal iir_ovt_filt   : std_logic_vector(8 downto 1);

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
begin

  glob_buff : ccc_glob_3xbuff

    port map(
      powerdown => '0',
      clka      => CLK40M_OSC,
      lock      => open,
      gla       => gb_clk40mhz_osc,
      glb       => sca_clk_out_buf,
      glc       => gb_spi_rst_b,
      sdin      => '0',
      sclk      => '0',
      sshift    => '0',
      supdate   => '0',
      mode      => '0',
      sdout     => open,
      clkb      => sca_clk_out,
      clkc      => spi_rst_b
      );

  spi_rst_b <= sca_reset_out and master_rst_b;

  -- spi
  spi_slave_pm : spi_slave
    port map (
      clk5mhz_osc  => clk_5m_gl,        -- internal generated 5 mhz clock 
      master_rst_b => gb_spi_rst_b,     -- internal active low reset

      spi_clk  => sca_clk_out_buf,      -- clock input to the fpga from the spi master used for both tx and rx
      spi_mosi => sca_dat_out,          -- serial data input to the fpga from the spi master
      spi_miso => sca_dat_in,           -- serial data output from the fpga to the spi master

      spi_tx_word => spi_tx_word,       -- 32 bit serial word to be transmitted
      spi_rx_word => spi_rx_word,       -- received serial frame
      spi_rx_strb => spi_rx_strb,       -- single 5mhz clock pulse signifies a new serial frame is available.

      spi_timeout_pulse => spi_timeout_pulse, -- Pulse indicating previous command timed out

      p_tx_32bit_reg => spi_p_tx_32bit_reg,
      clk_fcnt_out   => clk_fcnt_out,
      p_state_id     => spi_p_state_id
      );


  -- Constraints coming from external switch, temperature, and undervoltage
  gen_total_constraints : for index in 1 to 4 generate
  begin
    total_channel_constraints(index*2 downto index*2-1) <= active_switch_constraints(index*2 downto index*2-1)
                                                           and filtd_temp_ok & filtd_temp_ok
                                                           and channel_involtage_ok(index) & channel_involtage_ok(index);
  end generate gen_total_constraints;
  
  channels_ready <= channels_desired_ready and total_channel_constraints;
  channels_on    <= channels_desired_on and total_channel_constraints;
  dutycycle_mode <= spi_dutycycle_mode or not SW5_DUTYCYCLE_MODE_BAR;
  -- spi word to be transmitted
  spi_tx_word <= xor_reduce(spi_tx_word(30 downto 0)) & "000" & spi_timeout & bad_parity & not filtd_temp_ok & dutycycle_mode &
                 not SW4_SLAVE_PAIRS_BAR & not channel_involtage_ok &
                 channels_ready & channels_on when read_fpga_params = '0' else
                 --x"00" & active_switch_constraints & x"0" & fw_version;
                 x"00" & not SW2_SW3_CHANNEL_ON_BAR & x"0" & fw_version;

  --spi_tx_word <= x"dcb02019" when gb_spi_rst_b = '0' else
  --               spi_rx_word when falling_edge(spi_rx_strb) else
  --               spi_tx_word;

-- forcing the slave channels to have the same standby/on status as the master
  gen_slave_constraints : for index in 1 to 4 generate
  begin
    -- indices for spi_rx_word go from 0 to 15, while the others go from 1 to 8
    -- slaves are assigned same value as their masters (index_slave - 1)
    channels_to_be_ready(index*2-1) <= spi_rx_word(index*2+6);
    
    channels_to_be_ready(index*2)   <= spi_rx_word(index*2+7) when channel_is_slave(index*2) = '0' else
                                       spi_rx_word(index*2+6);
    
    channels_to_be_on(index*2-1) <= spi_rx_word(index*2-2) and channels_to_be_ready(index*2-1);
    
    channels_to_be_on(index*2)   <= spi_rx_word(index*2-1) and channels_to_be_ready(index*2) when channel_is_slave(index*2) = '0' else
                                    spi_rx_word(index*2-2) and channels_to_be_ready(index*2-1);
    -- converting the 4 pairs to the 8-bit vector
    channel_is_slave(index*2 downto index*2-1) <= not SW4_SLAVE_PAIRS_BAR(index) & '0';
  end generate gen_slave_constraints;

-- setting register to control active channels when the received is a write (28th bit equal to 1)
  set_channels_ready : process(spi_rx_strb, master_rst_b, spi_rx_word)
  begin
    if master_rst_b = '0' then
      channels_desired_ready <= (others => not SW5_DEFAULT_TURNON_BAR); 
      channels_desired_on    <= (others => not SW5_DEFAULT_TURNON_BAR); 
      spi_dutycycle_mode <= not SW5_DUTYCYCLE_MODE_BAR;
      read_fpga_params <= '0';
      spi_timeout <= '0';
      bad_parity <= '0';
    elsif falling_edge(spi_rx_strb) then
      if spi_timeout_pulse = '1' then
        spi_timeout <= '1';
      else
        spi_timeout <= '0';
        if xor_reduce(spi_rx_word(30 downto 0)) = spi_rx_word(31) then
          if spi_rx_word(30 downto 28) = "111" then
            channels_desired_ready <= channels_to_be_ready;
            channels_desired_on    <= channels_to_be_on;
            spi_dutycycle_mode <= spi_rx_word(24);
          end if;
          bad_parity <= '0';
        else
          bad_parity <= '1';
        end if;
      
        if spi_rx_word(30 downto 28) = "001" then
          read_fpga_params <= '1';
        else
          read_fpga_params <= '0';
        end if;
      end if;
    end if;
  end process set_channels_ready;


  -- Debug signals sent to J11 connector
  J11_DEBUG(1 downto 0) <= SW4_SLAVE_PAIRS_BAR(2 downto 1);
  J11_DEBUG(2) <= SW2_SW3_CHANNEL_ON_BAR(2);
  J11_DEBUG(3) <= SW2_SW3_CHANNEL_ON_BAR(6);
  J11_DEBUG(4) <= SW5_DUTYCYCLE_MODE_BAR;
  J11_DEBUG(5) <= SW5_DEFAULT_TURNON_BAR;
  J11_DEBUG(6) <= SW2_SW3_CHANNEL_ON_BAR(1);
  J11_DEBUG(7) <= SW2_SW3_CHANNEL_ON_BAR(5);


-- this process synchronizes the external IN_POWERON_RST_B signal to the 40 mhz clock
-- however, the generated 5 mhz clock is synchronously started by release of the master_rst_b
  sync_dev_rst_b : process(IN_POWERON_RST_B, CLK40M_OSC)
  begin
    if IN_POWERON_RST_B = '0' then
      del0_dev_rst_b <= '0';
      master_rst_b   <= '0';

    elsif (CLK40M_OSC'event and CLK40M_OSC = '1') then
      del0_dev_rst_b <= IN_POWERON_RST_B;
      master_rst_b   <= del0_dev_rst_b;

    end if;

  end process sync_dev_rst_b;
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- registers used to generate a 5 mhz clock (div-by-4 followed by div-by-2)
  genclkreg : process(master_rst_b, CLK40M_OSC)
  begin
    if master_rst_b = '0' then
      clk_5m_gl <= '0';
      refcnt    <= 0;

    elsif (CLK40M_OSC'event and CLK40M_OSC = '1') then
      clk_5m_gl <= n_clk_5m_gl;
      refcnt    <= n_refcnt;

    end if;

  end process genclkreg;

-- process to generate the 5 mhz clock
  gen_5m_clk : process(refcnt, clk_5m_gl)
  begin
    if refcnt > 2 then
      n_refcnt    <= 0;
      n_clk_5m_gl <= not(clk_5m_gl);

    else
      n_refcnt    <= refcnt + 1;
      n_clk_5m_gl <= clk_5m_gl;
    end if;
  end process;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- define all registers that use the 5 mhz clock
  reg5m : process(clk_5m_gl, master_rst_b)
  begin
    if master_rst_b = '0' then          -- ff outputs

      dc50_test_strb <= '0';

      sw2_sw5_channel_on_a <= (others => '0');
      sw2_sw5_channel_on_b <= (others => '0');

      active_switch_constraints <= (others => '0');

      dtycyc_cnt <= dtycyc_time;        -- duty cycle interval counter for special test
      dtycyc_en  <= '0';                -- local signal used the low duty cycle special test mode

    elsif (clk_5m_gl'event and clk_5m_gl = '1') then  -- corresponding ff inputs

      dc50_test_strb <= n_dc50_test_strb;

      sw2_sw5_channel_on_a <= n_sw2_sw5_channel_on_a;
      sw2_sw5_channel_on_b <= n_sw2_sw5_channel_on_b;

      active_switch_constraints <= n_active_switch_constraints;

      dtycyc_cnt <= n_dtycyc_cnt;
      dtycyc_en  <= n_dtycyc_en;

    end if;

  end process;

-- --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- -- placeholder
-- -- process that waits for >35 '0' bits followed by 2 start bits in the filtered rs485 rx line and then generates 36 clock cycles 



-- --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- -- placeholder
-- -- process that performs the mux selection of either the rs485 or the spi por clock and serial data sources 



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- for local stand-alone test
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- debounce the dip switches
-- primary outputs for this process are 3 debounced dip switch signals used for manual channel enable:
--      1) active_switch_constraints
  debounce : process(SW2_SW3_CHANNEL_ON_BAR, sw2_sw5_channel_on_a, sw2_sw5_channel_on_b,
                     slow_pls_stb, dc50_test_strb
                     )
  begin

    -- this is the debounce sampling.
    if slow_pls_stb = '1' then                  -- test strobe is a single 5mhz clock period that occurs every 250msec
      n_dc50_test_strb <= not(dc50_test_strb);  -- create a 50% duty cycle version 

      n_sw2_sw5_channel_on_a <= not SW2_SW3_CHANNEL_ON_BAR;  -- sample the dip switches at 250 msec intervals via a 2 deep pipeline for debounce
      n_sw2_sw5_channel_on_b <= sw2_sw5_channel_on_a;
    else
      n_dc50_test_strb <= dc50_test_strb;

      n_sw2_sw5_channel_on_a <= sw2_sw5_channel_on_a;  -- remember the last sample if not a sample update
      n_sw2_sw5_channel_on_b <= sw2_sw5_channel_on_b;
    end if;

    for index in SW2_SW3_CHANNEL_ON_BAR'low to SW2_SW3_CHANNEL_ON_BAR'high loop
      if (not SW2_SW3_CHANNEL_ON_BAR(index) and sw2_sw5_channel_on_a(index) and sw2_sw5_channel_on_b(index)) = '1' then
        n_active_switch_constraints(index) <= '1';
      else
        n_active_switch_constraints(index) <= '0';
      end if;
    end loop;

  end process debounce;


-- low duty cycle counter for special tests: generates dtycyc_en
  ldccnt : process(dutycycle_mode, dtycyc_cnt, slow_pls_stb, dtycyc_en)
  begin

    case dutycycle_mode is

      when '0' =>  -- normal op mode, so low cycle function is inactived                                                                        
        n_dtycyc_cnt <= dtycyc_time;
        n_dtycyc_en  <= '1';            -- this bit only active for special test mode with the low duty cycle
      -- bit stuck at '1' leaves downstream signals in continuos op mode
      when '1' =>                       -- special test low duty cycle mode is active

        if slow_pls_stb = '1' then        -- only update when this strobe is pulsed (1 clock cycle strobe)
          if dtycyc_cnt = 0 then          -- low duty cycle mode is selected
            n_dtycyc_cnt <= dtycyc_time;  -- reload counter on 0 count
            n_dtycyc_en  <= '1';          -- this bit only active for special test mode with the low duty cycle for 250 msec
          else
            n_dtycyc_cnt <= dtycyc_cnt - 1;
            n_dtycyc_en  <= '0';          -- this bit only active for special test mode with the low duty cycle for 250 msec
          end if;

        else                            -- keep signal states unchanged

          n_dtycyc_cnt <= dtycyc_cnt;
          n_dtycyc_en  <= dtycyc_en;

        end if;

      when others => null;
    end case;

  end process ldccnt;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- instantiate the sequencer modules
  gen_channel_seqs : for index in 1 to 4 generate
  begin
    channel_seq: main_sequencer_new
      port map (
        master_rst_b => master_rst_b,     -- reset with async assert, but synchronized to the 40 mhz clock edge
        clk_5m_gl    => clk_5m_gl,        -- master 5 mhz clock

        channels_ready => channels_ready(index*2 downto index*2-1),  -- channels in a ready state (110 or 111)
        channels_on    => channels_on(index*2 downto index*2-1),     -- channels on (110)
        master_slave_pair => channel_is_slave(index*2),  

        cmnd_word_stb => slow_pls_stb,    -- [unused] single clock pulse strobe indicates check for an updated en command word

        dtycyc_en => dtycyc_en,                -- '1' enables a low duty cycle mode to limit thermal loads for special tests

        sim_mode_en => SIM_MODE_EN,       -- '1' is special sim mode with reduced timeouts.....

        OUT_CHANNEL_MREG => ch_mreg_en(index*2 downto index*2-1),  -- channel enable signal: main regulator ic, active high
        OUT_CHANNEL_IAUX => ch_iaux_en(index*2 downto index*2-1),  -- channel enable signal: iaux regulator ic, active high
        OUT_CHANNEL_VOSG => ch_vosg_en(index*2 downto index*2-1),  -- channel enable signal: vos_gen regulator ic, active high

        p_seq_stepval => open    -- debug:  indicates present sequence step
        );

    uvl_fuse : iir_filt
      port map (
        master_rst_b => master_rst_b,     -- reset with async assert, but synchronized to the 40 mhz clock edge
        clk_5m_gl    => clk_5m_gl,        -- fpga master clock--assumed to be 5 mhz

        sig_in       => IN_INVOLTAGE_OK(index),      -- '1'= input voltage is above the min threshold (input signal to be filtered)
        thresh_upper => "01110111",              -- (125dec is maxfiltval)upper hysterisis threshold (ie rising signal threshold)
        thresh_lower => "00001000",              -- lower hysterisis threshold (ie falling signal threshold)
        filt_sigout  => open,          -- resulting signal filter value 
        p_sigout     => channel_involtage_ok(index)  -- final signal bit value after the filter function and hysterisis have been applied
        );
    
  end generate gen_channel_seqs;

  
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- instantiate a 4 hz pulse generator used for special test to strb the tx function             
  tx_prompt : slow_pulse_en_gen
    port map (
      clk_5m_gl    => clk_5m_gl,        -- fpga master clock--assumed to be 5 mhz
      master_rst_b => master_rst_b,     -- active low reset
      cnt_en       => '1',              -- active high count enable
      sim_25kx     => SIM_MODE_EN,      -- special sim mode--speeds up  (1sec=1000usec)

      ms250_clk_en => slow_pls_stb      -- output pulse signifies 0.250 sec interval--suitable for use as a clock enable.
      );

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- instantiate the failsafe filter components

  ovt_fs : iir_filt
    port map (
      master_rst_b => master_rst_b,     -- reset with async assert, but synchronized to the 40 mhz clock edge
      clk_5m_gl    => clk_5m_gl,        -- fpga master clock--assumed to be 5 mhz

      sig_in       => IN_TEMP_OK,       -- '1'= temperature is below max threshold (input signal to be filtered)
      thresh_upper => "01110111",       -- (125dec is maxfiltval) upper hysterisis threshold (ie rising signal threshold)
      thresh_lower => "00001000",       -- lower hysterisis threshold (ie falling signal threshold)
      filt_sigout  => iir_ovt_filt,     -- resulting signal filter value 
      p_sigout     => filtd_temp_ok     -- final signal bit value after the filter function and hysterisis have been applied
      );



--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- assign internal signals top external ports
  OUT_CHANNEL_MREG <= ch_mreg_en;       -- channel enable signal: main regulator ic, active high
  OUT_CHANNEL_IAUX <= ch_iaux_en;       -- channel enable signal: iaux regulator ic, active high
  OUT_CHANNEL_VOSG <= ch_vosg_en;       -- channel enable signal: vos_gen regulator ic, active high

-- led lights when signal is low
  PWR_OK_LED <= or_reduce(channel_involtage_ok);  -- at least one fused voltage is above v min
  STATUS_LED <= filtd_temp_ok;                    -- temperature is below the max.

end rtl;
