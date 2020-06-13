--------------------------------------------------------------------------------
-- company: University of Maryland
--
-- file: spi_alt.vhd
-- file history:
--      init, april 3, 2019
--      
--
-- description: 
--
-- spi port:    slave implementation without using slave selects
--                              note:  the clock for the interface originates from the sca master in all data exchanges
--                              data rate = 312.5 kbps (ie actual serial clock frequency = lhc 40mhz / 128 )
--                                      
--      SPI_CLK    :     clock input to the fpga from the sca master
--      SPI_MISO   :     data output from the fpga to the sca master (Master in slave out)
--      SPI_MOSI   :     data input to the fpga from the sca master (Master out slave in)
--
-- targeted device: <family::proasic3> <die::a3pn250> <package::100 vqfp>
-- authors: Tom O'bannon, Manuel Franco Sevilla
--
--------------------------------------------------------------------------------

library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library proasic3;
use proasic3.all;
--library synplify;
--use synplify.attributes.all;

entity spi_slave is
  port (
    CLK5MHZ_OSC    : in std_logic;        -- internal generated 5 mhz clock 
    MASTER_RST_B : in std_logic;        -- internal active low reset

    SPI_CLK : in  std_logic;  -- clock input to the fpga from the sca master used for both tx and rx
    SPI_MOSI : in  std_logic;  -- serial data input to the fpga from the sca master
    SPI_MISO  : out std_logic;  -- serial data output from the fpga to the sca master

    SPI_TX_WORD : in  std_logic_vector(31 downto 0);  -- 32 bit serial word to be transmitted
    SPI_RX_WORD : out std_logic_vector(31 downto 0);  -- received serial frame
    SPI_RX_STRB : out std_logic;  -- single 5mhz clock pulse signifies a new serial frame is available.

    P_TX_32BIT_REG : out std_logic_vector(31 downto 0);
    CLK_FCNT_OUT : out std_logic_vector(4 downto 0);
    P_STATE_ID     : out std_logic_vector(3 downto 0)

    );
end spi_slave;

architecture rtl of spi_slave is

  --attribute syn_radhardlevel of rtl : architecture is "tmr";


  signal rx_32bit_sreg, n_rx_32bit_sreg : std_logic_vector(31 downto 0);  -- 32 bit shift register dedicated for active spi receive

  attribute syn_preserve                    : boolean;
  attribute syn_preserve of rx_32bit_sreg   : signal is true;
  attribute syn_preserve of n_rx_32bit_sreg : signal is true;

  signal tx_32bit_sreg : std_logic_vector(31 downto 0);  -- 32 bit shift register dedicated for active spi transmit

  signal clk_fcnt, n_clk_fcnt     : integer range 0 to 32 := 32;  -- spi frame counter
  signal clk_fcnt_1c, clk_fcnt_2c : integer range 0 to 32;  -- used for clock boundary crossing

  signal i_spi_miso : std_logic;  -- internal signal for sca tx serial data line

  signal spi_clr, n_spi_clr             : std_logic;  -- signal used to clear spi regsiters
  signal clk_fcnt_en, n_clk_fcnt_en     : std_logic;  -- enable for the frame counter
  signal i_spi_rx_strb, n_i_spi_rx_strb : std_logic;  -- single clock pulse strobe indicates new spi word received
  signal i_spi_rx_word, n_i_spi_rx_word : std_logic_vector(31 downto 0) := x"abcdef12";  -- internal 32 bit shift register dedicated for active spi receive

  -- define the states for the machine state managing the spi port
  type spi_sm_states is (init, det_nullclk, en_det_frame1cnt, pipeline_delay, det_frame_done, process_frame);
  signal spi_sm, n_spi_sm : spi_sm_states;

  signal spi_clk_1c, spi_clk_2c : std_logic;  -- used for clock boundary crossing

  signal nullclk_cnt, n_nullclk_cnt : integer range 0 to 31;  -- count of the number of clk-null samples

-- for debug    
  signal state_id : std_logic_vector(3 downto 0);
begin

