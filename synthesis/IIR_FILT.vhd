-- Version: v11.9 SP2 11.9.2.1

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity IIR_FILT is

    port( MASTER_RST_B : in    std_logic;
          CLK_5M_GL    : in    std_logic;
          SIG_IN       : in    std_logic_vector(0 to 0);
          THRESH_UPPER : in    std_logic_vector(7 downto 0);
          THRESH_LOWER : in    std_logic_vector(7 downto 0);
          FILT_SIGOUT  : out   std_logic_vector(7 downto 0);
          P_SIGOUT     : out   std_logic
        );

end IIR_FILT;

architecture DEF_ARCH of IIR_FILT is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component INBUF
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OUTBUF
    port( D   : in    std_logic := 'U';
          PAD : out   std_logic
        );
  end component;

  component OA1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XNOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AND3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XNOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AOI1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MIN3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AND2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1E1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OAI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XAI1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO18
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component MX2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1E0C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AO13
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO16
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AX1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component CLKBUF
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component XA1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal \VCC\, \SIG_IN_DEL[0]_net_1\, \SUM_IN_A[4]_net_1\, 
        \SUM_IN_A[5]_net_1\, \HYSTERISIS.op_gt.op_gt.n_sigout3\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15\, \GND\, 
        \SUM_IN_A_RNO[4]_net_1\, \SUM_IN_A_RNO[5]_net_1\, 
        \un2_n_filt_out0[28]\, \THRESH_VAL[0]_net_1\, 
        \THRESH_VAL[1]_net_1\, \SIGOUT_RNO_0\, \SIGOUT_RNO\, 
        \THRESH_VAL_ns[0]\, \THRESH_VAL_RNO[1]_net_1\, N_82, 
        \un2_n_filt_out_m[26]\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_E[1]\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_E[0]\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_E[2]\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_2\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_3\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_4\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_5\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_6\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_7\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_8\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_9\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_10\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_11\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[0]\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[1]\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[2]\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[3]\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[4]\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[5]\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[2]\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[1]\, 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[0]\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_E[1]\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_E[0]\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_E[2]\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_2\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_3\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_4\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_5\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_6\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_7\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_8\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_9\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_10\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_11\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[0]\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[1]\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[2]\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[3]\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[4]\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[5]\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[2]\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[1]\, 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[0]\, 
        MASTER_RST_B_c, CLK_5M_GL_c, \SIG_IN_c[0]\, 
        \THRESH_UPPER_c[0]\, \THRESH_UPPER_c[1]\, 
        \THRESH_UPPER_c[2]\, \THRESH_UPPER_c[3]\, 
        \THRESH_UPPER_c[4]\, \THRESH_UPPER_c[5]\, 
        \THRESH_UPPER_c[6]\, \THRESH_UPPER_c[7]\, 
        \THRESH_LOWER_c[0]\, \THRESH_LOWER_c[1]\, 
        \THRESH_LOWER_c[2]\, \THRESH_LOWER_c[3]\, 
        \THRESH_LOWER_c[4]\, \THRESH_LOWER_c[5]\, 
        \THRESH_LOWER_c[6]\, \THRESH_LOWER_c[7]\, 
        \FILT_SIGOUT_c[0]\, \FILT_SIGOUT_c[1]\, 
        \FILT_SIGOUT_c[2]\, \FILT_SIGOUT_c[3]\, 
        \FILT_SIGOUT_c[4]\, \FILT_SIGOUT_c[5]\, 
        \FILT_SIGOUT_c[6]\, \FILT_SIGOUT_c[7]\, P_SIGOUT_c, 
        \un1_tmp_sum_in_b[8]\, \un1_tmp_sum_in_b_0.i8_mux\, 
        \un1_tmp_sum_in_b_0.i6_mux\, \un1_tmp_sum_in_b_0.i4_mux\, 
        \un1_tmp_sum_in_b_0.i2_mux\, \un1_tmp_sum_in_b_0.N_40\, 
        \un2_n_filt_out0[26]\, \un1_tmp_sum_in_b_0.N_27_i\, 
        \un1_tmp_sum_in_b_0.N_29_i\, \un1_tmp_sum_in_b_0.N_31_i\, 
        \un1_tmp_sum_in_b_0.N_33_i\, \un2_n_filt_out0_i[27]\, 
        \un1_tmp_sum_in_b_0.i10_mux\, \un1_tmp_sum_in_b_0.N_23_i\, 
        \un2_n_filt_out_1.N_8\, N_156, N_157, N_160, N_161
         : std_logic;

