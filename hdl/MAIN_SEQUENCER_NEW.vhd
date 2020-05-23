--------------------------------------------------------------------------------
-- Company: University of Maryland
--
-- file: main_sequencer_new.vhd
-- file history:
--      <rev - // mar 30, 2017  initial basis for the design that was tested for seu performance at cern charm
--              <rev a // feb 26, 2019  major update for gen 3 lvr config
--              <rev b // apr  8, 2019  major update that turns this into a 2 channel module that matches the fuse grouping.
--                                                              (each fuse group has 2 channels)

-- description: this module is the main control sequencer for a pair of channels

--              
--                              the sequencer waits for stdby_offb_b=1 before proceeding:
--                              if above true, then the new master channel enable byte is latched.
-- 
--                              the required turn sequence is as follows.  the updates are initiated by the cmnd_word_stb pulse.  
--                              set the stdby_offb_b bit and CHANNELS_READY bits according to the desired turn sequence:

--                                      option 1) group turn on when:
--                                                      * arm_mode= '1' (forces wait for global trigger event)
--                                                      * stdby_offb_b bit = '1' or '0', depending upon desired timing of the v_os output step
--                                                      * set all desired channels to be enabled via CHANNELS_READY 
--                                                      * initiate a global trigger event.  

--                                      option 2) individual and immediate channel turn on when:
--                                                      * arm_mode= '0' (enables channels to be immediately enabled)
--                                                      * stdby_offb_b bit = '1' or '0', depending upon desired timing of the v_os output step
--                                                      * CHANNELS_READY set all desired channels
--                                                      * initiate a global trigger event.  

--                                      the sequencer then sequentially enables each channel from from lsb to msb order.  
--                                      each channel enable requires 3 delay steps that are each 2^15 x 200 ns = 6.5536 msec (19.66msec)

-- Targeted device: <Family::ProASIC3> <Die::A3PN125> <Package::100 VQFP>
-- Authors: Tom O'bannon, Manuel Franco Sevilla, Phoebe Hamilton
--
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

entity main_sequencer_new is
  port (
    MASTER_RST_B : in std_logic;  -- reset with async assert, but synchronized to the 40 mhz clock edge
    CLK_5M_GL    : in std_logic;        -- master 5 mhz clock

    CHANNELS_READY : in std_logic_vector(1 downto 0);  -- channels in a ready state (110 or 111)
    CHANNELS_ON    : in std_logic_vector(1 downto 0);  -- channels on (110)

-- the master-slave config determines the enable for the v_os op ampl!
    MASTER_SLAVE_PAIR : in std_logic;  -- pin 21, bit 0:  MASTER_SLAVE_PAIR = adjacent channels a & 

    cmnd_word_stb : in std_logic;  -- [unused] single clock pulse strobe indicates an updated command word

    DTYCYC_EN : in std_logic;  -- '1' enables a low duty cycle mode to limit thermal loads for special tests
    V_IN_OK   : in std_logic;  -- under-voltage lockout:  v_in above threshold when ='1'
    TEMP_OK   : in std_logic;  -- '1' means the temperature is below the max value

    SIM_MODE_EN : in integer;  -- '1' is special sim mode with reduced timeout intervals

    P_CH_MREG_EN : out std_logic_vector(1 downto 0);  -- channel enable signal: main regulator ic, active high
    P_CH_IAUX_EN : out std_logic_vector(1 downto 0);  -- channel enable signal: iaux regulator ic, active high
    P_CH_VOSG_EN : out std_logic_vector(1 downto 0);  -- channel enable signal: vos_gen regulator ic, active high

    P_SEQ_STEPVAL : out std_logic_vector(3 downto 0)  -- indicates present sequence step
    );
end main_sequencer_new;