-- architecture body

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- define the spi input and output data shift registers which operates directly from the spi clock
-- define the frame count which counts clock cycles during the active clock cycles of a 32-cycle data frame
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- define the d ff's
  sreg_dff : process(CLK5MHZ_OSC, SPI_CLK, spi_clr)
  begin
    if spi_clr = '1' then  -- an external state machine forces synchronization of the spi 
      rx_32bit_sreg <= (others => '0');
      tx_32bit_sreg <= SPI_TX_WORD;
      clk_fcnt      <= 0;               -- first transition goes to 1
      i_spi_miso <= SPI_TX_WORD(31);
      n_clk_fcnt <= 32;  -- normal count op is 1 thru 32,where 0 is a hold / init val
      n_rx_32bit_sreg <= SPI_TX_WORD;

    -- elsif rising_edge(CLK5MHZ_OSC) then
    --   -- Updating the first bit of the MISO until the first rising edge of the SPI command
    --   if clk_fcnt = 0 and n_clk_fcnt = 32 then
    --     tx_32bit_sreg <= SPI_TX_WORD;
    --     i_spi_miso <= SPI_TX_WORD(31);
    --   end if;  
    elsif rising_edge(SPI_CLK) then
      
      -- this counts the frame bits
      if clk_fcnt = 32 then
        n_clk_fcnt <= 0;  -- normal count op is 1 thru 32,where 0 is a hold / init val
      elsif clk_fcnt_en = '1' then  -- this counts the serial frame clock cycles when enabled
        n_clk_fcnt <= clk_fcnt + 1;
      else
        n_clk_fcnt <= clk_fcnt;
      end if;

     -- this is the rx path
      n_rx_32bit_sreg(31 downto 0) <= rx_32bit_sreg(30 downto 0) & SPI_MOSI;  -- these are the d ff inputs for the shift register 
      rx_32bit_sreg <= rx_32bit_sreg;

    elsif falling_edge(SPI_CLK) and clk_fcnt_en = '1' then
      clk_fcnt      <= n_clk_fcnt;
      if n_clk_fcnt <= 31 then
        i_spi_miso <= tx_32bit_sreg(31-n_clk_fcnt);
      else
        i_spi_miso <= tx_32bit_sreg(31);
      end if;
      rx_32bit_sreg <= n_rx_32bit_sreg;
    end if;

  end process;


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- define the registers that operate from the 5 mhz clock

  reg_5m : process(CLK5MHZ_OSC, MASTER_RST_B)
  begin

    if MASTER_RST_B = '0' then
      spi_sm        <= init;
      clk_fcnt_en   <= '0';
      spi_clr       <= '1';
      i_spi_rx_strb <= '0';
      i_spi_rx_word <= (others => '0');

      clk_fcnt_1c <= 0;
      clk_fcnt_2c <= 0;

      spi_clk_1c <= '0';
      spi_clk_2c <= '0';

      nullclk_cnt <= 0;


    elsif rising_edge(CLK5MHZ_OSC) then
      spi_sm        <= n_spi_sm;
      clk_fcnt_en   <= n_clk_fcnt_en;
      spi_clr       <= n_spi_clr;
      i_spi_rx_strb <= n_i_spi_rx_strb;
      i_spi_rx_word <= n_i_spi_rx_word;

      clk_fcnt_1c <= clk_fcnt;          -- clock boundary crossing
      clk_fcnt_2c <= clk_fcnt_1c;       -- clock boundary crossing

      spi_clk_1c <= spi_clk;     -- clock boundary crossing
      spi_clk_2c <= spi_clk_1c;  -- clock boundary crossing

      nullclk_cnt <= n_nullclk_cnt;


    end if;
  end process;


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--  this process controls the spi input and output shift registers as well as the spi clock count for the frame
--  clock boundary crossing is inherently synchronous for the control signals once the state machine is synchronized to the spi frame
--  however, double registers are used to sample the clk_fcnt as well as the spi clock

  spi : process(spi_sm, clk_fcnt_2c, spi_clk_2c, rx_32bit_sreg, nullclk_cnt, i_spi_rx_word, clk_fcnt_en, spi_clr, SPI_TX_WORD, state_id)
  begin

    -- default assignments that get over-written below as needed:
    n_nullclk_cnt   <= nullclk_cnt;
    n_i_spi_rx_strb <= '0';
    n_spi_clr       <= spi_clr;
    n_clk_fcnt_en   <= clk_fcnt_en;
    n_i_spi_rx_word <= i_spi_rx_word;

    case spi_sm is

      when init =>

        n_clk_fcnt_en <= '0';           -- disable the frame counter

        n_spi_sm <= det_nullclk;  -- go wait for detection of a null clock condition to synch the spi frame

        n_nullclk_cnt <= 0;             -- initialize the null clock counter

        state_id <= "0000";

      when det_nullclk =>  -- wait here until the spi clock is null for at leasty 3/4 spi clock period
        n_clk_fcnt_en <= '0';           -- disable to the frame counter

        if nullclk_cnt > 17 then  -- one spi clock period count while high is 5mhz/312khz/2 = ~ 8 counts
          n_spi_clr     <= '1';  -- send out a clear to initialize the frame counter and spi input data register
          n_nullclk_cnt <= 0;           -- if null clock, then clear the cnt
          n_spi_sm      <= en_det_frame1cnt;  -- and go wait for the next frame to be completed

        elsif spi_clk_2c = '0' then  -- only count during the logic low portion of the spi clock signal
          n_nullclk_cnt <= nullclk_cnt + 1;
          n_spi_sm      <= det_nullclk;  -- stay here until null detected

        else
          n_nullclk_cnt <= 0;  -- only get here if the spi clock is active
          n_spi_sm      <= det_nullclk;  -- stay here until null detected

        end if;

        state_id <= "0001";


      when en_det_frame1cnt =>  -- enable the det frame cnt
        n_spi_clr     <= '0';           -- disable the spi_clr
        n_clk_fcnt_en <= '1';           -- enable the frame counter
        n_spi_sm      <= pipeline_delay;  -- go wait one more clock cycle to allow for the clock boundary crossing

        state_id <= "0010";


      when pipeline_delay =>  -- need a pipeline delay to account for the clock boundary crossing registers
        n_spi_sm <= det_frame_done;

        state_id <= "0011";

      when det_frame_done =>  -- wait here until 32 spi clock periods have been detected.


        if clk_fcnt_2c = 32 then
          n_spi_sm <= process_frame;
        else
          n_spi_sm <= det_frame_done;
        end if;

        state_id <= "0100";

      when process_frame =>
        n_i_spi_rx_word <= rx_32bit_sreg;  -- send out a copy the received serial 32 bit word
        n_i_spi_rx_strb <= '1';  -- single clock pulse strobe indicates new frame ready
        n_spi_sm        <= init;

        state_id <= "0101";


      when others =>
        n_spi_sm <= init;

        state_id <= "0110";

    end case;

  end process;

-- assign internal signals to external ports
  SPI_RX_STRB <= i_spi_rx_strb;
  SPI_RX_WORD <= i_spi_rx_word;

  SPI_MISO <= i_spi_miso;
  P_STATE_ID <= state_id;

  P_TX_32BIT_REG <= tx_32bit_sreg;

  CLK_FCNT_OUT <= std_logic_vector(to_unsigned(clk_fcnt_2c, 5));

end rtl;