begin 


    \FILT_OUT[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => CLK_5M_GL_c, 
        CLR => MASTER_RST_B_c, Q => \FILT_SIGOUT_c[4]\);
    
    \THRESH_UPPER_pad[5]\ : INBUF
      port map(PAD => THRESH_UPPER(5), Y => \THRESH_UPPER_c[5]\);
    
    \THRESH_LOWER_pad[3]\ : INBUF
      port map(PAD => THRESH_LOWER(3), Y => \THRESH_LOWER_c[3]\);
    
    \THRESH_VAL_RNO[0]\ : AO1
      port map(A => \THRESH_VAL[1]_net_1\, B => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15\, C => N_82, Y => 
        \THRESH_VAL_ns[0]\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_14\ : OR2A
      port map(A => \FILT_SIGOUT_c[1]\, B => \THRESH_UPPER_c[1]\, 
        Y => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_2\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_11\ : OR2A
      port map(A => \FILT_SIGOUT_c[7]\, B => \THRESH_UPPER_c[7]\, 
        Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[4]\);
    
    \FILT_SIGOUT_pad[7]\ : OUTBUF
      port map(D => \FILT_SIGOUT_c[7]\, PAD => FILT_SIGOUT(7));
    
    \THRESH_LOWER_pad[1]\ : INBUF
      port map(PAD => THRESH_LOWER(1), Y => \THRESH_LOWER_c[1]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_15\ : OR2A
      port map(A => \FILT_SIGOUT_c[2]\, B => \THRESH_LOWER_c[2]\, 
        Y => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_3\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_24\ : OA1
      port map(A => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_11\, B
         => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_10\, C => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_9\, Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_E[2]\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_21\ : OR2A
      port map(A => \THRESH_UPPER_c[4]\, B => \FILT_SIGOUT_c[4]\, 
        Y => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_9\);
    
    \FILT_OUT[6]\ : DFN1C0
      port map(D => \un2_n_filt_out_m[26]\, CLK => CLK_5M_GL_c, 
        CLR => MASTER_RST_B_c, Q => \FILT_SIGOUT_c[6]\);
    
    \THRESH_VAL[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => CLK_5M_GL_c, CLR
         => MASTER_RST_B_c, Q => \THRESH_VAL[0]_net_1\);
    
    \THRESH_LOWER_pad[2]\ : INBUF
      port map(PAD => THRESH_LOWER(2), Y => \THRESH_LOWER_c[2]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_17\ : OR2A
      port map(A => \THRESH_LOWER_c[4]\, B => \FILT_SIGOUT_c[4]\, 
        Y => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_5\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_15\ : OR2A
      port map(A => \THRESH_UPPER_c[2]\, B => \FILT_SIGOUT_c[2]\, 
        Y => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_3\);
    
    un1_tmp_sum_in_b_0_m22 : XNOR3
      port map(A => \FILT_SIGOUT_c[6]\, B => \FILT_SIGOUT_c[7]\, 
        C => \un1_tmp_sum_in_b_0.i10_mux\, Y => 
        \un1_tmp_sum_in_b_0.N_23_i\);
    
    \FILT_SIGOUT_pad[0]\ : OUTBUF
      port map(D => \FILT_SIGOUT_c[0]\, PAD => FILT_SIGOUT(0));
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_23\ : OA1A
      port map(A => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_6\, B
         => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_8\, C => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_7\, Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_11\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_4\ : AND3
      port map(A => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[2]\, 
        B => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[1]\, 
        C => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[0]\, 
        Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_E[1]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_3\ : XNOR2
      port map(A => \FILT_SIGOUT_c[5]\, B => \THRESH_LOWER_c[5]\, 
        Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[0]\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_25\ : AO1
      port map(A => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_E[1]\, B
         => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_E[2]\, 
        C => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_E[0]\, Y
         => \HYSTERISIS.op_gt.op_gt.n_sigout3\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_13\ : AOI1A
      port map(A => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[3]\, 
        B => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[4]\, 
        C => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[5]\, 
        Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_E[0]\);
    
    \SUM_IN_A_RNO[4]\ : XOR2
      port map(A => \SIG_IN_c[0]\, B => \SIG_IN_DEL[0]_net_1\, Y
         => \SUM_IN_A_RNO[4]_net_1\);
    
    \FILT_SIGOUT_pad[3]\ : OUTBUF
      port map(D => \FILT_SIGOUT_c[3]\, PAD => FILT_SIGOUT(3));
    
    \FILT_OUT[1]\ : DFN1C0
      port map(D => \un1_tmp_sum_in_b_0.N_31_i\, CLK => 
        CLK_5M_GL_c, CLR => MASTER_RST_B_c, Q => 
        \FILT_SIGOUT_c[1]\);
    
    un1_tmp_sum_in_b_0_m13_d : MIN3
      port map(A => \FILT_SIGOUT_c[5]\, B => \FILT_SIGOUT_c[3]\, 
        C => \FILT_SIGOUT_c[4]\, Y => N_157);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_23\ : OA1A
      port map(A => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_6\, B
         => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_8\, C => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_7\, Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_11\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_1\ : XNOR2
      port map(A => \FILT_SIGOUT_c[7]\, B => \THRESH_LOWER_c[7]\, 
        Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[2]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_19\ : OA1A
      port map(A => \THRESH_UPPER_c[3]\, B => \FILT_SIGOUT_c[3]\, 
        C => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_3\, Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_7\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_8\ : OR2A
      port map(A => \THRESH_LOWER_c[6]\, B => \FILT_SIGOUT_c[6]\, 
        Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[1]\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_16\ : NOR2A
      port map(A => \FILT_SIGOUT_c[0]\, B => \THRESH_UPPER_c[0]\, 
        Y => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_4\);
    
    \SUM_IN_A[5]\ : DFN1C0
      port map(D => \SUM_IN_A_RNO[5]_net_1\, CLK => CLK_5M_GL_c, 
        CLR => MASTER_RST_B_c, Q => \SUM_IN_A[5]_net_1\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_9\ : AND2A
      port map(A => \THRESH_LOWER_c[6]\, B => \FILT_SIGOUT_c[6]\, 
        Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[2]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_24\ : OA1
      port map(A => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_11\, B
         => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_10\, C => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_9\, Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_E[2]\);
    
    \FILT_SIGOUT_pad[2]\ : OUTBUF
      port map(D => \FILT_SIGOUT_c[2]\, PAD => FILT_SIGOUT(2));
    
    \FILT_OUT[2]\ : DFN1C0
      port map(D => \un1_tmp_sum_in_b_0.N_29_i\, CLK => 
        CLK_5M_GL_c, CLR => MASTER_RST_B_c, Q => 
        \FILT_SIGOUT_c[2]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_22\ : AO1C
      port map(A => \FILT_SIGOUT_c[3]\, B => \THRESH_LOWER_c[3]\, 
        C => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_5\, Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_10\);
    
    \FILT_OUT[7]\ : DFN1E1C0
      port map(D => \un2_n_filt_out0[26]\, CLK => CLK_5M_GL_c, 
        CLR => MASTER_RST_B_c, E => \un1_tmp_sum_in_b[8]\, Q => 
        \FILT_SIGOUT_c[7]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_10\ : AOI1A
      port map(A => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[0]\, 
        B => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[1]\, 
        C => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[2]\, 
        Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[3]\);
    
    \THRESH_UPPER_pad[1]\ : INBUF
      port map(PAD => THRESH_UPPER(1), Y => \THRESH_UPPER_c[1]\);
    
    un1_tmp_sum_in_b_0_m13 : MX2
      port map(A => N_161, B => \un1_tmp_sum_in_b_0.i2_mux\, S
         => N_160, Y => \un1_tmp_sum_in_b_0.i8_mux\);
    
    \THRESH_UPPER_pad[4]\ : INBUF
      port map(PAD => THRESH_UPPER(4), Y => \THRESH_UPPER_c[4]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_18\ : AO1C
      port map(A => \THRESH_LOWER_c[1]\, B => \FILT_SIGOUT_c[1]\, 
        C => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_4\, Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_6\);
    
    \FILT_OUT[0]\ : DFN1C0
      port map(D => \un1_tmp_sum_in_b_0.N_33_i\, CLK => 
        CLK_5M_GL_c, CLR => MASTER_RST_B_c, Q => 
        \FILT_SIGOUT_c[0]\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_8\ : OR2A
      port map(A => \FILT_SIGOUT_c[6]\, B => \THRESH_UPPER_c[6]\, 
        Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[1]\);
    
    \THRESH_UPPER_pad[7]\ : INBUF
      port map(PAD => THRESH_UPPER(7), Y => \THRESH_UPPER_c[7]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_11\ : OR2A
      port map(A => \THRESH_LOWER_c[7]\, B => \FILT_SIGOUT_c[7]\, 
        Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[4]\);
    
    un1_tmp_sum_in_b_0_m4 : OAI1
      port map(A => \FILT_SIGOUT_c[2]\, B => \FILT_SIGOUT_c[0]\, 
        C => \FILT_SIGOUT_c[1]\, Y => \un1_tmp_sum_in_b_0.i2_mux\);
    
    MASTER_RST_B_pad : INBUF
      port map(PAD => MASTER_RST_B, Y => MASTER_RST_B_c);
    
    un2_n_filt_out_1_ADD_4x4_fast_I9_Y_i_x2 : XNOR3
      port map(A => \un2_n_filt_out_1.N_8\, B => 
        \SUM_IN_A[5]_net_1\, C => \un1_tmp_sum_in_b_0.N_23_i\, Y
         => \un2_n_filt_out0_i[27]\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_1\ : XNOR2
      port map(A => \THRESH_UPPER_c[7]\, B => \FILT_SIGOUT_c[7]\, 
        Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[2]\);
    
    \FILT_OUT[3]\ : DFN1C0
      port map(D => \un1_tmp_sum_in_b_0.N_27_i\, CLK => 
        CLK_5M_GL_c, CLR => MASTER_RST_B_c, Q => 
        \FILT_SIGOUT_c[3]\);
    
    un2_n_filt_out_1_ADD_4x4_fast_I4_Y_0_o2_0 : XAI1A
      port map(A => \un1_tmp_sum_in_b_0.i8_mux\, B => 
        \un1_tmp_sum_in_b_0.N_40\, C => \SUM_IN_A[4]_net_1\, Y
         => \un2_n_filt_out_1.N_8\);
    
    \THRESH_VAL[1]\ : DFN1C0
      port map(D => \THRESH_VAL_RNO[1]_net_1\, CLK => CLK_5M_GL_c, 
        CLR => MASTER_RST_B_c, Q => \THRESH_VAL[1]_net_1\);
    
    \SUM_IN_A_RNO[5]\ : NOR2B
      port map(A => \SIG_IN_DEL[0]_net_1\, B => \SIG_IN_c[0]\, Y
         => \SUM_IN_A_RNO[5]_net_1\);
    
    \SIG_IN_pad[0]\ : INBUF
      port map(PAD => SIG_IN(0), Y => \SIG_IN_c[0]\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_2\ : XNOR2
      port map(A => \THRESH_UPPER_c[6]\, B => \FILT_SIGOUT_c[6]\, 
        Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[1]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_25\ : AO1
      port map(A => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_E[1]\, B
         => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_E[2]\, C
         => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_E[0]\, Y
         => \HYSTERISIS.op_lt.op_lt.n_sigout15\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_19\ : OA1A
      port map(A => \FILT_SIGOUT_c[3]\, B => \THRESH_LOWER_c[3]\, 
        C => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_3\, Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_7\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_17\ : OR2A
      port map(A => \FILT_SIGOUT_c[4]\, B => \THRESH_UPPER_c[4]\, 
        Y => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_5\);
    
    \FILT_SIGOUT_pad[1]\ : OUTBUF
      port map(D => \FILT_SIGOUT_c[1]\, PAD => FILT_SIGOUT(1));
    
    un1_tmp_sum_in_b_0_m16 : AO18
      port map(A => \FILT_SIGOUT_c[5]\, B => 
        \un1_tmp_sum_in_b_0.i8_mux\, C => \FILT_SIGOUT_c[6]\, Y
         => \un1_tmp_sum_in_b_0.i10_mux\);
    
    P_SIGOUT_pad : OUTBUF
      port map(D => P_SIGOUT_c, PAD => P_SIGOUT);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_10\ : AOI1A
      port map(A => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[0]\, 
        B => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[1]\, 
        C => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[2]\, 
        Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[3]\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_3\ : XNOR2
      port map(A => \THRESH_UPPER_c[5]\, B => \FILT_SIGOUT_c[5]\, 
        Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[0]\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \THRESH_VAL_RNILDNQB[0]\ : NOR2A
      port map(A => \THRESH_VAL[0]_net_1\, B => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3\, Y => N_82);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_9\ : AND2A
      port map(A => \FILT_SIGOUT_c[6]\, B => \THRESH_UPPER_c[6]\, 
        Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[2]\);
    
    un1_tmp_sum_in_b_0_m26 : XNOR3
      port map(A => \FILT_SIGOUT_c[4]\, B => \FILT_SIGOUT_c[5]\, 
        C => \un1_tmp_sum_in_b_0.i6_mux\, Y => 
        \un1_tmp_sum_in_b_0.N_27_i\);
    
    \THRESH_LOWER_pad[0]\ : INBUF
      port map(PAD => THRESH_LOWER(0), Y => \THRESH_LOWER_c[0]\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_20\ : AO1C
      port map(A => \THRESH_UPPER_c[2]\, B => \FILT_SIGOUT_c[2]\, 
        C => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_2\, Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_8\);
    
    \THRESH_LOWER_pad[7]\ : INBUF
      port map(PAD => THRESH_LOWER(7), Y => \THRESH_LOWER_c[7]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_16\ : NOR2A
      port map(A => \THRESH_LOWER_c[0]\, B => \FILT_SIGOUT_c[0]\, 
        Y => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_4\);
    
    \un2_n_filt_out_0_un2_n_filt_out_m[26]\ : XOR2
      port map(A => \un1_tmp_sum_in_b[8]\, B => 
        \un2_n_filt_out0[26]\, Y => \un2_n_filt_out_m[26]\);
    
    un1_tmp_sum_in_b_0_m30 : XNOR3
      port map(A => \FILT_SIGOUT_c[2]\, B => \FILT_SIGOUT_c[3]\, 
        C => \un1_tmp_sum_in_b_0.i2_mux\, Y => 
        \un1_tmp_sum_in_b_0.N_31_i\);
    
    \THRESH_UPPER_pad[0]\ : INBUF
      port map(PAD => THRESH_UPPER(0), Y => \THRESH_UPPER_c[0]\);
    
    \THRESH_VAL_RNO[1]\ : MX2B
      port map(A => \HYSTERISIS.op_gt.op_gt.n_sigout3\, B => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15\, S => 
        \THRESH_VAL[1]_net_1\, Y => \THRESH_VAL_RNO[1]_net_1\);
    
    \THRESH_LOWER_pad[5]\ : INBUF
      port map(PAD => THRESH_LOWER(5), Y => \THRESH_LOWER_c[5]\);
    
    un1_tmp_sum_in_b_0_m15 : XOR2
      port map(A => \FILT_SIGOUT_c[6]\, B => \FILT_SIGOUT_c[5]\, 
        Y => \un1_tmp_sum_in_b_0.N_40\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_2\ : XNOR2
      port map(A => \FILT_SIGOUT_c[6]\, B => \THRESH_LOWER_c[6]\, 
        Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[1]\);
    
    un1_tmp_sum_in_b_0_m7 : AO18
      port map(A => \FILT_SIGOUT_c[2]\, B => 
        \un1_tmp_sum_in_b_0.i2_mux\, C => \FILT_SIGOUT_c[3]\, Y
         => \un1_tmp_sum_in_b_0.i4_mux\);
    
    \FILT_SIGOUT_pad[6]\ : OUTBUF
      port map(D => \FILT_SIGOUT_c[6]\, PAD => FILT_SIGOUT(6));
    
    un1_tmp_sum_in_b_0_m28 : XNOR3
      port map(A => \FILT_SIGOUT_c[3]\, B => \FILT_SIGOUT_c[4]\, 
        C => \un1_tmp_sum_in_b_0.i4_mux\, Y => 
        \un1_tmp_sum_in_b_0.N_29_i\);
    
    SIGOUT : DFN1E0C0
      port map(D => \SIGOUT_RNO\, CLK => CLK_5M_GL_c, CLR => 
        MASTER_RST_B_c, E => \SIGOUT_RNO_0\, Q => P_SIGOUT_c);
    
    un2_n_filt_out_0_ADD_4x4_fast_I2_Y : AO13
      port map(A => \SUM_IN_A[5]_net_1\, B => 
        \un1_tmp_sum_in_b_0.N_23_i\, C => \un2_n_filt_out_1.N_8\, 
        Y => \un2_n_filt_out0[26]\);
    
    un1_tmp_sum_in_b_0_m13_s : AO16
      port map(A => \FILT_SIGOUT_c[3]\, B => \FILT_SIGOUT_c[5]\, 
        C => \FILT_SIGOUT_c[4]\, Y => N_156);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_7\ : NOR2A
      port map(A => \THRESH_LOWER_c[5]\, B => \FILT_SIGOUT_c[5]\, 
        Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[0]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_13\ : AOI1A
      port map(A => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[3]\, 
        B => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[4]\, 
        C => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[5]\, 
        Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_E[0]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_20\ : AO1C
      port map(A => \FILT_SIGOUT_c[2]\, B => \THRESH_LOWER_c[2]\, 
        C => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_2\, Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_8\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_7\ : NOR2A
      port map(A => \FILT_SIGOUT_c[5]\, B => \THRESH_UPPER_c[5]\, 
        Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[0]\);
    
    \FILT_SIGOUT_pad[4]\ : OUTBUF
      port map(D => \FILT_SIGOUT_c[4]\, PAD => FILT_SIGOUT(4));
    
    un2_n_filt_out_0_ADD_4x4_fast_I0_S : XNOR3
      port map(A => \un1_tmp_sum_in_b_0.i8_mux\, B => 
        \un1_tmp_sum_in_b_0.N_40\, C => \SUM_IN_A[4]_net_1\, Y
         => \un2_n_filt_out0[28]\);
    
    \THRESH_UPPER_pad[6]\ : INBUF
      port map(PAD => THRESH_UPPER(6), Y => \THRESH_UPPER_c[6]\);
    
    un1_tmp_sum_in_b_0_m32 : AX1
      port map(A => \FILT_SIGOUT_c[0]\, B => \FILT_SIGOUT_c[1]\, 
        C => \FILT_SIGOUT_c[2]\, Y => \un1_tmp_sum_in_b_0.N_33_i\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_21\ : OR2A
      port map(A => \FILT_SIGOUT_c[4]\, B => \THRESH_LOWER_c[4]\, 
        Y => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_9\);
    
    CLK_5M_GL_pad : CLKBUF
      port map(PAD => CLK_5M_GL, Y => CLK_5M_GL_c);
    
    un1_tmp_sum_in_b_0_m13_s_0 : XA1
      port map(A => \FILT_SIGOUT_c[2]\, B => \FILT_SIGOUT_c[3]\, 
        C => N_156, Y => N_160);
    
    \THRESH_LOWER_pad[6]\ : INBUF
      port map(PAD => THRESH_LOWER(6), Y => \THRESH_LOWER_c[6]\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_12\ : AND2A
      port map(A => \FILT_SIGOUT_c[7]\, B => \THRESH_UPPER_c[7]\, 
        Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[5]\);
    
    \FILT_OUT[5]\ : DFN1C0
      port map(D => \un2_n_filt_out0_i[27]\, CLK => CLK_5M_GL_c, 
        CLR => MASTER_RST_B_c, Q => \FILT_SIGOUT_c[5]\);
    
    un1_tmp_sum_in_b_0_m10 : AO18
      port map(A => \FILT_SIGOUT_c[3]\, B => 
        \un1_tmp_sum_in_b_0.i4_mux\, C => \FILT_SIGOUT_c[4]\, Y
         => \un1_tmp_sum_in_b_0.i6_mux\);
    
    \THRESH_UPPER_pad[2]\ : INBUF
      port map(PAD => THRESH_UPPER(2), Y => \THRESH_UPPER_c[2]\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_22\ : AO1C
      port map(A => \THRESH_UPPER_c[3]\, B => \FILT_SIGOUT_c[3]\, 
        C => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_5\, Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_10\);
    
    un1_tmp_sum_in_b_0_m13_d_0 : MX2B
      port map(A => N_157, B => \FILT_SIGOUT_c[2]\, S => N_156, Y
         => N_161);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_14\ : OR2A
      port map(A => \THRESH_LOWER_c[1]\, B => \FILT_SIGOUT_c[1]\, 
        Y => \HYSTERISIS.op_lt.op_lt.n_sigout15_0.N_2\);
    
    \HYSTERISIS.op_gt.op_gt.n_sigout3_0_I_18\ : AO1C
      port map(A => \FILT_SIGOUT_c[1]\, B => \THRESH_UPPER_c[1]\, 
        C => \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_4\, Y => 
        \HYSTERISIS.op_gt.op_gt.n_sigout3_0.N_6\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_4\ : AND3
      port map(A => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[2]\, 
        B => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[1]\, 
        C => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.DWACT_BL_EQUAL_0_E[0]\, 
        Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_E[1]\);
    
    \HYSTERISIS.op_lt.op_lt.n_sigout15_0_I_12\ : AND2A
      port map(A => \THRESH_LOWER_c[7]\, B => \FILT_SIGOUT_c[7]\, 
        Y => 
        \HYSTERISIS.op_lt.op_lt.n_sigout15_0.DWACT_COMP0_IF1_n.IF_equal_n0.DWACT_CMPLE_PO0_DWACT_COMP0_IF1_3.IF_equal_30.ACT_LT3_E[5]\);
    
    un1_tmp_sum_in_b_0_m20 : AO16
      port map(A => \FILT_SIGOUT_c[7]\, B => 
        \un1_tmp_sum_in_b_0.i10_mux\, C => \FILT_SIGOUT_c[6]\, Y
         => \un1_tmp_sum_in_b[8]\);
    
    \THRESH_UPPER_pad[3]\ : INBUF
      port map(PAD => THRESH_UPPER(3), Y => \THRESH_UPPER_c[3]\);
    
    \FILT_SIGOUT_pad[5]\ : OUTBUF
      port map(D => \FILT_SIGOUT_c[5]\, PAD => FILT_SIGOUT(5));
    
    SIGOUT_RNO_0 : AO1A
      port map(A => \HYSTERISIS.op_lt.op_lt.n_sigout15\, B => 
        \THRESH_VAL[1]_net_1\, C => N_82, Y => \SIGOUT_RNO_0\);
    
    SIGOUT_RNO : NOR2A
      port map(A => \HYSTERISIS.op_gt.op_gt.n_sigout3\, B => 
        \THRESH_VAL[1]_net_1\, Y => \SIGOUT_RNO\);
    
    \SUM_IN_A[4]\ : DFN1C0
      port map(D => \SUM_IN_A_RNO[4]_net_1\, CLK => CLK_5M_GL_c, 
        CLR => MASTER_RST_B_c, Q => \SUM_IN_A[4]_net_1\);
    
    \THRESH_LOWER_pad[4]\ : INBUF
      port map(PAD => THRESH_LOWER(4), Y => \THRESH_LOWER_c[4]\);
    
    \SIG_IN_DEL[0]\ : DFN1C0
      port map(D => \SIG_IN_c[0]\, CLK => CLK_5M_GL_c, CLR => 
        MASTER_RST_B_c, Q => \SIG_IN_DEL[0]_net_1\);
    

end DEF_ARCH; 