architecture rtl of main_sequencer_new is

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--attribute syn_radhardlevel of rtl : architecture is "tmr";
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- define internal signals
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- define the states for the machine state manageing the active hysteresis threshold
  type seq_sm_states is (INIT, WAIT_STEP, CH_1ST_STEP, CH_2ND_STEP, CH_3RD_STEP,  OPERATE_HOLD);
  signal sequencer_state0, n_sequencer_state0 : seq_sm_states;
  signal ret_state0, n_ret_state0             : seq_sm_states;
  signal sequencer_state1, n_sequencer_state1 : seq_sm_states;
  signal ret_state1, n_ret_state1             : seq_sm_states;

  signal ch_out0, ch_out1     : std_logic_vector(2 downto 0);  -- Channel outputs [MREG, IAUX, VOS]
  signal n_ch_out0, n_ch_out1 : std_logic_vector(2 downto 0);  -- Channel outputs [MREG, IAUX, VOS]

  signal n_del_cntr0, del_cntr0 : integer range 0 to (2**15) - 1;  -- delay interval counter
  signal n_del_cntr1, del_cntr1 : integer range 0 to (2**15) - 1;  -- delay interval counter
  signal del_cnt_val            : integer range 0 to (2**15) - 1;  -- max delay counter reload value

  signal n_seq_stepval0, seq_stepval0 : std_logic_vector(3 downto 0);  -- pulse indicates sequence was completed
  signal n_seq_stepval1, seq_stepval1 : std_logic_vector(3 downto 0);  -- pulse indicates sequence was completed

