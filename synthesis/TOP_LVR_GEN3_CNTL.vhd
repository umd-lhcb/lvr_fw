-- Version: v11.9 SP2 11.9.2.1

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity IIR_FILT_4_3 is

    port( FPGA_FUSE_7_8_OK_c_0 : in    std_logic;
          POR_OUT_TO_SCA_c     : in    std_logic;
          BUF5M_J11_15_TCONN_c : in    std_logic;
          UVL_OK_CH7A8         : out   std_logic
        );

end IIR_FILT_4_3;

architecture DEF_ARCH of IIR_FILT_4_3 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component XNOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MAJ3
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

  component AOI1B
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

  component AO13
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component XOR3
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

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component XOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3C
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

  component XA1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_23_i, \FILT_OUT[6]_net_1\, \FILT_OUT[7]_net_1\, 
        i10_mux, i2_mux, \FILT_OUT[2]_net_1\, \FILT_OUT[0]_net_1\, 
        \FILT_OUT[1]_net_1\, i4_mux, \FILT_OUT[3]_net_1\, i6_mux, 
        \FILT_OUT[4]_net_1\, i8_mux, \FILT_OUT[5]_net_1\, 
        \FILT_OUT_maj_RNIL726C[7]_net_1\, i12_mux, N89, 
        \FILT_OUT_maj_RNIL726C_0[7]_net_1\, \SUM_IN_A[5]_net_1\, 
        N92, n_sigout15lto7_2, n_sigout15lto7_1, n_sigout3lto6_1, 
        n_sigout3lto6_0, N_33_i, N_31_i, N_29_i, N_27_i, 
        \SIGOUT_maj_RNI96K25\, N_94, \UVL_OK_CH7A8\, N_93, 
        n_sigout3, \THRESH_VAL[1]_net_1\, N_95, 
        \THRESH_VAL[0]_net_1\, N_113, \THRESH_VAL_ns[0]\, 
        \THRESH_VAL_maj_RNICCI93[1]_net_1\, N_40, 
        \SUM_IN_A[4]_net_1\, \un2_n_filt_out0[28]\, 
        ADD_4x4_fast_I6_Y_3, \SIG_IN_DEL_maj_RNI48TK[0]_net_1\, 
        \SIG_IN_DEL[0]_net_1\, 
        \SIG_IN_DEL_maj_RNI48TK_0[0]_net_1\, \FILT_OUT_0[7]\, 
        \FILT_OUT_tmr2[7]_net_1\, \FILT_OUT_tmr3[7]_net_1\, 
        \FILT_OUT_0[6]\, \FILT_OUT_tmr2[6]_net_1\, 
        \FILT_OUT_tmr3[6]_net_1\, \FILT_OUT_0[5]\, 
        \FILT_OUT_tmr2[5]_net_1\, \FILT_OUT_tmr3[5]_net_1\, 
        \FILT_OUT_0[4]\, \FILT_OUT_tmr2[4]_net_1\, 
        \FILT_OUT_tmr3[4]_net_1\, \FILT_OUT_0[3]\, 
        \FILT_OUT_tmr2[3]_net_1\, \FILT_OUT_tmr3[3]_net_1\, 
        \FILT_OUT_0[2]\, \FILT_OUT_tmr2[2]_net_1\, 
        \FILT_OUT_tmr3[2]_net_1\, \FILT_OUT_0[1]\, 
        \FILT_OUT_tmr2[1]_net_1\, \FILT_OUT_tmr3[1]_net_1\, 
        \FILT_OUT_0[0]\, \FILT_OUT_tmr2[0]_net_1\, 
        \FILT_OUT_tmr3[0]_net_1\, \SUM_IN_A_0[5]\, 
        \SUM_IN_A_tmr2[5]_net_1\, \SUM_IN_A_tmr3[5]_net_1\, 
        \SUM_IN_A_0[4]\, \SUM_IN_A_tmr2[4]_net_1\, 
        \SUM_IN_A_tmr3[4]_net_1\, \THRESH_VAL_0[1]\, 
        \THRESH_VAL_tmr2[1]_net_1\, \THRESH_VAL_tmr3[1]_net_1\, 
        \THRESH_VAL_0[0]\, \THRESH_VAL_tmr2[0]_net_1\, 
        \THRESH_VAL_tmr3[0]_net_1\, \SIGOUT\, \SIGOUT_tmr2\, 
        \SIGOUT_tmr3\, \SIG_IN_DEL_0[0]\, 
        \SIG_IN_DEL_tmr2[0]_net_1\, \SIG_IN_DEL_tmr3[0]_net_1\, 
        \GND\, \VCC\ : std_logic;

begin 

    UVL_OK_CH7A8 <= \UVL_OK_CH7A8\;

    \FILT_OUT[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_0[4]\);
    
    SIGOUT_tmr2 : DFN1C0
      port map(D => \SIGOUT_maj_RNI96K25\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIGOUT_tmr2\);
    
    \THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNICCI93[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr2[1]_net_1\);
    
    \SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNI48TK_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr2[5]_net_1\);
    
    \FILT_OUT[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNIL726C[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_0[6]\);
    
    \THRESH_VAL[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_0[0]\);
    
    SIGOUT_tmr3 : DFN1C0
      port map(D => \SIGOUT_maj_RNI96K25\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIGOUT_tmr3\);
    
    un1_tmp_sum_in_b_0_m22 : XNOR3
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => i10_mux, Y => N_23_i);
    
    \THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr3[0]_net_1\);
    
    \FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNIL726C_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2[7]_net_1\);
    
    \FILT_OUT_maj[3]\ : MAJ3
      port map(A => \FILT_OUT_0[3]\, B => 
        \FILT_OUT_tmr2[3]_net_1\, C => \FILT_OUT_tmr3[3]_net_1\, 
        Y => \FILT_OUT[3]_net_1\);
    
    \FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3[3]_net_1\);
    
    \FILT_OUT_maj[6]\ : MAJ3
      port map(A => \FILT_OUT_0[6]\, B => 
        \FILT_OUT_tmr2[6]_net_1\, C => \FILT_OUT_tmr3[6]_net_1\, 
        Y => \FILT_OUT[6]_net_1\);
    
    \SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \SUM_IN_A_0[4]\, B => 
        \SUM_IN_A_tmr2[4]_net_1\, C => \SUM_IN_A_tmr3[4]_net_1\, 
        Y => \SUM_IN_A[4]_net_1\);
    
    \FILT_OUT[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_0[1]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \THRESH_VAL_maj_RNI66PK1_1[1]\ : NOR2A
      port map(A => n_sigout3, B => \THRESH_VAL[1]_net_1\, Y => 
        N_94);
    
    \FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y_3, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2[5]_net_1\);
    
    \SUM_IN_A[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNI48TK_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_0[5]\);
    
    \FILT_OUT[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_0[2]\);
    
    \THRESH_VAL_maj_RNI66PK1_0[1]\ : AOI1B
      port map(A => n_sigout15lto7_2, B => n_sigout15lto7_1, C
         => \THRESH_VAL[1]_net_1\, Y => N_95);
    
    \SIG_IN_DEL_tmr3[0]\ : DFN1C0
      port map(D => FPGA_FUSE_7_8_OK_c_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIG_IN_DEL_tmr3[0]_net_1\);
    
    \FILT_OUT[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNIL726C_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_0[7]\);
    
    \FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2[2]_net_1\);
    
    \FILT_OUT_maj_RNIVRNJ[4]\ : NOR2B
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout3lto6_1);
    
    \FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2[4]_net_1\);
    
    un1_tmp_sum_in_b_0_m13 : AO18
      port map(A => \FILT_OUT[4]_net_1\, B => i6_mux, C => 
        \FILT_OUT[5]_net_1\, Y => i8_mux);
    
    \FILT_OUT_maj_RNIL726C_0[7]\ : AO13
      port map(A => N89, B => \FILT_OUT[7]_net_1\, C => i12_mux, 
        Y => \FILT_OUT_maj_RNIL726C_0[7]_net_1\);
    
    \FILT_OUT_maj_RNIGOBH1[7]\ : AO1
      port map(A => n_sigout3lto6_1, B => n_sigout3lto6_0, C => 
        \FILT_OUT[7]_net_1\, Y => n_sigout3);
    
    \FILT_OUT[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_0[0]\);
    
    SIGOUT_maj : MAJ3
      port map(A => \SIGOUT\, B => \SIGOUT_tmr2\, C => 
        \SIGOUT_tmr3\, Y => \UVL_OK_CH7A8\);
    
    un1_tmp_sum_in_b_0_m4 : OAI1
      port map(A => \FILT_OUT[2]_net_1\, B => \FILT_OUT[0]_net_1\, 
        C => \FILT_OUT[1]_net_1\, Y => i2_mux);
    
    \FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3[1]_net_1\);
    
    un2_n_filt_out_0_ADD_4x4_fast_I6_Y : XOR3
      port map(A => N_23_i, B => \SUM_IN_A[5]_net_1\, C => N92, Y
         => ADD_4x4_fast_I6_Y_3);
    
    \FILT_OUT[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_0[3]\);
    
    \THRESH_VAL[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNICCI93[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_0[1]\);
    
    \SIG_IN_DEL_tmr2[0]\ : DFN1C0
      port map(D => FPGA_FUSE_7_8_OK_c_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIG_IN_DEL_tmr2[0]_net_1\);
    
    \FILT_OUT_maj_RNIL726C[7]\ : XNOR3
      port map(A => \FILT_OUT[7]_net_1\, B => i12_mux, C => N89, 
        Y => \FILT_OUT_maj_RNIL726C[7]_net_1\);
    
    \FILT_OUT_maj_RNIVRNJ[3]\ : NOR2B
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[6]_net_1\, 
        Y => n_sigout3lto6_0);
    
    \SIG_IN_DEL_maj_RNI48TK_0[0]\ : NOR2B
      port map(A => \SIG_IN_DEL[0]_net_1\, B => 
        FPGA_FUSE_7_8_OK_c_0, Y => 
        \SIG_IN_DEL_maj_RNI48TK_0[0]_net_1\);
    
    un1_tmp_sum_in_b_0_m16 : AO18
      port map(A => \FILT_OUT[5]_net_1\, B => i8_mux, C => 
        \FILT_OUT[6]_net_1\, Y => i10_mux);
    
    \THRESH_VAL_maj_RNIBBI93_0[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_95, Y => N_93);
    
    SIGOUT_maj_RNI96K25 : MX2
      port map(A => N_94, B => \UVL_OK_CH7A8\, S => N_93, Y => 
        \SIGOUT_maj_RNI96K25\);
    
    \FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNIL726C[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2[6]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_tmp_sum_in_b_0_m26 : XNOR3
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        C => i6_mux, Y => N_27_i);
    
    un1_tmp_sum_in_b_0_m19 : AO18
      port map(A => \FILT_OUT[6]_net_1\, B => i10_mux, C => 
        \FILT_OUT[7]_net_1\, Y => i12_mux);
    
    \THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNICCI93[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr3[1]_net_1\);
    
    un1_tmp_sum_in_b_0_m30 : XNOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[2]_net_1\, 
        C => i2_mux, Y => N_31_i);
    
    \SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNI48TK[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr2[4]_net_1\);
    
    \FILT_OUT_maj[7]\ : MAJ3
      port map(A => \FILT_OUT_0[7]\, B => 
        \FILT_OUT_tmr2[7]_net_1\, C => \FILT_OUT_tmr3[7]_net_1\, 
        Y => \FILT_OUT[7]_net_1\);
    
    un1_tmp_sum_in_b_0_m15 : XOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => N_40);
    
    \FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNIL726C[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3[6]_net_1\);
    
    \SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNI48TK[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr3[4]_net_1\);
    
    un1_tmp_sum_in_b_0_m7 : AO18
      port map(A => \FILT_OUT[2]_net_1\, B => i2_mux, C => 
        \FILT_OUT[3]_net_1\, Y => i4_mux);
    
    un2_n_filt_out_1_ADD_4x4_fast_I4_Y_0 : MAJ3
      port map(A => N_23_i, B => \SUM_IN_A[5]_net_1\, C => N92, Y
         => N89);
    
    \THRESH_VAL_maj_RNICCI93[1]\ : OA1B
      port map(A => \THRESH_VAL[1]_net_1\, B => n_sigout3, C => 
        N_113, Y => \THRESH_VAL_maj_RNICCI93[1]_net_1\);
    
    un1_tmp_sum_in_b_0_m28 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[3]_net_1\, 
        C => i4_mux, Y => N_29_i);
    
    \SIG_IN_DEL_maj[0]\ : MAJ3
      port map(A => \SIG_IN_DEL_0[0]\, B => 
        \SIG_IN_DEL_tmr2[0]_net_1\, C => 
        \SIG_IN_DEL_tmr3[0]_net_1\, Y => \SIG_IN_DEL[0]_net_1\);
    
    SIGOUT : DFN1C0
      port map(D => \SIGOUT_maj_RNI96K25\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIGOUT\);
    
    \SIG_IN_DEL_maj_RNI48TK[0]\ : XOR2
      port map(A => FPGA_FUSE_7_8_OK_c_0, B => 
        \SIG_IN_DEL[0]_net_1\, Y => 
        \SIG_IN_DEL_maj_RNI48TK[0]_net_1\);
    
    \FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNIL726C_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3[7]_net_1\);
    
    \FILT_OUT_maj[5]\ : MAJ3
      port map(A => \FILT_OUT_0[5]\, B => 
        \FILT_OUT_tmr2[5]_net_1\, C => \FILT_OUT_tmr3[5]_net_1\, 
        Y => \FILT_OUT[5]_net_1\);
    
    \FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2[3]_net_1\);
    
    un2_n_filt_out_0_ADD_4x4_fast_I0_S : XNOR3
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => \un2_n_filt_out0[28]\);
    
    \THRESH_VAL_maj_RNI66PK1[1]\ : NOR3C
      port map(A => n_sigout15lto7_1, B => n_sigout15lto7_2, C
         => \THRESH_VAL[1]_net_1\, Y => N_113);
    
    \THRESH_VAL_maj_RNIBBI93[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_113, Y => \THRESH_VAL_ns[0]\);
    
    \THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \THRESH_VAL_0[1]\, B => 
        \THRESH_VAL_tmr2[1]_net_1\, C => 
        \THRESH_VAL_tmr3[1]_net_1\, Y => \THRESH_VAL[1]_net_1\);
    
    \FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3[2]_net_1\);
    
    \FILT_OUT_maj[1]\ : MAJ3
      port map(A => \FILT_OUT_0[1]\, B => 
        \FILT_OUT_tmr2[1]_net_1\, C => \FILT_OUT_tmr3[1]_net_1\, 
        Y => \FILT_OUT[1]_net_1\);
    
    \FILT_OUT_maj[0]\ : MAJ3
      port map(A => \FILT_OUT_0[0]\, B => 
        \FILT_OUT_tmr2[0]_net_1\, C => \FILT_OUT_tmr3[0]_net_1\, 
        Y => \FILT_OUT[0]_net_1\);
    
    un1_tmp_sum_in_b_0_m32 : AX1
      port map(A => \FILT_OUT[0]_net_1\, B => \FILT_OUT[1]_net_1\, 
        C => \FILT_OUT[2]_net_1\, Y => N_33_i);
    
    \SUM_IN_A_maj[5]\ : MAJ3
      port map(A => \SUM_IN_A_0[5]\, B => 
        \SUM_IN_A_tmr2[5]_net_1\, C => \SUM_IN_A_tmr3[5]_net_1\, 
        Y => \SUM_IN_A[5]_net_1\);
    
    \SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNI48TK_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr3[5]_net_1\);
    
    \THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr2[0]_net_1\);
    
    \THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \THRESH_VAL_0[0]\, B => 
        \THRESH_VAL_tmr2[0]_net_1\, C => 
        \THRESH_VAL_tmr3[0]_net_1\, Y => \THRESH_VAL[0]_net_1\);
    
    \FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2[1]_net_1\);
    
    un2_n_filt_out_0_ADD_4x4_fast_I0_CO1 : XA1A
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => N92);
    
    \FILT_OUT_maj_RNIVRNJ_0[4]\ : NOR2
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout15lto7_1);
    
    \FILT_OUT[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y_3, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_0[5]\);
    
    un1_tmp_sum_in_b_0_m10 : AO18
      port map(A => \FILT_OUT[3]_net_1\, B => i4_mux, C => 
        \FILT_OUT[4]_net_1\, Y => i6_mux);
    
    \FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3[0]_net_1\);
    
    \FILT_OUT_maj[2]\ : MAJ3
      port map(A => \FILT_OUT_0[2]\, B => 
        \FILT_OUT_tmr2[2]_net_1\, C => \FILT_OUT_tmr3[2]_net_1\, 
        Y => \FILT_OUT[2]_net_1\);
    
    \FILT_OUT_maj_RNIHSJT[3]\ : NOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => \FILT_OUT[6]_net_1\, Y => n_sigout15lto7_2);
    
    \FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3[4]_net_1\);
    
    \FILT_OUT_maj[4]\ : MAJ3
      port map(A => \FILT_OUT_0[4]\, B => 
        \FILT_OUT_tmr2[4]_net_1\, C => \FILT_OUT_tmr3[4]_net_1\, 
        Y => \FILT_OUT[4]_net_1\);
    
    \SUM_IN_A[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNI48TK[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_0[4]\);
    
    \FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y_3, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3[5]_net_1\);
    
    \FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2[0]_net_1\);
    
    \SIG_IN_DEL[0]\ : DFN1C0
      port map(D => FPGA_FUSE_7_8_OK_c_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIG_IN_DEL_0[0]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity IIR_FILT_4_2 is

    port( FPGA_FUSE_5_6_OK_c_0 : in    std_logic;
          POR_OUT_TO_SCA_c     : in    std_logic;
          BUF5M_J11_15_TCONN_c : in    std_logic;
          UVL_OK_CH5A6         : out   std_logic
        );

end IIR_FILT_4_2;

architecture DEF_ARCH of IIR_FILT_4_2 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component XNOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MAJ3
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

  component AO13
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

  component AO1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component OAI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AOI1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3C
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

  component XA1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_23_i, \FILT_OUT[6]_net_1\, \FILT_OUT[7]_net_1\, 
        i10_mux, i2_mux, \FILT_OUT[2]_net_1\, \FILT_OUT[0]_net_1\, 
        \FILT_OUT[1]_net_1\, i4_mux, \FILT_OUT[3]_net_1\, i6_mux, 
        \FILT_OUT[4]_net_1\, i8_mux, \FILT_OUT[5]_net_1\, 
        \FILT_OUT_maj_RNILIRQ5[7]_net_1\, i12_mux, N89, 
        \FILT_OUT_maj_RNILIRQ5_0[7]_net_1\, \SUM_IN_A[5]_net_1\, 
        N92, n_sigout15lto7_2, n_sigout15lto7_1, n_sigout3lto6_1, 
        n_sigout3lto6_0, N_33_i, N_31_i, N_29_i, N_27_i, N_40, 
        \SUM_IN_A[4]_net_1\, \un2_n_filt_out0[28]\, n_sigout3, 
        \SIGOUT_maj_RNIBM6U2\, \UVL_OK_CH5A6\, N_93, N_95, 
        \THRESH_VAL[1]_net_1\, \THRESH_VAL[0]_net_1\, N_113, 
        \THRESH_VAL_ns[0]\, \THRESH_VAL_maj_RNIS23U1[1]_net_1\, 
        ADD_4x4_fast_I6_Y_2, \SIG_IN_DEL_maj_RNIS1J9[0]_net_1\, 
        \SIG_IN_DEL[0]_net_1\, 
        \SIG_IN_DEL_maj_RNIS1J9_0[0]_net_1\, \FILT_OUT_0[7]\, 
        \FILT_OUT_tmr2_0[7]\, \FILT_OUT_tmr3_0[7]\, 
        \FILT_OUT_0[6]\, \FILT_OUT_tmr2_0[6]\, 
        \FILT_OUT_tmr3_0[6]\, \FILT_OUT_0[5]\, 
        \FILT_OUT_tmr2_0[5]\, \FILT_OUT_tmr3_0[5]\, 
        \FILT_OUT_0[4]\, \FILT_OUT_tmr2_0[4]\, 
        \FILT_OUT_tmr3_0[4]\, \FILT_OUT_0[3]\, 
        \FILT_OUT_tmr2_0[3]\, \FILT_OUT_tmr3_0[3]\, 
        \FILT_OUT_0[2]\, \FILT_OUT_tmr2_0[2]\, 
        \FILT_OUT_tmr3_0[2]\, \FILT_OUT_0[1]\, 
        \FILT_OUT_tmr2_0[1]\, \FILT_OUT_tmr3_0[1]\, 
        \FILT_OUT_0[0]\, \FILT_OUT_tmr2_0[0]\, 
        \FILT_OUT_tmr3_0[0]\, \SUM_IN_A_0[5]\, 
        \SUM_IN_A_tmr2_0[5]\, \SUM_IN_A_tmr3_0[5]\, 
        \SUM_IN_A_0[4]\, \SUM_IN_A_tmr2_0[4]\, 
        \SUM_IN_A_tmr3_0[4]\, \THRESH_VAL_0[1]\, 
        \THRESH_VAL_tmr2_0[1]\, \THRESH_VAL_tmr3_0[1]\, 
        \THRESH_VAL_0[0]\, \THRESH_VAL_tmr2_0[0]\, 
        \THRESH_VAL_tmr3_0[0]\, SIGOUT_0, SIGOUT_tmr2_0, 
        SIGOUT_tmr3_0, \SIG_IN_DEL_0[0]\, \SIG_IN_DEL_tmr2_0[0]\, 
        \SIG_IN_DEL_tmr3_0[0]\, \GND\, \VCC\ : std_logic;

begin 

    UVL_OK_CH5A6 <= \UVL_OK_CH5A6\;

    \FILT_OUT[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_0[4]\);
    
    SIGOUT_tmr2 : DFN1C0
      port map(D => \SIGOUT_maj_RNIBM6U2\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        SIGOUT_tmr2_0);
    
    \THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIS23U1[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr2_0[1]\);
    
    \SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIS1J9_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr2_0[5]\);
    
    \FILT_OUT[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNILIRQ5[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_0[6]\);
    
    \THRESH_VAL[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_0[0]\);
    
    SIGOUT_tmr3 : DFN1C0
      port map(D => \SIGOUT_maj_RNIBM6U2\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        SIGOUT_tmr3_0);
    
    un1_tmp_sum_in_b_0_m22 : XNOR3
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => i10_mux, Y => N_23_i);
    
    \THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr3_0[0]\);
    
    \FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNILIRQ5_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_0[7]\);
    
    \FILT_OUT_maj[3]\ : MAJ3
      port map(A => \FILT_OUT_0[3]\, B => \FILT_OUT_tmr2_0[3]\, C
         => \FILT_OUT_tmr3_0[3]\, Y => \FILT_OUT[3]_net_1\);
    
    \FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_0[3]\);
    
    \SIG_IN_DEL_maj_RNIS1J9[0]\ : XOR2
      port map(A => FPGA_FUSE_5_6_OK_c_0, B => 
        \SIG_IN_DEL[0]_net_1\, Y => 
        \SIG_IN_DEL_maj_RNIS1J9[0]_net_1\);
    
    \FILT_OUT_maj[6]\ : MAJ3
      port map(A => \FILT_OUT_0[6]\, B => \FILT_OUT_tmr2_0[6]\, C
         => \FILT_OUT_tmr3_0[6]\, Y => \FILT_OUT[6]_net_1\);
    
    \SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \SUM_IN_A_0[4]\, B => \SUM_IN_A_tmr2_0[4]\, C
         => \SUM_IN_A_tmr3_0[4]\, Y => \SUM_IN_A[4]_net_1\);
    
    \FILT_OUT[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_0[1]\);
    
    \FILT_OUT_maj_RNILIRQ5_0[7]\ : AO13
      port map(A => N89, B => \FILT_OUT[7]_net_1\, C => i12_mux, 
        Y => \FILT_OUT_maj_RNILIRQ5_0[7]_net_1\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \THRESH_VAL_maj_RNIR13U1_0[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_95, Y => N_93);
    
    \FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y_2, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_0[5]\);
    
    \SUM_IN_A[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIS1J9_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_0[5]\);
    
    \FILT_OUT_maj_RNI56CE[3]\ : NOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => \FILT_OUT[6]_net_1\, Y => n_sigout15lto7_2);
    
    \FILT_OUT[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_0[2]\);
    
    \SIG_IN_DEL_tmr3[0]\ : DFN1C0
      port map(D => FPGA_FUSE_5_6_OK_c_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIG_IN_DEL_tmr3_0[0]\);
    
    \FILT_OUT[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNILIRQ5_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_0[7]\);
    
    \FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_0[2]\);
    
    \FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_0[4]\);
    
    un1_tmp_sum_in_b_0_m13 : AO18
      port map(A => \FILT_OUT[4]_net_1\, B => i6_mux, C => 
        \FILT_OUT[5]_net_1\, Y => i8_mux);
    
    \FILT_OUT[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_0[0]\);
    
    SIGOUT_maj : MAJ3
      port map(A => SIGOUT_0, B => SIGOUT_tmr2_0, C => 
        SIGOUT_tmr3_0, Y => \UVL_OK_CH5A6\);
    
    un1_tmp_sum_in_b_0_m4 : OAI1
      port map(A => \FILT_OUT[2]_net_1\, B => \FILT_OUT[0]_net_1\, 
        C => \FILT_OUT[1]_net_1\, Y => i2_mux);
    
    \FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_0[1]\);
    
    un2_n_filt_out_0_ADD_4x4_fast_I6_Y : XOR3
      port map(A => N_23_i, B => \SUM_IN_A[5]_net_1\, C => N92, Y
         => ADD_4x4_fast_I6_Y_2);
    
    \FILT_OUT[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_0[3]\);
    
    \THRESH_VAL[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIS23U1[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_0[1]\);
    
    \SIG_IN_DEL_tmr2[0]\ : DFN1C0
      port map(D => FPGA_FUSE_5_6_OK_c_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIG_IN_DEL_tmr2_0[0]\);
    
    \THRESH_VAL_maj_RNIEH1V_0[1]\ : AOI1B
      port map(A => n_sigout15lto7_2, B => n_sigout15lto7_1, C
         => \THRESH_VAL[1]_net_1\, Y => N_95);
    
    un1_tmp_sum_in_b_0_m16 : AO18
      port map(A => \FILT_OUT[5]_net_1\, B => i8_mux, C => 
        \FILT_OUT[6]_net_1\, Y => i10_mux);
    
    \FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNILIRQ5[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_0[6]\);
    
    SIGOUT_maj_RNIBM6U2 : MX2
      port map(A => n_sigout3, B => \UVL_OK_CH5A6\, S => N_93, Y
         => \SIGOUT_maj_RNIBM6U2\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_tmp_sum_in_b_0_m26 : XNOR3
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        C => i6_mux, Y => N_27_i);
    
    un1_tmp_sum_in_b_0_m19 : AO18
      port map(A => \FILT_OUT[6]_net_1\, B => i10_mux, C => 
        \FILT_OUT[7]_net_1\, Y => i12_mux);
    
    \THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIS23U1[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr3_0[1]\);
    
    un1_tmp_sum_in_b_0_m30 : XNOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[2]_net_1\, 
        C => i2_mux, Y => N_31_i);
    
    \SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIS1J9[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr2_0[4]\);
    
    \FILT_OUT_maj[7]\ : MAJ3
      port map(A => \FILT_OUT_0[7]\, B => \FILT_OUT_tmr2_0[7]\, C
         => \FILT_OUT_tmr3_0[7]\, Y => \FILT_OUT[7]_net_1\);
    
    un1_tmp_sum_in_b_0_m15 : XOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => N_40);
    
    \FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNILIRQ5[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_0[6]\);
    
    \SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIS1J9[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr3_0[4]\);
    
    \FILT_OUT_maj_RNILIRQ5[7]\ : XNOR3
      port map(A => \FILT_OUT[7]_net_1\, B => i12_mux, C => N89, 
        Y => \FILT_OUT_maj_RNILIRQ5[7]_net_1\);
    
    \FILT_OUT_maj_RNINNI9_0[4]\ : NOR2
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout15lto7_1);
    
    un1_tmp_sum_in_b_0_m7 : AO18
      port map(A => \FILT_OUT[2]_net_1\, B => i2_mux, C => 
        \FILT_OUT[3]_net_1\, Y => i4_mux);
    
    un2_n_filt_out_1_ADD_4x4_fast_I4_Y_0 : MAJ3
      port map(A => N_23_i, B => \SUM_IN_A[5]_net_1\, C => N92, Y
         => N89);
    
    un1_tmp_sum_in_b_0_m28 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[3]_net_1\, 
        C => i4_mux, Y => N_29_i);
    
    \SIG_IN_DEL_maj[0]\ : MAJ3
      port map(A => \SIG_IN_DEL_0[0]\, B => 
        \SIG_IN_DEL_tmr2_0[0]\, C => \SIG_IN_DEL_tmr3_0[0]\, Y
         => \SIG_IN_DEL[0]_net_1\);
    
    \SIG_IN_DEL_maj_RNIS1J9_0[0]\ : NOR2B
      port map(A => \SIG_IN_DEL[0]_net_1\, B => 
        FPGA_FUSE_5_6_OK_c_0, Y => 
        \SIG_IN_DEL_maj_RNIS1J9_0[0]_net_1\);
    
    SIGOUT : DFN1C0
      port map(D => \SIGOUT_maj_RNIBM6U2\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        SIGOUT_0);
    
    \FILT_OUT_maj_RNISTUN[7]\ : AO1
      port map(A => n_sigout3lto6_1, B => n_sigout3lto6_0, C => 
        \FILT_OUT[7]_net_1\, Y => n_sigout3);
    
    \THRESH_VAL_maj_RNIS23U1[1]\ : OA1B
      port map(A => n_sigout3, B => \THRESH_VAL[1]_net_1\, C => 
        N_113, Y => \THRESH_VAL_maj_RNIS23U1[1]_net_1\);
    
    \FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNILIRQ5_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_0[7]\);
    
    \FILT_OUT_maj[5]\ : MAJ3
      port map(A => \FILT_OUT_0[5]\, B => \FILT_OUT_tmr2_0[5]\, C
         => \FILT_OUT_tmr3_0[5]\, Y => \FILT_OUT[5]_net_1\);
    
    \FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_0[3]\);
    
    un2_n_filt_out_0_ADD_4x4_fast_I0_S : XNOR3
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => \un2_n_filt_out0[28]\);
    
    \THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \THRESH_VAL_0[1]\, B => 
        \THRESH_VAL_tmr2_0[1]\, C => \THRESH_VAL_tmr3_0[1]\, Y
         => \THRESH_VAL[1]_net_1\);
    
    \THRESH_VAL_maj_RNIEH1V[1]\ : NOR3C
      port map(A => n_sigout15lto7_1, B => n_sigout15lto7_2, C
         => \THRESH_VAL[1]_net_1\, Y => N_113);
    
    \FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_0[2]\);
    
    \FILT_OUT_maj[1]\ : MAJ3
      port map(A => \FILT_OUT_0[1]\, B => \FILT_OUT_tmr2_0[1]\, C
         => \FILT_OUT_tmr3_0[1]\, Y => \FILT_OUT[1]_net_1\);
    
    \FILT_OUT_maj[0]\ : MAJ3
      port map(A => \FILT_OUT_0[0]\, B => \FILT_OUT_tmr2_0[0]\, C
         => \FILT_OUT_tmr3_0[0]\, Y => \FILT_OUT[0]_net_1\);
    
    un1_tmp_sum_in_b_0_m32 : AX1
      port map(A => \FILT_OUT[0]_net_1\, B => \FILT_OUT[1]_net_1\, 
        C => \FILT_OUT[2]_net_1\, Y => N_33_i);
    
    \SUM_IN_A_maj[5]\ : MAJ3
      port map(A => \SUM_IN_A_0[5]\, B => \SUM_IN_A_tmr2_0[5]\, C
         => \SUM_IN_A_tmr3_0[5]\, Y => \SUM_IN_A[5]_net_1\);
    
    \SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIS1J9_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr3_0[5]\);
    
    \THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr2_0[0]\);
    
    \THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \THRESH_VAL_0[0]\, B => 
        \THRESH_VAL_tmr2_0[0]\, C => \THRESH_VAL_tmr3_0[0]\, Y
         => \THRESH_VAL[0]_net_1\);
    
    \FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_0[1]\);
    
    un2_n_filt_out_0_ADD_4x4_fast_I0_CO1 : XA1A
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => N92);
    
    \FILT_OUT[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y_2, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_0[5]\);
    
    un1_tmp_sum_in_b_0_m10 : AO18
      port map(A => \FILT_OUT[3]_net_1\, B => i4_mux, C => 
        \FILT_OUT[4]_net_1\, Y => i6_mux);
    
    \FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_0[0]\);
    
    \FILT_OUT_maj[2]\ : MAJ3
      port map(A => \FILT_OUT_0[2]\, B => \FILT_OUT_tmr2_0[2]\, C
         => \FILT_OUT_tmr3_0[2]\, Y => \FILT_OUT[2]_net_1\);
    
    \FILT_OUT_maj_RNINNI9[3]\ : NOR2B
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[6]_net_1\, 
        Y => n_sigout3lto6_0);
    
    \FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_0[4]\);
    
    \FILT_OUT_maj_RNINNI9[4]\ : NOR2B
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout3lto6_1);
    
    \FILT_OUT_maj[4]\ : MAJ3
      port map(A => \FILT_OUT_0[4]\, B => \FILT_OUT_tmr2_0[4]\, C
         => \FILT_OUT_tmr3_0[4]\, Y => \FILT_OUT[4]_net_1\);
    
    \THRESH_VAL_maj_RNIR13U1[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_113, Y => \THRESH_VAL_ns[0]\);
    
    \SUM_IN_A[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIS1J9[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_0[4]\);
    
    \FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y_2, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_0[5]\);
    
    \FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_0[0]\);
    
    \SIG_IN_DEL[0]\ : DFN1C0
      port map(D => FPGA_FUSE_5_6_OK_c_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIG_IN_DEL_0[0]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity MAIN_SEQUENCER_NEW_3_1 is

    port( REGISTER_CH_CMD_CH_0 : in    std_logic;
          P_CH_VOSG_EN_c       : out   std_logic_vector(5 downto 4);
          P_CH_MREG_EN_c_c_0   : out   std_logic;
          P_CH_IAUX_EN_c_c_0   : out   std_logic;
          POR_OUT_TO_SCA_c     : in    std_logic;
          BUF5M_J11_15_TCONN_c : in    std_logic;
          CH5_6_MS_CFG_EN_c    : in    std_logic;
          STATUS_LED_c_0       : in    std_logic;
          DTYCYC_EN            : in    std_logic;
          un3_n_ch_vosg_en     : out   std_logic;
          CH_ACTIVE_STAT       : out   std_logic;
          STDBY_OFFB_B         : in    std_logic;
          UVL_OK_CH5A6         : in    std_logic;
          STATUS_LED_c         : in    std_logic
        );

end MAIN_SEQUENCER_NEW_3_1;

architecture DEF_ARCH of MAIN_SEQUENCER_NEW_3_1 is 

  component OR3A
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

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component MAJ3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AOI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MIN3X
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

  component OA1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3A
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

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component OR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1D
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

  component OA1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_230_0, \SEQUENCER_STATE[4]_net_1\, 
        \SEQUENCER_STATE[3]_net_1\, N_304, \RET_STATE[4]_net_1\, 
        N_221, \SEQUENCER_STATE_ns_i_1[2]\, N_246, 
        \SEQUENCER_STATE[9]_net_1\, 
        \SEQUENCER_STATE_ns_i_0[2]_net_1\, un8_del_cntr_11, 
        un8_del_cntr_2, un8_del_cntr_1, un8_del_cntr_7, 
        un8_del_cntr_10, un8_del_cntr_6, \DEL_CNTR[9]_net_1\, 
        \DEL_CNTR[10]_net_1\, un8_del_cntr_9, un8_del_cntr_4, 
        \DEL_CNTR[6]_net_1\, \DEL_CNTR[5]_net_1\, 
        \DEL_CNTR[1]_net_1\, \DEL_CNTR[14]_net_1\, 
        \DEL_CNTR[13]_net_1\, \DEL_CNTR[12]_net_1\, 
        \DEL_CNTR[11]_net_1\, \DEL_CNTR[8]_net_1\, 
        \DEL_CNTR[7]_net_1\, \DEL_CNTR[3]_net_1\, 
        \DEL_CNTR[4]_net_1\, \DEL_CNTR[2]_net_1\, 
        \DEL_CNTR[0]_net_1\, \RET_STATE_0_a3_0[5]\, 
        \RET_STATE[5]_net_1\, \SEQUENCER_STATE[7]_net_1\, 
        \RET_STATE_0_a3_0[6]\, \RET_STATE[6]_net_1\, 
        \SEQUENCER_STATE[6]_net_1\, 
        \SEQUENCER_STATE_maj_RNIADHK7[9]_net_1\, N_271, N_313, 
        \RET_STATE[9]_net_1\, \RET_STATE_maj_RNI1MCD9[9]_net_1\, 
        N_315, \SEQUENCER_STATE_maj_RNIJKUH2[8]_net_1\, N_266, 
        un8_del_cntr, \CH_ACTIVE_STAT_maj_RNI0KEN1\, 
        CH_ACTIVE_STAT_net_1, N_309, N_275, N_236, 
        \SEQUENCER_STATE[8]_net_1\, 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, 
        \SEQUENCER_STATE_ns[5]\, N_302, N_290, 
        \CH_IAUX_EN_maj_RNI9T632[0]_net_1\, N_CH_IAUX_EN_1_sqmuxa, 
        \P_CH_IAUX_EN_c_c[4]\, \CH_MREG_EN_maj_RNI7O3L2[0]_net_1\, 
        N_CH_MREG_EN_1_sqmuxa, \P_CH_MREG_EN_c_c[4]\, 
        \CH_VOSG_EN_maj_RNIQG1A3[0]_net_1\, \N_CH_VOSG_EN[0]\, 
        \P_CH_VOSG_EN_c[4]\, \CH_VOSG_EN_maj_RNI4G3C3[1]_net_1\, 
        \N_CH_VOSG_EN[1]\, \P_CH_VOSG_EN_c[5]\, 
        \un3_n_ch_vosg_en\, N_CH_VOSG_EN_2_sqmuxa, 
        \RET_STATE_maj_RNIB49H1[9]_net_1\, N_225, N_312, N_222, 
        N_285, N_298, N_299, 
        \SEQUENCER_STATE_maj_RNI819H1[5]_net_1\, 
        \SEQUENCER_STATE[5]_net_1\, 
        \SEQUENCER_STATE_maj_RNI709H1[6]_net_1\, 
        \SEQUENCER_STATE_maj_RNI6V8H1[5]_net_1\, 
        \N_CH_VOSG_EN_7[1]\, \SEQUENCER_STATE_ns[4]\, 
        \SEQUENCER_STATE_ns[3]\, \N_DEL_CNTR[14]\, I_58_1, 
        \N_DEL_CNTR[13]\, I_60_1, \N_DEL_CNTR[12]\, I_50_1, 
        \N_DEL_CNTR[11]\, I_48_1, \N_DEL_CNTR[10]\, I_54_1, 
        \N_DEL_CNTR[9]\, I_55_1, \N_DEL_CNTR[8]\, I_57_1, 
        \N_DEL_CNTR[7]\, I_59_1, \N_DEL_CNTR[6]\, I_49_1, 
        \N_DEL_CNTR[5]\, I_62_1, \N_DEL_CNTR[4]\, I_53_1, 
        \N_DEL_CNTR[3]\, I_51_1, \N_DEL_CNTR[2]\, I_52_1, 
        \N_DEL_CNTR[1]\, I_56_1, \N_DEL_CNTR[0]\, 
        \DWACT_ADD_CI_0_partial_sum[0]\, \RET_STATE_0[4]\, 
        \RET_STATE_tmr2_0[4]\, \RET_STATE_tmr3_0[4]\, 
        \RET_STATE_0[5]\, \RET_STATE_tmr2_0[5]\, 
        \RET_STATE_tmr3_0[5]\, \RET_STATE_0[6]\, 
        \RET_STATE_tmr2_0[6]\, \RET_STATE_tmr3_0[6]\, 
        \RET_STATE_0[9]\, \RET_STATE_tmr2_0[9]\, 
        \RET_STATE_tmr3_0[9]\, \CH_VOSG_EN_0[1]\, 
        \CH_VOSG_EN_tmr2_0[1]\, \CH_VOSG_EN_tmr3_0[1]\, 
        \CH_VOSG_EN_0[0]\, \CH_VOSG_EN_tmr2_0[0]\, 
        \CH_VOSG_EN_tmr3_0[0]\, \SEQUENCER_STATE_0[3]\, 
        \SEQUENCER_STATE_tmr2_0[3]\, \SEQUENCER_STATE_tmr3_0[3]\, 
        \SEQUENCER_STATE_0[4]\, \SEQUENCER_STATE_tmr2_0[4]\, 
        \SEQUENCER_STATE_tmr3_0[4]\, \SEQUENCER_STATE_0[5]\, 
        \SEQUENCER_STATE_tmr2_0[5]\, \SEQUENCER_STATE_tmr3_0[5]\, 
        \SEQUENCER_STATE_0[6]\, \SEQUENCER_STATE_tmr2_0[6]\, 
        \SEQUENCER_STATE_tmr3_0[6]\, \SEQUENCER_STATE_0[7]\, 
        \SEQUENCER_STATE_tmr2_0[7]\, \SEQUENCER_STATE_tmr3_0[7]\, 
        \SEQUENCER_STATE_0[8]\, \SEQUENCER_STATE_tmr2_0[8]\, 
        \SEQUENCER_STATE_tmr3_0[8]\, \SEQUENCER_STATE_0[9]\, 
        \SEQUENCER_STATE_tmr2_0[9]\, \SEQUENCER_STATE_tmr3_0[9]\, 
        \CH_IAUX_EN_0[0]\, \CH_IAUX_EN_tmr2_0[0]\, 
        \CH_IAUX_EN_tmr3_0[0]\, \CH_MREG_EN_0[0]\, 
        \CH_MREG_EN_tmr2_0[0]\, \CH_MREG_EN_tmr3_0[0]\, 
        \DEL_CNTR_0[14]\, \DEL_CNTR_tmr2_0[14]\, 
        \DEL_CNTR_tmr3_0[14]\, \DEL_CNTR_0[13]\, 
        \DEL_CNTR_tmr2_0[13]\, \DEL_CNTR_tmr3_0[13]\, 
        \DEL_CNTR_0[12]\, \DEL_CNTR_tmr2_0[12]\, 
        \DEL_CNTR_tmr3_0[12]\, \DEL_CNTR_0[11]\, 
        \DEL_CNTR_tmr2_0[11]\, \DEL_CNTR_tmr3_0[11]\, 
        \DEL_CNTR_0[10]\, \DEL_CNTR_tmr2_0[10]\, 
        \DEL_CNTR_tmr3_0[10]\, \DEL_CNTR_0[9]\, 
        \DEL_CNTR_tmr2_0[9]\, \DEL_CNTR_tmr3_0[9]\, 
        \DEL_CNTR_0[8]\, \DEL_CNTR_tmr2_0[8]\, 
        \DEL_CNTR_tmr3_0[8]\, \DEL_CNTR_0[7]\, 
        \DEL_CNTR_tmr2_0[7]\, \DEL_CNTR_tmr3_0[7]\, 
        \DEL_CNTR_0[6]\, \DEL_CNTR_tmr2_0[6]\, 
        \DEL_CNTR_tmr3_0[6]\, \DEL_CNTR_0[5]\, 
        \DEL_CNTR_tmr2_0[5]\, \DEL_CNTR_tmr3_0[5]\, 
        \DEL_CNTR_0[4]\, \DEL_CNTR_tmr2_0[4]\, 
        \DEL_CNTR_tmr3_0[4]\, \DEL_CNTR_0[3]\, 
        \DEL_CNTR_tmr2_0[3]\, \DEL_CNTR_tmr3_0[3]\, 
        \DEL_CNTR_0[2]\, \DEL_CNTR_tmr2_0[2]\, 
        \DEL_CNTR_tmr3_0[2]\, \DEL_CNTR_0[1]\, 
        \DEL_CNTR_tmr2_0[1]\, \DEL_CNTR_tmr3_0[1]\, 
        \DEL_CNTR_0[0]\, \DEL_CNTR_tmr2_0[0]\, 
        \DEL_CNTR_tmr3_0[0]\, CH_ACTIVE_STAT_0, 
        \CH_ACTIVE_STAT_tmr2\, \CH_ACTIVE_STAT_tmr3\, 
        \DWACT_ADD_CI_0_pog_array_1_5[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\, 
        \DWACT_ADD_CI_0_pog_array_2_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_2[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\, 
        \DWACT_ADD_CI_0_pog_array_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\, 
        \DWACT_ADD_CI_0_g_array_3[0]\, 
        \DWACT_ADD_CI_0_g_array_2[0]\, 
        \DWACT_ADD_CI_0_g_array_2_1[0]\, 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, 
        \DWACT_ADD_CI_0_g_array_0_5[0]\, 
        \DWACT_ADD_CI_0_g_array_10[0]\, 
        \DWACT_ADD_CI_0_g_array_2_2[0]\, 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, 
        \DWACT_ADD_CI_0_g_array_1_5[0]\, 
        \DWACT_ADD_CI_0_g_array_1_3[0]\, 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, 
        \DWACT_ADD_CI_0_g_array_1[0]\, 
        \DWACT_ADD_CI_0_g_array_1_1[0]\, 
        \DWACT_ADD_CI_0_g_array_11[0]\, 
        \DWACT_ADD_CI_0_g_array_12_2[0]\, 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, 
        \DWACT_ADD_CI_0_g_array_12_3[0]\, 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, 
        \DWACT_ADD_CI_0_g_array_1_6[0]\, 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, 
        \DWACT_ADD_CI_0_g_array_0_13[0]\, 
        \DWACT_ADD_CI_0_g_array_0_7[0]\, 
        \DWACT_ADD_CI_0_g_array_12[0]\, 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, 
        \DWACT_ADD_CI_0_g_array_12_4[0]\, 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, 
        \DWACT_ADD_CI_0_g_array_11_2[0]\, 
        \DWACT_ADD_CI_0_g_array_0_11[0]\, 
        \DWACT_ADD_CI_0_g_array_0_3[0]\, 
        \DWACT_ADD_CI_0_g_array_12_5[0]\, 
        \DWACT_ADD_CI_0_pog_array_0[0]\, \DWACT_ADD_CI_0_TMP[0]\, 
        \DWACT_ADD_CI_0_g_array_0_1[0]\, 
        \DWACT_ADD_CI_0_g_array_0_9[0]\, 
        \DWACT_ADD_CI_0_partial_sum[5]\, 
        \DWACT_ADD_CI_0_partial_sum[13]\, 
        \DWACT_ADD_CI_0_partial_sum[7]\, 
        \DWACT_ADD_CI_0_partial_sum[14]\, 
        \DWACT_ADD_CI_0_partial_sum[8]\, 
        \DWACT_ADD_CI_0_partial_sum[1]\, 
        \DWACT_ADD_CI_0_partial_sum[9]\, 
        \DWACT_ADD_CI_0_partial_sum[10]\, 
        \DWACT_ADD_CI_0_partial_sum[4]\, 
        \DWACT_ADD_CI_0_partial_sum[2]\, 
        \DWACT_ADD_CI_0_partial_sum[3]\, 
        \DWACT_ADD_CI_0_partial_sum[12]\, 
        \DWACT_ADD_CI_0_partial_sum[6]\, 
        \DWACT_ADD_CI_0_partial_sum[11]\, \GND\, \VCC\
         : std_logic;

begin 

    P_CH_VOSG_EN_c(5) <= \P_CH_VOSG_EN_c[5]\;
    P_CH_VOSG_EN_c(4) <= \P_CH_VOSG_EN_c[4]\;
    P_CH_MREG_EN_c_c_0 <= \P_CH_MREG_EN_c_c[4]\;
    P_CH_IAUX_EN_c_c_0 <= \P_CH_IAUX_EN_c_c[4]\;
    un3_n_ch_vosg_en <= \un3_n_ch_vosg_en\;
    CH_ACTIVE_STAT <= CH_ACTIVE_STAT_net_1;

    \SEQUENCER_STATE_maj_RNITA3LR[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_54_1, Y => 
        \N_DEL_CNTR[10]\);
    
    un1_DEL_CNTR_I_41 : XOR2
      port map(A => \DEL_CNTR[12]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[12]\);
    
    un1_DEL_CNTR_I_71 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12[0]\);
    
    un1_DEL_CNTR_I_57 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[8]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, Y => I_57_1);
    
    un1_DEL_CNTR_I_30 : XOR2
      port map(A => \DEL_CNTR[1]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0[0]\);
    
    \DEL_CNTR_tmr2[14]\ : DFN1P0
      port map(D => \N_DEL_CNTR[14]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[14]\);
    
    \DEL_CNTR_maj[10]\ : MAJ3
      port map(A => \DEL_CNTR_0[10]\, B => \DEL_CNTR_tmr2_0[10]\, 
        C => \DEL_CNTR_tmr3_0[10]\, Y => \DEL_CNTR[10]_net_1\);
    
    \RET_STATE[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI6V8H1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_0[4]\);
    
    \SEQUENCER_STATE_maj[8]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[8]\, B => 
        \SEQUENCER_STATE_tmr2_0[8]\, C => 
        \SEQUENCER_STATE_tmr3_0[8]\, Y => 
        \SEQUENCER_STATE[8]_net_1\);
    
    \SEQUENCER_STATE_tmr2[8]\ : DFN1C0
      port map(D => N_315, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \SEQUENCER_STATE_tmr2_0[8]\);
    
    \DEL_CNTR[10]\ : DFN1P0
      port map(D => \N_DEL_CNTR[10]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[10]\);
    
    un1_DEL_CNTR_I_36 : XOR2
      port map(A => \DEL_CNTR[1]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[1]\);
    
    \SEQUENCER_STATE_maj_RNI1QR73[8]\ : AOI1
      port map(A => un8_del_cntr, B => \SEQUENCER_STATE[8]_net_1\, 
        C => \SEQUENCER_STATE[9]_net_1\, Y => N_313);
    
    un1_DEL_CNTR_I_49 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[6]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, Y => I_49_1);
    
    un1_DEL_CNTR_I_79 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\);
    
    un1_DEL_CNTR_I_6 : AND2
      port map(A => \DEL_CNTR[3]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\);
    
    un1_DEL_CNTR_I_81 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_10[0]\);
    
    un1_DEL_CNTR_I_9 : AND2
      port map(A => \DEL_CNTR[10]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\);
    
    \RET_STATE_tmr3[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI819H1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3_0[6]\);
    
    \SEQUENCER_STATE_maj_RNIQ2ON9[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_51_1, Y => 
        \N_DEL_CNTR[3]\);
    
    \DEL_CNTR_maj_RNID2MI[11]\ : NOR2
      port map(A => \DEL_CNTR[12]_net_1\, B => 
        \DEL_CNTR[11]_net_1\, Y => un8_del_cntr_6);
    
    \SEQUENCER_STATE_maj_RNILB5P[6]\ : OR2
      port map(A => \SEQUENCER_STATE[6]_net_1\, B => 
        \SEQUENCER_STATE[7]_net_1\, Y => N_222);
    
    \SEQUENCER_STATE_maj_RNIKM3O[6]\ : NOR2A
      port map(A => \RET_STATE[6]_net_1\, B => 
        \SEQUENCER_STATE[6]_net_1\, Y => \RET_STATE_0_a3_0[6]\);
    
    un1_DEL_CNTR_I_37 : XOR2
      port map(A => \DEL_CNTR[14]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[14]\);
    
    \DEL_CNTR_tmr2[6]\ : DFN1P0
      port map(D => \N_DEL_CNTR[6]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[6]\);
    
    \DEL_CNTR_maj_RNIMCSL[14]\ : NOR3
      port map(A => \DEL_CNTR[1]_net_1\, B => 
        \DEL_CNTR[14]_net_1\, C => \DEL_CNTR[13]_net_1\, Y => 
        un8_del_cntr_7);
    
    \DEL_CNTR_maj[4]\ : MAJ3
      port map(A => \DEL_CNTR_0[4]\, B => \DEL_CNTR_tmr2_0[4]\, C
         => \DEL_CNTR_tmr3_0[4]\, Y => \DEL_CNTR[4]_net_1\);
    
    \DEL_CNTR[3]\ : DFN1P0
      port map(D => \N_DEL_CNTR[3]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[3]\);
    
    un1_DEL_CNTR_I_89 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_1[0]\);
    
    un1_DEL_CNTR_I_20 : XOR2
      port map(A => \DEL_CNTR[10]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_9[0]\);
    
    \SEQUENCER_STATE_tmr3[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNI1MCD9[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_0[9]\);
    
    \DEL_CNTR_tmr2[13]\ : DFN1P0
      port map(D => \N_DEL_CNTR[13]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[13]\);
    
    \RET_STATE_maj_RNIJ12N[5]\ : OR2
      port map(A => \RET_STATE[6]_net_1\, B => 
        \RET_STATE[5]_net_1\, Y => N_221);
    
    \RET_STATE_maj[5]\ : MAJ3
      port map(A => \RET_STATE_0[5]\, B => \RET_STATE_tmr2_0[5]\, 
        C => \RET_STATE_tmr3_0[5]\, Y => \RET_STATE[5]_net_1\);
    
    \DEL_CNTR_tmr2[8]\ : DFN1P0
      port map(D => \N_DEL_CNTR[8]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[8]\);
    
    \CH_MREG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CH_MREG_EN_maj_RNI7O3L2[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_MREG_EN_tmr3_0[0]\);
    
    \SEQUENCER_STATE_tmr3[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_0[4]\);
    
    \SEQUENCER_STATE_maj_RNI63SG4[8]\ : NOR3B
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH5A6, C => N_285, 
        Y => N_315);
    
    \RET_STATE_maj[6]\ : MAJ3
      port map(A => \RET_STATE_0[6]\, B => \RET_STATE_tmr2_0[6]\, 
        C => \RET_STATE_tmr3_0[6]\, Y => \RET_STATE[6]_net_1\);
    
    \CH_MREG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CH_MREG_EN_maj_RNI7O3L2[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_MREG_EN_tmr2_0[0]\);
    
    un1_DEL_CNTR_I_68 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\);
    
    un1_DEL_CNTR_I_26 : XOR2
      port map(A => \DEL_CNTR[6]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_5[0]\);
    
    \DEL_CNTR_tmr3[14]\ : DFN1P0
      port map(D => \N_DEL_CNTR[14]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[14]\);
    
    \DEL_CNTR_tmr2[3]\ : DFN1P0
      port map(D => \N_DEL_CNTR[3]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[3]\);
    
    \CH_VOSG_EN_maj[1]\ : MAJ3
      port map(A => \CH_VOSG_EN_0[1]\, B => 
        \CH_VOSG_EN_tmr2_0[1]\, C => \CH_VOSG_EN_tmr3_0[1]\, Y
         => \P_CH_VOSG_EN_c[5]\);
    
    un1_DEL_CNTR_I_53 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[4]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, Y => I_53_1);
    
    \DEL_CNTR_tmr2[4]\ : DFN1P0
      port map(D => \N_DEL_CNTR[4]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[4]\);
    
    \SEQUENCER_STATE_maj_RNILRJQG[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_49_1, Y => 
        \N_DEL_CNTR[6]\);
    
    \SEQUENCER_STATE_maj_RNI8UAJI[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_59_1, Y => 
        \N_DEL_CNTR[7]\);
    
    un1_DEL_CNTR_I_27 : XOR2
      port map(A => \DEL_CNTR[11]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\);
    
    \RET_STATE_maj_RNIR0J21[4]\ : NOR2A
      port map(A => \RET_STATE[4]_net_1\, B => N_221, Y => N_304);
    
    \CH_VOSG_EN_maj_RNIQG1A3[0]\ : MX2
      port map(A => \N_CH_VOSG_EN[0]\, B => \P_CH_VOSG_EN_c[4]\, 
        S => N_290, Y => \CH_VOSG_EN_maj_RNIQG1A3[0]_net_1\);
    
    \CH_MREG_EN[0]\ : DFN1C0
      port map(D => \CH_MREG_EN_maj_RNI7O3L2[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_MREG_EN_0[0]\);
    
    \DEL_CNTR_tmr3[9]\ : DFN1P0
      port map(D => \N_DEL_CNTR[9]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[9]\);
    
    un1_DEL_CNTR_I_55 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[9]\, B => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\, Y => I_55_1);
    
    \DEL_CNTR_tmr2[2]\ : DFN1P0
      port map(D => \N_DEL_CNTR[2]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[2]\);
    
    un1_DEL_CNTR_I_40 : XOR2
      port map(A => \DEL_CNTR[8]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[8]\);
    
    un1_DEL_CNTR_I_70 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    \DEL_CNTR_tmr3[5]\ : DFN1P0
      port map(D => \N_DEL_CNTR[5]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[5]\);
    
    \DEL_CNTR_maj[2]\ : MAJ3
      port map(A => \DEL_CNTR_0[2]\, B => \DEL_CNTR_tmr2_0[2]\, C
         => \DEL_CNTR_tmr3_0[2]\, Y => \DEL_CNTR[2]_net_1\);
    
    \CH_VOSG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIQG1A3[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr3_0[0]\);
    
    un1_DEL_CNTR_I_33 : XOR2
      port map(A => \DEL_CNTR[3]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[3]\);
    
    \CH_MREG_EN_maj[0]\ : MAJ3
      port map(A => \CH_MREG_EN_0[0]\, B => 
        \CH_MREG_EN_tmr2_0[0]\, C => \CH_MREG_EN_tmr3_0[0]\, Y
         => \P_CH_MREG_EN_c_c[4]\);
    
    un1_DEL_CNTR_I_91 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\);
    
    \DEL_CNTR_tmr3[13]\ : DFN1P0
      port map(D => \N_DEL_CNTR[13]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[13]\);
    
    un1_DEL_CNTR_I_46 : XOR2
      port map(A => \DEL_CNTR[6]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[6]\);
    
    un1_DEL_CNTR_I_76 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11[0]\);
    
    \DEL_CNTR_tmr2[0]\ : DFN1P0
      port map(D => \N_DEL_CNTR[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[0]\);
    
    \SEQUENCER_STATE_maj_RNI0PDS[8]\ : NOR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH5A6, C => 
        \SEQUENCER_STATE[8]_net_1\, Y => N_290);
    
    \SEQUENCER_STATE[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_0[4]\);
    
    \SEQUENCER_STATE_tmr3[8]\ : DFN1C0
      port map(D => N_315, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \SEQUENCER_STATE_tmr3_0[8]\);
    
    \CH_VOSG_EN_tmr2[1]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNI4G3C3[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr2_0[1]\);
    
    un1_DEL_CNTR_I_69 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\);
    
    un1_DEL_CNTR_I_80 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\);
    
    \RET_STATE_maj_RNIR0J21[5]\ : MIN3X
      port map(A => \RET_STATE[5]_net_1\, B => 
        \RET_STATE[6]_net_1\, C => \RET_STATE[4]_net_1\, Y => 
        N_236);
    
    un1_DEL_CNTR_I_35 : XOR2
      port map(A => \DEL_CNTR[7]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[7]\);
    
    \DEL_CNTR_maj[13]\ : MAJ3
      port map(A => \DEL_CNTR_0[13]\, B => \DEL_CNTR_tmr2_0[13]\, 
        C => \DEL_CNTR_tmr3_0[13]\, Y => \DEL_CNTR[13]_net_1\);
    
    un1_DEL_CNTR_I_47 : XOR2
      port map(A => \DEL_CNTR[5]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[5]\);
    
    \SEQUENCER_STATE_tmr3[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_0[5]\);
    
    un1_DEL_CNTR_I_77 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2[0]\);
    
    un1_DEL_CNTR_I_12 : AND2
      port map(A => \DEL_CNTR[9]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\);
    
    \RET_STATE_maj_RNIG88P4_0[4]\ : NOR3B
      port map(A => N_302, B => N_298, C => \RET_STATE[4]_net_1\, 
        Y => \SEQUENCER_STATE_ns[4]\);
    
    un1_DEL_CNTR_I_86 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1[0]\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \SEQUENCER_STATE_tmr2[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_0[6]\);
    
    \RET_STATE_tmr2[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI709H1[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2_0[5]\);
    
    \SEQUENCER_STATE_maj_RNIUVN51[5]\ : OR2
      port map(A => N_222, B => \SEQUENCER_STATE[5]_net_1\, Y => 
        N_225);
    
    un1_DEL_CNTR_I_23 : XOR2
      port map(A => \DEL_CNTR[5]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\);
    
    \DEL_CNTR_tmr3[0]\ : DFN1P0
      port map(D => \N_DEL_CNTR[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[0]\);
    
    un1_DEL_CNTR_I_87 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\);
    
    \SEQUENCER_STATE_maj_RNIJKUH2[8]\ : OA1A
      port map(A => \SEQUENCER_STATE[8]_net_1\, B => N_246, C => 
        N_309, Y => \SEQUENCER_STATE_maj_RNIJKUH2[8]_net_1\);
    
    \DEL_CNTR[9]\ : DFN1P0
      port map(D => \N_DEL_CNTR[9]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[9]\);
    
    \DEL_CNTR[6]\ : DFN1P0
      port map(D => \N_DEL_CNTR[6]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[6]\);
    
    \SEQUENCER_STATE_maj_RNIKM3O[7]\ : NOR2A
      port map(A => \RET_STATE[5]_net_1\, B => 
        \SEQUENCER_STATE[7]_net_1\, Y => \RET_STATE_0_a3_0[5]\);
    
    \RET_STATE_tmr2[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI6V8H1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2_0[4]\);
    
    \DEL_CNTR[4]\ : DFN1P0
      port map(D => \N_DEL_CNTR[4]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[4]\);
    
    \RET_STATE_maj_RNIL7LM3[9]\ : NOR3B
      port map(A => N_290, B => un8_del_cntr, C => 
        \RET_STATE[9]_net_1\, Y => N_302);
    
    un1_DEL_CNTR_I_25 : XOR2
      port map(A => \DEL_CNTR[12]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_11[0]\);
    
    \SEQUENCER_STATE_maj_RNI1URPO[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_55_1, Y => 
        \N_DEL_CNTR[9]\);
    
    \RET_STATE_maj_RNI854E1[9]\ : OR3A
      port map(A => \RET_STATE[9]_net_1\, B => 
        \RET_STATE[4]_net_1\, C => N_221, Y => N_246);
    
    \DEL_CNTR_tmr2[12]\ : DFN1P0
      port map(D => \N_DEL_CNTR[12]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[12]\);
    
    \SEQUENCER_STATE_maj_RNI2U5J81[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_58_1, Y => 
        \N_DEL_CNTR[14]\);
    
    \RET_STATE_maj_RNI1MCD9[9]\ : NOR3
      port map(A => N_315, B => 
        \SEQUENCER_STATE_maj_RNIJKUH2[8]_net_1\, C => N_266, Y
         => \RET_STATE_maj_RNI1MCD9[9]_net_1\);
    
    \DEL_CNTR_tmr2[1]\ : DFN1P0
      port map(D => \N_DEL_CNTR[1]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[1]\);
    
    \SEQUENCER_STATE_maj[5]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[5]\, B => 
        \SEQUENCER_STATE_tmr2_0[5]\, C => 
        \SEQUENCER_STATE_tmr3_0[5]\, Y => 
        \SEQUENCER_STATE[5]_net_1\);
    
    \RET_STATE_tmr3[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIB49H1[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3_0[9]\);
    
    \DEL_CNTR_tmr2[5]\ : DFN1P0
      port map(D => \N_DEL_CNTR[5]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[5]\);
    
    \CH_MREG_EN_maj_RNI7O3L2[0]\ : MX2
      port map(A => N_CH_MREG_EN_1_sqmuxa, B => 
        \P_CH_MREG_EN_c_c[4]\, S => N_290, Y => 
        \CH_MREG_EN_maj_RNI7O3L2[0]_net_1\);
    
    \DEL_CNTR[1]\ : DFN1P0
      port map(D => \N_DEL_CNTR[1]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[1]\);
    
    \DEL_CNTR_maj[14]\ : MAJ3
      port map(A => \DEL_CNTR_0[14]\, B => \DEL_CNTR_tmr2_0[14]\, 
        C => \DEL_CNTR_tmr3_0[14]\, Y => \DEL_CNTR[14]_net_1\);
    
    un1_DEL_CNTR_I_60 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[13]\, B => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\, Y => I_60_1);
    
    \SEQUENCER_STATE_maj_RNIF55P_0[4]\ : NOR2
      port map(A => \SEQUENCER_STATE[4]_net_1\, B => 
        \SEQUENCER_STATE[3]_net_1\, Y => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\);
    
    un1_DEL_CNTR_I_43 : XOR2
      port map(A => \DEL_CNTR[11]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[11]\);
    
    \RET_STATE_maj_RNI8UHA2[9]\ : NOR3B
      port map(A => N_290, B => N_236, C => \RET_STATE[9]_net_1\, 
        Y => N_266);
    
    un1_DEL_CNTR_I_73 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_12[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\);
    
    \SEQUENCER_STATE_tmr2[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_0[4]\);
    
    \SEQUENCER_STATE_maj_RNIF55P[4]\ : NOR2
      port map(A => \SEQUENCER_STATE[4]_net_1\, B => 
        \SEQUENCER_STATE[3]_net_1\, Y => N_230_0);
    
    \SEQUENCER_STATE_maj_RNILTMQ1[9]\ : NOR3A
      port map(A => N_236, B => \RET_STATE[9]_net_1\, C => 
        \SEQUENCER_STATE[9]_net_1\, Y => N_271);
    
    un1_DEL_CNTR_I_90 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_3[0]\);
    
    \MAIN_SEQUENCER.N_CH_VOSG_EN_7[1]\ : OR2A
      port map(A => \un3_n_ch_vosg_en\, B => CH5_6_MS_CFG_EN_c, Y
         => \N_CH_VOSG_EN_7[1]\);
    
    \DEL_CNTR[7]\ : DFN1P0
      port map(D => \N_DEL_CNTR[7]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[7]\);
    
    \CH_VOSG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIQG1A3[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr2_0[0]\);
    
    CH_ACTIVE_STAT_maj_RNIGSMG6 : AO1
      port map(A => N_304, B => N_302, C => N_275, Y => 
        \SEQUENCER_STATE_ns[5]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \SEQUENCER_STATE_ns_i_a2_6[0]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH5A6, C => 
        STDBY_OFFB_B, Y => N_309);
    
    \RET_STATE_maj[4]\ : MAJ3
      port map(A => \RET_STATE_0[4]\, B => \RET_STATE_tmr2_0[4]\, 
        C => \RET_STATE_tmr3_0[4]\, Y => \RET_STATE[4]_net_1\);
    
    un1_DEL_CNTR_I_14 : AND2
      port map(A => \DEL_CNTR[5]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\);
    
    un1_DEL_CNTR_I_66 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\);
    
    \DEL_CNTR_tmr3[7]\ : DFN1P0
      port map(D => \N_DEL_CNTR[7]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[7]\);
    
    un1_DEL_CNTR_I_52 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[2]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, Y => I_52_1);
    
    un1_DEL_CNTR_I_45 : XOR2
      port map(A => \DEL_CNTR[9]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[9]\);
    
    un1_DEL_CNTR_I_83 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_3[0]\);
    
    un1_DEL_CNTR_I_75 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\);
    
    \CH_IAUX_EN[0]\ : DFN1C0
      port map(D => \CH_IAUX_EN_maj_RNI9T632[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_IAUX_EN_0[0]\);
    
    un1_DEL_CNTR_I_67 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_10[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\);
    
    \DEL_CNTR_tmr3[12]\ : DFN1P0
      port map(D => \N_DEL_CNTR[12]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[12]\);
    
    \DEL_CNTR_maj[0]\ : MAJ3
      port map(A => \DEL_CNTR_0[0]\, B => \DEL_CNTR_tmr2_0[0]\, C
         => \DEL_CNTR_tmr3_0[0]\, Y => \DEL_CNTR[0]_net_1\);
    
    \CH_IAUX_EN_tmr2[0]\ : DFN1C0
      port map(D => \CH_IAUX_EN_maj_RNI9T632[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_IAUX_EN_tmr2_0[0]\);
    
    \DEL_CNTR_maj[7]\ : MAJ3
      port map(A => \DEL_CNTR_0[7]\, B => \DEL_CNTR_tmr2_0[7]\, C
         => \DEL_CNTR_tmr3_0[7]\, Y => \DEL_CNTR[7]_net_1\);
    
    un1_DEL_CNTR_I_85 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_1[0]\);
    
    \SEQUENCER_STATE_maj_RNIVKK631[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_50_1, Y => 
        \N_DEL_CNTR[12]\);
    
    \DEL_CNTR_maj[8]\ : MAJ3
      port map(A => \DEL_CNTR_0[8]\, B => \DEL_CNTR_tmr2_0[8]\, C
         => \DEL_CNTR_tmr3_0[8]\, Y => \DEL_CNTR[8]_net_1\);
    
    \DEL_CNTR_maj[1]\ : MAJ3
      port map(A => \DEL_CNTR_0[1]\, B => \DEL_CNTR_tmr2_0[1]\, C
         => \DEL_CNTR_tmr3_0[1]\, Y => \DEL_CNTR[1]_net_1\);
    
    CH_ACTIVE_STAT_maj_RNI0KEN1_0 : NOR3A
      port map(A => N_309, B => N_230_0, C => 
        CH_ACTIVE_STAT_net_1, Y => N_275);
    
    \SEQUENCER_STATE[8]\ : DFN1C0
      port map(D => N_315, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \SEQUENCER_STATE_0[8]\);
    
    \SEQUENCER_STATE_maj_RNICEEO[3]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH5A6, C => 
        \SEQUENCER_STATE[3]_net_1\, Y => N_CH_VOSG_EN_2_sqmuxa);
    
    un1_DEL_CNTR_I_1 : AND2
      port map(A => \DEL_CNTR[0]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_TMP[0]\);
    
    \CH_VOSG_EN[0]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIQG1A3[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_0[0]\);
    
    \SEQUENCER_STATE_maj_RNITCQCC[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_53_1, Y => 
        \N_DEL_CNTR[4]\);
    
    \DEL_CNTR_maj_RNIACC6[0]\ : NOR2
      port map(A => \DEL_CNTR[2]_net_1\, B => \DEL_CNTR[0]_net_1\, 
        Y => un8_del_cntr_1);
    
    \DEL_CNTR_tmr3[3]\ : DFN1P0
      port map(D => \N_DEL_CNTR[3]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[3]\);
    
    \RET_STATE_maj_RNIJ12N_1[5]\ : NOR2A
      port map(A => \RET_STATE[5]_net_1\, B => 
        \RET_STATE[6]_net_1\, Y => N_298);
    
    \SEQUENCER_STATE_maj_RNI70KH1[6]\ : NOR2A
      port map(A => N_312, B => N_222, Y => N_CH_MREG_EN_1_sqmuxa);
    
    \DEL_CNTR_tmr2[10]\ : DFN1P0
      port map(D => \N_DEL_CNTR[10]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[10]\);
    
    \SEQUENCER_STATE_maj_RNICBH5E[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_62_1, Y => 
        \N_DEL_CNTR[5]\);
    
    \SEQUENCER_STATE[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_0[5]\);
    
    \DEL_CNTR_tmr3[6]\ : DFN1P0
      port map(D => \N_DEL_CNTR[6]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[6]\);
    
    \SEQUENCER_STATE[3]\ : DFN1C0
      port map(D => \CH_ACTIVE_STAT_maj_RNI0KEN1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_0[3]\);
    
    un1_DEL_CNTR_I_54 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[10]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, Y => I_54_1);
    
    \SEQUENCER_STATE_ns_i_0[2]\ : OR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH5A6, C => 
        STDBY_OFFB_B, Y => \SEQUENCER_STATE_ns_i_0[2]_net_1\);
    
    \RET_STATE_maj_RNIJ12N_0[5]\ : NOR2A
      port map(A => \RET_STATE[6]_net_1\, B => 
        \RET_STATE[5]_net_1\, Y => N_299);
    
    un1_DEL_CNTR_I_63 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_8[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\);
    
    \CH_IAUX_EN_maj_RNI9T632[0]\ : MX2
      port map(A => N_CH_IAUX_EN_1_sqmuxa, B => 
        \P_CH_IAUX_EN_c_c[4]\, S => N_290, Y => 
        \CH_IAUX_EN_maj_RNI9T632[0]_net_1\);
    
    un1_DEL_CNTR_I_22 : XOR2
      port map(A => \DEL_CNTR[9]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\);
    
    \SEQUENCER_STATE_maj[3]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[3]\, B => 
        \SEQUENCER_STATE_tmr2_0[3]\, C => 
        \SEQUENCER_STATE_tmr3_0[3]\, Y => 
        \SEQUENCER_STATE[3]_net_1\);
    
    \RET_STATE_tmr3[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI709H1[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3_0[5]\);
    
    \DEL_CNTR[13]\ : DFN1P0
      port map(D => \N_DEL_CNTR[13]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[13]\);
    
    un1_DEL_CNTR_I_18 : AND2
      port map(A => \DEL_CNTR[1]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\);
    
    \DEL_CNTR_maj[6]\ : MAJ3
      port map(A => \DEL_CNTR_0[6]\, B => \DEL_CNTR_tmr2_0[6]\, C
         => \DEL_CNTR_tmr3_0[6]\, Y => \DEL_CNTR[6]_net_1\);
    
    \DEL_CNTR_maj[3]\ : MAJ3
      port map(A => \DEL_CNTR_0[3]\, B => \DEL_CNTR_tmr2_0[3]\, C
         => \DEL_CNTR_tmr3_0[3]\, Y => \DEL_CNTR[3]_net_1\);
    
    \SEQUENCER_STATE_maj_RNI6V8H1[5]\ : OA1B
      port map(A => \RET_STATE[4]_net_1\, B => 
        \SEQUENCER_STATE[5]_net_1\, C => N_222, Y => 
        \SEQUENCER_STATE_maj_RNI6V8H1[5]_net_1\);
    
    CH_ACTIVE_STAT_maj : MAJ3
      port map(A => CH_ACTIVE_STAT_0, B => \CH_ACTIVE_STAT_tmr2\, 
        C => \CH_ACTIVE_STAT_tmr3\, Y => CH_ACTIVE_STAT_net_1);
    
    \DEL_CNTR[0]\ : DFN1P0
      port map(D => \N_DEL_CNTR[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[0]\);
    
    un1_DEL_CNTR_I_65 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\);
    
    CH_ACTIVE_STAT_tmr3 : DFN1C0
      port map(D => REGISTER_CH_CMD_CH_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_ACTIVE_STAT_tmr3\);
    
    \RET_STATE[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI709H1[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_0[5]\);
    
    \DEL_CNTR[5]\ : DFN1P0
      port map(D => \N_DEL_CNTR[5]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[5]\);
    
    un1_DEL_CNTR_I_34 : XOR2
      port map(A => \DEL_CNTR[4]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[4]\);
    
    \SEQUENCER_STATE_maj[6]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[6]\, B => 
        \SEQUENCER_STATE_tmr2_0[6]\, C => 
        \SEQUENCER_STATE_tmr3_0[6]\, Y => 
        \SEQUENCER_STATE[6]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIADHK7[9]\ : NOR3
      port map(A => N_271, B => \SEQUENCER_STATE_ns_i_1[2]\, C
         => N_313, Y => \SEQUENCER_STATE_maj_RNIADHK7[9]_net_1\);
    
    \DEL_CNTR_tmr3[10]\ : DFN1P0
      port map(D => \N_DEL_CNTR[10]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[10]\);
    
    un1_DEL_CNTR_I_11 : AND2
      port map(A => \DEL_CNTR[6]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\);
    
    \SEQUENCER_STATE_tmr2[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNI1MCD9[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_0[9]\);
    
    un1_DEL_CNTR_I_42 : XOR2
      port map(A => \DEL_CNTR[0]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[0]\);
    
    un1_DEL_CNTR_I_72 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_6[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\);
    
    un1_DEL_CNTR_I_5 : AND2
      port map(A => \DEL_CNTR[7]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\);
    
    \SEQUENCER_STATE_maj_RNI6GA66[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_56_1, Y => 
        \N_DEL_CNTR[1]\);
    
    \DEL_CNTR_maj_RNIFG7V[9]\ : NOR3A
      port map(A => un8_del_cntr_6, B => \DEL_CNTR[9]_net_1\, C
         => \DEL_CNTR[10]_net_1\, Y => un8_del_cntr_10);
    
    \SEQUENCER_STATE_tmr3[7]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIADHK7[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_0[7]\);
    
    un1_DEL_CNTR_I_19 : XOR2
      port map(A => \DEL_CNTR[7]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\);
    
    \SEQUENCER_STATE_maj[9]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[9]\, B => 
        \SEQUENCER_STATE_tmr2_0[9]\, C => 
        \SEQUENCER_STATE_tmr3_0[9]\, Y => 
        \SEQUENCER_STATE[9]_net_1\);
    
    \SEQUENCER_STATE_tmr2[7]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIADHK7[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_0[7]\);
    
    un1_DEL_CNTR_I_82 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\);
    
    un1_DEL_CNTR_I_24 : XOR2
      port map(A => \DEL_CNTR[2]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_1[0]\);
    
    \SEQUENCER_STATE_maj_RNIF81V7[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_52_1, Y => 
        \N_DEL_CNTR[2]\);
    
    \SEQUENCER_STATE[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNI1MCD9[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_0[9]\);
    
    \CH_VOSG_EN_tmr3[1]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNI4G3C3[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr3_0[1]\);
    
    un1_DEL_CNTR_I_58 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[14]\, B => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\, Y => I_58_1);
    
    \SEQUENCER_STATE_tmr2[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_0[5]\);
    
    \SEQUENCER_STATE_maj_RNIKLUH2[9]\ : AO1D
      port map(A => N_246, B => \SEQUENCER_STATE[9]_net_1\, C => 
        \SEQUENCER_STATE_ns_i_0[2]_net_1\, Y => 
        \SEQUENCER_STATE_ns_i_1[2]\);
    
    \DEL_CNTR_maj_RNI8AME2[5]\ : NOR3C
      port map(A => un8_del_cntr_10, B => un8_del_cntr_9, C => 
        un8_del_cntr_11, Y => un8_del_cntr);
    
    \DEL_CNTR_maj[11]\ : MAJ3
      port map(A => \DEL_CNTR_0[11]\, B => \DEL_CNTR_tmr2_0[11]\, 
        C => \DEL_CNTR_tmr3_0[11]\, Y => \DEL_CNTR[11]_net_1\);
    
    \RET_STATE_tmr2[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI819H1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2_0[6]\);
    
    \DEL_CNTR[14]\ : DFN1P0
      port map(D => \N_DEL_CNTR[14]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[14]\);
    
    \DEL_CNTR_tmr2[7]\ : DFN1P0
      port map(D => \N_DEL_CNTR[7]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[7]\);
    
    \DEL_CNTR_tmr2[11]\ : DFN1P0
      port map(D => \N_DEL_CNTR[11]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[11]\);
    
    \RET_STATE_maj[9]\ : MAJ3
      port map(A => \RET_STATE_0[9]\, B => \RET_STATE_tmr2_0[9]\, 
        C => \RET_STATE_tmr3_0[9]\, Y => \RET_STATE[9]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIFBI02[3]\ : MX2
      port map(A => N_312, B => \N_CH_VOSG_EN_7[1]\, S => 
        N_CH_VOSG_EN_2_sqmuxa, Y => \N_CH_VOSG_EN[1]\);
    
    \SEQUENCER_STATE_maj_RNITA151[7]\ : NOR2A
      port map(A => N_312, B => \SEQUENCER_STATE[7]_net_1\, Y => 
        N_CH_IAUX_EN_1_sqmuxa);
    
    \DEL_CNTR_tmr2[9]\ : DFN1P0
      port map(D => \N_DEL_CNTR[9]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_0[9]\);
    
    \CH_ACTIVE_STAT\ : DFN1C0
      port map(D => REGISTER_CH_CMD_CH_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        CH_ACTIVE_STAT_0);
    
    \DEL_CNTR_maj_RNIFHC6[3]\ : NOR2
      port map(A => \DEL_CNTR[3]_net_1\, B => \DEL_CNTR[4]_net_1\, 
        Y => un8_del_cntr_2);
    
    \CH_VOSG_EN_maj_RNI4G3C3[1]\ : MX2
      port map(A => \N_CH_VOSG_EN[1]\, B => \P_CH_VOSG_EN_c[5]\, 
        S => N_290, Y => \CH_VOSG_EN_maj_RNI4G3C3[1]_net_1\);
    
    un1_DEL_CNTR_I_44 : XOR2
      port map(A => \DEL_CNTR[10]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[10]\);
    
    un1_DEL_CNTR_I_74 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\);
    
    \DEL_CNTR_tmr3[2]\ : DFN1P0
      port map(D => \N_DEL_CNTR[2]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[2]\);
    
    \DEL_CNTR_maj_RNIFAL21[0]\ : NOR3C
      port map(A => un8_del_cntr_2, B => un8_del_cntr_1, C => 
        un8_del_cntr_7, Y => un8_del_cntr_11);
    
    un1_DEL_CNTR_I_38 : XOR2
      port map(A => \DEL_CNTR[2]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[2]\);
    
    un1_DEL_CNTR_I_51 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[3]\, B => 
        \DWACT_ADD_CI_0_g_array_12[0]\, Y => I_51_1);
    
    \DEL_CNTR_maj[5]\ : MAJ3
      port map(A => \DEL_CNTR_0[5]\, B => \DEL_CNTR_tmr2_0[5]\, C
         => \DEL_CNTR_tmr3_0[5]\, Y => \DEL_CNTR[5]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIIKEO[9]\ : NOR3B
      port map(A => STATUS_LED_c, B => UVL_OK_CH5A6, C => 
        \SEQUENCER_STATE[9]_net_1\, Y => N_312);
    
    CH_ACTIVE_STAT_tmr2 : DFN1C0
      port map(D => REGISTER_CH_CMD_CH_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_ACTIVE_STAT_tmr2\);
    
    un1_DEL_CNTR_I_10 : AND2
      port map(A => \DEL_CNTR[4]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\);
    
    \SEQUENCER_STATE_maj[4]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[4]\, B => 
        \SEQUENCER_STATE_tmr2_0[4]\, C => 
        \SEQUENCER_STATE_tmr3_0[4]\, Y => 
        \SEQUENCER_STATE[4]_net_1\);
    
    \CH_IAUX_EN_tmr3[0]\ : DFN1C0
      port map(D => \CH_IAUX_EN_maj_RNI9T632[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_IAUX_EN_tmr3_0[0]\);
    
    \DEL_CNTR_maj[9]\ : MAJ3
      port map(A => \DEL_CNTR_0[9]\, B => \DEL_CNTR_tmr2_0[9]\, C
         => \DEL_CNTR_tmr3_0[9]\, Y => \DEL_CNTR[9]_net_1\);
    
    un1_DEL_CNTR_I_62 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[5]\, B => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, Y => I_62_1);
    
    \SEQUENCER_STATE_tmr2[3]\ : DFN1C0
      port map(D => \CH_ACTIVE_STAT_maj_RNI0KEN1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_0[3]\);
    
    un1_DEL_CNTR_I_59 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[7]\, B => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\, Y => I_59_1);
    
    un1_DEL_CNTR_I_92 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_5[0]\);
    
    un1_DEL_CNTR_I_16 : AND2
      port map(A => \DEL_CNTR[11]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\);
    
    \SEQUENCER_STATE_maj_RNIAN41N[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_57_1, Y => 
        \N_DEL_CNTR[8]\);
    
    \DEL_CNTR[11]\ : DFN1P0
      port map(D => \N_DEL_CNTR[11]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[11]\);
    
    \DEL_CNTR[12]\ : DFN1P0
      port map(D => \N_DEL_CNTR[12]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[12]\);
    
    un1_DEL_CNTR_I_31 : XOR2
      port map(A => \DEL_CNTR[3]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\);
    
    \CH_IAUX_EN_maj[0]\ : MAJ3
      port map(A => \CH_IAUX_EN_0[0]\, B => 
        \CH_IAUX_EN_tmr2_0[0]\, C => \CH_IAUX_EN_tmr3_0[0]\, Y
         => \P_CH_IAUX_EN_c_c[4]\);
    
    un1_DEL_CNTR_I_28 : XOR2
      port map(A => \DEL_CNTR[8]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_7[0]\);
    
    \RET_STATE_tmr2[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIB49H1[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2_0[9]\);
    
    \DEL_CNTR_tmr3[11]\ : DFN1P0
      port map(D => \N_DEL_CNTR[11]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[11]\);
    
    \RET_STATE[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI819H1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_0[6]\);
    
    un1_DEL_CNTR_I_17 : AND2
      port map(A => \DEL_CNTR[13]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\);
    
    \SEQUENCER_STATE_maj[7]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[7]\, B => 
        \SEQUENCER_STATE_tmr2_0[7]\, C => 
        \SEQUENCER_STATE_tmr3_0[7]\, Y => 
        \SEQUENCER_STATE[7]_net_1\);
    
    \SEQUENCER_STATE_maj_RNII4V95[8]\ : OR3A
      port map(A => N_313, B => N_225, C => 
        \DWACT_ADD_CI_0_partial_sum[0]\, Y => \N_DEL_CNTR[0]\);
    
    un1_DEL_CNTR_I_7 : AND2
      port map(A => \DEL_CNTR[2]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\);
    
    \SEQUENCER_STATE_maj_RNI819H1[5]\ : AO1A
      port map(A => \SEQUENCER_STATE[5]_net_1\, B => 
        \RET_STATE_0_a3_0[6]\, C => \SEQUENCER_STATE[7]_net_1\, Y
         => \SEQUENCER_STATE_maj_RNI819H1[5]_net_1\);
    
    un1_DEL_CNTR_I_39 : XOR2
      port map(A => \DEL_CNTR[13]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[13]\);
    
    \SEQUENCER_STATE[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_0[6]\);
    
    \DEL_CNTR_tmr3[8]\ : DFN1P0
      port map(D => \N_DEL_CNTR[8]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[8]\);
    
    CH_ACTIVE_STAT_maj_RNI0KEN1 : NOR3B
      port map(A => CH_ACTIVE_STAT_net_1, B => N_309, C => 
        N_230_0, Y => \CH_ACTIVE_STAT_maj_RNI0KEN1\);
    
    \SEQUENCER_STATE_maj_RNII1114[8]\ : OA1C
      port map(A => \SEQUENCER_STATE[8]_net_1\, B => un8_del_cntr, 
        C => N_225, Y => N_285);
    
    \DEL_CNTR_maj[12]\ : MAJ3
      port map(A => \DEL_CNTR_0[12]\, B => \DEL_CNTR_tmr2_0[12]\, 
        C => \DEL_CNTR_tmr3_0[12]\, Y => \DEL_CNTR[12]_net_1\);
    
    \RET_STATE_maj_RNIB49H1[9]\ : NOR2A
      port map(A => \RET_STATE[9]_net_1\, B => N_225, Y => 
        \RET_STATE_maj_RNIB49H1[9]_net_1\);
    
    \SEQUENCER_STATE_maj_RNI6DGU1[3]\ : MX2B
      port map(A => N_312, B => \un3_n_ch_vosg_en\, S => 
        N_CH_VOSG_EN_2_sqmuxa, Y => \N_CH_VOSG_EN[0]\);
    
    \RET_STATE_maj_RNIG88P4[4]\ : NOR3B
      port map(A => N_302, B => N_299, C => \RET_STATE[4]_net_1\, 
        Y => \SEQUENCER_STATE_ns[3]\);
    
    un1_DEL_CNTR_I_8 : AND2
      port map(A => \DEL_CNTR[8]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\);
    
    un1_DEL_CNTR_I_21 : XOR2
      port map(A => \DEL_CNTR[13]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\);
    
    \SEQUENCER_STATE_tmr3[3]\ : DFN1C0
      port map(D => \CH_ACTIVE_STAT_maj_RNI0KEN1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_0[3]\);
    
    \DEL_CNTR_tmr3[4]\ : DFN1P0
      port map(D => \N_DEL_CNTR[4]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[4]\);
    
    \SEQUENCER_STATE_maj_RNIC4LB51[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_60_1, Y => 
        \N_DEL_CNTR[13]\);
    
    \CH_VOSG_EN[1]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNI4G3C3[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_0[1]\);
    
    un1_DEL_CNTR_I_48 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[11]\, B => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\, Y => I_48_1);
    
    un1_DEL_CNTR_I_78 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\);
    
    un1_DEL_CNTR_I_64 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0[0]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1[0]\);
    
    \SEQUENCER_STATE_maj_RNI6M3QT[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_48_1, Y => 
        \N_DEL_CNTR[11]\);
    
    \DEL_CNTR_maj_RNIAFPC[5]\ : NOR3A
      port map(A => un8_del_cntr_4, B => \DEL_CNTR[6]_net_1\, C
         => \DEL_CNTR[5]_net_1\, Y => un8_del_cntr_9);
    
    un1_DEL_CNTR_I_50 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[12]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, Y => I_50_1);
    
    \MAIN_SEQUENCER.un3_n_ch_vosg_en\ : NOR2B
      port map(A => REGISTER_CH_CMD_CH_0, B => DTYCYC_EN, Y => 
        \un3_n_ch_vosg_en\);
    
    un1_DEL_CNTR_I_29 : XOR2
      port map(A => \DEL_CNTR[4]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_3[0]\);
    
    \DEL_CNTR_tmr3[1]\ : DFN1P0
      port map(D => \N_DEL_CNTR[1]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_0[1]\);
    
    \CH_VOSG_EN_maj[0]\ : MAJ3
      port map(A => \CH_VOSG_EN_0[0]\, B => 
        \CH_VOSG_EN_tmr2_0[0]\, C => \CH_VOSG_EN_tmr3_0[0]\, Y
         => \P_CH_VOSG_EN_c[4]\);
    
    \SEQUENCER_STATE[7]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIADHK7[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_0[7]\);
    
    \RET_STATE_tmr3[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI6V8H1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3_0[4]\);
    
    \SEQUENCER_STATE_maj_RNI709H1[6]\ : AO1A
      port map(A => \SEQUENCER_STATE[5]_net_1\, B => 
        \RET_STATE_0_a3_0[5]\, C => \SEQUENCER_STATE[6]_net_1\, Y
         => \SEQUENCER_STATE_maj_RNI709H1[6]_net_1\);
    
    \DEL_CNTR_maj_RNINPC6[7]\ : NOR2
      port map(A => \DEL_CNTR[8]_net_1\, B => \DEL_CNTR[7]_net_1\, 
        Y => un8_del_cntr_4);
    
    un1_DEL_CNTR_I_56 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[1]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, Y => I_56_1);
    
    un1_DEL_CNTR_I_13 : AND2
      port map(A => \DEL_CNTR[12]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\);
    
    \SEQUENCER_STATE_tmr3[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_0[6]\);
    
    un1_DEL_CNTR_I_88 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2[0]\);
    
    \DEL_CNTR[8]\ : DFN1P0
      port map(D => \N_DEL_CNTR[8]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[8]\);
    
    \DEL_CNTR[2]\ : DFN1P0
      port map(D => \N_DEL_CNTR[2]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[2]\);
    
    \RET_STATE[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIB49H1[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_0[9]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity IIR_FILT_4_0 is

    port( FPGA_FUSE_1_2_OK_c_0 : in    std_logic;
          POR_OUT_TO_SCA_c     : in    std_logic;
          BUF5M_J11_15_TCONN_c : in    std_logic;
          UVL_OK_CH7A8         : in    std_logic;
          UVL_OK_CH5A6         : in    std_logic;
          PWR_OK_LED_c         : out   std_logic;
          UVL_OK_CH3A4         : in    std_logic;
          UVL_OK_CH1A2         : out   std_logic
        );

end IIR_FILT_4_0;

architecture DEF_ARCH of IIR_FILT_4_0 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component MAJ3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component OAI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO13
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3C
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

  component XOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3
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

  component AOI1B
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

  component XA1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_23_i, \FILT_OUT[6]_net_1\, \FILT_OUT[7]_net_1\, 
        i10_mux, i2_mux, \FILT_OUT[2]_net_1\, \FILT_OUT[0]_net_1\, 
        \FILT_OUT[1]_net_1\, i4_mux, \FILT_OUT[3]_net_1\, i6_mux, 
        \FILT_OUT[4]_net_1\, i8_mux, \FILT_OUT[5]_net_1\, 
        \FILT_OUT_maj_RNIL8E4D[7]_net_1\, i12_mux, N89, 
        \FILT_OUT_maj_RNIL8E4D_0[7]_net_1\, \SUM_IN_A[5]_net_1\, 
        N92, n_sigout15lto7_2, n_sigout15lto7_1, n_sigout3lto6_1, 
        n_sigout3lto6_0, PWR_OK_LED_0, \UVL_OK_CH1A2\, N_33_i, 
        N_31_i, N_29_i, N_27_i, N_40, \SUM_IN_A[4]_net_1\, 
        \un2_n_filt_out0[28]\, n_sigout3, \SIGOUT_maj_RNIRH6C6\, 
        N_93, N_95, \THRESH_VAL[1]_net_1\, \THRESH_VAL[0]_net_1\, 
        N_113, \THRESH_VAL_ns[0]\, 
        \THRESH_VAL_maj_RNISF474[1]_net_1\, ADD_4x4_fast_I6_Y_0, 
        \SIG_IN_DEL_maj_RNICLUI[0]_net_1\, \SIG_IN_DEL[0]_net_1\, 
        \SIG_IN_DEL_maj_RNICLUI_0[0]_net_1\, \FILT_OUT_2[7]\, 
        \FILT_OUT_tmr2_2[7]\, \FILT_OUT_tmr3_2[7]\, 
        \FILT_OUT_2[6]\, \FILT_OUT_tmr2_2[6]\, 
        \FILT_OUT_tmr3_2[6]\, \FILT_OUT_2[5]\, 
        \FILT_OUT_tmr2_2[5]\, \FILT_OUT_tmr3_2[5]\, 
        \FILT_OUT_2[4]\, \FILT_OUT_tmr2_2[4]\, 
        \FILT_OUT_tmr3_2[4]\, \FILT_OUT_2[3]\, 
        \FILT_OUT_tmr2_2[3]\, \FILT_OUT_tmr3_2[3]\, 
        \FILT_OUT_2[2]\, \FILT_OUT_tmr2_2[2]\, 
        \FILT_OUT_tmr3_2[2]\, \FILT_OUT_2[1]\, 
        \FILT_OUT_tmr2_2[1]\, \FILT_OUT_tmr3_2[1]\, 
        \FILT_OUT_2[0]\, \FILT_OUT_tmr2_2[0]\, 
        \FILT_OUT_tmr3_2[0]\, \SUM_IN_A_2[5]\, 
        \SUM_IN_A_tmr2_2[5]\, \SUM_IN_A_tmr3_2[5]\, 
        \SUM_IN_A_2[4]\, \SUM_IN_A_tmr2_2[4]\, 
        \SUM_IN_A_tmr3_2[4]\, \THRESH_VAL_2[1]\, 
        \THRESH_VAL_tmr2_2[1]\, \THRESH_VAL_tmr3_2[1]\, 
        \THRESH_VAL_2[0]\, \THRESH_VAL_tmr2_2[0]\, 
        \THRESH_VAL_tmr3_2[0]\, SIGOUT_2, SIGOUT_tmr2_2, 
        SIGOUT_tmr3_2, \SIG_IN_DEL_2[0]\, \SIG_IN_DEL_tmr2_2[0]\, 
        \SIG_IN_DEL_tmr3_2[0]\, \GND\, \VCC\ : std_logic;

begin 

    UVL_OK_CH1A2 <= \UVL_OK_CH1A2\;

    \FILT_OUT[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_2[4]\);
    
    \FILT_OUT_maj_RNI7F8L[3]\ : NOR2B
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[6]_net_1\, 
        Y => n_sigout3lto6_0);
    
    SIGOUT_tmr2 : DFN1C0
      port map(D => \SIGOUT_maj_RNIRH6C6\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        SIGOUT_tmr2_2);
    
    SIGOUT_maj_RNIRH6C6 : MX2
      port map(A => n_sigout3, B => \UVL_OK_CH1A2\, S => N_93, Y
         => \SIGOUT_maj_RNIRH6C6\);
    
    \THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNISF474[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr2_2[1]\);
    
    \SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNICLUI_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr2_2[5]\);
    
    \FILT_OUT[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNIL8E4D[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_2[6]\);
    
    \THRESH_VAL[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_2[0]\);
    
    SIGOUT_tmr3 : DFN1C0
      port map(D => \SIGOUT_maj_RNIRH6C6\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        SIGOUT_tmr3_2);
    
    \SIG_IN_DEL_maj_RNICLUI_0[0]\ : NOR2B
      port map(A => \SIG_IN_DEL[0]_net_1\, B => 
        FPGA_FUSE_1_2_OK_c_0, Y => 
        \SIG_IN_DEL_maj_RNICLUI_0[0]_net_1\);
    
    \FILT_OUT_maj_RNI7F8L_0[4]\ : NOR2
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout15lto7_1);
    
    un1_tmp_sum_in_b_0_m22 : XNOR3
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => i10_mux, Y => N_23_i);
    
    \THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr3_2[0]\);
    
    \FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNIL8E4D_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_2[7]\);
    
    \FILT_OUT_maj[3]\ : MAJ3
      port map(A => \FILT_OUT_2[3]\, B => \FILT_OUT_tmr2_2[3]\, C
         => \FILT_OUT_tmr3_2[3]\, Y => \FILT_OUT[3]_net_1\);
    
    \FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_2[3]\);
    
    un2_n_filt_out_0_PWR_OK_LED : OR3
      port map(A => UVL_OK_CH5A6, B => UVL_OK_CH7A8, C => 
        PWR_OK_LED_0, Y => PWR_OK_LED_c);
    
    \FILT_OUT_maj[6]\ : MAJ3
      port map(A => \FILT_OUT_2[6]\, B => \FILT_OUT_tmr2_2[6]\, C
         => \FILT_OUT_tmr3_2[6]\, Y => \FILT_OUT[6]_net_1\);
    
    un2_n_filt_out_0_PWR_OK_LED_0 : OR2
      port map(A => \UVL_OK_CH1A2\, B => UVL_OK_CH3A4, Y => 
        PWR_OK_LED_0);
    
    \SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \SUM_IN_A_2[4]\, B => \SUM_IN_A_tmr2_2[4]\, C
         => \SUM_IN_A_tmr3_2[4]\, Y => \SUM_IN_A[4]_net_1\);
    
    \SIG_IN_DEL_maj_RNICLUI[0]\ : XOR2
      port map(A => FPGA_FUSE_1_2_OK_c_0, B => 
        \SIG_IN_DEL[0]_net_1\, Y => 
        \SIG_IN_DEL_maj_RNICLUI[0]_net_1\);
    
    \FILT_OUT[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_2[1]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \FILT_OUT_maj_RNIK85L1[7]\ : AO1
      port map(A => n_sigout3lto6_1, B => n_sigout3lto6_0, C => 
        \FILT_OUT[7]_net_1\, Y => n_sigout3);
    
    \FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_2[5]\);
    
    \SUM_IN_A[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNICLUI_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_2[5]\);
    
    \FILT_OUT[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_2[2]\);
    
    \SIG_IN_DEL_tmr3[0]\ : DFN1C0
      port map(D => FPGA_FUSE_1_2_OK_c_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIG_IN_DEL_tmr3_2[0]\);
    
    \FILT_OUT[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNIL8E4D_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_2[7]\);
    
    \FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_2[2]\);
    
    \FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_2[4]\);
    
    un1_tmp_sum_in_b_0_m13 : AO18
      port map(A => \FILT_OUT[4]_net_1\, B => i6_mux, C => 
        \FILT_OUT[5]_net_1\, Y => i8_mux);
    
    \FILT_OUT[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_2[0]\);
    
    SIGOUT_maj : MAJ3
      port map(A => SIGOUT_2, B => SIGOUT_tmr2_2, C => 
        SIGOUT_tmr3_2, Y => \UVL_OK_CH1A2\);
    
    un1_tmp_sum_in_b_0_m4 : OAI1
      port map(A => \FILT_OUT[2]_net_1\, B => \FILT_OUT[0]_net_1\, 
        C => \FILT_OUT[1]_net_1\, Y => i2_mux);
    
    \FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_2[1]\);
    
    \FILT_OUT_maj_RNIL8E4D[7]\ : XNOR3
      port map(A => \FILT_OUT[7]_net_1\, B => i12_mux, C => N89, 
        Y => \FILT_OUT_maj_RNIL8E4D[7]_net_1\);
    
    \FILT_OUT_maj_RNIL8E4D_0[7]\ : AO13
      port map(A => N89, B => \FILT_OUT[7]_net_1\, C => i12_mux, 
        Y => \FILT_OUT_maj_RNIL8E4D_0[7]_net_1\);
    
    \THRESH_VAL_maj_RNIU7I32[1]\ : NOR3C
      port map(A => n_sigout15lto7_1, B => n_sigout15lto7_2, C
         => \THRESH_VAL[1]_net_1\, Y => N_113);
    
    \THRESH_VAL_maj_RNIRE474_0[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_95, Y => N_93);
    
    un2_n_filt_out_0_ADD_4x4_fast_I6_Y : XOR3
      port map(A => N_23_i, B => \SUM_IN_A[5]_net_1\, C => N92, Y
         => ADD_4x4_fast_I6_Y_0);
    
    \FILT_OUT[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_2[3]\);
    
    \THRESH_VAL[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNISF474[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_2[1]\);
    
    \SIG_IN_DEL_tmr2[0]\ : DFN1C0
      port map(D => FPGA_FUSE_1_2_OK_c_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIG_IN_DEL_tmr2_2[0]\);
    
    \FILT_OUT_maj_RNIDPSV[3]\ : NOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => \FILT_OUT[6]_net_1\, Y => n_sigout15lto7_2);
    
    un1_tmp_sum_in_b_0_m16 : AO18
      port map(A => \FILT_OUT[5]_net_1\, B => i8_mux, C => 
        \FILT_OUT[6]_net_1\, Y => i10_mux);
    
    \FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNIL8E4D[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_2[6]\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_tmp_sum_in_b_0_m26 : XNOR3
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        C => i6_mux, Y => N_27_i);
    
    un1_tmp_sum_in_b_0_m19 : AO18
      port map(A => \FILT_OUT[6]_net_1\, B => i10_mux, C => 
        \FILT_OUT[7]_net_1\, Y => i12_mux);
    
    \THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNISF474[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr3_2[1]\);
    
    un1_tmp_sum_in_b_0_m30 : XNOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[2]_net_1\, 
        C => i2_mux, Y => N_31_i);
    
    \SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNICLUI[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr2_2[4]\);
    
    \FILT_OUT_maj[7]\ : MAJ3
      port map(A => \FILT_OUT_2[7]\, B => \FILT_OUT_tmr2_2[7]\, C
         => \FILT_OUT_tmr3_2[7]\, Y => \FILT_OUT[7]_net_1\);
    
    un1_tmp_sum_in_b_0_m15 : XOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => N_40);
    
    \FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNIL8E4D[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_2[6]\);
    
    \SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNICLUI[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr3_2[4]\);
    
    un1_tmp_sum_in_b_0_m7 : AO18
      port map(A => \FILT_OUT[2]_net_1\, B => i2_mux, C => 
        \FILT_OUT[3]_net_1\, Y => i4_mux);
    
    un2_n_filt_out_1_ADD_4x4_fast_I4_Y_0 : MAJ3
      port map(A => N_23_i, B => \SUM_IN_A[5]_net_1\, C => N92, Y
         => N89);
    
    \THRESH_VAL_maj_RNIRE474[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_113, Y => \THRESH_VAL_ns[0]\);
    
    un1_tmp_sum_in_b_0_m28 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[3]_net_1\, 
        C => i4_mux, Y => N_29_i);
    
    \SIG_IN_DEL_maj[0]\ : MAJ3
      port map(A => \SIG_IN_DEL_2[0]\, B => 
        \SIG_IN_DEL_tmr2_2[0]\, C => \SIG_IN_DEL_tmr3_2[0]\, Y
         => \SIG_IN_DEL[0]_net_1\);
    
    SIGOUT : DFN1C0
      port map(D => \SIGOUT_maj_RNIRH6C6\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        SIGOUT_2);
    
    \FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNIL8E4D_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_2[7]\);
    
    \FILT_OUT_maj[5]\ : MAJ3
      port map(A => \FILT_OUT_2[5]\, B => \FILT_OUT_tmr2_2[5]\, C
         => \FILT_OUT_tmr3_2[5]\, Y => \FILT_OUT[5]_net_1\);
    
    \FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_2[3]\);
    
    \THRESH_VAL_maj_RNIU7I32_0[1]\ : AOI1B
      port map(A => n_sigout15lto7_2, B => n_sigout15lto7_1, C
         => \THRESH_VAL[1]_net_1\, Y => N_95);
    
    un2_n_filt_out_0_ADD_4x4_fast_I0_S : XNOR3
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => \un2_n_filt_out0[28]\);
    
    \THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \THRESH_VAL_2[1]\, B => 
        \THRESH_VAL_tmr2_2[1]\, C => \THRESH_VAL_tmr3_2[1]\, Y
         => \THRESH_VAL[1]_net_1\);
    
    \FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_2[2]\);
    
    \FILT_OUT_maj[1]\ : MAJ3
      port map(A => \FILT_OUT_2[1]\, B => \FILT_OUT_tmr2_2[1]\, C
         => \FILT_OUT_tmr3_2[1]\, Y => \FILT_OUT[1]_net_1\);
    
    \FILT_OUT_maj[0]\ : MAJ3
      port map(A => \FILT_OUT_2[0]\, B => \FILT_OUT_tmr2_2[0]\, C
         => \FILT_OUT_tmr3_2[0]\, Y => \FILT_OUT[0]_net_1\);
    
    un1_tmp_sum_in_b_0_m32 : AX1
      port map(A => \FILT_OUT[0]_net_1\, B => \FILT_OUT[1]_net_1\, 
        C => \FILT_OUT[2]_net_1\, Y => N_33_i);
    
    \SUM_IN_A_maj[5]\ : MAJ3
      port map(A => \SUM_IN_A_2[5]\, B => \SUM_IN_A_tmr2_2[5]\, C
         => \SUM_IN_A_tmr3_2[5]\, Y => \SUM_IN_A[5]_net_1\);
    
    \SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNICLUI_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr3_2[5]\);
    
    \THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr2_2[0]\);
    
    \THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \THRESH_VAL_2[0]\, B => 
        \THRESH_VAL_tmr2_2[0]\, C => \THRESH_VAL_tmr3_2[0]\, Y
         => \THRESH_VAL[0]_net_1\);
    
    \FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_2[1]\);
    
    un2_n_filt_out_0_ADD_4x4_fast_I0_CO1 : XA1A
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => N92);
    
    \FILT_OUT[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_2[5]\);
    
    un1_tmp_sum_in_b_0_m10 : AO18
      port map(A => \FILT_OUT[3]_net_1\, B => i4_mux, C => 
        \FILT_OUT[4]_net_1\, Y => i6_mux);
    
    \FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_2[0]\);
    
    \FILT_OUT_maj[2]\ : MAJ3
      port map(A => \FILT_OUT_2[2]\, B => \FILT_OUT_tmr2_2[2]\, C
         => \FILT_OUT_tmr3_2[2]\, Y => \FILT_OUT[2]_net_1\);
    
    \FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_2[4]\);
    
    \FILT_OUT_maj[4]\ : MAJ3
      port map(A => \FILT_OUT_2[4]\, B => \FILT_OUT_tmr2_2[4]\, C
         => \FILT_OUT_tmr3_2[4]\, Y => \FILT_OUT[4]_net_1\);
    
    \THRESH_VAL_maj_RNISF474[1]\ : OA1B
      port map(A => n_sigout3, B => \THRESH_VAL[1]_net_1\, C => 
        N_113, Y => \THRESH_VAL_maj_RNISF474[1]_net_1\);
    
    \FILT_OUT_maj_RNI7F8L[4]\ : NOR2B
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout3lto6_1);
    
    \SUM_IN_A[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNICLUI[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_2[4]\);
    
    \FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_2[5]\);
    
    \FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_2[0]\);
    
    \SIG_IN_DEL[0]\ : DFN1C0
      port map(D => FPGA_FUSE_1_2_OK_c_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIG_IN_DEL_2[0]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity MAIN_SEQUENCER_NEW_3_0 is

    port( P_CH_IAUX_EN_c_c_0   : out   std_logic;
          P_CH_MREG_EN_c_c_0   : out   std_logic;
          P_CH_VOSG_EN_c       : out   std_logic_vector(3 downto 2);
          DTYCYC_CNT           : in    std_logic_vector(4 downto 0);
          REGISTER_CH_CMD_CH_0 : in    std_logic;
          N_CH_VOSG_EN_7_1_0   : out   std_logic;
          POR_OUT_TO_SCA_c     : in    std_logic;
          BUF5M_J11_15_TCONN_c : in    std_logic;
          MAN_EN_CH_4TO1_A_14  : out   std_logic;
          MAN_EN_CH_8TO5_A_15  : out   std_logic;
          STDBY_OFFB_c         : in    std_logic;
          STDBY_OFFB_A_16      : out   std_logic;
          MAN_EN_CH_4TO1_B_17  : out   std_logic;
          MAN_EN_CH_8TO5_B_18  : out   std_logic;
          STDBY_OFFB_A         : in    std_logic;
          STDBY_OFFB_B_19      : out   std_logic;
          DTYCYC_EN_20         : out   std_logic;
          DTYCYC_CNT_21        : out   std_logic;
          DTYCYC_CNT_22        : out   std_logic;
          DTYCYC_CNT_23        : out   std_logic;
          DTYCYC_CNT_24        : out   std_logic;
          DTYCYC_CNT_25        : out   std_logic;
          N_23_i_c             : in    std_logic;
          MODE_DCYC_NORMB_c    : in    std_logic;
          DTYCYC_EN            : in    std_logic;
          CH3_4_MS_CFG_EN_c    : in    std_logic;
          STATUS_LED_c_0       : in    std_logic;
          CH_ACTIVE_STAT       : in    std_logic;
          MAN_EN_CH_4TO1_A     : in    std_logic;
          MAN_EN_CH_4TO1_c     : in    std_logic;
          MAN_EN_CH_4TO1_B     : in    std_logic;
          man_en_ch_4to1       : out   std_logic;
          MAN_EN_CH_8TO5_A     : in    std_logic;
          MAN_EN_CH_8TO5_c     : in    std_logic;
          MAN_EN_CH_8TO5_B     : in    std_logic;
          man_en_ch_8to5       : out   std_logic;
          STDBY_OFFB_B         : in    std_logic;
          UVL_OK_CH3A4         : in    std_logic;
          STATUS_LED_c         : in    std_logic
        );

end MAIN_SEQUENCER_NEW_3_0;

architecture DEF_ARCH of MAIN_SEQUENCER_NEW_3_0 is 

  component OR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AX1D
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

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component MAJ3
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

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AOI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3C
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

  component OA1C
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

  component NOR3
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

  component MIN3X
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3B
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

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AXO6
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

  component OR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1D
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XO1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_230_0, \SEQUENCER_STATE[4]_net_1\, 
        \SEQUENCER_STATE[3]_net_1\, N_304, \RET_STATE[4]_net_1\, 
        N_221, \DTYCYC_CNT_n1_i_0\, \SEQUENCER_STATE_ns_i_1[2]\, 
        N_246, \SEQUENCER_STATE[9]_net_1\, 
        \SEQUENCER_STATE_ns_i_0[2]_net_1\, un8_del_cntr_11, 
        un8_del_cntr_2, un8_del_cntr_1, un8_del_cntr_7, 
        un8_del_cntr_10, un8_del_cntr_6, \DEL_CNTR[9]_net_1\, 
        \DEL_CNTR[10]_net_1\, un8_del_cntr_9, un8_del_cntr_4, 
        \DEL_CNTR[5]_net_1\, \DEL_CNTR[6]_net_1\, 
        \DEL_CNTR[2]_net_1\, \DEL_CNTR[14]_net_1\, 
        \DEL_CNTR[13]_net_1\, \DEL_CNTR[12]_net_1\, 
        \DEL_CNTR[11]_net_1\, \DEL_CNTR[8]_net_1\, 
        \DEL_CNTR[7]_net_1\, \DEL_CNTR[4]_net_1\, 
        \DEL_CNTR[3]_net_1\, \DEL_CNTR[1]_net_1\, 
        \DEL_CNTR[0]_net_1\, \RET_STATE_0_a3_0[6]\, 
        \RET_STATE[6]_net_1\, \SEQUENCER_STATE[6]_net_1\, 
        \RET_STATE_0_a3_0[5]\, \RET_STATE[5]_net_1\, 
        \SEQUENCER_STATE[5]_net_1\, 
        \SEQUENCER_STATE_maj_RNI12OH7[8]_net_1\, N_315, 
        \SEQUENCER_STATE_maj_RNIA54A2[8]_net_1\, N_266, N_8, 
        un1_mode_dcyc_normb_1, 
        \SEQUENCER_STATE_maj_RNIR2NF1[4]_net_1\, N_309, 
        un8_del_cntr, \RET_STATE[9]_net_1\, 
        \SEQUENCER_STATE_maj_RNIQHEV5[9]_net_1\, N_271, N_313, 
        N_275, N_236, \SEQUENCER_STATE[8]_net_1\, 
        \SEQUENCER_STATE_ns[3]\, N_302, N_299, 
        \SEQUENCER_STATE_ns[4]\, N_298, 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, N_225, N_222, 
        \SEQUENCER_STATE[7]_net_1\, N_285, 
        \SEQUENCER_STATE_ns[5]\, 
        \SEQUENCER_STATE_maj_RNIMULP[5]_net_1\, 
        \SEQUENCER_STATE_maj_RNINVLP[6]_net_1\, 
        \SEQUENCER_STATE_maj_RNIO0MP[5]_net_1\, N_290, 
        \RET_STATE_maj_RNIR3MP[9]_net_1\, \N_DEL_CNTR[14]\, 
        I_58_0, \N_DEL_CNTR[13]\, I_60_0, \N_DEL_CNTR[12]\, 
        I_50_0, \N_DEL_CNTR[11]\, I_48_0, \N_DEL_CNTR[10]\, 
        I_54_0, \N_DEL_CNTR[9]\, I_55_0, \N_DEL_CNTR[8]\, I_57_0, 
        \N_DEL_CNTR[7]\, I_59_0, \N_DEL_CNTR[6]\, I_49_0, 
        \N_DEL_CNTR[5]\, I_62_0, \N_DEL_CNTR[4]\, I_53_0, 
        \N_DEL_CNTR[3]\, I_51_0, \N_DEL_CNTR[2]\, I_52_0, 
        \N_DEL_CNTR[1]\, I_56_0, \N_DEL_CNTR[0]\, 
        \DWACT_ADD_CI_0_partial_sum[0]\, \N_CH_VOSG_EN_7[1]\, 
        \N_CH_VOSG_EN_7_1[1]\, N_18_i, N_15, N_17_i, N_16, N_67, 
        N_64, N_65, N_4, N_DTYCYC_CNT_2_sqmuxa, \N_CH_VOSG_EN[1]\, 
        N_312, N_CH_VOSG_EN_2_sqmuxa, \N_CH_VOSG_EN[0]\, 
        N_CH_IAUX_EN_1_sqmuxa, N_CH_MREG_EN_1_sqmuxa, 
        \CH_VOSG_EN_maj_RNIHBN23[1]_net_1\, \P_CH_VOSG_EN_c[3]\, 
        \CH_VOSG_EN_maj_RNIB8TL2[0]_net_1\, \P_CH_VOSG_EN_c[2]\, 
        \CH_MREG_EN_maj_RNISJUL1[0]_net_1\, \P_CH_MREG_EN_c_c[2]\, 
        \CH_IAUX_EN_maj_RNI2N6R1[0]_net_1\, \P_CH_IAUX_EN_c_c[2]\, 
        \RET_STATE_1[4]\, \RET_STATE_tmr2_1[4]\, 
        \RET_STATE_tmr3_1[4]\, \RET_STATE_1[5]\, 
        \RET_STATE_tmr2_1[5]\, \RET_STATE_tmr3_1[5]\, 
        \RET_STATE_1[6]\, \RET_STATE_tmr2_1[6]\, 
        \RET_STATE_tmr3_1[6]\, \RET_STATE_1[9]\, 
        \RET_STATE_tmr2_1[9]\, \RET_STATE_tmr3_1[9]\, 
        \CH_VOSG_EN_1[1]\, \CH_VOSG_EN_tmr2_1[1]\, 
        \CH_VOSG_EN_tmr3_1[1]\, \CH_VOSG_EN_1[0]\, 
        \CH_VOSG_EN_tmr2_1[0]\, \CH_VOSG_EN_tmr3_1[0]\, 
        \SEQUENCER_STATE_1[3]\, \SEQUENCER_STATE_tmr2_1[3]\, 
        \SEQUENCER_STATE_tmr3_1[3]\, \SEQUENCER_STATE_1[4]\, 
        \SEQUENCER_STATE_tmr2_1[4]\, \SEQUENCER_STATE_tmr3_1[4]\, 
        \SEQUENCER_STATE_1[5]\, \SEQUENCER_STATE_tmr2_1[5]\, 
        \SEQUENCER_STATE_tmr3_1[5]\, \SEQUENCER_STATE_1[6]\, 
        \SEQUENCER_STATE_tmr2_1[6]\, \SEQUENCER_STATE_tmr3_1[6]\, 
        \SEQUENCER_STATE_1[7]\, \SEQUENCER_STATE_tmr2_1[7]\, 
        \SEQUENCER_STATE_tmr3_1[7]\, \SEQUENCER_STATE_1[8]\, 
        \SEQUENCER_STATE_tmr2_1[8]\, \SEQUENCER_STATE_tmr3_1[8]\, 
        \SEQUENCER_STATE_1[9]\, \SEQUENCER_STATE_tmr2_1[9]\, 
        \SEQUENCER_STATE_tmr3_1[9]\, \CH_IAUX_EN_1[0]\, 
        \CH_IAUX_EN_tmr2_1[0]\, \CH_IAUX_EN_tmr3_1[0]\, 
        \CH_MREG_EN_1[0]\, \CH_MREG_EN_tmr2_1[0]\, 
        \CH_MREG_EN_tmr3_1[0]\, \DEL_CNTR_1[14]\, 
        \DEL_CNTR_tmr2_1[14]\, \DEL_CNTR_tmr3_1[14]\, 
        \DEL_CNTR_1[13]\, \DEL_CNTR_tmr2_1[13]\, 
        \DEL_CNTR_tmr3_1[13]\, \DEL_CNTR_1[12]\, 
        \DEL_CNTR_tmr2_1[12]\, \DEL_CNTR_tmr3_1[12]\, 
        \DEL_CNTR_1[11]\, \DEL_CNTR_tmr2_1[11]\, 
        \DEL_CNTR_tmr3_1[11]\, \DEL_CNTR_1[10]\, 
        \DEL_CNTR_tmr2_1[10]\, \DEL_CNTR_tmr3_1[10]\, 
        \DEL_CNTR_1[9]\, \DEL_CNTR_tmr2_1[9]\, 
        \DEL_CNTR_tmr3_1[9]\, \DEL_CNTR_1[8]\, 
        \DEL_CNTR_tmr2_1[8]\, \DEL_CNTR_tmr3_1[8]\, 
        \DEL_CNTR_1[7]\, \DEL_CNTR_tmr2_1[7]\, 
        \DEL_CNTR_tmr3_1[7]\, \DEL_CNTR_1[6]\, 
        \DEL_CNTR_tmr2_1[6]\, \DEL_CNTR_tmr3_1[6]\, 
        \DEL_CNTR_1[5]\, \DEL_CNTR_tmr2_1[5]\, 
        \DEL_CNTR_tmr3_1[5]\, \DEL_CNTR_1[4]\, 
        \DEL_CNTR_tmr2_1[4]\, \DEL_CNTR_tmr3_1[4]\, 
        \DEL_CNTR_1[3]\, \DEL_CNTR_tmr2_1[3]\, 
        \DEL_CNTR_tmr3_1[3]\, \DEL_CNTR_1[2]\, 
        \DEL_CNTR_tmr2_1[2]\, \DEL_CNTR_tmr3_1[2]\, 
        \DEL_CNTR_1[1]\, \DEL_CNTR_tmr2_1[1]\, 
        \DEL_CNTR_tmr3_1[1]\, \DEL_CNTR_1[0]\, 
        \DEL_CNTR_tmr2_1[0]\, \DEL_CNTR_tmr3_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_5[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\, 
        \DWACT_ADD_CI_0_pog_array_2_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_2[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\, 
        \DWACT_ADD_CI_0_pog_array_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\, 
        \DWACT_ADD_CI_0_g_array_3[0]\, 
        \DWACT_ADD_CI_0_g_array_2[0]\, 
        \DWACT_ADD_CI_0_g_array_2_1[0]\, 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, 
        \DWACT_ADD_CI_0_g_array_0_5[0]\, 
        \DWACT_ADD_CI_0_g_array_10[0]\, 
        \DWACT_ADD_CI_0_g_array_2_2[0]\, 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, 
        \DWACT_ADD_CI_0_g_array_1_5[0]\, 
        \DWACT_ADD_CI_0_g_array_1_3[0]\, 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, 
        \DWACT_ADD_CI_0_g_array_1[0]\, 
        \DWACT_ADD_CI_0_g_array_1_1[0]\, 
        \DWACT_ADD_CI_0_g_array_11[0]\, 
        \DWACT_ADD_CI_0_g_array_12_2[0]\, 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, 
        \DWACT_ADD_CI_0_g_array_12_3[0]\, 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, 
        \DWACT_ADD_CI_0_g_array_1_6[0]\, 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, 
        \DWACT_ADD_CI_0_g_array_0_13[0]\, 
        \DWACT_ADD_CI_0_g_array_0_7[0]\, 
        \DWACT_ADD_CI_0_g_array_12[0]\, 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, 
        \DWACT_ADD_CI_0_g_array_12_4[0]\, 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, 
        \DWACT_ADD_CI_0_g_array_11_2[0]\, 
        \DWACT_ADD_CI_0_g_array_0_11[0]\, 
        \DWACT_ADD_CI_0_g_array_0_3[0]\, 
        \DWACT_ADD_CI_0_g_array_12_5[0]\, 
        \DWACT_ADD_CI_0_pog_array_0[0]\, \DWACT_ADD_CI_0_TMP[0]\, 
        \DWACT_ADD_CI_0_g_array_0_1[0]\, 
        \DWACT_ADD_CI_0_g_array_0_9[0]\, 
        \DWACT_ADD_CI_0_partial_sum[5]\, 
        \DWACT_ADD_CI_0_partial_sum[13]\, 
        \DWACT_ADD_CI_0_partial_sum[7]\, 
        \DWACT_ADD_CI_0_partial_sum[14]\, 
        \DWACT_ADD_CI_0_partial_sum[8]\, 
        \DWACT_ADD_CI_0_partial_sum[1]\, 
        \DWACT_ADD_CI_0_partial_sum[9]\, 
        \DWACT_ADD_CI_0_partial_sum[10]\, 
        \DWACT_ADD_CI_0_partial_sum[4]\, 
        \DWACT_ADD_CI_0_partial_sum[2]\, 
        \DWACT_ADD_CI_0_partial_sum[3]\, 
        \DWACT_ADD_CI_0_partial_sum[12]\, 
        \DWACT_ADD_CI_0_partial_sum[6]\, 
        \DWACT_ADD_CI_0_partial_sum[11]\, \GND\, \VCC\
         : std_logic;

begin 

    P_CH_IAUX_EN_c_c_0 <= \P_CH_IAUX_EN_c_c[2]\;
    P_CH_MREG_EN_c_c_0 <= \P_CH_MREG_EN_c_c[2]\;
    P_CH_VOSG_EN_c(3) <= \P_CH_VOSG_EN_c[3]\;
    P_CH_VOSG_EN_c(2) <= \P_CH_VOSG_EN_c[2]\;
    N_CH_VOSG_EN_7_1_0 <= \N_CH_VOSG_EN_7_1[1]\;

    \SEQUENCER_STATE_maj_RNIAT17L[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_58_0, Y => 
        \N_DEL_CNTR[14]\);
    
    DTYCYC_CNT_n2_0_x2 : AX1D
      port map(A => DTYCYC_CNT(0), B => DTYCYC_CNT(1), C => 
        DTYCYC_CNT(2), Y => N_17_i);
    
    un1_DEL_CNTR_I_41 : XOR2
      port map(A => \DEL_CNTR[12]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[12]\);
    
    un1_DEL_CNTR_I_71 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12[0]\);
    
    un1_DEL_CNTR_I_57 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[8]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, Y => I_57_0);
    
    un1_DEL_CNTR_I_30 : XOR2
      port map(A => \DEL_CNTR[1]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0[0]\);
    
    \DEL_CNTR_tmr2[14]\ : DFN1P0
      port map(D => \N_DEL_CNTR[14]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[14]\);
    
    \DEL_CNTR_maj[10]\ : MAJ3
      port map(A => \DEL_CNTR_1[10]\, B => \DEL_CNTR_tmr2_1[10]\, 
        C => \DEL_CNTR_tmr3_1[10]\, Y => \DEL_CNTR[10]_net_1\);
    
    \SEQUENCER_STATE_maj_RNINVLP[6]\ : AO1A
      port map(A => \SEQUENCER_STATE[7]_net_1\, B => 
        \RET_STATE_0_a3_0[5]\, C => \SEQUENCER_STATE[6]_net_1\, Y
         => \SEQUENCER_STATE_maj_RNINVLP[6]_net_1\);
    
    \RET_STATE[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIMULP[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_1[4]\);
    
    \SEQUENCER_STATE_maj[8]\ : MAJ3
      port map(A => \SEQUENCER_STATE_1[8]\, B => 
        \SEQUENCER_STATE_tmr2_1[8]\, C => 
        \SEQUENCER_STATE_tmr3_1[8]\, Y => 
        \SEQUENCER_STATE[8]_net_1\);
    
    \SEQUENCER_STATE_tmr2[8]\ : DFN1C0
      port map(D => N_315, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \SEQUENCER_STATE_tmr2_1[8]\);
    
    \DEL_CNTR[10]\ : DFN1P0
      port map(D => \N_DEL_CNTR[10]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[10]\);
    
    un1_DEL_CNTR_I_36 : XOR2
      port map(A => \DEL_CNTR[1]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[1]\);
    
    un1_DEL_CNTR_I_49 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[6]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, Y => I_49_0);
    
    un1_DEL_CNTR_I_79 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\);
    
    un1_DEL_CNTR_I_6 : AND2
      port map(A => \DEL_CNTR[3]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\);
    
    \SEQUENCER_STATE_maj_RNIDFRA[6]\ : OR2
      port map(A => \SEQUENCER_STATE[6]_net_1\, B => 
        \SEQUENCER_STATE[7]_net_1\, Y => N_222);
    
    un1_DEL_CNTR_I_81 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_10[0]\);
    
    N_DTYCYC_CNT_2_sqmuxa_0_a2 : NOR2A
      port map(A => MODE_DCYC_NORMB_c, B => N_23_i_c, Y => 
        N_DTYCYC_CNT_2_sqmuxa);
    
    \RET_STATE_maj_RNIR3MP[9]\ : NOR2A
      port map(A => \RET_STATE[9]_net_1\, B => N_225, Y => 
        \RET_STATE_maj_RNIR3MP[9]_net_1\);
    
    un1_DEL_CNTR_I_9 : AND2
      port map(A => \DEL_CNTR[10]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\);
    
    \RET_STATE_tmr3[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIO0MP[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3_1[6]\);
    
    DTYCYC_CNT_n1_i : OR2
      port map(A => \DTYCYC_CNT_n1_i_0\, B => 
        un1_mode_dcyc_normb_1, Y => N_8);
    
    un1_DEL_CNTR_I_37 : XOR2
      port map(A => \DEL_CNTR[14]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[14]\);
    
    \SEQUENCER_STATE_maj_RNIMULP[5]\ : OA1B
      port map(A => \RET_STATE[4]_net_1\, B => 
        \SEQUENCER_STATE[5]_net_1\, C => N_222, Y => 
        \SEQUENCER_STATE_maj_RNIMULP[5]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIHGJQ[7]\ : NOR2A
      port map(A => N_312, B => \SEQUENCER_STATE[7]_net_1\, Y => 
        N_CH_IAUX_EN_1_sqmuxa);
    
    \DEL_CNTR_tmr2[6]\ : DFN1P0
      port map(D => \N_DEL_CNTR[6]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[6]\);
    
    \DEL_CNTR_maj[4]\ : MAJ3
      port map(A => \DEL_CNTR_1[4]\, B => \DEL_CNTR_tmr2_1[4]\, C
         => \DEL_CNTR_tmr3_1[4]\, Y => \DEL_CNTR[4]_net_1\);
    
    \DEL_CNTR[3]\ : DFN1P0
      port map(D => \N_DEL_CNTR[3]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[3]\);
    
    un1_DEL_CNTR_I_89 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_1[0]\);
    
    un1_DEL_CNTR_I_20 : XOR2
      port map(A => \DEL_CNTR[10]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_9[0]\);
    
    \SEQUENCER_STATE_tmr3[9]\ : DFN1P0
      port map(D => \SEQUENCER_STATE_maj_RNI12OH7[8]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_1[9]\);
    
    \DEL_CNTR_tmr2[13]\ : DFN1P0
      port map(D => \N_DEL_CNTR[13]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[13]\);
    
    \RET_STATE_maj[5]\ : MAJ3
      port map(A => \RET_STATE_1[5]\, B => \RET_STATE_tmr2_1[5]\, 
        C => \RET_STATE_tmr3_1[5]\, Y => \RET_STATE[5]_net_1\);
    
    \DEL_CNTR_tmr2[8]\ : DFN1P0
      port map(D => \N_DEL_CNTR[8]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[8]\);
    
    \CH_MREG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CH_MREG_EN_maj_RNISJUL1[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_MREG_EN_tmr3_1[0]\);
    
    DTYCYC_CNT_n3_0 : OR2
      port map(A => N_18_i, B => un1_mode_dcyc_normb_1, Y => N_65);
    
    \SEQUENCER_STATE_tmr3[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_1[4]\);
    
    \MAN_EN_CH_8TO5_B_18\ : MX2
      port map(A => MAN_EN_CH_8TO5_B, B => MAN_EN_CH_8TO5_A, S
         => N_23_i_c, Y => MAN_EN_CH_8TO5_B_18);
    
    \RET_STATE_maj[6]\ : MAJ3
      port map(A => \RET_STATE_1[6]\, B => \RET_STATE_tmr2_1[6]\, 
        C => \RET_STATE_tmr3_1[6]\, Y => \RET_STATE[6]_net_1\);
    
    \CH_MREG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CH_MREG_EN_maj_RNISJUL1[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_MREG_EN_tmr2_1[0]\);
    
    un1_DEL_CNTR_I_68 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\);
    
    un1_DEL_CNTR_I_26 : XOR2
      port map(A => \DEL_CNTR[6]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_5[0]\);
    
    \DEL_CNTR_tmr3[14]\ : DFN1P0
      port map(D => \N_DEL_CNTR[14]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[14]\);
    
    \DEL_CNTR_tmr2[3]\ : DFN1P0
      port map(D => \N_DEL_CNTR[3]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[3]\);
    
    \CH_VOSG_EN_maj[1]\ : MAJ3
      port map(A => \CH_VOSG_EN_1[1]\, B => 
        \CH_VOSG_EN_tmr2_1[1]\, C => \CH_VOSG_EN_tmr3_1[1]\, Y
         => \P_CH_VOSG_EN_c[3]\);
    
    un1_DEL_CNTR_I_53 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[4]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, Y => I_53_0);
    
    \SEQUENCER_STATE_maj_RNIT98E2[8]\ : AOI1
      port map(A => un8_del_cntr, B => \SEQUENCER_STATE[8]_net_1\, 
        C => \SEQUENCER_STATE[9]_net_1\, Y => N_313);
    
    \DTYCYC_CNT_24\ : MX2
      port map(A => N_8, B => DTYCYC_CNT(1), S => 
        N_DTYCYC_CNT_2_sqmuxa, Y => DTYCYC_CNT_24);
    
    \DEL_CNTR_tmr2[4]\ : DFN1P0
      port map(D => \N_DEL_CNTR[4]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[4]\);
    
    \SEQUENCER_STATE_maj_RNIU8GQ3[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_56_0, Y => 
        \N_DEL_CNTR[1]\);
    
    \SEQUENCER_STATE_maj_RNIL68EE[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_54_0, Y => 
        \N_DEL_CNTR[10]\);
    
    un1_DEL_CNTR_I_27 : XOR2
      port map(A => \DEL_CNTR[11]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\);
    
    \DTYCYC_EN_20\ : MX2
      port map(A => un1_mode_dcyc_normb_1, B => DTYCYC_EN, S => 
        N_DTYCYC_CNT_2_sqmuxa, Y => DTYCYC_EN_20);
    
    \CH_MREG_EN[0]\ : DFN1C0
      port map(D => \CH_MREG_EN_maj_RNISJUL1[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_MREG_EN_1[0]\);
    
    \DEL_CNTR_tmr3[9]\ : DFN1P0
      port map(D => \N_DEL_CNTR[9]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[9]\);
    
    un1_DEL_CNTR_I_55 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[9]\, B => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\, Y => I_55_0);
    
    \SEQUENCER_STATE_maj_RNI79RA[4]\ : NOR2
      port map(A => \SEQUENCER_STATE[4]_net_1\, B => 
        \SEQUENCER_STATE[3]_net_1\, Y => N_230_0);
    
    \DEL_CNTR_tmr2[2]\ : DFN1P0
      port map(D => \N_DEL_CNTR[2]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[2]\);
    
    un1_DEL_CNTR_I_40 : XOR2
      port map(A => \DEL_CNTR[8]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[8]\);
    
    un1_DEL_CNTR_I_70 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    \DEL_CNTR_tmr3[5]\ : DFN1P0
      port map(D => \N_DEL_CNTR[5]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[5]\);
    
    \DEL_CNTR_maj[2]\ : MAJ3
      port map(A => \DEL_CNTR_1[2]\, B => \DEL_CNTR_tmr2_1[2]\, C
         => \DEL_CNTR_tmr3_1[2]\, Y => \DEL_CNTR[2]_net_1\);
    
    \CH_VOSG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIB8TL2[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr3_1[0]\);
    
    un1_DEL_CNTR_I_33 : XOR2
      port map(A => \DEL_CNTR[3]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[3]\);
    
    \CH_MREG_EN_maj[0]\ : MAJ3
      port map(A => \CH_MREG_EN_1[0]\, B => 
        \CH_MREG_EN_tmr2_1[0]\, C => \CH_MREG_EN_tmr3_1[0]\, Y
         => \P_CH_MREG_EN_c_c[2]\);
    
    un1_DEL_CNTR_I_91 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\);
    
    \RET_STATE_maj_RNIBLPI[5]\ : OR2
      port map(A => \RET_STATE[5]_net_1\, B => 
        \RET_STATE[6]_net_1\, Y => N_221);
    
    \DEL_CNTR_tmr3[13]\ : DFN1P0
      port map(D => \N_DEL_CNTR[13]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[13]\);
    
    un1_DEL_CNTR_I_46 : XOR2
      port map(A => \DEL_CNTR[6]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[6]\);
    
    \SEQUENCER_STATE_maj_RNIOIBO7[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_62_0, Y => 
        \N_DEL_CNTR[5]\);
    
    un1_DEL_CNTR_I_76 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11[0]\);
    
    \DEL_CNTR_tmr2[0]\ : DFN1P0
      port map(D => \N_DEL_CNTR[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[0]\);
    
    \SEQUENCER_STATE[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_1[4]\);
    
    \SEQUENCER_STATE_tmr3[8]\ : DFN1C0
      port map(D => N_315, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \SEQUENCER_STATE_tmr3_1[8]\);
    
    \CH_VOSG_EN_tmr2[1]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIHBN23[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr2_1[1]\);
    
    un1_DEL_CNTR_I_69 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\);
    
    \SEQUENCER_STATE_maj_RNICIQE[6]\ : NOR2A
      port map(A => \RET_STATE[6]_net_1\, B => 
        \SEQUENCER_STATE[6]_net_1\, Y => \RET_STATE_0_a3_0[6]\);
    
    \CH_VOSG_EN_maj_RNIB8TL2[0]\ : MX2
      port map(A => \N_CH_VOSG_EN[0]\, B => \P_CH_VOSG_EN_c[2]\, 
        S => N_290, Y => \CH_VOSG_EN_maj_RNIB8TL2[0]_net_1\);
    
    un1_DEL_CNTR_I_80 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\);
    
    un1_DEL_CNTR_I_35 : XOR2
      port map(A => \DEL_CNTR[7]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[7]\);
    
    \DEL_CNTR_maj[13]\ : MAJ3
      port map(A => \DEL_CNTR_1[13]\, B => \DEL_CNTR_tmr2_1[13]\, 
        C => \DEL_CNTR_tmr3_1[13]\, Y => \DEL_CNTR[13]_net_1\);
    
    un1_DEL_CNTR_I_47 : XOR2
      port map(A => \DEL_CNTR[5]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[5]\);
    
    \SEQUENCER_STATE_tmr3[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_1[5]\);
    
    un1_DEL_CNTR_I_77 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2[0]\);
    
    un1_DEL_CNTR_I_12 : AND2
      port map(A => \DEL_CNTR[9]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\);
    
    un1_DEL_CNTR_I_86 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1[0]\);
    
    \SEQUENCER_STATE_maj_RNI9N5L[8]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH3A4, C => 
        \SEQUENCER_STATE[8]_net_1\, Y => N_290);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \SEQUENCER_STATE_tmr2[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_1[6]\);
    
    \RET_STATE_tmr2[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNINVLP[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2_1[5]\);
    
    \SEQUENCER_STATE_maj_RNI6L3P2[8]\ : OA1C
      port map(A => \SEQUENCER_STATE[8]_net_1\, B => un8_del_cntr, 
        C => N_225, Y => N_285);
    
    \SEQUENCER_STATE_maj_RNIA54A2[8]\ : OA1A
      port map(A => \SEQUENCER_STATE[8]_net_1\, B => N_246, C => 
        N_309, Y => \SEQUENCER_STATE_maj_RNIA54A2[8]_net_1\);
    
    un1_DEL_CNTR_I_23 : XOR2
      port map(A => \DEL_CNTR[5]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\);
    
    \RET_STATE_maj_RNIBLPI_1[5]\ : NOR2A
      port map(A => \RET_STATE[5]_net_1\, B => 
        \RET_STATE[6]_net_1\, Y => N_298);
    
    \DEL_CNTR_tmr3[0]\ : DFN1P0
      port map(D => \N_DEL_CNTR[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[0]\);
    
    \DEL_CNTR_maj_RNIBVHH[14]\ : NOR3
      port map(A => \DEL_CNTR[2]_net_1\, B => 
        \DEL_CNTR[14]_net_1\, C => \DEL_CNTR[13]_net_1\, Y => 
        un8_del_cntr_7);
    
    un1_DEL_CNTR_I_87 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\);
    
    \SEQUENCER_STATE_maj_RNIIGUN1[3]\ : MX2
      port map(A => N_312, B => \N_CH_VOSG_EN_7_1[1]\, S => 
        N_CH_VOSG_EN_2_sqmuxa, Y => \N_CH_VOSG_EN[0]\);
    
    \DEL_CNTR[9]\ : DFN1P0
      port map(D => \N_DEL_CNTR[9]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[9]\);
    
    \DEL_CNTR[6]\ : DFN1P0
      port map(D => \N_DEL_CNTR[6]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[6]\);
    
    un1_mode_dcyc_normb_1_0_0 : OR2A
      port map(A => MODE_DCYC_NORMB_c, B => N_67, Y => 
        un1_mode_dcyc_normb_1);
    
    \RET_STATE_tmr2[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIMULP[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2_1[4]\);
    
    \DEL_CNTR[4]\ : DFN1P0
      port map(D => \N_DEL_CNTR[4]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[4]\);
    
    un1_DEL_CNTR_I_25 : XOR2
      port map(A => \DEL_CNTR[12]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_11[0]\);
    
    \DEL_CNTR_tmr2[12]\ : DFN1P0
      port map(D => \N_DEL_CNTR[12]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[12]\);
    
    \RET_STATE_maj_RNIFE6S[5]\ : MIN3X
      port map(A => \RET_STATE[6]_net_1\, B => 
        \RET_STATE[5]_net_1\, C => \RET_STATE[4]_net_1\, Y => 
        N_236);
    
    \DEL_CNTR_tmr2[1]\ : DFN1P0
      port map(D => \N_DEL_CNTR[1]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[1]\);
    
    \SEQUENCER_STATE_maj[5]\ : MAJ3
      port map(A => \SEQUENCER_STATE_1[5]\, B => 
        \SEQUENCER_STATE_tmr2_1[5]\, C => 
        \SEQUENCER_STATE_tmr3_1[5]\, Y => 
        \SEQUENCER_STATE[5]_net_1\);
    
    \RET_STATE_tmr3[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIR3MP[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3_1[9]\);
    
    \MAN_EN_CH_4TO1_B_17\ : MX2
      port map(A => MAN_EN_CH_4TO1_B, B => MAN_EN_CH_4TO1_A, S
         => N_23_i_c, Y => MAN_EN_CH_4TO1_B_17);
    
    \DEL_CNTR_tmr2[5]\ : DFN1P0
      port map(D => \N_DEL_CNTR[5]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[5]\);
    
    \SEQUENCER_STATE_maj_RNIMOQC3[8]\ : NOR3B
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH3A4, C => N_285, 
        Y => N_315);
    
    \DEL_CNTR[1]\ : DFN1P0
      port map(D => \N_DEL_CNTR[1]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[1]\);
    
    \DEL_CNTR_maj[14]\ : MAJ3
      port map(A => \DEL_CNTR_1[14]\, B => \DEL_CNTR_tmr2_1[14]\, 
        C => \DEL_CNTR_tmr3_1[14]\, Y => \DEL_CNTR[14]_net_1\);
    
    un1_DEL_CNTR_I_60 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[13]\, B => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\, Y => I_60_0);
    
    un1_DEL_CNTR_I_43 : XOR2
      port map(A => \DEL_CNTR[11]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[11]\);
    
    un1_DEL_CNTR_I_73 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_12[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\);
    
    \SEQUENCER_STATE_tmr2[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_1[4]\);
    
    \SEQUENCER_STATE_maj_RNIN7101[6]\ : NOR2A
      port map(A => N_312, B => N_222, Y => N_CH_MREG_EN_1_sqmuxa);
    
    \MAN_EN_CH_8TO5_A_15\ : MX2
      port map(A => MAN_EN_CH_8TO5_A, B => MAN_EN_CH_8TO5_c, S
         => N_23_i_c, Y => MAN_EN_CH_8TO5_A_15);
    
    un1_DEL_CNTR_I_90 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_3[0]\);
    
    \MAIN_SEQUENCER.N_CH_VOSG_EN_7[1]\ : OR2
      port map(A => CH3_4_MS_CFG_EN_c, B => \N_CH_VOSG_EN_7_1[1]\, 
        Y => \N_CH_VOSG_EN_7[1]\);
    
    \DEL_CNTR[7]\ : DFN1P0
      port map(D => \N_DEL_CNTR[7]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[7]\);
    
    \CH_VOSG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIB8TL2[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr2_1[0]\);
    
    \MAN_EN_CH_4TO1_A_14\ : MX2
      port map(A => MAN_EN_CH_4TO1_A, B => MAN_EN_CH_4TO1_c, S
         => N_23_i_c, Y => MAN_EN_CH_4TO1_A_14);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \SEQUENCER_STATE_ns_i_a2_6[0]\ : NOR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH3A4, C => 
        STDBY_OFFB_B, Y => N_309);
    
    \RET_STATE_maj[4]\ : MAJ3
      port map(A => \RET_STATE_1[4]\, B => \RET_STATE_tmr2_1[4]\, 
        C => \RET_STATE_tmr3_1[4]\, Y => \RET_STATE[4]_net_1\);
    
    un1_DEL_CNTR_I_14 : AND2
      port map(A => \DEL_CNTR[5]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\);
    
    un1_DEL_CNTR_I_66 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\);
    
    \SEQUENCER_STATE_maj_RNINIO42[3]\ : MX2
      port map(A => N_312, B => \N_CH_VOSG_EN_7[1]\, S => 
        N_CH_VOSG_EN_2_sqmuxa, Y => \N_CH_VOSG_EN[1]\);
    
    \DEL_CNTR_tmr3[7]\ : DFN1P0
      port map(D => \N_DEL_CNTR[7]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[7]\);
    
    \MAIN_SEQUENCER.N_CH_VOSG_EN_7_1[1]\ : OR2B
      port map(A => REGISTER_CH_CMD_CH_0, B => DTYCYC_EN, Y => 
        \N_CH_VOSG_EN_7_1[1]\);
    
    \SEQUENCER_STATE_maj_RNIMRGC3[8]\ : OR3A
      port map(A => N_313, B => N_225, C => 
        \DWACT_ADD_CI_0_partial_sum[0]\, Y => \N_DEL_CNTR[0]\);
    
    un1_DEL_CNTR_I_52 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[2]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, Y => I_52_0);
    
    \SEQUENCER_STATE_maj_RNIAO5L[9]\ : NOR3B
      port map(A => STATUS_LED_c, B => UVL_OK_CH3A4, C => 
        \SEQUENCER_STATE[9]_net_1\, Y => N_312);
    
    un1_DEL_CNTR_I_45 : XOR2
      port map(A => \DEL_CNTR[9]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[9]\);
    
    un1_DEL_CNTR_I_83 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_3[0]\);
    
    un1_DEL_CNTR_I_75 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\);
    
    \DEL_CNTR_maj_RNIJJ2U[0]\ : NOR3C
      port map(A => un8_del_cntr_2, B => un8_del_cntr_1, C => 
        un8_del_cntr_7, Y => un8_del_cntr_11);
    
    \CH_IAUX_EN[0]\ : DFN1C0
      port map(D => \CH_IAUX_EN_maj_RNI2N6R1[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_IAUX_EN_1[0]\);
    
    un1_DEL_CNTR_I_67 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_10[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\);
    
    \RET_STATE_maj_RNIBLPI_0[5]\ : NOR2A
      port map(A => \RET_STATE[6]_net_1\, B => 
        \RET_STATE[5]_net_1\, Y => N_299);
    
    \DEL_CNTR_maj_RNI1786[0]\ : NOR2
      port map(A => \DEL_CNTR[1]_net_1\, B => \DEL_CNTR[0]_net_1\, 
        Y => un8_del_cntr_1);
    
    \CH_MREG_EN_maj_RNISJUL1[0]\ : MX2
      port map(A => N_CH_MREG_EN_1_sqmuxa, B => 
        \P_CH_MREG_EN_c_c[2]\, S => N_290, Y => 
        \CH_MREG_EN_maj_RNISJUL1[0]_net_1\);
    
    \DEL_CNTR_tmr3[12]\ : DFN1P0
      port map(D => \N_DEL_CNTR[12]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[12]\);
    
    \DEL_CNTR_maj_RNI7D86[3]\ : NOR2
      port map(A => \DEL_CNTR[4]_net_1\, B => \DEL_CNTR[3]_net_1\, 
        Y => un8_del_cntr_2);
    
    \DEL_CNTR_maj[0]\ : MAJ3
      port map(A => \DEL_CNTR_1[0]\, B => \DEL_CNTR_tmr2_1[0]\, C
         => \DEL_CNTR_tmr3_1[0]\, Y => \DEL_CNTR[0]_net_1\);
    
    \CH_IAUX_EN_tmr2[0]\ : DFN1C0
      port map(D => \CH_IAUX_EN_maj_RNI2N6R1[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_IAUX_EN_tmr2_1[0]\);
    
    \DTYCYC_CNT_25\ : AXO6
      port map(A => un1_mode_dcyc_normb_1, B => 
        N_DTYCYC_CNT_2_sqmuxa, C => DTYCYC_CNT(0), Y => 
        DTYCYC_CNT_25);
    
    \DEL_CNTR_maj[7]\ : MAJ3
      port map(A => \DEL_CNTR_1[7]\, B => \DEL_CNTR_tmr2_1[7]\, C
         => \DEL_CNTR_tmr3_1[7]\, Y => \DEL_CNTR[7]_net_1\);
    
    un1_DEL_CNTR_I_85 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_1[0]\);
    
    \DEL_CNTR_maj[8]\ : MAJ3
      port map(A => \DEL_CNTR_1[8]\, B => \DEL_CNTR_tmr2_1[8]\, C
         => \DEL_CNTR_tmr3_1[8]\, Y => \DEL_CNTR[8]_net_1\);
    
    \DEL_CNTR_maj[1]\ : MAJ3
      port map(A => \DEL_CNTR_1[1]\, B => \DEL_CNTR_tmr2_1[1]\, C
         => \DEL_CNTR_tmr3_1[1]\, Y => \DEL_CNTR[1]_net_1\);
    
    \SEQUENCER_STATE[8]\ : DFN1C0
      port map(D => N_315, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \SEQUENCER_STATE_1[8]\);
    
    DTYCYC_CNT_n1_i_0 : XNOR2
      port map(A => DTYCYC_CNT(0), B => DTYCYC_CNT(1), Y => 
        \DTYCYC_CNT_n1_i_0\);
    
    un1_DEL_CNTR_I_1 : AND2
      port map(A => \DEL_CNTR[0]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_TMP[0]\);
    
    \CH_VOSG_EN[0]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIB8TL2[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_1[0]\);
    
    \DTYCYC_CNT_21\ : MX2
      port map(A => N_4, B => DTYCYC_CNT(4), S => 
        N_DTYCYC_CNT_2_sqmuxa, Y => DTYCYC_CNT_21);
    
    \DEL_CNTR_tmr3[3]\ : DFN1P0
      port map(D => \N_DEL_CNTR[3]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[3]\);
    
    \DEL_CNTR_tmr2[10]\ : DFN1P0
      port map(D => \N_DEL_CNTR[10]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[10]\);
    
    \SEQUENCER_STATE_maj_RNIF4FM4[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_52_0, Y => 
        \N_DEL_CNTR[2]\);
    
    \SEQUENCER_STATE[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_1[5]\);
    
    \DEL_CNTR_tmr3[6]\ : DFN1P0
      port map(D => \N_DEL_CNTR[6]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[6]\);
    
    \SEQUENCER_STATE[3]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIR2NF1[4]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_1[3]\);
    
    un1_DEL_CNTR_I_54 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[10]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, Y => I_54_0);
    
    \SEQUENCER_STATE_ns_i_0[2]\ : OR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH3A4, C => 
        STDBY_OFFB_B, Y => \SEQUENCER_STATE_ns_i_0[2]_net_1\);
    
    un1_DEL_CNTR_I_63 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_8[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\);
    
    \SEQUENCER_STATE_maj_RNIS0562[9]\ : AO1D
      port map(A => N_246, B => \SEQUENCER_STATE[9]_net_1\, C => 
        \SEQUENCER_STATE_ns_i_0[2]_net_1\, Y => 
        \SEQUENCER_STATE_ns_i_1[2]\);
    
    \SEQUENCER_STATE_maj_RNI22EI5[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_51_0, Y => 
        \N_DEL_CNTR[3]\);
    
    un1_DEL_CNTR_I_22 : XOR2
      port map(A => \DEL_CNTR[9]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\);
    
    \SEQUENCER_STATE_maj[3]\ : MAJ3
      port map(A => \SEQUENCER_STATE_1[3]\, B => 
        \SEQUENCER_STATE_tmr2_1[3]\, C => 
        \SEQUENCER_STATE_tmr3_1[3]\, Y => 
        \SEQUENCER_STATE[3]_net_1\);
    
    un1_mode_dcyc_normb_1_0_a2_0 : NOR2
      port map(A => N_16, B => DTYCYC_CNT(4), Y => N_67);
    
    \RET_STATE_tmr3[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNINVLP[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3_1[5]\);
    
    \SEQUENCER_STATE_maj_RNIUE74C[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_57_0, Y => 
        \N_DEL_CNTR[8]\);
    
    \DEL_CNTR[13]\ : DFN1P0
      port map(D => \N_DEL_CNTR[13]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[13]\);
    
    un1_DEL_CNTR_I_18 : AND2
      port map(A => \DEL_CNTR[1]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\);
    
    \DEL_CNTR_maj[6]\ : MAJ3
      port map(A => \DEL_CNTR_1[6]\, B => \DEL_CNTR_tmr2_1[6]\, C
         => \DEL_CNTR_tmr3_1[6]\, Y => \DEL_CNTR[6]_net_1\);
    
    \DEL_CNTR_maj[3]\ : MAJ3
      port map(A => \DEL_CNTR_1[3]\, B => \DEL_CNTR_tmr2_1[3]\, C
         => \DEL_CNTR_tmr3_1[3]\, Y => \DEL_CNTR[3]_net_1\);
    
    \DEBOUNCE.man_en_ch_4to1\ : NOR3C
      port map(A => MAN_EN_CH_4TO1_B, B => MAN_EN_CH_4TO1_c, C
         => MAN_EN_CH_4TO1_A, Y => man_en_ch_4to1);
    
    DTYCYC_CNT_n4_i : XO1A
      port map(A => DTYCYC_CNT(4), B => N_16, C => 
        un1_mode_dcyc_normb_1, Y => N_4);
    
    \DTYCYC_CNT_23\ : MX2A
      port map(A => N_64, B => DTYCYC_CNT(2), S => 
        N_DTYCYC_CNT_2_sqmuxa, Y => DTYCYC_CNT_23);
    
    \DEL_CNTR[0]\ : DFN1P0
      port map(D => \N_DEL_CNTR[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[0]\);
    
    \SEQUENCER_STATE_maj_RNIOD9U9[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_59_0, Y => 
        \N_DEL_CNTR[7]\);
    
    un1_DEL_CNTR_I_65 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\);
    
    \RET_STATE[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNINVLP[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_1[5]\);
    
    \DEL_CNTR[5]\ : DFN1P0
      port map(D => \N_DEL_CNTR[5]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[5]\);
    
    un1_DEL_CNTR_I_34 : XOR2
      port map(A => \DEL_CNTR[4]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[4]\);
    
    \SEQUENCER_STATE_maj_RNIO0MP[5]\ : AO1A
      port map(A => \SEQUENCER_STATE[5]_net_1\, B => 
        \RET_STATE_0_a3_0[6]\, C => \SEQUENCER_STATE[7]_net_1\, Y
         => \SEQUENCER_STATE_maj_RNIO0MP[5]_net_1\);
    
    \SEQUENCER_STATE_maj_RNI30NCI[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_50_0, Y => 
        \N_DEL_CNTR[12]\);
    
    DTYCYC_CNT_n4_i_o2 : OR2
      port map(A => N_15, B => DTYCYC_CNT(3), Y => N_16);
    
    \SEQUENCER_STATE_maj[6]\ : MAJ3
      port map(A => \SEQUENCER_STATE_1[6]\, B => 
        \SEQUENCER_STATE_tmr2_1[6]\, C => 
        \SEQUENCER_STATE_tmr3_1[6]\, Y => 
        \SEQUENCER_STATE[6]_net_1\);
    
    \SEQUENCER_STATE_maj_RNI12OH7[8]\ : NOR3
      port map(A => N_315, B => 
        \SEQUENCER_STATE_maj_RNIA54A2[8]_net_1\, C => N_266, Y
         => \SEQUENCER_STATE_maj_RNI12OH7[8]_net_1\);
    
    \DEL_CNTR_tmr3[10]\ : DFN1P0
      port map(D => \N_DEL_CNTR[10]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[10]\);
    
    un1_DEL_CNTR_I_11 : AND2
      port map(A => \DEL_CNTR[6]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\);
    
    \SEQUENCER_STATE_tmr2[9]\ : DFN1P0
      port map(D => \SEQUENCER_STATE_maj_RNI12OH7[8]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_1[9]\);
    
    DTYCYC_CNT_n2_0 : OR2
      port map(A => N_17_i, B => un1_mode_dcyc_normb_1, Y => N_64);
    
    un1_DEL_CNTR_I_42 : XOR2
      port map(A => \DEL_CNTR[0]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[0]\);
    
    un1_DEL_CNTR_I_72 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_6[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\);
    
    un1_DEL_CNTR_I_5 : AND2
      port map(A => \DEL_CNTR[7]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\);
    
    \DEL_CNTR_maj_RNIVROO[9]\ : NOR3A
      port map(A => un8_del_cntr_6, B => \DEL_CNTR[9]_net_1\, C
         => \DEL_CNTR[10]_net_1\, Y => un8_del_cntr_10);
    
    \SEQUENCER_STATE_tmr3[7]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIQHEV5[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_1[7]\);
    
    un1_DEL_CNTR_I_19 : XOR2
      port map(A => \DEL_CNTR[7]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\);
    
    \SEQUENCER_STATE_maj[9]\ : MAJ3
      port map(A => \SEQUENCER_STATE_1[9]\, B => 
        \SEQUENCER_STATE_tmr2_1[9]\, C => 
        \SEQUENCER_STATE_tmr3_1[9]\, Y => 
        \SEQUENCER_STATE[9]_net_1\);
    
    \DEL_CNTR_maj_RNI5MDE[11]\ : NOR2
      port map(A => \DEL_CNTR[12]_net_1\, B => 
        \DEL_CNTR[11]_net_1\, Y => un8_del_cntr_6);
    
    \SEQUENCER_STATE_tmr2[7]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIQHEV5[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_1[7]\);
    
    \RET_STATE_maj_RNIDQ5U3_0[4]\ : NOR3B
      port map(A => N_302, B => N_298, C => \RET_STATE[4]_net_1\, 
        Y => \SEQUENCER_STATE_ns[4]\);
    
    un1_DEL_CNTR_I_82 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\);
    
    un1_DEL_CNTR_I_24 : XOR2
      port map(A => \DEL_CNTR[2]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_1[0]\);
    
    \SEQUENCER_STATE_maj_RNIR2NF1[4]\ : NOR3B
      port map(A => CH_ACTIVE_STAT, B => N_309, C => N_230_0, Y
         => \SEQUENCER_STATE_maj_RNIR2NF1[4]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIOARGJ[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_60_0, Y => 
        \N_DEL_CNTR[13]\);
    
    \SEQUENCER_STATE[9]\ : DFN1P0
      port map(D => \SEQUENCER_STATE_maj_RNI12OH7[8]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_1[9]\);
    
    \CH_VOSG_EN_tmr3[1]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIHBN23[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr3_1[1]\);
    
    \DEL_CNTR_maj_RNIFL86[7]\ : NOR2
      port map(A => \DEL_CNTR[8]_net_1\, B => \DEL_CNTR[7]_net_1\, 
        Y => un8_del_cntr_4);
    
    \SEQUENCER_STATE_maj_RNI1HCS6[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_53_0, Y => 
        \N_DEL_CNTR[4]\);
    
    un1_DEL_CNTR_I_58 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[14]\, B => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\, Y => I_58_0);
    
    \SEQUENCER_STATE_tmr2[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_1[5]\);
    
    \RET_STATE_maj_RNIFE6S[4]\ : NOR2A
      port map(A => \RET_STATE[4]_net_1\, B => N_221, Y => N_304);
    
    \DEL_CNTR_maj[11]\ : MAJ3
      port map(A => \DEL_CNTR_1[11]\, B => \DEL_CNTR_tmr2_1[11]\, 
        C => \DEL_CNTR_tmr3_1[11]\, Y => \DEL_CNTR[11]_net_1\);
    
    \RET_STATE_tmr2[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIO0MP[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2_1[6]\);
    
    \DEL_CNTR[14]\ : DFN1P0
      port map(D => \N_DEL_CNTR[14]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[14]\);
    
    \DEL_CNTR_tmr2[7]\ : DFN1P0
      port map(D => \N_DEL_CNTR[7]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[7]\);
    
    \DEL_CNTR_tmr2[11]\ : DFN1P0
      port map(D => \N_DEL_CNTR[11]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[11]\);
    
    \SEQUENCER_STATE_maj_RNIAGQE[5]\ : NOR2A
      port map(A => \RET_STATE[5]_net_1\, B => 
        \SEQUENCER_STATE[5]_net_1\, Y => \RET_STATE_0_a3_0[5]\);
    
    \RET_STATE_maj[9]\ : MAJ3
      port map(A => \RET_STATE_1[9]\, B => \RET_STATE_tmr2_1[9]\, 
        C => \RET_STATE_tmr3_1[9]\, Y => \RET_STATE[9]_net_1\);
    
    \DEL_CNTR_tmr2[9]\ : DFN1P0
      port map(D => \N_DEL_CNTR[9]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_1[9]\);
    
    un1_DEL_CNTR_I_44 : XOR2
      port map(A => \DEL_CNTR[10]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[10]\);
    
    \SEQUENCER_STATE_maj_RNIT7A29[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_49_0, Y => 
        \N_DEL_CNTR[6]\);
    
    \RET_STATE_maj_RNIDQ5U3[4]\ : NOR3B
      port map(A => N_302, B => N_299, C => \RET_STATE[4]_net_1\, 
        Y => \SEQUENCER_STATE_ns[3]\);
    
    un1_DEL_CNTR_I_74 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\);
    
    \DEL_CNTR_tmr3[2]\ : DFN1P0
      port map(D => \N_DEL_CNTR[2]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[2]\);
    
    \DEL_CNTR_maj_RNICMC32[5]\ : NOR3C
      port map(A => un8_del_cntr_10, B => un8_del_cntr_9, C => 
        un8_del_cntr_11, Y => un8_del_cntr);
    
    un1_DEL_CNTR_I_38 : XOR2
      port map(A => \DEL_CNTR[2]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[2]\);
    
    un1_DEL_CNTR_I_51 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[3]\, B => 
        \DWACT_ADD_CI_0_g_array_12[0]\, Y => I_51_0);
    
    \DEL_CNTR_maj[5]\ : MAJ3
      port map(A => \DEL_CNTR_1[5]\, B => \DEL_CNTR_tmr2_1[5]\, C
         => \DEL_CNTR_tmr3_1[5]\, Y => \DEL_CNTR[5]_net_1\);
    
    un1_DEL_CNTR_I_10 : AND2
      port map(A => \DEL_CNTR[4]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\);
    
    \SEQUENCER_STATE_maj[4]\ : MAJ3
      port map(A => \SEQUENCER_STATE_1[4]\, B => 
        \SEQUENCER_STATE_tmr2_1[4]\, C => 
        \SEQUENCER_STATE_tmr3_1[4]\, Y => 
        \SEQUENCER_STATE[4]_net_1\);
    
    \CH_IAUX_EN_tmr3[0]\ : DFN1C0
      port map(D => \CH_IAUX_EN_maj_RNI2N6R1[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_IAUX_EN_tmr3_1[0]\);
    
    \RET_STATE_maj_RNIUBV13[9]\ : NOR3B
      port map(A => N_290, B => un8_del_cntr, C => 
        \RET_STATE[9]_net_1\, Y => N_302);
    
    \DEL_CNTR_maj[9]\ : MAJ3
      port map(A => \DEL_CNTR_1[9]\, B => \DEL_CNTR_tmr2_1[9]\, C
         => \DEL_CNTR_tmr3_1[9]\, Y => \DEL_CNTR[9]_net_1\);
    
    un1_DEL_CNTR_I_62 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[5]\, B => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, Y => I_62_0);
    
    \SEQUENCER_STATE_tmr2[3]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIR2NF1[4]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_1[3]\);
    
    un1_DEL_CNTR_I_59 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[7]\, B => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\, Y => I_59_0);
    
    \SEQUENCER_STATE_maj_RNI171B1[9]\ : NOR3A
      port map(A => N_236, B => \RET_STATE[9]_net_1\, C => 
        \SEQUENCER_STATE[9]_net_1\, Y => N_271);
    
    \CH_IAUX_EN_maj_RNI2N6R1[0]\ : MX2
      port map(A => N_CH_IAUX_EN_1_sqmuxa, B => 
        \P_CH_IAUX_EN_c_c[2]\, S => N_290, Y => 
        \CH_IAUX_EN_maj_RNI2N6R1[0]_net_1\);
    
    un1_DEL_CNTR_I_92 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_5[0]\);
    
    un1_DEL_CNTR_I_16 : AND2
      port map(A => \DEL_CNTR[11]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\);
    
    \SEQUENCER_STATE_maj_RNIQHEV5[9]\ : NOR3
      port map(A => N_271, B => \SEQUENCER_STATE_ns_i_1[2]\, C
         => N_313, Y => \SEQUENCER_STATE_maj_RNIQHEV5[9]_net_1\);
    
    \DEL_CNTR[11]\ : DFN1P0
      port map(D => \N_DEL_CNTR[11]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[11]\);
    
    \DEL_CNTR[12]\ : DFN1P0
      port map(D => \N_DEL_CNTR[12]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[12]\);
    
    \SEQUENCER_STATE_maj_RNIR2NF1_0[4]\ : NOR3A
      port map(A => N_309, B => N_230_0, C => CH_ACTIVE_STAT, Y
         => N_275);
    
    un1_DEL_CNTR_I_31 : XOR2
      port map(A => \DEL_CNTR[3]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\);
    
    \CH_IAUX_EN_maj[0]\ : MAJ3
      port map(A => \CH_IAUX_EN_1[0]\, B => 
        \CH_IAUX_EN_tmr2_1[0]\, C => \CH_IAUX_EN_tmr3_1[0]\, Y
         => \P_CH_IAUX_EN_c_c[2]\);
    
    un1_DEL_CNTR_I_28 : XOR2
      port map(A => \DEL_CNTR[8]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_7[0]\);
    
    \RET_STATE_tmr2[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIR3MP[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2_1[9]\);
    
    \DEL_CNTR_tmr3[11]\ : DFN1P0
      port map(D => \N_DEL_CNTR[11]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[11]\);
    
    \RET_STATE[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIO0MP[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_1[6]\);
    
    \CH_VOSG_EN_maj_RNIHBN23[1]\ : MX2
      port map(A => \N_CH_VOSG_EN[1]\, B => \P_CH_VOSG_EN_c[3]\, 
        S => N_290, Y => \CH_VOSG_EN_maj_RNIHBN23[1]_net_1\);
    
    un1_DEL_CNTR_I_17 : AND2
      port map(A => \DEL_CNTR[13]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\);
    
    \SEQUENCER_STATE_maj_RNI6DCIF[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_48_0, Y => 
        \N_DEL_CNTR[11]\);
    
    \SEQUENCER_STATE_maj_RNI4I5L[3]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH3A4, C => 
        \SEQUENCER_STATE[3]_net_1\, Y => N_CH_VOSG_EN_2_sqmuxa);
    
    \SEQUENCER_STATE_maj[7]\ : MAJ3
      port map(A => \SEQUENCER_STATE_1[7]\, B => 
        \SEQUENCER_STATE_tmr2_1[7]\, C => 
        \SEQUENCER_STATE_tmr3_1[7]\, Y => 
        \SEQUENCER_STATE[7]_net_1\);
    
    un1_DEL_CNTR_I_7 : AND2
      port map(A => \DEL_CNTR[2]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\);
    
    un1_DEL_CNTR_I_39 : XOR2
      port map(A => \DEL_CNTR[13]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[13]\);
    
    \STDBY_OFFB_B_19\ : MX2
      port map(A => STDBY_OFFB_B, B => STDBY_OFFB_A, S => 
        N_23_i_c, Y => STDBY_OFFB_B_19);
    
    \SEQUENCER_STATE[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_1[6]\);
    
    \SEQUENCER_STATE_maj_RNI79RA_0[4]\ : NOR2
      port map(A => \SEQUENCER_STATE[4]_net_1\, B => 
        \SEQUENCER_STATE[3]_net_1\, Y => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\);
    
    \DEL_CNTR_tmr3[8]\ : DFN1P0
      port map(D => \N_DEL_CNTR[8]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[8]\);
    
    \DEL_CNTR_maj[12]\ : MAJ3
      port map(A => \DEL_CNTR_1[12]\, B => \DEL_CNTR_tmr2_1[12]\, 
        C => \DEL_CNTR_tmr3_1[12]\, Y => \DEL_CNTR[12]_net_1\);
    
    DTYCYC_CNT_n4_i_o2_0 : OR3
      port map(A => DTYCYC_CNT(0), B => DTYCYC_CNT(1), C => 
        DTYCYC_CNT(2), Y => N_15);
    
    un1_DEL_CNTR_I_8 : AND2
      port map(A => \DEL_CNTR[8]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\);
    
    un1_DEL_CNTR_I_21 : XOR2
      port map(A => \DEL_CNTR[13]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\);
    
    \SEQUENCER_STATE_tmr3[3]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIR2NF1[4]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_1[3]\);
    
    \SEQUENCER_STATE_maj_RNII59G[5]\ : OR2
      port map(A => N_222, B => \SEQUENCER_STATE[5]_net_1\, Y => 
        N_225);
    
    \RET_STATE_maj_RNIOCJ51[9]\ : OR3A
      port map(A => \RET_STATE[9]_net_1\, B => 
        \RET_STATE[4]_net_1\, C => N_221, Y => N_246);
    
    \DEL_CNTR_tmr3[4]\ : DFN1P0
      port map(D => \N_DEL_CNTR[4]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[4]\);
    
    \DEL_CNTR_maj_RNIQ6HC[5]\ : NOR3A
      port map(A => un8_del_cntr_4, B => \DEL_CNTR[5]_net_1\, C
         => \DEL_CNTR[6]_net_1\, Y => un8_del_cntr_9);
    
    \CH_VOSG_EN[1]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIHBN23[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_1[1]\);
    
    un1_DEL_CNTR_I_48 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[11]\, B => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\, Y => I_48_0);
    
    un1_DEL_CNTR_I_78 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\);
    
    DTYCYC_CNT_n3_0_x2 : XOR2
      port map(A => N_15, B => DTYCYC_CNT(3), Y => N_18_i);
    
    un1_DEL_CNTR_I_64 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0[0]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1[0]\);
    
    un1_DEL_CNTR_I_50 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[12]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, Y => I_50_0);
    
    \RET_STATE_maj_RNI8TSD5[4]\ : AO1
      port map(A => N_304, B => N_302, C => N_275, Y => 
        \SEQUENCER_STATE_ns[5]\);
    
    \DTYCYC_CNT_22\ : MX2A
      port map(A => N_65, B => DTYCYC_CNT(3), S => 
        N_DTYCYC_CNT_2_sqmuxa, Y => DTYCYC_CNT_22);
    
    un1_DEL_CNTR_I_29 : XOR2
      port map(A => \DEL_CNTR[4]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_3[0]\);
    
    \DEL_CNTR_tmr3[1]\ : DFN1P0
      port map(D => \N_DEL_CNTR[1]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_1[1]\);
    
    \CH_VOSG_EN_maj[0]\ : MAJ3
      port map(A => \CH_VOSG_EN_1[0]\, B => 
        \CH_VOSG_EN_tmr2_1[0]\, C => \CH_VOSG_EN_tmr3_1[0]\, Y
         => \P_CH_VOSG_EN_c[2]\);
    
    \DEBOUNCE.man_en_ch_8to5\ : NOR3C
      port map(A => MAN_EN_CH_8TO5_B, B => MAN_EN_CH_8TO5_c, C
         => MAN_EN_CH_8TO5_A, Y => man_en_ch_8to5);
    
    \SEQUENCER_STATE[7]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIQHEV5[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_1[7]\);
    
    \RET_STATE_tmr3[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIMULP[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3_1[4]\);
    
    \RET_STATE_maj_RNI14PQ1[9]\ : NOR3B
      port map(A => N_290, B => N_236, C => \RET_STATE[9]_net_1\, 
        Y => N_266);
    
    un1_DEL_CNTR_I_56 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[1]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, Y => I_56_0);
    
    un1_DEL_CNTR_I_13 : AND2
      port map(A => \DEL_CNTR[12]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\);
    
    \SEQUENCER_STATE_tmr3[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_1[6]\);
    
    un1_DEL_CNTR_I_88 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2[0]\);
    
    \DEL_CNTR[8]\ : DFN1P0
      port map(D => \N_DEL_CNTR[8]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[8]\);
    
    \DEL_CNTR[2]\ : DFN1P0
      port map(D => \N_DEL_CNTR[2]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_1[2]\);
    
    \STDBY_OFFB_A_16\ : MX2
      port map(A => STDBY_OFFB_A, B => STDBY_OFFB_c, S => 
        N_23_i_c, Y => STDBY_OFFB_A_16);
    
    \SEQUENCER_STATE_maj_RNITO60D[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_55_0, Y => 
        \N_DEL_CNTR[9]\);
    
    \RET_STATE[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIR3MP[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_1[9]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity SLOW_PULSE_EN_GEN is

    port( N_23_i_c             : out   std_logic;
          POR_OUT_TO_SCA_c     : in    std_logic;
          BUF5M_J11_15_TCONN_c : in    std_logic
        );

end SLOW_PULSE_EN_GEN;

architecture DEF_ARCH of SLOW_PULSE_EN_GEN is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component MAJ3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AX1C
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

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AXOI5
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AOI1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal un9_cnt_vallto7_0, \CNT_VAL[6]_net_1\, 
        \CNT_VAL[7]_net_1\, un9_cnt_vallto5_0, \CNT_VAL[4]_net_1\, 
        \CNT_VAL[5]_net_1\, CNT_m6_0_a2_5, CNT_m6_0_a2_3, 
        CNT_m6_0_a2_4, \CNT_VAL[8]_net_1\, CNT_VAL_c1, 
        \CNT_VAL[3]_net_1\, \CNT_VAL[2]_net_1\, un9_cnt_vallt20, 
        un9_cnt_vallt17, un9_cnt_vallto17_0, un9_cnt_vallto19_0, 
        \CNT_VAL[12]_net_1\, un9_cnt_vallt12, un9_cnt_vallto15_1, 
        \CNT_VAL[9]_net_1\, un9_cnt_vallt9, un9_cnt_vallto11_0, 
        un9_cnt_vallt7, CNT_VAL_c2, CNT_VAL_n20, 
        \CNT_VAL[20]_net_1\, CNT_VAL_41_0, \CNT_VAL[19]_net_1\, 
        CNT_VAL_c18, CNT_VAL_n19, un9_cnt_val, CNT_VAL_n18, 
        \CNT_VAL[18]_net_1\, CNT_VAL_c17, CNT_VAL_n17, 
        \CNT_VAL[17]_net_1\, CNT_VAL_c16, CNT_VAL_n16, 
        \CNT_VAL[16]_net_1\, CNT_VAL_c15, CNT_VAL_n15, 
        CNT_VAL_n15_tz, CNT_VAL_n14, CNT_VAL_n14_tz, CNT_VAL_n13, 
        CNT_VAL_n13_tz, CNT_VAL_n12, CNT_VAL_n12_tz, CNT_VAL_n11, 
        CNT_VAL_n11_tz, CNT_VAL_n10, CNT_VAL_n10_tz, CNT_VAL_n9, 
        CNT_VAL_n9_tz, CNT_VAL_n8, CNT_VAL_n8_tz, CNT_VAL_n7, 
        CNT_VAL_n7_tz, CNT_VAL_n6, CNT_VAL_n6_tz, CNT_VAL_n5, 
        CNT_VAL_n5_tz, CNT_VAL_n4, CNT_VAL_n4_tz, CNT_VAL_n3, 
        CNT_VAL_n3_tz, CNT_VAL_n2, CNT_VAL_n2_tz, CNT_VAL_n1, 
        \CNT_VAL[0]_net_1\, \CNT_VAL[1]_net_1\, CNT_VAL_n0, 
        \CNT_VAL[14]_net_1\, CNT_VAL_c13, \CNT_VAL[15]_net_1\, 
        CNT_VAL_c11, \CNT_VAL[13]_net_1\, \CNT_VAL[10]_net_1\, 
        CNT_VAL_c9, \CNT_VAL[11]_net_1\, CNT_VAL_c6, CNT_VAL_c4, 
        \CNT_VAL_0[20]\, \CNT_VAL_tmr2[20]_net_1\, 
        \CNT_VAL_tmr3[20]_net_1\, \CNT_VAL_0[19]\, 
        \CNT_VAL_tmr2[19]_net_1\, \CNT_VAL_tmr3[19]_net_1\, 
        \CNT_VAL_0[18]\, \CNT_VAL_tmr2[18]_net_1\, 
        \CNT_VAL_tmr3[18]_net_1\, \CNT_VAL_0[17]\, 
        \CNT_VAL_tmr2[17]_net_1\, \CNT_VAL_tmr3[17]_net_1\, 
        \CNT_VAL_0[16]\, \CNT_VAL_tmr2[16]_net_1\, 
        \CNT_VAL_tmr3[16]_net_1\, \CNT_VAL_0[15]\, 
        \CNT_VAL_tmr2[15]_net_1\, \CNT_VAL_tmr3[15]_net_1\, 
        \CNT_VAL_0[14]\, \CNT_VAL_tmr2[14]_net_1\, 
        \CNT_VAL_tmr3[14]_net_1\, \CNT_VAL_0[13]\, 
        \CNT_VAL_tmr2[13]_net_1\, \CNT_VAL_tmr3[13]_net_1\, 
        \CNT_VAL_0[12]\, \CNT_VAL_tmr2[12]_net_1\, 
        \CNT_VAL_tmr3[12]_net_1\, \CNT_VAL_0[11]\, 
        \CNT_VAL_tmr2[11]_net_1\, \CNT_VAL_tmr3[11]_net_1\, 
        \CNT_VAL_0[10]\, \CNT_VAL_tmr2[10]_net_1\, 
        \CNT_VAL_tmr3[10]_net_1\, \CNT_VAL_0[9]\, 
        \CNT_VAL_tmr2[9]_net_1\, \CNT_VAL_tmr3[9]_net_1\, 
        \CNT_VAL_0[8]\, \CNT_VAL_tmr2[8]_net_1\, 
        \CNT_VAL_tmr3[8]_net_1\, \CNT_VAL_0[7]\, 
        \CNT_VAL_tmr2[7]_net_1\, \CNT_VAL_tmr3[7]_net_1\, 
        \CNT_VAL_0[6]\, \CNT_VAL_tmr2[6]_net_1\, 
        \CNT_VAL_tmr3[6]_net_1\, \CNT_VAL_0[5]\, 
        \CNT_VAL_tmr2[5]_net_1\, \CNT_VAL_tmr3[5]_net_1\, 
        \CNT_VAL_0[4]\, \CNT_VAL_tmr2[4]_net_1\, 
        \CNT_VAL_tmr3[4]_net_1\, \CNT_VAL_0[3]\, 
        \CNT_VAL_tmr2[3]_net_1\, \CNT_VAL_tmr3[3]_net_1\, 
        \CNT_VAL_0[2]\, \CNT_VAL_tmr2[2]_net_1\, 
        \CNT_VAL_tmr3[2]_net_1\, \CNT_VAL_0[1]\, 
        \CNT_VAL_tmr2[1]_net_1\, \CNT_VAL_tmr3[1]_net_1\, 
        \CNT_VAL_0[0]\, \CNT_VAL_tmr2[0]_net_1\, 
        \CNT_VAL_tmr3[0]_net_1\, \MS250_CLK_EN_SIG\, 
        \MS250_CLK_EN_SIG_tmr2\, \MS250_CLK_EN_SIG_tmr3\, \GND\, 
        \VCC\ : std_logic;

begin 


    \CNT_VAL_tmr3[7]\ : DFN1C0
      port map(D => CNT_VAL_n7, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[7]_net_1\);
    
    \CNT_VAL_maj[16]\ : MAJ3
      port map(A => \CNT_VAL_0[16]\, B => 
        \CNT_VAL_tmr2[16]_net_1\, C => \CNT_VAL_tmr3[16]_net_1\, 
        Y => \CNT_VAL[16]_net_1\);
    
    \CNT_VAL_tmr3[2]\ : DFN1C0
      port map(D => CNT_VAL_n2, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[2]_net_1\);
    
    \CNT_VAL[3]\ : DFN1C0
      port map(D => CNT_VAL_n3, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[3]\);
    
    \CNT_VAL_maj[11]\ : MAJ3
      port map(A => \CNT_VAL_0[11]\, B => 
        \CNT_VAL_tmr2[11]_net_1\, C => \CNT_VAL_tmr3[11]_net_1\, 
        Y => \CNT_VAL[11]_net_1\);
    
    \CNT_VAL_maj[15]\ : MAJ3
      port map(A => \CNT_VAL_0[15]\, B => 
        \CNT_VAL_tmr2[15]_net_1\, C => \CNT_VAL_tmr3[15]_net_1\, 
        Y => \CNT_VAL[15]_net_1\);
    
    \CNT_VAL_maj_RNILO1N[18]\ : NOR2
      port map(A => \CNT_VAL[18]_net_1\, B => \CNT_VAL[19]_net_1\, 
        Y => un9_cnt_vallto19_0);
    
    \CNT_VAL_tmr2[10]\ : DFN1C0
      port map(D => CNT_VAL_n10, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[10]_net_1\);
    
    \CNT_VAL_maj_RNIOF8T7[8]\ : NOR2A
      port map(A => CNT_VAL_n8_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n8);
    
    \CNT_VAL_maj_RNIF5AD[6]\ : OR2B
      port map(A => \CNT_VAL[6]_net_1\, B => \CNT_VAL[7]_net_1\, 
        Y => un9_cnt_vallto7_0);
    
    \CNT_VAL_maj[8]\ : MAJ3
      port map(A => \CNT_VAL_0[8]\, B => \CNT_VAL_tmr2[8]_net_1\, 
        C => \CNT_VAL_tmr3[8]_net_1\, Y => \CNT_VAL[8]_net_1\);
    
    \CNT_VAL_tmr2[18]\ : DFN1C0
      port map(D => CNT_VAL_n18, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[18]_net_1\);
    
    \CNT_VAL[17]\ : DFN1C0
      port map(D => CNT_VAL_n17, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[17]\);
    
    \CNT_VAL_maj_RNIRI5S3[14]\ : XOR2
      port map(A => CNT_VAL_c13, B => \CNT_VAL[14]_net_1\, Y => 
        CNT_VAL_n14_tz);
    
    \CNT_VAL_tmr2[5]\ : DFN1C0
      port map(D => CNT_VAL_n5, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[5]_net_1\);
    
    \CNT_VAL_tmr2[19]\ : DFN1C0
      port map(D => CNT_VAL_n19, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[19]_net_1\);
    
    \CNT_VAL_maj[3]\ : MAJ3
      port map(A => \CNT_VAL_0[3]\, B => \CNT_VAL_tmr2[3]_net_1\, 
        C => \CNT_VAL_tmr3[3]_net_1\, Y => \CNT_VAL[3]_net_1\);
    
    \CNT_VAL_tmr3[6]\ : DFN1C0
      port map(D => CNT_VAL_n6, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[6]_net_1\);
    
    \CNT_VAL[14]\ : DFN1C0
      port map(D => CNT_VAL_n14, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[14]\);
    
    \CNT_VAL_tmr2[16]\ : DFN1C0
      port map(D => CNT_VAL_n16, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[16]_net_1\);
    
    \CNT_VAL_maj[20]\ : MAJ3
      port map(A => \CNT_VAL_0[20]\, B => 
        \CNT_VAL_tmr2[20]_net_1\, C => \CNT_VAL_tmr3[20]_net_1\, 
        Y => \CNT_VAL[20]_net_1\);
    
    \CNT_VAL_tmr3[3]\ : DFN1C0
      port map(D => CNT_VAL_n3, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[3]_net_1\);
    
    \CNT_VAL_maj_RNIEE30B[17]\ : XA1B
      port map(A => \CNT_VAL[17]_net_1\, B => CNT_VAL_c16, C => 
        un9_cnt_val, Y => CNT_VAL_n17);
    
    \CNT_VAL_tmr2[8]\ : DFN1C0
      port map(D => CNT_VAL_n8, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[8]_net_1\);
    
    \CNT_VAL_maj_RNIS3911[6]\ : NOR3C
      port map(A => \CNT_VAL[6]_net_1\, B => \CNT_VAL[5]_net_1\, 
        C => CNT_m6_0_a2_3, Y => CNT_m6_0_a2_5);
    
    \CNT_VAL_tmr3[15]\ : DFN1C0
      port map(D => CNT_VAL_n15, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[15]_net_1\);
    
    \CNT_VAL_tmr2[2]\ : DFN1C0
      port map(D => CNT_VAL_n2, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[2]_net_1\);
    
    \CNT_VAL_maj_RNISEJP2_0[11]\ : AX1C
      port map(A => \CNT_VAL[10]_net_1\, B => CNT_VAL_c9, C => 
        \CNT_VAL[11]_net_1\, Y => CNT_VAL_n11_tz);
    
    \CNT_VAL_maj[2]\ : MAJ3
      port map(A => \CNT_VAL_0[2]\, B => \CNT_VAL_tmr2[2]_net_1\, 
        C => \CNT_VAL_tmr3[2]_net_1\, Y => \CNT_VAL[2]_net_1\);
    
    \CNT_VAL_tmr3[13]\ : DFN1C0
      port map(D => CNT_VAL_n13, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[13]_net_1\);
    
    \CNT_VAL[7]\ : DFN1C0
      port map(D => CNT_VAL_n7, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[7]\);
    
    \CNT_VAL_maj_RNI61HT9[14]\ : NOR2A
      port map(A => CNT_VAL_n14_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n14);
    
    \CNT_VAL[15]\ : DFN1C0
      port map(D => CNT_VAL_n15, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[15]\);
    
    \CNT_VAL_tmr2[3]\ : DFN1C0
      port map(D => CNT_VAL_n3, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[3]_net_1\);
    
    \CNT_VAL_maj[13]\ : MAJ3
      port map(A => \CNT_VAL_0[13]\, B => 
        \CNT_VAL_tmr2[13]_net_1\, C => \CNT_VAL_tmr3[13]_net_1\, 
        Y => \CNT_VAL[13]_net_1\);
    
    \CNT_VAL[11]\ : DFN1C0
      port map(D => CNT_VAL_n11, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[11]\);
    
    \CNT_VAL_maj_RNIH5AL6[2]\ : NOR2A
      port map(A => CNT_VAL_n2_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n2);
    
    \CNT_VAL_tmr3[5]\ : DFN1C0
      port map(D => CNT_VAL_n5, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[5]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \CNT_VAL_maj_RNIIBM74[15]\ : NOR3C
      port map(A => \CNT_VAL[14]_net_1\, B => CNT_VAL_c13, C => 
        \CNT_VAL[15]_net_1\, Y => CNT_VAL_c15);
    
    \CNT_VAL_tmr3[11]\ : DFN1C0
      port map(D => CNT_VAL_n11, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[11]_net_1\);
    
    \CNT_VAL_maj_RNIRIF69[12]\ : NOR2A
      port map(A => CNT_VAL_n12_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n12);
    
    \CNT_VAL_maj_RNIIBM74_0[15]\ : AX1C
      port map(A => \CNT_VAL[14]_net_1\, B => CNT_VAL_c13, C => 
        \CNT_VAL[15]_net_1\, Y => CNT_VAL_n15_tz);
    
    \CNT_VAL_maj[6]\ : MAJ3
      port map(A => \CNT_VAL_0[6]\, B => \CNT_VAL_tmr2[6]_net_1\, 
        C => \CNT_VAL_tmr3[6]_net_1\, Y => \CNT_VAL[6]_net_1\);
    
    \CNT_VAL[9]\ : DFN1C0
      port map(D => CNT_VAL_n9, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[9]\);
    
    \CNT_VAL_maj[17]\ : MAJ3
      port map(A => \CNT_VAL_0[17]\, B => 
        \CNT_VAL_tmr2[17]_net_1\, C => \CNT_VAL_tmr3[17]_net_1\, 
        Y => \CNT_VAL[17]_net_1\);
    
    \CNT_VAL_maj_RNIK8EF8[10]\ : NOR2A
      port map(A => CNT_VAL_n10_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n10);
    
    \CNT_VAL_maj_RNI78UF7[6]\ : NOR2A
      port map(A => CNT_VAL_n6_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n6);
    
    \CNT_VAL_maj_RNIA57J4[16]\ : NOR2B
      port map(A => CNT_VAL_c15, B => \CNT_VAL[16]_net_1\, Y => 
        CNT_VAL_c16);
    
    \CNT_VAL_maj_RNIIBM74[12]\ : OA1A
      port map(A => \CNT_VAL[12]_net_1\, B => un9_cnt_vallt12, C
         => un9_cnt_vallto15_1, Y => un9_cnt_vallt17);
    
    \CNT_VAL_maj_RNI2LT38[9]\ : NOR2A
      port map(A => CNT_VAL_n9_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n9);
    
    \CNT_VAL_maj_RNI9Q2E2[10]\ : XOR2
      port map(A => CNT_VAL_c9, B => \CNT_VAL[10]_net_1\, Y => 
        CNT_VAL_n10_tz);
    
    \CNT_VAL[4]\ : DFN1C0
      port map(D => CNT_VAL_n4, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[4]\);
    
    MS250_CLK_EN_SIG_tmr2 : DFN1C0
      port map(D => un9_cnt_val, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \MS250_CLK_EN_SIG_tmr2\);
    
    \CNT_VAL[5]\ : DFN1C0
      port map(D => CNT_VAL_n5, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[5]\);
    
    \CNT_VAL_maj_RNIQ4K27[4]\ : NOR2A
      port map(A => CNT_VAL_n4_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n4);
    
    \CNT_VAL_tmr3[1]\ : DFN1C0
      port map(D => CNT_VAL_n1, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[1]_net_1\);
    
    \CNT_VAL_maj_RNI4T7L1[7]\ : XOR2
      port map(A => CNT_VAL_c6, B => \CNT_VAL[7]_net_1\, Y => 
        CNT_VAL_n7_tz);
    
    \CNT_VAL_maj_RNILJIKA[16]\ : XA1B
      port map(A => \CNT_VAL[16]_net_1\, B => CNT_VAL_c15, C => 
        un9_cnt_val, Y => CNT_VAL_n16);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \CNT_VAL_maj[14]\ : MAJ3
      port map(A => \CNT_VAL_0[14]\, B => 
        \CNT_VAL_tmr2[14]_net_1\, C => \CNT_VAL_tmr3[14]_net_1\, 
        Y => \CNT_VAL[14]_net_1\);
    
    \CNT_VAL_tmr3[14]\ : DFN1C0
      port map(D => CNT_VAL_n14, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[14]_net_1\);
    
    \CNT_VAL_tmr3[20]\ : DFN1C0
      port map(D => CNT_VAL_n20, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[20]_net_1\);
    
    \CNT_VAL_maj_RNID1TR1[8]\ : OA1B
      port map(A => un9_cnt_vallt7, B => un9_cnt_vallto7_0, C => 
        \CNT_VAL[8]_net_1\, Y => un9_cnt_vallt9);
    
    \CNT_VAL_maj_RNIOOPL5[12]\ : OA1
      port map(A => un9_cnt_vallt17, B => un9_cnt_vallto17_0, C
         => un9_cnt_vallto19_0, Y => un9_cnt_vallt20);
    
    \CNT_VAL_tmr2[20]\ : DFN1C0
      port map(D => CNT_VAL_n20, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[20]_net_1\);
    
    \CNT_VAL_maj_RNI5RKG3[13]\ : NOR3C
      port map(A => \CNT_VAL[12]_net_1\, B => CNT_VAL_c11, C => 
        \CNT_VAL[13]_net_1\, Y => CNT_VAL_c13);
    
    \CNT_VAL_maj_RNI581N[11]\ : NOR2
      port map(A => \CNT_VAL[10]_net_1\, B => \CNT_VAL[11]_net_1\, 
        Y => un9_cnt_vallto11_0);
    
    \CNT_VAL[18]\ : DFN1C0
      port map(D => CNT_VAL_n18, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[18]\);
    
    \CNT_VAL_maj_RNIFBJM7[7]\ : NOR2A
      port map(A => CNT_VAL_n7_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n7);
    
    \CNT_VAL_maj_RNIAMJQ[3]\ : XOR2
      port map(A => CNT_VAL_c2, B => \CNT_VAL[3]_net_1\, Y => 
        CNT_VAL_n3_tz);
    
    \CNT_VAL_tmr3[12]\ : DFN1C0
      port map(D => CNT_VAL_n12, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[12]_net_1\);
    
    \CNT_VAL_maj_RNI375NB[20]\ : AXOI5
      port map(A => un9_cnt_vallt20, B => \CNT_VAL[20]_net_1\, C
         => CNT_VAL_41_0, Y => CNT_VAL_n20);
    
    \CNT_VAL_maj[10]\ : MAJ3
      port map(A => \CNT_VAL_0[10]\, B => 
        \CNT_VAL_tmr2[10]_net_1\, C => \CNT_VAL_tmr3[10]_net_1\, 
        Y => \CNT_VAL[10]_net_1\);
    
    \CNT_VAL[0]\ : DFN1C0
      port map(D => CNT_VAL_n0, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[0]\);
    
    \CNT_VAL[16]\ : DFN1C0
      port map(D => CNT_VAL_n16, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[16]\);
    
    \CNT_VAL_maj_RNI5RKG3_0[13]\ : AX1C
      port map(A => \CNT_VAL[12]_net_1\, B => CNT_VAL_c11, C => 
        \CNT_VAL[13]_net_1\, Y => CNT_VAL_n13_tz);
    
    \CNT_VAL_tmr2[1]\ : DFN1C0
      port map(D => CNT_VAL_n1, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[1]_net_1\);
    
    \CNT_VAL_maj_RNI375NB[19]\ : XA1B
      port map(A => \CNT_VAL[19]_net_1\, B => CNT_VAL_c18, C => 
        un9_cnt_val, Y => CNT_VAL_n19);
    
    \CNT_VAL[19]\ : DFN1C0
      port map(D => CNT_VAL_n19, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[19]\);
    
    \CNT_VAL_tmr2[6]\ : DFN1C0
      port map(D => CNT_VAL_n6, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[6]_net_1\);
    
    \CNT_VAL_maj_RNIN6I22[9]\ : NOR3C
      port map(A => CNT_m6_0_a2_4, B => CNT_m6_0_a2_5, C => 
        \CNT_VAL[9]_net_1\, Y => CNT_VAL_c9);
    
    \CNT_VAL[12]\ : DFN1C0
      port map(D => CNT_VAL_n12, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[12]\);
    
    \CNT_VAL_maj_RNISPIE1[6]\ : NOR3C
      port map(A => \CNT_VAL[5]_net_1\, B => CNT_VAL_c4, C => 
        \CNT_VAL[6]_net_1\, Y => CNT_VAL_c6);
    
    \CNT_VAL_maj_RNIOOPL5[19]\ : NOR2B
      port map(A => \CNT_VAL[19]_net_1\, B => CNT_VAL_c18, Y => 
        CNT_VAL_41_0);
    
    \CNT_VAL_tmr3[17]\ : DFN1C0
      port map(D => CNT_VAL_n17, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[17]_net_1\);
    
    \CNT_VAL_maj_RNIFM811_0[4]\ : AX1C
      port map(A => \CNT_VAL[3]_net_1\, B => CNT_VAL_c2, C => 
        \CNT_VAL[4]_net_1\, Y => CNT_VAL_n4_tz);
    
    MS250_CLK_EN_SIG_tmr3 : DFN1C0
      port map(D => un9_cnt_val, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \MS250_CLK_EN_SIG_tmr3\);
    
    \CNT_VAL_maj_RNI27I21[13]\ : NOR3
      port map(A => \CNT_VAL[14]_net_1\, B => \CNT_VAL[13]_net_1\, 
        C => \CNT_VAL[15]_net_1\, Y => un9_cnt_vallto15_1);
    
    \CNT_VAL_tmr2[15]\ : DFN1C0
      port map(D => CNT_VAL_n15, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[15]_net_1\);
    
    \CNT_VAL_tmr3[0]\ : DFN1C0
      port map(D => CNT_VAL_n0, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[0]_net_1\);
    
    \CNT_VAL_maj_RNIN6I22_0[9]\ : AX1C
      port map(A => CNT_m6_0_a2_4, B => CNT_m6_0_a2_5, C => 
        \CNT_VAL[9]_net_1\, Y => CNT_VAL_n9_tz);
    
    \CNT_VAL_tmr2[13]\ : DFN1C0
      port map(D => CNT_VAL_n13, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[13]_net_1\);
    
    \CNT_VAL[6]\ : DFN1C0
      port map(D => CNT_VAL_n6, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[6]\);
    
    \CNT_VAL_tmr3[10]\ : DFN1C0
      port map(D => CNT_VAL_n10, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[10]_net_1\);
    
    \CNT_VAL_tmr3[18]\ : DFN1C0
      port map(D => CNT_VAL_n18, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[18]_net_1\);
    
    \CNT_VAL[10]\ : DFN1C0
      port map(D => CNT_VAL_n10, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[10]\);
    
    \CNT_VAL[2]\ : DFN1C0
      port map(D => CNT_VAL_n2, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[2]\);
    
    \CNT_VAL_tmr2[11]\ : DFN1C0
      port map(D => CNT_VAL_n11, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[11]_net_1\);
    
    MS250_CLK_EN_SIG_maj : MAJ3
      port map(A => \MS250_CLK_EN_SIG\, B => 
        \MS250_CLK_EN_SIG_tmr2\, C => \MS250_CLK_EN_SIG_tmr3\, Y
         => N_23_i_c);
    
    \CNT_VAL_tmr3[19]\ : DFN1C0
      port map(D => CNT_VAL_n19, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[19]_net_1\);
    
    \CNT_VAL_maj[4]\ : MAJ3
      port map(A => \CNT_VAL_0[4]\, B => \CNT_VAL_tmr2[4]_net_1\, 
        C => \CNT_VAL_tmr3[4]_net_1\, Y => \CNT_VAL[4]_net_1\);
    
    \CNT_VAL_maj_RNIF0VJ[2]\ : NOR3C
      port map(A => \CNT_VAL[3]_net_1\, B => \CNT_VAL[2]_net_1\, 
        C => \CNT_VAL[7]_net_1\, Y => CNT_m6_0_a2_3);
    
    \CNT_VAL_maj_RNID1TR1_0[8]\ : AX1C
      port map(A => \CNT_VAL[7]_net_1\, B => CNT_VAL_c6, C => 
        \CNT_VAL[8]_net_1\, Y => CNT_VAL_n8_tz);
    
    \CNT_VAL_maj[19]\ : MAJ3
      port map(A => \CNT_VAL_0[19]\, B => 
        \CNT_VAL_tmr2[19]_net_1\, C => \CNT_VAL_tmr3[19]_net_1\, 
        Y => \CNT_VAL[19]_net_1\);
    
    \CNT_VAL_tmr3[8]\ : DFN1C0
      port map(D => CNT_VAL_n8, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[8]_net_1\);
    
    \CNT_VAL_maj_RNITP19A[15]\ : NOR2A
      port map(A => CNT_VAL_n15_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n15);
    
    \CNT_VAL_maj_RNIB1AD[4]\ : NOR2
      port map(A => \CNT_VAL[4]_net_1\, B => \CNT_VAL[5]_net_1\, 
        Y => un9_cnt_vallto5_0);
    
    \CNT_VAL_tmr2[4]\ : DFN1C0
      port map(D => CNT_VAL_n4, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[4]_net_1\);
    
    \CNT_VAL_tmr3[16]\ : DFN1C0
      port map(D => CNT_VAL_n16, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[16]_net_1\);
    
    \CNT_VAL_maj[9]\ : MAJ3
      port map(A => \CNT_VAL_0[9]\, B => \CNT_VAL_tmr2[9]_net_1\, 
        C => \CNT_VAL_tmr3[9]_net_1\, Y => \CNT_VAL[9]_net_1\);
    
    \CNT_VAL[8]\ : DFN1C0
      port map(D => CNT_VAL_n8, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[8]\);
    
    \CNT_VAL[13]\ : DFN1C0
      port map(D => CNT_VAL_n13, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[13]\);
    
    \CNT_VAL_maj_RNIL4VR6[3]\ : NOR2A
      port map(A => CNT_VAL_n3_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n3);
    
    \CNT_VAL_maj_RNI8AKBB[18]\ : XA1B
      port map(A => \CNT_VAL[18]_net_1\, B => CNT_VAL_c17, C => 
        un9_cnt_val, Y => CNT_VAL_n18);
    
    \CNT_VAL_maj_RNI06997[5]\ : NOR2A
      port map(A => CNT_VAL_n5_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n5);
    
    \CNT_VAL_maj_RNISEJP2[9]\ : OA1A
      port map(A => \CNT_VAL[9]_net_1\, B => un9_cnt_vallt9, C
         => un9_cnt_vallto11_0, Y => un9_cnt_vallt12);
    
    \CNT_VAL_maj_RNIFM811[4]\ : NOR3C
      port map(A => \CNT_VAL[3]_net_1\, B => CNT_VAL_c2, C => 
        \CNT_VAL[4]_net_1\, Y => CNT_VAL_c4);
    
    \CNT_VAL_maj_RNIG90I9[13]\ : NOR2A
      port map(A => CNT_VAL_n13_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n13);
    
    \CNT_VAL_tmr3[9]\ : DFN1C0
      port map(D => CNT_VAL_n9, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[9]_net_1\);
    
    \CNT_VAL_maj_RNI7TUQ8[11]\ : NOR2A
      port map(A => CNT_VAL_n11_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n11);
    
    \CNT_VAL_tmr2[14]\ : DFN1C0
      port map(D => CNT_VAL_n14, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[14]_net_1\);
    
    \CNT_VAL_maj_RNIHTJQ[8]\ : NOR3C
      port map(A => \CNT_VAL[4]_net_1\, B => \CNT_VAL[8]_net_1\, 
        C => CNT_VAL_c1, Y => CNT_m6_0_a2_4);
    
    \CNT_VAL_maj[12]\ : MAJ3
      port map(A => \CNT_VAL_0[12]\, B => 
        \CNT_VAL_tmr2[12]_net_1\, C => \CNT_VAL_tmr3[12]_net_1\, 
        Y => \CNT_VAL[12]_net_1\);
    
    \CNT_VAL_tmr2[7]\ : DFN1C0
      port map(D => CNT_VAL_n7, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[7]_net_1\);
    
    \CNT_VAL_maj_RNICA086[0]\ : NOR2
      port map(A => \CNT_VAL[0]_net_1\, B => un9_cnt_val, Y => 
        CNT_VAL_n0);
    
    \CNT_VAL[1]\ : DFN1C0
      port map(D => CNT_VAL_n1, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[1]\);
    
    \CNT_VAL_maj[18]\ : MAJ3
      port map(A => \CNT_VAL_0[18]\, B => 
        \CNT_VAL_tmr2[18]_net_1\, C => \CNT_VAL_tmr3[18]_net_1\, 
        Y => \CNT_VAL[18]_net_1\);
    
    \CNT_VAL_maj_RNIE7LE6[1]\ : XA1B
      port map(A => \CNT_VAL[0]_net_1\, B => \CNT_VAL[1]_net_1\, 
        C => un9_cnt_val, Y => CNT_VAL_n1);
    
    \CNT_VAL_maj_RNI3P9D[1]\ : NOR2B
      port map(A => \CNT_VAL[0]_net_1\, B => \CNT_VAL[1]_net_1\, 
        Y => CNT_VAL_c1);
    
    \CNT_VAL_maj[5]\ : MAJ3
      port map(A => \CNT_VAL_0[5]\, B => \CNT_VAL_tmr2[5]_net_1\, 
        C => \CNT_VAL_tmr3[5]_net_1\, Y => \CNT_VAL[5]_net_1\);
    
    \CNT_VAL_maj[7]\ : MAJ3
      port map(A => \CNT_VAL_0[7]\, B => \CNT_VAL_tmr2[7]_net_1\, 
        C => \CNT_VAL_tmr3[7]_net_1\, Y => \CNT_VAL[7]_net_1\);
    
    \CNT_VAL_maj_RNILNT71[5]\ : XOR2
      port map(A => CNT_VAL_c4, B => \CNT_VAL[5]_net_1\, Y => 
        CNT_VAL_n5_tz);
    
    \CNT_VAL_maj_RNI30OU4[17]\ : NOR2B
      port map(A => CNT_VAL_c16, B => \CNT_VAL[17]_net_1\, Y => 
        CNT_VAL_c17);
    
    \CNT_VAL_tmr3[4]\ : DFN1C0
      port map(D => CNT_VAL_n4, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr3[4]_net_1\);
    
    \CNT_VAL_maj_RNIG4453[12]\ : XOR2
      port map(A => CNT_VAL_c11, B => \CNT_VAL[12]_net_1\, Y => 
        CNT_VAL_n12_tz);
    
    \CNT_VAL_maj_RNIBEB16[20]\ : NOR2A
      port map(A => \CNT_VAL[20]_net_1\, B => un9_cnt_vallt20, Y
         => un9_cnt_val);
    
    \CNT_VAL_tmr2[12]\ : DFN1C0
      port map(D => CNT_VAL_n12, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[12]_net_1\);
    
    \CNT_VAL_tmr2[9]\ : DFN1C0
      port map(D => CNT_VAL_n9, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[9]_net_1\);
    
    \CNT_VAL_maj_RNIHK1N[16]\ : OR2B
      port map(A => \CNT_VAL[16]_net_1\, B => \CNT_VAL[17]_net_1\, 
        Y => un9_cnt_vallto17_0);
    
    \CNT_VAL_maj_RNI6NUJ[2]\ : XOR2
      port map(A => CNT_VAL_c1, B => \CNT_VAL[2]_net_1\, Y => 
        CNT_VAL_n2_tz);
    
    \CNT_VAL_maj_RNILNT71[3]\ : AOI1B
      port map(A => CNT_VAL_c2, B => \CNT_VAL[3]_net_1\, C => 
        un9_cnt_vallto5_0, Y => un9_cnt_vallt7);
    
    \CNT_VAL_maj_RNISEJP2[11]\ : NOR3C
      port map(A => \CNT_VAL[10]_net_1\, B => CNT_VAL_c9, C => 
        \CNT_VAL[11]_net_1\, Y => CNT_VAL_c11);
    
    \CNT_VAL_maj_RNITR8A5[18]\ : NOR2B
      port map(A => CNT_VAL_c17, B => \CNT_VAL[18]_net_1\, Y => 
        CNT_VAL_c18);
    
    MS250_CLK_EN_SIG : DFN1C0
      port map(D => un9_cnt_val, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \MS250_CLK_EN_SIG\);
    
    \CNT_VAL_tmr2[17]\ : DFN1C0
      port map(D => CNT_VAL_n17, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[17]_net_1\);
    
    \CNT_VAL_maj[1]\ : MAJ3
      port map(A => \CNT_VAL_0[1]\, B => \CNT_VAL_tmr2[1]_net_1\, 
        C => \CNT_VAL_tmr3[1]_net_1\, Y => \CNT_VAL[1]_net_1\);
    
    \CNT_VAL_maj[0]\ : MAJ3
      port map(A => \CNT_VAL_0[0]\, B => \CNT_VAL_tmr2[0]_net_1\, 
        C => \CNT_VAL_tmr3[0]_net_1\, Y => \CNT_VAL[0]_net_1\);
    
    \CNT_VAL_maj_RNI6NUJ_0[2]\ : NOR2B
      port map(A => CNT_VAL_c1, B => \CNT_VAL[2]_net_1\, Y => 
        CNT_VAL_c2);
    
    \CNT_VAL_maj_RNISPIE1_0[6]\ : AX1C
      port map(A => \CNT_VAL[5]_net_1\, B => CNT_VAL_c4, C => 
        \CNT_VAL[6]_net_1\, Y => CNT_VAL_n6_tz);
    
    \CNT_VAL_tmr2[0]\ : DFN1C0
      port map(D => CNT_VAL_n0, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_tmr2[0]_net_1\);
    
    \CNT_VAL[20]\ : DFN1C0
      port map(D => CNT_VAL_n20, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \CNT_VAL_0[20]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity MAIN_SEQUENCER_NEW_3 is

    port( REGISTER_CH_CMD_CH_0 : in    std_logic;
          P_CH_IAUX_EN_c_c_0   : out   std_logic;
          P_CH_MREG_EN_c_c_0   : out   std_logic;
          P_CH_VOSG_EN_c       : out   std_logic_vector(1 downto 0);
          N_CH_VOSG_EN_7_1_0   : in    std_logic;
          POR_OUT_TO_SCA_c     : in    std_logic;
          BUF5M_J11_15_TCONN_c : in    std_logic;
          STATUS_LED_c         : in    std_logic;
          CH1_2_MS_CFG_EN_c    : in    std_logic;
          CH_ACTIVE_STAT       : out   std_logic;
          STDBY_OFFB_B         : in    std_logic;
          UVL_OK_CH1A2         : in    std_logic;
          STATUS_LED_c_0       : in    std_logic
        );

end MAIN_SEQUENCER_NEW_3;

architecture DEF_ARCH of MAIN_SEQUENCER_NEW_3 is 

  component NOR3B
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

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component MAJ3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component OR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1D
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component OA1B
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

  component NOR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MIN3X
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AOI1
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

  component OA1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_230_0, \SEQUENCER_STATE[4]_net_1\, 
        \SEQUENCER_STATE[3]_net_1\, N_304, \RET_STATE[4]_net_1\, 
        N_221, \SEQUENCER_STATE_ns_i_1[2]\, N_246, 
        \SEQUENCER_STATE[9]_net_1\, 
        \SEQUENCER_STATE_ns_i_0[2]_net_1\, un8_del_cntr_11, 
        un8_del_cntr_2, un8_del_cntr_1, un8_del_cntr_7, 
        un8_del_cntr_10, un8_del_cntr_6, \DEL_CNTR[9]_net_1\, 
        \DEL_CNTR[10]_net_1\, un8_del_cntr_9, un8_del_cntr_4, 
        \DEL_CNTR[0]_net_1\, \DEL_CNTR[2]_net_1\, 
        \DEL_CNTR[3]_net_1\, \DEL_CNTR[14]_net_1\, 
        \DEL_CNTR[13]_net_1\, \DEL_CNTR[12]_net_1\, 
        \DEL_CNTR[11]_net_1\, \DEL_CNTR[8]_net_1\, 
        \DEL_CNTR[7]_net_1\, \DEL_CNTR[6]_net_1\, 
        \DEL_CNTR[1]_net_1\, \DEL_CNTR[4]_net_1\, 
        \DEL_CNTR[5]_net_1\, \RET_STATE_0_a3_0[5]\, 
        \RET_STATE[5]_net_1\, \SEQUENCER_STATE[5]_net_1\, 
        \RET_STATE_0_a3_0[6]\, \RET_STATE[6]_net_1\, 
        \SEQUENCER_STATE[6]_net_1\, \CH_ACTIVE_STAT_maj_RNIF8952\, 
        CH_ACTIVE_STAT_net_1, N_309, un8_del_cntr, 
        \RET_STATE[9]_net_1\, \RET_STATE_maj_RNIGJ2Q8[9]_net_1\, 
        N_315, \SEQUENCER_STATE_maj_RNIIGAE2[8]_net_1\, N_266, 
        \SEQUENCER_STATE_maj_RNIPRAE6[9]_net_1\, N_271, N_313, 
        N_275, N_236, \SEQUENCER_STATE[8]_net_1\, 
        \SEQUENCER_STATE_ns[3]\, N_302, N_299, 
        \SEQUENCER_STATE_ns[4]\, N_298, 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, N_225, N_222, 
        \SEQUENCER_STATE[7]_net_1\, \SEQUENCER_STATE_ns[5]\, 
        \SEQUENCER_STATE_maj_RNI6U2I1[5]_net_1\, 
        \SEQUENCER_STATE_maj_RNI7V2I1[6]_net_1\, 
        \SEQUENCER_STATE_maj_RNI803I1[5]_net_1\, N_290, N_285, 
        \RET_STATE_maj_RNIB33I1[9]_net_1\, \N_DEL_CNTR[14]\, I_58, 
        \N_DEL_CNTR[13]\, I_60, \N_DEL_CNTR[12]\, I_50, 
        \N_DEL_CNTR[11]\, I_48, \N_DEL_CNTR[10]\, I_54, 
        \N_DEL_CNTR[9]\, I_55, \N_DEL_CNTR[8]\, I_57, 
        \N_DEL_CNTR[7]\, I_59, \N_DEL_CNTR[6]\, I_49, 
        \N_DEL_CNTR[5]\, I_62, \N_DEL_CNTR[4]\, I_53, 
        \N_DEL_CNTR[3]\, I_51, \N_DEL_CNTR[2]\, I_52, 
        \N_DEL_CNTR[1]\, I_56, \N_DEL_CNTR[0]\, 
        \DWACT_ADD_CI_0_partial_sum[0]\, \N_CH_VOSG_EN_7[1]\, 
        \N_CH_VOSG_EN[1]\, N_312, N_CH_VOSG_EN_2_sqmuxa, 
        \N_CH_VOSG_EN[0]\, N_CH_IAUX_EN_1_sqmuxa, 
        N_CH_MREG_EN_1_sqmuxa, \CH_VOSG_EN_maj_RNIFR854[1]_net_1\, 
        \P_CH_VOSG_EN_c[1]\, \CH_VOSG_EN_maj_RNIDKMT3[0]_net_1\, 
        \P_CH_VOSG_EN_c[0]\, \CH_MREG_EN_maj_RNIUVMI3[0]_net_1\, 
        \P_CH_MREG_EN_c_c[0]\, \CH_IAUX_EN_maj_RNI814V2[0]_net_1\, 
        \P_CH_IAUX_EN_c_c[0]\, \RET_STATE_2[4]\, 
        \RET_STATE_tmr2_2[4]\, \RET_STATE_tmr3_2[4]\, 
        \RET_STATE_2[5]\, \RET_STATE_tmr2_2[5]\, 
        \RET_STATE_tmr3_2[5]\, \RET_STATE_2[6]\, 
        \RET_STATE_tmr2_2[6]\, \RET_STATE_tmr3_2[6]\, 
        \RET_STATE_2[9]\, \RET_STATE_tmr2_2[9]\, 
        \RET_STATE_tmr3_2[9]\, \CH_VOSG_EN_2[1]\, 
        \CH_VOSG_EN_tmr2_2[1]\, \CH_VOSG_EN_tmr3_2[1]\, 
        \CH_VOSG_EN_2[0]\, \CH_VOSG_EN_tmr2_2[0]\, 
        \CH_VOSG_EN_tmr3_2[0]\, \SEQUENCER_STATE_2[3]\, 
        \SEQUENCER_STATE_tmr2_2[3]\, \SEQUENCER_STATE_tmr3_2[3]\, 
        \SEQUENCER_STATE_2[4]\, \SEQUENCER_STATE_tmr2_2[4]\, 
        \SEQUENCER_STATE_tmr3_2[4]\, \SEQUENCER_STATE_2[5]\, 
        \SEQUENCER_STATE_tmr2_2[5]\, \SEQUENCER_STATE_tmr3_2[5]\, 
        \SEQUENCER_STATE_2[6]\, \SEQUENCER_STATE_tmr2_2[6]\, 
        \SEQUENCER_STATE_tmr3_2[6]\, \SEQUENCER_STATE_2[7]\, 
        \SEQUENCER_STATE_tmr2_2[7]\, \SEQUENCER_STATE_tmr3_2[7]\, 
        \SEQUENCER_STATE_2[8]\, \SEQUENCER_STATE_tmr2_2[8]\, 
        \SEQUENCER_STATE_tmr3_2[8]\, \SEQUENCER_STATE_2[9]\, 
        \SEQUENCER_STATE_tmr2_2[9]\, \SEQUENCER_STATE_tmr3_2[9]\, 
        \CH_IAUX_EN_2[0]\, \CH_IAUX_EN_tmr2_2[0]\, 
        \CH_IAUX_EN_tmr3_2[0]\, \CH_MREG_EN_2[0]\, 
        \CH_MREG_EN_tmr2_2[0]\, \CH_MREG_EN_tmr3_2[0]\, 
        \DEL_CNTR_2[14]\, \DEL_CNTR_tmr2_2[14]\, 
        \DEL_CNTR_tmr3_2[14]\, \DEL_CNTR_2[13]\, 
        \DEL_CNTR_tmr2_2[13]\, \DEL_CNTR_tmr3_2[13]\, 
        \DEL_CNTR_2[12]\, \DEL_CNTR_tmr2_2[12]\, 
        \DEL_CNTR_tmr3_2[12]\, \DEL_CNTR_2[11]\, 
        \DEL_CNTR_tmr2_2[11]\, \DEL_CNTR_tmr3_2[11]\, 
        \DEL_CNTR_2[10]\, \DEL_CNTR_tmr2_2[10]\, 
        \DEL_CNTR_tmr3_2[10]\, \DEL_CNTR_2[9]\, 
        \DEL_CNTR_tmr2_2[9]\, \DEL_CNTR_tmr3_2[9]\, 
        \DEL_CNTR_2[8]\, \DEL_CNTR_tmr2_2[8]\, 
        \DEL_CNTR_tmr3_2[8]\, \DEL_CNTR_2[7]\, 
        \DEL_CNTR_tmr2_2[7]\, \DEL_CNTR_tmr3_2[7]\, 
        \DEL_CNTR_2[6]\, \DEL_CNTR_tmr2_2[6]\, 
        \DEL_CNTR_tmr3_2[6]\, \DEL_CNTR_2[5]\, 
        \DEL_CNTR_tmr2_2[5]\, \DEL_CNTR_tmr3_2[5]\, 
        \DEL_CNTR_2[4]\, \DEL_CNTR_tmr2_2[4]\, 
        \DEL_CNTR_tmr3_2[4]\, \DEL_CNTR_2[3]\, 
        \DEL_CNTR_tmr2_2[3]\, \DEL_CNTR_tmr3_2[3]\, 
        \DEL_CNTR_2[2]\, \DEL_CNTR_tmr2_2[2]\, 
        \DEL_CNTR_tmr3_2[2]\, \DEL_CNTR_2[1]\, 
        \DEL_CNTR_tmr2_2[1]\, \DEL_CNTR_tmr3_2[1]\, 
        \DEL_CNTR_2[0]\, \DEL_CNTR_tmr2_2[0]\, 
        \DEL_CNTR_tmr3_2[0]\, CH_ACTIVE_STAT_0, 
        CH_ACTIVE_STAT_tmr2_0, CH_ACTIVE_STAT_tmr3_0, 
        \DWACT_ADD_CI_0_pog_array_1_5[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\, 
        \DWACT_ADD_CI_0_pog_array_2_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_2[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\, 
        \DWACT_ADD_CI_0_pog_array_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\, 
        \DWACT_ADD_CI_0_g_array_3[0]\, 
        \DWACT_ADD_CI_0_g_array_2[0]\, 
        \DWACT_ADD_CI_0_g_array_2_1[0]\, 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, 
        \DWACT_ADD_CI_0_g_array_0_5[0]\, 
        \DWACT_ADD_CI_0_g_array_10[0]\, 
        \DWACT_ADD_CI_0_g_array_2_2[0]\, 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, 
        \DWACT_ADD_CI_0_g_array_1_5[0]\, 
        \DWACT_ADD_CI_0_g_array_1_3[0]\, 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, 
        \DWACT_ADD_CI_0_g_array_1[0]\, 
        \DWACT_ADD_CI_0_g_array_1_1[0]\, 
        \DWACT_ADD_CI_0_g_array_11[0]\, 
        \DWACT_ADD_CI_0_g_array_12_2[0]\, 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, 
        \DWACT_ADD_CI_0_g_array_12_3[0]\, 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, 
        \DWACT_ADD_CI_0_g_array_1_6[0]\, 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, 
        \DWACT_ADD_CI_0_g_array_0_13[0]\, 
        \DWACT_ADD_CI_0_g_array_0_7[0]\, 
        \DWACT_ADD_CI_0_g_array_12[0]\, 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, 
        \DWACT_ADD_CI_0_g_array_12_4[0]\, 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, 
        \DWACT_ADD_CI_0_g_array_11_2[0]\, 
        \DWACT_ADD_CI_0_g_array_0_11[0]\, 
        \DWACT_ADD_CI_0_g_array_0_3[0]\, 
        \DWACT_ADD_CI_0_g_array_12_5[0]\, 
        \DWACT_ADD_CI_0_pog_array_0[0]\, \DWACT_ADD_CI_0_TMP[0]\, 
        \DWACT_ADD_CI_0_g_array_0_1[0]\, 
        \DWACT_ADD_CI_0_g_array_0_9[0]\, 
        \DWACT_ADD_CI_0_partial_sum[5]\, 
        \DWACT_ADD_CI_0_partial_sum[13]\, 
        \DWACT_ADD_CI_0_partial_sum[7]\, 
        \DWACT_ADD_CI_0_partial_sum[14]\, 
        \DWACT_ADD_CI_0_partial_sum[8]\, 
        \DWACT_ADD_CI_0_partial_sum[1]\, 
        \DWACT_ADD_CI_0_partial_sum[9]\, 
        \DWACT_ADD_CI_0_partial_sum[10]\, 
        \DWACT_ADD_CI_0_partial_sum[4]\, 
        \DWACT_ADD_CI_0_partial_sum[2]\, 
        \DWACT_ADD_CI_0_partial_sum[3]\, 
        \DWACT_ADD_CI_0_partial_sum[12]\, 
        \DWACT_ADD_CI_0_partial_sum[6]\, 
        \DWACT_ADD_CI_0_partial_sum[11]\, \GND\, \VCC\
         : std_logic;

begin 

    P_CH_IAUX_EN_c_c_0 <= \P_CH_IAUX_EN_c_c[0]\;
    P_CH_MREG_EN_c_c_0 <= \P_CH_MREG_EN_c_c[0]\;
    P_CH_VOSG_EN_c(1) <= \P_CH_VOSG_EN_c[1]\;
    P_CH_VOSG_EN_c(0) <= \P_CH_VOSG_EN_c[0]\;
    CH_ACTIVE_STAT <= CH_ACTIVE_STAT_net_1;

    \RET_STATE_maj_RNIOKU22[9]\ : NOR3B
      port map(A => N_290, B => N_236, C => \RET_STATE[9]_net_1\, 
        Y => N_266);
    
    un1_DEL_CNTR_I_41 : XOR2
      port map(A => \DEL_CNTR[12]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[12]\);
    
    un1_DEL_CNTR_I_71 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12[0]\);
    
    un1_DEL_CNTR_I_57 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[8]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, Y => I_57);
    
    un1_DEL_CNTR_I_30 : XOR2
      port map(A => \DEL_CNTR[1]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0[0]\);
    
    \DEL_CNTR_tmr2[14]\ : DFN1P0
      port map(D => \N_DEL_CNTR[14]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[14]\);
    
    \DEL_CNTR_maj[10]\ : MAJ3
      port map(A => \DEL_CNTR_2[10]\, B => \DEL_CNTR_tmr2_2[10]\, 
        C => \DEL_CNTR_tmr3_2[10]\, Y => \DEL_CNTR[10]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIVCHS[4]\ : NOR2
      port map(A => \SEQUENCER_STATE[4]_net_1\, B => 
        \SEQUENCER_STATE[3]_net_1\, Y => N_230_0);
    
    \RET_STATE[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI6U2I1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_2[4]\);
    
    CH_ACTIVE_STAT_maj_RNINVA06 : AO1
      port map(A => N_304, B => N_302, C => N_275, Y => 
        \SEQUENCER_STATE_ns[5]\);
    
    \SEQUENCER_STATE_maj[8]\ : MAJ3
      port map(A => \SEQUENCER_STATE_2[8]\, B => 
        \SEQUENCER_STATE_tmr2_2[8]\, C => 
        \SEQUENCER_STATE_tmr3_2[8]\, Y => 
        \SEQUENCER_STATE[8]_net_1\);
    
    \SEQUENCER_STATE_tmr2[8]\ : DFN1C0
      port map(D => N_315, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \SEQUENCER_STATE_tmr2_2[8]\);
    
    \DEL_CNTR[10]\ : DFN1P0
      port map(D => \N_DEL_CNTR[10]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[10]\);
    
    un1_DEL_CNTR_I_36 : XOR2
      port map(A => \DEL_CNTR[1]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[1]\);
    
    \SEQUENCER_STATE_maj_RNII6ANO[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_57, Y => 
        \N_DEL_CNTR[8]\);
    
    un1_DEL_CNTR_I_49 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[6]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, Y => I_49);
    
    un1_DEL_CNTR_I_79 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\);
    
    un1_DEL_CNTR_I_6 : AND2
      port map(A => \DEL_CNTR[3]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\);
    
    un1_DEL_CNTR_I_81 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_10[0]\);
    
    un1_DEL_CNTR_I_9 : AND2
      port map(A => \DEL_CNTR[10]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\);
    
    \RET_STATE_tmr3[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI803I1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3_2[6]\);
    
    un1_DEL_CNTR_I_37 : XOR2
      port map(A => \DEL_CNTR[14]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[14]\);
    
    \SEQUENCER_STATE_maj_RNIF0TT7[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_52, Y => 
        \N_DEL_CNTR[2]\);
    
    \DEL_CNTR_tmr2[6]\ : DFN1P0
      port map(D => \N_DEL_CNTR[6]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[6]\);
    
    \DEL_CNTR_maj[4]\ : MAJ3
      port map(A => \DEL_CNTR_2[4]\, B => \DEL_CNTR_tmr2_2[4]\, C
         => \DEL_CNTR_tmr3_2[4]\, Y => \DEL_CNTR[4]_net_1\);
    
    \DEL_CNTR[3]\ : DFN1P0
      port map(D => \N_DEL_CNTR[3]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[3]\);
    
    un1_DEL_CNTR_I_89 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_1[0]\);
    
    un1_DEL_CNTR_I_20 : XOR2
      port map(A => \DEL_CNTR[10]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_9[0]\);
    
    \SEQUENCER_STATE_tmr3[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIGJ2Q8[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_2[9]\);
    
    \DEL_CNTR_tmr2[13]\ : DFN1P0
      port map(D => \N_DEL_CNTR[13]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[13]\);
    
    \RET_STATE_maj[5]\ : MAJ3
      port map(A => \RET_STATE_2[5]\, B => \RET_STATE_tmr2_2[5]\, 
        C => \RET_STATE_tmr3_2[5]\, Y => \RET_STATE[5]_net_1\);
    
    \DEL_CNTR_tmr2[8]\ : DFN1P0
      port map(D => \N_DEL_CNTR[8]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[8]\);
    
    \CH_MREG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CH_MREG_EN_maj_RNIUVMI3[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_MREG_EN_tmr3_2[0]\);
    
    \SEQUENCER_STATE_tmr3[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_2[4]\);
    
    \SEQUENCER_STATE_maj_RNI64LQV[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_48, Y => 
        \N_DEL_CNTR[11]\);
    
    \RET_STATE_maj[6]\ : MAJ3
      port map(A => \RET_STATE_2[6]\, B => \RET_STATE_tmr2_2[6]\, 
        C => \RET_STATE_tmr3_2[6]\, Y => \RET_STATE[6]_net_1\);
    
    \CH_MREG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CH_MREG_EN_maj_RNIUVMI3[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_MREG_EN_tmr2_2[0]\);
    
    un1_DEL_CNTR_I_68 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\);
    
    un1_DEL_CNTR_I_26 : XOR2
      port map(A => \DEL_CNTR[6]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_5[0]\);
    
    \SEQUENCER_STATE_maj_RNIJHAE2[9]\ : AO1D
      port map(A => N_246, B => \SEQUENCER_STATE[9]_net_1\, C => 
        \SEQUENCER_STATE_ns_i_0[2]_net_1\, Y => 
        \SEQUENCER_STATE_ns_i_1[2]\);
    
    \DEL_CNTR_tmr3[14]\ : DFN1P0
      port map(D => \N_DEL_CNTR[14]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[14]\);
    
    \DEL_CNTR_tmr2[3]\ : DFN1P0
      port map(D => \N_DEL_CNTR[3]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[3]\);
    
    \CH_VOSG_EN_maj[1]\ : MAJ3
      port map(A => \CH_VOSG_EN_2[1]\, B => 
        \CH_VOSG_EN_tmr2_2[1]\, C => \CH_VOSG_EN_tmr3_2[1]\, Y
         => \P_CH_VOSG_EN_c[1]\);
    
    un1_DEL_CNTR_I_53 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[4]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, Y => I_53);
    
    \DEL_CNTR_tmr2[4]\ : DFN1P0
      port map(D => \N_DEL_CNTR[4]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[4]\);
    
    \RET_STATE_maj_RNIB33I1[9]\ : NOR2A
      port map(A => \RET_STATE[9]_net_1\, B => N_225, Y => 
        \RET_STATE_maj_RNIB33I1[9]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIPRAE6[9]\ : NOR3
      port map(A => N_271, B => \SEQUENCER_STATE_ns_i_1[2]\, C
         => N_313, Y => \SEQUENCER_STATE_maj_RNIPRAE6[9]_net_1\);
    
    un1_DEL_CNTR_I_27 : XOR2
      port map(A => \DEL_CNTR[11]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\);
    
    \RET_STATE_maj_RNI39HE[5]\ : OR2
      port map(A => \RET_STATE[5]_net_1\, B => 
        \RET_STATE[6]_net_1\, Y => N_221);
    
    \CH_MREG_EN[0]\ : DFN1C0
      port map(D => \CH_MREG_EN_maj_RNIUVMI3[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_MREG_EN_2[0]\);
    
    \DEL_CNTR_tmr3[9]\ : DFN1P0
      port map(D => \N_DEL_CNTR[9]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[9]\);
    
    un1_DEL_CNTR_I_55 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[9]\, B => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\, Y => I_55);
    
    \DEL_CNTR_tmr2[2]\ : DFN1P0
      port map(D => \N_DEL_CNTR[2]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[2]\);
    
    \DEL_CNTR_maj_RNIF7AI[9]\ : NOR3A
      port map(A => un8_del_cntr_6, B => \DEL_CNTR[9]_net_1\, C
         => \DEL_CNTR[10]_net_1\, Y => un8_del_cntr_10);
    
    un1_DEL_CNTR_I_40 : XOR2
      port map(A => \DEL_CNTR[8]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[8]\);
    
    un1_DEL_CNTR_I_70 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    \DEL_CNTR_tmr3[5]\ : DFN1P0
      port map(D => \N_DEL_CNTR[5]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[5]\);
    
    \DEL_CNTR_maj[2]\ : MAJ3
      port map(A => \DEL_CNTR_2[2]\, B => \DEL_CNTR_tmr2_2[2]\, C
         => \DEL_CNTR_tmr3_2[2]\, Y => \DEL_CNTR[2]_net_1\);
    
    \CH_VOSG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIDKMT3[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr3_2[0]\);
    
    \SEQUENCER_STATE_maj_RNIHTBL2[3]\ : MX2
      port map(A => N_312, B => N_CH_VOSG_EN_7_1_0, S => 
        N_CH_VOSG_EN_2_sqmuxa, Y => \N_CH_VOSG_EN[0]\);
    
    un1_DEL_CNTR_I_33 : XOR2
      port map(A => \DEL_CNTR[3]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[3]\);
    
    \CH_MREG_EN_maj[0]\ : MAJ3
      port map(A => \CH_MREG_EN_2[0]\, B => 
        \CH_MREG_EN_tmr2_2[0]\, C => \CH_MREG_EN_tmr3_2[0]\, Y
         => \P_CH_MREG_EN_c_c[0]\);
    
    un1_DEL_CNTR_I_91 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\);
    
    \SEQUENCER_STATE_maj_RNIPJHMQ[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_55, Y => 
        \N_DEL_CNTR[9]\);
    
    \DEL_CNTR_tmr3[13]\ : DFN1P0
      port map(D => \N_DEL_CNTR[13]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[13]\);
    
    un1_DEL_CNTR_I_46 : XOR2
      port map(A => \DEL_CNTR[6]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[6]\);
    
    un1_DEL_CNTR_I_76 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11[0]\);
    
    \DEL_CNTR_tmr2[0]\ : DFN1P0
      port map(D => \N_DEL_CNTR[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[0]\);
    
    \SEQUENCER_STATE[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_2[4]\);
    
    \CH_IAUX_EN_maj_RNI814V2[0]\ : MX2
      port map(A => N_CH_IAUX_EN_1_sqmuxa, B => 
        \P_CH_IAUX_EN_c_c[0]\, S => N_290, Y => 
        \CH_IAUX_EN_maj_RNI814V2[0]_net_1\);
    
    \SEQUENCER_STATE_tmr3[8]\ : DFN1C0
      port map(D => N_315, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \SEQUENCER_STATE_tmr3_2[8]\);
    
    \CH_VOSG_EN_tmr2[1]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIFR854[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr2_2[1]\);
    
    un1_DEL_CNTR_I_69 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\);
    
    un1_DEL_CNTR_I_80 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\);
    
    \RET_STATE_maj_RNI3SPL[4]\ : NOR2A
      port map(A => \RET_STATE[4]_net_1\, B => N_221, Y => N_304);
    
    un1_DEL_CNTR_I_35 : XOR2
      port map(A => \DEL_CNTR[7]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[7]\);
    
    \DEL_CNTR_maj[13]\ : MAJ3
      port map(A => \DEL_CNTR_2[13]\, B => \DEL_CNTR_tmr2_2[13]\, 
        C => \DEL_CNTR_tmr3_2[13]\, Y => \DEL_CNTR[13]_net_1\);
    
    un1_DEL_CNTR_I_47 : XOR2
      port map(A => \DEL_CNTR[5]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[5]\);
    
    \SEQUENCER_STATE_tmr3[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_2[5]\);
    
    un1_DEL_CNTR_I_77 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2[0]\);
    
    un1_DEL_CNTR_I_12 : AND2
      port map(A => \DEL_CNTR[9]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\);
    
    un1_DEL_CNTR_I_86 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1[0]\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \SEQUENCER_STATE_tmr2[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_2[6]\);
    
    \RET_STATE_tmr2[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI7V2I1[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2_2[5]\);
    
    \SEQUENCER_STATE_maj_RNI4H1671[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_60, Y => 
        \N_DEL_CNTR[13]\);
    
    \CH_VOSG_EN_maj_RNIFR854[1]\ : MX2
      port map(A => \N_CH_VOSG_EN[1]\, B => \P_CH_VOSG_EN_c[1]\, 
        S => N_290, Y => \CH_VOSG_EN_maj_RNIFR854[1]_net_1\);
    
    un1_DEL_CNTR_I_23 : XOR2
      port map(A => \DEL_CNTR[5]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\);
    
    \DEL_CNTR_tmr3[0]\ : DFN1P0
      port map(D => \N_DEL_CNTR[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[0]\);
    
    \SEQUENCER_STATE_maj_RNI6U2I1[5]\ : OA1B
      port map(A => \RET_STATE[4]_net_1\, B => 
        \SEQUENCER_STATE[5]_net_1\, C => N_222, Y => 
        \SEQUENCER_STATE_maj_RNI6U2I1[5]_net_1\);
    
    \SEQUENCER_STATE_maj_RNI6EP84[8]\ : NOR3B
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH1A2, C => N_285, 
        Y => N_315);
    
    un1_DEL_CNTR_I_87 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\);
    
    \DEL_CNTR[9]\ : DFN1P0
      port map(D => \N_DEL_CNTR[9]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[9]\);
    
    \SEQUENCER_STATE_maj_RNIH1S51[9]\ : NOR3B
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH1A2, C => 
        \SEQUENCER_STATE[9]_net_1\, Y => N_312);
    
    \DEL_CNTR[6]\ : DFN1P0
      port map(D => \N_DEL_CNTR[6]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[6]\);
    
    \RET_STATE_tmr2[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI6U2I1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2_2[4]\);
    
    \SEQUENCER_STATE_maj_RNI7BP251[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_50, Y => 
        \N_DEL_CNTR[12]\);
    
    \DEL_CNTR[4]\ : DFN1P0
      port map(D => \N_DEL_CNTR[4]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[4]\);
    
    un1_DEL_CNTR_I_25 : XOR2
      port map(A => \DEL_CNTR[12]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_11[0]\);
    
    \RET_STATE_maj_RNI39HE_1[5]\ : NOR2A
      port map(A => \RET_STATE[5]_net_1\, B => 
        \RET_STATE[6]_net_1\, Y => N_298);
    
    \SEQUENCER_STATE_maj_RNIDGBB1[9]\ : NOR3A
      port map(A => N_236, B => \RET_STATE[9]_net_1\, C => 
        \SEQUENCER_STATE[9]_net_1\, Y => N_271);
    
    \DEL_CNTR_tmr2[12]\ : DFN1P0
      port map(D => \N_DEL_CNTR[12]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[12]\);
    
    \DEL_CNTR_tmr2[1]\ : DFN1P0
      port map(D => \N_DEL_CNTR[1]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[1]\);
    
    \SEQUENCER_STATE_maj_RNI5LURC[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_53, Y => 
        \N_DEL_CNTR[4]\);
    
    \SEQUENCER_STATE_maj[5]\ : MAJ3
      port map(A => \SEQUENCER_STATE_2[5]\, B => 
        \SEQUENCER_STATE_tmr2_2[5]\, C => 
        \SEQUENCER_STATE_tmr3_2[5]\, Y => 
        \SEQUENCER_STATE[5]_net_1\);
    
    \RET_STATE_tmr3[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIB33I1[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3_2[9]\);
    
    \DEL_CNTR_maj_RNI1B46[4]\ : NOR2
      port map(A => \DEL_CNTR[4]_net_1\, B => \DEL_CNTR[5]_net_1\, 
        Y => un8_del_cntr_1);
    
    \DEL_CNTR_tmr2[5]\ : DFN1P0
      port map(D => \N_DEL_CNTR[5]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[5]\);
    
    \DEL_CNTR[1]\ : DFN1P0
      port map(D => \N_DEL_CNTR[1]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[1]\);
    
    \DEL_CNTR_maj[14]\ : MAJ3
      port map(A => \DEL_CNTR_2[14]\, B => \DEL_CNTR_tmr2_2[14]\, 
        C => \DEL_CNTR_tmr3_2[14]\, Y => \DEL_CNTR[14]_net_1\);
    
    un1_DEL_CNTR_I_60 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[13]\, B => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\, Y => I_60);
    
    un1_DEL_CNTR_I_43 : XOR2
      port map(A => \DEL_CNTR[11]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[11]\);
    
    un1_DEL_CNTR_I_73 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_12[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\);
    
    \SEQUENCER_STATE_tmr2[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_2[4]\);
    
    un1_DEL_CNTR_I_90 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_3[0]\);
    
    \MAIN_SEQUENCER.N_CH_VOSG_EN_7[1]\ : OR2
      port map(A => CH1_2_MS_CFG_EN_c, B => N_CH_VOSG_EN_7_1_0, Y
         => \N_CH_VOSG_EN_7[1]\);
    
    \DEL_CNTR[7]\ : DFN1P0
      port map(D => \N_DEL_CNTR[7]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[7]\);
    
    \CH_VOSG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIDKMT3[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr2_2[0]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \SEQUENCER_STATE_ns_i_a2_6[0]\ : NOR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH1A2, C => 
        STDBY_OFFB_B, Y => N_309);
    
    \RET_STATE_maj[4]\ : MAJ3
      port map(A => \RET_STATE_2[4]\, B => \RET_STATE_tmr2_2[4]\, 
        C => \RET_STATE_tmr3_2[4]\, Y => \RET_STATE[4]_net_1\);
    
    un1_DEL_CNTR_I_14 : AND2
      port map(A => \DEL_CNTR[5]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\);
    
    un1_DEL_CNTR_I_66 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\);
    
    \DEL_CNTR_tmr3[7]\ : DFN1P0
      port map(D => \N_DEL_CNTR[7]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[7]\);
    
    un1_DEL_CNTR_I_52 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[2]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, Y => I_52);
    
    un1_DEL_CNTR_I_45 : XOR2
      port map(A => \DEL_CNTR[9]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[9]\);
    
    un1_DEL_CNTR_I_83 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_3[0]\);
    
    un1_DEL_CNTR_I_75 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\);
    
    \CH_IAUX_EN[0]\ : DFN1C0
      port map(D => \CH_IAUX_EN_maj_RNI814V2[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_IAUX_EN_2[0]\);
    
    \CH_MREG_EN_maj_RNIUVMI3[0]\ : MX2
      port map(A => N_CH_MREG_EN_1_sqmuxa, B => 
        \P_CH_MREG_EN_c_c[0]\, S => N_290, Y => 
        \CH_MREG_EN_maj_RNIUVMI3[0]_net_1\);
    
    \SEQUENCER_STATE_maj_RNI8T7PJ[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_59, Y => 
        \N_DEL_CNTR[7]\);
    
    \SEQUENCER_STATE_maj_RNI5JHS[6]\ : OR2
      port map(A => \SEQUENCER_STATE[6]_net_1\, B => 
        \SEQUENCER_STATE[7]_net_1\, Y => N_222);
    
    \SEQUENCER_STATE_maj_RNIISTAA1[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_58, Y => 
        \N_DEL_CNTR[14]\);
    
    un1_DEL_CNTR_I_67 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_10[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\);
    
    \DEL_CNTR_tmr3[12]\ : DFN1P0
      port map(D => \N_DEL_CNTR[12]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[12]\);
    
    \SEQUENCER_STATE_maj_RNI4EHL[6]\ : NOR2A
      port map(A => \RET_STATE[6]_net_1\, B => 
        \SEQUENCER_STATE[6]_net_1\, Y => \RET_STATE_0_a3_0[6]\);
    
    \DEL_CNTR_maj[0]\ : MAJ3
      port map(A => \DEL_CNTR_2[0]\, B => \DEL_CNTR_tmr2_2[0]\, C
         => \DEL_CNTR_tmr3_2[0]\, Y => \DEL_CNTR[0]_net_1\);
    
    \CH_IAUX_EN_tmr2[0]\ : DFN1C0
      port map(D => \CH_IAUX_EN_maj_RNI814V2[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_IAUX_EN_tmr2_2[0]\);
    
    \SEQUENCER_STATE_maj_RNI5K0QH[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_49, Y => 
        \N_DEL_CNTR[6]\);
    
    \DEL_CNTR_maj[7]\ : MAJ3
      port map(A => \DEL_CNTR_2[7]\, B => \DEL_CNTR_tmr2_2[7]\, C
         => \DEL_CNTR_tmr3_2[7]\, Y => \DEL_CNTR[7]_net_1\);
    
    un1_DEL_CNTR_I_85 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_1[0]\);
    
    \DEL_CNTR_maj[8]\ : MAJ3
      port map(A => \DEL_CNTR_2[8]\, B => \DEL_CNTR_tmr2_2[8]\, C
         => \DEL_CNTR_tmr3_2[8]\, Y => \DEL_CNTR[8]_net_1\);
    
    \DEL_CNTR_maj[1]\ : MAJ3
      port map(A => \DEL_CNTR_2[1]\, B => \DEL_CNTR_tmr2_2[1]\, C
         => \DEL_CNTR_tmr3_2[1]\, Y => \DEL_CNTR[1]_net_1\);
    
    \SEQUENCER_STATE[8]\ : DFN1C0
      port map(D => N_315, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \SEQUENCER_STATE_2[8]\);
    
    un1_DEL_CNTR_I_1 : AND2
      port map(A => \DEL_CNTR[0]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_TMP[0]\);
    
    \CH_VOSG_EN[0]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIDKMT3[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_2[0]\);
    
    \SEQUENCER_STATE_maj_RNIM1MU5[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_56, Y => 
        \N_DEL_CNTR[1]\);
    
    \SEQUENCER_STATE_maj_RNIQI2V4[8]\ : OR3A
      port map(A => N_313, B => N_225, C => 
        \DWACT_ADD_CI_0_partial_sum[0]\, Y => \N_DEL_CNTR[0]\);
    
    \DEL_CNTR_maj_RNIV846[1]\ : NOR2
      port map(A => \DEL_CNTR[6]_net_1\, B => \DEL_CNTR[1]_net_1\, 
        Y => un8_del_cntr_2);
    
    \DEL_CNTR_tmr3[3]\ : DFN1P0
      port map(D => \N_DEL_CNTR[3]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[3]\);
    
    \DEL_CNTR_tmr2[10]\ : DFN1P0
      port map(D => \N_DEL_CNTR[10]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[10]\);
    
    \RET_STATE_maj_RNI8K2T[9]\ : OR3A
      port map(A => \RET_STATE[9]_net_1\, B => 
        \RET_STATE[4]_net_1\, C => N_221, Y => N_246);
    
    \DEL_CNTR_maj_RNIT95A[11]\ : NOR2
      port map(A => \DEL_CNTR[12]_net_1\, B => 
        \DEL_CNTR[11]_net_1\, Y => un8_del_cntr_6);
    
    \SEQUENCER_STATE[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_2[5]\);
    
    \DEL_CNTR_tmr3[6]\ : DFN1P0
      port map(D => \N_DEL_CNTR[6]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[6]\);
    
    \SEQUENCER_STATE[3]\ : DFN1C0
      port map(D => \CH_ACTIVE_STAT_maj_RNIF8952\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_2[3]\);
    
    un1_DEL_CNTR_I_54 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[10]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, Y => I_54);
    
    \SEQUENCER_STATE_ns_i_0[2]\ : OR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH1A2, C => 
        STDBY_OFFB_B, Y => \SEQUENCER_STATE_ns_i_0[2]_net_1\);
    
    un1_DEL_CNTR_I_63 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_8[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\);
    
    \SEQUENCER_STATE_maj_RNIQ86H3[8]\ : OA1C
      port map(A => \SEQUENCER_STATE[8]_net_1\, B => un8_del_cntr, 
        C => N_225, Y => N_285);
    
    un1_DEL_CNTR_I_22 : XOR2
      port map(A => \DEL_CNTR[9]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\);
    
    \SEQUENCER_STATE_maj[3]\ : MAJ3
      port map(A => \SEQUENCER_STATE_2[3]\, B => 
        \SEQUENCER_STATE_tmr2_2[3]\, C => 
        \SEQUENCER_STATE_tmr3_2[3]\, Y => 
        \SEQUENCER_STATE[3]_net_1\);
    
    \RET_STATE_maj_RNI3SPL[5]\ : MIN3X
      port map(A => \RET_STATE[6]_net_1\, B => 
        \RET_STATE[5]_net_1\, C => \RET_STATE[4]_net_1\, Y => 
        N_236);
    
    \RET_STATE_tmr3[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI7V2I1[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3_2[5]\);
    
    \DEL_CNTR[13]\ : DFN1P0
      port map(D => \N_DEL_CNTR[13]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[13]\);
    
    un1_DEL_CNTR_I_18 : AND2
      port map(A => \DEL_CNTR[1]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\);
    
    \DEL_CNTR_maj[6]\ : MAJ3
      port map(A => \DEL_CNTR_2[6]\, B => \DEL_CNTR_tmr2_2[6]\, C
         => \DEL_CNTR_tmr3_2[6]\, Y => \DEL_CNTR[6]_net_1\);
    
    \DEL_CNTR_maj[3]\ : MAJ3
      port map(A => \DEL_CNTR_2[3]\, B => \DEL_CNTR_tmr2_2[3]\, C
         => \DEL_CNTR_tmr3_2[3]\, Y => \DEL_CNTR[3]_net_1\);
    
    CH_ACTIVE_STAT_maj : MAJ3
      port map(A => CH_ACTIVE_STAT_0, B => CH_ACTIVE_STAT_tmr2_0, 
        C => CH_ACTIVE_STAT_tmr3_0, Y => CH_ACTIVE_STAT_net_1);
    
    \DEL_CNTR[0]\ : DFN1P0
      port map(D => \N_DEL_CNTR[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[0]\);
    
    CH_ACTIVE_STAT_maj_RNIF8952_0 : NOR3A
      port map(A => N_309, B => N_230_0, C => 
        CH_ACTIVE_STAT_net_1, Y => N_275);
    
    un1_DEL_CNTR_I_65 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\);
    
    CH_ACTIVE_STAT_tmr3 : DFN1C0
      port map(D => REGISTER_CH_CMD_CH_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        CH_ACTIVE_STAT_tmr3_0);
    
    \RET_STATE_maj_RNIGJ2Q8[9]\ : NOR3
      port map(A => N_315, B => 
        \SEQUENCER_STATE_maj_RNIIGAE2[8]_net_1\, C => N_266, Y
         => \RET_STATE_maj_RNIGJ2Q8[9]_net_1\);
    
    \RET_STATE[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI7V2I1[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_2[5]\);
    
    \DEL_CNTR[5]\ : DFN1P0
      port map(D => \N_DEL_CNTR[5]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[5]\);
    
    un1_DEL_CNTR_I_34 : XOR2
      port map(A => \DEL_CNTR[4]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[4]\);
    
    \SEQUENCER_STATE_maj_RNIPPKK2[8]\ : AOI1
      port map(A => un8_del_cntr, B => \SEQUENCER_STATE[8]_net_1\, 
        C => \SEQUENCER_STATE[9]_net_1\, Y => N_313);
    
    \SEQUENCER_STATE_maj[6]\ : MAJ3
      port map(A => \SEQUENCER_STATE_2[6]\, B => 
        \SEQUENCER_STATE_tmr2_2[6]\, C => 
        \SEQUENCER_STATE_tmr3_2[6]\, Y => 
        \SEQUENCER_STATE[6]_net_1\);
    
    \DEL_CNTR_tmr3[10]\ : DFN1P0
      port map(D => \N_DEL_CNTR[10]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[10]\);
    
    un1_DEL_CNTR_I_11 : AND2
      port map(A => \DEL_CNTR[6]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\);
    
    \SEQUENCER_STATE_tmr2[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIGJ2Q8[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_2[9]\);
    
    un1_DEL_CNTR_I_42 : XOR2
      port map(A => \DEL_CNTR[0]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[0]\);
    
    \SEQUENCER_STATE_maj_RNI6BQA1[5]\ : OR2
      port map(A => N_222, B => \SEQUENCER_STATE[5]_net_1\, Y => 
        N_225);
    
    un1_DEL_CNTR_I_72 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_6[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\);
    
    \DEL_CNTR_maj_RNI0I7D[14]\ : NOR3
      port map(A => \DEL_CNTR[3]_net_1\, B => 
        \DEL_CNTR[14]_net_1\, C => \DEL_CNTR[13]_net_1\, Y => 
        un8_del_cntr_7);
    
    un1_DEL_CNTR_I_5 : AND2
      port map(A => \DEL_CNTR[7]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\);
    
    \SEQUENCER_STATE_tmr3[7]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIPRAE6[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_2[7]\);
    
    un1_DEL_CNTR_I_19 : XOR2
      port map(A => \DEL_CNTR[7]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\);
    
    \SEQUENCER_STATE_maj[9]\ : MAJ3
      port map(A => \SEQUENCER_STATE_2[9]\, B => 
        \SEQUENCER_STATE_tmr2_2[9]\, C => 
        \SEQUENCER_STATE_tmr3_2[9]\, Y => 
        \SEQUENCER_STATE[9]_net_1\);
    
    \SEQUENCER_STATE_tmr2[7]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIPRAE6[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_2[7]\);
    
    \SEQUENCER_STATE_maj_RNII3US2[3]\ : MX2
      port map(A => N_312, B => \N_CH_VOSG_EN_7[1]\, S => 
        N_CH_VOSG_EN_2_sqmuxa, Y => \N_CH_VOSG_EN[1]\);
    
    un1_DEL_CNTR_I_82 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\);
    
    un1_DEL_CNTR_I_24 : XOR2
      port map(A => \DEL_CNTR[2]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_1[0]\);
    
    \SEQUENCER_STATE[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIGJ2Q8[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_2[9]\);
    
    \CH_VOSG_EN_tmr3[1]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIFR854[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr3_2[1]\);
    
    \DEL_CNTR_maj_RNI1L8C[0]\ : NOR3A
      port map(A => un8_del_cntr_4, B => \DEL_CNTR[0]_net_1\, C
         => \DEL_CNTR[2]_net_1\, Y => un8_del_cntr_9);
    
    \SEQUENCER_STATE_maj_RNI7V2I1[6]\ : AO1A
      port map(A => \SEQUENCER_STATE[7]_net_1\, B => 
        \RET_STATE_0_a3_0[5]\, C => \SEQUENCER_STATE[6]_net_1\, Y
         => \SEQUENCER_STATE_maj_RNI7V2I1[6]_net_1\);
    
    un1_DEL_CNTR_I_58 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[14]\, B => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\, Y => I_58);
    
    \SEQUENCER_STATE_tmr2[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_2[5]\);
    
    \DEL_CNTR_maj_RNI7H46[7]\ : NOR2
      port map(A => \DEL_CNTR[8]_net_1\, B => \DEL_CNTR[7]_net_1\, 
        Y => un8_del_cntr_4);
    
    \SEQUENCER_STATE_maj_RNID2DNT[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_54, Y => 
        \N_DEL_CNTR[10]\);
    
    \DEL_CNTR_maj[11]\ : MAJ3
      port map(A => \DEL_CNTR_2[11]\, B => \DEL_CNTR_tmr2_2[11]\, 
        C => \DEL_CNTR_tmr3_2[11]\, Y => \DEL_CNTR[11]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIA14T9[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_51, Y => 
        \N_DEL_CNTR[3]\);
    
    \RET_STATE_tmr2[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI803I1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2_2[6]\);
    
    \DEL_CNTR[14]\ : DFN1P0
      port map(D => \N_DEL_CNTR[14]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[14]\);
    
    \DEL_CNTR_tmr2[7]\ : DFN1P0
      port map(D => \N_DEL_CNTR[7]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[7]\);
    
    \DEL_CNTR_tmr2[11]\ : DFN1P0
      port map(D => \N_DEL_CNTR[11]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[11]\);
    
    \RET_STATE_maj[9]\ : MAJ3
      port map(A => \RET_STATE_2[9]\, B => \RET_STATE_tmr2_2[9]\, 
        C => \RET_STATE_tmr3_2[9]\, Y => \RET_STATE[9]_net_1\);
    
    \DEL_CNTR_tmr2[9]\ : DFN1P0
      port map(D => \N_DEL_CNTR[9]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2_2[9]\);
    
    \CH_ACTIVE_STAT\ : DFN1C0
      port map(D => REGISTER_CH_CMD_CH_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        CH_ACTIVE_STAT_0);
    
    un1_DEL_CNTR_I_44 : XOR2
      port map(A => \DEL_CNTR[10]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[10]\);
    
    un1_DEL_CNTR_I_74 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\);
    
    \DEL_CNTR_tmr3[2]\ : DFN1P0
      port map(D => \N_DEL_CNTR[2]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[2]\);
    
    un1_DEL_CNTR_I_38 : XOR2
      port map(A => \DEL_CNTR[2]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[2]\);
    
    \SEQUENCER_STATE_maj_RNIKR4K1[7]\ : NOR2A
      port map(A => N_312, B => \SEQUENCER_STATE[7]_net_1\, Y => 
        N_CH_IAUX_EN_1_sqmuxa);
    
    un1_DEL_CNTR_I_51 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[3]\, B => 
        \DWACT_ADD_CI_0_g_array_12[0]\, Y => I_51);
    
    \DEL_CNTR_maj[5]\ : MAJ3
      port map(A => \DEL_CNTR_2[5]\, B => \DEL_CNTR_tmr2_2[5]\, C
         => \DEL_CNTR_tmr3_2[5]\, Y => \DEL_CNTR[5]_net_1\);
    
    \RET_STATE_maj_RNI8N1R3[4]\ : NOR3B
      port map(A => N_302, B => N_299, C => \RET_STATE[4]_net_1\, 
        Y => \SEQUENCER_STATE_ns[3]\);
    
    \SEQUENCER_STATE_maj_RNI2CHL[5]\ : NOR2A
      port map(A => \RET_STATE[5]_net_1\, B => 
        \SEQUENCER_STATE[5]_net_1\, Y => \RET_STATE_0_a3_0[5]\);
    
    CH_ACTIVE_STAT_tmr2 : DFN1C0
      port map(D => REGISTER_CH_CMD_CH_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        CH_ACTIVE_STAT_tmr2_0);
    
    un1_DEL_CNTR_I_10 : AND2
      port map(A => \DEL_CNTR[4]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\);
    
    \SEQUENCER_STATE_maj_RNIIGAE2[8]\ : OA1A
      port map(A => \SEQUENCER_STATE[8]_net_1\, B => N_246, C => 
        N_309, Y => \SEQUENCER_STATE_maj_RNIIGAE2[8]_net_1\);
    
    \SEQUENCER_STATE_maj[4]\ : MAJ3
      port map(A => \SEQUENCER_STATE_2[4]\, B => 
        \SEQUENCER_STATE_tmr2_2[4]\, C => 
        \SEQUENCER_STATE_tmr3_2[4]\, Y => 
        \SEQUENCER_STATE[4]_net_1\);
    
    \CH_IAUX_EN_tmr3[0]\ : DFN1C0
      port map(D => \CH_IAUX_EN_maj_RNI814V2[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_IAUX_EN_tmr3_2[0]\);
    
    \RET_STATE_maj_RNI8N1R3_0[4]\ : NOR3B
      port map(A => N_302, B => N_298, C => \RET_STATE[4]_net_1\, 
        Y => \SEQUENCER_STATE_ns[4]\);
    
    \DEL_CNTR_maj[9]\ : MAJ3
      port map(A => \DEL_CNTR_2[9]\, B => \DEL_CNTR_tmr2_2[9]\, C
         => \DEL_CNTR_tmr3_2[9]\, Y => \DEL_CNTR[9]_net_1\);
    
    un1_DEL_CNTR_I_62 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[5]\, B => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, Y => I_62);
    
    \SEQUENCER_STATE_tmr2[3]\ : DFN1C0
      port map(D => \CH_ACTIVE_STAT_maj_RNIF8952\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2_2[3]\);
    
    un1_DEL_CNTR_I_59 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[7]\, B => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\, Y => I_59);
    
    \RET_STATE_maj_RNI39HE_0[5]\ : NOR2A
      port map(A => \RET_STATE[6]_net_1\, B => 
        \RET_STATE[5]_net_1\, Y => N_299);
    
    un1_DEL_CNTR_I_92 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_5[0]\);
    
    un1_DEL_CNTR_I_16 : AND2
      port map(A => \DEL_CNTR[11]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\);
    
    \SEQUENCER_STATE_maj_RNI803I1[5]\ : AO1A
      port map(A => \SEQUENCER_STATE[5]_net_1\, B => 
        \RET_STATE_0_a3_0[6]\, C => \SEQUENCER_STATE[7]_net_1\, Y
         => \SEQUENCER_STATE_maj_RNI803I1[5]_net_1\);
    
    \DEL_CNTR[11]\ : DFN1P0
      port map(D => \N_DEL_CNTR[11]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[11]\);
    
    \RET_STATE_maj_RNI5R753[9]\ : NOR3B
      port map(A => N_290, B => un8_del_cntr, C => 
        \RET_STATE[9]_net_1\, Y => N_302);
    
    \DEL_CNTR[12]\ : DFN1P0
      port map(D => \N_DEL_CNTR[12]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[12]\);
    
    un1_DEL_CNTR_I_31 : XOR2
      port map(A => \DEL_CNTR[3]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\);
    
    \CH_IAUX_EN_maj[0]\ : MAJ3
      port map(A => \CH_IAUX_EN_2[0]\, B => 
        \CH_IAUX_EN_tmr2_2[0]\, C => \CH_IAUX_EN_tmr3_2[0]\, Y
         => \P_CH_IAUX_EN_c_c[0]\);
    
    un1_DEL_CNTR_I_28 : XOR2
      port map(A => \DEL_CNTR[8]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_7[0]\);
    
    \RET_STATE_tmr2[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIB33I1[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2_2[9]\);
    
    \DEL_CNTR_tmr3[11]\ : DFN1P0
      port map(D => \N_DEL_CNTR[11]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[11]\);
    
    \RET_STATE[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI803I1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_2[6]\);
    
    un1_DEL_CNTR_I_17 : AND2
      port map(A => \DEL_CNTR[13]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\);
    
    \SEQUENCER_STATE_maj[7]\ : MAJ3
      port map(A => \SEQUENCER_STATE_2[7]\, B => 
        \SEQUENCER_STATE_tmr2_2[7]\, C => 
        \SEQUENCER_STATE_tmr3_2[7]\, Y => 
        \SEQUENCER_STATE[7]_net_1\);
    
    un1_DEL_CNTR_I_7 : AND2
      port map(A => \DEL_CNTR[2]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\);
    
    \SEQUENCER_STATE_maj_RNIG0S51[8]\ : NOR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH1A2, C => 
        \SEQUENCER_STATE[8]_net_1\, Y => N_290);
    
    un1_DEL_CNTR_I_39 : XOR2
      port map(A => \DEL_CNTR[13]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[13]\);
    
    \SEQUENCER_STATE[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_2[6]\);
    
    \DEL_CNTR_tmr3[8]\ : DFN1P0
      port map(D => \N_DEL_CNTR[8]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[8]\);
    
    \DEL_CNTR_maj_RNI06GP[1]\ : NOR3C
      port map(A => un8_del_cntr_2, B => un8_del_cntr_1, C => 
        un8_del_cntr_7, Y => un8_del_cntr_11);
    
    \DEL_CNTR_maj[12]\ : MAJ3
      port map(A => \DEL_CNTR_2[12]\, B => \DEL_CNTR_tmr2_2[12]\, 
        C => \DEL_CNTR_tmr3_2[12]\, Y => \DEL_CNTR[12]_net_1\);
    
    \SEQUENCER_STATE_maj_RNISLS11[3]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH1A2, C => 
        \SEQUENCER_STATE[3]_net_1\, Y => N_CH_VOSG_EN_2_sqmuxa);
    
    \SEQUENCER_STATE_maj_RNIMKD22[6]\ : NOR2A
      port map(A => N_312, B => N_222, Y => N_CH_MREG_EN_1_sqmuxa);
    
    \CH_VOSG_EN_maj_RNIDKMT3[0]\ : MX2
      port map(A => \N_CH_VOSG_EN[0]\, B => \P_CH_VOSG_EN_c[0]\, 
        S => N_290, Y => \CH_VOSG_EN_maj_RNIDKMT3[0]_net_1\);
    
    CH_ACTIVE_STAT_maj_RNIF8952 : NOR3B
      port map(A => CH_ACTIVE_STAT_net_1, B => N_309, C => 
        N_230_0, Y => \CH_ACTIVE_STAT_maj_RNIF8952\);
    
    un1_DEL_CNTR_I_8 : AND2
      port map(A => \DEL_CNTR[8]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\);
    
    un1_DEL_CNTR_I_21 : XOR2
      port map(A => \DEL_CNTR[13]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\);
    
    \SEQUENCER_STATE_tmr3[3]\ : DFN1C0
      port map(D => \CH_ACTIVE_STAT_maj_RNIF8952\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_2[3]\);
    
    \SEQUENCER_STATE_maj_RNIVCHS_0[4]\ : NOR2
      port map(A => \SEQUENCER_STATE[4]_net_1\, B => 
        \SEQUENCER_STATE[3]_net_1\, Y => 
        \SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\);
    
    \DEL_CNTR_tmr3[4]\ : DFN1P0
      port map(D => \N_DEL_CNTR[4]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[4]\);
    
    \DEL_CNTR_maj_RNIG23O1[0]\ : NOR3C
      port map(A => un8_del_cntr_10, B => un8_del_cntr_9, C => 
        un8_del_cntr_11, Y => un8_del_cntr);
    
    \CH_VOSG_EN[1]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIFR854[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_2[1]\);
    
    un1_DEL_CNTR_I_48 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[11]\, B => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\, Y => I_48);
    
    un1_DEL_CNTR_I_78 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\);
    
    un1_DEL_CNTR_I_64 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0[0]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1[0]\);
    
    un1_DEL_CNTR_I_50 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[12]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, Y => I_50);
    
    un1_DEL_CNTR_I_29 : XOR2
      port map(A => \DEL_CNTR[4]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_3[0]\);
    
    \DEL_CNTR_tmr3[1]\ : DFN1P0
      port map(D => \N_DEL_CNTR[1]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3_2[1]\);
    
    \CH_VOSG_EN_maj[0]\ : MAJ3
      port map(A => \CH_VOSG_EN_2[0]\, B => 
        \CH_VOSG_EN_tmr2_2[0]\, C => \CH_VOSG_EN_tmr3_2[0]\, Y
         => \P_CH_VOSG_EN_c[0]\);
    
    \SEQUENCER_STATE[7]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIPRAE6[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_2[7]\);
    
    \RET_STATE_tmr3[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI6U2I1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3_2[4]\);
    
    un1_DEL_CNTR_I_56 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[1]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, Y => I_56);
    
    un1_DEL_CNTR_I_13 : AND2
      port map(A => \DEL_CNTR[12]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\);
    
    \SEQUENCER_STATE_tmr3[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3_2[6]\);
    
    un1_DEL_CNTR_I_88 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2[0]\);
    
    \SEQUENCER_STATE_maj_RNI4Q5RE[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_62, Y => 
        \N_DEL_CNTR[5]\);
    
    \DEL_CNTR[8]\ : DFN1P0
      port map(D => \N_DEL_CNTR[8]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[8]\);
    
    \DEL_CNTR[2]\ : DFN1P0
      port map(D => \N_DEL_CNTR[2]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_2[2]\);
    
    \RET_STATE[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIB33I1[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_2[9]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity MAIN_SEQUENCER_NEW_3_2 is

    port( P_CH_IAUX_EN_c_c_0   : out   std_logic;
          P_CH_MREG_EN_c_c_0   : out   std_logic;
          P_CH_VOSG_EN_c       : out   std_logic_vector(7 downto 6);
          POR_OUT_TO_SCA_c     : in    std_logic;
          BUF5M_J11_15_TCONN_c : in    std_logic;
          STATUS_LED_c         : in    std_logic;
          CH7_8_MS_CFG_EN_c    : in    std_logic;
          un3_n_ch_vosg_en     : in    std_logic;
          CH_ACTIVE_STAT       : in    std_logic;
          STDBY_OFFB_B         : in    std_logic;
          UVL_OK_CH7A8         : in    std_logic;
          STATUS_LED_c_0       : in    std_logic
        );

end MAIN_SEQUENCER_NEW_3_2;

architecture DEF_ARCH of MAIN_SEQUENCER_NEW_3_2 is 

  component XOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1D
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component MAJ3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3C
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

  component AO1A
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

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AOI1
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

  component MIN3X
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_230_0, \SEQUENCER_STATE[4]_net_1\, 
        \SEQUENCER_STATE[3]_net_1\, N_304, \RET_STATE[4]_net_1\, 
        N_221, \SEQUENCER_STATE_ns_i_1[2]\, N_246, 
        \SEQUENCER_STATE[9]_net_1\, 
        \SEQUENCER_STATE_ns_i_0[2]_net_1\, un8_del_cntr_11, 
        un8_del_cntr_2, un8_del_cntr_1, un8_del_cntr_7, 
        un8_del_cntr_10, un8_del_cntr_6, \DEL_CNTR[9]_net_1\, 
        \DEL_CNTR[10]_net_1\, un8_del_cntr_9, un8_del_cntr_4, 
        \DEL_CNTR[5]_net_1\, \DEL_CNTR[6]_net_1\, 
        \DEL_CNTR[2]_net_1\, \DEL_CNTR[14]_net_1\, 
        \DEL_CNTR[13]_net_1\, \DEL_CNTR[12]_net_1\, 
        \DEL_CNTR[11]_net_1\, \DEL_CNTR[8]_net_1\, 
        \DEL_CNTR[7]_net_1\, \DEL_CNTR[4]_net_1\, 
        \DEL_CNTR[3]_net_1\, \DEL_CNTR[1]_net_1\, 
        \DEL_CNTR[0]_net_1\, \RET_STATE_0_a3_0[6]\, 
        \RET_STATE[6]_net_1\, \SEQUENCER_STATE[6]_net_1\, 
        \RET_STATE_0_a3_0[5]\, \RET_STATE[5]_net_1\, 
        \SEQUENCER_STATE[5]_net_1\, 
        \SEQUENCER_STATE_maj_RNI1A198[8]_net_1\, N_315, 
        \SEQUENCER_STATE_maj_RNIQENH2[8]_net_1\, N_266, 
        \SEQUENCER_STATE_maj_RNI9EJD7[9]_net_1\, N_271, N_313, 
        \SEQUENCER_STATE_maj_RNIRJR51[4]_net_1\, N_309, N_236, 
        \RET_STATE[9]_net_1\, un8_del_cntr, N_275, 
        \SEQUENCER_STATE[8]_net_1\, \SEQUENCER_STATE_ns[3]\, 
        N_314, \SEQUENCER_STATE_ns[4]\, \SEQUENCER_STATE_ns[5]\, 
        N_302, \SEQUENCER_STATE_maj_RNIMVRO[5]_net_1\, N_222, 
        \SEQUENCER_STATE_maj_RNIN0SO[6]_net_1\, 
        \SEQUENCER_STATE[7]_net_1\, 
        \SEQUENCER_STATE_maj_RNIO1SO[5]_net_1\, \N_DEL_CNTR[14]\, 
        N_225, I_58_2, \N_DEL_CNTR[13]\, I_60_2, \N_DEL_CNTR[12]\, 
        I_50_2, \N_DEL_CNTR[11]\, I_48_2, \N_DEL_CNTR[10]\, 
        I_54_2, \N_DEL_CNTR[9]\, I_55_2, \N_DEL_CNTR[8]\, I_57_2, 
        \N_DEL_CNTR[7]\, I_59_2, \N_DEL_CNTR[6]\, I_49_2, 
        \N_DEL_CNTR[5]\, I_62_2, \N_DEL_CNTR[4]\, I_53_2, 
        \N_DEL_CNTR[3]\, I_51_2, \N_DEL_CNTR[2]\, I_52_2, 
        \N_DEL_CNTR[1]\, I_56_2, \N_DEL_CNTR[0]\, 
        \DWACT_ADD_CI_0_partial_sum[0]\, \N_CH_VOSG_EN_7[1]\, 
        \N_CH_VOSG_EN[1]\, N_312, N_CH_VOSG_EN_2_sqmuxa, 
        \N_CH_VOSG_EN[0]\, 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, N_285, N_291, 
        N_290, N_CH_IAUX_EN_1_sqmuxa, N_CH_MREG_EN_1_sqmuxa, 
        \RET_STATE_maj_RNIR4SO[9]_net_1\, 
        \CH_VOSG_EN_maj_RNIL5HT1[1]_net_1\, \P_CH_VOSG_EN_c[7]\, 
        \CH_VOSG_EN_maj_RNI7A7M1[0]_net_1\, \P_CH_VOSG_EN_c[6]\, 
        \CH_MREG_EN_maj_RNIKHAC1[0]_net_1\, \P_CH_MREG_EN_c_c[6]\, 
        \CH_IAUX_EN_maj_RNIIO831[0]_net_1\, \P_CH_IAUX_EN_c_c[6]\, 
        \RET_STATE_0[4]\, \RET_STATE_tmr2[4]_net_1\, 
        \RET_STATE_tmr3[4]_net_1\, \RET_STATE_0[5]\, 
        \RET_STATE_tmr2[5]_net_1\, \RET_STATE_tmr3[5]_net_1\, 
        \RET_STATE_0[6]\, \RET_STATE_tmr2[6]_net_1\, 
        \RET_STATE_tmr3[6]_net_1\, \RET_STATE_0[9]\, 
        \RET_STATE_tmr2[9]_net_1\, \RET_STATE_tmr3[9]_net_1\, 
        \CH_VOSG_EN[1]_net_1\, \CH_VOSG_EN_tmr2[1]_net_1\, 
        \CH_VOSG_EN_tmr3[1]_net_1\, \CH_VOSG_EN[0]_net_1\, 
        \CH_VOSG_EN_tmr2[0]_net_1\, \CH_VOSG_EN_tmr3[0]_net_1\, 
        \SEQUENCER_STATE_0[3]\, \SEQUENCER_STATE_tmr2[3]_net_1\, 
        \SEQUENCER_STATE_tmr3[3]_net_1\, \SEQUENCER_STATE_0[4]\, 
        \SEQUENCER_STATE_tmr2[4]_net_1\, 
        \SEQUENCER_STATE_tmr3[4]_net_1\, \SEQUENCER_STATE_0[5]\, 
        \SEQUENCER_STATE_tmr2[5]_net_1\, 
        \SEQUENCER_STATE_tmr3[5]_net_1\, \SEQUENCER_STATE_0[6]\, 
        \SEQUENCER_STATE_tmr2[6]_net_1\, 
        \SEQUENCER_STATE_tmr3[6]_net_1\, \SEQUENCER_STATE_0[7]\, 
        \SEQUENCER_STATE_tmr2[7]_net_1\, 
        \SEQUENCER_STATE_tmr3[7]_net_1\, \SEQUENCER_STATE_0[8]\, 
        \SEQUENCER_STATE_tmr2[8]_net_1\, 
        \SEQUENCER_STATE_tmr3[8]_net_1\, \SEQUENCER_STATE_0[9]\, 
        \SEQUENCER_STATE_tmr2[9]_net_1\, 
        \SEQUENCER_STATE_tmr3[9]_net_1\, \CH_IAUX_EN[0]_net_1\, 
        \CH_IAUX_EN_tmr2[0]_net_1\, \CH_IAUX_EN_tmr3[0]_net_1\, 
        \CH_MREG_EN[0]_net_1\, \CH_MREG_EN_tmr2[0]_net_1\, 
        \CH_MREG_EN_tmr3[0]_net_1\, \DEL_CNTR_0[14]\, 
        \DEL_CNTR_tmr2[14]_net_1\, \DEL_CNTR_tmr3[14]_net_1\, 
        \DEL_CNTR_0[13]\, \DEL_CNTR_tmr2[13]_net_1\, 
        \DEL_CNTR_tmr3[13]_net_1\, \DEL_CNTR_0[12]\, 
        \DEL_CNTR_tmr2[12]_net_1\, \DEL_CNTR_tmr3[12]_net_1\, 
        \DEL_CNTR_0[11]\, \DEL_CNTR_tmr2[11]_net_1\, 
        \DEL_CNTR_tmr3[11]_net_1\, \DEL_CNTR_0[10]\, 
        \DEL_CNTR_tmr2[10]_net_1\, \DEL_CNTR_tmr3[10]_net_1\, 
        \DEL_CNTR_0[9]\, \DEL_CNTR_tmr2[9]_net_1\, 
        \DEL_CNTR_tmr3[9]_net_1\, \DEL_CNTR_0[8]\, 
        \DEL_CNTR_tmr2[8]_net_1\, \DEL_CNTR_tmr3[8]_net_1\, 
        \DEL_CNTR_0[7]\, \DEL_CNTR_tmr2[7]_net_1\, 
        \DEL_CNTR_tmr3[7]_net_1\, \DEL_CNTR_0[6]\, 
        \DEL_CNTR_tmr2[6]_net_1\, \DEL_CNTR_tmr3[6]_net_1\, 
        \DEL_CNTR_0[5]\, \DEL_CNTR_tmr2[5]_net_1\, 
        \DEL_CNTR_tmr3[5]_net_1\, \DEL_CNTR_0[4]\, 
        \DEL_CNTR_tmr2[4]_net_1\, \DEL_CNTR_tmr3[4]_net_1\, 
        \DEL_CNTR_0[3]\, \DEL_CNTR_tmr2[3]_net_1\, 
        \DEL_CNTR_tmr3[3]_net_1\, \DEL_CNTR_0[2]\, 
        \DEL_CNTR_tmr2[2]_net_1\, \DEL_CNTR_tmr3[2]_net_1\, 
        \DEL_CNTR_0[1]\, \DEL_CNTR_tmr2[1]_net_1\, 
        \DEL_CNTR_tmr3[1]_net_1\, \DEL_CNTR_0[0]\, 
        \DEL_CNTR_tmr2[0]_net_1\, \DEL_CNTR_tmr3[0]_net_1\, 
        \DWACT_ADD_CI_0_pog_array_1_5[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\, 
        \DWACT_ADD_CI_0_pog_array_2_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_2[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\, 
        \DWACT_ADD_CI_0_pog_array_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\, 
        \DWACT_ADD_CI_0_g_array_3[0]\, 
        \DWACT_ADD_CI_0_g_array_2[0]\, 
        \DWACT_ADD_CI_0_g_array_2_1[0]\, 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, 
        \DWACT_ADD_CI_0_g_array_0_5[0]\, 
        \DWACT_ADD_CI_0_g_array_10[0]\, 
        \DWACT_ADD_CI_0_g_array_2_2[0]\, 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, 
        \DWACT_ADD_CI_0_g_array_1_5[0]\, 
        \DWACT_ADD_CI_0_g_array_1_3[0]\, 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, 
        \DWACT_ADD_CI_0_g_array_1[0]\, 
        \DWACT_ADD_CI_0_g_array_1_1[0]\, 
        \DWACT_ADD_CI_0_g_array_11[0]\, 
        \DWACT_ADD_CI_0_g_array_12_2[0]\, 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, 
        \DWACT_ADD_CI_0_g_array_12_3[0]\, 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, 
        \DWACT_ADD_CI_0_g_array_1_6[0]\, 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, 
        \DWACT_ADD_CI_0_g_array_0_13[0]\, 
        \DWACT_ADD_CI_0_g_array_0_7[0]\, 
        \DWACT_ADD_CI_0_g_array_12[0]\, 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, 
        \DWACT_ADD_CI_0_g_array_12_4[0]\, 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, 
        \DWACT_ADD_CI_0_g_array_11_2[0]\, 
        \DWACT_ADD_CI_0_g_array_0_11[0]\, 
        \DWACT_ADD_CI_0_g_array_0_3[0]\, 
        \DWACT_ADD_CI_0_g_array_12_5[0]\, 
        \DWACT_ADD_CI_0_pog_array_0[0]\, \DWACT_ADD_CI_0_TMP[0]\, 
        \DWACT_ADD_CI_0_g_array_0_1[0]\, 
        \DWACT_ADD_CI_0_g_array_0_9[0]\, 
        \DWACT_ADD_CI_0_partial_sum[5]\, 
        \DWACT_ADD_CI_0_partial_sum[13]\, 
        \DWACT_ADD_CI_0_partial_sum[7]\, 
        \DWACT_ADD_CI_0_partial_sum[14]\, 
        \DWACT_ADD_CI_0_partial_sum[8]\, 
        \DWACT_ADD_CI_0_partial_sum[1]\, 
        \DWACT_ADD_CI_0_partial_sum[9]\, 
        \DWACT_ADD_CI_0_partial_sum[10]\, 
        \DWACT_ADD_CI_0_partial_sum[4]\, 
        \DWACT_ADD_CI_0_partial_sum[2]\, 
        \DWACT_ADD_CI_0_partial_sum[3]\, 
        \DWACT_ADD_CI_0_partial_sum[12]\, 
        \DWACT_ADD_CI_0_partial_sum[6]\, 
        \DWACT_ADD_CI_0_partial_sum[11]\, \GND\, \VCC\
         : std_logic;

begin 

    P_CH_IAUX_EN_c_c_0 <= \P_CH_IAUX_EN_c_c[6]\;
    P_CH_MREG_EN_c_c_0 <= \P_CH_MREG_EN_c_c[6]\;
    P_CH_VOSG_EN_c(7) <= \P_CH_VOSG_EN_c[7]\;
    P_CH_VOSG_EN_c(6) <= \P_CH_VOSG_EN_c[6]\;

    un1_DEL_CNTR_I_41 : XOR2
      port map(A => \DEL_CNTR[12]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[12]\);
    
    un1_DEL_CNTR_I_71 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12[0]\);
    
    un1_DEL_CNTR_I_57 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[8]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, Y => I_57_2);
    
    un1_DEL_CNTR_I_30 : XOR2
      port map(A => \DEL_CNTR[1]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0[0]\);
    
    \SEQUENCER_STATE_maj_RNIRFNH2[9]\ : AO1D
      port map(A => N_246, B => \SEQUENCER_STATE[9]_net_1\, C => 
        \SEQUENCER_STATE_ns_i_0[2]_net_1\, Y => 
        \SEQUENCER_STATE_ns_i_1[2]\);
    
    \DEL_CNTR_tmr2[14]\ : DFN1P0
      port map(D => \N_DEL_CNTR[14]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[14]_net_1\);
    
    \DEL_CNTR_maj[10]\ : MAJ3
      port map(A => \DEL_CNTR_0[10]\, B => 
        \DEL_CNTR_tmr2[10]_net_1\, C => \DEL_CNTR_tmr3[10]_net_1\, 
        Y => \DEL_CNTR[10]_net_1\);
    
    \RET_STATE[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIMVRO[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_0[4]\);
    
    \SEQUENCER_STATE_maj[8]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[8]\, B => 
        \SEQUENCER_STATE_tmr2[8]_net_1\, C => 
        \SEQUENCER_STATE_tmr3[8]_net_1\, Y => 
        \SEQUENCER_STATE[8]_net_1\);
    
    \SEQUENCER_STATE_tmr2[8]\ : DFN1C0
      port map(D => N_315, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \SEQUENCER_STATE_tmr2[8]_net_1\);
    
    \DEL_CNTR[10]\ : DFN1P0
      port map(D => \N_DEL_CNTR[10]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[10]\);
    
    un1_DEL_CNTR_I_36 : XOR2
      port map(A => \DEL_CNTR[1]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[1]\);
    
    un1_DEL_CNTR_I_49 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[6]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, Y => I_49_2);
    
    \DEL_CNTR_maj_RNIV4M51[9]\ : NOR3A
      port map(A => un8_del_cntr_6, B => \DEL_CNTR[9]_net_1\, C
         => \DEL_CNTR[10]_net_1\, Y => un8_del_cntr_10);
    
    un1_DEL_CNTR_I_79 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\);
    
    un1_DEL_CNTR_I_6 : AND2
      port map(A => \DEL_CNTR[3]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\);
    
    un1_DEL_CNTR_I_81 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_10[0]\);
    
    \SEQUENCER_STATE_maj_RNIMV1EA[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_57_2, Y => 
        \N_DEL_CNTR[8]\);
    
    un1_DEL_CNTR_I_9 : AND2
      port map(A => \DEL_CNTR[10]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\);
    
    \RET_STATE_tmr3[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIO1SO[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3[6]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIR9IGG[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_50_2, Y => 
        \N_DEL_CNTR[12]\);
    
    \SEQUENCER_STATE_maj_RNI9EJD7[9]\ : NOR3
      port map(A => N_271, B => \SEQUENCER_STATE_ns_i_1[2]\, C
         => N_313, Y => \SEQUENCER_STATE_maj_RNI9EJD7[9]_net_1\);
    
    \RET_STATE_maj_RNIAQCP[9]\ : NOR2A
      port map(A => N_290, B => \RET_STATE[9]_net_1\, Y => N_291);
    
    un1_DEL_CNTR_I_37 : XOR2
      port map(A => \DEL_CNTR[14]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[14]\);
    
    \DEL_CNTR_maj_RNILEUM[11]\ : NOR2
      port map(A => \DEL_CNTR[12]_net_1\, B => 
        \DEL_CNTR[11]_net_1\, Y => un8_del_cntr_6);
    
    \DEL_CNTR_tmr2[6]\ : DFN1P0
      port map(D => \N_DEL_CNTR[6]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[6]_net_1\);
    
    \DEL_CNTR_maj[4]\ : MAJ3
      port map(A => \DEL_CNTR_0[4]\, B => 
        \DEL_CNTR_tmr2[4]_net_1\, C => \DEL_CNTR_tmr3[4]_net_1\, 
        Y => \DEL_CNTR[4]_net_1\);
    
    \DEL_CNTR[3]\ : DFN1P0
      port map(D => \N_DEL_CNTR[3]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[3]\);
    
    un1_DEL_CNTR_I_89 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_1[0]\);
    
    un1_DEL_CNTR_I_20 : XOR2
      port map(A => \DEL_CNTR[10]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_9[0]\);
    
    \SEQUENCER_STATE_tmr3[9]\ : DFN1P0
      port map(D => \SEQUENCER_STATE_maj_RNI1A198[8]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3[9]_net_1\);
    
    \DEL_CNTR_tmr2[13]\ : DFN1P0
      port map(D => \N_DEL_CNTR[13]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[13]_net_1\);
    
    \RET_STATE_maj[5]\ : MAJ3
      port map(A => \RET_STATE_0[5]\, B => 
        \RET_STATE_tmr2[5]_net_1\, C => \RET_STATE_tmr3[5]_net_1\, 
        Y => \RET_STATE[5]_net_1\);
    
    \DEL_CNTR_tmr2[8]\ : DFN1P0
      port map(D => \N_DEL_CNTR[8]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[8]_net_1\);
    
    \CH_MREG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CH_MREG_EN_maj_RNIKHAC1[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_MREG_EN_tmr3[0]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIRJR51_0[4]\ : NOR3A
      port map(A => N_309, B => N_230_0, C => CH_ACTIVE_STAT, Y
         => N_275);
    
    \SEQUENCER_STATE_tmr3[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3[4]_net_1\);
    
    \RET_STATE_maj[6]\ : MAJ3
      port map(A => \RET_STATE_0[6]\, B => 
        \RET_STATE_tmr2[6]_net_1\, C => \RET_STATE_tmr3[6]_net_1\, 
        Y => \RET_STATE[6]_net_1\);
    
    \CH_MREG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CH_MREG_EN_maj_RNIKHAC1[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_MREG_EN_tmr2[0]_net_1\);
    
    un1_DEL_CNTR_I_68 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\);
    
    un1_DEL_CNTR_I_26 : XOR2
      port map(A => \DEL_CNTR[6]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_5[0]\);
    
    \DEL_CNTR_tmr3[14]\ : DFN1P0
      port map(D => \N_DEL_CNTR[14]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[14]_net_1\);
    
    \DEL_CNTR_tmr2[3]\ : DFN1P0
      port map(D => \N_DEL_CNTR[3]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[3]_net_1\);
    
    \CH_VOSG_EN_maj[1]\ : MAJ3
      port map(A => \CH_VOSG_EN[1]_net_1\, B => 
        \CH_VOSG_EN_tmr2[1]_net_1\, C => 
        \CH_VOSG_EN_tmr3[1]_net_1\, Y => \P_CH_VOSG_EN_c[7]\);
    
    \SEQUENCER_STATE_maj_RNIOECO8[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_59_2, Y => 
        \N_DEL_CNTR[7]\);
    
    un1_DEL_CNTR_I_53 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[4]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, Y => I_53_2);
    
    \DEL_CNTR_tmr2[4]\ : DFN1P0
      port map(D => \N_DEL_CNTR[4]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[4]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIQGNB[9]\ : NOR3B
      port map(A => STATUS_LED_c, B => UVL_OK_CH7A8, C => 
        \SEQUENCER_STATE[9]_net_1\, Y => N_312);
    
    un1_DEL_CNTR_I_27 : XOR2
      port map(A => \DEL_CNTR[11]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\);
    
    \SEQUENCER_STATE_maj_RNIDFT28[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_49_2, Y => 
        \N_DEL_CNTR[6]\);
    
    \RET_STATE_maj_RNIRDAR[5]\ : OR2
      port map(A => \RET_STATE[5]_net_1\, B => 
        \RET_STATE[6]_net_1\, Y => N_221);
    
    \CH_MREG_EN[0]\ : DFN1C0
      port map(D => \CH_MREG_EN_maj_RNIKHAC1[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_MREG_EN[0]_net_1\);
    
    \SEQUENCER_STATE_maj_RNI1A198[8]\ : NOR3
      port map(A => N_315, B => 
        \SEQUENCER_STATE_maj_RNIQENH2[8]_net_1\, C => N_266, Y
         => \SEQUENCER_STATE_maj_RNI1A198[8]_net_1\);
    
    \DEL_CNTR_tmr3[9]\ : DFN1P0
      port map(D => \N_DEL_CNTR[9]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[9]_net_1\);
    
    un1_DEL_CNTR_I_55 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[9]\, B => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\, Y => I_55_2);
    
    \DEL_CNTR_tmr2[2]\ : DFN1P0
      port map(D => \N_DEL_CNTR[2]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[2]_net_1\);
    
    un1_DEL_CNTR_I_40 : XOR2
      port map(A => \DEL_CNTR[8]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[8]\);
    
    \RET_STATE_maj_RNIGV726[4]\ : AO1
      port map(A => N_304, B => N_302, C => N_275, Y => 
        \SEQUENCER_STATE_ns[5]\);
    
    un1_DEL_CNTR_I_70 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    \DEL_CNTR_tmr3[5]\ : DFN1P0
      port map(D => \N_DEL_CNTR[5]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[5]_net_1\);
    
    \DEL_CNTR_maj[2]\ : MAJ3
      port map(A => \DEL_CNTR_0[2]\, B => 
        \DEL_CNTR_tmr2[2]_net_1\, C => \DEL_CNTR_tmr3[2]_net_1\, 
        Y => \DEL_CNTR[2]_net_1\);
    
    \SEQUENCER_STATE_maj_RNI04N27[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_62_2, Y => 
        \N_DEL_CNTR[5]\);
    
    \CH_VOSG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNI7A7M1[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr3[0]_net_1\);
    
    un1_DEL_CNTR_I_33 : XOR2
      port map(A => \DEL_CNTR[3]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[3]\);
    
    \CH_MREG_EN_maj[0]\ : MAJ3
      port map(A => \CH_MREG_EN[0]_net_1\, B => 
        \CH_MREG_EN_tmr2[0]_net_1\, C => 
        \CH_MREG_EN_tmr3[0]_net_1\, Y => \P_CH_MREG_EN_c_c[6]\);
    
    un1_DEL_CNTR_I_91 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\);
    
    \DEL_CNTR_maj_RNIVTG6[7]\ : NOR2
      port map(A => \DEL_CNTR[8]_net_1\, B => \DEL_CNTR[7]_net_1\, 
        Y => un8_del_cntr_4);
    
    \DEL_CNTR_tmr3[13]\ : DFN1P0
      port map(D => \N_DEL_CNTR[13]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[13]_net_1\);
    
    \CH_MREG_EN_maj_RNIKHAC1[0]\ : MX2
      port map(A => N_CH_MREG_EN_1_sqmuxa, B => 
        \P_CH_MREG_EN_c_c[6]\, S => N_290, Y => 
        \CH_MREG_EN_maj_RNIKHAC1[0]_net_1\);
    
    un1_DEL_CNTR_I_46 : XOR2
      port map(A => \DEL_CNTR[6]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[6]\);
    
    un1_DEL_CNTR_I_76 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11[0]\);
    
    \DEL_CNTR_tmr2[0]\ : DFN1P0
      port map(D => \N_DEL_CNTR[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[0]_net_1\);
    
    \SEQUENCER_STATE[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_0[4]\);
    
    \SEQUENCER_STATE_tmr3[8]\ : DFN1C0
      port map(D => N_315, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \SEQUENCER_STATE_tmr3[8]_net_1\);
    
    \CH_VOSG_EN_tmr2[1]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIL5HT1[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr2[1]_net_1\);
    
    un1_DEL_CNTR_I_69 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\);
    
    un1_DEL_CNTR_I_80 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\);
    
    \SEQUENCER_STATE_maj_RNIPFNB[8]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH7A8, C => 
        \SEQUENCER_STATE[8]_net_1\, Y => N_290);
    
    un1_DEL_CNTR_I_35 : XOR2
      port map(A => \DEL_CNTR[7]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[7]\);
    
    \DEL_CNTR_maj[13]\ : MAJ3
      port map(A => \DEL_CNTR_0[13]\, B => 
        \DEL_CNTR_tmr2[13]_net_1\, C => \DEL_CNTR_tmr3[13]_net_1\, 
        Y => \DEL_CNTR[13]_net_1\);
    
    un1_DEL_CNTR_I_47 : XOR2
      port map(A => \DEL_CNTR[5]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[5]\);
    
    \SEQUENCER_STATE_tmr3[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3[5]_net_1\);
    
    un1_DEL_CNTR_I_77 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2[0]\);
    
    un1_DEL_CNTR_I_12 : AND2
      port map(A => \DEL_CNTR[9]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\);
    
    un1_DEL_CNTR_I_86 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1[0]\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \SEQUENCER_STATE_tmr2[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2[6]_net_1\);
    
    \RET_STATE_tmr2[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIN0SO[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2[5]_net_1\);
    
    un1_DEL_CNTR_I_23 : XOR2
      port map(A => \DEL_CNTR[5]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\);
    
    \DEL_CNTR_tmr3[0]\ : DFN1P0
      port map(D => \N_DEL_CNTR[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[0]_net_1\);
    
    un1_DEL_CNTR_I_87 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\);
    
    \DEL_CNTR[9]\ : DFN1P0
      port map(D => \N_DEL_CNTR[9]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[9]\);
    
    \DEL_CNTR[6]\ : DFN1P0
      port map(D => \N_DEL_CNTR[6]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[6]\);
    
    \RET_STATE_tmr2[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIMVRO[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2[4]_net_1\);
    
    \DEL_CNTR[4]\ : DFN1P0
      port map(D => \N_DEL_CNTR[4]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[4]\);
    
    \SEQUENCER_STATE_maj_RNINO6J[6]\ : NOR2A
      port map(A => N_312, B => N_222, Y => N_CH_MREG_EN_1_sqmuxa);
    
    un1_DEL_CNTR_I_25 : XOR2
      port map(A => \DEL_CNTR[12]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_11[0]\);
    
    \DEL_CNTR_tmr2[12]\ : DFN1P0
      port map(D => \N_DEL_CNTR[12]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[12]_net_1\);
    
    \DEL_CNTR_tmr2[1]\ : DFN1P0
      port map(D => \N_DEL_CNTR[1]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[1]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIO1SO[5]\ : AO1A
      port map(A => \SEQUENCER_STATE[5]_net_1\, B => 
        \RET_STATE_0_a3_0[6]\, C => \SEQUENCER_STATE[7]_net_1\, Y
         => \SEQUENCER_STATE_maj_RNIO1SO[5]_net_1\);
    
    \SEQUENCER_STATE_maj[5]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[5]\, B => 
        \SEQUENCER_STATE_tmr2[5]_net_1\, C => 
        \SEQUENCER_STATE_tmr3[5]_net_1\, Y => 
        \SEQUENCER_STATE[5]_net_1\);
    
    \RET_STATE_tmr3[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIR4SO[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3[9]_net_1\);
    
    \DEL_CNTR_tmr2[5]\ : DFN1P0
      port map(D => \N_DEL_CNTR[5]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[5]_net_1\);
    
    \DEL_CNTR[1]\ : DFN1P0
      port map(D => \N_DEL_CNTR[1]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[1]\);
    
    \CH_IAUX_EN_maj_RNIIO831[0]\ : MX2
      port map(A => N_CH_IAUX_EN_1_sqmuxa, B => 
        \P_CH_IAUX_EN_c_c[6]\, S => N_290, Y => 
        \CH_IAUX_EN_maj_RNIIO831[0]_net_1\);
    
    \DEL_CNTR_maj[14]\ : MAJ3
      port map(A => \DEL_CNTR_0[14]\, B => 
        \DEL_CNTR_tmr2[14]_net_1\, C => \DEL_CNTR_tmr3[14]_net_1\, 
        Y => \DEL_CNTR[14]_net_1\);
    
    un1_DEL_CNTR_I_60 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[13]\, B => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\, Y => I_60_2);
    
    un1_DEL_CNTR_I_43 : XOR2
      port map(A => \DEL_CNTR[11]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[11]\);
    
    un1_DEL_CNTR_I_73 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_12[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\);
    
    \SEQUENCER_STATE_tmr2[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2[4]_net_1\);
    
    \SEQUENCER_STATE_maj_RNII32D5[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_51_2, Y => 
        \N_DEL_CNTR[3]\);
    
    un1_DEL_CNTR_I_90 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_3[0]\);
    
    \MAIN_SEQUENCER.N_CH_VOSG_EN_7[1]\ : OR2A
      port map(A => un3_n_ch_vosg_en, B => CH7_8_MS_CFG_EN_c, Y
         => \N_CH_VOSG_EN_7[1]\);
    
    \DEL_CNTR[7]\ : DFN1P0
      port map(D => \N_DEL_CNTR[7]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[7]\);
    
    \CH_VOSG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNI7A7M1[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr2[0]_net_1\);
    
    \DEL_CNTR_maj_RNI4UVP2[5]\ : NOR3C
      port map(A => un8_del_cntr_10, B => un8_del_cntr_9, C => 
        un8_del_cntr_11, Y => un8_del_cntr);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \SEQUENCER_STATE_ns_i_a2_6[0]\ : NOR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH7A8, C => 
        STDBY_OFFB_B, Y => N_309);
    
    \RET_STATE_maj[4]\ : MAJ3
      port map(A => \RET_STATE_0[4]\, B => 
        \RET_STATE_tmr2[4]_net_1\, C => \RET_STATE_tmr3[4]_net_1\, 
        Y => \RET_STATE[4]_net_1\);
    
    un1_DEL_CNTR_I_14 : AND2
      port map(A => \DEL_CNTR[5]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\);
    
    un1_DEL_CNTR_I_66 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\);
    
    \DEL_CNTR_tmr3[7]\ : DFN1P0
      port map(D => \N_DEL_CNTR[7]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[7]_net_1\);
    
    un1_DEL_CNTR_I_52 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[2]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, Y => I_52_2);
    
    un1_DEL_CNTR_I_45 : XOR2
      port map(A => \DEL_CNTR[9]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[9]\);
    
    un1_DEL_CNTR_I_83 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_3[0]\);
    
    un1_DEL_CNTR_I_75 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\);
    
    \SEQUENCER_STATE_maj_RNIMDTK3[8]\ : NOR3B
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH7A8, C => N_285, 
        Y => N_315);
    
    \CH_IAUX_EN[0]\ : DFN1C0
      port map(D => \CH_IAUX_EN_maj_RNIIO831[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_IAUX_EN[0]_net_1\);
    
    un1_DEL_CNTR_I_67 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_10[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\);
    
    \SEQUENCER_STATE_maj_RNIN0SO[6]\ : AO1A
      port map(A => \SEQUENCER_STATE[7]_net_1\, B => 
        \RET_STATE_0_a3_0[5]\, C => \SEQUENCER_STATE[6]_net_1\, Y
         => \SEQUENCER_STATE_maj_RNIN0SO[6]_net_1\);
    
    \DEL_CNTR_tmr3[12]\ : DFN1P0
      port map(D => \N_DEL_CNTR[12]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[12]_net_1\);
    
    \DEL_CNTR_maj[0]\ : MAJ3
      port map(A => \DEL_CNTR_0[0]\, B => 
        \DEL_CNTR_tmr2[0]_net_1\, C => \DEL_CNTR_tmr3[0]_net_1\, 
        Y => \DEL_CNTR[0]_net_1\);
    
    \CH_IAUX_EN_tmr2[0]\ : DFN1C0
      port map(D => \CH_IAUX_EN_maj_RNIIO831[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_IAUX_EN_tmr2[0]_net_1\);
    
    \SEQUENCER_STATE_maj_RNI9KCQ1[9]\ : NOR3A
      port map(A => N_236, B => \RET_STATE[9]_net_1\, C => 
        \SEQUENCER_STATE[9]_net_1\, Y => N_271);
    
    \SEQUENCER_STATE_maj_RNI30CC1[3]\ : MX2
      port map(A => N_312, B => \N_CH_VOSG_EN_7[1]\, S => 
        N_CH_VOSG_EN_2_sqmuxa, Y => \N_CH_VOSG_EN[1]\);
    
    \RET_STATE_maj_RNIHDC22[4]\ : NOR2B
      port map(A => N_291, B => N_236, Y => N_266);
    
    \DEL_CNTR_maj[7]\ : MAJ3
      port map(A => \DEL_CNTR_0[7]\, B => 
        \DEL_CNTR_tmr2[7]_net_1\, C => \DEL_CNTR_tmr3[7]_net_1\, 
        Y => \DEL_CNTR[7]_net_1\);
    
    un1_DEL_CNTR_I_85 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_1[0]\);
    
    \DEL_CNTR_maj[8]\ : MAJ3
      port map(A => \DEL_CNTR_0[8]\, B => 
        \DEL_CNTR_tmr2[8]_net_1\, C => \DEL_CNTR_tmr3[8]_net_1\, 
        Y => \DEL_CNTR[8]_net_1\);
    
    \DEL_CNTR_maj[1]\ : MAJ3
      port map(A => \DEL_CNTR_0[1]\, B => 
        \DEL_CNTR_tmr2[1]_net_1\, C => \DEL_CNTR_tmr3[1]_net_1\, 
        Y => \DEL_CNTR[1]_net_1\);
    
    \SEQUENCER_STATE[8]\ : DFN1C0
      port map(D => N_315, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \SEQUENCER_STATE_0[8]\);
    
    \SEQUENCER_STATE_maj_RNIMVRO[5]\ : OA1B
      port map(A => \RET_STATE[4]_net_1\, B => 
        \SEQUENCER_STATE[5]_net_1\, C => N_222, Y => 
        \SEQUENCER_STATE_maj_RNIMVRO[5]_net_1\);
    
    un1_DEL_CNTR_I_1 : AND2
      port map(A => \DEL_CNTR[0]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_TMP[0]\);
    
    \SEQUENCER_STATE_maj_RNIM5251[3]\ : MX2B
      port map(A => N_312, B => un3_n_ch_vosg_en, S => 
        N_CH_VOSG_EN_2_sqmuxa, Y => \N_CH_VOSG_EN[0]\);
    
    \CH_VOSG_EN[0]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNI7A7M1[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN[0]_net_1\);
    
    \DEL_CNTR_tmr3[3]\ : DFN1P0
      port map(D => \N_DEL_CNTR[3]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[3]_net_1\);
    
    \DEL_CNTR_tmr2[10]\ : DFN1P0
      port map(D => \N_DEL_CNTR[10]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[10]_net_1\);
    
    \DEL_CNTR_maj_RNIQN1D[5]\ : NOR3A
      port map(A => un8_del_cntr_4, B => \DEL_CNTR[5]_net_1\, C
         => \DEL_CNTR[6]_net_1\, Y => un8_del_cntr_9);
    
    \SEQUENCER_STATE[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_0[5]\);
    
    \DEL_CNTR_tmr3[6]\ : DFN1P0
      port map(D => \N_DEL_CNTR[6]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[6]_net_1\);
    
    \SEQUENCER_STATE[3]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIRJR51[4]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_0[3]\);
    
    un1_DEL_CNTR_I_54 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[10]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, Y => I_54_2);
    
    \SEQUENCER_STATE_ns_i_0[2]\ : OR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH7A8, C => 
        STDBY_OFFB_B, Y => \SEQUENCER_STATE_ns_i_0[2]_net_1\);
    
    un1_DEL_CNTR_I_63 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_8[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\);
    
    \SEQUENCER_STATE_maj_RNI95FF[7]\ : NOR2A
      port map(A => N_312, B => \SEQUENCER_STATE[7]_net_1\, Y => 
        N_CH_IAUX_EN_1_sqmuxa);
    
    un1_DEL_CNTR_I_22 : XOR2
      port map(A => \DEL_CNTR[9]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\);
    
    \SEQUENCER_STATE_maj[3]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[3]\, B => 
        \SEQUENCER_STATE_tmr2[3]_net_1\, C => 
        \SEQUENCER_STATE_tmr3[3]_net_1\, Y => 
        \SEQUENCER_STATE[3]_net_1\);
    
    \RET_STATE_tmr3[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIN0SO[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3[5]_net_1\);
    
    \DEL_CNTR[13]\ : DFN1P0
      port map(D => \N_DEL_CNTR[13]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[13]\);
    
    un1_DEL_CNTR_I_18 : AND2
      port map(A => \DEL_CNTR[1]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\);
    
    \DEL_CNTR_maj[6]\ : MAJ3
      port map(A => \DEL_CNTR_0[6]\, B => 
        \DEL_CNTR_tmr2[6]_net_1\, C => \DEL_CNTR_tmr3[6]_net_1\, 
        Y => \DEL_CNTR[6]_net_1\);
    
    \DEL_CNTR_maj[3]\ : MAJ3
      port map(A => \DEL_CNTR_0[3]\, B => 
        \DEL_CNTR_tmr2[3]_net_1\, C => \DEL_CNTR_tmr3[3]_net_1\, 
        Y => \DEL_CNTR[3]_net_1\);
    
    \RET_STATE_maj_RNILBCS4[5]\ : NOR3B
      port map(A => \RET_STATE[6]_net_1\, B => N_314, C => 
        \RET_STATE[5]_net_1\, Y => \SEQUENCER_STATE_ns[3]\);
    
    \DEL_CNTR[0]\ : DFN1P0
      port map(D => \N_DEL_CNTR[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[0]\);
    
    \SEQUENCER_STATE_maj_RNIUDU83[8]\ : OA1C
      port map(A => \SEQUENCER_STATE[8]_net_1\, B => un8_del_cntr, 
        C => N_225, Y => N_285);
    
    \SEQUENCER_STATE_maj_RNISQCH[6]\ : NOR2A
      port map(A => \RET_STATE[6]_net_1\, B => 
        \SEQUENCER_STATE[6]_net_1\, Y => \RET_STATE_0_a3_0[6]\);
    
    un1_DEL_CNTR_I_65 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\);
    
    \RET_STATE[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIN0SO[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_0[5]\);
    
    \DEL_CNTR[5]\ : DFN1P0
      port map(D => \N_DEL_CNTR[5]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[5]\);
    
    un1_DEL_CNTR_I_34 : XOR2
      port map(A => \DEL_CNTR[4]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[4]\);
    
    \SEQUENCER_STATE_maj[6]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[6]\, B => 
        \SEQUENCER_STATE_tmr2[6]_net_1\, C => 
        \SEQUENCER_STATE_tmr3[6]_net_1\, Y => 
        \SEQUENCER_STATE[6]_net_1\);
    
    \DEL_CNTR_tmr3[10]\ : DFN1P0
      port map(D => \N_DEL_CNTR[10]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[10]_net_1\);
    
    un1_DEL_CNTR_I_11 : AND2
      port map(A => \DEL_CNTR[6]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\);
    
    \SEQUENCER_STATE_tmr2[9]\ : DFN1P0
      port map(D => \SEQUENCER_STATE_maj_RNI1A198[8]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2[9]_net_1\);
    
    \SEQUENCER_STATE_maj_RNI5AF13[8]\ : AOI1
      port map(A => un8_del_cntr, B => \SEQUENCER_STATE[8]_net_1\, 
        C => \SEQUENCER_STATE[9]_net_1\, Y => N_313);
    
    un1_DEL_CNTR_I_42 : XOR2
      port map(A => \DEL_CNTR[0]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[0]\);
    
    un1_DEL_CNTR_I_72 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_6[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\);
    
    \SEQUENCER_STATE_maj_RNIN1F7_0[4]\ : NOR2
      port map(A => \SEQUENCER_STATE[4]_net_1\, B => 
        \SEQUENCER_STATE[3]_net_1\, Y => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\);
    
    \SEQUENCER_STATE_maj_RNI6VQHD[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_48_2, Y => 
        \N_DEL_CNTR[11]\);
    
    un1_DEL_CNTR_I_5 : AND2
      port map(A => \DEL_CNTR[7]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\);
    
    \SEQUENCER_STATE_tmr3[7]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI9EJD7[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3[7]_net_1\);
    
    un1_DEL_CNTR_I_19 : XOR2
      port map(A => \DEL_CNTR[7]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\);
    
    \SEQUENCER_STATE_maj[9]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[9]\, B => 
        \SEQUENCER_STATE_tmr2[9]_net_1\, C => 
        \SEQUENCER_STATE_tmr3[9]_net_1\, Y => 
        \SEQUENCER_STATE[9]_net_1\);
    
    \SEQUENCER_STATE_tmr2[7]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI9EJD7[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2[7]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIAQ6B[5]\ : OR2
      port map(A => N_222, B => \SEQUENCER_STATE[5]_net_1\, Y => 
        N_225);
    
    un1_DEL_CNTR_I_82 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\);
    
    un1_DEL_CNTR_I_24 : XOR2
      port map(A => \DEL_CNTR[2]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_1[0]\);
    
    \SEQUENCER_STATE[9]\ : DFN1P0
      port map(D => \SEQUENCER_STATE_maj_RNI1A198[8]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_0[9]\);
    
    \CH_VOSG_EN_tmr3[1]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIL5HT1[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN_tmr3[1]_net_1\);
    
    \RET_STATE_maj_RNILBCS4_0[5]\ : NOR3B
      port map(A => \RET_STATE[5]_net_1\, B => N_314, C => 
        \RET_STATE[6]_net_1\, Y => \SEQUENCER_STATE_ns[4]\);
    
    \SEQUENCER_STATE_maj_RNIFCJN4[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_52_2, Y => 
        \N_DEL_CNTR[2]\);
    
    \DEL_CNTR_maj_RNINLG6[3]\ : NOR2
      port map(A => \DEL_CNTR[4]_net_1\, B => \DEL_CNTR[3]_net_1\, 
        Y => un8_del_cntr_2);
    
    un1_DEL_CNTR_I_58 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[14]\, B => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\, Y => I_58_2);
    
    \SEQUENCER_STATE_tmr2[5]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2[5]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIP88D6[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_53_2, Y => 
        \N_DEL_CNTR[4]\);
    
    \DEL_CNTR_maj[11]\ : MAJ3
      port map(A => \DEL_CNTR_0[11]\, B => 
        \DEL_CNTR_tmr2[11]_net_1\, C => \DEL_CNTR_tmr3[11]_net_1\, 
        Y => \DEL_CNTR[11]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIQU9FJ[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_58_2, Y => 
        \N_DEL_CNTR[14]\);
    
    \RET_STATE_tmr2[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIO1SO[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2[6]_net_1\);
    
    \DEL_CNTR[14]\ : DFN1P0
      port map(D => \N_DEL_CNTR[14]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[14]\);
    
    \SEQUENCER_STATE_maj_RNIQENH2[8]\ : OA1A
      port map(A => \SEQUENCER_STATE[8]_net_1\, B => N_246, C => 
        N_309, Y => \SEQUENCER_STATE_maj_RNIQENH2[8]_net_1\);
    
    \RET_STATE_maj_RNI7JV81[4]\ : MIN3X
      port map(A => \RET_STATE[6]_net_1\, B => 
        \RET_STATE[5]_net_1\, C => \RET_STATE[4]_net_1\, Y => 
        N_236);
    
    \DEL_CNTR_tmr2[7]\ : DFN1P0
      port map(D => \N_DEL_CNTR[7]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[7]_net_1\);
    
    \DEL_CNTR_tmr2[11]\ : DFN1P0
      port map(D => \N_DEL_CNTR[11]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[11]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIEN424[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_56_2, Y => 
        \N_DEL_CNTR[1]\);
    
    \RET_STATE_maj_RNIR4SO[9]\ : NOR2A
      port map(A => \RET_STATE[9]_net_1\, B => N_225, Y => 
        \RET_STATE_maj_RNIR4SO[9]_net_1\);
    
    \RET_STATE_maj[9]\ : MAJ3
      port map(A => \RET_STATE_0[9]\, B => 
        \RET_STATE_tmr2[9]_net_1\, C => \RET_STATE_tmr3[9]_net_1\, 
        Y => \RET_STATE[9]_net_1\);
    
    \DEL_CNTR_tmr2[9]\ : DFN1P0
      port map(D => \N_DEL_CNTR[9]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr2[9]_net_1\);
    
    un1_DEL_CNTR_I_44 : XOR2
      port map(A => \DEL_CNTR[10]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[10]\);
    
    un1_DEL_CNTR_I_74 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\);
    
    \DEL_CNTR_tmr3[2]\ : DFN1P0
      port map(D => \N_DEL_CNTR[2]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[2]_net_1\);
    
    un1_DEL_CNTR_I_38 : XOR2
      port map(A => \DEL_CNTR[2]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[2]\);
    
    un1_DEL_CNTR_I_51 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[3]\, B => 
        \DWACT_ADD_CI_0_g_array_12[0]\, Y => I_51_2);
    
    \DEL_CNTR_maj[5]\ : MAJ3
      port map(A => \DEL_CNTR_0[5]\, B => 
        \DEL_CNTR_tmr2[5]_net_1\, C => \DEL_CNTR_tmr3[5]_net_1\, 
        Y => \DEL_CNTR[5]_net_1\);
    
    \CH_VOSG_EN_maj_RNIL5HT1[1]\ : MX2
      port map(A => \N_CH_VOSG_EN[1]\, B => \P_CH_VOSG_EN_c[7]\, 
        S => N_290, Y => \CH_VOSG_EN_maj_RNIL5HT1[1]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIQOCH[5]\ : NOR2A
      port map(A => \RET_STATE[5]_net_1\, B => 
        \SEQUENCER_STATE[5]_net_1\, Y => \RET_STATE_0_a3_0[5]\);
    
    \SEQUENCER_STATE_maj_RNIKANB[3]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH7A8, C => 
        \SEQUENCER_STATE[3]_net_1\, Y => N_CH_VOSG_EN_2_sqmuxa);
    
    un1_DEL_CNTR_I_10 : AND2
      port map(A => \DEL_CNTR[4]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\);
    
    \SEQUENCER_STATE_maj[4]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[4]\, B => 
        \SEQUENCER_STATE_tmr2[4]_net_1\, C => 
        \SEQUENCER_STATE_tmr3[4]_net_1\, Y => 
        \SEQUENCER_STATE[4]_net_1\);
    
    \CH_IAUX_EN_tmr3[0]\ : DFN1C0
      port map(D => \CH_IAUX_EN_maj_RNIIO831[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_IAUX_EN_tmr3[0]_net_1\);
    
    \DEL_CNTR_maj_RNIB1871[0]\ : NOR3C
      port map(A => un8_del_cntr_2, B => un8_del_cntr_1, C => 
        un8_del_cntr_7, Y => un8_del_cntr_11);
    
    \DEL_CNTR_maj[9]\ : MAJ3
      port map(A => \DEL_CNTR_0[9]\, B => 
        \DEL_CNTR_tmr2[9]_net_1\, C => \DEL_CNTR_tmr3[9]_net_1\, 
        Y => \DEL_CNTR[9]_net_1\);
    
    un1_DEL_CNTR_I_62 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[5]\, B => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, Y => I_62_2);
    
    \SEQUENCER_STATE_tmr2[3]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIRJR51[4]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr2[3]_net_1\);
    
    \DEL_CNTR_maj_RNI3S6Q[14]\ : NOR3
      port map(A => \DEL_CNTR[2]_net_1\, B => 
        \DEL_CNTR[14]_net_1\, C => \DEL_CNTR[13]_net_1\, Y => 
        un8_del_cntr_7);
    
    un1_DEL_CNTR_I_59 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[7]\, B => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\, Y => I_59_2);
    
    \SEQUENCER_STATE_maj_RNIRJR51[4]\ : NOR3B
      port map(A => CH_ACTIVE_STAT, B => N_309, C => N_230_0, Y
         => \SEQUENCER_STATE_maj_RNIRJR51[4]_net_1\);
    
    \SEQUENCER_STATE_maj_RNI5FUBC[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_54_2, Y => 
        \N_DEL_CNTR[10]\);
    
    un1_DEL_CNTR_I_92 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_5[0]\);
    
    un1_DEL_CNTR_I_16 : AND2
      port map(A => \DEL_CNTR[11]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\);
    
    \DEL_CNTR[11]\ : DFN1P0
      port map(D => \N_DEL_CNTR[11]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[11]\);
    
    \DEL_CNTR[12]\ : DFN1P0
      port map(D => \N_DEL_CNTR[12]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[12]\);
    
    un1_DEL_CNTR_I_31 : XOR2
      port map(A => \DEL_CNTR[3]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\);
    
    \CH_IAUX_EN_maj[0]\ : MAJ3
      port map(A => \CH_IAUX_EN[0]_net_1\, B => 
        \CH_IAUX_EN_tmr2[0]_net_1\, C => 
        \CH_IAUX_EN_tmr3[0]_net_1\, Y => \P_CH_IAUX_EN_c_c[6]\);
    
    \SEQUENCER_STATE_maj_RNIEDDN3[8]\ : OR3A
      port map(A => N_313, B => N_225, C => 
        \DWACT_ADD_CI_0_partial_sum[0]\, Y => \N_DEL_CNTR[0]\);
    
    \RET_STATE_maj_RNIEOCJ3[9]\ : NOR2B
      port map(A => N_291, B => un8_del_cntr, Y => N_302);
    
    un1_DEL_CNTR_I_28 : XOR2
      port map(A => \DEL_CNTR[8]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_7[0]\);
    
    \RET_STATE_tmr2[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIR4SO[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr2[9]_net_1\);
    
    \DEL_CNTR_tmr3[11]\ : DFN1P0
      port map(D => \N_DEL_CNTR[11]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[11]_net_1\);
    
    \RET_STATE[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIO1SO[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_0[6]\);
    
    un1_DEL_CNTR_I_17 : AND2
      port map(A => \DEL_CNTR[13]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\);
    
    \SEQUENCER_STATE_maj[7]\ : MAJ3
      port map(A => \SEQUENCER_STATE_0[7]\, B => 
        \SEQUENCER_STATE_tmr2[7]_net_1\, C => 
        \SEQUENCER_STATE_tmr3[7]_net_1\, Y => 
        \SEQUENCER_STATE[7]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIN1F7[4]\ : NOR2
      port map(A => \SEQUENCER_STATE[4]_net_1\, B => 
        \SEQUENCER_STATE[3]_net_1\, Y => N_230_0);
    
    un1_DEL_CNTR_I_7 : AND2
      port map(A => \DEL_CNTR[2]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\);
    
    un1_DEL_CNTR_I_39 : XOR2
      port map(A => \DEL_CNTR[13]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[13]\);
    
    \SEQUENCER_STATE[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_0[6]\);
    
    \DEL_CNTR_tmr3[8]\ : DFN1P0
      port map(D => \N_DEL_CNTR[8]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[8]_net_1\);
    
    \SEQUENCER_STATE_maj_RNIT7F7[6]\ : OR2
      port map(A => \SEQUENCER_STATE[6]_net_1\, B => 
        \SEQUENCER_STATE[7]_net_1\, Y => N_222);
    
    \DEL_CNTR_maj[12]\ : MAJ3
      port map(A => \DEL_CNTR_0[12]\, B => 
        \DEL_CNTR_tmr2[12]_net_1\, C => \DEL_CNTR_tmr3[12]_net_1\, 
        Y => \DEL_CNTR[12]_net_1\);
    
    \CH_VOSG_EN_maj_RNI7A7M1[0]\ : MX2
      port map(A => \N_CH_VOSG_EN[0]\, B => \P_CH_VOSG_EN_c[6]\, 
        S => N_290, Y => \CH_VOSG_EN_maj_RNI7A7M1[0]_net_1\);
    
    un1_DEL_CNTR_I_8 : AND2
      port map(A => \DEL_CNTR[8]_net_1\, B => 
        \SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\);
    
    un1_DEL_CNTR_I_21 : XOR2
      port map(A => \DEL_CNTR[13]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\);
    
    \SEQUENCER_STATE_tmr3[3]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIRJR51[4]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3[3]_net_1\);
    
    \DEL_CNTR_tmr3[4]\ : DFN1P0
      port map(D => \N_DEL_CNTR[4]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[4]_net_1\);
    
    \CH_VOSG_EN[1]\ : DFN1C0
      port map(D => \CH_VOSG_EN_maj_RNIL5HT1[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CH_VOSG_EN[1]_net_1\);
    
    un1_DEL_CNTR_I_48 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[11]\, B => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\, Y => I_48_2);
    
    un1_DEL_CNTR_I_78 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\);
    
    un1_DEL_CNTR_I_64 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0[0]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1[0]\);
    
    un1_DEL_CNTR_I_50 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[12]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, Y => I_50_2);
    
    un1_DEL_CNTR_I_29 : XOR2
      port map(A => \DEL_CNTR[4]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_3[0]\);
    
    \DEL_CNTR_tmr3[1]\ : DFN1P0
      port map(D => \N_DEL_CNTR[1]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_tmr3[1]_net_1\);
    
    \CH_VOSG_EN_maj[0]\ : MAJ3
      port map(A => \CH_VOSG_EN[0]_net_1\, B => 
        \CH_VOSG_EN_tmr2[0]_net_1\, C => 
        \CH_VOSG_EN_tmr3[0]_net_1\, Y => \P_CH_VOSG_EN_c[6]\);
    
    \DEL_CNTR_maj_RNIHFG6[0]\ : NOR2
      port map(A => \DEL_CNTR[1]_net_1\, B => \DEL_CNTR[0]_net_1\, 
        Y => un8_del_cntr_1);
    
    \SEQUENCER_STATE[7]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNI9EJD7[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_0[7]\);
    
    \RET_STATE_tmr3[4]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_maj_RNIMVRO[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_tmr3[4]_net_1\);
    
    un1_DEL_CNTR_I_56 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[1]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, Y => I_56_2);
    
    un1_DEL_CNTR_I_13 : AND2
      port map(A => \DEL_CNTR[12]_net_1\, B => N_230_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\);
    
    \SEQUENCER_STATE_tmr3[6]\ : DFN1C0
      port map(D => \SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SEQUENCER_STATE_tmr3[6]_net_1\);
    
    \RET_STATE_maj_RNIQT114[4]\ : NOR2A
      port map(A => N_302, B => \RET_STATE[4]_net_1\, Y => N_314);
    
    \SEQUENCER_STATE_maj_RNI53H3B[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_55_2, Y => 
        \N_DEL_CNTR[9]\);
    
    un1_DEL_CNTR_I_88 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2[0]\);
    
    \DEL_CNTR[8]\ : DFN1P0
      port map(D => \N_DEL_CNTR[8]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[8]\);
    
    \RET_STATE_maj_RNIOTKM1[9]\ : OR3A
      port map(A => \RET_STATE[9]_net_1\, B => 
        \RET_STATE[4]_net_1\, C => N_221, Y => N_246);
    
    \RET_STATE_maj_RNI7JV81_0[4]\ : NOR2A
      port map(A => \RET_STATE[4]_net_1\, B => N_221, Y => N_304);
    
    \DEL_CNTR[2]\ : DFN1P0
      port map(D => \N_DEL_CNTR[2]\, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DEL_CNTR_0[2]\);
    
    \SEQUENCER_STATE_maj_RNI0UEMH[8]\ : OR3A
      port map(A => N_313, B => N_225, C => I_60_2, Y => 
        \N_DEL_CNTR[13]\);
    
    \RET_STATE[9]\ : DFN1P0
      port map(D => \RET_STATE_maj_RNIR4SO[9]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \RET_STATE_0[9]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity IIR_FILT_4_1 is

    port( FPGA_FUSE_3_4_OK_c_0 : in    std_logic;
          POR_OUT_TO_SCA_c     : in    std_logic;
          BUF5M_J11_15_TCONN_c : in    std_logic;
          UVL_OK_CH3A4         : out   std_logic
        );

end IIR_FILT_4_1;

architecture DEF_ARCH of IIR_FILT_4_1 is 

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component MAJ3
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

  component AO1A
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

  component AO13
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component OAI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3C
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

  component AOI1B
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

  component XA1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_23_i, \FILT_OUT[6]_net_1\, \FILT_OUT[7]_net_1\, 
        i10_mux, i2_mux, \FILT_OUT[2]_net_1\, \FILT_OUT[0]_net_1\, 
        \FILT_OUT[1]_net_1\, i4_mux, \FILT_OUT[3]_net_1\, i6_mux, 
        \FILT_OUT[4]_net_1\, i8_mux, \FILT_OUT[5]_net_1\, 
        \FILT_OUT_maj_RNILTKFJ[7]_net_1\, i12_mux, N89, 
        \FILT_OUT_maj_RNILTKFJ_0[7]_net_1\, \SUM_IN_A[5]_net_1\, 
        N92, n_sigout15lto7_2, n_sigout15lto7_1, n_sigout3lto6_1, 
        n_sigout3lto6_0, N_33_i, N_31_i, N_29_i, N_27_i, 
        \THRESH_VAL_maj_RNICPJI5[1]_net_1\, \THRESH_VAL[1]_net_1\, 
        n_sigout3, N_113, \THRESH_VAL_ns[0]\, 
        \THRESH_VAL[0]_net_1\, N_93, N_95, N_94, 
        \SIGOUT_maj_RNIHDUN8\, \UVL_OK_CH3A4\, N_40, 
        \SUM_IN_A[4]_net_1\, \un2_n_filt_out0[28]\, 
        ADD_4x4_fast_I6_Y_1, \SIG_IN_DEL_maj_RNIKR8E[0]_net_1\, 
        \SIG_IN_DEL[0]_net_1\, 
        \SIG_IN_DEL_maj_RNIKR8E_0[0]_net_1\, \FILT_OUT_1[7]\, 
        \FILT_OUT_tmr2_1[7]\, \FILT_OUT_tmr3_1[7]\, 
        \FILT_OUT_1[6]\, \FILT_OUT_tmr2_1[6]\, 
        \FILT_OUT_tmr3_1[6]\, \FILT_OUT_1[5]\, 
        \FILT_OUT_tmr2_1[5]\, \FILT_OUT_tmr3_1[5]\, 
        \FILT_OUT_1[4]\, \FILT_OUT_tmr2_1[4]\, 
        \FILT_OUT_tmr3_1[4]\, \FILT_OUT_1[3]\, 
        \FILT_OUT_tmr2_1[3]\, \FILT_OUT_tmr3_1[3]\, 
        \FILT_OUT_1[2]\, \FILT_OUT_tmr2_1[2]\, 
        \FILT_OUT_tmr3_1[2]\, \FILT_OUT_1[1]\, 
        \FILT_OUT_tmr2_1[1]\, \FILT_OUT_tmr3_1[1]\, 
        \FILT_OUT_1[0]\, \FILT_OUT_tmr2_1[0]\, 
        \FILT_OUT_tmr3_1[0]\, \SUM_IN_A_1[5]\, 
        \SUM_IN_A_tmr2_1[5]\, \SUM_IN_A_tmr3_1[5]\, 
        \SUM_IN_A_1[4]\, \SUM_IN_A_tmr2_1[4]\, 
        \SUM_IN_A_tmr3_1[4]\, \THRESH_VAL_1[1]\, 
        \THRESH_VAL_tmr2_1[1]\, \THRESH_VAL_tmr3_1[1]\, 
        \THRESH_VAL_1[0]\, \THRESH_VAL_tmr2_1[0]\, 
        \THRESH_VAL_tmr3_1[0]\, SIGOUT_1, SIGOUT_tmr2_1, 
        SIGOUT_tmr3_1, \SIG_IN_DEL_1[0]\, \SIG_IN_DEL_tmr2_1[0]\, 
        \SIG_IN_DEL_tmr3_1[0]\, \GND\, \VCC\ : std_logic;

begin 

    UVL_OK_CH3A4 <= \UVL_OK_CH3A4\;

    \FILT_OUT_maj_RNIFJDV_0[4]\ : NOR2
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout15lto7_1);
    
    \FILT_OUT[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_1[4]\);
    
    SIGOUT_tmr2 : DFN1C0
      port map(D => \SIGOUT_maj_RNIHDUN8\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        SIGOUT_tmr2_1);
    
    \THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNICPJI5[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr2_1[1]\);
    
    \THRESH_VAL_maj_RNIMS9P2_1[1]\ : NOR2A
      port map(A => n_sigout3, B => \THRESH_VAL[1]_net_1\, Y => 
        N_94);
    
    \SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIKR8E_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr2_1[5]\);
    
    \FILT_OUT[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNILTKFJ[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_1[6]\);
    
    \THRESH_VAL[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_1[0]\);
    
    SIGOUT_tmr3 : DFN1C0
      port map(D => \SIGOUT_maj_RNIHDUN8\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        SIGOUT_tmr3_1);
    
    un1_tmp_sum_in_b_0_m22 : XNOR3
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => i10_mux, Y => N_23_i);
    
    \THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr3_1[0]\);
    
    \FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNILTKFJ_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_1[7]\);
    
    \FILT_OUT_maj[3]\ : MAJ3
      port map(A => \FILT_OUT_1[3]\, B => \FILT_OUT_tmr2_1[3]\, C
         => \FILT_OUT_tmr3_1[3]\, Y => \FILT_OUT[3]_net_1\);
    
    \FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_1[3]\);
    
    \FILT_OUT_maj[6]\ : MAJ3
      port map(A => \FILT_OUT_1[6]\, B => \FILT_OUT_tmr2_1[6]\, C
         => \FILT_OUT_tmr3_1[6]\, Y => \FILT_OUT[6]_net_1\);
    
    \SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \SUM_IN_A_1[4]\, B => \SUM_IN_A_tmr2_1[4]\, C
         => \SUM_IN_A_tmr3_1[4]\, Y => \SUM_IN_A[4]_net_1\);
    
    \FILT_OUT[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_1[1]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \THRESH_VAL_maj_RNIBOJI5_0[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_95, Y => N_93);
    
    \THRESH_VAL_maj_RNIBOJI5[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_113, Y => \THRESH_VAL_ns[0]\);
    
    \FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y_1, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_1[5]\);
    
    \SIG_IN_DEL_maj_RNIKR8E[0]\ : XOR2
      port map(A => FPGA_FUSE_3_4_OK_c_0, B => 
        \SIG_IN_DEL[0]_net_1\, Y => 
        \SIG_IN_DEL_maj_RNIKR8E[0]_net_1\);
    
    \SUM_IN_A[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIKR8E_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_1[5]\);
    
    \FILT_OUT[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_1[2]\);
    
    \SIG_IN_DEL_tmr3[0]\ : DFN1C0
      port map(D => FPGA_FUSE_3_4_OK_c_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIG_IN_DEL_tmr3_1[0]\);
    
    \FILT_OUT_maj_RNILTKFJ_0[7]\ : AO13
      port map(A => N89, B => \FILT_OUT[7]_net_1\, C => i12_mux, 
        Y => \FILT_OUT_maj_RNILTKFJ_0[7]_net_1\);
    
    \FILT_OUT[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNILTKFJ_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_1[7]\);
    
    \FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_1[2]\);
    
    \FILT_OUT_maj_RNILTKFJ[7]\ : XNOR3
      port map(A => \FILT_OUT[7]_net_1\, B => i12_mux, C => N89, 
        Y => \FILT_OUT_maj_RNILTKFJ[7]_net_1\);
    
    \FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_1[4]\);
    
    un1_tmp_sum_in_b_0_m13 : AO18
      port map(A => \FILT_OUT[4]_net_1\, B => i6_mux, C => 
        \FILT_OUT[5]_net_1\, Y => i8_mux);
    
    \FILT_OUT[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_1[0]\);
    
    SIGOUT_maj : MAJ3
      port map(A => SIGOUT_1, B => SIGOUT_tmr2_1, C => 
        SIGOUT_tmr3_1, Y => \UVL_OK_CH3A4\);
    
    un1_tmp_sum_in_b_0_m4 : OAI1
      port map(A => \FILT_OUT[2]_net_1\, B => \FILT_OUT[0]_net_1\, 
        C => \FILT_OUT[1]_net_1\, Y => i2_mux);
    
    \FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_1[1]\);
    
    un2_n_filt_out_0_ADD_4x4_fast_I6_Y : XOR3
      port map(A => N_23_i, B => \SUM_IN_A[5]_net_1\, C => N92, Y
         => ADD_4x4_fast_I6_Y_1);
    
    \FILT_OUT[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_1[3]\);
    
    \THRESH_VAL[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNICPJI5[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_1[1]\);
    
    \SIG_IN_DEL_tmr2[0]\ : DFN1C0
      port map(D => FPGA_FUSE_3_4_OK_c_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIG_IN_DEL_tmr2_1[0]\);
    
    un1_tmp_sum_in_b_0_m16 : AO18
      port map(A => \FILT_OUT[5]_net_1\, B => i8_mux, C => 
        \FILT_OUT[6]_net_1\, Y => i10_mux);
    
    SIGOUT_maj_RNIHDUN8 : MX2
      port map(A => N_94, B => \UVL_OK_CH3A4\, S => N_93, Y => 
        \SIGOUT_maj_RNIHDUN8\);
    
    \FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNILTKFJ[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_1[6]\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_tmp_sum_in_b_0_m26 : XNOR3
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        C => i6_mux, Y => N_27_i);
    
    un1_tmp_sum_in_b_0_m19 : AO18
      port map(A => \FILT_OUT[6]_net_1\, B => i10_mux, C => 
        \FILT_OUT[7]_net_1\, Y => i12_mux);
    
    \THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNICPJI5[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr3_1[1]\);
    
    \FILT_OUT_maj_RNIPF4F1[3]\ : NOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => \FILT_OUT[6]_net_1\, Y => n_sigout15lto7_2);
    
    \FILT_OUT_maj_RNI83IE2[7]\ : AO1
      port map(A => n_sigout3lto6_1, B => n_sigout3lto6_0, C => 
        \FILT_OUT[7]_net_1\, Y => n_sigout3);
    
    un1_tmp_sum_in_b_0_m30 : XNOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[2]_net_1\, 
        C => i2_mux, Y => N_31_i);
    
    \SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIKR8E[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr2_1[4]\);
    
    \FILT_OUT_maj[7]\ : MAJ3
      port map(A => \FILT_OUT_1[7]\, B => \FILT_OUT_tmr2_1[7]\, C
         => \FILT_OUT_tmr3_1[7]\, Y => \FILT_OUT[7]_net_1\);
    
    \THRESH_VAL_maj_RNIMS9P2[1]\ : NOR3C
      port map(A => n_sigout15lto7_1, B => n_sigout15lto7_2, C
         => \THRESH_VAL[1]_net_1\, Y => N_113);
    
    un1_tmp_sum_in_b_0_m15 : XOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => N_40);
    
    \SIG_IN_DEL_maj_RNIKR8E_0[0]\ : NOR2B
      port map(A => \SIG_IN_DEL[0]_net_1\, B => 
        FPGA_FUSE_3_4_OK_c_0, Y => 
        \SIG_IN_DEL_maj_RNIKR8E_0[0]_net_1\);
    
    \FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNILTKFJ[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_1[6]\);
    
    \SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIKR8E[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr3_1[4]\);
    
    un1_tmp_sum_in_b_0_m7 : AO18
      port map(A => \FILT_OUT[2]_net_1\, B => i2_mux, C => 
        \FILT_OUT[3]_net_1\, Y => i4_mux);
    
    un2_n_filt_out_1_ADD_4x4_fast_I4_Y_0 : MAJ3
      port map(A => N_23_i, B => \SUM_IN_A[5]_net_1\, C => N92, Y
         => N89);
    
    un1_tmp_sum_in_b_0_m28 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[3]_net_1\, 
        C => i4_mux, Y => N_29_i);
    
    \SIG_IN_DEL_maj[0]\ : MAJ3
      port map(A => \SIG_IN_DEL_1[0]\, B => 
        \SIG_IN_DEL_tmr2_1[0]\, C => \SIG_IN_DEL_tmr3_1[0]\, Y
         => \SIG_IN_DEL[0]_net_1\);
    
    SIGOUT : DFN1C0
      port map(D => \SIGOUT_maj_RNIHDUN8\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        SIGOUT_1);
    
    \FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNILTKFJ_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_1[7]\);
    
    \FILT_OUT_maj[5]\ : MAJ3
      port map(A => \FILT_OUT_1[5]\, B => \FILT_OUT_tmr2_1[5]\, C
         => \FILT_OUT_tmr3_1[5]\, Y => \FILT_OUT[5]_net_1\);
    
    \FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_1[3]\);
    
    \FILT_OUT_maj_RNIFJDV[3]\ : NOR2B
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[6]_net_1\, 
        Y => n_sigout3lto6_0);
    
    un2_n_filt_out_0_ADD_4x4_fast_I0_S : XNOR3
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => \un2_n_filt_out0[28]\);
    
    \THRESH_VAL_maj_RNIMS9P2_0[1]\ : AOI1B
      port map(A => n_sigout15lto7_2, B => n_sigout15lto7_1, C
         => \THRESH_VAL[1]_net_1\, Y => N_95);
    
    \THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \THRESH_VAL_1[1]\, B => 
        \THRESH_VAL_tmr2_1[1]\, C => \THRESH_VAL_tmr3_1[1]\, Y
         => \THRESH_VAL[1]_net_1\);
    
    \FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_1[2]\);
    
    \FILT_OUT_maj[1]\ : MAJ3
      port map(A => \FILT_OUT_1[1]\, B => \FILT_OUT_tmr2_1[1]\, C
         => \FILT_OUT_tmr3_1[1]\, Y => \FILT_OUT[1]_net_1\);
    
    \FILT_OUT_maj[0]\ : MAJ3
      port map(A => \FILT_OUT_1[0]\, B => \FILT_OUT_tmr2_1[0]\, C
         => \FILT_OUT_tmr3_1[0]\, Y => \FILT_OUT[0]_net_1\);
    
    un1_tmp_sum_in_b_0_m32 : AX1
      port map(A => \FILT_OUT[0]_net_1\, B => \FILT_OUT[1]_net_1\, 
        C => \FILT_OUT[2]_net_1\, Y => N_33_i);
    
    \SUM_IN_A_maj[5]\ : MAJ3
      port map(A => \SUM_IN_A_1[5]\, B => \SUM_IN_A_tmr2_1[5]\, C
         => \SUM_IN_A_tmr3_1[5]\, Y => \SUM_IN_A[5]_net_1\);
    
    \SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIKR8E_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr3_1[5]\);
    
    \THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr2_1[0]\);
    
    \THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \THRESH_VAL_1[0]\, B => 
        \THRESH_VAL_tmr2_1[0]\, C => \THRESH_VAL_tmr3_1[0]\, Y
         => \THRESH_VAL[0]_net_1\);
    
    \FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_1[1]\);
    
    un2_n_filt_out_0_ADD_4x4_fast_I0_CO1 : XA1A
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => N92);
    
    \FILT_OUT[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y_1, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_1[5]\);
    
    \THRESH_VAL_maj_RNICPJI5[1]\ : OA1B
      port map(A => \THRESH_VAL[1]_net_1\, B => n_sigout3, C => 
        N_113, Y => \THRESH_VAL_maj_RNICPJI5[1]_net_1\);
    
    un1_tmp_sum_in_b_0_m10 : AO18
      port map(A => \FILT_OUT[3]_net_1\, B => i4_mux, C => 
        \FILT_OUT[4]_net_1\, Y => i6_mux);
    
    \FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_1[0]\);
    
    \FILT_OUT_maj[2]\ : MAJ3
      port map(A => \FILT_OUT_1[2]\, B => \FILT_OUT_tmr2_1[2]\, C
         => \FILT_OUT_tmr3_1[2]\, Y => \FILT_OUT[2]_net_1\);
    
    \FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_1[4]\);
    
    \FILT_OUT_maj[4]\ : MAJ3
      port map(A => \FILT_OUT_1[4]\, B => \FILT_OUT_tmr2_1[4]\, C
         => \FILT_OUT_tmr3_1[4]\, Y => \FILT_OUT[4]_net_1\);
    
    \FILT_OUT_maj_RNIFJDV[4]\ : NOR2B
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout3lto6_1);
    
    \SUM_IN_A[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIKR8E[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_1[4]\);
    
    \FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y_1, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_1[5]\);
    
    \FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_1[0]\);
    
    \SIG_IN_DEL[0]\ : DFN1C0
      port map(D => FPGA_FUSE_3_4_OK_c_0, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SIG_IN_DEL_1[0]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity IIR_FILT_4 is

    port( TEMP_OK_c_0          : in    std_logic;
          POR_OUT_TO_SCA_c     : in    std_logic;
          BUF5M_J11_15_TCONN_c : in    std_logic;
          STATUS_LED_c         : out   std_logic;
          STATUS_LED_c_0       : out   std_logic
        );

end IIR_FILT_4;

architecture DEF_ARCH of IIR_FILT_4 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AOI1B
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

  component MAJ3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1B
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

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component OAI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XOR3
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

  component NOR3C
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

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component AO1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XA1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO13
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal SIGOUT_3, SIGOUT_tmr2_3, SIGOUT_tmr3_3, N_23_i, 
        \FILT_OUT[6]_net_1\, \FILT_OUT[7]_net_1\, i10_mux, i2_mux, 
        \FILT_OUT[2]_net_1\, \FILT_OUT[0]_net_1\, 
        \FILT_OUT[1]_net_1\, i4_mux, \FILT_OUT[3]_net_1\, i6_mux, 
        \FILT_OUT[4]_net_1\, i8_mux, \FILT_OUT[5]_net_1\, 
        \FILT_OUT_maj_RNITEJH4[7]_net_1\, i12_mux, N89, 
        \FILT_OUT_maj_RNITEJH4_0[7]_net_1\, \SUM_IN_A[5]_net_1\, 
        N92, n_sigout15lto7_2, n_sigout15lto7_1, n_sigout3lto6_1, 
        n_sigout3lto6_0, N_33_i, N_31_i, N_29_i, N_27_i, N_40, 
        \SUM_IN_A[4]_net_1\, \un2_n_filt_out0[28]\, n_sigout3, 
        \SIGOUT_maj_RNILN142\, \STATUS_LED_c\, N_93, N_95, 
        \THRESH_VAL[1]_net_1\, \THRESH_VAL[0]_net_1\, N_113, 
        \THRESH_VAL_ns[0]\, \THRESH_VAL_maj_RNIOLGD1[1]_net_1\, 
        ADD_4x4_fast_I6_Y, \SIG_IN_DEL_maj_RNIMR1A[0]_net_1\, 
        \SIG_IN_DEL[0]_net_1\, 
        \SIG_IN_DEL_maj_RNIMR1A_0[0]_net_1\, \FILT_OUT_3[7]\, 
        \FILT_OUT_tmr2_3[7]\, \FILT_OUT_tmr3_3[7]\, 
        \FILT_OUT_3[6]\, \FILT_OUT_tmr2_3[6]\, 
        \FILT_OUT_tmr3_3[6]\, \FILT_OUT_3[5]\, 
        \FILT_OUT_tmr2_3[5]\, \FILT_OUT_tmr3_3[5]\, 
        \FILT_OUT_3[4]\, \FILT_OUT_tmr2_3[4]\, 
        \FILT_OUT_tmr3_3[4]\, \FILT_OUT_3[3]\, 
        \FILT_OUT_tmr2_3[3]\, \FILT_OUT_tmr3_3[3]\, 
        \FILT_OUT_3[2]\, \FILT_OUT_tmr2_3[2]\, 
        \FILT_OUT_tmr3_3[2]\, \FILT_OUT_3[1]\, 
        \FILT_OUT_tmr2_3[1]\, \FILT_OUT_tmr3_3[1]\, 
        \FILT_OUT_3[0]\, \FILT_OUT_tmr2_3[0]\, 
        \FILT_OUT_tmr3_3[0]\, \SUM_IN_A_3[5]\, 
        \SUM_IN_A_tmr2_3[5]\, \SUM_IN_A_tmr3_3[5]\, 
        \SUM_IN_A_3[4]\, \SUM_IN_A_tmr2_3[4]\, 
        \SUM_IN_A_tmr3_3[4]\, \THRESH_VAL_3[1]\, 
        \THRESH_VAL_tmr2_3[1]\, \THRESH_VAL_tmr3_3[1]\, 
        \THRESH_VAL_3[0]\, \THRESH_VAL_tmr2_3[0]\, 
        \THRESH_VAL_tmr3_3[0]\, \SIG_IN_DEL_3[0]\, 
        \SIG_IN_DEL_tmr2_3[0]\, \SIG_IN_DEL_tmr3_3[0]\, \GND\, 
        \VCC\ : std_logic;

begin 

    STATUS_LED_c <= \STATUS_LED_c\;

    \FILT_OUT[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_3[4]\);
    
    \THRESH_VAL_maj_RNISAOM_0[1]\ : AOI1B
      port map(A => n_sigout15lto7_2, B => n_sigout15lto7_1, C
         => \THRESH_VAL[1]_net_1\, Y => N_95);
    
    SIGOUT_tmr2 : DFN1C0
      port map(D => \SIGOUT_maj_RNILN142\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        SIGOUT_tmr2_3);
    
    \THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIOLGD1[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr2_3[1]\);
    
    \SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIMR1A_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr2_3[5]\);
    
    \FILT_OUT[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNITEJH4[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_3[6]\);
    
    \THRESH_VAL[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_3[0]\);
    
    SIGOUT_tmr3 : DFN1C0
      port map(D => \SIGOUT_maj_RNILN142\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        SIGOUT_tmr3_3);
    
    un1_tmp_sum_in_b_0_m22 : XNOR3
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => i10_mux, Y => N_23_i);
    
    \THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr3_3[0]\);
    
    \FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNITEJH4_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_3[7]\);
    
    \FILT_OUT_maj[3]\ : MAJ3
      port map(A => \FILT_OUT_3[3]\, B => \FILT_OUT_tmr2_3[3]\, C
         => \FILT_OUT_tmr3_3[3]\, Y => \FILT_OUT[3]_net_1\);
    
    \FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_3[3]\);
    
    \THRESH_VAL_maj_RNIOLGD1[1]\ : OA1B
      port map(A => n_sigout3, B => \THRESH_VAL[1]_net_1\, C => 
        N_113, Y => \THRESH_VAL_maj_RNIOLGD1[1]_net_1\);
    
    \FILT_OUT_maj[6]\ : MAJ3
      port map(A => \FILT_OUT_3[6]\, B => \FILT_OUT_tmr2_3[6]\, C
         => \FILT_OUT_tmr3_3[6]\, Y => \FILT_OUT[6]_net_1\);
    
    \SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \SUM_IN_A_3[4]\, B => \SUM_IN_A_tmr2_3[4]\, C
         => \SUM_IN_A_tmr3_3[4]\, Y => \SUM_IN_A[4]_net_1\);
    
    \FILT_OUT[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_3[1]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_3[5]\);
    
    SIGOUT_maj_0 : MAJ3
      port map(A => SIGOUT_3, B => SIGOUT_tmr2_3, C => 
        SIGOUT_tmr3_3, Y => STATUS_LED_c_0);
    
    \SUM_IN_A[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIMR1A_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_3[5]\);
    
    \FILT_OUT[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_3[2]\);
    
    \SIG_IN_DEL_tmr3[0]\ : DFN1C0
      port map(D => TEMP_OK_c_0, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \SIG_IN_DEL_tmr3_3[0]\);
    
    \FILT_OUT[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNITEJH4_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_3[7]\);
    
    \FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_3[2]\);
    
    \FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_3[4]\);
    
    \FILT_OUT_maj_RNIS59B[3]\ : NOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => \FILT_OUT[6]_net_1\, Y => n_sigout15lto7_2);
    
    un1_tmp_sum_in_b_0_m13 : AO18
      port map(A => \FILT_OUT[4]_net_1\, B => i6_mux, C => 
        \FILT_OUT[5]_net_1\, Y => i8_mux);
    
    \FILT_OUT[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_3[0]\);
    
    SIGOUT_maj : MAJ3
      port map(A => SIGOUT_3, B => SIGOUT_tmr2_3, C => 
        SIGOUT_tmr3_3, Y => \STATUS_LED_c\);
    
    un1_tmp_sum_in_b_0_m4 : OAI1
      port map(A => \FILT_OUT[2]_net_1\, B => \FILT_OUT[0]_net_1\, 
        C => \FILT_OUT[1]_net_1\, Y => i2_mux);
    
    \FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_3[1]\);
    
    \FILT_OUT_maj_RNIDTPI[7]\ : AO1
      port map(A => n_sigout3lto6_1, B => n_sigout3lto6_0, C => 
        \FILT_OUT[7]_net_1\, Y => n_sigout3);
    
    un2_n_filt_out_0_ADD_4x4_fast_I6_Y : XOR3
      port map(A => N_23_i, B => \SUM_IN_A[5]_net_1\, C => N92, Y
         => ADD_4x4_fast_I6_Y);
    
    \FILT_OUT[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_3[3]\);
    
    \THRESH_VAL[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIOLGD1[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_3[1]\);
    
    \SIG_IN_DEL_tmr2[0]\ : DFN1C0
      port map(D => TEMP_OK_c_0, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \SIG_IN_DEL_tmr2_3[0]\);
    
    \SIG_IN_DEL_maj_RNIMR1A[0]\ : XOR2
      port map(A => TEMP_OK_c_0, B => \SIG_IN_DEL[0]_net_1\, Y
         => \SIG_IN_DEL_maj_RNIMR1A[0]_net_1\);
    
    un1_tmp_sum_in_b_0_m16 : AO18
      port map(A => \FILT_OUT[5]_net_1\, B => i8_mux, C => 
        \FILT_OUT[6]_net_1\, Y => i10_mux);
    
    \THRESH_VAL_maj_RNISAOM[1]\ : NOR3C
      port map(A => n_sigout15lto7_1, B => n_sigout15lto7_2, C
         => \THRESH_VAL[1]_net_1\, Y => N_113);
    
    \FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNITEJH4[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr2_3[6]\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_tmp_sum_in_b_0_m26 : XNOR3
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        C => i6_mux, Y => N_27_i);
    
    un1_tmp_sum_in_b_0_m19 : AO18
      port map(A => \FILT_OUT[6]_net_1\, B => i10_mux, C => 
        \FILT_OUT[7]_net_1\, Y => i12_mux);
    
    \THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIOLGD1[1]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr3_3[1]\);
    
    un1_tmp_sum_in_b_0_m30 : XNOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[2]_net_1\, 
        C => i2_mux, Y => N_31_i);
    
    \SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIMR1A[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr2_3[4]\);
    
    \FILT_OUT_maj[7]\ : MAJ3
      port map(A => \FILT_OUT_3[7]\, B => \FILT_OUT_tmr2_3[7]\, C
         => \FILT_OUT_tmr3_3[7]\, Y => \FILT_OUT[7]_net_1\);
    
    \FILT_OUT_maj_RNIHNG7[4]\ : NOR2B
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout3lto6_1);
    
    un1_tmp_sum_in_b_0_m15 : XOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => N_40);
    
    \FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNITEJH4[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_3[6]\);
    
    \SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIMR1A[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr3_3[4]\);
    
    un1_tmp_sum_in_b_0_m7 : AO18
      port map(A => \FILT_OUT[2]_net_1\, B => i2_mux, C => 
        \FILT_OUT[3]_net_1\, Y => i4_mux);
    
    un2_n_filt_out_1_ADD_4x4_fast_I4_Y_0 : MAJ3
      port map(A => N_23_i, B => \SUM_IN_A[5]_net_1\, C => N92, Y
         => N89);
    
    un1_tmp_sum_in_b_0_m28 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[3]_net_1\, 
        C => i4_mux, Y => N_29_i);
    
    \SIG_IN_DEL_maj[0]\ : MAJ3
      port map(A => \SIG_IN_DEL_3[0]\, B => 
        \SIG_IN_DEL_tmr2_3[0]\, C => \SIG_IN_DEL_tmr3_3[0]\, Y
         => \SIG_IN_DEL[0]_net_1\);
    
    SIGOUT : DFN1C0
      port map(D => \SIGOUT_maj_RNILN142\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        SIGOUT_3);
    
    \FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => \FILT_OUT_maj_RNITEJH4_0[7]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_3[7]\);
    
    \FILT_OUT_maj[5]\ : MAJ3
      port map(A => \FILT_OUT_3[5]\, B => \FILT_OUT_tmr2_3[5]\, C
         => \FILT_OUT_tmr3_3[5]\, Y => \FILT_OUT[5]_net_1\);
    
    \FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => N_27_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_3[3]\);
    
    \FILT_OUT_maj_RNITEJH4[7]\ : XNOR3
      port map(A => \FILT_OUT[7]_net_1\, B => i12_mux, C => N89, 
        Y => \FILT_OUT_maj_RNITEJH4[7]_net_1\);
    
    un2_n_filt_out_0_ADD_4x4_fast_I0_S : XNOR3
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => \un2_n_filt_out0[28]\);
    
    \FILT_OUT_maj_RNIHNG7[3]\ : NOR2B
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[6]_net_1\, 
        Y => n_sigout3lto6_0);
    
    \THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \THRESH_VAL_3[1]\, B => 
        \THRESH_VAL_tmr2_3[1]\, C => \THRESH_VAL_tmr3_3[1]\, Y
         => \THRESH_VAL[1]_net_1\);
    
    \FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => N_29_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_3[2]\);
    
    \FILT_OUT_maj[1]\ : MAJ3
      port map(A => \FILT_OUT_3[1]\, B => \FILT_OUT_tmr2_3[1]\, C
         => \FILT_OUT_tmr3_3[1]\, Y => \FILT_OUT[1]_net_1\);
    
    \FILT_OUT_maj[0]\ : MAJ3
      port map(A => \FILT_OUT_3[0]\, B => \FILT_OUT_tmr2_3[0]\, C
         => \FILT_OUT_tmr3_3[0]\, Y => \FILT_OUT[0]_net_1\);
    
    un1_tmp_sum_in_b_0_m32 : AX1
      port map(A => \FILT_OUT[0]_net_1\, B => \FILT_OUT[1]_net_1\, 
        C => \FILT_OUT[2]_net_1\, Y => N_33_i);
    
    \SUM_IN_A_maj[5]\ : MAJ3
      port map(A => \SUM_IN_A_3[5]\, B => \SUM_IN_A_tmr2_3[5]\, C
         => \SUM_IN_A_tmr3_3[5]\, Y => \SUM_IN_A[5]_net_1\);
    
    \THRESH_VAL_maj_RNINKGD1[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_113, Y => \THRESH_VAL_ns[0]\);
    
    \SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIMR1A_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_tmr3_3[5]\);
    
    \THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \THRESH_VAL_tmr2_3[0]\);
    
    \THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \THRESH_VAL_3[0]\, B => 
        \THRESH_VAL_tmr2_3[0]\, C => \THRESH_VAL_tmr3_3[0]\, Y
         => \THRESH_VAL[0]_net_1\);
    
    \FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => N_31_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_3[1]\);
    
    \FILT_OUT_maj_RNIHNG7_0[4]\ : NOR2
      port map(A => \FILT_OUT[5]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout15lto7_1);
    
    un2_n_filt_out_0_ADD_4x4_fast_I0_CO1 : XA1A
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => N92);
    
    \FILT_OUT[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_3[5]\);
    
    un1_tmp_sum_in_b_0_m10 : AO18
      port map(A => \FILT_OUT[3]_net_1\, B => i4_mux, C => 
        \FILT_OUT[4]_net_1\, Y => i6_mux);
    
    \FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr3_3[0]\);
    
    \FILT_OUT_maj[2]\ : MAJ3
      port map(A => \FILT_OUT_3[2]\, B => \FILT_OUT_tmr2_3[2]\, C
         => \FILT_OUT_tmr3_3[2]\, Y => \FILT_OUT[2]_net_1\);
    
    SIGOUT_maj_RNILN142 : MX2
      port map(A => n_sigout3, B => \STATUS_LED_c\, S => N_93, Y
         => \SIGOUT_maj_RNILN142\);
    
    \SIG_IN_DEL_maj_RNIMR1A_0[0]\ : NOR2B
      port map(A => \SIG_IN_DEL[0]_net_1\, B => TEMP_OK_c_0, Y
         => \SIG_IN_DEL_maj_RNIMR1A_0[0]_net_1\);
    
    \FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => \un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_3[4]\);
    
    \FILT_OUT_maj[4]\ : MAJ3
      port map(A => \FILT_OUT_3[4]\, B => \FILT_OUT_tmr2_3[4]\, C
         => \FILT_OUT_tmr3_3[4]\, Y => \FILT_OUT[4]_net_1\);
    
    \THRESH_VAL_maj_RNINKGD1_0[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_95, Y => N_93);
    
    \SUM_IN_A[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIMR1A[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \SUM_IN_A_3[4]\);
    
    \FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => ADD_4x4_fast_I6_Y, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \FILT_OUT_tmr3_3[5]\);
    
    \FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => N_33_i, CLK => BUF5M_J11_15_TCONN_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \FILT_OUT_tmr2_3[0]\);
    
    \FILT_OUT_maj_RNITEJH4_0[7]\ : AO13
      port map(A => N89, B => \FILT_OUT[7]_net_1\, C => i12_mux, 
        Y => \FILT_OUT_maj_RNITEJH4_0[7]_net_1\);
    
    \SIG_IN_DEL[0]\ : DFN1C0
      port map(D => TEMP_OK_c_0, CLK => BUF5M_J11_15_TCONN_c, CLR
         => POR_OUT_TO_SCA_c, Q => \SIG_IN_DEL_3[0]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity TOP_LVR_GEN3_CNTL is

    port( CLK40M_OSC         : in    std_logic;
          POR_FPGA           : in    std_logic;
          FPGA_FUSE_1_2_OK   : in    std_logic_vector(0 to 0);
          FPGA_FUSE_3_4_OK   : in    std_logic_vector(0 to 0);
          FPGA_FUSE_5_6_OK   : in    std_logic_vector(0 to 0);
          FPGA_FUSE_7_8_OK   : in    std_logic_vector(0 to 0);
          TEMP_OK            : in    std_logic_vector(0 to 0);
          MODE_DCYC_NORMB    : in    std_logic;
          MODE_WDT_EN        : in    std_logic;
          MODE_DIAG_NORMB    : in    std_logic;
          CH1_2_MS_CFG_EN    : in    std_logic;
          CH3_4_MS_CFG_EN    : in    std_logic;
          CH5_6_MS_CFG_EN    : in    std_logic;
          CH7_8_MS_CFG_EN    : in    std_logic;
          MAN_EN_CH_4TO1     : in    std_logic;
          MAN_EN_CH_8TO5     : in    std_logic;
          TEMP_FAILSAFE_EN   : in    std_logic;
          STDBY_OFFB         : in    std_logic;
          RX_FPGA            : in    std_logic;
          TX_FPGA            : out   std_logic;
          PRI_RX_EN_BAR      : out   std_logic;
          PRI_TX_EN          : out   std_logic;
          ADDR_SEL           : in    std_logic_vector(4 downto 0);
          SCA_CLK_OUT        : in    std_logic;
          SCA_RESET_OUT      : in    std_logic;
          SCA_DAT_IN         : out   std_logic;
          SCA_DAT_OUT        : in    std_logic;
          POR_OUT_TO_SCA     : out   std_logic;
          P_CH_MREG_EN       : out   std_logic_vector(7 downto 0);
          P_CH_IAUX_EN       : out   std_logic_vector(7 downto 0);
          P_CH_VOSG_EN       : out   std_logic_vector(7 downto 0);
          PWR_OK_LED         : out   std_logic;
          STATUS_LED         : out   std_logic;
          BUF5M_J11_15_TCONN : out   std_logic;
          UNUSED_1           : in    std_logic;
          UNUSED_2           : in    std_logic;
          J11_25_TCONN       : in    std_logic;
          J11_27_TCONN       : in    std_logic;
          J11_17_TCONN       : out   std_logic;
          J11_19_TCONN       : out   std_logic;
          J11_21_TCONN       : out   std_logic;
          J11_23_TCONN       : out   std_logic
        );

end TOP_LVR_GEN3_CNTL;

architecture DEF_ARCH of TOP_LVR_GEN3_CNTL is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component IIR_FILT_4_3
    port( FPGA_FUSE_7_8_OK_c_0 : in    std_logic := 'U';
          POR_OUT_TO_SCA_c     : in    std_logic := 'U';
          BUF5M_J11_15_TCONN_c : in    std_logic := 'U';
          UVL_OK_CH7A8         : out   std_logic
        );
  end component;

  component MAJ3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OUTBUF
    port( D   : in    std_logic := 'U';
          PAD : out   std_logic
        );
  end component;

  component IIR_FILT_4_2
    port( FPGA_FUSE_5_6_OK_c_0 : in    std_logic := 'U';
          POR_OUT_TO_SCA_c     : in    std_logic := 'U';
          BUF5M_J11_15_TCONN_c : in    std_logic := 'U';
          UVL_OK_CH5A6         : out   std_logic
        );
  end component;

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component CLKINT
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component INBUF
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component MAIN_SEQUENCER_NEW_3_1
    port( REGISTER_CH_CMD_CH_0 : in    std_logic := 'U';
          P_CH_VOSG_EN_c       : out   std_logic_vector(5 downto 4);
          P_CH_MREG_EN_c_c_0   : out   std_logic;
          P_CH_IAUX_EN_c_c_0   : out   std_logic;
          POR_OUT_TO_SCA_c     : in    std_logic := 'U';
          BUF5M_J11_15_TCONN_c : in    std_logic := 'U';
          CH5_6_MS_CFG_EN_c    : in    std_logic := 'U';
          STATUS_LED_c_0       : in    std_logic := 'U';
          DTYCYC_EN            : in    std_logic := 'U';
          un3_n_ch_vosg_en     : out   std_logic;
          CH_ACTIVE_STAT       : out   std_logic;
          STDBY_OFFB_B         : in    std_logic := 'U';
          UVL_OK_CH5A6         : in    std_logic := 'U';
          STATUS_LED_c         : in    std_logic := 'U'
        );
  end component;

  component IIR_FILT_4_0
    port( FPGA_FUSE_1_2_OK_c_0 : in    std_logic := 'U';
          POR_OUT_TO_SCA_c     : in    std_logic := 'U';
          BUF5M_J11_15_TCONN_c : in    std_logic := 'U';
          UVL_OK_CH7A8         : in    std_logic := 'U';
          UVL_OK_CH5A6         : in    std_logic := 'U';
          PWR_OK_LED_c         : out   std_logic;
          UVL_OK_CH3A4         : in    std_logic := 'U';
          UVL_OK_CH1A2         : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component XOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MAIN_SEQUENCER_NEW_3_0
    port( P_CH_IAUX_EN_c_c_0   : out   std_logic;
          P_CH_MREG_EN_c_c_0   : out   std_logic;
          P_CH_VOSG_EN_c       : out   std_logic_vector(3 downto 2);
          DTYCYC_CNT           : in    std_logic_vector(4 downto 0) := (others => 'U');
          REGISTER_CH_CMD_CH_0 : in    std_logic := 'U';
          N_CH_VOSG_EN_7_1_0   : out   std_logic;
          POR_OUT_TO_SCA_c     : in    std_logic := 'U';
          BUF5M_J11_15_TCONN_c : in    std_logic := 'U';
          MAN_EN_CH_4TO1_A_14  : out   std_logic;
          MAN_EN_CH_8TO5_A_15  : out   std_logic;
          STDBY_OFFB_c         : in    std_logic := 'U';
          STDBY_OFFB_A_16      : out   std_logic;
          MAN_EN_CH_4TO1_B_17  : out   std_logic;
          MAN_EN_CH_8TO5_B_18  : out   std_logic;
          STDBY_OFFB_A         : in    std_logic := 'U';
          STDBY_OFFB_B_19      : out   std_logic;
          DTYCYC_EN_20         : out   std_logic;
          DTYCYC_CNT_21        : out   std_logic;
          DTYCYC_CNT_22        : out   std_logic;
          DTYCYC_CNT_23        : out   std_logic;
          DTYCYC_CNT_24        : out   std_logic;
          DTYCYC_CNT_25        : out   std_logic;
          N_23_i_c             : in    std_logic := 'U';
          MODE_DCYC_NORMB_c    : in    std_logic := 'U';
          DTYCYC_EN            : in    std_logic := 'U';
          CH3_4_MS_CFG_EN_c    : in    std_logic := 'U';
          STATUS_LED_c_0       : in    std_logic := 'U';
          CH_ACTIVE_STAT       : in    std_logic := 'U';
          MAN_EN_CH_4TO1_A     : in    std_logic := 'U';
          MAN_EN_CH_4TO1_c     : in    std_logic := 'U';
          MAN_EN_CH_4TO1_B     : in    std_logic := 'U';
          man_en_ch_4to1       : out   std_logic;
          MAN_EN_CH_8TO5_A     : in    std_logic := 'U';
          MAN_EN_CH_8TO5_c     : in    std_logic := 'U';
          MAN_EN_CH_8TO5_B     : in    std_logic := 'U';
          man_en_ch_8to5       : out   std_logic;
          STDBY_OFFB_B         : in    std_logic := 'U';
          UVL_OK_CH3A4         : in    std_logic := 'U';
          STATUS_LED_c         : in    std_logic := 'U'
        );
  end component;

  component CLKBUF
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component AX1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component SLOW_PULSE_EN_GEN
    port( N_23_i_c             : out   std_logic;
          POR_OUT_TO_SCA_c     : in    std_logic := 'U';
          BUF5M_J11_15_TCONN_c : in    std_logic := 'U'
        );
  end component;

  component MAIN_SEQUENCER_NEW_3
    port( REGISTER_CH_CMD_CH_0 : in    std_logic := 'U';
          P_CH_IAUX_EN_c_c_0   : out   std_logic;
          P_CH_MREG_EN_c_c_0   : out   std_logic;
          P_CH_VOSG_EN_c       : out   std_logic_vector(1 downto 0);
          N_CH_VOSG_EN_7_1_0   : in    std_logic := 'U';
          POR_OUT_TO_SCA_c     : in    std_logic := 'U';
          BUF5M_J11_15_TCONN_c : in    std_logic := 'U';
          STATUS_LED_c         : in    std_logic := 'U';
          CH1_2_MS_CFG_EN_c    : in    std_logic := 'U';
          CH_ACTIVE_STAT       : out   std_logic;
          STDBY_OFFB_B         : in    std_logic := 'U';
          UVL_OK_CH1A2         : in    std_logic := 'U';
          STATUS_LED_c_0       : in    std_logic := 'U'
        );
  end component;

  component MAIN_SEQUENCER_NEW_3_2
    port( P_CH_IAUX_EN_c_c_0   : out   std_logic;
          P_CH_MREG_EN_c_c_0   : out   std_logic;
          P_CH_VOSG_EN_c       : out   std_logic_vector(7 downto 6);
          POR_OUT_TO_SCA_c     : in    std_logic := 'U';
          BUF5M_J11_15_TCONN_c : in    std_logic := 'U';
          STATUS_LED_c         : in    std_logic := 'U';
          CH7_8_MS_CFG_EN_c    : in    std_logic := 'U';
          un3_n_ch_vosg_en     : in    std_logic := 'U';
          CH_ACTIVE_STAT       : in    std_logic := 'U';
          STDBY_OFFB_B         : in    std_logic := 'U';
          UVL_OK_CH7A8         : in    std_logic := 'U';
          STATUS_LED_c_0       : in    std_logic := 'U'
        );
  end component;

  component IIR_FILT_4_1
    port( FPGA_FUSE_3_4_OK_c_0 : in    std_logic := 'U';
          POR_OUT_TO_SCA_c     : in    std_logic := 'U';
          BUF5M_J11_15_TCONN_c : in    std_logic := 'U';
          UVL_OK_CH3A4         : out   std_logic
        );
  end component;

  component IIR_FILT_4
    port( TEMP_OK_c_0          : in    std_logic := 'U';
          POR_OUT_TO_SCA_c     : in    std_logic := 'U';
          BUF5M_J11_15_TCONN_c : in    std_logic := 'U';
          STATUS_LED_c         : out   std_logic;
          STATUS_LED_c_0       : out   std_logic
        );
  end component;

  component INV
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal \DEBOUNCE.man_en_ch_4to1\, \DEBOUNCE.man_en_ch_8to5\, 
        \REFCNT_maj_RNI76JC[1]_net_1\, MAN_EN_CH_4TO1_A_14, 
        MAN_EN_CH_8TO5_A_15, STDBY_OFFB_A_16, MAN_EN_CH_4TO1_B_17, 
        MAN_EN_CH_8TO5_B_18, STDBY_OFFB_B_19, DTYCYC_EN_20, 
        DTYCYC_CNT_21, DTYCYC_CNT_22, DTYCYC_CNT_23, 
        DTYCYC_CNT_24, DTYCYC_CNT_25, SUM1, CLK40M_OSC_c, 
        POR_FPGA_c, \FPGA_FUSE_1_2_OK_c[0]\, 
        \FPGA_FUSE_3_4_OK_c[0]\, \FPGA_FUSE_5_6_OK_c[0]\, 
        \FPGA_FUSE_7_8_OK_c[0]\, \TEMP_OK_c[0]\, 
        MODE_DCYC_NORMB_c, CH1_2_MS_CFG_EN_c, CH3_4_MS_CFG_EN_c, 
        CH5_6_MS_CFG_EN_c, CH7_8_MS_CFG_EN_c, MAN_EN_CH_4TO1_c, 
        MAN_EN_CH_8TO5_c, STDBY_OFFB_c, \VCC\, POR_OUT_TO_SCA_c, 
        PWR_OK_LED_c, BUF5M_J11_15_TCONN_c, \GND\, 
        \CONTROL56.MAIN_SEQUENCER.un3_n_ch_vosg_en\, 
        \CONTROL34.MAIN_SEQUENCER.N_CH_VOSG_EN_7_1[1]\, 
        \REFCNT[1]_net_1\, \REFCNT[0]_net_1\, \MAN_EN_CH_4TO1_A\, 
        \MAN_EN_CH_8TO5_A\, \STDBY_OFFB_A\, \MAN_EN_CH_4TO1_B\, 
        \MAN_EN_CH_8TO5_B\, \STDBY_OFFB_B\, \CLK_5M_GL\, 
        \DTYCYC_EN\, \DTYCYC_CNT[4]_net_1\, \DTYCYC_CNT[3]_net_1\, 
        \DTYCYC_CNT[2]_net_1\, \DTYCYC_CNT[1]_net_1\, 
        \DTYCYC_CNT[0]_net_1\, \VAL_MAN_EN_CH_8TO5\, 
        \VAL_MAN_EN_CH_4TO1\, \DEL0_DEV_RST_B\, 
        \REGISTER_CH_CMD_CH[4]_net_1\, 
        \REGISTER_CH_CMD_CH[0]_net_1\, \MASTER_RST_B\, 
        UVL_OK_CH7A8, UVL_OK_CH5A6, UVL_OK_CH3A4, UVL_OK_CH1A2, 
        STATUS_LED_c, N_23_i_c, \P_CH_VOSG_EN_c[7]\, 
        \P_CH_VOSG_EN_c[6]\, \P_CH_IAUX_EN_c_c[6]\, 
        \P_CH_MREG_EN_c_c[6]\, \P_CH_VOSG_EN_c[5]\, 
        \P_CH_VOSG_EN_c[4]\, \P_CH_IAUX_EN_c_c[4]\, 
        \P_CH_MREG_EN_c_c[4]\, \CONTROL56.CH_ACTIVE_STAT\, 
        \P_CH_VOSG_EN_c[3]\, \P_CH_VOSG_EN_c[2]\, 
        \P_CH_IAUX_EN_c_c[2]\, \P_CH_MREG_EN_c_c[2]\, 
        \P_CH_VOSG_EN_c[1]\, \P_CH_VOSG_EN_c[0]\, 
        \P_CH_IAUX_EN_c_c[0]\, \P_CH_MREG_EN_c_c[0]\, 
        \CONTROL12.CH_ACTIVE_STAT\, MASTER_RST_B_0, 
        \MASTER_RST_B_tmr2\, \MASTER_RST_B_tmr3\, 
        \REGISTER_CH_CMD_CH_0[0]\, 
        \REGISTER_CH_CMD_CH_tmr2[0]_net_1\, 
        \REGISTER_CH_CMD_CH_tmr3[0]_net_1\, 
        \REGISTER_CH_CMD_CH_0[4]\, 
        \REGISTER_CH_CMD_CH_tmr2[4]_net_1\, 
        \REGISTER_CH_CMD_CH_tmr3[4]_net_1\, DEL0_DEV_RST_B_0, 
        \DEL0_DEV_RST_B_tmr2\, \DEL0_DEV_RST_B_tmr3\, 
        VAL_MAN_EN_CH_4TO1_0, \VAL_MAN_EN_CH_4TO1_tmr2\, 
        \VAL_MAN_EN_CH_4TO1_tmr3\, VAL_MAN_EN_CH_8TO5_0, 
        \VAL_MAN_EN_CH_8TO5_tmr2\, \VAL_MAN_EN_CH_8TO5_tmr3\, 
        \DTYCYC_CNT_0[0]\, \DTYCYC_CNT_tmr2[0]_net_1\, 
        \DTYCYC_CNT_tmr3[0]_net_1\, \DTYCYC_CNT_0[1]\, 
        \DTYCYC_CNT_tmr2[1]_net_1\, \DTYCYC_CNT_tmr3[1]_net_1\, 
        \DTYCYC_CNT_0[2]\, \DTYCYC_CNT_tmr2[2]_net_1\, 
        \DTYCYC_CNT_tmr3[2]_net_1\, \DTYCYC_CNT_0[3]\, 
        \DTYCYC_CNT_tmr2[3]_net_1\, \DTYCYC_CNT_tmr3[3]_net_1\, 
        \DTYCYC_CNT_0[4]\, \DTYCYC_CNT_tmr2[4]_net_1\, 
        \DTYCYC_CNT_tmr3[4]_net_1\, DTYCYC_EN_0, \DTYCYC_EN_tmr2\, 
        \DTYCYC_EN_tmr3\, CLK_5M_GL_0, \CLK_5M_GL_tmr2\, 
        \CLK_5M_GL_tmr3\, STDBY_OFFB_B_0, \STDBY_OFFB_B_tmr2\, 
        \STDBY_OFFB_B_tmr3\, MAN_EN_CH_8TO5_B_0, 
        \MAN_EN_CH_8TO5_B_tmr2\, \MAN_EN_CH_8TO5_B_tmr3\, 
        MAN_EN_CH_4TO1_B_0, \MAN_EN_CH_4TO1_B_tmr2\, 
        \MAN_EN_CH_4TO1_B_tmr3\, STDBY_OFFB_A_0, 
        \STDBY_OFFB_A_tmr2\, \STDBY_OFFB_A_tmr3\, 
        MAN_EN_CH_8TO5_A_0, \MAN_EN_CH_8TO5_A_tmr2\, 
        \MAN_EN_CH_8TO5_A_tmr3\, MAN_EN_CH_4TO1_A_0, 
        \MAN_EN_CH_4TO1_A_tmr2\, \MAN_EN_CH_4TO1_A_tmr3\, 
        \REFCNT_0[0]\, \REFCNT_tmr2[0]_net_1\, 
        \REFCNT_tmr3[0]_net_1\, \REFCNT_0[1]\, 
        \REFCNT_tmr2[1]_net_1\, \REFCNT_tmr3[1]_net_1\, 
        \REFCNT_i[0]\, STATUS_LED_c_0 : std_logic;

    for all : IIR_FILT_4_3
	Use entity work.IIR_FILT_4_3(DEF_ARCH);
    for all : IIR_FILT_4_2
	Use entity work.IIR_FILT_4_2(DEF_ARCH);
    for all : MAIN_SEQUENCER_NEW_3_1
	Use entity work.MAIN_SEQUENCER_NEW_3_1(DEF_ARCH);
    for all : IIR_FILT_4_0
	Use entity work.IIR_FILT_4_0(DEF_ARCH);
    for all : MAIN_SEQUENCER_NEW_3_0
	Use entity work.MAIN_SEQUENCER_NEW_3_0(DEF_ARCH);
    for all : SLOW_PULSE_EN_GEN
	Use entity work.SLOW_PULSE_EN_GEN(DEF_ARCH);
    for all : MAIN_SEQUENCER_NEW_3
	Use entity work.MAIN_SEQUENCER_NEW_3(DEF_ARCH);
    for all : MAIN_SEQUENCER_NEW_3_2
	Use entity work.MAIN_SEQUENCER_NEW_3_2(DEF_ARCH);
    for all : IIR_FILT_4_1
	Use entity work.IIR_FILT_4_1(DEF_ARCH);
    for all : IIR_FILT_4
	Use entity work.IIR_FILT_4(DEF_ARCH);
begin 


    \REFCNT_tmr2[1]\ : DFN1C0
      port map(D => SUM1, CLK => CLK40M_OSC_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \REFCNT_tmr2[1]_net_1\);
    
    UVL_78FUSE : IIR_FILT_4_3
      port map(FPGA_FUSE_7_8_OK_c_0 => \FPGA_FUSE_7_8_OK_c[0]\, 
        POR_OUT_TO_SCA_c => POR_OUT_TO_SCA_c, 
        BUF5M_J11_15_TCONN_c => BUF5M_J11_15_TCONN_c, 
        UVL_OK_CH7A8 => UVL_OK_CH7A8);
    
    \DTYCYC_CNT_maj[2]\ : MAJ3
      port map(A => \DTYCYC_CNT_0[2]\, B => 
        \DTYCYC_CNT_tmr2[2]_net_1\, C => 
        \DTYCYC_CNT_tmr3[2]_net_1\, Y => \DTYCYC_CNT[2]_net_1\);
    
    STDBY_OFFB_A_tmr3 : DFN1C0
      port map(D => STDBY_OFFB_A_16, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \STDBY_OFFB_A_tmr3\);
    
    \REFCNT_maj[1]\ : MAJ3
      port map(A => \REFCNT_0[1]\, B => \REFCNT_tmr2[1]_net_1\, C
         => \REFCNT_tmr3[1]_net_1\, Y => \REFCNT[1]_net_1\);
    
    DEL0_DEV_RST_B : DFN1C0
      port map(D => \VCC\, CLK => CLK40M_OSC_c, CLR => POR_FPGA_c, 
        Q => DEL0_DEV_RST_B_0);
    
    J11_21_TCONN_pad : OUTBUF
      port map(D => \GND\, PAD => J11_21_TCONN);
    
    \DTYCYC_CNT[2]\ : DFN1C0
      port map(D => DTYCYC_CNT_23, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_0[2]\);
    
    DEL0_DEV_RST_B_tmr3 : DFN1C0
      port map(D => \VCC\, CLK => CLK40M_OSC_c, CLR => POR_FPGA_c, 
        Q => \DEL0_DEV_RST_B_tmr3\);
    
    CLK_5M_GL_tmr3 : DFN1C0
      port map(D => \REFCNT_maj_RNI76JC[1]_net_1\, CLK => 
        CLK40M_OSC_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CLK_5M_GL_tmr3\);
    
    \P_CH_MREG_EN_pad[4]\ : OUTBUF
      port map(D => \P_CH_MREG_EN_c_c[4]\, PAD => P_CH_MREG_EN(4));
    
    \DTYCYC_CNT_tmr2[2]\ : DFN1C0
      port map(D => DTYCYC_CNT_23, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr2[2]_net_1\);
    
    UVL_56FUSE : IIR_FILT_4_2
      port map(FPGA_FUSE_5_6_OK_c_0 => \FPGA_FUSE_5_6_OK_c[0]\, 
        POR_OUT_TO_SCA_c => POR_OUT_TO_SCA_c, 
        BUF5M_J11_15_TCONN_c => BUF5M_J11_15_TCONN_c, 
        UVL_OK_CH5A6 => UVL_OK_CH5A6);
    
    \P_CH_MREG_EN_pad[1]\ : OUTBUF
      port map(D => \P_CH_MREG_EN_c_c[0]\, PAD => P_CH_MREG_EN(1));
    
    MAN_EN_CH_4TO1_B_tmr2 : DFN1C0
      port map(D => MAN_EN_CH_4TO1_B_17, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_4TO1_B_tmr2\);
    
    \DTYCYC_CNT[4]\ : DFN1P0
      port map(D => DTYCYC_CNT_21, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_0[4]\);
    
    BUF5M_J11_15_TCONN_inferred_clock : CLKINT
      port map(A => \CLK_5M_GL\, Y => BUF5M_J11_15_TCONN_c);
    
    \DTYCYC_CNT_tmr2[3]\ : DFN1C0
      port map(D => DTYCYC_CNT_22, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr2[3]_net_1\);
    
    MAN_EN_CH_8TO5_pad : INBUF
      port map(PAD => MAN_EN_CH_8TO5, Y => MAN_EN_CH_8TO5_c);
    
    \REGISTER_CH_CMD_CH_tmr2[0]\ : DFN1C0
      port map(D => \VAL_MAN_EN_CH_4TO1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \REGISTER_CH_CMD_CH_tmr2[0]_net_1\);
    
    \DTYCYC_CNT_tmr2[4]\ : DFN1P0
      port map(D => DTYCYC_CNT_21, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr2[4]_net_1\);
    
    \P_CH_VOSG_EN_pad[0]\ : OUTBUF
      port map(D => \P_CH_VOSG_EN_c[0]\, PAD => P_CH_VOSG_EN(0));
    
    PRI_TX_EN_pad : OUTBUF
      port map(D => \VCC\, PAD => PRI_TX_EN);
    
    \P_CH_VOSG_EN_pad[6]\ : OUTBUF
      port map(D => \P_CH_VOSG_EN_c[6]\, PAD => P_CH_VOSG_EN(6));
    
    MAN_EN_CH_8TO5_B : DFN1C0
      port map(D => MAN_EN_CH_8TO5_B_18, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        MAN_EN_CH_8TO5_B_0);
    
    \DTYCYC_CNT_maj[0]\ : MAJ3
      port map(A => \DTYCYC_CNT_0[0]\, B => 
        \DTYCYC_CNT_tmr2[0]_net_1\, C => 
        \DTYCYC_CNT_tmr3[0]_net_1\, Y => \DTYCYC_CNT[0]_net_1\);
    
    CONTROL56 : MAIN_SEQUENCER_NEW_3_1
      port map(REGISTER_CH_CMD_CH_0 => 
        \REGISTER_CH_CMD_CH[4]_net_1\, P_CH_VOSG_EN_c(5) => 
        \P_CH_VOSG_EN_c[5]\, P_CH_VOSG_EN_c(4) => 
        \P_CH_VOSG_EN_c[4]\, P_CH_MREG_EN_c_c_0 => 
        \P_CH_MREG_EN_c_c[4]\, P_CH_IAUX_EN_c_c_0 => 
        \P_CH_IAUX_EN_c_c[4]\, POR_OUT_TO_SCA_c => 
        POR_OUT_TO_SCA_c, BUF5M_J11_15_TCONN_c => 
        BUF5M_J11_15_TCONN_c, CH5_6_MS_CFG_EN_c => 
        CH5_6_MS_CFG_EN_c, STATUS_LED_c_0 => STATUS_LED_c_0, 
        DTYCYC_EN => \DTYCYC_EN\, un3_n_ch_vosg_en => 
        \CONTROL56.MAIN_SEQUENCER.un3_n_ch_vosg_en\, 
        CH_ACTIVE_STAT => \CONTROL56.CH_ACTIVE_STAT\, 
        STDBY_OFFB_B => \STDBY_OFFB_B\, UVL_OK_CH5A6 => 
        UVL_OK_CH5A6, STATUS_LED_c => STATUS_LED_c);
    
    POR_FPGA_pad : INBUF
      port map(PAD => POR_FPGA, Y => POR_FPGA_c);
    
    \P_CH_VOSG_EN_pad[3]\ : OUTBUF
      port map(D => \P_CH_VOSG_EN_c[3]\, PAD => P_CH_VOSG_EN(3));
    
    UVL_12FUSE : IIR_FILT_4_0
      port map(FPGA_FUSE_1_2_OK_c_0 => \FPGA_FUSE_1_2_OK_c[0]\, 
        POR_OUT_TO_SCA_c => POR_OUT_TO_SCA_c, 
        BUF5M_J11_15_TCONN_c => BUF5M_J11_15_TCONN_c, 
        UVL_OK_CH7A8 => UVL_OK_CH7A8, UVL_OK_CH5A6 => 
        UVL_OK_CH5A6, PWR_OK_LED_c => PWR_OK_LED_c, UVL_OK_CH3A4
         => UVL_OK_CH3A4, UVL_OK_CH1A2 => UVL_OK_CH1A2);
    
    MASTER_RST_B_maj_RNISC93 : CLKINT
      port map(A => \MASTER_RST_B\, Y => POR_OUT_TO_SCA_c);
    
    \P_CH_MREG_EN_pad[5]\ : OUTBUF
      port map(D => \P_CH_MREG_EN_c_c[4]\, PAD => P_CH_MREG_EN(5));
    
    STDBY_OFFB_B_tmr3 : DFN1C0
      port map(D => STDBY_OFFB_B_19, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \STDBY_OFFB_B_tmr3\);
    
    MODE_DCYC_NORMB_pad : INBUF
      port map(PAD => MODE_DCYC_NORMB, Y => MODE_DCYC_NORMB_c);
    
    DEL0_DEV_RST_B_maj : MAJ3
      port map(A => DEL0_DEV_RST_B_0, B => \DEL0_DEV_RST_B_tmr2\, 
        C => \DEL0_DEV_RST_B_tmr3\, Y => \DEL0_DEV_RST_B\);
    
    CLK_5M_GL_maj : MAJ3
      port map(A => CLK_5M_GL_0, B => \CLK_5M_GL_tmr2\, C => 
        \CLK_5M_GL_tmr3\, Y => \CLK_5M_GL\);
    
    \FPGA_FUSE_5_6_OK_pad[0]\ : INBUF
      port map(PAD => FPGA_FUSE_5_6_OK(0), Y => 
        \FPGA_FUSE_5_6_OK_c[0]\);
    
    \DTYCYC_CNT_tmr3[1]\ : DFN1P0
      port map(D => DTYCYC_CNT_24, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr3[1]_net_1\);
    
    J11_19_TCONN_pad : OUTBUF
      port map(D => \GND\, PAD => J11_19_TCONN);
    
    \DTYCYC_CNT_tmr3[4]\ : DFN1P0
      port map(D => DTYCYC_CNT_21, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr3[4]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \REGISTER_CH_CMD_CH[0]\ : DFN1C0
      port map(D => \VAL_MAN_EN_CH_4TO1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \REGISTER_CH_CMD_CH_0[0]\);
    
    MAN_EN_CH_4TO1_pad : INBUF
      port map(PAD => MAN_EN_CH_4TO1, Y => MAN_EN_CH_4TO1_c);
    
    \P_CH_VOSG_EN_pad[4]\ : OUTBUF
      port map(D => \P_CH_VOSG_EN_c[4]\, PAD => P_CH_VOSG_EN(4));
    
    MAN_EN_CH_4TO1_A_maj : MAJ3
      port map(A => MAN_EN_CH_4TO1_A_0, B => 
        \MAN_EN_CH_4TO1_A_tmr2\, C => \MAN_EN_CH_4TO1_A_tmr3\, Y
         => \MAN_EN_CH_4TO1_A\);
    
    STDBY_OFFB_A_tmr2 : DFN1C0
      port map(D => STDBY_OFFB_A_16, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \STDBY_OFFB_A_tmr2\);
    
    \REGISTER_CH_CMD_CH[4]\ : DFN1C0
      port map(D => \VAL_MAN_EN_CH_8TO5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \REGISTER_CH_CMD_CH_0[4]\);
    
    \REGISTER_CH_CMD_CH_tmr2[4]\ : DFN1C0
      port map(D => \VAL_MAN_EN_CH_8TO5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \REGISTER_CH_CMD_CH_tmr2[4]_net_1\);
    
    \P_CH_MREG_EN_pad[2]\ : OUTBUF
      port map(D => \P_CH_MREG_EN_c_c[2]\, PAD => P_CH_MREG_EN(2));
    
    VAL_MAN_EN_CH_8TO5 : DFN1C0
      port map(D => \DEBOUNCE.man_en_ch_8to5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        VAL_MAN_EN_CH_8TO5_0);
    
    STDBY_OFFB_B_maj : MAJ3
      port map(A => STDBY_OFFB_B_0, B => \STDBY_OFFB_B_tmr2\, C
         => \STDBY_OFFB_B_tmr3\, Y => \STDBY_OFFB_B\);
    
    MAN_EN_CH_8TO5_B_tmr2 : DFN1C0
      port map(D => MAN_EN_CH_8TO5_B_18, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_8TO5_B_tmr2\);
    
    J11_17_TCONN_pad : OUTBUF
      port map(D => \GND\, PAD => J11_17_TCONN);
    
    VAL_MAN_EN_CH_8TO5_tmr2 : DFN1C0
      port map(D => \DEBOUNCE.man_en_ch_8to5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \VAL_MAN_EN_CH_8TO5_tmr2\);
    
    CLK_5M_GL : DFN1C0
      port map(D => \REFCNT_maj_RNI76JC[1]_net_1\, CLK => 
        CLK40M_OSC_c, CLR => POR_OUT_TO_SCA_c, Q => CLK_5M_GL_0);
    
    \P_CH_VOSG_EN_pad[7]\ : OUTBUF
      port map(D => \P_CH_VOSG_EN_c[7]\, PAD => P_CH_VOSG_EN(7));
    
    CLK_5M_GL_tmr2 : DFN1C0
      port map(D => \REFCNT_maj_RNI76JC[1]_net_1\, CLK => 
        CLK40M_OSC_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CLK_5M_GL_tmr2\);
    
    J11_23_TCONN_pad : OUTBUF
      port map(D => \GND\, PAD => J11_23_TCONN);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \DTYCYC_CNT_maj[3]\ : MAJ3
      port map(A => \DTYCYC_CNT_0[3]\, B => 
        \DTYCYC_CNT_tmr2[3]_net_1\, C => 
        \DTYCYC_CNT_tmr3[3]_net_1\, Y => \DTYCYC_CNT[3]_net_1\);
    
    MAN_EN_CH_4TO1_B : DFN1C0
      port map(D => MAN_EN_CH_4TO1_B_17, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        MAN_EN_CH_4TO1_B_0);
    
    \P_CH_VOSG_EN_pad[2]\ : OUTBUF
      port map(D => \P_CH_VOSG_EN_c[2]\, PAD => P_CH_VOSG_EN(2));
    
    \FPGA_FUSE_7_8_OK_pad[0]\ : INBUF
      port map(PAD => FPGA_FUSE_7_8_OK(0), Y => 
        \FPGA_FUSE_7_8_OK_c[0]\);
    
    \P_CH_IAUX_EN_pad[5]\ : OUTBUF
      port map(D => \P_CH_IAUX_EN_c_c[4]\, PAD => P_CH_IAUX_EN(5));
    
    DTYCYC_EN_tmr3 : DFN1C0
      port map(D => DTYCYC_EN_20, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_EN_tmr3\);
    
    \P_CH_IAUX_EN_pad[0]\ : OUTBUF
      port map(D => \P_CH_IAUX_EN_c_c[0]\, PAD => P_CH_IAUX_EN(0));
    
    \REFCNT_maj[0]\ : MAJ3
      port map(A => \REFCNT_0[0]\, B => \REFCNT_tmr2[0]_net_1\, C
         => \REFCNT_tmr3[0]_net_1\, Y => \REFCNT[0]_net_1\);
    
    MAN_EN_CH_8TO5_A_maj : MAJ3
      port map(A => MAN_EN_CH_8TO5_A_0, B => 
        \MAN_EN_CH_8TO5_A_tmr2\, C => \MAN_EN_CH_8TO5_A_tmr3\, Y
         => \MAN_EN_CH_8TO5_A\);
    
    \DTYCYC_CNT_maj[1]\ : MAJ3
      port map(A => \DTYCYC_CNT_0[1]\, B => 
        \DTYCYC_CNT_tmr2[1]_net_1\, C => 
        \DTYCYC_CNT_tmr3[1]_net_1\, Y => \DTYCYC_CNT[1]_net_1\);
    
    PRI_RX_EN_BAR_pad : OUTBUF
      port map(D => \GND\, PAD => PRI_RX_EN_BAR);
    
    \P_CH_VOSG_EN_pad[1]\ : OUTBUF
      port map(D => \P_CH_VOSG_EN_c[1]\, PAD => P_CH_VOSG_EN(1));
    
    VAL_MAN_EN_CH_8TO5_tmr3 : DFN1C0
      port map(D => \DEBOUNCE.man_en_ch_8to5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \VAL_MAN_EN_CH_8TO5_tmr3\);
    
    un2_n_refcnt_1_SUM1 : XOR2
      port map(A => \REFCNT[0]_net_1\, B => \REFCNT[1]_net_1\, Y
         => SUM1);
    
    STDBY_OFFB_B_tmr2 : DFN1C0
      port map(D => STDBY_OFFB_B_19, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \STDBY_OFFB_B_tmr2\);
    
    TX_FPGA_pad : OUTBUF
      port map(D => \DTYCYC_EN\, PAD => TX_FPGA);
    
    CH3_4_MS_CFG_EN_pad : INBUF
      port map(PAD => CH3_4_MS_CFG_EN, Y => CH3_4_MS_CFG_EN_c);
    
    MAN_EN_CH_4TO1_B_maj : MAJ3
      port map(A => MAN_EN_CH_4TO1_B_0, B => 
        \MAN_EN_CH_4TO1_B_tmr2\, C => \MAN_EN_CH_4TO1_B_tmr3\, Y
         => \MAN_EN_CH_4TO1_B\);
    
    CONTROL34 : MAIN_SEQUENCER_NEW_3_0
      port map(P_CH_IAUX_EN_c_c_0 => \P_CH_IAUX_EN_c_c[2]\, 
        P_CH_MREG_EN_c_c_0 => \P_CH_MREG_EN_c_c[2]\, 
        P_CH_VOSG_EN_c(3) => \P_CH_VOSG_EN_c[3]\, 
        P_CH_VOSG_EN_c(2) => \P_CH_VOSG_EN_c[2]\, DTYCYC_CNT(4)
         => \DTYCYC_CNT[4]_net_1\, DTYCYC_CNT(3) => 
        \DTYCYC_CNT[3]_net_1\, DTYCYC_CNT(2) => 
        \DTYCYC_CNT[2]_net_1\, DTYCYC_CNT(1) => 
        \DTYCYC_CNT[1]_net_1\, DTYCYC_CNT(0) => 
        \DTYCYC_CNT[0]_net_1\, REGISTER_CH_CMD_CH_0 => 
        \REGISTER_CH_CMD_CH[0]_net_1\, N_CH_VOSG_EN_7_1_0 => 
        \CONTROL34.MAIN_SEQUENCER.N_CH_VOSG_EN_7_1[1]\, 
        POR_OUT_TO_SCA_c => POR_OUT_TO_SCA_c, 
        BUF5M_J11_15_TCONN_c => BUF5M_J11_15_TCONN_c, 
        MAN_EN_CH_4TO1_A_14 => MAN_EN_CH_4TO1_A_14, 
        MAN_EN_CH_8TO5_A_15 => MAN_EN_CH_8TO5_A_15, STDBY_OFFB_c
         => STDBY_OFFB_c, STDBY_OFFB_A_16 => STDBY_OFFB_A_16, 
        MAN_EN_CH_4TO1_B_17 => MAN_EN_CH_4TO1_B_17, 
        MAN_EN_CH_8TO5_B_18 => MAN_EN_CH_8TO5_B_18, STDBY_OFFB_A
         => \STDBY_OFFB_A\, STDBY_OFFB_B_19 => STDBY_OFFB_B_19, 
        DTYCYC_EN_20 => DTYCYC_EN_20, DTYCYC_CNT_21 => 
        DTYCYC_CNT_21, DTYCYC_CNT_22 => DTYCYC_CNT_22, 
        DTYCYC_CNT_23 => DTYCYC_CNT_23, DTYCYC_CNT_24 => 
        DTYCYC_CNT_24, DTYCYC_CNT_25 => DTYCYC_CNT_25, N_23_i_c
         => N_23_i_c, MODE_DCYC_NORMB_c => MODE_DCYC_NORMB_c, 
        DTYCYC_EN => \DTYCYC_EN\, CH3_4_MS_CFG_EN_c => 
        CH3_4_MS_CFG_EN_c, STATUS_LED_c_0 => STATUS_LED_c_0, 
        CH_ACTIVE_STAT => \CONTROL12.CH_ACTIVE_STAT\, 
        MAN_EN_CH_4TO1_A => \MAN_EN_CH_4TO1_A\, MAN_EN_CH_4TO1_c
         => MAN_EN_CH_4TO1_c, MAN_EN_CH_4TO1_B => 
        \MAN_EN_CH_4TO1_B\, man_en_ch_4to1 => 
        \DEBOUNCE.man_en_ch_4to1\, MAN_EN_CH_8TO5_A => 
        \MAN_EN_CH_8TO5_A\, MAN_EN_CH_8TO5_c => MAN_EN_CH_8TO5_c, 
        MAN_EN_CH_8TO5_B => \MAN_EN_CH_8TO5_B\, man_en_ch_8to5
         => \DEBOUNCE.man_en_ch_8to5\, STDBY_OFFB_B => 
        \STDBY_OFFB_B\, UVL_OK_CH3A4 => UVL_OK_CH3A4, 
        STATUS_LED_c => STATUS_LED_c);
    
    \REGISTER_CH_CMD_CH_maj[4]\ : MAJ3
      port map(A => \REGISTER_CH_CMD_CH_0[4]\, B => 
        \REGISTER_CH_CMD_CH_tmr2[4]_net_1\, C => 
        \REGISTER_CH_CMD_CH_tmr3[4]_net_1\, Y => 
        \REGISTER_CH_CMD_CH[4]_net_1\);
    
    STDBY_OFFB_A : DFN1C0
      port map(D => STDBY_OFFB_A_16, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => STDBY_OFFB_A_0);
    
    BUF5M_J11_15_TCONN_pad : OUTBUF
      port map(D => BUF5M_J11_15_TCONN_c, PAD => 
        BUF5M_J11_15_TCONN);
    
    \REFCNT_tmr3[0]\ : DFN1C0
      port map(D => \REFCNT_i[0]\, CLK => CLK40M_OSC_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \REFCNT_tmr3[0]_net_1\);
    
    CLK40M_OSC_pad : CLKBUF
      port map(PAD => CLK40M_OSC, Y => CLK40M_OSC_c);
    
    MAN_EN_CH_4TO1_A_tmr3 : DFN1C0
      port map(D => MAN_EN_CH_4TO1_A_14, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_4TO1_A_tmr3\);
    
    \REFCNT[0]\ : DFN1C0
      port map(D => \REFCNT_i[0]\, CLK => CLK40M_OSC_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \REFCNT_0[0]\);
    
    \DTYCYC_CNT[1]\ : DFN1P0
      port map(D => DTYCYC_CNT_24, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_0[1]\);
    
    STATUS_LED_pad : OUTBUF
      port map(D => STATUS_LED_c_0, PAD => STATUS_LED);
    
    \REGISTER_CH_CMD_CH_maj[0]\ : MAJ3
      port map(A => \REGISTER_CH_CMD_CH_0[0]\, B => 
        \REGISTER_CH_CMD_CH_tmr2[0]_net_1\, C => 
        \REGISTER_CH_CMD_CH_tmr3[0]_net_1\, Y => 
        \REGISTER_CH_CMD_CH[0]_net_1\);
    
    \REFCNT_tmr2[0]\ : DFN1C0
      port map(D => \REFCNT_i[0]\, CLK => CLK40M_OSC_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \REFCNT_tmr2[0]_net_1\);
    
    MASTER_RST_B_tmr3 : DFN1C0
      port map(D => \DEL0_DEV_RST_B\, CLK => CLK40M_OSC_c, CLR
         => POR_FPGA_c, Q => \MASTER_RST_B_tmr3\);
    
    \REGISTER_CH_CMD_CH_tmr3[0]\ : DFN1C0
      port map(D => \VAL_MAN_EN_CH_4TO1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \REGISTER_CH_CMD_CH_tmr3[0]_net_1\);
    
    CH1_2_MS_CFG_EN_pad : INBUF
      port map(PAD => CH1_2_MS_CFG_EN, Y => CH1_2_MS_CFG_EN_c);
    
    \P_CH_MREG_EN_pad[3]\ : OUTBUF
      port map(D => \P_CH_MREG_EN_c_c[2]\, PAD => P_CH_MREG_EN(3));
    
    POR_OUT_TO_SCA_pad : OUTBUF
      port map(D => POR_OUT_TO_SCA_c, PAD => POR_OUT_TO_SCA);
    
    VAL_MAN_EN_CH_4TO1 : DFN1C0
      port map(D => \DEBOUNCE.man_en_ch_4to1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        VAL_MAN_EN_CH_4TO1_0);
    
    VAL_MAN_EN_CH_4TO1_tmr3 : DFN1C0
      port map(D => \DEBOUNCE.man_en_ch_4to1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \VAL_MAN_EN_CH_4TO1_tmr3\);
    
    MAN_EN_CH_8TO5_A_tmr3 : DFN1C0
      port map(D => MAN_EN_CH_8TO5_A_15, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_8TO5_A_tmr3\);
    
    \P_CH_MREG_EN_pad[0]\ : OUTBUF
      port map(D => \P_CH_MREG_EN_c_c[0]\, PAD => P_CH_MREG_EN(0));
    
    \FPGA_FUSE_1_2_OK_pad[0]\ : INBUF
      port map(PAD => FPGA_FUSE_1_2_OK(0), Y => 
        \FPGA_FUSE_1_2_OK_c[0]\);
    
    STDBY_OFFB_A_maj : MAJ3
      port map(A => STDBY_OFFB_A_0, B => \STDBY_OFFB_A_tmr2\, C
         => \STDBY_OFFB_A_tmr3\, Y => \STDBY_OFFB_A\);
    
    \P_CH_MREG_EN_pad[6]\ : OUTBUF
      port map(D => \P_CH_MREG_EN_c_c[6]\, PAD => P_CH_MREG_EN(6));
    
    \DTYCYC_CNT_maj[4]\ : MAJ3
      port map(A => \DTYCYC_CNT_0[4]\, B => 
        \DTYCYC_CNT_tmr2[4]_net_1\, C => 
        \DTYCYC_CNT_tmr3[4]_net_1\, Y => \DTYCYC_CNT[4]_net_1\);
    
    MAN_EN_CH_4TO1_A : DFN1C0
      port map(D => MAN_EN_CH_4TO1_A_14, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        MAN_EN_CH_4TO1_A_0);
    
    MAN_EN_CH_8TO5_B_maj : MAJ3
      port map(A => MAN_EN_CH_8TO5_B_0, B => 
        \MAN_EN_CH_8TO5_B_tmr2\, C => \MAN_EN_CH_8TO5_B_tmr3\, Y
         => \MAN_EN_CH_8TO5_B\);
    
    \P_CH_IAUX_EN_pad[3]\ : OUTBUF
      port map(D => \P_CH_IAUX_EN_c_c[2]\, PAD => P_CH_IAUX_EN(3));
    
    \TEMP_OK_pad[0]\ : INBUF
      port map(PAD => TEMP_OK(0), Y => \TEMP_OK_c[0]\);
    
    \DTYCYC_CNT[3]\ : DFN1C0
      port map(D => DTYCYC_CNT_22, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_0[3]\);
    
    MASTER_RST_B_maj : MAJ3
      port map(A => MASTER_RST_B_0, B => \MASTER_RST_B_tmr2\, C
         => \MASTER_RST_B_tmr3\, Y => \MASTER_RST_B\);
    
    MAN_EN_CH_4TO1_A_tmr2 : DFN1C0
      port map(D => MAN_EN_CH_4TO1_A_14, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_4TO1_A_tmr2\);
    
    \P_CH_IAUX_EN_pad[1]\ : OUTBUF
      port map(D => \P_CH_IAUX_EN_c_c[0]\, PAD => P_CH_IAUX_EN(1));
    
    \REFCNT_maj_RNI76JC[1]\ : AX1C
      port map(A => \REFCNT[1]_net_1\, B => \REFCNT[0]_net_1\, C
         => \CLK_5M_GL\, Y => \REFCNT_maj_RNI76JC[1]_net_1\);
    
    MASTER_RST_B : DFN1C0
      port map(D => \DEL0_DEV_RST_B\, CLK => CLK40M_OSC_c, CLR
         => POR_FPGA_c, Q => MASTER_RST_B_0);
    
    TX_PROMPT : SLOW_PULSE_EN_GEN
      port map(N_23_i_c => N_23_i_c, POR_OUT_TO_SCA_c => 
        POR_OUT_TO_SCA_c, BUF5M_J11_15_TCONN_c => 
        BUF5M_J11_15_TCONN_c);
    
    \P_CH_IAUX_EN_pad[2]\ : OUTBUF
      port map(D => \P_CH_IAUX_EN_c_c[2]\, PAD => P_CH_IAUX_EN(2));
    
    STDBY_OFFB_B : DFN1C0
      port map(D => STDBY_OFFB_B_19, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => STDBY_OFFB_B_0);
    
    DTYCYC_EN_tmr2 : DFN1C0
      port map(D => DTYCYC_EN_20, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_EN_tmr2\);
    
    \P_CH_IAUX_EN_pad[4]\ : OUTBUF
      port map(D => \P_CH_IAUX_EN_c_c[4]\, PAD => P_CH_IAUX_EN(4));
    
    \DTYCYC_CNT_tmr3[0]\ : DFN1P0
      port map(D => DTYCYC_CNT_25, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr3[0]_net_1\);
    
    CH7_8_MS_CFG_EN_pad : INBUF
      port map(PAD => CH7_8_MS_CFG_EN, Y => CH7_8_MS_CFG_EN_c);
    
    \P_CH_IAUX_EN_pad[7]\ : OUTBUF
      port map(D => \P_CH_IAUX_EN_c_c[6]\, PAD => P_CH_IAUX_EN(7));
    
    MASTER_RST_B_tmr2 : DFN1C0
      port map(D => \DEL0_DEV_RST_B\, CLK => CLK40M_OSC_c, CLR
         => POR_FPGA_c, Q => \MASTER_RST_B_tmr2\);
    
    \REFCNT[1]\ : DFN1C0
      port map(D => SUM1, CLK => CLK40M_OSC_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \REFCNT_0[1]\);
    
    \REGISTER_CH_CMD_CH_tmr3[4]\ : DFN1C0
      port map(D => \VAL_MAN_EN_CH_8TO5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \REGISTER_CH_CMD_CH_tmr3[4]_net_1\);
    
    DTYCYC_EN : DFN1C0
      port map(D => DTYCYC_EN_20, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => DTYCYC_EN_0);
    
    \DTYCYC_CNT_tmr3[2]\ : DFN1C0
      port map(D => DTYCYC_CNT_23, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr3[2]_net_1\);
    
    \REFCNT_tmr3[1]\ : DFN1C0
      port map(D => SUM1, CLK => CLK40M_OSC_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \REFCNT_tmr3[1]_net_1\);
    
    CH5_6_MS_CFG_EN_pad : INBUF
      port map(PAD => CH5_6_MS_CFG_EN, Y => CH5_6_MS_CFG_EN_c);
    
    CONTROL12 : MAIN_SEQUENCER_NEW_3
      port map(REGISTER_CH_CMD_CH_0 => 
        \REGISTER_CH_CMD_CH[0]_net_1\, P_CH_IAUX_EN_c_c_0 => 
        \P_CH_IAUX_EN_c_c[0]\, P_CH_MREG_EN_c_c_0 => 
        \P_CH_MREG_EN_c_c[0]\, P_CH_VOSG_EN_c(1) => 
        \P_CH_VOSG_EN_c[1]\, P_CH_VOSG_EN_c(0) => 
        \P_CH_VOSG_EN_c[0]\, N_CH_VOSG_EN_7_1_0 => 
        \CONTROL34.MAIN_SEQUENCER.N_CH_VOSG_EN_7_1[1]\, 
        POR_OUT_TO_SCA_c => POR_OUT_TO_SCA_c, 
        BUF5M_J11_15_TCONN_c => BUF5M_J11_15_TCONN_c, 
        STATUS_LED_c => STATUS_LED_c, CH1_2_MS_CFG_EN_c => 
        CH1_2_MS_CFG_EN_c, CH_ACTIVE_STAT => 
        \CONTROL12.CH_ACTIVE_STAT\, STDBY_OFFB_B => 
        \STDBY_OFFB_B\, UVL_OK_CH1A2 => UVL_OK_CH1A2, 
        STATUS_LED_c_0 => STATUS_LED_c_0);
    
    STDBY_OFFB_pad : INBUF
      port map(PAD => STDBY_OFFB, Y => STDBY_OFFB_c);
    
    DEL0_DEV_RST_B_tmr2 : DFN1C0
      port map(D => \VCC\, CLK => CLK40M_OSC_c, CLR => POR_FPGA_c, 
        Q => \DEL0_DEV_RST_B_tmr2\);
    
    \DTYCYC_CNT_tmr3[3]\ : DFN1C0
      port map(D => DTYCYC_CNT_22, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr3[3]_net_1\);
    
    \DTYCYC_CNT[0]\ : DFN1P0
      port map(D => DTYCYC_CNT_25, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_0[0]\);
    
    PWR_OK_LED_pad : OUTBUF
      port map(D => PWR_OK_LED_c, PAD => PWR_OK_LED);
    
    CONTROL78 : MAIN_SEQUENCER_NEW_3_2
      port map(P_CH_IAUX_EN_c_c_0 => \P_CH_IAUX_EN_c_c[6]\, 
        P_CH_MREG_EN_c_c_0 => \P_CH_MREG_EN_c_c[6]\, 
        P_CH_VOSG_EN_c(7) => \P_CH_VOSG_EN_c[7]\, 
        P_CH_VOSG_EN_c(6) => \P_CH_VOSG_EN_c[6]\, 
        POR_OUT_TO_SCA_c => POR_OUT_TO_SCA_c, 
        BUF5M_J11_15_TCONN_c => BUF5M_J11_15_TCONN_c, 
        STATUS_LED_c => STATUS_LED_c, CH7_8_MS_CFG_EN_c => 
        CH7_8_MS_CFG_EN_c, un3_n_ch_vosg_en => 
        \CONTROL56.MAIN_SEQUENCER.un3_n_ch_vosg_en\, 
        CH_ACTIVE_STAT => \CONTROL56.CH_ACTIVE_STAT\, 
        STDBY_OFFB_B => \STDBY_OFFB_B\, UVL_OK_CH7A8 => 
        UVL_OK_CH7A8, STATUS_LED_c_0 => STATUS_LED_c_0);
    
    MAN_EN_CH_4TO1_B_tmr3 : DFN1C0
      port map(D => MAN_EN_CH_4TO1_B_17, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_4TO1_B_tmr3\);
    
    SCA_DAT_IN_pad : OUTBUF
      port map(D => N_23_i_c, PAD => SCA_DAT_IN);
    
    \P_CH_MREG_EN_pad[7]\ : OUTBUF
      port map(D => \P_CH_MREG_EN_c_c[6]\, PAD => P_CH_MREG_EN(7));
    
    DTYCYC_EN_maj : MAJ3
      port map(A => DTYCYC_EN_0, B => \DTYCYC_EN_tmr2\, C => 
        \DTYCYC_EN_tmr3\, Y => \DTYCYC_EN\);
    
    \FPGA_FUSE_3_4_OK_pad[0]\ : INBUF
      port map(PAD => FPGA_FUSE_3_4_OK(0), Y => 
        \FPGA_FUSE_3_4_OK_c[0]\);
    
    UVL_34FUSE : IIR_FILT_4_1
      port map(FPGA_FUSE_3_4_OK_c_0 => \FPGA_FUSE_3_4_OK_c[0]\, 
        POR_OUT_TO_SCA_c => POR_OUT_TO_SCA_c, 
        BUF5M_J11_15_TCONN_c => BUF5M_J11_15_TCONN_c, 
        UVL_OK_CH3A4 => UVL_OK_CH3A4);
    
    \P_CH_IAUX_EN_pad[6]\ : OUTBUF
      port map(D => \P_CH_IAUX_EN_c_c[6]\, PAD => P_CH_IAUX_EN(6));
    
    MAN_EN_CH_8TO5_A_tmr2 : DFN1C0
      port map(D => MAN_EN_CH_8TO5_A_15, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_8TO5_A_tmr2\);
    
    VAL_MAN_EN_CH_4TO1_tmr2 : DFN1C0
      port map(D => \DEBOUNCE.man_en_ch_4to1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \VAL_MAN_EN_CH_4TO1_tmr2\);
    
    VAL_MAN_EN_CH_4TO1_maj : MAJ3
      port map(A => VAL_MAN_EN_CH_4TO1_0, B => 
        \VAL_MAN_EN_CH_4TO1_tmr2\, C => \VAL_MAN_EN_CH_4TO1_tmr3\, 
        Y => \VAL_MAN_EN_CH_4TO1\);
    
    OVT_FS : IIR_FILT_4
      port map(TEMP_OK_c_0 => \TEMP_OK_c[0]\, POR_OUT_TO_SCA_c
         => POR_OUT_TO_SCA_c, BUF5M_J11_15_TCONN_c => 
        BUF5M_J11_15_TCONN_c, STATUS_LED_c => STATUS_LED_c, 
        STATUS_LED_c_0 => STATUS_LED_c_0);
    
    VAL_MAN_EN_CH_8TO5_maj : MAJ3
      port map(A => VAL_MAN_EN_CH_8TO5_0, B => 
        \VAL_MAN_EN_CH_8TO5_tmr2\, C => \VAL_MAN_EN_CH_8TO5_tmr3\, 
        Y => \VAL_MAN_EN_CH_8TO5\);
    
    MAN_EN_CH_8TO5_A : DFN1C0
      port map(D => MAN_EN_CH_8TO5_A_15, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        MAN_EN_CH_8TO5_A_0);
    
    \DTYCYC_CNT_tmr2[0]\ : DFN1P0
      port map(D => DTYCYC_CNT_25, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr2[0]_net_1\);
    
    MAN_EN_CH_8TO5_B_tmr3 : DFN1C0
      port map(D => MAN_EN_CH_8TO5_B_18, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_8TO5_B_tmr3\);
    
    \DTYCYC_CNT_tmr2[1]\ : DFN1P0
      port map(D => DTYCYC_CNT_24, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr2[1]_net_1\);
    
    \REFCNT_maj_RNI17L1[0]\ : INV
      port map(A => \REFCNT[0]_net_1\, Y => \REFCNT_i[0]\);
    
    \P_CH_VOSG_EN_pad[5]\ : OUTBUF
      port map(D => \P_CH_VOSG_EN_c[5]\, PAD => P_CH_VOSG_EN(5));
    

end DEF_ARCH; 