begin

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- define all registers used with the 5 mhz clock
  reg5m : process(CLK_5M_GL, MASTER_RST_B, del_cnt_val)
  begin
    if MASTER_RST_B = '0' then
      sequencer_state0 <= INIT;
      sequencer_state1 <= INIT;
      ch_out0          <= (others => '0');  -- default case is off
      ch_out1          <= (others => '0');  -- default case is off
      ret_state0       <= init;
      ret_state1       <= init;
      del_cntr0        <= del_cnt_val;
      del_cntr1        <= del_cnt_val;
      seq_stepval0     <= "0000";
      seq_stepval1     <= "0000";

    elsif (CLK_5M_GL'event and CLK_5M_GL = '1') then
      sequencer_state0 <= n_sequencer_state0;
      sequencer_state1 <= n_sequencer_state1;
      ch_out0          <= n_ch_out0;
      ch_out1          <= n_ch_out1;
      ret_state0       <= n_ret_state0;
      ret_state1       <= n_ret_state1;
      del_cntr0        <= n_del_cntr0;
      del_cntr1        <= n_del_cntr1;
      seq_stepval0     <= n_seq_stepval0;
      seq_stepval1     <= n_seq_stepval1;

    end if;

  end process;

-- mux for special sim mode which has shorter timeout intervals
  del_cnt_val <= (2**5) - 1 when SIM_MODE_EN = 1 else (2**15) - 1;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- instantiate the main sequencer and control module
  main_sequencer : process(sequencer_state0, sequencer_state1, V_IN_OK, TEMP_OK, CHANNELS_READY, CHANNELS_ON, del_cntr0, del_cntr1,
                           ret_state0, ret_state1, DTYCYC_EN)
  begin
    -- default assignments get overriden below as needed
    n_ch_out0      <= ch_out0;
    n_ret_state0   <= ret_state0;
    n_del_cntr0    <= del_cntr0;
    n_seq_stepval0 <= seq_stepval0;

    case sequencer_state0 is
      when INIT =>
        n_ch_out0   <= "000";           -- keep disabled 
        n_del_cntr0 <= del_cnt_val;     -- initialize the delay counter

        if (CHANNELS_READY(0) = '1') then  -- transition to the standby state when eanbled
          n_sequencer_state0 <= CH_1ST_STEP;
        else
          n_sequencer_state0 <= INIT;   -- wait here until standby is requested
        end if;

        n_seq_stepval0 <= "0000";       -- send present sequence step


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- v_os generator signal.  (ie this is only the v_os op amp and not the channel output)
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when CH_1ST_STEP =>  -- enable the vos generator signal for the specified channel id's
        n_ch_out0 <= "001";             --  enable the v_os gen signals

        n_sequencer_state0 <= WAIT_STEP;  -- go and wait for the circuits hit steady state
        n_ret_state0       <= CH_2ND_STEP;  -- then go to the 2nd sequence step, once wait is complete
        n_del_cntr0        <= del_cnt_val;  -- re-initialize the delay counter before using it

        n_seq_stepval0 <= "0001";       -- send present sequence step

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- i_aux circuit enable
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when CH_2ND_STEP =>  -- enable the iaux signal for the specified channel id's
        n_ch_out0 <= "011";  --  enable all active channels, keep the v_os gen signal enabled if channel is enabled

        n_sequencer_state0 <= WAIT_STEP;  -- go and wait for the circuits hit steady state
        n_ret_state0       <= CH_3RD_STEP;  -- then hold at the standby state sequence step, once wait is complete
        n_del_cntr0        <= del_cnt_val;  -- re-initialize the delay counter before using it

        n_seq_stepval0 <= "0010";       -- send present sequence step

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- mreg circuit enable
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when CH_3RD_STEP =>  -- enable the mreg signal for the specified channel id's
        n_ch_out0 <= "111";  --  enable all active channels, keep the v_os gen signal enabled if channel is enabled

        n_sequencer_state0 <= WAIT_STEP;  -- go and wait for the circuits hit steady state
        n_ret_state0       <= OPERATE_HOLD;  -- then hold at the standby state sequence step, once wait is complete
        n_del_cntr0        <= del_cnt_val;  -- re-initialize the delay counter before using it

        n_seq_stepval0 <= "0011";       -- send present sequence step


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- operate hold state
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when OPERATE_HOLD =>              -- stay here for operate mode
        n_ch_out0 <= "11" & not (CHANNELS_ON(0) and DTYCYC_EN);  --  Turn on or keep in standby

        if (CHANNELS_READY(0) = '0') then  -- go back to init if no channel is not ready
          n_sequencer_state0 <= INIT;
        else
          n_sequencer_state0 <= OPERATE_HOLD;
        end if;

        n_seq_stepval0 <= "0101";       -- send present sequence step

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- wait state--is reused state machine seqment, so always requires a state machine return state when done
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when WAIT_STEP =>
        if (CHANNELS_READY(0) = '0') then  -- go back to init if no channel is not ready
          n_sequencer_state0 <= INIT;
        elsif del_cntr0 = 0 then  -- proceed once delay counter is finished
          n_del_cntr0        <= del_cnt_val;  -- re-initialize the delay counter
          n_sequencer_state0 <= ret_state0;  -- this must be supplied from the previous state machine step!
        else
          n_del_cntr0        <= del_cntr0 - 1;  -- decrement the delay counter
          n_sequencer_state0 <= WAIT_STEP;  -- wait here until the tiemout interval is complete.                         
        end if;

        n_seq_stepval0 <= "1111";       -- send present sequence step


      when others =>
        n_sequencer_state0 <= INIT;

    end case;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- FSM FOR CHANNEL 1
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    -- default assignments get overriden below as needed
    n_ch_out1      <= ch_out1;
    n_ret_state1   <= ret_state1;
    n_del_cntr1    <= del_cntr1;
    n_seq_stepval1 <= seq_stepval1;

    case sequencer_state1 is
      when INIT =>
        n_ch_out1   <= "000";           -- keep disabled 
        n_del_cntr1 <= del_cnt_val;     -- initialize the delay counter

        if (CHANNELS_READY(1) = '1') then  -- transition to the standby state when eanbled
          n_sequencer_state1 <= CH_1ST_STEP;
        else
          n_sequencer_state1 <= INIT;   -- wait here until standby is requested
        end if;

        n_seq_stepval1 <= "0000";       -- send present sequence step


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- v_os generator signal.  (ie this is only the v_os op amp and not the channel output)
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when CH_1ST_STEP =>  -- enable the vos generator signal for the specified channel id's
        n_ch_out1 <= "001";             --  enable the v_os gen signals

        n_sequencer_state1 <= WAIT_STEP;  -- go and wait for the circuits hit steady state
        n_ret_state1       <= CH_2ND_STEP;  -- then go to the 2nd sequence step, once wait is complete
        n_del_cntr1        <= del_cnt_val;  -- re-initialize the delay counter before using it

        n_seq_stepval1 <= "0001";       -- send present sequence step

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- i_aux circuit enable
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when CH_2ND_STEP =>  -- enable the iaux signal for the specified channel id's
        n_ch_out1 <= "011";  --  enable all active channels, keep the v_os gen signal enabled if channel is enabled

        n_sequencer_state1 <= WAIT_STEP;  -- go and wait for the circuits hit steady state
        n_ret_state1       <= CH_3RD_STEP;  -- then hold at the standby state sequence step, once wait is complete
        n_del_cntr1        <= del_cnt_val;  -- re-initialize the delay counter before using it

        n_seq_stepval1 <= "0010";       -- send present sequence step

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- mreg circuit enable
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when CH_3RD_STEP =>  -- enable the mreg signal for the specified channel id's
        n_ch_out1 <= "111";  --  enable all active channels, keep the v_os gen signal enabled if channel is enabled

        n_sequencer_state1 <= WAIT_STEP;  -- go and wait for the circuits hit steady state
        n_ret_state1       <= OPERATE_HOLD;  -- then hold at the standby state sequence step, once wait is complete
        n_del_cntr1        <= del_cnt_val;  -- re-initialize the delay counter before using it

        n_seq_stepval1 <= "0011";       -- send present sequence step


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- operate hold state
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when OPERATE_HOLD =>              -- stay here for operate mode
        n_ch_out1 <= "11" & not (CHANNELS_ON(1) and DTYCYC_EN);  --  Turn on or keep in standby

        if (CHANNELS_READY(1) = '0') then  -- go back to init if no channel is not ready
          n_sequencer_state1 <= INIT;
        else
          n_sequencer_state1 <= OPERATE_HOLD;
        end if;

        n_seq_stepval1 <= "0101";       -- send present sequence step

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- wait state--is reused state machine seqment, so always requires a state machine return state when done
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

      when WAIT_STEP =>
        if (CHANNELS_READY(1) = '0') then  -- go back to init if no channel is not ready
          n_sequencer_state1 <= INIT;
        elsif del_cntr1 = 0 then  -- proceed once delay counter is finished
          n_del_cntr1        <= del_cnt_val;  -- re-initialize the delay counter
          n_sequencer_state1 <= ret_state1;  -- this must be supplied from the previous state machine step!
        else
          n_del_cntr1        <= del_cntr1 - 1;  -- decrement the delay counter
          n_sequencer_state1 <= WAIT_STEP;  -- wait here until the tiemout interval is complete.                         
        end if;

        n_seq_stepval1 <= "1111";       -- send present sequence step


      when others =>
        n_sequencer_state1 <= INIT;

    end case;

--++++++++++++++++++++++++++++++++++++++++++++++++++++
-- this is the under-voltage lockout handler.
-- these statements override the ones above.            
    if (V_IN_OK = '0' or TEMP_OK = '0') then  -- v_in_ok must be ='1' to be above the min v input threshold!
      n_sequencer_state0 <= INIT;
      n_ch_out0          <= "000";      -- disable all channels immediately
      n_sequencer_state1 <= INIT;
      n_ch_out1          <= "000";      -- disable all channels immediately
    end if;
--++++++++++++++++++++++++++++++++++++++++++++++++++++                  


  end process main_sequencer;


--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Assign internal signals to external ports for master (channel 0)
  P_CH_MREG_EN(0) <= ch_out0(2);
  P_CH_IAUX_EN(0) <= ch_out0(1);
  P_CH_VOSG_EN(0) <= ch_out0(0);

-- Assign internal signals to external ports for master or slave (channel 1)
  P_CH_MREG_EN(1) <= ch_out1(2) when MASTER_SLAVE_PAIR = '0' else ch_out0(2);
  P_CH_IAUX_EN(1) <= ch_out1(1) when MASTER_SLAVE_PAIR = '0' else ch_out0(1);
-- The slave's VOS follows the master's IAUX
  P_CH_VOSG_EN(1) <= ch_out1(0) when MASTER_SLAVE_PAIR = '0' else
                     ch_out0(0) when ch_out0 /= "110" else
                     '1';


  P_SEQ_STEPVAL <= seq_stepval0;

end rtl;
