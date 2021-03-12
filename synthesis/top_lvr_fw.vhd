-- Version: v11.9 SP2 11.9.2.1

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity IIR_FILT_4_2 is

    port( IN_INVOLTAGE_OK_c_0    : in    std_logic;
          channel_involtage_ok_0 : out   std_logic;
          ch_mreg_en_0           : in    std_logic;
          OUT_CHANNEL_MREG_c_0   : out   std_logic;
          master_rst_b           : in    std_logic;
          clk_5m_gl              : in    std_logic
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

  component NOR3
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

  component NOR2
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

  component OAI1
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

  component AX1
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

    signal n_sigout15lto7_2, \FILT_OUT[3]_net_1\, 
        \FILT_OUT[7]_net_1\, \FILT_OUT[5]_net_1\, 
        n_sigout15lto7_1, \FILT_OUT[6]_net_1\, 
        \FILT_OUT[4]_net_1\, n_sigout3lto6_1, n_sigout3lto6_0, 
        N_23_i, i10_mux, N_27_i, i6_mux, N_29_i, i4_mux, N_31_i, 
        \FILT_OUT[2]_net_1\, i2_mux, N_33_i, \FILT_OUT[0]_net_1\, 
        \FILT_OUT[1]_net_1\, ADD_4x4_slow_I1_S_2, I0_un1_CO1, 
        \SUM_IN_A[5]_net_1\, N70, \channel_involtage_ok[4]\, 
        n_sigout3, \THRESH_VAL_maj_RNIKDPC3[1]_net_1\, 
        \THRESH_VAL[1]_net_1\, N_113, \THRESH_VAL_ns[0]\, 
        \THRESH_VAL[0]_net_1\, N_93, N_95, ADD_4x4_slow_I2_S_2, 
        i12_mux, ADD_4x4_slow_I0_S_2, i8_mux, N_40, 
        \SUM_IN_A[4]_net_1\, ADD_4x4_slow_I3_Y_2, 
        \SIGOUT_maj_RNIF8D65\, \SIG_IN_DEL_maj_RNIGOBF\, 
        \SIG_IN_DEL\, \SIG_IN_DEL_maj_RNIGOBF_0\, \FILT_OUT_0[7]\, 
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
        SIGOUT_tmr3_0, SIG_IN_DEL_0, SIG_IN_DEL_tmr2_0, 
        SIG_IN_DEL_tmr3_0, \GND\, \VCC\ : std_logic;

begin 

    channel_involtage_ok_0 <= \channel_involtage_ok[4]\;

    \FILT_OUT[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S_2, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_0[4]\);
    
    SIGOUT_tmr2 : DFN1C0
      port map(D => \SIGOUT_maj_RNIF8D65\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIGOUT_tmr2_0);
    
    \THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIKDPC3[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \THRESH_VAL_tmr2_0[1]\);
    
    \SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIGOBF_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr2_0[5]\);
    
    \FILT_OUT[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S_2, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_0[6]\);
    
    \THRESH_VAL[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_0[0]\);
    
    SIGOUT_tmr3 : DFN1C0
      port map(D => \SIGOUT_maj_RNIF8D65\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIGOUT_tmr3_0);
    
    \FILT_OUT_maj_RNIQ5JV[3]\ : NOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => \FILT_OUT[5]_net_1\, Y => n_sigout15lto7_2);
    
    un2_n_filt_out_ADD_4x4_slow_I0_un1_CO1 : XA1A
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => I0_un1_CO1);
    
    un1_tmp_sum_in_b_0_m22 : XNOR3
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => i10_mux, Y => N_23_i);
    
    \THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_tmr3_0[0]\);
    
    \FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y_2, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2_0[7]\);
    
    \FILT_OUT_maj[3]\ : MAJ3
      port map(A => \FILT_OUT_0[3]\, B => \FILT_OUT_tmr2_0[3]\, C
         => \FILT_OUT_tmr3_0[3]\, Y => \FILT_OUT[3]_net_1\);
    
    \FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_0[3]\);
    
    un2_n_filt_out_ADD_4x4_slow_I1_S : XOR3
      port map(A => I0_un1_CO1, B => \SUM_IN_A[5]_net_1\, C => 
        N_23_i, Y => ADD_4x4_slow_I1_S_2);
    
    SIG_IN_DEL_maj_RNIGOBF : XOR2
      port map(A => IN_INVOLTAGE_OK_c_0, B => \SIG_IN_DEL\, Y => 
        \SIG_IN_DEL_maj_RNIGOBF\);
    
    un2_n_filt_out_ADD_4x4_slow_I1_CO1 : MAJ3
      port map(A => I0_un1_CO1, B => N_23_i, C => 
        \SUM_IN_A[5]_net_1\, Y => N70);
    
    \FILT_OUT_maj[6]\ : MAJ3
      port map(A => \FILT_OUT_0[6]\, B => \FILT_OUT_tmr2_0[6]\, C
         => \FILT_OUT_tmr3_0[6]\, Y => \FILT_OUT[6]_net_1\);
    
    \SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \SUM_IN_A_0[4]\, B => \SUM_IN_A_tmr2_0[4]\, C
         => \SUM_IN_A_tmr3_0[4]\, Y => \SUM_IN_A[4]_net_1\);
    
    \FILT_OUT[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_0[1]\);
    
    \THRESH_VAL_maj_RNIQMCM1[1]\ : NOR3C
      port map(A => n_sigout15lto7_1, B => n_sigout15lto7_2, C
         => \THRESH_VAL[1]_net_1\, Y => N_113);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \FILT_OUT_maj_RNIM9LK1[7]\ : AO1
      port map(A => n_sigout3lto6_1, B => n_sigout3lto6_0, C => 
        \FILT_OUT[7]_net_1\, Y => n_sigout3);
    
    \FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S_2, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2_0[5]\);
    
    \FILT_OUT_maj_RNIS32L[4]\ : NOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout15lto7_1);
    
    \SUM_IN_A[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIGOBF_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_0[5]\);
    
    \FILT_OUT[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_0[2]\);
    
    SIG_IN_DEL : DFN1C0
      port map(D => IN_INVOLTAGE_OK_c_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIG_IN_DEL_0);
    
    \FILT_OUT[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y_2, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_0[7]\);
    
    \FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_0[2]\);
    
    un2_n_filt_out_ADD_4x4_slow_I3_Y : AO13
      port map(A => N70, B => \FILT_OUT[7]_net_1\, C => i12_mux, 
        Y => ADD_4x4_slow_I3_Y_2);
    
    \FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S_2, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2_0[4]\);
    
    \FILT_OUT_maj_RNIR22L[3]\ : NOR2B
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[6]_net_1\, 
        Y => n_sigout3lto6_0);
    
    un1_tmp_sum_in_b_0_m13 : AO18
      port map(A => \FILT_OUT[4]_net_1\, B => i6_mux, C => 
        \FILT_OUT[5]_net_1\, Y => i8_mux);
    
    \FILT_OUT[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_0[0]\);
    
    SIG_IN_DEL_tmr2 : DFN1C0
      port map(D => IN_INVOLTAGE_OK_c_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIG_IN_DEL_tmr2_0);
    
    SIGOUT_maj : MAJ3
      port map(A => SIGOUT_0, B => SIGOUT_tmr2_0, C => 
        SIGOUT_tmr3_0, Y => \channel_involtage_ok[4]\);
    
    un1_tmp_sum_in_b_0_m4 : OAI1
      port map(A => \FILT_OUT[2]_net_1\, B => \FILT_OUT[0]_net_1\, 
        C => \FILT_OUT[1]_net_1\, Y => i2_mux);
    
    \FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_0[1]\);
    
    \FILT_OUT_maj_RNIR22L[4]\ : NOR2B
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => n_sigout3lto6_1);
    
    \FILT_OUT[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_0[3]\);
    
    \THRESH_VAL[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIKDPC3[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \THRESH_VAL_0[1]\);
    
    un1_tmp_sum_in_b_0_m16 : AO18
      port map(A => \FILT_OUT[5]_net_1\, B => i8_mux, C => 
        \FILT_OUT[6]_net_1\, Y => i10_mux);
    
    \FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S_2, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2_0[6]\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \un2_n_filt_out_OUT_CHANNEL_MREG_1[7]\ : NOR2B
      port map(A => ch_mreg_en_0, B => \channel_involtage_ok[4]\, 
        Y => OUT_CHANNEL_MREG_c_0);
    
    un1_tmp_sum_in_b_0_m26 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[5]_net_1\, 
        C => i6_mux, Y => N_27_i);
    
    un1_tmp_sum_in_b_0_m19 : AO18
      port map(A => \FILT_OUT[6]_net_1\, B => i10_mux, C => 
        \FILT_OUT[7]_net_1\, Y => i12_mux);
    
    \THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIKDPC3[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \THRESH_VAL_tmr3_0[1]\);
    
    un1_tmp_sum_in_b_0_m30 : XNOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[2]_net_1\, 
        C => i2_mux, Y => N_31_i);
    
    \SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIGOBF\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr2_0[4]\);
    
    \FILT_OUT_maj[7]\ : MAJ3
      port map(A => \FILT_OUT_0[7]\, B => \FILT_OUT_tmr2_0[7]\, C
         => \FILT_OUT_tmr3_0[7]\, Y => \FILT_OUT[7]_net_1\);
    
    \THRESH_VAL_maj_RNIJCPC3[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_113, Y => \THRESH_VAL_ns[0]\);
    
    un1_tmp_sum_in_b_0_m15 : XOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => N_40);
    
    \FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S_2, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3_0[6]\);
    
    \SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIGOBF\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr3_0[4]\);
    
    un1_tmp_sum_in_b_0_m7 : AO18
      port map(A => \FILT_OUT[2]_net_1\, B => i2_mux, C => 
        \FILT_OUT[3]_net_1\, Y => i4_mux);
    
    un1_tmp_sum_in_b_0_m28 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[3]_net_1\, 
        C => i4_mux, Y => N_29_i);
    
    SIG_IN_DEL_tmr3 : DFN1C0
      port map(D => IN_INVOLTAGE_OK_c_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIG_IN_DEL_tmr3_0);
    
    \THRESH_VAL_maj_RNIJCPC3_0[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_95, Y => N_93);
    
    SIGOUT : DFN1C0
      port map(D => \SIGOUT_maj_RNIF8D65\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIGOUT_0);
    
    \THRESH_VAL_maj_RNIQMCM1_0[1]\ : AOI1B
      port map(A => n_sigout15lto7_2, B => n_sigout15lto7_1, C
         => \THRESH_VAL[1]_net_1\, Y => N_95);
    
    \FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y_2, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3_0[7]\);
    
    \FILT_OUT_maj[5]\ : MAJ3
      port map(A => \FILT_OUT_0[5]\, B => \FILT_OUT_tmr2_0[5]\, C
         => \FILT_OUT_tmr3_0[5]\, Y => \FILT_OUT[5]_net_1\);
    
    \FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_0[3]\);
    
    SIGOUT_maj_RNIF8D65 : MX2
      port map(A => n_sigout3, B => \channel_involtage_ok[4]\, S
         => N_93, Y => \SIGOUT_maj_RNIF8D65\);
    
    \THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \THRESH_VAL_0[1]\, B => 
        \THRESH_VAL_tmr2_0[1]\, C => \THRESH_VAL_tmr3_0[1]\, Y
         => \THRESH_VAL[1]_net_1\);
    
    \FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_0[2]\);
    
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
    
    un2_n_filt_out_ADD_4x4_slow_I2_S : XNOR3
      port map(A => \FILT_OUT[7]_net_1\, B => i12_mux, C => N70, 
        Y => ADD_4x4_slow_I2_S_2);
    
    \SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIGOBF_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr3_0[5]\);
    
    \THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_tmr2_0[0]\);
    
    \THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \THRESH_VAL_0[0]\, B => 
        \THRESH_VAL_tmr2_0[0]\, C => \THRESH_VAL_tmr3_0[0]\, Y
         => \THRESH_VAL[0]_net_1\);
    
    \FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_0[1]\);
    
    \FILT_OUT[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S_2, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_0[5]\);
    
    un1_tmp_sum_in_b_0_m10 : AO18
      port map(A => \FILT_OUT[3]_net_1\, B => i4_mux, C => 
        \FILT_OUT[4]_net_1\, Y => i6_mux);
    
    \FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_0[0]\);
    
    \FILT_OUT_maj[2]\ : MAJ3
      port map(A => \FILT_OUT_0[2]\, B => \FILT_OUT_tmr2_0[2]\, C
         => \FILT_OUT_tmr3_0[2]\, Y => \FILT_OUT[2]_net_1\);
    
    un2_n_filt_out_ADD_4x4_slow_I0_S : XNOR3
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => ADD_4x4_slow_I0_S_2);
    
    SIG_IN_DEL_maj_RNIGOBF_0 : NOR2B
      port map(A => \SIG_IN_DEL\, B => IN_INVOLTAGE_OK_c_0, Y => 
        \SIG_IN_DEL_maj_RNIGOBF_0\);
    
    \FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S_2, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3_0[4]\);
    
    SIG_IN_DEL_maj : MAJ3
      port map(A => SIG_IN_DEL_0, B => SIG_IN_DEL_tmr2_0, C => 
        SIG_IN_DEL_tmr3_0, Y => \SIG_IN_DEL\);
    
    \FILT_OUT_maj[4]\ : MAJ3
      port map(A => \FILT_OUT_0[4]\, B => \FILT_OUT_tmr2_0[4]\, C
         => \FILT_OUT_tmr3_0[4]\, Y => \FILT_OUT[4]_net_1\);
    
    \THRESH_VAL_maj_RNIKDPC3[1]\ : OA1B
      port map(A => n_sigout3, B => \THRESH_VAL[1]_net_1\, C => 
        N_113, Y => \THRESH_VAL_maj_RNIKDPC3[1]_net_1\);
    
    \SUM_IN_A[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIGOBF\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_0[4]\);
    
    \FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S_2, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3_0[5]\);
    
    \FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_0[0]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity crc6_1 is

    port( spi_tx_word_0               : in    std_logic;
          spi_tx_word_16              : in    std_logic;
          spi_tx_word_19              : in    std_logic;
          spi_tx_word_21              : in    std_logic;
          spi_tx_word_7               : in    std_logic;
          spi_tx_word_4               : in    std_logic;
          spi_tx_word_9               : in    std_logic;
          spi_tx_word_6               : in    std_logic;
          spi_tx_word_11              : in    std_logic;
          spi_tx_word_8               : in    std_logic;
          spi_tx_word_10              : in    std_logic;
          spi_tx_word_18              : in    std_logic;
          spi_tx_word_5               : in    std_logic;
          spi_tx_word_17              : in    std_logic;
          ch_iaux_en_0                : in    std_logic;
          OUT_CHANNEL_IAUX_c          : out   std_logic_vector(8 downto 7);
          ch_out1_0                   : in    std_logic;
          SW4_SLAVE_PAIRS_BAR_c_0     : in    std_logic;
          active_switch_constraints_1 : in    std_logic;
          active_switch_constraints_0 : in    std_logic;
          active_switch_constraints_6 : in    std_logic;
          active_switch_constraints_7 : in    std_logic;
          channel_involtage_ok_0      : in    std_logic;
          channel_involtage_ok_3      : in    std_logic;
          total_channel_constraints_0 : out   std_logic;
          tx_crc                      : out   std_logic_vector(5 downto 0);
          SPI_TX_WORD_i_1_0           : in    std_logic;
          N_68                        : out   std_logic;
          N_73                        : out   std_logic;
          STATUS_LED_c                : in    std_logic;
          N_7_0                       : out   std_logic;
          i42_mux_11                  : in    std_logic;
          i42_mux_7                   : in    std_logic;
          i42_mux_8                   : in    std_logic;
          i42_mux_10                  : in    std_logic;
          i42_mux_2                   : in    std_logic;
          i42_mux_0                   : in    std_logic;
          i42_mux_9                   : in    std_logic;
          N_16_0                      : in    std_logic;
          i42_mux                     : in    std_logic
        );

end crc6_1;

architecture DEF_ARCH of crc6_1 is 

  component XOR3
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

  component NOR2B
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

    signal \CRC_1_0_a2_3[5]_net_1\, N_27, 
        \CRC_1_0_a2_1[5]_net_1\, \CRC_1_0_a2_2[5]_net_1\, N_31, 
        N_29, \CRC_1_0_a2_5[0]_net_1\, \CRC_1_0_a2_3[0]_net_1\, 
        \CRC_1_0_a2_1[0]_net_1\, \CRC_1_0_a2_0[0]_net_1\, N_28, 
        N_32, \CRC_1_0_a2_6[3]_net_1\, \CRC_1_0_a2_0[3]_net_1\, 
        \CRC_1_0_a2_3[3]_net_1\, \CRC_1_0_a2_5[3]_net_1\, 
        \CRC_1_0_a2_2[3]\, N_24, \CRC_1_0_a2_6[2]_net_1\, 
        \CRC_1_0_a2_0[2]_net_1\, \CRC_1_0_a2_3[2]_net_1\, 
        \CRC_1_0_a2_5[2]_net_1\, N_25, \CRC_1_0_a2_1[2]_net_1\, 
        N_30, \CRC_1_0_a2_5[1]_net_1\, \CRC_1_0_a2_2[1]_net_1\, 
        \CRC_1_0_a2_4[1]_net_1\, \CRC_1_0_a2_1[1]_net_1\, 
        \CRC_1_0_a2_5[4]_net_1\, \CRC_1_0_a2_3[4]_net_1\, 
        \CRC_1_0_a2_4[4]_net_1\, \CRC_1_0_a2_1[4]_net_1\, \GND\, 
        \VCC\ : std_logic;

begin 


    \CRC_1_0_a2_6[3]\ : XOR3
      port map(A => \CRC_1_0_a2_0[3]_net_1\, B => N_32, C => 
        \CRC_1_0_a2_3[3]_net_1\, Y => \CRC_1_0_a2_6[3]_net_1\);
    
    \OUT_CHANNEL_IAUX_1[8]\ : OA1A
      port map(A => SW4_SLAVE_PAIRS_BAR_c_0, B => ch_out1_0, C
         => channel_involtage_ok_3, Y => OUT_CHANNEL_IAUX_c(8));
    
    \CRC_1_0_a2_1[3]\ : XOR3
      port map(A => spi_tx_word_9, B => spi_tx_word_11, C => 
        spi_tx_word_17, Y => N_28);
    
    \CRC_1_0_a2_2[2]\ : XOR2
      port map(A => i42_mux_8, B => spi_tx_word_7, Y => N_30);
    
    \CRC_1_0_a2[2]\ : XOR2
      port map(A => \CRC_1_0_a2_6[2]_net_1\, B => 
        \CRC_1_0_a2_5[2]_net_1\, Y => tx_crc(2));
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \CRC_1_0_a2_2[1]\ : XOR3
      port map(A => i42_mux_9, B => spi_tx_word_4, C => i42_mux_2, 
        Y => \CRC_1_0_a2_2[1]_net_1\);
    
    \CRC_1_0_a2_1[1]\ : XOR2
      port map(A => N_25, B => spi_tx_word_18, Y => N_27);
    
    \OUT_CHANNEL_IAUX_1[7]\ : NOR2B
      port map(A => ch_iaux_en_0, B => channel_involtage_ok_3, Y
         => OUT_CHANNEL_IAUX_c(7));
    
    \CRC_1_0_a2_4[4]\ : XOR3
      port map(A => N_28, B => N_27, C => \CRC_1_0_a2_1[4]_net_1\, 
        Y => \CRC_1_0_a2_4[4]_net_1\);
    
    \CRC_1_0_a2_3[3]\ : XOR2
      port map(A => spi_tx_word_7, B => N_31, Y => 
        \CRC_1_0_a2_3[3]_net_1\);
    
    \CRC_1_0_a2_3[2]\ : XOR2
      port map(A => i42_mux_7, B => spi_tx_word_8, Y => N_31);
    
    \CRC_1_0_a2_1[4]\ : XOR2
      port map(A => N_29, B => N_30, Y => \CRC_1_0_a2_1[4]_net_1\);
    
    \CRC_1_0_a2_5[1]\ : XOR3
      port map(A => spi_tx_word_6, B => spi_tx_word_0, C => 
        \CRC_1_0_a2_2[1]_net_1\, Y => \CRC_1_0_a2_5[1]_net_1\);
    
    \CRC_1_0_a2_1[5]\ : XOR2
      port map(A => spi_tx_word_0, B => i42_mux, Y => 
        \CRC_1_0_a2_1[5]_net_1\);
    
    \CRC_1_0_a2_1[2]\ : XOR2
      port map(A => spi_tx_word_5, B => N_16_0, Y => N_29);
    
    \CRC_1_0_a2[1]\ : XOR2
      port map(A => \CRC_1_0_a2_5[1]_net_1\, B => 
        \CRC_1_0_a2_4[1]_net_1\, Y => tx_crc(1));
    
    m2_0 : NOR3C
      port map(A => channel_involtage_ok_0, B => STATUS_LED_c, C
         => active_switch_constraints_0, Y => 
        total_channel_constraints_0);
    
    \CRC_1_0_a2_6[2]\ : XOR3
      port map(A => \CRC_1_0_a2_0[2]_net_1\, B => N_29, C => 
        \CRC_1_0_a2_3[2]_net_1\, Y => \CRC_1_0_a2_6[2]_net_1\);
    
    \CRC_1_0_a2_5[3]\ : XOR3
      port map(A => i42_mux_0, B => spi_tx_word_21, C => 
        \CRC_1_0_a2_2[3]\, Y => \CRC_1_0_a2_5[3]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \CRC_1_0_a2_0_0[3]\ : XOR2
      port map(A => N_28, B => N_24, Y => \CRC_1_0_a2_0[3]_net_1\);
    
    \CRC_1_0_a2_3[5]\ : XOR3
      port map(A => N_27, B => SPI_TX_WORD_i_1_0, C => 
        \CRC_1_0_a2_1[5]_net_1\, Y => \CRC_1_0_a2_3[5]_net_1\);
    
    \CRC_1_0_a2_3[0]\ : XOR2
      port map(A => N_16_0, B => spi_tx_word_16, Y => 
        \CRC_1_0_a2_3[0]_net_1\);
    
    \CRC_1_0_a2_4[2]\ : XOR2
      port map(A => i42_mux_11, B => spi_tx_word_6, Y => N_32);
    
    \CRC_1_0_a2_2[5]\ : XOR2
      port map(A => N_31, B => N_29, Y => \CRC_1_0_a2_2[5]_net_1\);
    
    \CRC_1_0_a2_1_0[1]\ : XOR3
      port map(A => spi_tx_word_9, B => spi_tx_word_11, C => 
        spi_tx_word_19, Y => \CRC_1_0_a2_1[1]_net_1\);
    
    \CRC_1_0_a2[4]\ : XOR2
      port map(A => \CRC_1_0_a2_5[4]_net_1\, B => 
        \CRC_1_0_a2_4[4]_net_1\, Y => tx_crc(4));
    
    \CRC_1_0_a2[5]\ : XOR2
      port map(A => \CRC_1_0_a2_3[5]_net_1\, B => 
        \CRC_1_0_a2_2[5]_net_1\, Y => tx_crc(5));
    
    \CRC_1_0_a2[0]\ : XOR3
      port map(A => \CRC_1_0_a2_1[0]_net_1\, B => 
        \CRC_1_0_a2_0[0]_net_1\, C => \CRC_1_0_a2_5[0]_net_1\, Y
         => tx_crc(0));
    
    m72 : NOR3C
      port map(A => channel_involtage_ok_3, B => STATUS_LED_c, C
         => active_switch_constraints_6, Y => N_73);
    
    \CRC_1_0_a2_5[0]\ : XOR3
      port map(A => SPI_TX_WORD_i_1_0, B => spi_tx_word_0, C => 
        \CRC_1_0_a2_3[0]_net_1\, Y => \CRC_1_0_a2_5[0]_net_1\);
    
    \CRC_1_0_a2_3[4]\ : XOR2
      port map(A => spi_tx_word_4, B => i42_mux_0, Y => 
        \CRC_1_0_a2_3[4]_net_1\);
    
    \CRC_1_0_a2_4[1]\ : XOR3
      port map(A => N_27, B => N_30, C => \CRC_1_0_a2_1[1]_net_1\, 
        Y => \CRC_1_0_a2_4[1]_net_1\);
    
    \CRC_1_0_a2_0_0[2]\ : XOR2
      port map(A => N_30, B => i42_mux_2, Y => 
        \CRC_1_0_a2_0[2]_net_1\);
    
    \CRC_1_0_a2[3]\ : XOR2
      port map(A => \CRC_1_0_a2_6[3]_net_1\, B => 
        \CRC_1_0_a2_5[3]_net_1\, Y => tx_crc(3));
    
    \CRC_1_0_a2_0[0]\ : XOR2
      port map(A => N_28, B => N_32, Y => \CRC_1_0_a2_0[0]_net_1\);
    
    m6_0 : NOR3C
      port map(A => channel_involtage_ok_0, B => STATUS_LED_c, C
         => active_switch_constraints_1, Y => N_7_0);
    
    \CRC_1_0_a2_0[2]\ : XOR2
      port map(A => N_24, B => i42_mux_10, Y => N_25);
    
    \CRC_1_0_a2_2_0[3]\ : XOR3
      port map(A => i42_mux_9, B => spi_tx_word_4, C => 
        SPI_TX_WORD_i_1_0, Y => \CRC_1_0_a2_2[3]\);
    
    \CRC_1_0_a2_1_0[2]\ : XOR2
      port map(A => spi_tx_word_9, B => N_32, Y => 
        \CRC_1_0_a2_1[2]_net_1\);
    
    \CRC_1_0_a2_5[4]\ : XOR3
      port map(A => i42_mux, B => spi_tx_word_8, C => 
        \CRC_1_0_a2_3[4]_net_1\, Y => \CRC_1_0_a2_5[4]_net_1\);
    
    \CRC_1_0_a2_0[3]\ : XOR2
      port map(A => spi_tx_word_10, B => spi_tx_word_16, Y => 
        N_24);
    
    \CRC_1_0_a2_5[2]\ : XOR3
      port map(A => N_25, B => N_31, C => \CRC_1_0_a2_1[2]_net_1\, 
        Y => \CRC_1_0_a2_5[2]_net_1\);
    
    \CRC_1_0_a2_1[0]\ : XOR2
      port map(A => i42_mux_9, B => spi_tx_word_19, Y => 
        \CRC_1_0_a2_1[0]_net_1\);
    
    m67 : NOR3C
      port map(A => channel_involtage_ok_3, B => STATUS_LED_c, C
         => active_switch_constraints_7, Y => N_68);
    
    \CRC_1_0_a2_3_0[2]\ : XOR2
      port map(A => spi_tx_word_21, B => spi_tx_word_0, Y => 
        \CRC_1_0_a2_3[2]_net_1\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity spi_slave is

    port( i_spi_rx_word_maj_RNIC1IV5_0   : out   std_logic;
          i_spi_rx_word_maj_RNIE3IV5_0   : out   std_logic;
          channels_ready                 : out   std_logic_vector(8 downto 1);
          active_switch_constraints      : in    std_logic_vector(8 downto 1);
          spi_tx_word_10                 : out   std_logic;
          spi_tx_word_11                 : out   std_logic;
          spi_tx_word_18                 : out   std_logic;
          spi_tx_word_19                 : out   std_logic;
          spi_tx_word_5                  : out   std_logic;
          spi_tx_word_9                  : out   std_logic;
          spi_tx_word_17                 : out   std_logic;
          spi_tx_word_0                  : out   std_logic;
          spi_tx_word_6                  : out   std_logic;
          spi_tx_word_7                  : out   std_logic;
          spi_tx_word_21                 : out   std_logic;
          spi_tx_word_4                  : out   std_logic;
          spi_tx_word_8                  : in    std_logic;
          spi_tx_word_16                 : out   std_logic;
          total_channel_constraints_0    : in    std_logic;
          J11_DEBUG_c_c                  : in    std_logic_vector(7 downto 0);
          dtycyc_cnt                     : in    std_logic_vector(4 downto 0);
          tx_crc                         : in    std_logic_vector(5 downto 0);
          channels_on                    : out   std_logic_vector(4 downto 3);
          spi_rx_command_reg             : in    std_logic_vector(1 downto 0);
          channels_desired_on            : in    std_logic_vector(8 downto 1);
          i_spi_rx_word_maj_RNIRFN301_0  : out   std_logic;
          i_spi_rx_word_maj_RNI503FV_0   : out   std_logic;
          i_spi_rx_word_maj_RNIG4N301_0  : out   std_logic;
          i_spi_rx_word_maj_RNIVP2FV_0   : out   std_logic;
          i_spi_rx_word_maj_RNI5PM301_0  : out   std_logic;
          i_spi_rx_word_maj_RNIPJ2FV_0   : out   std_logic;
          i_spi_rx_word_maj_RNIC7VH01_0  : out   std_logic;
          i_spi_rx_word_maj_RNICQ6MV_0   : out   std_logic;
          channels_desired_ready         : in    std_logic_vector(8 downto 1);
          i_spi_rx_word_maj_RNIO745V_0   : out   std_logic;
          i_spi_rx_word_maj_RNIGR8TU_0   : out   std_logic;
          i_spi_rx_word_maj_RNIH045V_0   : out   std_logic;
          i_spi_rx_word_maj_RNICN8TU_0   : out   std_logic;
          i_spi_rx_word_maj_RNIAP35V_0   : out   std_logic;
          i_spi_rx_word_maj_RNI8J8TU_0   : out   std_logic;
          i_spi_rx_word_maj_RNILBCJV_0   : out   std_logic;
          i_spi_rx_word_maj_RNITRC4V_0   : out   std_logic;
          i_spi_rx_word_maj_RNI4PT0V_0   : out   std_logic;
          ch_out1_1                      : in    std_logic_vector(2 downto 1);
          OUT_CHANNEL_IAUX_c             : out   std_logic_vector(6 downto 1);
          ch_iaux_en_0                   : in    std_logic;
          ch_iaux_en_2                   : in    std_logic;
          ch_iaux_en_4                   : in    std_logic;
          ch_out1_0                      : in    std_logic_vector(2 downto 1);
          ch_out1                        : in    std_logic_vector(2 downto 1);
          channel_involtage_ok           : in    std_logic_vector(4 downto 1);
          SW4_SLAVE_PAIRS_BAR_c          : in    std_logic_vector(4 downto 3);
          OUT_CHANNEL_MREG_c_0           : out   std_logic;
          OUT_CHANNEL_MREG_c_1           : out   std_logic;
          OUT_CHANNEL_MREG_c_2           : out   std_logic;
          OUT_CHANNEL_MREG_c_4           : out   std_logic;
          OUT_CHANNEL_MREG_c_5           : out   std_logic;
          OUT_CHANNEL_MREG_c_7           : out   std_logic;
          ch_mreg_en_0                   : in    std_logic;
          ch_mreg_en_2                   : in    std_logic;
          ch_mreg_en_4                   : in    std_logic;
          SPI_TX_WORD_i_1_0              : out   std_logic;
          spi_rx_word_7                  : out   std_logic;
          spi_rx_word_9                  : out   std_logic;
          spi_rx_word_16                 : out   std_logic;
          spi_rx_word_10                 : out   std_logic;
          spi_rx_word_12                 : out   std_logic;
          spi_rx_word_0                  : out   std_logic;
          spi_rx_word_6                  : out   std_logic;
          spi_rx_word_2                  : out   std_logic;
          spi_rx_word_8                  : out   std_logic;
          spi_rx_word_30                 : out   std_logic;
          spi_rx_word_3                  : out   std_logic;
          spi_rx_word_4                  : out   std_logic;
          spi_rx_word_5                  : out   std_logic;
          spi_rx_word_11                 : out   std_logic;
          spi_rx_word_15                 : out   std_logic;
          spi_rx_word_18                 : out   std_logic;
          SW2_SW3_CHANNEL_ON_BAR_c_5     : in    std_logic;
          SW2_SW3_CHANNEL_ON_BAR_c_0     : in    std_logic;
          SW2_SW3_CHANNEL_ON_BAR_c_1     : in    std_logic;
          SW2_SW3_CHANNEL_ON_BAR_c_4     : in    std_logic;
          sw2_sw5_channel_on_a           : in    std_logic_vector(8 downto 1);
          sw2_sw5_channel_on_b           : in    std_logic_vector(8 downto 1);
          i_spi_rx_strb_1                : out   std_logic;
          sca_dat_out_c                  : in    std_logic;
          GLB                            : in    std_logic;
          gb_spi_rst_b                   : in    std_logic;
          clk_5m_gl                      : in    std_logic;
          sw2_sw5_channel_on_a_15        : out   std_logic;
          sw2_sw5_channel_on_a_16        : out   std_logic;
          sw2_sw5_channel_on_a_17        : out   std_logic;
          sw2_sw5_channel_on_a_18        : out   std_logic;
          sw2_sw5_channel_on_a_20        : out   std_logic;
          sw2_sw5_channel_on_a_21        : out   std_logic;
          sw2_sw5_channel_on_a_22        : out   std_logic;
          sw2_sw5_channel_on_b_23        : out   std_logic;
          sw2_sw5_channel_on_b_24        : out   std_logic;
          sw2_sw5_channel_on_b_25        : out   std_logic;
          sw2_sw5_channel_on_b_26        : out   std_logic;
          sw2_sw5_channel_on_b_28        : out   std_logic;
          sw2_sw5_channel_on_b_29        : out   std_logic;
          sw2_sw5_channel_on_b_30        : out   std_logic;
          dtycyc_en                      : in    std_logic;
          dtycyc_en_32                   : out   std_logic;
          dtycyc_cnt_34                  : out   std_logic;
          dtycyc_cnt_35                  : out   std_logic;
          dtycyc_cnt_36                  : out   std_logic;
          dtycyc_cnt_37                  : out   std_logic;
          dtycyc_cnt_38                  : out   std_logic;
          m32_0                          : out   std_logic;
          m31                            : out   std_logic;
          SW5_IGNORE_CRC_BAR_c           : in    std_logic;
          bad_crc_1_sqmuxa               : out   std_logic;
          N_7_0                          : in    std_logic;
          SW5_PIN4_UNUSED_c              : in    std_logic;
          i42_mux_9                      : out   std_logic;
          bad_crc                        : in    std_logic;
          N_63_0                         : out   std_logic;
          spi_timeout                    : in    std_logic;
          N_85                           : out   std_logic;
          STATUS_LED_c                   : in    std_logic;
          N_79                           : out   std_logic;
          N_73                           : in    std_logic;
          N_68_0                         : in    std_logic;
          spi_dutycycle_mode             : in    std_logic;
          sw2_sw5_channel_on_b_27        : out   std_logic;
          N_210_i                        : in    std_logic;
          sw2_sw5_channel_on_a_19        : out   std_logic;
          i42_mux                        : out   std_logic;
          i42_mux_0                      : out   std_logic;
          i42_mux_7                      : out   std_logic;
          i42_mux_8                      : out   std_logic;
          i42_mux_2                      : out   std_logic;
          i42_mux_10                     : out   std_logic;
          N_16_0                         : out   std_logic;
          i42_mux_11                     : out   std_logic;
          sca_dat_in_c                   : out   std_logic;
          un46_sw2_sw3_channel_on_bar    : out   std_logic;
          un32_sw2_sw3_channel_on_bar    : out   std_logic;
          un25_sw2_sw3_channel_on_bar    : out   std_logic;
          un18_sw2_sw3_channel_on_bar    : out   std_logic;
          un4_sw2_sw3_channel_on_bar     : out   std_logic;
          un11_sw2_sw3_channel_on_bar    : out   std_logic;
          un39_sw2_sw3_channel_on_bar    : out   std_logic;
          un53_sw2_sw3_channel_on_bar    : out   std_logic;
          spi_timeout_pulse_i_1          : out   std_logic;
          N_32                           : in    std_logic;
          N_26                           : in    std_logic;
          N_29                           : in    std_logic;
          N_34                           : in    std_logic;
          N_30                           : in    std_logic;
          N_33                           : in    std_logic;
          N_31                           : in    std_logic;
          un1_sw5_default_turnon_bar_1_0 : out   std_logic;
          master_rst_b                   : in    std_logic;
          un1_master_rst_b_1_0           : out   std_logic
        );

end spi_slave;

architecture DEF_ARCH of spi_slave is 

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
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

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component XOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DLN1
    port( D : in    std_logic := 'U';
          G : in    std_logic := 'U';
          Q : out   std_logic
        );
  end component;

  component DFN1P1C1
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
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

  component AX1A
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

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XO1
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

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN0C1
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2A
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

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XA1C
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

  component DFN1C1
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

  component AO1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component DFN1P1
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AO1A
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

  component NOR3C
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

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
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

  component OA1A
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

  component AXOI7
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1B
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

  component XA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component CLKINT
    port( A : in    std_logic := 'U';
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

  component OR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component OR3B
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

  component AO13
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

  component XO1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XAI1
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

    signal \spi_sm_0[0]\, \spi_sm[0]_net_1\, 
        \spi_sm_tmr2[0]_net_1\, \spi_sm_tmr3[0]_net_1\, 
        clk_fcnt_en_0, \clk_fcnt_en\, \clk_fcnt_en_tmr2\, 
        \clk_fcnt_en_tmr3\, \spi_clr\, spi_clr_0, 
        \DWACT_ADD_CI_0_g_array_2[0]\, 
        \DWACT_ADD_CI_0_g_array_1[0]\, 
        \DWACT_ADD_CI_0_pog_array_1[0]\, \DWACT_ADD_CI_0_TMP[0]\, 
        \clk_fcnt[1]_net_1\, \DWACT_ADD_CI_0_g_array_12[0]\, 
        \clk_fcnt[2]_net_1\, \DWACT_ADD_CI_0_g_array_12_1[0]\, 
        \clk_fcnt[4]_net_1\, un2_clk_fcnt_3, \clk_fcnt[5]_net_1\, 
        un2_clk_fcnt_1, un2_clk_fcnt_2, \clk_fcnt[0]_net_1\, 
        \clk_fcnt[3]_net_1\, un2_clk_fcnt_en, clk_fcnt_en_1, 
        \half_clk_fcnt_4[5]\, \un1_clk_fcnt[0]\, I_23, I_22, I_21, 
        timeout_cnt_n14_i_i_a2_0, \timeout_cnt[14]_net_1\, N_304, 
        timeout_cnt_n14_i_i_a2_0_0, \timeout_cnt[9]_net_1\, 
        SPI_TIMEOUT_PULSE_i_0_a2_1_2, 
        SPI_TIMEOUT_PULSE_i_0_a2_1_0, \timeout_cnt[11]_net_1\, 
        N_167, \timeout_cnt[13]_net_1\, \timeout_cnt[12]_net_1\, 
        un1_spi_sm_7_i_0_a2_0, \spi_clk_2c\, \spi_sm[5]_net_1\, 
        SPI_TIMEOUT_PULSE_i_0_a2_2_1, \timeout_cnt[6]_net_1\, 
        \timeout_cnt[7]_net_1\, \timeout_cnt[5]_net_1\, 
        SPI_TIMEOUT_PULSE_i_0_o2_1_0, \timeout_cnt[3]_net_1\, 
        \timeout_cnt[4]_net_1\, spi_sm_tr8_7_i_a2_4_1, 
        \clk_fcnt_2c[1]_net_1\, \clk_fcnt_2c[3]_net_1\, 
        spi_sm_tr8_7_i_a2_4_0, \clk_fcnt_2c[4]_net_1\, 
        \clk_fcnt_2c[2]_net_1\, \spi_sm_ns_i_a2_0_a2_0_4_1[3]\, 
        \half_clk_fcnt[4]_net_1\, \half_clk_fcnt[5]_net_1\, 
        \spi_sm_ns_i_a2_0_a2_0_4_0[3]\, \half_clk_fcnt[3]_net_1\, 
        \half_clk_fcnt[2]_net_1\, un4_spi_rx_command_NE_2, 
        un4_spi_rx_command_3_7, un4_spi_rx_command_3_8, 
        un4_spi_rx_command_0, un4_spi_rx_command_NE_1, 
        un4_spi_rx_command_1_7, un4_spi_rx_command_1_8, 
        un4_spi_rx_command_2, un4_spi_rx_command_NE_0, 
        un4_spi_rx_command_4_5, un4_spi_rx_command_4_6, 
        un4_spi_rx_command_5, un4_spi_rx_command_2_8, 
        un4_spi_rx_command_2_4, un4_spi_rx_command_2_7, 
        \spi_rx_word[31]\, \spi_rx_word[20]\, 
        un4_spi_rx_command_2_2, un4_spi_rx_command_2_6, 
        \spi_rx_crc[2]\, un4_spi_rx_command_2_1, \spi_rx_word[7]\, 
        \spi_rx_word[9]\, \spi_rx_word[16]\, \spi_rx_word[14]\, 
        \spi_rx_word[10]\, \spi_rx_word[12]\, \spi_rx_word[21]\, 
        un4_spi_rx_command_5_4, un4_spi_rx_command_5_0, 
        un4_spi_rx_command_5_3, \spi_rx_word[0]\, 
        un4_spi_rx_command_5_2, \spi_rx_word[1]\, 
        \spi_rx_word[23]\, \spi_rx_crc[5]\, 
        un4_spi_rx_command_1_0, un4_spi_rx_command_1_6, 
        \spi_rx_word[13]\, un4_spi_rx_command_1_4, 
        un4_spi_rx_command_1_2, \spi_rx_word[6]\, 
        \spi_rx_word[19]\, \spi_rx_crc[1]\, 
        SPI_TIMEOUT_PULSE_i_0_a2_0_1, N_63, N_219, N_203_3, 
        un4_spi_rx_command_3_0, un4_spi_rx_command_3_6, 
        un4_spi_rx_command_3_4, \spi_rx_word[22]\, 
        un4_spi_rx_command_3_2, \spi_rx_word[17]\, 
        \spi_rx_crc[3]\, un4_spi_rx_command_0_5, 
        un4_spi_rx_command_0_3, \spi_rx_word[2]\, 
        un4_spi_rx_command_0_1, un4_spi_rx_command_0_0, 
        \spi_rx_crc[0]\, SPI_TIMEOUT_PULSE_i_0_0, N_202, 
        un4_spi_rx_command_4_0, \spi_rx_word[8]\, 
        un4_spi_rx_command_4_3, un4_spi_rx_command_4_2, 
        \spi_rx_crc[4]\, N_78, \timeout_cnt[0]_net_1\, 
        \timeout_cnt[1]_net_1\, N_76, \timeout_cnt[2]_net_1\, 
        N_120, N_74, N_121, N_72, N_122, \spi_timeout_pulse_i_1\, 
        N_223, N_222, N_220, \timeout_cnt[8]_net_1\, N_671, N_165, 
        N_61, N_163, N_68, N_208, N_70, N_144, N_23, 
        \nullclk_cnt[0]_net_1\, \nullclk_cnt[1]_net_1\, N_186, 
        N_21, \nullclk_cnt[2]_net_1\, N_174, N_19, 
        \nullclk_cnt[3]_net_1\, N_176, N_221, N_172, 
        bad_crc_0_sqmuxa, \spi_rx_word[30]\, 
        un4_spi_rx_command_NE, N_215, 
        \spi_sm_ns_i_a2_0_a2_0_0[3]\, 
        \spi_sm_maj_RNIMQL7[2]_net_1\, N_215_3, 
        \n_rx_32bit_sreg_maj_RNI2L8E[0]_net_1\, 
        \rx_32bit_sreg[0]_net_1\, \n_rx_32bit_sreg[0]_net_1\, 
        \n_rx_32bit_sreg_maj_RNI4N8E[1]_net_1\, 
        \rx_32bit_sreg[1]_net_1\, \n_rx_32bit_sreg[1]_net_1\, 
        \n_rx_32bit_sreg_maj_RNI6P8E[2]_net_1\, 
        \rx_32bit_sreg[2]_net_1\, \n_rx_32bit_sreg[2]_net_1\, 
        \n_rx_32bit_sreg_maj_RNI8R8E[3]_net_1\, 
        \rx_32bit_sreg[3]_net_1\, \n_rx_32bit_sreg[3]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIAT8E[4]_net_1\, 
        \rx_32bit_sreg[4]_net_1\, \n_rx_32bit_sreg[4]_net_1\, 
        \n_rx_32bit_sreg_maj_RNICV8E[5]_net_1\, 
        \rx_32bit_sreg[5]_net_1\, \n_rx_32bit_sreg[5]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIE19E[6]_net_1\, 
        \rx_32bit_sreg[6]_net_1\, \n_rx_32bit_sreg[6]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIG39E[7]_net_1\, 
        \rx_32bit_sreg[7]_net_1\, \n_rx_32bit_sreg[7]_net_1\, 
        \n_rx_32bit_sreg_maj_RNII59E[8]_net_1\, 
        \rx_32bit_sreg[8]_net_1\, \n_rx_32bit_sreg[8]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIK79E[9]_net_1\, 
        \rx_32bit_sreg[9]_net_1\, \n_rx_32bit_sreg[9]_net_1\, 
        \n_rx_32bit_sreg_maj_RNI47RJ[10]_net_1\, 
        \rx_32bit_sreg[10]_net_1\, \n_rx_32bit_sreg[10]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIL6VR[11]_net_1\, 
        \rx_32bit_sreg[11]_net_1\, \n_rx_32bit_sreg[11]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIN8VR[12]_net_1\, 
        \rx_32bit_sreg[12]_net_1\, \n_rx_32bit_sreg[12]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIPAVR[13]_net_1\, 
        \rx_32bit_sreg[13]_net_1\, \n_rx_32bit_sreg[13]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIRCVR[14]_net_1\, 
        \rx_32bit_sreg[14]_net_1\, \n_rx_32bit_sreg[14]_net_1\, 
        \n_rx_32bit_sreg_maj_RNITEVR[15]_net_1\, 
        \rx_32bit_sreg[15]_net_1\, \n_rx_32bit_sreg[15]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIVGVR[16]_net_1\, 
        \rx_32bit_sreg[16]_net_1\, \n_rx_32bit_sreg[16]_net_1\, 
        \n_rx_32bit_sreg_maj_RNI1JVR[17]_net_1\, 
        \rx_32bit_sreg[17]_net_1\, \n_rx_32bit_sreg[17]_net_1\, 
        \n_rx_32bit_sreg_maj_RNI3LVR[18]_net_1\, 
        \rx_32bit_sreg[18]_net_1\, \n_rx_32bit_sreg[18]_net_1\, 
        \n_rx_32bit_sreg_maj_RNI5NVR[19]_net_1\, 
        \rx_32bit_sreg[19]_net_1\, \n_rx_32bit_sreg[19]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIL81S[20]_net_1\, 
        \rx_32bit_sreg[20]_net_1\, \n_rx_32bit_sreg[20]_net_1\, 
        \n_rx_32bit_sreg_maj_RNINA1S[21]_net_1\, 
        \rx_32bit_sreg[21]_net_1\, \n_rx_32bit_sreg[21]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIPC1S[22]_net_1\, 
        \rx_32bit_sreg[22]_net_1\, \n_rx_32bit_sreg[22]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIRE1S[23]_net_1\, 
        \rx_32bit_sreg[23]_net_1\, \n_rx_32bit_sreg[23]_net_1\, 
        \n_rx_32bit_sreg_maj_RNITG1S[24]_net_1\, 
        \rx_32bit_sreg[24]_net_1\, \n_rx_32bit_sreg[24]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIVI1S[25]_net_1\, 
        \rx_32bit_sreg[25]_net_1\, \n_rx_32bit_sreg[25]_net_1\, 
        \n_rx_32bit_sreg_maj_RNI1L1S[26]_net_1\, 
        \rx_32bit_sreg[26]_net_1\, \n_rx_32bit_sreg[26]_net_1\, 
        \n_rx_32bit_sreg_maj_RNI3N1S[27]_net_1\, 
        \rx_32bit_sreg[27]_net_1\, \n_rx_32bit_sreg[27]_net_1\, 
        \n_rx_32bit_sreg_maj_RNI5P1S[28]_net_1\, 
        \rx_32bit_sreg[28]_net_1\, \n_rx_32bit_sreg[28]_net_1\, 
        \n_rx_32bit_sreg_maj_RNI7R1S[29]_net_1\, 
        \rx_32bit_sreg[29]_net_1\, \n_rx_32bit_sreg[29]_net_1\, 
        \n_rx_32bit_sreg_maj_RNINC3S[30]_net_1\, 
        \rx_32bit_sreg[30]_net_1\, \n_rx_32bit_sreg[30]_net_1\, 
        \n_rx_32bit_sreg_maj_RNIPE3S[31]_net_1\, 
        \rx_32bit_sreg[31]_net_1\, \n_rx_32bit_sreg[31]_net_1\, 
        \i_spi_rx_word_maj_RNID9MK[0]_net_1\, \spi_sm_1[0]\, 
        \rx_32bit_sreg_maj_RNIFBMK[1]_net_1\, 
        \i_spi_rx_word_maj_RNIHDMK[2]_net_1\, 
        \i_spi_rx_word_maj_RNIJFMK[3]_net_1\, \spi_rx_word[3]\, 
        \i_spi_rx_word_maj_RNILHMK[4]_net_1\, \spi_rx_word[4]\, 
        \i_spi_rx_word_maj_RNINJMK[5]_net_1\, \spi_rx_word[5]\, 
        \i_spi_rx_word_maj_RNIPLMK[6]_net_1\, 
        \i_spi_rx_word_maj_RNIRNMK[7]_net_1\, 
        \rx_32bit_sreg_maj_RNITPMK[8]_net_1\, 
        \rx_32bit_sreg_maj_RNIVRMK[9]_net_1\, 
        \rx_32bit_sreg_maj_RNIF9VI[10]_net_1\, 
        \i_spi_rx_word_maj_RNIHBVI[11]_net_1\, \spi_rx_word[11]\, 
        \rx_32bit_sreg_maj_RNIJDVI[12]_net_1\, 
        \rx_32bit_sreg_maj_RNILFVI[13]_net_1\, 
        \rx_32bit_sreg_maj_RNINHVI[14]_net_1\, 
        \i_spi_rx_word_maj_RNIPJVI[15]_net_1\, \spi_rx_word[15]\, 
        \i_spi_rx_word_maj_RNIAAHJ[16]_net_1\, 
        \i_spi_rx_word_maj_RNICCHJ[17]_net_1\, 
        \i_spi_rx_word_maj_RNIEEHJ[18]_net_1\, \spi_rx_word[18]\, 
        \i_spi_rx_word_maj_RNIGGHJ[19]_net_1\, 
        \i_spi_rx_word_maj_RNI02JJ[20]_net_1\, 
        \i_spi_rx_word_maj_RNI24JJ[21]_net_1\, 
        \i_spi_rx_word_maj_RNI46JJ[22]_net_1\, 
        \i_spi_rx_word_maj_RNI68JJ[23]_net_1\, 
        \i_spi_rx_word_maj_RNI8AJJ[24]_net_1\, 
        \i_spi_rx_word_maj_RNIACJJ[25]_net_1\, 
        \i_spi_rx_word_maj_RNICEJJ[26]_net_1\, 
        \i_spi_rx_word_maj_RNIEGJJ[27]_net_1\, 
        \i_spi_rx_word_maj_RNIGIJJ[28]_net_1\, 
        \i_spi_rx_word_maj_RNIIKJJ[29]_net_1\, 
        \rx_32bit_sreg_maj_RNI48LJ[31]_net_1\, 
        \i_spi_miso_maj_RNILQNM5\, \sca_dat_in_c\, i_spi_miso_4, 
        \half_clk_fcnt_maj_RNIT7BL[0]_net_1\, 
        \half_clk_fcnt[0]_net_1\, 
        \half_clk_fcnt_maj_RNIV9BL[1]_net_1\, 
        \half_clk_fcnt[1]_net_1\, 
        \half_clk_fcnt_maj_RNI1CBL[2]_net_1\, 
        \clk_fcnt_maj_RNI3EBL[3]_net_1\, 
        \clk_fcnt_maj_RNI5GBL[4]_net_1\, 
        \half_clk_fcnt_maj_RNI7IBL[5]_net_1\, N_284, 
        \P_TX_32BIT_REG[14]_net_1\, i_spi_miso_2, N_269, 
        \P_TX_32BIT_REG[15]_net_1\, N_283, N_298, N_290, N_670, 
        N_666, N_669, N_667, N_668, \P_TX_32BIT_REG[16]_net_1\, 
        \P_TX_32BIT_REG[0]_net_1\, \P_TX_32BIT_REG[24]_net_1\, 
        \P_TX_32BIT_REG[8]_net_1\, N_664, N_665, 
        \P_TX_32BIT_REG[20]_net_1\, \P_TX_32BIT_REG[4]_net_1\, 
        \P_TX_32BIT_REG[28]_net_1\, \P_TX_32BIT_REG[12]_net_1\, 
        N_286, N_663, N_661, N_662, \P_TX_32BIT_REG[18]_net_1\, 
        \P_TX_32BIT_REG[2]_net_1\, \P_TX_32BIT_REG[26]_net_1\, 
        \P_TX_32BIT_REG[10]_net_1\, N_660, 
        \P_TX_32BIT_REG[22]_net_1\, \P_TX_32BIT_REG[6]_net_1\, 
        N_275, N_659, N_655, N_658, N_656, N_657, 
        \P_TX_32BIT_REG[17]_net_1\, \P_TX_32BIT_REG[1]_net_1\, 
        \P_TX_32BIT_REG[25]_net_1\, \P_TX_32BIT_REG[9]_net_1\, 
        N_653, N_654, \P_TX_32BIT_REG[21]_net_1\, 
        \P_TX_32BIT_REG[5]_net_1\, \P_TX_32BIT_REG[29]_net_1\, 
        \P_TX_32BIT_REG[13]_net_1\, N_271, N_652, N_650, N_651, 
        \P_TX_32BIT_REG[19]_net_1\, \P_TX_32BIT_REG[3]_net_1\, 
        \P_TX_32BIT_REG[27]_net_1\, \P_TX_32BIT_REG[11]_net_1\, 
        N_649, \P_TX_32BIT_REG[23]_net_1\, 
        \P_TX_32BIT_REG[7]_net_1\, \spi_clr_maj_RNI70U52_0\, 
        \i42_mux_11\, \spi_clr_maj_RNIETKF1_0\, \spi_tx_word[10]\, 
        \spi_clr_maj_RNIGVKF1_0\, \spi_tx_word[11]\, 
        \spi_clr_maj_RNICT7M1_0\, \spi_tx_word[18]\, 
        \spi_clr_maj_RNIEI6G1_0\, \spi_tx_word[19]\, 
        \spi_clr_maj_RNIRECDT_0\, \spi_clr_maj_RNI70U52\, 
        \spi_clr_maj_RNIEI6G1\, \spi_clr_maj_RNIGVKF1\, 
        \spi_clr_maj_RNICT7M1\, \spi_clr_maj_RNIRECDT\, 
        \spi_clr_maj_RNIETKF1\, \spi_clr_maj_RNIMFTI2_0\, 
        \N_16_0\, \spi_clr_maj_RNITPKU1_0\, \spi_tx_word[5]\, 
        \spi_clr_maj_RNIB7ML1_0\, \spi_tx_word[9]\, 
        \spi_clr_maj_RNI96792_0\, \i42_mux_10\, 
        \spi_clr_maj_RNIA89C1_0\, \spi_tx_word[17]\, 
        \spi_clr_maj_RNI5CPP1_0\, \i42_mux_2\, 
        \spi_clr_maj_RNIB629M_0\, \spi_clr_maj_RNITKFFR_0\, 
        \spi_clr_maj_RNITPKU1\, \spi_clr_maj_RNIB7ML1\, 
        \spi_clr_maj_RNIMFTI2\, \spi_clr_maj_RNIB629M\, 
        \spi_clr_maj_RNITKFFR\, \spi_clr_maj_RNI5CPP1\, 
        \spi_clr_maj_RNI96792\, \spi_clr_maj_RNIA89C1\, 
        \spi_clr_maj_RNI02QU2_0\, \spi_tx_word[0]\, 
        \spi_clr_maj_RNIIFHQ2_0\, \SPI_TX_WORD_i_1[1]\, 
        \spi_clr_maj_RNI0GJO1_0\, \spi_tx_word[6]\, 
        \spi_clr_maj_RNI2IJO1_0\, \spi_tx_word[7]\, 
        \spi_clr_maj_RNIG0632_0\, \i42_mux_8\, 
        \spi_clr_maj_RNIJ3632_0\, \i42_mux_7\, 
        \spi_clr_maj_RNIRC3M1_0\, \spi_tx_word[21]\, 
        \spi_clr_maj_RNI0CAQ1_0\, \i42_mux_0\, 
        \spi_clr_maj_RNIL0RI1_0\, \i42_mux\, 
        \spi_clr_maj_RNIMFUOM_0\, \spi_clr_maj_RNI2IJO1\, 
        \spi_clr_maj_RNI02QU2\, \spi_clr_maj_RNIIFHQ2\, 
        \spi_clr_maj_RNIL0RI1\, \spi_clr_maj_RNIJ3632\, 
        \spi_clr_maj_RNI0GJO1\, \spi_clr_maj_RNIG0632\, 
        \spi_clr_maj_RNI0CAQ1\, \spi_clr_maj_RNIRC3M1\, 
        \spi_clr_maj_RNIMFUOM\, N_6, N_228, \spi_sm[1]_net_1\, 
        N_88, bad_crc_0_sqmuxa_1, N_31_0, N_28, N_135, N_132, 
        \channels_to_be_on[1]\, N_39, \channels_to_be_on[3]\, 
        N_37, \channels_to_be_on[5]\, N_141, 
        \channels_to_be_on[7]\, N_139, \channels_ready[3]\, 
        \total_channel_constraints[3]\, \channels_ready[8]\, 
        \channels_ready[7]\, \N_79\, \channels_ready[6]\, \N_85\, 
        \channels_ready[5]\, N_91, \channels_on[4]\, 
        \channels_ready[4]\, N_138, N_140, i43_mux_0, \N_63_0\, 
        i43_mux_2, i43_mux_4, i43_mux_10, i43_mux_12, i43_mux_16, 
        i43_mux_18, i43_mux_20, \i42_mux_9\, i43_mux_22, 
        i43_mux_24, \spi_tx_word[4]\, \channels_ready[2]\, 
        \channels_on[3]\, N_36, N_38, \spi_clr_maj_RNIN9UQQ\, 
        \spi_clr_maj_RNIC9792\, \spi_clr_maj_RNIN9UQQ_0\, 
        \spi_clr_maj_RNIC9792_0\, \spi_clr_maj_RNIETQ6Q\, 
        \spi_clr_maj_RNIRNKU1\, \spi_clr_maj_RNIETQ6Q_0\, 
        \spi_clr_maj_RNIRNKU1_0\, \spi_clr_maj_RNI95ML1\, 
        \spi_clr_maj_RNI95ML1_0\, N_183_i, \nullclk_cnt[4]_net_1\, 
        N_82, \spi_sm[4]_net_1\, N_17, N_28_0, un1_spi_sm_5, 
        \nullclk_cnt_maj_RNIESSB1[0]_net_1\, 
        \nullclk_cnt_maj_RNI0T8R1[1]_net_1\, 
        \nullclk_cnt_maj_RNIBVU22[2]_net_1\, 
        \nullclk_cnt_maj_RNIN2LA2[3]_net_1\, 
        \nullclk_cnt_maj_RNI47BI2[4]_net_1\, 
        \spi_sm_maj_RNIMFV51[4]_net_1\, un2_dutycycle_mode_1, 
        N_167_0, N_20_0, \dutycycle_mode\, i43_mux_8, i43_mux_6, 
        n_dtycyc_cnt_2_sqmuxa, N_293, N_26_0, N_18_0, N_24_0, 
        N_19_0, N_296, N_304_0, spi_tx_word_sn_N_3, 
        spi_tx_word_sn_N_2, N_17_0, N_14_0, \spi_tx_word[16]\, 
        N_64, N_65, \spi_clr_maj_RNIRHQ62\, 
        \spi_clr_maj_RNIRHQ62_0\, 
        \timeout_cnt_maj_RNI6GBJ3[13]_net_1\, N_31_1, N_530, 
        \timeout_cnt_maj_RNINTCB3[12]_net_1\, N_29_0, 
        \timeout_cnt_maj_RNI9CE33[11]_net_1\, N_26_1, 
        \timeout_cnt_maj_RNISRFR2[10]_net_1\, N_24, 
        \timeout_cnt[10]_net_1\, 
        \timeout_cnt_maj_RNI96KI2[9]_net_1\, timeout_cnt_n9, 
        \timeout_cnt_maj_RNI5UIB2[8]_net_1\, 
        \timeout_cnt_maj_RNI2NH42[7]_net_1\, 
        \timeout_cnt_maj_RNIBNNE3[6]_net_1\, 
        \timeout_cnt_maj_RNIVBFM1[5]_net_1\, N_180, N_169, N_173, 
        N_177, N_166, N_181, N_218, \spi_sm[2]_net_1\, 
        \clk_fcnt_2c[5]_net_1\, \clk_fcnt_2c[0]_net_1\, N_34_0, 
        \timeout_cnt_maj_RNII1HA[0]_net_1\, 
        \timeout_cnt_maj_RNI52BQ[1]_net_1\, 
        \timeout_cnt_maj_RNI23C11[2]_net_1\, 
        \timeout_cnt_maj_RNI05D81[3]_net_1\, 
        \timeout_cnt_maj_RNIV7EF1[4]_net_1\, 
        \timeout_cnt_maj_RNI502C4[14]_net_1\, 
        \spi_sm_maj_RNIDU2E[3]_net_1\, 
        \i_spi_rx_word_maj_RNI26LJ[30]_net_1\, \clk_fcnt_2c_0[5]\, 
        \clk_fcnt_2c_tmr2[5]_net_1\, \clk_fcnt_2c_tmr3[5]_net_1\, 
        \clk_fcnt_1c[5]_net_1\, \clk_fcnt_2c_0[4]\, 
        \clk_fcnt_2c_tmr2[4]_net_1\, \clk_fcnt_2c_tmr3[4]_net_1\, 
        \clk_fcnt_1c[4]_net_1\, \clk_fcnt_2c_0[3]\, 
        \clk_fcnt_2c_tmr2[3]_net_1\, \clk_fcnt_2c_tmr3[3]_net_1\, 
        \clk_fcnt_1c[3]_net_1\, \clk_fcnt_2c_0[2]\, 
        \clk_fcnt_2c_tmr2[2]_net_1\, \clk_fcnt_2c_tmr3[2]_net_1\, 
        \clk_fcnt_1c[2]_net_1\, \clk_fcnt_2c_0[1]\, 
        \clk_fcnt_2c_tmr2[1]_net_1\, \clk_fcnt_2c_tmr3[1]_net_1\, 
        \clk_fcnt_1c[1]_net_1\, \clk_fcnt_2c_0[0]\, 
        \clk_fcnt_2c_tmr2[0]_net_1\, \clk_fcnt_2c_tmr3[0]_net_1\, 
        \clk_fcnt_1c[0]_net_1\, \clk_fcnt_1c_0[5]\, 
        \clk_fcnt_1c_tmr2[5]_net_1\, \clk_fcnt_1c_tmr3[5]_net_1\, 
        \clk_fcnt_1c_0[4]\, \clk_fcnt_1c_tmr2[4]_net_1\, 
        \clk_fcnt_1c_tmr3[4]_net_1\, \clk_fcnt_1c_0[3]\, 
        \clk_fcnt_1c_tmr2[3]_net_1\, \clk_fcnt_1c_tmr3[3]_net_1\, 
        \clk_fcnt_1c_0[2]\, \clk_fcnt_1c_tmr2[2]_net_1\, 
        \clk_fcnt_1c_tmr3[2]_net_1\, \clk_fcnt_1c_0[1]\, 
        \clk_fcnt_1c_tmr2[1]_net_1\, \clk_fcnt_1c_tmr3[1]_net_1\, 
        \clk_fcnt_1c_0[0]\, \clk_fcnt_1c_tmr2[0]_net_1\, 
        \clk_fcnt_1c_tmr3[0]_net_1\, \half_clk_fcnt_0[5]\, 
        \half_clk_fcnt_tmr2[5]_net_1\, 
        \half_clk_fcnt_tmr3[5]_net_1\, \half_clk_fcnt_0[4]\, 
        \half_clk_fcnt_tmr2[4]_net_1\, 
        \half_clk_fcnt_tmr3[4]_net_1\, \half_clk_fcnt_0[3]\, 
        \half_clk_fcnt_tmr2[3]_net_1\, 
        \half_clk_fcnt_tmr3[3]_net_1\, \half_clk_fcnt_0[2]\, 
        \half_clk_fcnt_tmr2[2]_net_1\, 
        \half_clk_fcnt_tmr3[2]_net_1\, \half_clk_fcnt_0[1]\, 
        \half_clk_fcnt_tmr2[1]_net_1\, 
        \half_clk_fcnt_tmr3[1]_net_1\, I_24, \half_clk_fcnt_0[0]\, 
        \half_clk_fcnt_tmr2[0]_net_1\, 
        \half_clk_fcnt_tmr3[0]_net_1\, 
        \DWACT_ADD_CI_0_partial_sum[0]\, \rx_32bit_sreg_0[31]\, 
        \rx_32bit_sreg_tmr2[31]_net_1\, 
        \rx_32bit_sreg_tmr3[31]_net_1\, \rx_32bit_sreg_0[30]\, 
        \rx_32bit_sreg_tmr2[30]_net_1\, 
        \rx_32bit_sreg_tmr3[30]_net_1\, \rx_32bit_sreg_0[29]\, 
        \rx_32bit_sreg_tmr2[29]_net_1\, 
        \rx_32bit_sreg_tmr3[29]_net_1\, \rx_32bit_sreg_0[28]\, 
        \rx_32bit_sreg_tmr2[28]_net_1\, 
        \rx_32bit_sreg_tmr3[28]_net_1\, \rx_32bit_sreg_0[27]\, 
        \rx_32bit_sreg_tmr2[27]_net_1\, 
        \rx_32bit_sreg_tmr3[27]_net_1\, \rx_32bit_sreg_0[26]\, 
        \rx_32bit_sreg_tmr2[26]_net_1\, 
        \rx_32bit_sreg_tmr3[26]_net_1\, \rx_32bit_sreg_0[25]\, 
        \rx_32bit_sreg_tmr2[25]_net_1\, 
        \rx_32bit_sreg_tmr3[25]_net_1\, \rx_32bit_sreg_0[24]\, 
        \rx_32bit_sreg_tmr2[24]_net_1\, 
        \rx_32bit_sreg_tmr3[24]_net_1\, \rx_32bit_sreg_0[23]\, 
        \rx_32bit_sreg_tmr2[23]_net_1\, 
        \rx_32bit_sreg_tmr3[23]_net_1\, \rx_32bit_sreg_0[22]\, 
        \rx_32bit_sreg_tmr2[22]_net_1\, 
        \rx_32bit_sreg_tmr3[22]_net_1\, \rx_32bit_sreg_0[21]\, 
        \rx_32bit_sreg_tmr2[21]_net_1\, 
        \rx_32bit_sreg_tmr3[21]_net_1\, \rx_32bit_sreg_0[20]\, 
        \rx_32bit_sreg_tmr2[20]_net_1\, 
        \rx_32bit_sreg_tmr3[20]_net_1\, \rx_32bit_sreg_0[19]\, 
        \rx_32bit_sreg_tmr2[19]_net_1\, 
        \rx_32bit_sreg_tmr3[19]_net_1\, \rx_32bit_sreg_0[18]\, 
        \rx_32bit_sreg_tmr2[18]_net_1\, 
        \rx_32bit_sreg_tmr3[18]_net_1\, \rx_32bit_sreg_0[17]\, 
        \rx_32bit_sreg_tmr2[17]_net_1\, 
        \rx_32bit_sreg_tmr3[17]_net_1\, \rx_32bit_sreg_0[16]\, 
        \rx_32bit_sreg_tmr2[16]_net_1\, 
        \rx_32bit_sreg_tmr3[16]_net_1\, \rx_32bit_sreg_0[15]\, 
        \rx_32bit_sreg_tmr2[15]_net_1\, 
        \rx_32bit_sreg_tmr3[15]_net_1\, \rx_32bit_sreg_0[14]\, 
        \rx_32bit_sreg_tmr2[14]_net_1\, 
        \rx_32bit_sreg_tmr3[14]_net_1\, \rx_32bit_sreg_0[13]\, 
        \rx_32bit_sreg_tmr2[13]_net_1\, 
        \rx_32bit_sreg_tmr3[13]_net_1\, \rx_32bit_sreg_0[12]\, 
        \rx_32bit_sreg_tmr2[12]_net_1\, 
        \rx_32bit_sreg_tmr3[12]_net_1\, \rx_32bit_sreg_0[11]\, 
        \rx_32bit_sreg_tmr2[11]_net_1\, 
        \rx_32bit_sreg_tmr3[11]_net_1\, \rx_32bit_sreg_0[10]\, 
        \rx_32bit_sreg_tmr2[10]_net_1\, 
        \rx_32bit_sreg_tmr3[10]_net_1\, \rx_32bit_sreg_0[9]\, 
        \rx_32bit_sreg_tmr2[9]_net_1\, 
        \rx_32bit_sreg_tmr3[9]_net_1\, \rx_32bit_sreg_0[8]\, 
        \rx_32bit_sreg_tmr2[8]_net_1\, 
        \rx_32bit_sreg_tmr3[8]_net_1\, \rx_32bit_sreg_0[7]\, 
        \rx_32bit_sreg_tmr2[7]_net_1\, 
        \rx_32bit_sreg_tmr3[7]_net_1\, \rx_32bit_sreg_0[6]\, 
        \rx_32bit_sreg_tmr2[6]_net_1\, 
        \rx_32bit_sreg_tmr3[6]_net_1\, \rx_32bit_sreg_0[5]\, 
        \rx_32bit_sreg_tmr2[5]_net_1\, 
        \rx_32bit_sreg_tmr3[5]_net_1\, \rx_32bit_sreg_0[4]\, 
        \rx_32bit_sreg_tmr2[4]_net_1\, 
        \rx_32bit_sreg_tmr3[4]_net_1\, \rx_32bit_sreg_0[3]\, 
        \rx_32bit_sreg_tmr2[3]_net_1\, 
        \rx_32bit_sreg_tmr3[3]_net_1\, \rx_32bit_sreg_0[2]\, 
        \rx_32bit_sreg_tmr2[2]_net_1\, 
        \rx_32bit_sreg_tmr3[2]_net_1\, \rx_32bit_sreg_0[1]\, 
        \rx_32bit_sreg_tmr2[1]_net_1\, 
        \rx_32bit_sreg_tmr3[1]_net_1\, \rx_32bit_sreg_0[0]\, 
        \rx_32bit_sreg_tmr2[0]_net_1\, 
        \rx_32bit_sreg_tmr3[0]_net_1\, \i_spi_rx_word[31]_net_1\, 
        \i_spi_rx_word_tmr2[31]_net_1\, 
        \i_spi_rx_word_tmr3[31]_net_1\, \i_spi_rx_word[30]_net_1\, 
        \i_spi_rx_word_tmr2[30]_net_1\, 
        \i_spi_rx_word_tmr3[30]_net_1\, \i_spi_rx_word[29]_net_1\, 
        \i_spi_rx_word_tmr2[29]_net_1\, 
        \i_spi_rx_word_tmr3[29]_net_1\, \i_spi_rx_word[28]_net_1\, 
        \i_spi_rx_word_tmr2[28]_net_1\, 
        \i_spi_rx_word_tmr3[28]_net_1\, \i_spi_rx_word[27]_net_1\, 
        \i_spi_rx_word_tmr2[27]_net_1\, 
        \i_spi_rx_word_tmr3[27]_net_1\, \i_spi_rx_word[26]_net_1\, 
        \i_spi_rx_word_tmr2[26]_net_1\, 
        \i_spi_rx_word_tmr3[26]_net_1\, \i_spi_rx_word[25]_net_1\, 
        \i_spi_rx_word_tmr2[25]_net_1\, 
        \i_spi_rx_word_tmr3[25]_net_1\, \i_spi_rx_word[24]_net_1\, 
        \i_spi_rx_word_tmr2[24]_net_1\, 
        \i_spi_rx_word_tmr3[24]_net_1\, \i_spi_rx_word[23]_net_1\, 
        \i_spi_rx_word_tmr2[23]_net_1\, 
        \i_spi_rx_word_tmr3[23]_net_1\, \i_spi_rx_word[22]_net_1\, 
        \i_spi_rx_word_tmr2[22]_net_1\, 
        \i_spi_rx_word_tmr3[22]_net_1\, \i_spi_rx_word[21]_net_1\, 
        \i_spi_rx_word_tmr2[21]_net_1\, 
        \i_spi_rx_word_tmr3[21]_net_1\, \i_spi_rx_word[20]_net_1\, 
        \i_spi_rx_word_tmr2[20]_net_1\, 
        \i_spi_rx_word_tmr3[20]_net_1\, \i_spi_rx_word[19]_net_1\, 
        \i_spi_rx_word_tmr2[19]_net_1\, 
        \i_spi_rx_word_tmr3[19]_net_1\, \i_spi_rx_word[18]_net_1\, 
        \i_spi_rx_word_tmr2[18]_net_1\, 
        \i_spi_rx_word_tmr3[18]_net_1\, \i_spi_rx_word[17]_net_1\, 
        \i_spi_rx_word_tmr2[17]_net_1\, 
        \i_spi_rx_word_tmr3[17]_net_1\, \i_spi_rx_word[16]_net_1\, 
        \i_spi_rx_word_tmr2[16]_net_1\, 
        \i_spi_rx_word_tmr3[16]_net_1\, \i_spi_rx_word[15]_net_1\, 
        \i_spi_rx_word_tmr2[15]_net_1\, 
        \i_spi_rx_word_tmr3[15]_net_1\, \i_spi_rx_word[14]_net_1\, 
        \i_spi_rx_word_tmr2[14]_net_1\, 
        \i_spi_rx_word_tmr3[14]_net_1\, \i_spi_rx_word[13]_net_1\, 
        \i_spi_rx_word_tmr2[13]_net_1\, 
        \i_spi_rx_word_tmr3[13]_net_1\, \i_spi_rx_word[12]_net_1\, 
        \i_spi_rx_word_tmr2[12]_net_1\, 
        \i_spi_rx_word_tmr3[12]_net_1\, \i_spi_rx_word[11]_net_1\, 
        \i_spi_rx_word_tmr2[11]_net_1\, 
        \i_spi_rx_word_tmr3[11]_net_1\, \i_spi_rx_word[10]_net_1\, 
        \i_spi_rx_word_tmr2[10]_net_1\, 
        \i_spi_rx_word_tmr3[10]_net_1\, \i_spi_rx_word[9]_net_1\, 
        \i_spi_rx_word_tmr2[9]_net_1\, 
        \i_spi_rx_word_tmr3[9]_net_1\, \i_spi_rx_word[8]_net_1\, 
        \i_spi_rx_word_tmr2[8]_net_1\, 
        \i_spi_rx_word_tmr3[8]_net_1\, \i_spi_rx_word[7]_net_1\, 
        \i_spi_rx_word_tmr2[7]_net_1\, 
        \i_spi_rx_word_tmr3[7]_net_1\, \i_spi_rx_word[6]_net_1\, 
        \i_spi_rx_word_tmr2[6]_net_1\, 
        \i_spi_rx_word_tmr3[6]_net_1\, \i_spi_rx_word[5]_net_1\, 
        \i_spi_rx_word_tmr2[5]_net_1\, 
        \i_spi_rx_word_tmr3[5]_net_1\, \i_spi_rx_word[4]_net_1\, 
        \i_spi_rx_word_tmr2[4]_net_1\, 
        \i_spi_rx_word_tmr3[4]_net_1\, \i_spi_rx_word[3]_net_1\, 
        \i_spi_rx_word_tmr2[3]_net_1\, 
        \i_spi_rx_word_tmr3[3]_net_1\, \i_spi_rx_word[2]_net_1\, 
        \i_spi_rx_word_tmr2[2]_net_1\, 
        \i_spi_rx_word_tmr3[2]_net_1\, \i_spi_rx_word[1]_net_1\, 
        \i_spi_rx_word_tmr2[1]_net_1\, 
        \i_spi_rx_word_tmr3[1]_net_1\, \i_spi_rx_word[0]_net_1\, 
        \i_spi_rx_word_tmr2[0]_net_1\, 
        \i_spi_rx_word_tmr3[0]_net_1\, \clk_fcnt_0[5]\, 
        \clk_fcnt_tmr2[5]_net_1\, \clk_fcnt_tmr3[5]_net_1\, 
        \clk_fcnt_0[4]\, \clk_fcnt_tmr2[4]_net_1\, 
        \clk_fcnt_tmr3[4]_net_1\, \clk_fcnt_0[3]\, 
        \clk_fcnt_tmr2[3]_net_1\, \clk_fcnt_tmr3[3]_net_1\, 
        \clk_fcnt_0[2]\, \clk_fcnt_tmr2[2]_net_1\, 
        \clk_fcnt_tmr3[2]_net_1\, \clk_fcnt_0[1]\, 
        \clk_fcnt_tmr2[1]_net_1\, \clk_fcnt_tmr3[1]_net_1\, 
        \clk_fcnt_0[0]\, \clk_fcnt_tmr2[0]_net_1\, 
        \clk_fcnt_tmr3[0]_net_1\, \spi_sm_0[1]\, 
        \spi_sm_tmr2[1]_net_1\, \spi_sm_tmr3[1]_net_1\, 
        \spi_sm_0_0[2]\, \spi_sm_tmr2[2]_net_1\, 
        \spi_sm_tmr3[2]_net_1\, \spi_sm[3]_net_1\, 
        \spi_sm_tmr2[3]_net_1\, \spi_sm_tmr3[3]_net_1\, 
        \spi_sm_0[4]\, \spi_sm_tmr2[4]_net_1\, 
        \spi_sm_tmr3[4]_net_1\, \spi_sm_0[5]\, 
        \spi_sm_tmr2[5]_net_1\, \spi_sm_tmr3[5]_net_1\, spi_clr_1, 
        \spi_clr_tmr2\, \spi_clr_tmr3\, \i_spi_miso\, 
        \i_spi_miso_tmr2\, \i_spi_miso_tmr3\, \timeout_cnt_0[14]\, 
        \timeout_cnt_tmr2[14]_net_1\, 
        \timeout_cnt_tmr3[14]_net_1\, \timeout_cnt_0[13]\, 
        \timeout_cnt_tmr2[13]_net_1\, 
        \timeout_cnt_tmr3[13]_net_1\, \timeout_cnt_0[12]\, 
        \timeout_cnt_tmr2[12]_net_1\, 
        \timeout_cnt_tmr3[12]_net_1\, \timeout_cnt_0[11]\, 
        \timeout_cnt_tmr2[11]_net_1\, 
        \timeout_cnt_tmr3[11]_net_1\, \timeout_cnt_0[10]\, 
        \timeout_cnt_tmr2[10]_net_1\, 
        \timeout_cnt_tmr3[10]_net_1\, \timeout_cnt_0[9]\, 
        \timeout_cnt_tmr2[9]_net_1\, \timeout_cnt_tmr3[9]_net_1\, 
        \timeout_cnt_0[8]\, \timeout_cnt_tmr2[8]_net_1\, 
        \timeout_cnt_tmr3[8]_net_1\, \timeout_cnt_0[7]\, 
        \timeout_cnt_tmr2[7]_net_1\, \timeout_cnt_tmr3[7]_net_1\, 
        \timeout_cnt_0[6]\, \timeout_cnt_tmr2[6]_net_1\, 
        \timeout_cnt_tmr3[6]_net_1\, \timeout_cnt_0[5]\, 
        \timeout_cnt_tmr2[5]_net_1\, \timeout_cnt_tmr3[5]_net_1\, 
        \timeout_cnt_0[4]\, \timeout_cnt_tmr2[4]_net_1\, 
        \timeout_cnt_tmr3[4]_net_1\, \timeout_cnt_0[3]\, 
        \timeout_cnt_tmr2[3]_net_1\, \timeout_cnt_tmr3[3]_net_1\, 
        \timeout_cnt_0[2]\, \timeout_cnt_tmr2[2]_net_1\, 
        \timeout_cnt_tmr3[2]_net_1\, \timeout_cnt_0[1]\, 
        \timeout_cnt_tmr2[1]_net_1\, \timeout_cnt_tmr3[1]_net_1\, 
        \timeout_cnt_0[0]\, \timeout_cnt_tmr2[0]_net_1\, 
        \timeout_cnt_tmr3[0]_net_1\, \nullclk_cnt_0[4]\, 
        \nullclk_cnt_tmr2[4]_net_1\, \nullclk_cnt_tmr3[4]_net_1\, 
        \nullclk_cnt_0[3]\, \nullclk_cnt_tmr2[3]_net_1\, 
        \nullclk_cnt_tmr3[3]_net_1\, \nullclk_cnt_0[2]\, 
        \nullclk_cnt_tmr2[2]_net_1\, \nullclk_cnt_tmr3[2]_net_1\, 
        \nullclk_cnt_0[1]\, \nullclk_cnt_tmr2[1]_net_1\, 
        \nullclk_cnt_tmr3[1]_net_1\, \nullclk_cnt_0[0]\, 
        \nullclk_cnt_tmr2[0]_net_1\, \nullclk_cnt_tmr3[0]_net_1\, 
        \n_rx_32bit_sreg_0[31]\, \n_rx_32bit_sreg_tmr2[31]_net_1\, 
        \n_rx_32bit_sreg_tmr3[31]_net_1\, spi_slave_GND, 
        \n_rx_32bit_sreg_0[30]\, \n_rx_32bit_sreg_tmr2[30]_net_1\, 
        \n_rx_32bit_sreg_tmr3[30]_net_1\, \n_rx_32bit_sreg_0[29]\, 
        \n_rx_32bit_sreg_tmr2[29]_net_1\, 
        \n_rx_32bit_sreg_tmr3[29]_net_1\, \n_rx_32bit_sreg_0[28]\, 
        \n_rx_32bit_sreg_tmr2[28]_net_1\, 
        \n_rx_32bit_sreg_tmr3[28]_net_1\, \n_rx_32bit_sreg_0[27]\, 
        \n_rx_32bit_sreg_tmr2[27]_net_1\, 
        \n_rx_32bit_sreg_tmr3[27]_net_1\, \n_rx_32bit_sreg_0[26]\, 
        \n_rx_32bit_sreg_tmr2[26]_net_1\, 
        \n_rx_32bit_sreg_tmr3[26]_net_1\, \n_rx_32bit_sreg_0[25]\, 
        \n_rx_32bit_sreg_tmr2[25]_net_1\, 
        \n_rx_32bit_sreg_tmr3[25]_net_1\, \n_rx_32bit_sreg_0[24]\, 
        \n_rx_32bit_sreg_tmr2[24]_net_1\, 
        \n_rx_32bit_sreg_tmr3[24]_net_1\, \n_rx_32bit_sreg_0[23]\, 
        \n_rx_32bit_sreg_tmr2[23]_net_1\, 
        \n_rx_32bit_sreg_tmr3[23]_net_1\, \n_rx_32bit_sreg_0[22]\, 
        \n_rx_32bit_sreg_tmr2[22]_net_1\, 
        \n_rx_32bit_sreg_tmr3[22]_net_1\, \n_rx_32bit_sreg_0[21]\, 
        \n_rx_32bit_sreg_tmr2[21]_net_1\, 
        \n_rx_32bit_sreg_tmr3[21]_net_1\, \n_rx_32bit_sreg_0[20]\, 
        \n_rx_32bit_sreg_tmr2[20]_net_1\, 
        \n_rx_32bit_sreg_tmr3[20]_net_1\, \n_rx_32bit_sreg_0[19]\, 
        \n_rx_32bit_sreg_tmr2[19]_net_1\, 
        \n_rx_32bit_sreg_tmr3[19]_net_1\, \n_rx_32bit_sreg_0[18]\, 
        \n_rx_32bit_sreg_tmr2[18]_net_1\, 
        \n_rx_32bit_sreg_tmr3[18]_net_1\, \n_rx_32bit_sreg_0[17]\, 
        \n_rx_32bit_sreg_tmr2[17]_net_1\, 
        \n_rx_32bit_sreg_tmr3[17]_net_1\, \n_rx_32bit_sreg_0[16]\, 
        \n_rx_32bit_sreg_tmr2[16]_net_1\, 
        \n_rx_32bit_sreg_tmr3[16]_net_1\, \n_rx_32bit_sreg_0[15]\, 
        \n_rx_32bit_sreg_tmr2[15]_net_1\, 
        \n_rx_32bit_sreg_tmr3[15]_net_1\, \n_rx_32bit_sreg_0[14]\, 
        \n_rx_32bit_sreg_tmr2[14]_net_1\, 
        \n_rx_32bit_sreg_tmr3[14]_net_1\, \n_rx_32bit_sreg_0[13]\, 
        \n_rx_32bit_sreg_tmr2[13]_net_1\, 
        \n_rx_32bit_sreg_tmr3[13]_net_1\, \n_rx_32bit_sreg_0[12]\, 
        \n_rx_32bit_sreg_tmr2[12]_net_1\, 
        \n_rx_32bit_sreg_tmr3[12]_net_1\, \n_rx_32bit_sreg_0[11]\, 
        \n_rx_32bit_sreg_tmr2[11]_net_1\, 
        \n_rx_32bit_sreg_tmr3[11]_net_1\, \n_rx_32bit_sreg_0[10]\, 
        \n_rx_32bit_sreg_tmr2[10]_net_1\, 
        \n_rx_32bit_sreg_tmr3[10]_net_1\, \n_rx_32bit_sreg_0[9]\, 
        \n_rx_32bit_sreg_tmr2[9]_net_1\, 
        \n_rx_32bit_sreg_tmr3[9]_net_1\, \n_rx_32bit_sreg_0[8]\, 
        \n_rx_32bit_sreg_tmr2[8]_net_1\, 
        \n_rx_32bit_sreg_tmr3[8]_net_1\, \n_rx_32bit_sreg_0[7]\, 
        \n_rx_32bit_sreg_tmr2[7]_net_1\, 
        \n_rx_32bit_sreg_tmr3[7]_net_1\, \n_rx_32bit_sreg_0[6]\, 
        \n_rx_32bit_sreg_tmr2[6]_net_1\, 
        \n_rx_32bit_sreg_tmr3[6]_net_1\, \n_rx_32bit_sreg_0[5]\, 
        \n_rx_32bit_sreg_tmr2[5]_net_1\, 
        \n_rx_32bit_sreg_tmr3[5]_net_1\, \n_rx_32bit_sreg_0[4]\, 
        \n_rx_32bit_sreg_tmr2[4]_net_1\, 
        \n_rx_32bit_sreg_tmr3[4]_net_1\, \n_rx_32bit_sreg_0[3]\, 
        \n_rx_32bit_sreg_tmr2[3]_net_1\, 
        \n_rx_32bit_sreg_tmr3[3]_net_1\, \n_rx_32bit_sreg_0[2]\, 
        \n_rx_32bit_sreg_tmr2[2]_net_1\, 
        \n_rx_32bit_sreg_tmr3[2]_net_1\, \n_rx_32bit_sreg_0[1]\, 
        \n_rx_32bit_sreg_tmr2[1]_net_1\, 
        \n_rx_32bit_sreg_tmr3[1]_net_1\, \n_rx_32bit_sreg_0[0]\, 
        \n_rx_32bit_sreg_tmr2[0]_net_1\, 
        \n_rx_32bit_sreg_tmr3[0]_net_1\, spi_clk_2c_0, 
        \spi_clk_2c_tmr2\, \spi_clk_2c_tmr3\, \spi_clk_1c\, 
        spi_clk_1c_0, \spi_clk_1c_tmr2\, \spi_clk_1c_tmr3\, 
        i_spi_rx_strb_0, \i_spi_rx_strb_tmr2\, 
        \i_spi_rx_strb_tmr3\, \VCC\ : std_logic;

begin 

    channels_ready(8) <= \channels_ready[8]\;
    channels_ready(7) <= \channels_ready[7]\;
    channels_ready(6) <= \channels_ready[6]\;
    channels_ready(5) <= \channels_ready[5]\;
    channels_ready(4) <= \channels_ready[4]\;
    channels_ready(3) <= \channels_ready[3]\;
    channels_ready(2) <= \channels_ready[2]\;
    spi_tx_word_10 <= \spi_tx_word[10]\;
    spi_tx_word_11 <= \spi_tx_word[11]\;
    spi_tx_word_18 <= \spi_tx_word[18]\;
    spi_tx_word_19 <= \spi_tx_word[19]\;
    spi_tx_word_5 <= \spi_tx_word[5]\;
    spi_tx_word_9 <= \spi_tx_word[9]\;
    spi_tx_word_17 <= \spi_tx_word[17]\;
    spi_tx_word_0 <= \spi_tx_word[0]\;
    spi_tx_word_6 <= \spi_tx_word[6]\;
    spi_tx_word_7 <= \spi_tx_word[7]\;
    spi_tx_word_21 <= \spi_tx_word[21]\;
    spi_tx_word_4 <= \spi_tx_word[4]\;
    spi_tx_word_16 <= \spi_tx_word[16]\;
    channels_on(4) <= \channels_on[4]\;
    channels_on(3) <= \channels_on[3]\;
    SPI_TX_WORD_i_1_0 <= \SPI_TX_WORD_i_1[1]\;
    spi_rx_word_7 <= \spi_rx_word[7]\;
    spi_rx_word_9 <= \spi_rx_word[9]\;
    spi_rx_word_16 <= \spi_rx_word[16]\;
    spi_rx_word_10 <= \spi_rx_word[10]\;
    spi_rx_word_12 <= \spi_rx_word[12]\;
    spi_rx_word_0 <= \spi_rx_word[0]\;
    spi_rx_word_6 <= \spi_rx_word[6]\;
    spi_rx_word_2 <= \spi_rx_word[2]\;
    spi_rx_word_8 <= \spi_rx_word[8]\;
    spi_rx_word_30 <= \spi_rx_word[30]\;
    spi_rx_word_3 <= \spi_rx_word[3]\;
    spi_rx_word_4 <= \spi_rx_word[4]\;
    spi_rx_word_5 <= \spi_rx_word[5]\;
    spi_rx_word_11 <= \spi_rx_word[11]\;
    spi_rx_word_15 <= \spi_rx_word[15]\;
    spi_rx_word_18 <= \spi_rx_word[18]\;
    i42_mux_9 <= \i42_mux_9\;
    N_63_0 <= \N_63_0\;
    N_85 <= \N_85\;
    N_79 <= \N_79\;
    i42_mux <= \i42_mux\;
    i42_mux_0 <= \i42_mux_0\;
    i42_mux_7 <= \i42_mux_7\;
    i42_mux_8 <= \i42_mux_8\;
    i42_mux_2 <= \i42_mux_2\;
    i42_mux_10 <= \i42_mux_10\;
    N_16_0 <= \N_16_0\;
    i42_mux_11 <= \i42_mux_11\;
    sca_dat_in_c <= \sca_dat_in_c\;
    spi_timeout_pulse_i_1 <= \spi_timeout_pulse_i_1\;

    \n_rx_32bit_sreg_maj_RNIE19E[6]\ : MX2
      port map(A => \rx_32bit_sreg[6]_net_1\, B => 
        \n_rx_32bit_sreg[6]_net_1\, S => clk_fcnt_en_1, Y => 
        \n_rx_32bit_sreg_maj_RNIE19E[6]_net_1\);
    
    \i_spi_rx_word_maj_RNIO745V[15]\ : MX2B
      port map(A => channels_desired_ready(8), B => N_132, S => 
        bad_crc_0_sqmuxa_1, Y => i_spi_rx_word_maj_RNIO745V_0);
    
    \nullclk_cnt_tmr3[1]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNI0T8R1[1]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \nullclk_cnt_tmr3[1]_net_1\);
    
    \nullclk_cnt[0]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNIESSB1[0]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \nullclk_cnt_0[0]\);
    
    \half_clk_fcnt_maj_RNINC2V[3]\ : MX2
      port map(A => N_656, B => N_657, S => 
        \half_clk_fcnt[3]_net_1\, Y => N_658);
    
    un1_clk_fcnt_I_23 : XOR2
      port map(A => \clk_fcnt[2]_net_1\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, Y => I_23);
    
    \P_TX_32BIT_REG[5]\ : DLN1
      port map(D => \spi_tx_word[5]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[5]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[7]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[6]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNI2IJO1\, CLR => \spi_clr_maj_RNI2IJO1_0\, 
        Q => \n_rx_32bit_sreg_tmr3[7]_net_1\);
    
    \timeout_cnt_maj_RNIR1TF[12]\ : NOR2B
      port map(A => \timeout_cnt[13]_net_1\, B => 
        \timeout_cnt[12]_net_1\, Y => 
        SPI_TIMEOUT_PULSE_i_0_a2_1_0);
    
    \nullclk_cnt_maj_RNII6E61[4]\ : AX1A
      port map(A => N_176, B => \nullclk_cnt[3]_net_1\, C => 
        \nullclk_cnt[4]_net_1\, Y => N_183_i);
    
    \i_spi_rx_word_tmr3[16]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIAAHJ[16]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[16]_net_1\);
    
    m64 : AO18
      port map(A => channel_involtage_ok(1), B => 
        spi_rx_command_reg(0), C => spi_rx_command_reg(1), Y => 
        N_65);
    
    \n_rx_32bit_sreg_tmr3[5]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[4]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNITPKU1\, CLR => \spi_clr_maj_RNITPKU1_0\, 
        Q => \n_rx_32bit_sreg_tmr3[5]_net_1\);
    
    \timeout_cnt_tmr2[13]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI6GBJ3[13]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[13]_net_1\);
    
    \P_TX_32BIT_REG[20]\ : DLN1
      port map(D => \i42_mux_2\, G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[20]_net_1\);
    
    \spi_sm_maj_RNI8BG01[4]\ : NOR2A
      port map(A => \spi_sm[4]_net_1\, B => N_172, Y => N_28_0);
    
    spi_clr_maj_RNIA89C1_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[17]\, Y => 
        \spi_clr_maj_RNIA89C1_0\);
    
    \n_rx_32bit_sreg_tmr2[24]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[23]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIB629M\, CLR => 
        \spi_clr_maj_RNIB629M_0\, Q => 
        \n_rx_32bit_sreg_tmr2[24]_net_1\);
    
    \i_spi_rx_word_tmr3[23]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI68JJ[23]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[23]_net_1\);
    
    \i_spi_rx_word_maj_RNILIH68[1]\ : XO1
      port map(A => un4_spi_rx_command_3_7, B => 
        un4_spi_rx_command_3_8, C => un4_spi_rx_command_0, Y => 
        un4_spi_rx_command_NE_2);
    
    \i_spi_rx_word_tmr2[6]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIPLMK[6]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[6]_net_1\);
    
    \i_spi_rx_word_maj_RNI4RDI[2]\ : XOR2
      port map(A => \spi_rx_word[13]\, B => \spi_rx_word[2]\, Y
         => un4_spi_rx_command_0_3);
    
    \P_TX_32BIT_REG[26]\ : DLN1
      port map(D => tx_crc(2), G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[26]_net_1\);
    
    \i_spi_rx_word[16]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIAAHJ[16]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[16]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[10]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[9]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIETKF1\, CLR => \spi_clr_maj_RNIETKF1_0\, 
        Q => \n_rx_32bit_sreg_tmr3[10]_net_1\);
    
    \i_spi_rx_word_maj_RNIRFN301[15]\ : MX2B
      port map(A => channels_desired_on(8), B => N_139, S => 
        bad_crc_0_sqmuxa_1, Y => i_spi_rx_word_maj_RNIRFN301_0);
    
    spi_clr_maj_RNI96792 : NOR2B
      port map(A => \i42_mux_10\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNI96792\);
    
    \n_rx_32bit_sreg_tmr2[0]\ : DFN1P1C1
      port map(D => sca_dat_out_c, CLK => GLB, PRE => 
        \spi_clr_maj_RNI02QU2\, CLR => \spi_clr_maj_RNI02QU2_0\, 
        Q => \n_rx_32bit_sreg_tmr2[0]_net_1\);
    
    spi_clr_maj_RNIJ3632 : NOR2B
      port map(A => \i42_mux_7\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIJ3632\);
    
    \i_spi_rx_word_maj[29]\ : MAJ3
      port map(A => \i_spi_rx_word[29]_net_1\, B => 
        \i_spi_rx_word_tmr2[29]_net_1\, C => 
        \i_spi_rx_word_tmr3[29]_net_1\, Y => \spi_rx_crc[5]\);
    
    m94_e : NOR2A
      port map(A => N_210_i, B => dtycyc_cnt(4), Y => N_167_0);
    
    \timeout_cnt_maj_RNILS1E[0]\ : OR2B
      port map(A => \timeout_cnt[1]_net_1\, B => 
        \timeout_cnt[0]_net_1\, Y => N_120);
    
    \clk_fcnt_2c_tmr3[4]\ : DFN1C0
      port map(D => \clk_fcnt_1c[4]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_tmr3[4]_net_1\);
    
    \i_spi_rx_word[12]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNIJDVI[12]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[12]_net_1\);
    
    \i_spi_rx_word_maj[3]\ : MAJ3
      port map(A => \i_spi_rx_word[3]_net_1\, B => 
        \i_spi_rx_word_tmr2[3]_net_1\, C => 
        \i_spi_rx_word_tmr3[3]_net_1\, Y => \spi_rx_word[3]\);
    
    spi_clr_maj_RNIRC3M1_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[21]\, Y => 
        \spi_clr_maj_RNIRC3M1_0\);
    
    \i_spi_rx_word_tmr3[19]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIGGHJ[19]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[19]_net_1\);
    
    \i_spi_rx_word_tmr2[5]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNINJMK[5]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[5]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[2]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[1]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIMFTI2\, CLR => \spi_clr_maj_RNIMFTI2_0\, 
        Q => \n_rx_32bit_sreg_tmr2[2]_net_1\);
    
    \timeout_cnt_tmr3[2]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI23C11[2]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[2]_net_1\);
    
    spi_clr_maj_RNIRNKU1_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[4]\, Y => 
        \spi_clr_maj_RNIRNKU1_0\);
    
    m85 : NOR2B
      port map(A => channels_desired_ready(5), B => \N_85\, Y => 
        \channels_ready[5]\);
    
    \i_spi_rx_word_tmr3[15]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIPJVI[15]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[15]_net_1\);
    
    \n_rx_32bit_sreg[5]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[4]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNITPKU1\, CLR => \spi_clr_maj_RNITPKU1_0\, 
        Q => \n_rx_32bit_sreg_0[5]\);
    
    i_spi_miso_maj : MAJ3
      port map(A => \i_spi_miso\, B => \i_spi_miso_tmr2\, C => 
        \i_spi_miso_tmr3\, Y => \sca_dat_in_c\);
    
    \timeout_cnt[7]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI2NH42[7]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[7]\);
    
    un1_clk_fcnt_I_1 : AND2
      port map(A => \clk_fcnt[0]_net_1\, B => un2_clk_fcnt_en, Y
         => \DWACT_ADD_CI_0_TMP[0]\);
    
    \P_TX_32BIT_REG_RNI2PE2[11]\ : MX2
      port map(A => \P_TX_32BIT_REG[27]_net_1\, B => 
        \P_TX_32BIT_REG[11]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_650);
    
    \P_TX_32BIT_REG[17]\ : DLN1
      port map(D => \spi_tx_word[17]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[17]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[21]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[20]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIRC3M1\, CLR => 
        \spi_clr_maj_RNIRC3M1_0\, Q => 
        \n_rx_32bit_sreg_tmr3[21]_net_1\);
    
    \rx_32bit_sreg_tmr2[15]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNITEVR[15]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[15]_net_1\);
    
    m115 : NOR3B
      port map(A => N_68_0, B => channels_desired_on(8), C => 
        \N_63_0\, Y => \spi_tx_word[7]\);
    
    \half_clk_fcnt_maj[1]\ : MAJ3
      port map(A => \half_clk_fcnt_0[1]\, B => 
        \half_clk_fcnt_tmr2[1]_net_1\, C => 
        \half_clk_fcnt_tmr3[1]_net_1\, Y => 
        \half_clk_fcnt[1]_net_1\);
    
    un1_clk_fcnt_I_26 : XOR2
      port map(A => \clk_fcnt[5]_net_1\, B => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, Y => \un1_clk_fcnt[0]\);
    
    \rx_32bit_sreg_maj[22]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[22]\, B => 
        \rx_32bit_sreg_tmr2[22]_net_1\, C => 
        \rx_32bit_sreg_tmr3[22]_net_1\, Y => 
        \rx_32bit_sreg[22]_net_1\);
    
    m88 : NOR2A
      port map(A => spi_rx_command_reg(0), B => J11_DEBUG_c_c(0), 
        Y => i43_mux_22);
    
    \i_spi_rx_word_maj_RNI6JOR[9]\ : MX2C
      port map(A => \spi_rx_word[8]\, B => \spi_rx_word[9]\, S
         => J11_DEBUG_c_c(0), Y => N_31_0);
    
    spi_clr_maj_RNIB629M_0 : NOR2A
      port map(A => \spi_clr\, B => tx_crc(0), Y => 
        \spi_clr_maj_RNIB629M_0\);
    
    \timeout_cnt_maj_RNICB8O1[7]\ : OR2A
      port map(A => \timeout_cnt[7]_net_1\, B => N_163, Y => 
        N_165);
    
    \i_spi_rx_word_tmr3[28]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIGIJJ[28]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[28]_net_1\);
    
    \i_spi_rx_word_tmr3[11]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIHBVI[11]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[11]_net_1\);
    
    \clk_fcnt_maj_RNI09O38[0]\ : AOI1B
      port map(A => un2_clk_fcnt_3, B => un2_clk_fcnt_2, C => 
        \un1_clk_fcnt[0]\, Y => \half_clk_fcnt_4[5]\);
    
    \spi_sm_maj_RNIDU2E[3]\ : MX2
      port map(A => clk_fcnt_en_1, B => N_304, S => N_218, Y => 
        \spi_sm_maj_RNIDU2E[3]_net_1\);
    
    m97 : NOR2
      port map(A => SW5_PIN4_UNUSED_c, B => spi_rx_command_reg(0), 
        Y => i43_mux_24);
    
    \timeout_cnt_maj_RNI5PVN2[11]\ : XA1C
      port map(A => \timeout_cnt[11]_net_1\, B => N_169, C => 
        N_304, Y => N_26_1);
    
    \rx_32bit_sreg[19]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI5NVR[19]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[19]\);
    
    \i_spi_rx_word_tmr2[4]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNILHMK[4]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[4]_net_1\);
    
    \i_spi_rx_word_maj_RNIGK0V4[20]\ : XOR3
      port map(A => un4_spi_rx_command_2_7, B => 
        un4_spi_rx_command_2_6, C => un4_spi_rx_command_2_8, Y
         => un4_spi_rx_command_2);
    
    \i_spi_rx_word[26]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNICEJJ[26]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[26]_net_1\);
    
    \timeout_cnt_tmr2[12]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNINTCB3[12]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[12]_net_1\);
    
    m3 : NOR2B
      port map(A => total_channel_constraints_0, B => 
        channels_desired_ready(1), Y => channels_ready(1));
    
    \half_clk_fcnt_tmr2[2]\ : DFN1C1
      port map(D => I_23, CLK => GLB, CLR => \spi_clr\, Q => 
        \half_clk_fcnt_tmr2[2]_net_1\);
    
    \i_spi_rx_word_tmr2[20]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI02JJ[20]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[20]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNIAT8E[4]\ : MX2
      port map(A => \rx_32bit_sreg[4]_net_1\, B => 
        \n_rx_32bit_sreg[4]_net_1\, S => clk_fcnt_en_1, Y => 
        \n_rx_32bit_sreg_maj_RNIAT8E[4]_net_1\);
    
    \P_TX_32BIT_REG[0]\ : DLN1
      port map(D => \spi_tx_word[0]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[0]_net_1\);
    
    \rx_32bit_sreg_tmr3[7]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIG39E[7]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[7]_net_1\);
    
    \timeout_cnt_maj_RNI8M7M2[11]\ : OR2A
      port map(A => \timeout_cnt[11]_net_1\, B => N_169, Y => 
        N_173);
    
    \i_spi_rx_word_maj_RNI3QDI[3]\ : NOR2B
      port map(A => \spi_rx_word[3]\, B => \spi_rx_word[11]\, Y
         => N_36);
    
    \rx_32bit_sreg_maj[8]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[8]\, B => 
        \rx_32bit_sreg_tmr2[8]_net_1\, C => 
        \rx_32bit_sreg_tmr3[8]_net_1\, Y => 
        \rx_32bit_sreg[8]_net_1\);
    
    \i_spi_rx_word[22]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI46JJ[22]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[22]_net_1\);
    
    \rx_32bit_sreg_maj[7]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[7]\, B => 
        \rx_32bit_sreg_tmr2[7]_net_1\, C => 
        \rx_32bit_sreg_tmr3[7]_net_1\, Y => 
        \rx_32bit_sreg[7]_net_1\);
    
    \n_rx_32bit_sreg_maj[26]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[26]\, B => 
        \n_rx_32bit_sreg_tmr2[26]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[26]_net_1\, Y => 
        \n_rx_32bit_sreg[26]_net_1\);
    
    m15_0 : MX2C
      port map(A => N_14_0, B => SW5_IGNORE_CRC_BAR_c, S => 
        spi_tx_word_sn_N_3, Y => \N_16_0\);
    
    \n_rx_32bit_sreg_maj[24]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[24]\, B => 
        \n_rx_32bit_sreg_tmr2[24]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[24]_net_1\, Y => 
        \n_rx_32bit_sreg[24]_net_1\);
    
    \timeout_cnt[10]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNISRFR2[10]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[10]\);
    
    \timeout_cnt[4]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNIV7EF1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[4]\);
    
    \P_TX_32BIT_REG[23]\ : DLN1
      port map(D => \i42_mux\, G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[23]_net_1\);
    
    \clk_fcnt_maj_RNIQC8O1[5]\ : NOR3B
      port map(A => \clk_fcnt[5]_net_1\, B => un2_clk_fcnt_1, C
         => \clk_fcnt[2]_net_1\, Y => un2_clk_fcnt_3);
    
    \i_spi_rx_word_tmr3[3]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIJFMK[3]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[3]_net_1\);
    
    \n_rx_32bit_sreg[28]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[27]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIN9UQQ\, CLR => 
        \spi_clr_maj_RNIN9UQQ_0\, Q => \n_rx_32bit_sreg_0[28]\);
    
    \i_spi_rx_word[31]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNI48LJ[31]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[31]_net_1\);
    
    \timeout_cnt[9]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI96KI2[9]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[9]\);
    
    \sw2_sw5_channel_on_a_20\ : MX2B
      port map(A => sw2_sw5_channel_on_a(6), B => 
        J11_DEBUG_c_c(3), S => N_210_i, Y => 
        sw2_sw5_channel_on_a_20);
    
    m16 : AOI1
      port map(A => channels_desired_on(2), B => N_7_0, C => 
        spi_tx_word_sn_N_2, Y => N_17_0);
    
    \clk_fcnt[4]\ : DFN0C1
      port map(D => \clk_fcnt_maj_RNI5GBL[4]_net_1\, CLK => GLB, 
        CLR => \spi_clr\, Q => \clk_fcnt_0[4]\);
    
    \spi_sm_tmr3[1]\ : DFN1C0
      port map(D => N_88, CLK => clk_5m_gl, CLR => gb_spi_rst_b, 
        Q => \spi_sm_tmr3[1]_net_1\);
    
    m127 : NOR3B
      port map(A => \N_85\, B => channels_desired_on(5), C => 
        \N_63_0\, Y => \spi_tx_word[4]\);
    
    m56 : NOR2B
      port map(A => active_switch_constraints(3), B => 
        spi_rx_command_reg(0), Y => i43_mux_10);
    
    \timeout_cnt_maj[2]\ : MAJ3
      port map(A => \timeout_cnt_0[2]\, B => 
        \timeout_cnt_tmr2[2]_net_1\, C => 
        \timeout_cnt_tmr3[2]_net_1\, Y => \timeout_cnt[2]_net_1\);
    
    \i_spi_rx_word_tmr3[9]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNIVRMK[9]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[9]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[14]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[13]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIG0632\, CLR => 
        \spi_clr_maj_RNIG0632_0\, Q => 
        \n_rx_32bit_sreg_tmr2[14]_net_1\);
    
    \nullclk_cnt_maj_RNIRQ472[4]\ : OR2A
      port map(A => N_186, B => N_183_i, Y => N_17);
    
    \rx_32bit_sreg_tmr2[18]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI3LVR[18]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[18]_net_1\);
    
    \timeout_cnt_maj_RNI92T41[4]\ : XO1
      port map(A => \timeout_cnt[4]_net_1\, B => N_122, C => 
        N_304, Y => N_72);
    
    \half_clk_fcnt_tmr2[0]\ : DFN1C1
      port map(D => \DWACT_ADD_CI_0_partial_sum[0]\, CLK => GLB, 
        CLR => \spi_clr\, Q => \half_clk_fcnt_tmr2[0]_net_1\);
    
    \half_clk_fcnt_maj[3]\ : MAJ3
      port map(A => \half_clk_fcnt_0[3]\, B => 
        \half_clk_fcnt_tmr2[3]_net_1\, C => 
        \half_clk_fcnt_tmr3[3]_net_1\, Y => 
        \half_clk_fcnt[3]_net_1\);
    
    \rx_32bit_sreg[7]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIG39E[7]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[7]\);
    
    \clk_fcnt_2c_tmr3[0]\ : DFN1C0
      port map(D => \clk_fcnt_1c[0]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_tmr3[0]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[27]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[26]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNITKFFR\, CLR => 
        \spi_clr_maj_RNITKFFR_0\, Q => 
        \n_rx_32bit_sreg_tmr2[27]_net_1\);
    
    \spi_sm_maj_RNI7G821[5]\ : AO1
      port map(A => N_172, B => \spi_sm[4]_net_1\, C => 
        \spi_sm[5]_net_1\, Y => N_82);
    
    m7 : NOR2B
      port map(A => channels_desired_ready(3), B => 
        \total_channel_constraints[3]\, Y => \channels_ready[3]\);
    
    \i_spi_rx_word_tmr2[1]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNIFBMK[1]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[1]_net_1\);
    
    \rx_32bit_sreg_maj[11]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[11]\, B => 
        \rx_32bit_sreg_tmr2[11]_net_1\, C => 
        \rx_32bit_sreg_tmr3[11]_net_1\, Y => 
        \rx_32bit_sreg[11]_net_1\);
    
    \rx_32bit_sreg_tmr2[25]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIVI1S[25]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[25]_net_1\);
    
    \rx_32bit_sreg_maj[3]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[3]\, B => 
        \rx_32bit_sreg_tmr2[3]_net_1\, C => 
        \rx_32bit_sreg_tmr3[3]_net_1\, Y => 
        \rx_32bit_sreg[3]_net_1\);
    
    \rx_32bit_sreg_maj[1]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[1]\, B => 
        \rx_32bit_sreg_tmr2[1]_net_1\, C => 
        \rx_32bit_sreg_tmr3[1]_net_1\, Y => 
        \rx_32bit_sreg[1]_net_1\);
    
    \clk_fcnt_2c[0]\ : DFN1C0
      port map(D => \clk_fcnt_1c[0]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_0[0]\);
    
    \clk_fcnt_1c[2]\ : DFN1C0
      port map(D => \clk_fcnt[2]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_0[2]\);
    
    \timeout_cnt_maj_RNISRFR2[10]\ : MX2
      port map(A => N_24, B => \timeout_cnt[10]_net_1\, S => 
        N_530, Y => \timeout_cnt_maj_RNISRFR2[10]_net_1\);
    
    \clk_fcnt_tmr2[1]\ : DFN0C1
      port map(D => \half_clk_fcnt_maj_RNIV9BL[1]_net_1\, CLK => 
        GLB, CLR => \spi_clr\, Q => \clk_fcnt_tmr2[1]_net_1\);
    
    m102 : NOR2A
      port map(A => \channels_ready[4]\, B => \N_63_0\, Y => 
        \spi_tx_word[11]\);
    
    \spi_sm[0]\ : DFN1C0
      port map(D => N_6, CLK => clk_5m_gl, CLR => gb_spi_rst_b, Q
         => \spi_sm[0]_net_1\);
    
    \i_spi_rx_word_tmr2[22]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI46JJ[22]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[22]_net_1\);
    
    spi_clr_maj_RNI96792_0 : NOR2A
      port map(A => \spi_clr\, B => \i42_mux_10\, Y => 
        \spi_clr_maj_RNI96792_0\);
    
    \half_clk_fcnt[5]\ : DFN1P1
      port map(D => \half_clk_fcnt_4[5]\, CLK => GLB, PRE => 
        \spi_clr\, Q => \half_clk_fcnt_0[5]\);
    
    spi_clr_maj_RNIEI6G1 : NOR2B
      port map(A => \spi_tx_word[19]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIEI6G1\);
    
    \half_clk_fcnt_maj_RNIKBAF5[0]\ : MX2
      port map(A => N_283, B => N_298, S => 
        \half_clk_fcnt[0]_net_1\, Y => i_spi_miso_2);
    
    \clk_fcnt_1c_tmr3[2]\ : DFN1C0
      port map(D => \clk_fcnt[2]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_tmr3[2]_net_1\);
    
    \rx_32bit_sreg[9]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIK79E[9]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[9]\);
    
    \half_clk_fcnt_tmr3[1]\ : DFN1C1
      port map(D => I_24, CLK => GLB, CLR => \spi_clr\, Q => 
        \half_clk_fcnt_tmr3[1]_net_1\);
    
    \spi_sm_tmr3[4]\ : DFN1C0
      port map(D => N_82, CLK => clk_5m_gl, CLR => gb_spi_rst_b, 
        Q => \spi_sm_tmr3[4]_net_1\);
    
    \timeout_cnt[3]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI05D81[3]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[3]\);
    
    \n_rx_32bit_sreg_maj_RNI3N1S[27]\ : MX2
      port map(A => \rx_32bit_sreg[27]_net_1\, B => 
        \n_rx_32bit_sreg[27]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNI3N1S[27]_net_1\);
    
    \i_spi_rx_word_maj[5]\ : MAJ3
      port map(A => \i_spi_rx_word[5]_net_1\, B => 
        \i_spi_rx_word_tmr2[5]_net_1\, C => 
        \i_spi_rx_word_tmr3[5]_net_1\, Y => \spi_rx_word[5]\);
    
    \i_spi_rx_word_maj[10]\ : MAJ3
      port map(A => \i_spi_rx_word[10]_net_1\, B => 
        \i_spi_rx_word_tmr2[10]_net_1\, C => 
        \i_spi_rx_word_tmr3[10]_net_1\, Y => \spi_rx_word[10]\);
    
    spi_clr_maj_RNIIFHQ2_0 : NOR2A
      port map(A => \spi_clr\, B => \SPI_TX_WORD_i_1[1]\, Y => 
        \spi_clr_maj_RNIIFHQ2_0\);
    
    m100 : XOR2
      port map(A => spi_rx_command_reg(1), B => 
        spi_rx_command_reg(0), Y => \N_63_0\);
    
    \n_rx_32bit_sreg_tmr3[18]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[17]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNICT7M1\, CLR => 
        \spi_clr_maj_RNICT7M1_0\, Q => 
        \n_rx_32bit_sreg_tmr3[18]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[6]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[5]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNI0GJO1\, CLR => \spi_clr_maj_RNI0GJO1_0\, 
        Q => \n_rx_32bit_sreg_tmr2[6]_net_1\);
    
    \n_rx_32bit_sreg_maj[13]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[13]\, B => 
        \n_rx_32bit_sreg_tmr2[13]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[13]_net_1\, Y => 
        \n_rx_32bit_sreg[13]_net_1\);
    
    \timeout_cnt[1]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI52BQ[1]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[1]\);
    
    \i_spi_rx_word_maj_RNI8AJJ[24]\ : MX2
      port map(A => \spi_rx_crc[0]\, B => 
        \rx_32bit_sreg[24]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNI8AJJ[24]_net_1\);
    
    \spi_sm_maj_RNIVD975[1]\ : AO1A
      port map(A => N_228, B => \spi_sm[1]_net_1\, C => N_215, Y
         => N_88);
    
    \rx_32bit_sreg[29]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI7R1S[29]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[29]\);
    
    \n_rx_32bit_sreg_tmr3[29]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[28]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIMFUOM\, CLR => 
        \spi_clr_maj_RNIMFUOM_0\, Q => 
        \n_rx_32bit_sreg_tmr3[29]_net_1\);
    
    \i_spi_rx_word_maj_RNINRAB[22]\ : XOR2
      port map(A => \spi_rx_word[22]\, B => \spi_rx_word[14]\, Y
         => un4_spi_rx_command_4_3);
    
    \i_spi_rx_word_maj_RNIIKJJ[29]\ : MX2
      port map(A => \spi_rx_crc[5]\, B => 
        \rx_32bit_sreg[29]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNIIKJJ[29]_net_1\);
    
    \sw2_sw5_channel_on_a_15\ : MX2B
      port map(A => sw2_sw5_channel_on_a(1), B => 
        J11_DEBUG_c_c(6), S => N_210_i, Y => 
        sw2_sw5_channel_on_a_15);
    
    \rx_32bit_sreg_maj[14]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[14]\, B => 
        \rx_32bit_sreg_tmr2[14]_net_1\, C => 
        \rx_32bit_sreg_tmr3[14]_net_1\, Y => 
        \rx_32bit_sreg[14]_net_1\);
    
    m105 : NOR2A
      port map(A => \channels_ready[3]\, B => \N_63_0\, Y => 
        \spi_tx_word[10]\);
    
    \n_rx_32bit_sreg[6]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[5]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNI0GJO1\, CLR => \spi_clr_maj_RNI0GJO1_0\, 
        Q => \n_rx_32bit_sreg_0[6]\);
    
    \timeout_cnt_tmr3[9]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI96KI2[9]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[9]_net_1\);
    
    m21_0 : MX2C
      port map(A => N_304_0, B => J11_DEBUG_c_c(5), S => 
        spi_tx_word_sn_N_3, Y => \spi_tx_word[0]\);
    
    \n_rx_32bit_sreg_maj[21]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[21]\, B => 
        \n_rx_32bit_sreg_tmr2[21]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[21]_net_1\, Y => 
        \n_rx_32bit_sreg[21]_net_1\);
    
    \n_rx_32bit_sreg_maj[10]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[10]\, B => 
        \n_rx_32bit_sreg_tmr2[10]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[10]_net_1\, Y => 
        \n_rx_32bit_sreg[10]_net_1\);
    
    \n_rx_32bit_sreg[18]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[17]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNICT7M1\, CLR => 
        \spi_clr_maj_RNICT7M1_0\, Q => \n_rx_32bit_sreg_0[18]\);
    
    \sw2_sw5_channel_on_b_28\ : MX2
      port map(A => sw2_sw5_channel_on_b(6), B => 
        sw2_sw5_channel_on_a(6), S => N_210_i, Y => 
        sw2_sw5_channel_on_b_28);
    
    \i_spi_rx_word_tmr2[17]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNICCHJ[17]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[17]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[20]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[19]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNI5CPP1\, CLR => 
        \spi_clr_maj_RNI5CPP1_0\, Q => 
        \n_rx_32bit_sreg_tmr2[20]_net_1\);
    
    \i_spi_rx_word[19]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIGGHJ[19]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[19]_net_1\);
    
    \spi_sm[3]\ : DFN1C0
      port map(D => N_28_0, CLK => clk_5m_gl, CLR => gb_spi_rst_b, 
        Q => \spi_sm[3]_net_1\);
    
    spi_clr_maj_RNI5CPP1 : NOR2B
      port map(A => \i42_mux_2\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNI5CPP1\);
    
    \spi_sm_maj_RNIT8G3[5]\ : NOR2
      port map(A => \spi_sm[5]_net_1\, B => \spi_sm[4]_net_1\, Y
         => N_63);
    
    \rx_32bit_sreg_maj_RNIF9VI[10]\ : MX2
      port map(A => \spi_rx_word[10]\, B => 
        \rx_32bit_sreg[10]_net_1\, S => \spi_sm_1[0]\, Y => 
        \rx_32bit_sreg_maj_RNIF9VI[10]_net_1\);
    
    \clk_fcnt_1c_tmr2[5]\ : DFN1C0
      port map(D => \clk_fcnt[5]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_tmr2[5]_net_1\);
    
    \clk_fcnt_tmr3[2]\ : DFN0C1
      port map(D => \half_clk_fcnt_maj_RNI1CBL[2]_net_1\, CLK => 
        GLB, CLR => \spi_clr\, Q => \clk_fcnt_tmr3[2]_net_1\);
    
    \half_clk_fcnt_maj[2]\ : MAJ3
      port map(A => \half_clk_fcnt_0[2]\, B => 
        \half_clk_fcnt_tmr2[2]_net_1\, C => 
        \half_clk_fcnt_tmr3[2]_net_1\, Y => 
        \half_clk_fcnt[2]_net_1\);
    
    \rx_32bit_sreg_tmr2[28]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI5P1S[28]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[28]_net_1\);
    
    \half_clk_fcnt_maj_RNITSEH[3]\ : MX2
      port map(A => N_269, B => N_649, S => 
        \half_clk_fcnt[3]_net_1\, Y => N_271);
    
    \timeout_cnt_tmr2[11]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI9CE33[11]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[11]_net_1\);
    
    \dtycyc_cnt_35\ : MX2
      port map(A => N_24_0, B => dtycyc_cnt(3), S => 
        n_dtycyc_cnt_2_sqmuxa, Y => dtycyc_cnt_35);
    
    \timeout_cnt_tmr2[14]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI502C4[14]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[14]_net_1\);
    
    \spi_sm_tmr2[0]\ : DFN1C0
      port map(D => N_6, CLK => clk_5m_gl, CLR => gb_spi_rst_b, Q
         => \spi_sm_tmr2[0]_net_1\);
    
    \i_spi_rx_word_maj_RNIACJJ[25]\ : MX2
      port map(A => \spi_rx_crc[1]\, B => 
        \rx_32bit_sreg[25]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNIACJJ[25]_net_1\);
    
    \i_spi_rx_word_maj_RNIOORN5[30]\ : NOR3B
      port map(A => \spi_rx_word[31]\, B => \spi_rx_word[30]\, C
         => \spi_timeout_pulse_i_1\, Y => bad_crc_0_sqmuxa);
    
    un1_clk_fcnt_I_28 : NOR2B
      port map(A => \DWACT_ADD_CI_0_g_array_1[0]\, B => 
        \clk_fcnt[2]_net_1\, Y => \DWACT_ADD_CI_0_g_array_12[0]\);
    
    \rx_32bit_sreg_tmr2[12]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIN8VR[12]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[12]_net_1\);
    
    \rx_32bit_sreg_tmr3[4]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIAT8E[4]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[4]_net_1\);
    
    \n_rx_32bit_sreg[29]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[28]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIMFUOM\, CLR => 
        \spi_clr_maj_RNIMFUOM_0\, Q => \n_rx_32bit_sreg_0[29]\);
    
    \i_spi_rx_word_tmr3[6]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIPLMK[6]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[6]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNIVI1S[25]\ : MX2
      port map(A => \rx_32bit_sreg[25]_net_1\, B => 
        \n_rx_32bit_sreg[25]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNIVI1S[25]_net_1\);
    
    \half_clk_fcnt_maj_RNI2GAI[3]\ : MX2
      port map(A => N_661, B => N_662, S => 
        \half_clk_fcnt[3]_net_1\, Y => N_663);
    
    \i_spi_rx_word_maj_RNI5SDI[4]\ : NOR2B
      port map(A => \spi_rx_word[4]\, B => \spi_rx_word[12]\, Y
         => \channels_to_be_on[5]\);
    
    \rx_32bit_sreg_tmr3[21]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNINA1S[21]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[21]_net_1\);
    
    \i_spi_rx_word[9]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNIVRMK[9]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[9]_net_1\);
    
    spi_clr_maj_RNIG0632_0 : NOR2A
      port map(A => \spi_clr\, B => \i42_mux_8\, Y => 
        \spi_clr_maj_RNIG0632_0\);
    
    \timeout_cnt_tmr2[10]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNISRFR2[10]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[10]_net_1\);
    
    \OUT_CHANNEL_IAUX_1[1]\ : NOR2B
      port map(A => ch_iaux_en_0, B => channel_involtage_ok(1), Y
         => OUT_CHANNEL_IAUX_c(1));
    
    \timeout_cnt_maj_RNIELVE[10]\ : OR2B
      port map(A => \timeout_cnt[10]_net_1\, B => 
        \timeout_cnt[9]_net_1\, Y => N_167);
    
    \rx_32bit_sreg_tmr3[11]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIL6VR[11]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[11]_net_1\);
    
    \P_TX_32BIT_REG_RNIEB5F[16]\ : MX2
      port map(A => \P_TX_32BIT_REG[16]_net_1\, B => 
        \P_TX_32BIT_REG[0]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_668);
    
    \P_TX_32BIT_REG[27]\ : DLN1
      port map(D => tx_crc(3), G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[27]_net_1\);
    
    spi_clr_maj_RNIC9792_0 : NOR2A
      port map(A => \spi_clr\, B => \i42_mux_9\, Y => 
        \spi_clr_maj_RNIC9792_0\);
    
    m99 : NOR2B
      port map(A => channels_desired_ready(4), B => N_91, Y => 
        \channels_ready[4]\);
    
    \n_rx_32bit_sreg_tmr2[17]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[16]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIA89C1\, CLR => 
        \spi_clr_maj_RNIA89C1_0\, Q => 
        \n_rx_32bit_sreg_tmr2[17]_net_1\);
    
    \rx_32bit_sreg[0]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI2L8E[0]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[0]\);
    
    \i_spi_rx_word_maj[18]\ : MAJ3
      port map(A => \i_spi_rx_word[18]_net_1\, B => 
        \i_spi_rx_word_tmr2[18]_net_1\, C => 
        \i_spi_rx_word_tmr3[18]_net_1\, Y => \spi_rx_word[18]\);
    
    spi_clr_maj_RNIA89C1 : NOR2B
      port map(A => \spi_tx_word[17]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIA89C1\);
    
    \n_rx_32bit_sreg_tmr3[11]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[10]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIGVKF1\, CLR => 
        \spi_clr_maj_RNIGVKF1_0\, Q => 
        \n_rx_32bit_sreg_tmr3[11]_net_1\);
    
    \spi_sm_maj[0]\ : MAJ3
      port map(A => \spi_sm[0]_net_1\, B => 
        \spi_sm_tmr2[0]_net_1\, C => \spi_sm_tmr3[0]_net_1\, Y
         => \spi_sm_1[0]\);
    
    \P_TX_32BIT_REG_RNIDB6F[20]\ : MX2
      port map(A => \P_TX_32BIT_REG[20]_net_1\, B => 
        \P_TX_32BIT_REG[4]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_665);
    
    \n_rx_32bit_sreg_maj_RNIL6VR[11]\ : MX2
      port map(A => \rx_32bit_sreg[11]_net_1\, B => 
        \n_rx_32bit_sreg[11]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNIL6VR[11]_net_1\);
    
    \i_spi_rx_word_tmr2[23]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI68JJ[23]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[23]_net_1\);
    
    \i_spi_rx_word[29]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIIKJJ[29]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[29]_net_1\);
    
    \debounce.3.un18_sw2_sw3_channel_on_bar\ : NOR3B
      port map(A => sw2_sw5_channel_on_b(3), B => 
        sw2_sw5_channel_on_a(3), C => SW2_SW3_CHANNEL_ON_BAR_c_0, 
        Y => un18_sw2_sw3_channel_on_bar);
    
    \timeout_cnt_maj_RNIEVQM[2]\ : XO1
      port map(A => \timeout_cnt[2]_net_1\, B => N_120, C => 
        N_304, Y => N_76);
    
    \rx_32bit_sreg_maj[26]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[26]\, B => 
        \rx_32bit_sreg_tmr2[26]_net_1\, C => 
        \rx_32bit_sreg_tmr3[26]_net_1\, Y => 
        \rx_32bit_sreg[26]_net_1\);
    
    \timeout_cnt_maj_RNIBLJV4[14]\ : OR3
      port map(A => \timeout_cnt[14]_net_1\, B => N_223, C => 
        N_219, Y => N_228);
    
    m4 : NOR3C
      port map(A => channel_involtage_ok(2), B => STATUS_LED_c, C
         => active_switch_constraints(3), Y => 
        \total_channel_constraints[3]\);
    
    \rx_32bit_sreg_maj[25]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[25]\, B => 
        \rx_32bit_sreg_tmr2[25]_net_1\, C => 
        \rx_32bit_sreg_tmr3[25]_net_1\, Y => 
        \rx_32bit_sreg[25]_net_1\);
    
    \P_TX_32BIT_REG_RNIP0I1[14]\ : NOR2B
      port map(A => \P_TX_32BIT_REG[14]_net_1\, B => 
        \half_clk_fcnt[4]_net_1\, Y => N_284);
    
    \rx_32bit_sreg_maj[9]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[9]\, B => 
        \rx_32bit_sreg_tmr2[9]_net_1\, C => 
        \rx_32bit_sreg_tmr3[9]_net_1\, Y => 
        \rx_32bit_sreg[9]_net_1\);
    
    \n_rx_32bit_sreg[7]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[6]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNI2IJO1\, CLR => \spi_clr_maj_RNI2IJO1_0\, 
        Q => \n_rx_32bit_sreg_0[7]\);
    
    \i_spi_rx_word_maj_RNID9MK[0]\ : MX2
      port map(A => \spi_rx_word[0]\, B => 
        \rx_32bit_sreg[0]_net_1\, S => \spi_sm_1[0]\, Y => 
        \i_spi_rx_word_maj_RNID9MK[0]_net_1\);
    
    \nullclk_cnt[3]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNIN2LA2[3]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \nullclk_cnt_0[3]\);
    
    \i_spi_rx_word_maj[13]\ : MAJ3
      port map(A => \i_spi_rx_word[13]_net_1\, B => 
        \i_spi_rx_word_tmr2[13]_net_1\, C => 
        \i_spi_rx_word_tmr3[13]_net_1\, Y => \spi_rx_word[13]\);
    
    \i_spi_rx_word_maj[8]\ : MAJ3
      port map(A => \i_spi_rx_word[8]_net_1\, B => 
        \i_spi_rx_word_tmr2[8]_net_1\, C => 
        \i_spi_rx_word_tmr3[8]_net_1\, Y => \spi_rx_word[8]\);
    
    \clk_fcnt[1]\ : DFN0C1
      port map(D => \half_clk_fcnt_maj_RNIV9BL[1]_net_1\, CLK => 
        GLB, CLR => \spi_clr\, Q => \clk_fcnt_0[1]\);
    
    \n_rx_32bit_sreg_tmr3[2]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[1]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIMFTI2\, CLR => \spi_clr_maj_RNIMFTI2_0\, 
        Q => \n_rx_32bit_sreg_tmr3[2]_net_1\);
    
    spi_clr_maj_RNIEI6G1_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[19]\, Y => 
        \spi_clr_maj_RNIEI6G1_0\);
    
    \clk_fcnt_maj[4]\ : MAJ3
      port map(A => \clk_fcnt_0[4]\, B => 
        \clk_fcnt_tmr2[4]_net_1\, C => \clk_fcnt_tmr3[4]_net_1\, 
        Y => \clk_fcnt[4]_net_1\);
    
    \half_clk_fcnt_tmr3[3]\ : DFN1C1
      port map(D => I_22, CLK => GLB, CLR => \spi_clr\, Q => 
        \half_clk_fcnt_tmr3[3]_net_1\);
    
    \clk_fcnt_maj_RNID64S[3]\ : NOR2
      port map(A => \clk_fcnt[3]_net_1\, B => \clk_fcnt[4]_net_1\, 
        Y => un2_clk_fcnt_1);
    
    m128 : NOR2A
      port map(A => \dutycycle_mode\, B => N_210_i, Y => 
        n_dtycyc_cnt_2_sqmuxa);
    
    spi_clr_maj_RNI02QU2_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[0]\, Y => 
        \spi_clr_maj_RNI02QU2_0\);
    
    \timeout_cnt_maj_RNI23C11[2]\ : MX2A
      port map(A => N_76, B => \timeout_cnt[2]_net_1\, S => N_530, 
        Y => \timeout_cnt_maj_RNI23C11[2]_net_1\);
    
    m31_0 : NOR2A
      port map(A => J11_DEBUG_c_c(5), B => master_rst_b, Y => 
        un1_sw5_default_turnon_bar_1_0);
    
    \i_spi_rx_word_maj_RNIA33O[16]\ : XOR3
      port map(A => \spi_rx_word[9]\, B => \spi_rx_word[16]\, C
         => \spi_rx_word[14]\, Y => un4_spi_rx_command_2_2);
    
    \i_spi_rx_word_maj_RNIJFMK[3]\ : MX2
      port map(A => \spi_rx_word[3]\, B => 
        \rx_32bit_sreg[3]_net_1\, S => \spi_sm_1[0]\, Y => 
        \i_spi_rx_word_maj_RNIJFMK[3]_net_1\);
    
    \i_spi_rx_word_tmr3[8]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNITPMK[8]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[8]_net_1\);
    
    \half_clk_fcnt[4]\ : DFN1C1
      port map(D => I_21, CLK => GLB, CLR => \spi_clr\, Q => 
        \half_clk_fcnt_0[4]\);
    
    \i_spi_rx_word_tmr2[16]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIAAHJ[16]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[16]_net_1\);
    
    spi_clr : DFN1P0
      port map(D => \spi_sm_maj_RNIMFV51[4]_net_1\, CLK => 
        clk_5m_gl, PRE => gb_spi_rst_b, Q => spi_clr_1);
    
    spi_clr_maj_RNI5CPP1_0 : NOR2A
      port map(A => \spi_clr\, B => \i42_mux_2\, Y => 
        \spi_clr_maj_RNI5CPP1_0\);
    
    \spi_sm_tmr2[1]\ : DFN1C0
      port map(D => N_88, CLK => clk_5m_gl, CLR => gb_spi_rst_b, 
        Q => \spi_sm_tmr2[1]_net_1\);
    
    \timeout_cnt_maj_RNIFSNG[9]\ : NOR3A
      port map(A => \timeout_cnt[9]_net_1\, B => N_304, C => 
        \timeout_cnt[14]_net_1\, Y => timeout_cnt_n14_i_i_a2_0_0);
    
    \rx_32bit_sreg_maj[19]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[19]\, B => 
        \rx_32bit_sreg_tmr2[19]_net_1\, C => 
        \rx_32bit_sreg_tmr3[19]_net_1\, Y => 
        \rx_32bit_sreg[19]_net_1\);
    
    m37 : NOR2B
      port map(A => active_switch_constraints(7), B => 
        spi_rx_command_reg(0), Y => i43_mux_2);
    
    \n_rx_32bit_sreg[19]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[18]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIEI6G1\, CLR => 
        \spi_clr_maj_RNIEI6G1_0\, Q => \n_rx_32bit_sreg_0[19]\);
    
    \nullclk_cnt_tmr3[4]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNI47BI2[4]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \nullclk_cnt_tmr3[4]_net_1\);
    
    spi_clr_maj_RNI95ML1_0 : NOR2A
      port map(A => \spi_clr\, B => spi_tx_word_8, Y => 
        \spi_clr_maj_RNI95ML1_0\);
    
    \i_spi_rx_word_maj_RNIR4H03[22]\ : XOR3
      port map(A => un4_spi_rx_command_3_0, B => N_34, C => 
        un4_spi_rx_command_3_6, Y => un4_spi_rx_command_3_8);
    
    \timeout_cnt_maj_RNIU9J04[9]\ : MX2
      port map(A => timeout_cnt_n14_i_i_a2_0_0, B => 
        timeout_cnt_n14_i_i_a2_0, S => N_181, Y => N_34_0);
    
    \OUT_CHANNEL_IAUX_1[6]\ : OA1A
      port map(A => SW4_SLAVE_PAIRS_BAR_c(3), B => ch_out1_1(1), 
        C => channel_involtage_ok(3), Y => OUT_CHANNEL_IAUX_c(6));
    
    \clk_fcnt_tmr2[0]\ : DFN0C1
      port map(D => \half_clk_fcnt_maj_RNIT7BL[0]_net_1\, CLK => 
        GLB, CLR => \spi_clr\, Q => \clk_fcnt_tmr2[0]_net_1\);
    
    \rx_32bit_sreg_tmr2[22]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIPC1S[22]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[22]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[10]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[9]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIETKF1\, CLR => \spi_clr_maj_RNIETKF1_0\, 
        Q => \n_rx_32bit_sreg_tmr2[10]_net_1\);
    
    \i_spi_rx_word_maj_RNIDRR41[19]\ : XOR3
      port map(A => \spi_rx_word[19]\, B => \spi_rx_word[1]\, C
         => un4_spi_rx_command_0_3, Y => un4_spi_rx_command_0_5);
    
    \rx_32bit_sreg_tmr3[8]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNII59E[8]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[8]_net_1\);
    
    \half_clk_fcnt_maj_RNIRDC1[0]\ : NOR2A
      port map(A => \half_clk_fcnt[0]_net_1\, B => 
        \half_clk_fcnt[1]_net_1\, Y => N_215_3);
    
    \timeout_cnt_tmr2[8]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI5UIB2[8]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[8]_net_1\);
    
    m123 : NOR3B
      port map(A => \N_79\, B => channels_desired_on(6), C => 
        \N_63_0\, Y => \spi_tx_word[5]\);
    
    \timeout_cnt_maj_RNIR22E[3]\ : OR2
      port map(A => \timeout_cnt[3]_net_1\, B => 
        \timeout_cnt[4]_net_1\, Y => SPI_TIMEOUT_PULSE_i_0_o2_1_0);
    
    \half_clk_fcnt_tmr3[0]\ : DFN1C1
      port map(D => \DWACT_ADD_CI_0_partial_sum[0]\, CLK => GLB, 
        CLR => \spi_clr\, Q => \half_clk_fcnt_tmr3[0]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[23]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[22]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIL0RI1\, CLR => 
        \spi_clr_maj_RNIL0RI1_0\, Q => 
        \n_rx_32bit_sreg_tmr3[23]_net_1\);
    
    \clk_fcnt_tmr3[4]\ : DFN0C1
      port map(D => \clk_fcnt_maj_RNI5GBL[4]_net_1\, CLK => GLB, 
        CLR => \spi_clr\, Q => \clk_fcnt_tmr3[4]_net_1\);
    
    spi_clr_maj_RNIETKF1_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[10]\, Y => 
        \spi_clr_maj_RNIETKF1_0\);
    
    \i_spi_rx_word_tmr2[28]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIGIJJ[28]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[28]_net_1\);
    
    m83 : MX2
      port map(A => \channels_ready[6]\, B => i43_mux_20, S => 
        \N_63_0\, Y => \i42_mux_9\);
    
    \i_spi_rx_word_maj_RNISPO92[23]\ : XOR3
      port map(A => N_32, B => N_29, C => un4_spi_rx_command_4_2, 
        Y => un4_spi_rx_command_4_5);
    
    \rx_32bit_sreg[16]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIVGVR[16]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[16]\);
    
    \i_spi_rx_word_maj_RNIPUFD[11]\ : MX2C
      port map(A => \spi_rx_word[10]\, B => \spi_rx_word[11]\, S
         => J11_DEBUG_c_c(1), Y => N_28);
    
    spi_clr_maj_RNIL0RI1 : NOR2B
      port map(A => \i42_mux\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIL0RI1\);
    
    i_spi_miso_tmr2 : DFN0C1
      port map(D => \i_spi_miso_maj_RNILQNM5\, CLK => GLB, CLR
         => \spi_sm[2]_net_1\, Q => \i_spi_miso_tmr2\);
    
    \nullclk_cnt_maj_RNIESSB1[0]\ : AXOI7
      port map(A => N_186, B => N_63, C => \nullclk_cnt[0]_net_1\, 
        Y => \nullclk_cnt_maj_RNIESSB1[0]_net_1\);
    
    \timeout_cnt_maj_RNIET3S[3]\ : OR2A
      port map(A => \timeout_cnt[3]_net_1\, B => N_121, Y => 
        N_122);
    
    \half_clk_fcnt_tmr3[5]\ : DFN1P1
      port map(D => \half_clk_fcnt_4[5]\, CLK => GLB, PRE => 
        \spi_clr\, Q => \half_clk_fcnt_tmr3[5]_net_1\);
    
    \nullclk_cnt[4]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNI47BI2[4]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \nullclk_cnt_0[4]\);
    
    \i_spi_rx_word_maj[30]\ : MAJ3
      port map(A => \i_spi_rx_word[30]_net_1\, B => 
        \i_spi_rx_word_tmr2[30]_net_1\, C => 
        \i_spi_rx_word_tmr3[30]_net_1\, Y => \spi_rx_word[30]\);
    
    \i_spi_rx_word_tmr2[19]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIGGHJ[19]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[19]_net_1\);
    
    \i_spi_rx_word_maj_RNID5IR1[8]\ : XOR3
      port map(A => un4_spi_rx_command_4_0, B => \spi_rx_word[8]\, 
        C => un4_spi_rx_command_4_3, Y => un4_spi_rx_command_4_6);
    
    \i_spi_rx_word_maj_RNI39GD[15]\ : MX2C
      port map(A => \spi_rx_word[14]\, B => \spi_rx_word[15]\, S
         => SW4_SLAVE_PAIRS_BAR_c(4), Y => N_132);
    
    \P_TX_32BIT_REG[9]\ : DLN1
      port map(D => \spi_tx_word[9]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[9]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[28]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[27]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIN9UQQ\, CLR => 
        \spi_clr_maj_RNIN9UQQ_0\, Q => 
        \n_rx_32bit_sreg_tmr2[28]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNIRE1S[23]\ : MX2
      port map(A => \rx_32bit_sreg[23]_net_1\, B => 
        \n_rx_32bit_sreg[23]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNIRE1S[23]_net_1\);
    
    \sw2_sw5_channel_on_a_21\ : MX2B
      port map(A => sw2_sw5_channel_on_a(7), B => 
        SW2_SW3_CHANNEL_ON_BAR_c_4, S => N_210_i, Y => 
        sw2_sw5_channel_on_a_21);
    
    \timeout_cnt_maj_RNI2NH42[7]\ : MX2A
      port map(A => N_61, B => \timeout_cnt[7]_net_1\, S => N_530, 
        Y => \timeout_cnt_maj_RNI2NH42[7]_net_1\);
    
    \half_clk_fcnt_maj_RNIQPEH[3]\ : MX2
      port map(A => N_284, B => N_660, S => 
        \half_clk_fcnt[3]_net_1\, Y => N_286);
    
    \i_spi_rx_word_tmr2[15]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIPJVI[15]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[15]_net_1\);
    
    \spi_sm_tmr3[0]\ : DFN1C0
      port map(D => N_6, CLK => clk_5m_gl, CLR => gb_spi_rst_b, Q
         => \spi_sm_tmr3[0]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNI2L8E[0]\ : MX2
      port map(A => \rx_32bit_sreg[0]_net_1\, B => 
        \n_rx_32bit_sreg[0]_net_1\, S => clk_fcnt_en_1, Y => 
        \n_rx_32bit_sreg_maj_RNI2L8E[0]_net_1\);
    
    \rx_32bit_sreg_maj_RNIJDVI[12]\ : MX2
      port map(A => \spi_rx_word[12]\, B => 
        \rx_32bit_sreg[12]_net_1\, S => \spi_sm_1[0]\, Y => 
        \rx_32bit_sreg_maj_RNIJDVI[12]_net_1\);
    
    \n_rx_32bit_sreg_maj[27]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[27]\, B => 
        \n_rx_32bit_sreg_tmr2[27]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[27]_net_1\, Y => 
        \n_rx_32bit_sreg[27]_net_1\);
    
    \i_spi_rx_word_maj_RNIF8MHU_0[30]\ : AOI1B
      port map(A => un4_spi_rx_command_NE, B => 
        SW5_IGNORE_CRC_BAR_c, C => bad_crc_0_sqmuxa, Y => 
        bad_crc_0_sqmuxa_1);
    
    \rx_32bit_sreg_maj_RNITPMK[8]\ : MX2
      port map(A => \spi_rx_word[8]\, B => 
        \rx_32bit_sreg[8]_net_1\, S => \spi_sm_1[0]\, Y => 
        \rx_32bit_sreg_maj_RNITPMK[8]_net_1\);
    
    \rx_32bit_sreg_maj[31]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[31]\, B => 
        \rx_32bit_sreg_tmr2[31]_net_1\, C => 
        \rx_32bit_sreg_tmr3[31]_net_1\, Y => 
        \rx_32bit_sreg[31]_net_1\);
    
    m94 : AO1B
      port map(A => N_167_0, B => N_20_0, C => \dutycycle_mode\, 
        Y => un2_dutycycle_mode_1);
    
    \dtycyc_cnt_37\ : MX2A
      port map(A => N_293, B => dtycyc_cnt(1), S => 
        n_dtycyc_cnt_2_sqmuxa, Y => dtycyc_cnt_37);
    
    spi_clr_maj_RNICT7M1_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[18]\, Y => 
        \spi_clr_maj_RNICT7M1_0\);
    
    \rx_32bit_sreg_maj[17]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[17]\, B => 
        \rx_32bit_sreg_tmr2[17]_net_1\, C => 
        \rx_32bit_sreg_tmr3[17]_net_1\, Y => 
        \rx_32bit_sreg[17]_net_1\);
    
    \sw2_sw5_channel_on_b_29\ : MX2
      port map(A => sw2_sw5_channel_on_b(7), B => 
        sw2_sw5_channel_on_a(7), S => N_210_i, Y => 
        sw2_sw5_channel_on_b_29);
    
    \sw2_sw5_channel_on_b_27\ : MX2
      port map(A => sw2_sw5_channel_on_b(5), B => 
        sw2_sw5_channel_on_a(5), S => N_210_i, Y => 
        sw2_sw5_channel_on_b_27);
    
    \rx_32bit_sreg_maj[6]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[6]\, B => 
        \rx_32bit_sreg_tmr2[6]_net_1\, C => 
        \rx_32bit_sreg_tmr3[6]_net_1\, Y => 
        \rx_32bit_sreg[6]_net_1\);
    
    \timeout_cnt_maj_RNICLM9[14]\ : NOR2A
      port map(A => \timeout_cnt[14]_net_1\, B => N_304, Y => 
        timeout_cnt_n14_i_i_a2_0);
    
    \i_spi_rx_word_maj[20]\ : MAJ3
      port map(A => \i_spi_rx_word[20]_net_1\, B => 
        \i_spi_rx_word_tmr2[20]_net_1\, C => 
        \i_spi_rx_word_tmr3[20]_net_1\, Y => \spi_rx_word[20]\);
    
    \i_spi_rx_word_tmr2[11]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIHBVI[11]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[11]_net_1\);
    
    \clk_fcnt_2c_tmr2[0]\ : DFN1C0
      port map(D => \clk_fcnt_1c[0]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_tmr2[0]_net_1\);
    
    \spi_sm_maj_RNIJPN5[1]\ : NOR3
      port map(A => \spi_sm_1[0]\, B => \spi_sm[1]_net_1\, C => 
        \spi_sm[2]_net_1\, Y => N_218);
    
    \n_rx_32bit_sreg_tmr3[19]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[18]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIEI6G1\, CLR => 
        \spi_clr_maj_RNIEI6G1_0\, Q => 
        \n_rx_32bit_sreg_tmr3[19]_net_1\);
    
    GND_i : GND
      port map(Y => spi_slave_GND);
    
    \half_clk_fcnt_maj_RNI6N0G5[5]\ : NOR2A
      port map(A => i_spi_miso_2, B => \half_clk_fcnt[5]_net_1\, 
        Y => i_spi_miso_4);
    
    \nullclk_cnt_tmr2[2]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNIBVU22[2]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \nullclk_cnt_tmr2[2]_net_1\);
    
    \rx_32bit_sreg_tmr2[4]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIAT8E[4]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[4]_net_1\);
    
    \rx_32bit_sreg[17]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI1JVR[17]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[17]\);
    
    \i_spi_rx_word_maj_RNI5PM301[3]\ : MX2B
      port map(A => channels_desired_on(4), B => N_37, S => 
        bad_crc_0_sqmuxa_1, Y => i_spi_rx_word_maj_RNI5PM301_0);
    
    \nullclk_cnt_maj_RNIR02N[2]\ : OR2A
      port map(A => \nullclk_cnt[2]_net_1\, B => N_174, Y => 
        N_176);
    
    \timeout_cnt_tmr3[3]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI05D81[3]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[3]_net_1\);
    
    \clk_fcnt_maj[2]\ : MAJ3
      port map(A => \clk_fcnt_0[2]\, B => 
        \clk_fcnt_tmr2[2]_net_1\, C => \clk_fcnt_tmr3[2]_net_1\, 
        Y => \clk_fcnt[2]_net_1\);
    
    un1_clk_fcnt_I_29 : NOR2B
      port map(A => \DWACT_ADD_CI_0_g_array_2[0]\, B => 
        \clk_fcnt[4]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    un1_clk_fcnt_I_17 : XOR2
      port map(A => \clk_fcnt[0]_net_1\, B => un2_clk_fcnt_en, Y
         => \DWACT_ADD_CI_0_partial_sum[0]\);
    
    \sw2_sw5_channel_on_b_30\ : MX2
      port map(A => sw2_sw5_channel_on_b(8), B => 
        sw2_sw5_channel_on_a(8), S => N_210_i, Y => 
        sw2_sw5_channel_on_b_30);
    
    \i_spi_rx_word_maj_RNI68BI2[7]\ : XOR3
      port map(A => N_31, B => N_33, C => un4_spi_rx_command_2_4, 
        Y => un4_spi_rx_command_2_8);
    
    \i_spi_rx_word_tmr3[14]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNINHVI[14]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[14]_net_1\);
    
    \spi_sm_tmr3[2]\ : DFN1C0
      port map(D => \spi_sm_maj_RNIMQL7[2]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \spi_sm_tmr3[2]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[7]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[6]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNI2IJO1\, CLR => \spi_clr_maj_RNI2IJO1_0\, 
        Q => \n_rx_32bit_sreg_tmr2[7]_net_1\);
    
    \i_spi_rx_word_maj_RNI5SDI[16]\ : XOR2
      port map(A => \spi_rx_word[0]\, B => \spi_rx_word[16]\, Y
         => un4_spi_rx_command_5_3);
    
    \rx_32bit_sreg_tmr3[23]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIRE1S[23]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[23]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNIK79E[9]\ : MX2
      port map(A => \rx_32bit_sreg[9]_net_1\, B => 
        \n_rx_32bit_sreg[9]_net_1\, S => clk_fcnt_en_1, Y => 
        \n_rx_32bit_sreg_maj_RNIK79E[9]_net_1\);
    
    m27 : XA1B
      port map(A => dtycyc_cnt(0), B => dtycyc_cnt(1), C => 
        un2_dutycycle_mode_1, Y => N_293);
    
    \timeout_cnt_maj_RNIHS2L[2]\ : OR2A
      port map(A => \timeout_cnt[2]_net_1\, B => N_120, Y => 
        N_121);
    
    \i_spi_rx_word_maj[11]\ : MAJ3
      port map(A => \i_spi_rx_word[11]_net_1\, B => 
        \i_spi_rx_word_tmr2[11]_net_1\, C => 
        \i_spi_rx_word_tmr3[11]_net_1\, Y => \spi_rx_word[11]\);
    
    \n_rx_32bit_sreg_tmr3[1]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[0]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIIFHQ2\, CLR => \spi_clr_maj_RNIIFHQ2_0\, 
        Q => \n_rx_32bit_sreg_tmr3[1]_net_1\);
    
    \i_spi_rx_word[30]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI26LJ[30]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[30]_net_1\);
    
    \rx_32bit_sreg_tmr3[13]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIPAVR[13]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[13]_net_1\);
    
    \timeout_cnt_tmr3[5]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNIVBFM1[5]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[5]_net_1\);
    
    \spi_sm_maj[5]\ : MAJ3
      port map(A => \spi_sm_0[5]\, B => \spi_sm_tmr2[5]_net_1\, C
         => \spi_sm_tmr3[5]_net_1\, Y => \spi_sm[5]_net_1\);
    
    \rx_32bit_sreg[26]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI1L1S[26]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[26]\);
    
    m65 : MX2
      port map(A => N_64, B => N_65, S => 
        active_switch_constraints(1), Y => \spi_tx_word[16]\);
    
    \i_spi_rx_word_maj_RNIHBVI[11]\ : MX2
      port map(A => \spi_rx_word[11]\, B => 
        \rx_32bit_sreg[11]_net_1\, S => \spi_sm_1[0]\, Y => 
        \i_spi_rx_word_maj_RNIHBVI[11]_net_1\);
    
    spi_clr_maj_RNIJTU1 : CLKINT
      port map(A => spi_clr_0, Y => \spi_clr\);
    
    \n_rx_32bit_sreg_tmr2[21]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[20]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIRC3M1\, CLR => 
        \spi_clr_maj_RNIRC3M1_0\, Q => 
        \n_rx_32bit_sreg_tmr2[21]_net_1\);
    
    \clk_fcnt_1c[5]\ : DFN1C0
      port map(D => \clk_fcnt[5]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_0[5]\);
    
    i_spi_rx_strb : DFN1C0
      port map(D => \spi_sm_1[0]\, CLK => clk_5m_gl, CLR => 
        gb_spi_rst_b, Q => i_spi_rx_strb_0);
    
    \n_rx_32bit_sreg_maj[25]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[25]\, B => 
        \n_rx_32bit_sreg_tmr2[25]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[25]_net_1\, Y => 
        \n_rx_32bit_sreg[25]_net_1\);
    
    \nullclk_cnt_maj_RNIN2LA2[3]\ : MX2A
      port map(A => N_19, B => \nullclk_cnt[3]_net_1\, S => N_63, 
        Y => \nullclk_cnt_maj_RNIN2LA2[3]_net_1\);
    
    spi_clk_2c : DFN1C0
      port map(D => \spi_clk_1c\, CLK => clk_5m_gl, CLR => 
        gb_spi_rst_b, Q => spi_clk_2c_0);
    
    \nullclk_cnt_tmr2[0]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNIESSB1[0]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \nullclk_cnt_tmr2[0]_net_1\);
    
    m68 : NOR2B
      port map(A => channels_desired_ready(8), B => N_68_0, Y => 
        \channels_ready[8]\);
    
    \spi_sm_maj_RNIO3G3[1]\ : NOR2
      port map(A => \spi_sm[1]_net_1\, B => N_304, Y => N_530);
    
    \clk_fcnt_1c_tmr2[0]\ : DFN1C0
      port map(D => \clk_fcnt[0]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_tmr2[0]_net_1\);
    
    \rx_32bit_sreg[4]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIAT8E[4]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[4]\);
    
    \i_spi_rx_word_maj_RNI8J8TU[10]\ : MX2
      port map(A => channels_desired_ready(3), B => 
        \spi_rx_word[10]\, S => bad_crc_0_sqmuxa_1, Y => 
        i_spi_rx_word_maj_RNI8J8TU_0);
    
    \clk_fcnt_1c_tmr3[1]\ : DFN1C0
      port map(D => \clk_fcnt[1]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_tmr3[1]_net_1\);
    
    \timeout_cnt_maj[12]\ : MAJ3
      port map(A => \timeout_cnt_0[12]\, B => 
        \timeout_cnt_tmr2[12]_net_1\, C => 
        \timeout_cnt_tmr3[12]_net_1\, Y => 
        \timeout_cnt[12]_net_1\);
    
    \n_rx_32bit_sreg_maj[7]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[7]\, B => 
        \n_rx_32bit_sreg_tmr2[7]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[7]_net_1\, Y => 
        \n_rx_32bit_sreg[7]_net_1\);
    
    \rx_32bit_sreg_maj[28]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[28]\, B => 
        \rx_32bit_sreg_tmr2[28]_net_1\, C => 
        \rx_32bit_sreg_tmr3[28]_net_1\, Y => 
        \rx_32bit_sreg[28]_net_1\);
    
    \OUT_CHANNEL_IAUX_1[3]\ : NOR2B
      port map(A => ch_iaux_en_2, B => channel_involtage_ok(2), Y
         => OUT_CHANNEL_IAUX_c(3));
    
    \n_rx_32bit_sreg_maj[12]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[12]\, B => 
        \n_rx_32bit_sreg_tmr2[12]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[12]_net_1\, Y => 
        \n_rx_32bit_sreg[12]_net_1\);
    
    \timeout_cnt_tmr3[8]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI5UIB2[8]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[8]_net_1\);
    
    \i_spi_rx_word_maj[28]\ : MAJ3
      port map(A => \i_spi_rx_word[28]_net_1\, B => 
        \i_spi_rx_word_tmr2[28]_net_1\, C => 
        \i_spi_rx_word_tmr3[28]_net_1\, Y => \spi_rx_crc[4]\);
    
    \n_rx_32bit_sreg_tmr2[18]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[17]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNICT7M1\, CLR => 
        \spi_clr_maj_RNICT7M1_0\, Q => 
        \n_rx_32bit_sreg_tmr2[18]_net_1\);
    
    \timeout_cnt_tmr3[13]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI6GBJ3[13]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[13]_net_1\);
    
    spi_clr_maj_RNI0CAQ1 : NOR2B
      port map(A => \i42_mux_0\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNI0CAQ1\);
    
    \rx_32bit_sreg[18]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI3LVR[18]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[18]\);
    
    un1_clk_fcnt_I_21 : XOR2
      port map(A => \clk_fcnt[4]_net_1\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, Y => I_21);
    
    spi_clr_maj_RNIMFUOM : NOR2B
      port map(A => tx_crc(5), B => \spi_clr\, Y => 
        \spi_clr_maj_RNIMFUOM\);
    
    \OUT_CHANNEL_IAUX_1[4]\ : OA1A
      port map(A => J11_DEBUG_c_c(1), B => ch_out1_0(1), C => 
        channel_involtage_ok(2), Y => OUT_CHANNEL_IAUX_c(4));
    
    \debounce.7.un46_sw2_sw3_channel_on_bar\ : NOR3B
      port map(A => sw2_sw5_channel_on_b(7), B => 
        sw2_sw5_channel_on_a(7), C => SW2_SW3_CHANNEL_ON_BAR_c_4, 
        Y => un46_sw2_sw3_channel_on_bar);
    
    \spi_sm_maj_RNI6MB15[1]\ : NOR2B
      port map(A => N_228, B => \spi_sm[1]_net_1\, Y => N_6);
    
    \i_spi_rx_word_maj_RNILCAL1[1]\ : MX2C
      port map(A => \channels_to_be_on[1]\, B => N_38, S => 
        J11_DEBUG_c_c(0), Y => N_39);
    
    \clk_fcnt_maj_RNI704S[0]\ : NOR2
      port map(A => \clk_fcnt[0]_net_1\, B => \clk_fcnt[1]_net_1\, 
        Y => un2_clk_fcnt_2);
    
    \i_spi_rx_word_tmr2[31]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNI48LJ[31]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[31]_net_1\);
    
    spi_clr_maj_RNIRECDT : NOR2B
      port map(A => tx_crc(2), B => \spi_clr\, Y => 
        \spi_clr_maj_RNIRECDT\);
    
    \clk_fcnt_1c_tmr2[3]\ : DFN1C0
      port map(D => \clk_fcnt[3]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_tmr2[3]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNI4N8E[1]\ : MX2
      port map(A => \rx_32bit_sreg[1]_net_1\, B => 
        \n_rx_32bit_sreg[1]_net_1\, S => clk_fcnt_en_1, Y => 
        \n_rx_32bit_sreg_maj_RNI4N8E[1]_net_1\);
    
    \rx_32bit_sreg_maj[0]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[0]\, B => 
        \rx_32bit_sreg_tmr2[0]_net_1\, C => 
        \rx_32bit_sreg_tmr3[0]_net_1\, Y => 
        \rx_32bit_sreg[0]_net_1\);
    
    \rx_32bit_sreg[13]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIPAVR[13]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[13]\);
    
    \i_spi_rx_word_maj[2]\ : MAJ3
      port map(A => \i_spi_rx_word[2]_net_1\, B => 
        \i_spi_rx_word_tmr2[2]_net_1\, C => 
        \i_spi_rx_word_tmr3[2]_net_1\, Y => \spi_rx_word[2]\);
    
    \clk_fcnt_maj[1]\ : MAJ3
      port map(A => \clk_fcnt_0[1]\, B => 
        \clk_fcnt_tmr2[1]_net_1\, C => \clk_fcnt_tmr3[1]_net_1\, 
        Y => \clk_fcnt[1]_net_1\);
    
    \clk_fcnt_2c[2]\ : DFN1C0
      port map(D => \clk_fcnt_1c[2]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_0[2]\);
    
    \rx_32bit_sreg[6]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIE19E[6]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[6]\);
    
    m32 : NOR2B
      port map(A => active_switch_constraints(8), B => 
        spi_rx_command_reg(0), Y => i43_mux_0);
    
    spi_clr_maj_RNI2IJO1_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[7]\, Y => 
        \spi_clr_maj_RNI2IJO1_0\);
    
    \i_spi_rx_word_maj_RNIUNH73[16]\ : XOR3
      port map(A => un4_spi_rx_command_5_3, B => 
        un4_spi_rx_command_5_2, C => un4_spi_rx_command_5_4, Y
         => un4_spi_rx_command_5);
    
    \rx_32bit_sreg[27]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI3N1S[27]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[27]\);
    
    \i_spi_rx_word_maj[23]\ : MAJ3
      port map(A => \i_spi_rx_word[23]_net_1\, B => 
        \i_spi_rx_word_tmr2[23]_net_1\, C => 
        \i_spi_rx_word_tmr3[23]_net_1\, Y => \spi_rx_word[23]\);
    
    m47 : MX2
      port map(A => \dutycycle_mode\, B => i43_mux_6, S => 
        \N_63_0\, Y => \i42_mux_2\);
    
    \timeout_cnt_maj_RNI5UIB2[8]\ : MX2A
      port map(A => N_671, B => \timeout_cnt[8]_net_1\, S => 
        N_530, Y => \timeout_cnt_maj_RNI5UIB2[8]_net_1\);
    
    \timeout_cnt_tmr2[2]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI23C11[2]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[2]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNINC3S[30]\ : MX2
      port map(A => \rx_32bit_sreg[30]_net_1\, B => 
        \n_rx_32bit_sreg[30]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNINC3S[30]_net_1\);
    
    \sw2_sw5_channel_on_b_26\ : MX2
      port map(A => sw2_sw5_channel_on_b(4), B => 
        sw2_sw5_channel_on_a(4), S => N_210_i, Y => 
        sw2_sw5_channel_on_b_26);
    
    \timeout_cnt[6]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNIBNNE3[6]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[6]\);
    
    \i_spi_rx_word_maj_RNIMFDMO[13]\ : OR3
      port map(A => un4_spi_rx_command_NE_1, B => 
        un4_spi_rx_command_NE_0, C => un4_spi_rx_command_NE_2, Y
         => un4_spi_rx_command_NE);
    
    \n_rx_32bit_sreg_tmr2[1]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[0]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIIFHQ2\, CLR => \spi_clr_maj_RNIIFHQ2_0\, 
        Q => \n_rx_32bit_sreg_tmr2[1]_net_1\);
    
    \n_rx_32bit_sreg[24]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[23]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIB629M\, CLR => 
        \spi_clr_maj_RNIB629M_0\, Q => \n_rx_32bit_sreg_0[24]\);
    
    m19_0 : AOI1
      port map(A => channels_desired_on(1), B => 
        total_channel_constraints_0, C => spi_tx_word_sn_N_2, Y
         => N_304_0);
    
    \rx_32bit_sreg_tmr3[26]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI1L1S[26]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[26]_net_1\);
    
    \OUT_CHANNEL_IAUX_1[5]\ : NOR2B
      port map(A => ch_iaux_en_4, B => channel_involtage_ok(3), Y
         => OUT_CHANNEL_IAUX_c(5));
    
    m18 : NOR2A
      port map(A => N_18_0, B => dtycyc_cnt(2), Y => N_19_0);
    
    \i_spi_rx_word_maj_RNIVP2FV[4]\ : MX2
      port map(A => channels_desired_on(5), B => 
        \channels_to_be_on[5]\, S => bad_crc_0_sqmuxa_1, Y => 
        i_spi_rx_word_maj_RNIVP2FV_0);
    
    \i_spi_rx_word_maj_RNI9TKA1[22]\ : XOR3
      port map(A => \spi_rx_word[22]\, B => N_32, C => 
        un4_spi_rx_command_3_2, Y => un4_spi_rx_command_3_6);
    
    \half_clk_fcnt_maj_RNIJ82V[3]\ : MX2
      port map(A => N_667, B => N_668, S => 
        \half_clk_fcnt[3]_net_1\, Y => N_669);
    
    \i_spi_rx_word_maj_RNIAAHJ[16]\ : MX2
      port map(A => \spi_rx_word[16]\, B => 
        \rx_32bit_sreg[16]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNIAAHJ[16]_net_1\);
    
    \i_spi_rx_word_tmr3[31]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNI48LJ[31]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[31]_net_1\);
    
    \i_spi_rx_word_maj_RNIIU6V[13]\ : XOR2
      port map(A => \spi_rx_word[13]\, B => N_33, Y => 
        un4_spi_rx_command_3_4);
    
    spi_clr_maj_RNIGVKF1 : NOR2B
      port map(A => \spi_tx_word[11]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIGVKF1\);
    
    \nullclk_cnt_tmr3[2]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNIBVU22[2]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \nullclk_cnt_tmr3[2]_net_1\);
    
    \rx_32bit_sreg_tmr3[16]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIVGVR[16]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[16]_net_1\);
    
    \rx_32bit_sreg_maj[10]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[10]\, B => 
        \rx_32bit_sreg_tmr2[10]_net_1\, C => 
        \rx_32bit_sreg_tmr3[10]_net_1\, Y => 
        \rx_32bit_sreg[10]_net_1\);
    
    \rx_32bit_sreg_tmr2[11]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIL6VR[11]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[11]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[13]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[12]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIC9792\, CLR => 
        \spi_clr_maj_RNIC9792_0\, Q => 
        \n_rx_32bit_sreg_tmr3[13]_net_1\);
    
    \half_clk_fcnt[2]\ : DFN1C1
      port map(D => I_23, CLK => GLB, CLR => \spi_clr\, Q => 
        \half_clk_fcnt_0[2]\);
    
    spi_clr_maj_RNIETKF1 : NOR2B
      port map(A => \spi_tx_word[10]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIETKF1\);
    
    \P_TX_32BIT_REG_RNIKH5F[19]\ : MX2
      port map(A => \P_TX_32BIT_REG[19]_net_1\, B => 
        \P_TX_32BIT_REG[3]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_651);
    
    \P_TX_32BIT_REG_RNIGD5F[17]\ : MX2
      port map(A => \P_TX_32BIT_REG[17]_net_1\, B => 
        \P_TX_32BIT_REG[1]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_657);
    
    m79 : NOR2B
      port map(A => channels_desired_ready(6), B => \N_79\, Y => 
        \channels_ready[6]\);
    
    \half_clk_fcnt_maj_RNIB94I1[2]\ : MX2
      port map(A => N_655, B => N_658, S => 
        \half_clk_fcnt[2]_net_1\, Y => N_659);
    
    \i_spi_rx_word_tmr3[10]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNIF9VI[10]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[10]_net_1\);
    
    \half_clk_fcnt_maj_RNI3MC1[5]\ : NOR2
      port map(A => \half_clk_fcnt[4]_net_1\, B => 
        \half_clk_fcnt[5]_net_1\, Y => 
        \spi_sm_ns_i_a2_0_a2_0_4_1[3]\);
    
    \timeout_cnt_tmr3[7]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI2NH42[7]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[7]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[6]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[5]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNI0GJO1\, CLR => \spi_clr_maj_RNI0GJO1_0\, 
        Q => \n_rx_32bit_sreg_tmr3[6]_net_1\);
    
    \timeout_cnt_tmr3[12]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNINTCB3[12]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[12]_net_1\);
    
    \timeout_cnt_maj_RNI52BQ[1]\ : MX2A
      port map(A => N_78, B => \timeout_cnt[1]_net_1\, S => N_530, 
        Y => \timeout_cnt_maj_RNI52BQ[1]_net_1\);
    
    \spi_sm_tmr2[5]\ : DFN1P0
      port map(D => \spi_sm_0[0]\, CLK => clk_5m_gl, PRE => 
        gb_spi_rst_b, Q => \spi_sm_tmr2[5]_net_1\);
    
    \rx_32bit_sreg_tmr3[9]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIK79E[9]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[9]_net_1\);
    
    \timeout_cnt_maj_RNI6GBJ3[13]\ : MX2
      port map(A => N_31_1, B => \timeout_cnt[13]_net_1\, S => 
        N_530, Y => \timeout_cnt_maj_RNI6GBJ3[13]_net_1\);
    
    \nullclk_cnt_maj_RNIU32N[1]\ : NOR3
      port map(A => \nullclk_cnt[1]_net_1\, B => 
        \nullclk_cnt[3]_net_1\, C => \nullclk_cnt[2]_net_1\, Y
         => N_221);
    
    \i_spi_rx_word_maj_RNI24JJ[21]\ : MX2
      port map(A => \spi_rx_word[21]\, B => 
        \rx_32bit_sreg[21]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNI24JJ[21]_net_1\);
    
    \i_spi_rx_word_maj_RNICEJJ[26]\ : MX2
      port map(A => \spi_rx_crc[2]\, B => 
        \rx_32bit_sreg[26]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNICEJJ[26]_net_1\);
    
    \half_clk_fcnt_maj_RNITL54[0]\ : NOR3C
      port map(A => \spi_sm_ns_i_a2_0_a2_0_4_0[3]\, B => 
        \spi_sm_ns_i_a2_0_a2_0_4_1[3]\, C => N_215_3, Y => 
        \spi_sm_ns_i_a2_0_a2_0_0[3]\);
    
    \n_rx_32bit_sreg_tmr2[11]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[10]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIGVKF1\, CLR => 
        \spi_clr_maj_RNIGVKF1_0\, Q => 
        \n_rx_32bit_sreg_tmr2[11]_net_1\);
    
    \timeout_cnt[0]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNII1HA[0]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[0]\);
    
    \dtycyc_en_32\ : MX2
      port map(A => un2_dutycycle_mode_1, B => dtycyc_en, S => 
        n_dtycyc_cnt_2_sqmuxa, Y => dtycyc_en_32);
    
    \n_rx_32bit_sreg_tmr2[29]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[28]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIMFUOM\, CLR => 
        \spi_clr_maj_RNIMFUOM_0\, Q => 
        \n_rx_32bit_sreg_tmr2[29]_net_1\);
    
    \i_spi_rx_word_maj_RNI26LJ[30]\ : MX2
      port map(A => \spi_rx_word[30]\, B => 
        \rx_32bit_sreg[30]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNI26LJ[30]_net_1\);
    
    \rx_32bit_sreg[28]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI5P1S[28]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[28]\);
    
    \n_rx_32bit_sreg[9]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[8]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIB7ML1\, CLR => \spi_clr_maj_RNIB7ML1_0\, 
        Q => \n_rx_32bit_sreg_0[9]\);
    
    \i_spi_rx_word_maj_RNIL5271[5]\ : MX2C
      port map(A => \channels_to_be_on[5]\, B => N_140, S => 
        SW4_SLAVE_PAIRS_BAR_c(3), Y => N_141);
    
    \OUT_CHANNEL_MREG_1[5]\ : NOR2B
      port map(A => ch_mreg_en_4, B => channel_involtage_ok(3), Y
         => OUT_CHANNEL_MREG_c_4);
    
    \clk_fcnt_2c_maj_RNIK4GG[2]\ : NOR2
      port map(A => \clk_fcnt_2c[4]_net_1\, B => 
        \clk_fcnt_2c[2]_net_1\, Y => spi_sm_tr8_7_i_a2_4_0);
    
    \i_spi_rx_word_tmr3[5]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNINJMK[5]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[5]_net_1\);
    
    \rx_32bit_sreg[23]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIRE1S[23]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[23]\);
    
    \n_rx_32bit_sreg[27]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[26]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNITKFFR\, CLR => 
        \spi_clr_maj_RNITKFFR_0\, Q => \n_rx_32bit_sreg_0[27]\);
    
    \nullclk_cnt_tmr2[3]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNIN2LA2[3]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \nullclk_cnt_tmr2[3]_net_1\);
    
    \debounce.4.un25_sw2_sw3_channel_on_bar\ : NOR3B
      port map(A => sw2_sw5_channel_on_b(4), B => 
        sw2_sw5_channel_on_a(4), C => SW2_SW3_CHANNEL_ON_BAR_c_1, 
        Y => un25_sw2_sw3_channel_on_bar);
    
    \n_rx_32bit_sreg[14]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[13]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIG0632\, CLR => 
        \spi_clr_maj_RNIG0632_0\, Q => \n_rx_32bit_sreg_0[14]\);
    
    spi_clk_1c_tmr2 : DFN1C0
      port map(D => GLB, CLK => clk_5m_gl, CLR => gb_spi_rst_b, Q
         => \spi_clk_1c_tmr2\);
    
    spi_clr_maj_RNI0GJO1_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[6]\, Y => 
        \spi_clr_maj_RNI0GJO1_0\);
    
    \P_TX_32BIT_REG_RNI6TE2[13]\ : MX2
      port map(A => \P_TX_32BIT_REG[29]_net_1\, B => 
        \P_TX_32BIT_REG[13]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_653);
    
    \i_spi_rx_word_maj[31]\ : MAJ3
      port map(A => \i_spi_rx_word[31]_net_1\, B => 
        \i_spi_rx_word_tmr2[31]_net_1\, C => 
        \i_spi_rx_word_tmr3[31]_net_1\, Y => \spi_rx_word[31]\);
    
    \P_TX_32BIT_REG_RNI0NE2[10]\ : MX2
      port map(A => \P_TX_32BIT_REG[26]_net_1\, B => 
        \P_TX_32BIT_REG[10]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_661);
    
    \clk_fcnt_2c_maj_RNIPAGH1[0]\ : NOR3C
      port map(A => spi_sm_tr8_7_i_a2_4_0, B => 
        spi_sm_tr8_7_i_a2_4_1, C => N_203_3, Y => N_219);
    
    \spi_sm[1]\ : DFN1C0
      port map(D => N_88, CLK => clk_5m_gl, CLR => gb_spi_rst_b, 
        Q => \spi_sm_0[1]\);
    
    m119 : NOR3B
      port map(A => N_73, B => channels_desired_on(7), C => 
        \N_63_0\, Y => \spi_tx_word[6]\);
    
    spi_clr_maj_RNI95ML1 : NOR2B
      port map(A => spi_tx_word_8, B => \spi_clr\, Y => 
        \spi_clr_maj_RNI95ML1\);
    
    \rx_32bit_sreg_tmr2[30]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNINC3S[30]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[30]_net_1\);
    
    \clk_fcnt_2c_tmr3[1]\ : DFN1C0
      port map(D => \clk_fcnt_1c[1]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_tmr3[1]_net_1\);
    
    \rx_32bit_sreg[30]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNINC3S[30]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[30]\);
    
    clk_fcnt_en_maj_0 : MAJ3
      port map(A => \clk_fcnt_en\, B => \clk_fcnt_en_tmr2\, C => 
        \clk_fcnt_en_tmr3\, Y => clk_fcnt_en_0);
    
    \clk_fcnt_2c_tmr3[5]\ : DFN1C0
      port map(D => \clk_fcnt_1c[5]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_tmr3[5]_net_1\);
    
    \i_spi_rx_word_tmr3[12]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNIJDVI[12]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[12]_net_1\);
    
    spi_clk_2c_maj_RNI9KM01 : NOR2B
      port map(A => un1_spi_sm_7_i_0_a2_0, B => N_172, Y => N_186);
    
    spi_clr_maj_RNIB629M : NOR2B
      port map(A => tx_crc(0), B => \spi_clr\, Y => 
        \spi_clr_maj_RNIB629M\);
    
    \rx_32bit_sreg_tmr2[21]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNINA1S[21]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[21]_net_1\);
    
    \i_spi_rx_word[4]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNILHMK[4]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[4]_net_1\);
    
    \debounce.2.un11_sw2_sw3_channel_on_bar\ : NOR3B
      port map(A => sw2_sw5_channel_on_b(2), B => 
        sw2_sw5_channel_on_a(2), C => J11_DEBUG_c_c(2), Y => 
        un11_sw2_sw3_channel_on_bar);
    
    m8 : NOR2B
      port map(A => channels_desired_on(3), B => 
        \total_channel_constraints[3]\, Y => \channels_on[3]\);
    
    \timeout_cnt_maj_RNI502C4[14]\ : MX2
      port map(A => N_34_0, B => \timeout_cnt[14]_net_1\, S => 
        N_530, Y => \timeout_cnt_maj_RNI502C4[14]_net_1\);
    
    spi_clr_maj_RNIC9792 : NOR2B
      port map(A => \i42_mux_9\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIC9792\);
    
    \rx_32bit_sreg_tmr2[6]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIE19E[6]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[6]_net_1\);
    
    \rx_32bit_sreg_maj[23]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[23]\, B => 
        \rx_32bit_sreg_tmr2[23]_net_1\, C => 
        \rx_32bit_sreg_tmr3[23]_net_1\, Y => 
        \rx_32bit_sreg[23]_net_1\);
    
    \clk_fcnt[2]\ : DFN0C1
      port map(D => \half_clk_fcnt_maj_RNI1CBL[2]_net_1\, CLK => 
        GLB, CLR => \spi_clr\, Q => \clk_fcnt_0[2]\);
    
    \i_spi_rx_word_maj[21]\ : MAJ3
      port map(A => \i_spi_rx_word[21]_net_1\, B => 
        \i_spi_rx_word_tmr2[21]_net_1\, C => 
        \i_spi_rx_word_tmr3[21]_net_1\, Y => \spi_rx_word[21]\);
    
    \i_spi_rx_word_maj_RNIC1IV5[30]\ : MX2
      port map(A => \spi_rx_word[30]\, B => spi_rx_command_reg(0), 
        S => \spi_timeout_pulse_i_1\, Y => 
        i_spi_rx_word_maj_RNIC1IV5_0);
    
    \clk_fcnt_2c_maj_RNII2GG[1]\ : NOR2
      port map(A => \clk_fcnt_2c[1]_net_1\, B => 
        \clk_fcnt_2c[3]_net_1\, Y => spi_sm_tr8_7_i_a2_4_1);
    
    \i_spi_rx_word_maj[15]\ : MAJ3
      port map(A => \i_spi_rx_word[15]_net_1\, B => 
        \i_spi_rx_word_tmr2[15]_net_1\, C => 
        \i_spi_rx_word_tmr3[15]_net_1\, Y => \spi_rx_word[15]\);
    
    \n_rx_32bit_sreg_maj[28]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[28]\, B => 
        \n_rx_32bit_sreg_tmr2[28]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[28]_net_1\, Y => 
        \n_rx_32bit_sreg[28]_net_1\);
    
    \rx_32bit_sreg_tmr3[30]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNINC3S[30]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[30]_net_1\);
    
    \P_TX_32BIT_REG_RNIFD6F[21]\ : MX2
      port map(A => \P_TX_32BIT_REG[21]_net_1\, B => 
        \P_TX_32BIT_REG[5]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_654);
    
    \P_TX_32BIT_REG[4]\ : DLN1
      port map(D => \spi_tx_word[4]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[4]_net_1\);
    
    \OUT_CHANNEL_MREG_1[8]\ : OA1A
      port map(A => SW4_SLAVE_PAIRS_BAR_c(4), B => ch_out1_1(2), 
        C => channel_involtage_ok(4), Y => OUT_CHANNEL_MREG_c_7);
    
    \clk_fcnt_1c_tmr3[4]\ : DFN1C0
      port map(D => \clk_fcnt[4]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_tmr3[4]_net_1\);
    
    spi_clr_maj_RNIIFHQ2 : NOR2B
      port map(A => \SPI_TX_WORD_i_1[1]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIIFHQ2\);
    
    \n_rx_32bit_sreg_maj_RNIVGVR[16]\ : MX2
      port map(A => \rx_32bit_sreg[16]_net_1\, B => 
        \n_rx_32bit_sreg[16]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNIVGVR[16]_net_1\);
    
    \i_spi_rx_word_maj_RNILHMK[4]\ : MX2
      port map(A => \spi_rx_word[4]\, B => 
        \rx_32bit_sreg[4]_net_1\, S => \spi_sm_1[0]\, Y => 
        \i_spi_rx_word_maj_RNILHMK[4]_net_1\);
    
    \timeout_cnt_tmr2[5]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNIVBFM1[5]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[5]_net_1\);
    
    \timeout_cnt_maj[10]\ : MAJ3
      port map(A => \timeout_cnt_0[10]\, B => 
        \timeout_cnt_tmr2[10]_net_1\, C => 
        \timeout_cnt_tmr3[10]_net_1\, Y => 
        \timeout_cnt[10]_net_1\);
    
    \timeout_cnt[2]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI23C11[2]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[2]\);
    
    \i_spi_rx_word_tmr2[0]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNID9MK[0]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[0]_net_1\);
    
    \clk_fcnt_2c_tmr2[2]\ : DFN1C0
      port map(D => \clk_fcnt_1c[2]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_tmr2[2]_net_1\);
    
    \half_clk_fcnt_maj_RNI314I1[2]\ : MX2
      port map(A => N_666, B => N_669, S => 
        \half_clk_fcnt[2]_net_1\, Y => N_670);
    
    \timeout_cnt[8]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI5UIB2[8]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[8]\);
    
    \half_clk_fcnt_maj[4]\ : MAJ3
      port map(A => \half_clk_fcnt_0[4]\, B => 
        \half_clk_fcnt_tmr2[4]_net_1\, C => 
        \half_clk_fcnt_tmr3[4]_net_1\, Y => 
        \half_clk_fcnt[4]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[25]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[24]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIETQ6Q\, CLR => 
        \spi_clr_maj_RNIETQ6Q_0\, Q => 
        \n_rx_32bit_sreg_tmr3[25]_net_1\);
    
    \clk_fcnt_tmr3[3]\ : DFN0C1
      port map(D => \clk_fcnt_maj_RNI3EBL[3]_net_1\, CLK => GLB, 
        CLR => \spi_clr\, Q => \clk_fcnt_tmr3[3]_net_1\);
    
    \spi_sm_maj[4]\ : MAJ3
      port map(A => \spi_sm_0[4]\, B => \spi_sm_tmr2[4]_net_1\, C
         => \spi_sm_tmr3[4]_net_1\, Y => \spi_sm[4]_net_1\);
    
    \n_rx_32bit_sreg[17]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[16]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIA89C1\, CLR => 
        \spi_clr_maj_RNIA89C1_0\, Q => \n_rx_32bit_sreg_0[17]\);
    
    m61 : MX2A
      port map(A => channel_involtage_ok(2), B => i43_mux_12, S
         => \N_63_0\, Y => \spi_tx_word[17]\);
    
    m42 : MX2A
      port map(A => STATUS_LED_c, B => i43_mux_4, S => \N_63_0\, 
        Y => \spi_tx_word[21]\);
    
    \P_TX_32BIT_REG[1]\ : DLN1
      port map(D => \SPI_TX_WORD_i_1[1]\, G => \spi_sm[2]_net_1\, 
        Q => \P_TX_32BIT_REG[1]_net_1\);
    
    \P_TX_32BIT_REG[14]\ : DLN1
      port map(D => \i42_mux_8\, G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[14]_net_1\);
    
    \i_spi_rx_word[0]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNID9MK[0]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[0]_net_1\);
    
    \rx_32bit_sreg[5]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNICV8E[5]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[5]\);
    
    \nullclk_cnt_tmr2[1]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNI0T8R1[1]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \nullclk_cnt_tmr2[1]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[19]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[18]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIEI6G1\, CLR => 
        \spi_clr_maj_RNIEI6G1_0\, Q => 
        \n_rx_32bit_sreg_tmr2[19]_net_1\);
    
    \timeout_cnt_tmr3[11]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI9CE33[11]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[11]_net_1\);
    
    \timeout_cnt_tmr3[14]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI502C4[14]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[14]_net_1\);
    
    \timeout_cnt_maj_RNICB8O1[0]\ : OA1
      port map(A => N_220, B => SPI_TIMEOUT_PULSE_i_0_o2_1_0, C
         => SPI_TIMEOUT_PULSE_i_0_a2_2_1, Y => N_222);
    
    \n_rx_32bit_sreg_tmr3[8]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[7]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNI95ML1\, CLR => \spi_clr_maj_RNI95ML1_0\, 
        Q => \n_rx_32bit_sreg_tmr3[8]_net_1\);
    
    \clk_fcnt_1c[4]\ : DFN1C0
      port map(D => \clk_fcnt[4]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_0[4]\);
    
    \i_spi_rx_word_maj_RNILRCB[21]\ : XOR2
      port map(A => \spi_rx_word[21]\, B => \spi_rx_word[31]\, Y
         => un4_spi_rx_command_3_2);
    
    \timeout_cnt_maj_RNIBNNE3[6]\ : MX2A
      port map(A => N_68, B => \timeout_cnt[6]_net_1\, S => N_530, 
        Y => \timeout_cnt_maj_RNIBNNE3[6]_net_1\);
    
    \rx_32bit_sreg_tmr2[13]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIPAVR[13]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[13]_net_1\);
    
    spi_clr_maj_RNITPKU1 : NOR2B
      port map(A => \spi_tx_word[5]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNITPKU1\);
    
    spi_clk_2c_tmr3 : DFN1C0
      port map(D => \spi_clk_1c\, CLK => clk_5m_gl, CLR => 
        gb_spi_rst_b, Q => \spi_clk_2c_tmr3\);
    
    \n_rx_32bit_sreg_maj[6]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[6]\, B => 
        \n_rx_32bit_sreg_tmr2[6]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[6]_net_1\, Y => 
        \n_rx_32bit_sreg[6]_net_1\);
    
    \timeout_cnt_tmr3[10]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNISRFR2[10]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[10]_net_1\);
    
    \timeout_cnt_maj_RNI0RS73[13]\ : XA1C
      port map(A => \timeout_cnt[13]_net_1\, B => N_177, C => 
        N_304, Y => N_31_1);
    
    \timeout_cnt_maj[1]\ : MAJ3
      port map(A => \timeout_cnt_0[1]\, B => 
        \timeout_cnt_tmr2[1]_net_1\, C => 
        \timeout_cnt_tmr3[1]_net_1\, Y => \timeout_cnt[1]_net_1\);
    
    \nullclk_cnt_maj[0]\ : MAJ3
      port map(A => \nullclk_cnt_0[0]\, B => 
        \nullclk_cnt_tmr2[0]_net_1\, C => 
        \nullclk_cnt_tmr3[0]_net_1\, Y => \nullclk_cnt[0]_net_1\);
    
    i_spi_rx_strb_tmr3 : DFN1C0
      port map(D => \spi_sm_0[0]\, CLK => clk_5m_gl, CLR => 
        gb_spi_rst_b, Q => \i_spi_rx_strb_tmr3\);
    
    \clk_fcnt_2c_tmr3[2]\ : DFN1C0
      port map(D => \clk_fcnt_1c[2]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_tmr3[2]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[23]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[22]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIL0RI1\, CLR => 
        \spi_clr_maj_RNIL0RI1_0\, Q => 
        \n_rx_32bit_sreg_tmr2[23]_net_1\);
    
    \P_TX_32BIT_REG[3]\ : DLN1
      port map(D => \i42_mux_11\, G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[3]_net_1\);
    
    \i_spi_rx_word_maj_RNI66B61[6]\ : XOR2
      port map(A => \spi_rx_word[6]\, B => N_32, Y => 
        un4_spi_rx_command_1_4);
    
    spi_clr_maj_RNIMFTI2 : NOR2B
      port map(A => \N_16_0\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIMFTI2\);
    
    \i_spi_rx_word_tmr3[27]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIEGJJ[27]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[27]_net_1\);
    
    \clk_fcnt_1c_maj[2]\ : MAJ3
      port map(A => \clk_fcnt_1c_0[2]\, B => 
        \clk_fcnt_1c_tmr2[2]_net_1\, C => 
        \clk_fcnt_1c_tmr3[2]_net_1\, Y => \clk_fcnt_1c[2]_net_1\);
    
    \n_rx_32bit_sreg_maj[29]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[29]\, B => 
        \n_rx_32bit_sreg_tmr2[29]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[29]_net_1\, Y => 
        \n_rx_32bit_sreg[29]_net_1\);
    
    \i_spi_rx_word_tmr2[14]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNINHVI[14]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[14]_net_1\);
    
    clk_fcnt_en_tmr2 : DFN1C0
      port map(D => \spi_sm_maj_RNIDU2E[3]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \clk_fcnt_en_tmr2\);
    
    spi_clk_1c_maj : MAJ3
      port map(A => spi_clk_1c_0, B => \spi_clk_1c_tmr2\, C => 
        \spi_clk_1c_tmr3\, Y => \spi_clk_1c\);
    
    \i_spi_rx_word_tmr3[13]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNILFVI[13]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[13]_net_1\);
    
    m63 : NOR2
      port map(A => channel_involtage_ok(1), B => \N_63_0\, Y => 
        N_64);
    
    \n_rx_32bit_sreg_maj[30]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[30]\, B => 
        \n_rx_32bit_sreg_tmr2[30]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[30]_net_1\, Y => 
        \n_rx_32bit_sreg[30]_net_1\);
    
    m11 : NOR2A
      port map(A => spi_rx_command_reg(0), B => 
        spi_rx_command_reg(1), Y => spi_tx_word_sn_N_2);
    
    \clk_fcnt_2c_tmr2[5]\ : DFN1C0
      port map(D => \clk_fcnt_1c[5]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_tmr2[5]_net_1\);
    
    \i_spi_rx_word_maj_RNILBCJV[9]\ : MX2B
      port map(A => channels_desired_ready(2), B => N_31_0, S => 
        bad_crc_0_sqmuxa_1, Y => i_spi_rx_word_maj_RNILBCJV_0);
    
    \clk_fcnt_1c_tmr2[1]\ : DFN1C0
      port map(D => \clk_fcnt[1]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_tmr2[1]_net_1\);
    
    \n_rx_32bit_sreg[21]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[20]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIRC3M1\, CLR => 
        \spi_clr_maj_RNIRC3M1_0\, Q => \n_rx_32bit_sreg_0[21]\);
    
    m76 : MX2
      port map(A => \channels_ready[7]\, B => i43_mux_18, S => 
        \N_63_0\, Y => \i42_mux_8\);
    
    m51 : NOR2B
      port map(A => active_switch_constraints(4), B => 
        spi_rx_command_reg(0), Y => i43_mux_8);
    
    \i_spi_rx_word_maj[17]\ : MAJ3
      port map(A => \i_spi_rx_word[17]_net_1\, B => 
        \i_spi_rx_word_tmr2[17]_net_1\, C => 
        \i_spi_rx_word_tmr3[17]_net_1\, Y => \spi_rx_word[17]\);
    
    spi_clk_1c_tmr3 : DFN1C0
      port map(D => GLB, CLK => clk_5m_gl, CLR => gb_spi_rst_b, Q
         => \spi_clk_1c_tmr3\);
    
    \nullclk_cnt_maj_RNI47BI2[4]\ : MX2A
      port map(A => N_17, B => \nullclk_cnt[4]_net_1\, S => N_63, 
        Y => \nullclk_cnt_maj_RNI47BI2[4]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNI3LVR[18]\ : MX2
      port map(A => \rx_32bit_sreg[18]_net_1\, B => 
        \n_rx_32bit_sreg[18]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNI3LVR[18]_net_1\);
    
    \OUT_CHANNEL_MREG_1[3]\ : NOR2B
      port map(A => ch_mreg_en_2, B => channel_involtage_ok(2), Y
         => OUT_CHANNEL_MREG_c_2);
    
    \clk_fcnt_2c_tmr3[3]\ : DFN1C0
      port map(D => \clk_fcnt_1c[3]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_tmr3[3]_net_1\);
    
    spi_clr_maj_RNIRNKU1 : NOR2B
      port map(A => \spi_tx_word[4]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIRNKU1\);
    
    \n_rx_32bit_sreg_maj_RNIL81S[20]\ : MX2
      port map(A => \rx_32bit_sreg[20]_net_1\, B => 
        \n_rx_32bit_sreg[20]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNIL81S[20]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[26]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[25]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIRECDT\, CLR => 
        \spi_clr_maj_RNIRECDT_0\, Q => 
        \n_rx_32bit_sreg_tmr3[26]_net_1\);
    
    \P_TX_32BIT_REG_RNIHF6F[22]\ : MX2
      port map(A => \P_TX_32BIT_REG[22]_net_1\, B => 
        \P_TX_32BIT_REG[6]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_660);
    
    \n_rx_32bit_sreg_maj_RNI7R1S[29]\ : MX2
      port map(A => \rx_32bit_sreg[29]_net_1\, B => 
        \n_rx_32bit_sreg[29]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNI7R1S[29]_net_1\);
    
    \rx_32bit_sreg[10]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI47RJ[10]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[10]\);
    
    \rx_32bit_sreg_maj[30]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[30]\, B => 
        \rx_32bit_sreg_tmr2[30]_net_1\, C => 
        \rx_32bit_sreg_tmr3[30]_net_1\, Y => 
        \rx_32bit_sreg[30]_net_1\);
    
    \rx_32bit_sreg_maj_RNIFBMK[1]\ : MX2
      port map(A => \spi_rx_word[1]\, B => 
        \rx_32bit_sreg[1]_net_1\, S => \spi_sm_1[0]\, Y => 
        \rx_32bit_sreg_maj_RNIFBMK[1]_net_1\);
    
    \i_spi_rx_word_maj_RNI68JJ[23]\ : MX2
      port map(A => \spi_rx_word[23]\, B => 
        \rx_32bit_sreg[23]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNI68JJ[23]_net_1\);
    
    \spi_sm_maj_RNII907[1]\ : NOR3A
      port map(A => N_63, B => \spi_sm_1[0]\, C => 
        \spi_sm[1]_net_1\, Y => N_202);
    
    spi_clr_maj_RNICT7M1 : NOR2B
      port map(A => \spi_tx_word[18]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNICT7M1\);
    
    \clk_fcnt_tmr3[5]\ : DFN0C1
      port map(D => \half_clk_fcnt_maj_RNI7IBL[5]_net_1\, CLK => 
        GLB, CLR => \spi_clr\, Q => \clk_fcnt_tmr3[5]_net_1\);
    
    \nullclk_cnt_maj[4]\ : MAJ3
      port map(A => \nullclk_cnt_0[4]\, B => 
        \nullclk_cnt_tmr2[4]_net_1\, C => 
        \nullclk_cnt_tmr3[4]_net_1\, Y => \nullclk_cnt[4]_net_1\);
    
    m32_0_0 : NOR2
      port map(A => master_rst_b, B => J11_DEBUG_c_c(5), Y => 
        un1_master_rst_b_1_0);
    
    \i_spi_rx_word_maj_RNIHDMK[2]\ : MX2
      port map(A => \spi_rx_word[2]\, B => 
        \rx_32bit_sreg[2]_net_1\, S => \spi_sm_1[0]\, Y => 
        \i_spi_rx_word_maj_RNIHDMK[2]_net_1\);
    
    \spi_sm_tmr2[3]\ : DFN1C0
      port map(D => N_28_0, CLK => clk_5m_gl, CLR => gb_spi_rst_b, 
        Q => \spi_sm_tmr2[3]_net_1\);
    
    \i_spi_rx_word[11]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIHBVI[11]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[11]_net_1\);
    
    \i_spi_rx_word_tmr3[2]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIHDMK[2]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[2]_net_1\);
    
    spi_clr_maj_RNIETQ6Q_0 : NOR2A
      port map(A => \spi_clr\, B => tx_crc(1), Y => 
        \spi_clr_maj_RNIETQ6Q_0\);
    
    \P_TX_32BIT_REG[6]\ : DLN1
      port map(D => \spi_tx_word[6]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[6]_net_1\);
    
    \half_clk_fcnt_maj_RNI6KAI[3]\ : MX2
      port map(A => N_650, B => N_651, S => 
        \half_clk_fcnt[3]_net_1\, Y => N_652);
    
    \i_spi_rx_word[13]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNILFVI[13]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[13]_net_1\);
    
    \timeout_cnt_maj_RNI9E0Q1[7]\ : XO1
      port map(A => \timeout_cnt[7]_net_1\, B => N_163, C => 
        N_304, Y => N_61);
    
    \timeout_cnt[5]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNIVBFM1[5]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[5]\);
    
    m13 : NOR2
      port map(A => \channels_on[3]\, B => spi_tx_word_sn_N_2, Y
         => N_14_0);
    
    \clk_fcnt_2c_tmr2[1]\ : DFN1C0
      port map(D => \clk_fcnt_1c[1]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_tmr2[1]_net_1\);
    
    spi_clr_maj_RNIRHQ62 : NOR2B
      port map(A => \spi_tx_word[16]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIRHQ62\);
    
    \clk_fcnt_2c[5]\ : DFN1C0
      port map(D => \clk_fcnt_1c[5]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_0[5]\);
    
    \spi_sm_maj_RNIJF643[3]\ : OR3A
      port map(A => N_163, B => N_208, C => N_304, Y => N_68);
    
    \clk_fcnt_tmr3[1]\ : DFN0C1
      port map(D => \half_clk_fcnt_maj_RNIV9BL[1]_net_1\, CLK => 
        GLB, CLR => \spi_clr\, Q => \clk_fcnt_tmr3[1]_net_1\);
    
    \m32_0\ : NOR2
      port map(A => master_rst_b, B => J11_DEBUG_c_c(5), Y => 
        m32_0);
    
    \i_spi_rx_word_maj[14]\ : MAJ3
      port map(A => \i_spi_rx_word[14]_net_1\, B => 
        \i_spi_rx_word_tmr2[14]_net_1\, C => 
        \i_spi_rx_word_tmr3[14]_net_1\, Y => \spi_rx_word[14]\);
    
    \i_spi_rx_word_tmr3[18]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIEEHJ[18]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[18]_net_1\);
    
    spi_clk_2c_maj_RNIVCU1 : NOR2
      port map(A => \spi_clk_2c\, B => \spi_sm[5]_net_1\, Y => 
        un1_spi_sm_7_i_0_a2_0);
    
    \timeout_cnt_maj_RNIEH9V1[8]\ : OR2A
      port map(A => \timeout_cnt[8]_net_1\, B => N_165, Y => 
        N_166);
    
    \i_spi_rx_word_maj_RNIUE271[15]\ : MX2C
      port map(A => \channels_to_be_on[7]\, B => N_138, S => 
        SW4_SLAVE_PAIRS_BAR_c(4), Y => N_139);
    
    \timeout_cnt_maj_RNIVBFM1[5]\ : MX2A
      port map(A => N_70, B => \timeout_cnt[5]_net_1\, S => N_530, 
        Y => \timeout_cnt_maj_RNIVBFM1[5]_net_1\);
    
    \rx_32bit_sreg_tmr2[23]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIRE1S[23]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[23]_net_1\);
    
    m60 : NOR2B
      port map(A => active_switch_constraints(2), B => 
        spi_rx_command_reg(0), Y => i43_mux_12);
    
    \rx_32bit_sreg_tmr2[16]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIVGVR[16]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[16]_net_1\);
    
    \n_rx_32bit_sreg_maj[9]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[9]\, B => 
        \n_rx_32bit_sreg_tmr2[9]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[9]_net_1\, Y => 
        \n_rx_32bit_sreg[9]_net_1\);
    
    \i_spi_rx_word_maj_RNIE3IV5[31]\ : MX2
      port map(A => \spi_rx_word[31]\, B => spi_rx_command_reg(1), 
        S => \spi_timeout_pulse_i_1\, Y => 
        i_spi_rx_word_maj_RNIE3IV5_0);
    
    \OUT_CHANNEL_MREG_1[1]\ : NOR2B
      port map(A => ch_mreg_en_0, B => channel_involtage_ok(1), Y
         => OUT_CHANNEL_MREG_c_0);
    
    \n_rx_32bit_sreg_tmr2[8]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[7]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNI95ML1\, CLR => \spi_clr_maj_RNI95ML1_0\, 
        Q => \n_rx_32bit_sreg_tmr2[8]_net_1\);
    
    \rx_32bit_sreg[1]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI4N8E[1]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[1]\);
    
    \n_rx_32bit_sreg[4]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[3]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIRNKU1\, CLR => \spi_clr_maj_RNIRNKU1_0\, 
        Q => \n_rx_32bit_sreg_0[4]\);
    
    \n_rx_32bit_sreg_tmr3[30]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[29]_net_1\, CLK => GLB, PRE
         => spi_slave_GND, CLR => \spi_clr\, Q => 
        \n_rx_32bit_sreg_tmr3[30]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNI1JVR[17]\ : MX2
      port map(A => \rx_32bit_sreg[17]_net_1\, B => 
        \n_rx_32bit_sreg[17]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNI1JVR[17]_net_1\);
    
    \debounce.6.un39_sw2_sw3_channel_on_bar\ : NOR3B
      port map(A => sw2_sw5_channel_on_b(6), B => 
        sw2_sw5_channel_on_a(6), C => J11_DEBUG_c_c(3), Y => 
        un39_sw2_sw3_channel_on_bar);
    
    \i_spi_rx_word_maj_RNI7R7G1[17]\ : XOR3
      port map(A => N_26, B => \spi_rx_word[17]\, C => N_30, Y
         => un4_spi_rx_command_0_1);
    
    \rx_32bit_sreg_tmr2[7]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIG39E[7]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[7]_net_1\);
    
    \i_spi_rx_word_maj_RNIHU7V[23]\ : XOR2
      port map(A => N_31, B => \spi_rx_word[23]\, Y => 
        un4_spi_rx_command_4_2);
    
    \n_rx_32bit_sreg[11]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[10]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIGVKF1\, CLR => 
        \spi_clr_maj_RNIGVKF1_0\, Q => \n_rx_32bit_sreg_0[11]\);
    
    \timeout_cnt_maj_RNIHS2L[0]\ : OA1
      port map(A => \timeout_cnt[0]_net_1\, B => 
        \timeout_cnt[1]_net_1\, C => \timeout_cnt[2]_net_1\, Y
         => N_220);
    
    \half_clk_fcnt_maj_RNI5KBI[3]\ : MX2
      port map(A => N_653, B => N_654, S => 
        \half_clk_fcnt[3]_net_1\, Y => N_655);
    
    spi_clr_maj_RNI70U52_0 : NOR2A
      port map(A => \spi_clr\, B => \i42_mux_11\, Y => 
        \spi_clr_maj_RNI70U52_0\);
    
    \i_spi_rx_word_tmr2[2]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIHDMK[2]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[2]_net_1\);
    
    spi_clr_maj_RNITPKU1_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[5]\, Y => 
        \spi_clr_maj_RNITPKU1_0\);
    
    \P_TX_32BIT_REG[8]\ : DLN1
      port map(D => spi_tx_word_8, G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[8]_net_1\);
    
    \i_spi_rx_word_tmr3[26]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNICEJJ[26]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[26]_net_1\);
    
    \nullclk_cnt_maj_RNI0T8R1[1]\ : MX2A
      port map(A => N_23, B => \nullclk_cnt[1]_net_1\, S => N_63, 
        Y => \nullclk_cnt_maj_RNI0T8R1[1]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[13]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[12]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIC9792\, CLR => 
        \spi_clr_maj_RNIC9792_0\, Q => 
        \n_rx_32bit_sreg_tmr2[13]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[22]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[21]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNI0CAQ1\, CLR => 
        \spi_clr_maj_RNI0CAQ1_0\, Q => 
        \n_rx_32bit_sreg_tmr3[22]_net_1\);
    
    \i_spi_rx_word[21]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI24JJ[21]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[21]_net_1\);
    
    \spi_sm_maj_RNI5E821[4]\ : MX2A
      port map(A => N_304, B => N_172, S => \spi_sm[4]_net_1\, Y
         => un1_spi_sm_5);
    
    \i_spi_rx_word[3]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIJFMK[3]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[3]_net_1\);
    
    spi_clr_maj_RNIMFTI2_0 : NOR2A
      port map(A => \spi_clr\, B => \N_16_0\, Y => 
        \spi_clr_maj_RNIMFTI2_0\);
    
    \rx_32bit_sreg_maj_RNI48LJ[31]\ : MX2
      port map(A => \spi_rx_word[31]\, B => 
        \rx_32bit_sreg[31]_net_1\, S => \spi_sm_0[0]\, Y => 
        \rx_32bit_sreg_maj_RNI48LJ[31]_net_1\);
    
    \timeout_cnt_tmr2[4]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNIV7EF1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[4]_net_1\);
    
    m98 : MX2
      port map(A => \channels_on[4]\, B => i43_mux_24, S => 
        \N_63_0\, Y => \i42_mux_11\);
    
    dutycycle_mode : OR2A
      port map(A => J11_DEBUG_c_c(4), B => spi_dutycycle_mode, Y
         => \dutycycle_mode\);
    
    \clk_fcnt_maj[0]\ : MAJ3
      port map(A => \clk_fcnt_0[0]\, B => 
        \clk_fcnt_tmr2[0]_net_1\, C => \clk_fcnt_tmr3[0]_net_1\, 
        Y => \clk_fcnt[0]_net_1\);
    
    \i_spi_rx_word[23]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI68JJ[23]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[23]_net_1\);
    
    \i_spi_rx_word_maj[4]\ : MAJ3
      port map(A => \i_spi_rx_word[4]_net_1\, B => 
        \i_spi_rx_word_tmr2[4]_net_1\, C => 
        \i_spi_rx_word_tmr3[4]_net_1\, Y => \spi_rx_word[4]\);
    
    clk_fcnt_en_maj_RNIUEVQ2 : AOI1B
      port map(A => un2_clk_fcnt_3, B => un2_clk_fcnt_2, C => 
        clk_fcnt_en_1, Y => un2_clk_fcnt_en);
    
    \timeout_cnt_maj[3]\ : MAJ3
      port map(A => \timeout_cnt_0[3]\, B => 
        \timeout_cnt_tmr2[3]_net_1\, C => 
        \timeout_cnt_tmr3[3]_net_1\, Y => \timeout_cnt[3]_net_1\);
    
    \timeout_cnt_maj_RNI05D81[3]\ : MX2A
      port map(A => N_74, B => \timeout_cnt[3]_net_1\, S => N_530, 
        Y => \timeout_cnt_maj_RNI05D81[3]_net_1\);
    
    \half_clk_fcnt_tmr3[4]\ : DFN1C1
      port map(D => I_21, CLK => GLB, CLR => \spi_clr\, Q => 
        \half_clk_fcnt_tmr3[4]_net_1\);
    
    \nullclk_cnt_maj_RNIBVU22[2]\ : MX2A
      port map(A => N_21, B => \nullclk_cnt[2]_net_1\, S => N_63, 
        Y => \nullclk_cnt_maj_RNIBVU22[2]_net_1\);
    
    \half_clk_fcnt_maj_RNI1CBL[2]\ : MX2
      port map(A => \clk_fcnt[2]_net_1\, B => 
        \half_clk_fcnt[2]_net_1\, S => clk_fcnt_en_1, Y => 
        \half_clk_fcnt_maj_RNI1CBL[2]_net_1\);
    
    \timeout_cnt_maj[6]\ : MAJ3
      port map(A => \timeout_cnt_0[6]\, B => 
        \timeout_cnt_tmr2[6]_net_1\, C => 
        \timeout_cnt_tmr3[6]_net_1\, Y => \timeout_cnt[6]_net_1\);
    
    \rx_32bit_sreg_maj[21]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[21]\, B => 
        \rx_32bit_sreg_tmr2[21]_net_1\, C => 
        \rx_32bit_sreg_tmr3[21]_net_1\, Y => 
        \rx_32bit_sreg[21]_net_1\);
    
    \rx_32bit_sreg[20]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIL81S[20]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[20]\);
    
    \i_spi_rx_word_maj[25]\ : MAJ3
      port map(A => \i_spi_rx_word[25]_net_1\, B => 
        \i_spi_rx_word_tmr2[25]_net_1\, C => 
        \i_spi_rx_word_tmr3[25]_net_1\, Y => \spi_rx_crc[1]\);
    
    \timeout_cnt_maj_RNIHOA62[9]\ : OR2A
      port map(A => \timeout_cnt[9]_net_1\, B => N_166, Y => 
        N_180);
    
    \debounce.8.un53_sw2_sw3_channel_on_bar\ : NOR3B
      port map(A => sw2_sw5_channel_on_b(8), B => 
        sw2_sw5_channel_on_a(8), C => SW2_SW3_CHANNEL_ON_BAR_c_5, 
        Y => un53_sw2_sw3_channel_on_bar);
    
    \i_spi_rx_word_tmr2[10]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNIF9VI[10]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[10]_net_1\);
    
    \half_clk_fcnt_tmr2[4]\ : DFN1C1
      port map(D => I_21, CLK => GLB, CLR => \spi_clr\, Q => 
        \half_clk_fcnt_tmr2[4]_net_1\);
    
    \clk_fcnt_1c_maj[1]\ : MAJ3
      port map(A => \clk_fcnt_1c_0[1]\, B => 
        \clk_fcnt_1c_tmr2[1]_net_1\, C => 
        \clk_fcnt_1c_tmr3[1]_net_1\, Y => \clk_fcnt_1c[1]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNI8R8E[3]\ : MX2
      port map(A => \rx_32bit_sreg[3]_net_1\, B => 
        \n_rx_32bit_sreg[3]_net_1\, S => clk_fcnt_en_1, Y => 
        \n_rx_32bit_sreg_maj_RNI8R8E[3]_net_1\);
    
    \clk_fcnt_2c_maj[2]\ : MAJ3
      port map(A => \clk_fcnt_2c_0[2]\, B => 
        \clk_fcnt_2c_tmr2[2]_net_1\, C => 
        \clk_fcnt_2c_tmr3[2]_net_1\, Y => \clk_fcnt_2c[2]_net_1\);
    
    m46 : NOR2B
      port map(A => active_switch_constraints(5), B => 
        spi_rx_command_reg(0), Y => i43_mux_6);
    
    \timeout_cnt[13]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI6GBJ3[13]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[13]\);
    
    \n_rx_32bit_sreg_maj[16]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[16]\, B => 
        \n_rx_32bit_sreg_tmr2[16]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[16]_net_1\, Y => 
        \n_rx_32bit_sreg[16]_net_1\);
    
    \i_spi_rx_word_tmr3[29]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIIKJJ[29]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[29]_net_1\);
    
    \n_rx_32bit_sreg_maj[14]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[14]\, B => 
        \n_rx_32bit_sreg_tmr2[14]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[14]_net_1\, Y => 
        \n_rx_32bit_sreg[14]_net_1\);
    
    \i_spi_rx_word_maj_RNIQ67V[7]\ : XOR2
      port map(A => \spi_rx_word[7]\, B => N_34, Y => 
        un4_spi_rx_command_2_4);
    
    \n_rx_32bit_sreg_tmr3[15]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[14]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIJ3632\, CLR => 
        \spi_clr_maj_RNIJ3632_0\, Q => 
        \n_rx_32bit_sreg_tmr3[15]_net_1\);
    
    \i_spi_rx_word_tmr2[3]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIJFMK[3]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[3]_net_1\);
    
    \dtycyc_cnt_38\ : AXO6
      port map(A => un2_dutycycle_mode_1, B => 
        n_dtycyc_cnt_2_sqmuxa, C => dtycyc_cnt(0), Y => 
        dtycyc_cnt_38);
    
    \i_spi_rx_word_maj_RNIC7VH01[1]\ : MX2B
      port map(A => channels_desired_on(2), B => N_39, S => 
        bad_crc_0_sqmuxa_1, Y => i_spi_rx_word_maj_RNIC7VH01_0);
    
    \clk_fcnt_tmr2[5]\ : DFN0C1
      port map(D => \half_clk_fcnt_maj_RNI7IBL[5]_net_1\, CLK => 
        GLB, CLR => \spi_clr\, Q => \clk_fcnt_tmr2[5]_net_1\);
    
    \P_TX_32BIT_REG[24]\ : DLN1
      port map(D => tx_crc(0), G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[24]_net_1\);
    
    m7_0 : NOR2B
      port map(A => channels_desired_ready(2), B => N_7_0, Y => 
        \channels_ready[2]\);
    
    \sw2_sw5_channel_on_b_25\ : MX2
      port map(A => sw2_sw5_channel_on_b(3), B => 
        sw2_sw5_channel_on_a(3), S => N_210_i, Y => 
        sw2_sw5_channel_on_b_25);
    
    \i_spi_rx_word_tmr3[25]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIACJJ[25]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[25]_net_1\);
    
    spi_clr_tmr3 : DFN1P0
      port map(D => \spi_sm_maj_RNIMFV51[4]_net_1\, CLK => 
        clk_5m_gl, PRE => gb_spi_rst_b, Q => \spi_clr_tmr3\);
    
    spi_clr_maj_RNIRECDT_0 : NOR2A
      port map(A => \spi_clr\, B => tx_crc(2), Y => 
        \spi_clr_maj_RNIRECDT_0\);
    
    \n_rx_32bit_sreg[31]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[30]_net_1\, CLK => GLB, PRE
         => spi_slave_GND, CLR => \spi_clr\, Q => 
        \n_rx_32bit_sreg_0[31]\);
    
    \i_spi_rx_word_maj_RNIE84O[29]\ : XOR2
      port map(A => \spi_rx_crc[5]\, B => N_34, Y => 
        un4_spi_rx_command_5_0);
    
    \rx_32bit_sreg_maj[24]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[24]\, B => 
        \rx_32bit_sreg_tmr2[24]_net_1\, C => 
        \rx_32bit_sreg_tmr3[24]_net_1\, Y => 
        \rx_32bit_sreg[24]_net_1\);
    
    \rx_32bit_sreg_tmr2[26]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI1L1S[26]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[26]_net_1\);
    
    i_spi_miso_maj_RNILQNM5 : MX2
      port map(A => \sca_dat_in_c\, B => i_spi_miso_4, S => 
        clk_fcnt_en_1, Y => \i_spi_miso_maj_RNILQNM5\);
    
    \rx_32bit_sreg_tmr2[3]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI8R8E[3]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[3]_net_1\);
    
    \clk_fcnt[3]\ : DFN0C1
      port map(D => \clk_fcnt_maj_RNI3EBL[3]_net_1\, CLK => GLB, 
        CLR => \spi_clr\, Q => \clk_fcnt_0[3]\);
    
    \rx_32bit_sreg[31]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIPE3S[31]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[31]\);
    
    \nullclk_cnt_maj[1]\ : MAJ3
      port map(A => \nullclk_cnt_0[1]\, B => 
        \nullclk_cnt_tmr2[1]_net_1\, C => 
        \nullclk_cnt_tmr3[1]_net_1\, Y => \nullclk_cnt[1]_net_1\);
    
    \timeout_cnt_maj_RNIB67H1[6]\ : OR3B
      port map(A => \timeout_cnt[5]_net_1\, B => 
        \timeout_cnt[6]_net_1\, C => N_144, Y => N_163);
    
    \timeout_cnt[12]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNINTCB3[12]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[12]\);
    
    \rx_32bit_sreg[14]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIRCVR[14]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[14]\);
    
    \rx_32bit_sreg_maj[12]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[12]\, B => 
        \rx_32bit_sreg_tmr2[12]_net_1\, C => 
        \rx_32bit_sreg_tmr3[12]_net_1\, Y => 
        \rx_32bit_sreg[12]_net_1\);
    
    \nullclk_cnt_maj_RNIFNEV1[3]\ : XAI1A
      port map(A => \nullclk_cnt[3]_net_1\, B => N_176, C => 
        N_186, Y => N_19);
    
    \i_spi_rx_word_maj_RNIH045V[12]\ : MX2B
      port map(A => channels_desired_ready(6), B => N_135, S => 
        bad_crc_0_sqmuxa_1, Y => i_spi_rx_word_maj_RNIH045V_0);
    
    \i_spi_rx_word_tmr3[21]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI24JJ[21]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[21]_net_1\);
    
    \i_spi_rx_word[18]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIEEHJ[18]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[18]_net_1\);
    
    \timeout_cnt_maj_RNIV7EF1[4]\ : MX2A
      port map(A => N_72, B => \timeout_cnt[4]_net_1\, S => N_530, 
        Y => \timeout_cnt_maj_RNIV7EF1[4]_net_1\);
    
    \i_spi_rx_word_maj_RNIGOKM[25]\ : XOR2
      port map(A => \spi_rx_crc[1]\, B => N_29, Y => 
        un4_spi_rx_command_1_0);
    
    \rx_32bit_sreg_tmr2[1]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI4N8E[1]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[1]_net_1\);
    
    m12_0 : AO13
      port map(A => \channels_ready[2]\, B => 
        spi_rx_command_reg(0), C => spi_rx_command_reg(1), Y => 
        \spi_tx_word[9]\);
    
    \timeout_cnt_maj[9]\ : MAJ3
      port map(A => \timeout_cnt_0[9]\, B => 
        \timeout_cnt_tmr2[9]_net_1\, C => 
        \timeout_cnt_tmr3[9]_net_1\, Y => \timeout_cnt[9]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNIRCVR[14]\ : MX2
      port map(A => \rx_32bit_sreg[14]_net_1\, B => 
        \n_rx_32bit_sreg[14]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNIRCVR[14]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNIG39E[7]\ : MX2
      port map(A => \rx_32bit_sreg[7]_net_1\, B => 
        \n_rx_32bit_sreg[7]_net_1\, S => clk_fcnt_en_1, Y => 
        \n_rx_32bit_sreg_maj_RNIG39E[7]_net_1\);
    
    \spi_sm_maj_RNIMQL7[2]\ : AO1A
      port map(A => \spi_sm_ns_i_a2_0_a2_0_0[3]\, B => 
        \spi_sm[2]_net_1\, C => N_304, Y => 
        \spi_sm_maj_RNIMQL7[2]_net_1\);
    
    \spi_sm_maj[3]\ : MAJ3
      port map(A => \spi_sm[3]_net_1\, B => 
        \spi_sm_tmr2[3]_net_1\, C => \spi_sm_tmr3[3]_net_1\, Y
         => N_304);
    
    \i_spi_rx_word_maj_RNILVK22[29]\ : XOR3
      port map(A => N_31, B => N_29, C => un4_spi_rx_command_5_0, 
        Y => un4_spi_rx_command_5_4);
    
    \half_clk_fcnt[0]\ : DFN1C1
      port map(D => \DWACT_ADD_CI_0_partial_sum[0]\, CLK => GLB, 
        CLR => \spi_clr\, Q => \half_clk_fcnt_0[0]\);
    
    \clk_fcnt_1c_tmr2[4]\ : DFN1C0
      port map(D => \clk_fcnt[4]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_tmr2[4]_net_1\);
    
    \i_spi_rx_word_tmr2[8]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNITPMK[8]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[8]_net_1\);
    
    \P_TX_32BIT_REG[19]\ : DLN1
      port map(D => \spi_tx_word[19]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[19]_net_1\);
    
    \i_spi_rx_word_tmr2[12]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNIJDVI[12]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[12]_net_1\);
    
    \rx_32bit_sreg_tmr3[27]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI3N1S[27]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[27]_net_1\);
    
    \n_rx_32bit_sreg[23]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[22]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIL0RI1\, CLR => 
        \spi_clr_maj_RNIL0RI1_0\, Q => \n_rx_32bit_sreg_0[23]\);
    
    \timeout_cnt_maj_RNICV431[4]\ : OR2A
      port map(A => \timeout_cnt[4]_net_1\, B => N_122, Y => 
        N_144);
    
    \n_rx_32bit_sreg_tmr2[30]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[29]_net_1\, CLK => GLB, PRE
         => spi_slave_GND, CLR => \spi_clr\, Q => 
        \n_rx_32bit_sreg_tmr2[30]_net_1\);
    
    \i_spi_rx_word_maj_RNIPLMK[6]\ : MX2
      port map(A => \spi_rx_word[6]\, B => 
        \rx_32bit_sreg[6]_net_1\, S => \spi_sm_1[0]\, Y => 
        \i_spi_rx_word_maj_RNIPLMK[6]_net_1\);
    
    \i_spi_rx_word_maj_RNIPJ2FV[2]\ : MX2
      port map(A => channels_desired_on(3), B => 
        \channels_to_be_on[3]\, S => bad_crc_0_sqmuxa_1, Y => 
        i_spi_rx_word_maj_RNIPJ2FV_0);
    
    \spi_sm_maj[2]\ : MAJ3
      port map(A => \spi_sm_0_0[2]\, B => \spi_sm_tmr2[2]_net_1\, 
        C => \spi_sm_tmr3[2]_net_1\, Y => \spi_sm[2]_net_1\);
    
    \rx_32bit_sreg_tmr3[29]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI7R1S[29]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[29]_net_1\);
    
    \clk_fcnt[0]\ : DFN0C1
      port map(D => \half_clk_fcnt_maj_RNIT7BL[0]_net_1\, CLK => 
        GLB, CLR => \spi_clr\, Q => \clk_fcnt_0[0]\);
    
    \rx_32bit_sreg_tmr3[17]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI1JVR[17]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[17]_net_1\);
    
    \n_rx_32bit_sreg_maj[4]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[4]\, B => 
        \n_rx_32bit_sreg_tmr2[4]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[4]_net_1\, Y => 
        \n_rx_32bit_sreg[4]_net_1\);
    
    \timeout_cnt_maj[0]\ : MAJ3
      port map(A => \timeout_cnt_0[0]\, B => 
        \timeout_cnt_tmr2[0]_net_1\, C => 
        \timeout_cnt_tmr3[0]_net_1\, Y => \timeout_cnt[0]_net_1\);
    
    \i_spi_rx_word_maj[27]\ : MAJ3
      port map(A => \i_spi_rx_word[27]_net_1\, B => 
        \i_spi_rx_word_tmr2[27]_net_1\, C => 
        \i_spi_rx_word_tmr3[27]_net_1\, Y => \spi_rx_crc[3]\);
    
    \rx_32bit_sreg_tmr3[19]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI5NVR[19]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[19]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNIPC1S[22]\ : MX2
      port map(A => \rx_32bit_sreg[22]_net_1\, B => 
        \n_rx_32bit_sreg[22]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNIPC1S[22]_net_1\);
    
    \i_spi_rx_word_maj[9]\ : MAJ3
      port map(A => \i_spi_rx_word[9]_net_1\, B => 
        \i_spi_rx_word_tmr2[9]_net_1\, C => 
        \i_spi_rx_word_tmr3[9]_net_1\, Y => \spi_rx_word[9]\);
    
    \n_rx_32bit_sreg_tmr3[16]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[15]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIRHQ62\, CLR => 
        \spi_clr_maj_RNIRHQ62_0\, Q => 
        \n_rx_32bit_sreg_tmr3[16]_net_1\);
    
    \n_rx_32bit_sreg_maj[23]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[23]\, B => 
        \n_rx_32bit_sreg_tmr2[23]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[23]_net_1\, Y => 
        \n_rx_32bit_sreg[23]_net_1\);
    
    \spi_sm_tmr3[5]\ : DFN1P0
      port map(D => \spi_sm_0[0]\, CLK => clk_5m_gl, PRE => 
        gb_spi_rst_b, Q => \spi_sm_tmr3[5]_net_1\);
    
    \i_spi_rx_word_tmr2[30]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI26LJ[30]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[30]_net_1\);
    
    \clk_fcnt_1c_maj[0]\ : MAJ3
      port map(A => \clk_fcnt_1c_0[0]\, B => 
        \clk_fcnt_1c_tmr2[0]_net_1\, C => 
        \clk_fcnt_1c_tmr3[0]_net_1\, Y => \clk_fcnt_1c[0]_net_1\);
    
    \i_spi_rx_word_maj[12]\ : MAJ3
      port map(A => \i_spi_rx_word[12]_net_1\, B => 
        \i_spi_rx_word_tmr2[12]_net_1\, C => 
        \i_spi_rx_word_tmr3[12]_net_1\, Y => \spi_rx_word[12]\);
    
    \spi_sm_tmr3[3]\ : DFN1C0
      port map(D => N_28_0, CLK => clk_5m_gl, CLR => gb_spi_rst_b, 
        Q => \spi_sm_tmr3[3]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNICV8E[5]\ : MX2
      port map(A => \rx_32bit_sreg[5]_net_1\, B => 
        \n_rx_32bit_sreg[5]_net_1\, S => clk_fcnt_en_1, Y => 
        \n_rx_32bit_sreg_maj_RNICV8E[5]_net_1\);
    
    \timeout_cnt_maj[8]\ : MAJ3
      port map(A => \timeout_cnt_0[8]\, B => 
        \timeout_cnt_tmr2[8]_net_1\, C => 
        \timeout_cnt_tmr3[8]_net_1\, Y => \timeout_cnt[8]_net_1\);
    
    \timeout_cnt_maj_RNI3O463[8]\ : OA1
      port map(A => \timeout_cnt[8]_net_1\, B => N_222, C => 
        SPI_TIMEOUT_PULSE_i_0_a2_1_2, Y => N_223);
    
    \n_rx_32bit_sreg[20]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[19]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNI5CPP1\, CLR => 
        \spi_clr_maj_RNI5CPP1_0\, Q => \n_rx_32bit_sreg_0[20]\);
    
    spi_clr_maj_RNIL0RI1_0 : NOR2A
      port map(A => \spi_clr\, B => \i42_mux\, Y => 
        \spi_clr_maj_RNIL0RI1_0\);
    
    \rx_32bit_sreg_tmr3[1]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI4N8E[1]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[1]_net_1\);
    
    \i_spi_rx_word[6]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIPLMK[6]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[6]_net_1\);
    
    \clk_fcnt_1c_tmr2[2]\ : DFN1C0
      port map(D => \clk_fcnt[2]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_tmr2[2]_net_1\);
    
    \n_rx_32bit_sreg_maj[11]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[11]\, B => 
        \n_rx_32bit_sreg_tmr2[11]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[11]_net_1\, Y => 
        \n_rx_32bit_sreg[11]_net_1\);
    
    \debounce.1.un4_sw2_sw3_channel_on_bar\ : NOR3B
      port map(A => sw2_sw5_channel_on_b(1), B => 
        sw2_sw5_channel_on_a(1), C => J11_DEBUG_c_c(6), Y => 
        un4_sw2_sw3_channel_on_bar);
    
    \P_TX_32BIT_REG[2]\ : DLN1
      port map(D => \N_16_0\, G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[2]_net_1\);
    
    \P_TX_32BIT_REG[11]\ : DLN1
      port map(D => \spi_tx_word[11]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[11]_net_1\);
    
    \i_spi_rx_word_maj_RNI02JJ[20]\ : MX2
      port map(A => \spi_rx_word[20]\, B => 
        \rx_32bit_sreg[20]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNI02JJ[20]_net_1\);
    
    \i_spi_rx_word[28]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIGIJJ[28]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[28]_net_1\);
    
    \i_spi_rx_word[15]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIPJVI[15]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[15]_net_1\);
    
    \i_spi_rx_word_maj_RNIEGJJ[27]\ : MX2
      port map(A => \spi_rx_crc[3]\, B => 
        \rx_32bit_sreg[27]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNIEGJJ[27]_net_1\);
    
    \P_TX_32BIT_REG_RNIQ1I1[15]\ : NOR2B
      port map(A => \P_TX_32BIT_REG[15]_net_1\, B => 
        \half_clk_fcnt[4]_net_1\, Y => N_269);
    
    spi_clr_maj_RNITKFFR_0 : NOR2A
      port map(A => \spi_clr\, B => tx_crc(3), Y => 
        \spi_clr_maj_RNITKFFR_0\);
    
    \rx_32bit_sreg[8]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNII59E[8]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[8]\);
    
    \n_rx_32bit_sreg_maj_RNIN8VR[12]\ : MX2
      port map(A => \rx_32bit_sreg[12]_net_1\, B => 
        \n_rx_32bit_sreg[12]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNIN8VR[12]_net_1\);
    
    \half_clk_fcnt_tmr2[3]\ : DFN1C1
      port map(D => I_22, CLK => GLB, CLR => \spi_clr\, Q => 
        \half_clk_fcnt_tmr2[3]_net_1\);
    
    \clk_fcnt_2c_tmr2[3]\ : DFN1C0
      port map(D => \clk_fcnt_1c[3]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_tmr2[3]_net_1\);
    
    \n_rx_32bit_sreg_maj[20]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[20]\, B => 
        \n_rx_32bit_sreg_tmr2[20]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[20]_net_1\, Y => 
        \n_rx_32bit_sreg[20]_net_1\);
    
    \i_spi_rx_word_tmr2[27]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIEGJJ[27]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[27]_net_1\);
    
    \n_rx_32bit_sreg[26]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[25]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIRECDT\, CLR => 
        \spi_clr_maj_RNIRECDT_0\, Q => \n_rx_32bit_sreg_0[26]\);
    
    \clk_fcnt_tmr2[3]\ : DFN0C1
      port map(D => \clk_fcnt_maj_RNI3EBL[3]_net_1\, CLK => GLB, 
        CLR => \spi_clr\, Q => \clk_fcnt_tmr2[3]_net_1\);
    
    \half_clk_fcnt_maj_RNIVHC1[2]\ : NOR2
      port map(A => \half_clk_fcnt[3]_net_1\, B => 
        \half_clk_fcnt[2]_net_1\, Y => 
        \spi_sm_ns_i_a2_0_a2_0_4_0[3]\);
    
    \nullclk_cnt_maj_RNIHVBF[0]\ : OR2B
      port map(A => \nullclk_cnt[1]_net_1\, B => 
        \nullclk_cnt[0]_net_1\, Y => N_174);
    
    \rx_32bit_sreg_tmr3[3]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI8R8E[3]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[3]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[4]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[3]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIRNKU1\, CLR => \spi_clr_maj_RNIRNKU1_0\, 
        Q => \n_rx_32bit_sreg_tmr3[4]_net_1\);
    
    clk_fcnt_en_maj : MAJ3
      port map(A => \clk_fcnt_en\, B => \clk_fcnt_en_tmr2\, C => 
        \clk_fcnt_en_tmr3\, Y => clk_fcnt_en_1);
    
    \n_rx_32bit_sreg[22]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[21]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNI0CAQ1\, CLR => 
        \spi_clr_maj_RNI0CAQ1_0\, Q => \n_rx_32bit_sreg_0[22]\);
    
    \spi_sm_maj_0_RNI6TP5[0]\ : NOR2A
      port map(A => N_63, B => \spi_sm_0[0]\, Y => 
        SPI_TIMEOUT_PULSE_i_0_a2_0_1);
    
    spi_clr_maj_RNITKFFR : NOR2B
      port map(A => tx_crc(3), B => \spi_clr\, Y => 
        \spi_clr_maj_RNITKFFR\);
    
    \rx_32bit_sreg[3]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI8R8E[3]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[3]\);
    
    \i_spi_rx_word_tmr3[30]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI26LJ[30]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[30]_net_1\);
    
    \i_spi_rx_word_maj[24]\ : MAJ3
      port map(A => \i_spi_rx_word[24]_net_1\, B => 
        \i_spi_rx_word_tmr2[24]_net_1\, C => 
        \i_spi_rx_word_tmr3[24]_net_1\, Y => \spi_rx_crc[0]\);
    
    \dtycyc_cnt_34\ : MX2A
      port map(A => N_296, B => dtycyc_cnt(4), S => 
        n_dtycyc_cnt_2_sqmuxa, Y => dtycyc_cnt_34);
    
    \rx_32bit_sreg[15]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNITEVR[15]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[15]\);
    
    \clk_fcnt_tmr2[4]\ : DFN0C1
      port map(D => \clk_fcnt_maj_RNI5GBL[4]_net_1\, CLK => GLB, 
        CLR => \spi_clr\, Q => \clk_fcnt_tmr2[4]_net_1\);
    
    \timeout_cnt_maj_RNIBK112[8]\ : XO1
      port map(A => \timeout_cnt[8]_net_1\, B => N_165, C => 
        N_304, Y => N_671);
    
    \rx_32bit_sreg[24]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNITG1S[24]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[24]\);
    
    \nullclk_cnt[2]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNIBVU22[2]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \nullclk_cnt_0[2]\);
    
    \i_spi_rx_word_maj_RNI4SEI[23]\ : XOR2
      port map(A => \spi_rx_word[1]\, B => \spi_rx_word[23]\, Y
         => un4_spi_rx_command_5_2);
    
    \P_TX_32BIT_REG_RNIJH6F[23]\ : MX2
      port map(A => \P_TX_32BIT_REG[23]_net_1\, B => 
        \P_TX_32BIT_REG[7]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_649);
    
    \n_rx_32bit_sreg_tmr3[0]\ : DFN1P1C1
      port map(D => sca_dat_out_c, CLK => GLB, PRE => 
        \spi_clr_maj_RNI02QU2\, CLR => \spi_clr_maj_RNI02QU2_0\, 
        Q => \n_rx_32bit_sreg_tmr3[0]_net_1\);
    
    \clk_fcnt_2c_maj[1]\ : MAJ3
      port map(A => \clk_fcnt_2c_0[1]\, B => 
        \clk_fcnt_2c_tmr2[1]_net_1\, C => 
        \clk_fcnt_2c_tmr3[1]_net_1\, Y => \clk_fcnt_2c[1]_net_1\);
    
    \rx_32bit_sreg_tmr3[0]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI2L8E[0]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[0]_net_1\);
    
    \i_spi_rx_word_maj[0]\ : MAJ3
      port map(A => \i_spi_rx_word[0]_net_1\, B => 
        \i_spi_rx_word_tmr2[0]_net_1\, C => 
        \i_spi_rx_word_tmr3[0]_net_1\, Y => \spi_rx_word[0]\);
    
    \n_rx_32bit_sreg[13]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[12]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIC9792\, CLR => 
        \spi_clr_maj_RNIC9792_0\, Q => \n_rx_32bit_sreg_0[13]\);
    
    \clk_fcnt_2c_maj_RNIJ3GG[0]\ : NOR2A
      port map(A => \clk_fcnt_2c[5]_net_1\, B => 
        \clk_fcnt_2c[0]_net_1\, Y => N_203_3);
    
    \nullclk_cnt_maj_RNI4LON1[2]\ : XAI1A
      port map(A => \nullclk_cnt[2]_net_1\, B => N_174, C => 
        N_186, Y => N_21);
    
    \clk_fcnt_1c[3]\ : DFN1C0
      port map(D => \clk_fcnt[3]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_0[3]\);
    
    \spi_sm[4]\ : DFN1C0
      port map(D => N_82, CLK => clk_5m_gl, CLR => gb_spi_rst_b, 
        Q => \spi_sm_0[4]\);
    
    \clk_fcnt_1c_tmr3[5]\ : DFN1C0
      port map(D => \clk_fcnt[5]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_tmr3[5]_net_1\);
    
    \rx_32bit_sreg_tmr3[5]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNICV8E[5]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[5]_net_1\);
    
    \rx_32bit_sreg_maj[29]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[29]\, B => 
        \rx_32bit_sreg_tmr2[29]_net_1\, C => 
        \rx_32bit_sreg_tmr3[29]_net_1\, Y => 
        \rx_32bit_sreg[29]_net_1\);
    
    \rx_32bit_sreg_tmr2[5]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNICV8E[5]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[5]_net_1\);
    
    \i_spi_rx_word_maj[7]\ : MAJ3
      port map(A => \i_spi_rx_word[7]_net_1\, B => 
        \i_spi_rx_word_tmr2[7]_net_1\, C => 
        \i_spi_rx_word_tmr3[7]_net_1\, Y => \spi_rx_word[7]\);
    
    spi_clr_maj_RNIMFUOM_0 : NOR2A
      port map(A => \spi_clr\, B => tx_crc(5), Y => 
        \spi_clr_maj_RNIMFUOM_0\);
    
    m82 : NOR2A
      port map(A => spi_rx_command_reg(0), B => J11_DEBUG_c_c(1), 
        Y => i43_mux_20);
    
    m89 : MX2
      port map(A => \channels_ready[5]\, B => i43_mux_22, S => 
        \N_63_0\, Y => \i42_mux_10\);
    
    \spi_sm_maj_RNIPNT5[2]\ : NOR2B
      port map(A => \spi_sm_ns_i_a2_0_a2_0_0[3]\, B => 
        \spi_sm[2]_net_1\, Y => N_215);
    
    \dtycyc_cnt_36\ : MX2
      port map(A => N_26_0, B => dtycyc_cnt(2), S => 
        n_dtycyc_cnt_2_sqmuxa, Y => dtycyc_cnt_36);
    
    spi_clr_maj_RNIG0632 : NOR2B
      port map(A => \i42_mux_8\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIG0632\);
    
    \i_spi_rx_word_tmr2[7]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIRNMK[7]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[7]_net_1\);
    
    \i_spi_rx_word_tmr2[13]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNILFVI[13]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[13]_net_1\);
    
    \i_spi_rx_word[25]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIACJJ[25]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[25]_net_1\);
    
    \clk_fcnt_maj_RNI5GBL[4]\ : MX2
      port map(A => \clk_fcnt[4]_net_1\, B => 
        \half_clk_fcnt[4]_net_1\, S => clk_fcnt_en_1, Y => 
        \clk_fcnt_maj_RNI5GBL[4]_net_1\);
    
    \timeout_cnt_maj_RNI85UB1[5]\ : XO1
      port map(A => \timeout_cnt[5]_net_1\, B => N_144, C => 
        N_304, Y => N_70);
    
    \n_rx_32bit_sreg_tmr3[12]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[11]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNI96792\, CLR => 
        \spi_clr_maj_RNI96792_0\, Q => 
        \n_rx_32bit_sreg_tmr3[12]_net_1\);
    
    \clk_fcnt_2c[4]\ : DFN1C0
      port map(D => \clk_fcnt_1c[4]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_0[4]\);
    
    \rx_32bit_sreg[11]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIL6VR[11]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[11]\);
    
    \i_spi_rx_word_tmr3[7]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIRNMK[7]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[7]_net_1\);
    
    \timeout_cnt_maj_RNI96KI2[9]\ : MX2
      port map(A => timeout_cnt_n9, B => \timeout_cnt[9]_net_1\, 
        S => N_530, Y => \timeout_cnt_maj_RNI96KI2[9]_net_1\);
    
    \sw2_sw5_channel_on_a_22\ : MX2B
      port map(A => sw2_sw5_channel_on_a(8), B => 
        SW2_SW3_CHANNEL_ON_BAR_c_5, S => N_210_i, Y => 
        sw2_sw5_channel_on_a_22);
    
    \timeout_cnt_maj[11]\ : MAJ3
      port map(A => \timeout_cnt_0[11]\, B => 
        \timeout_cnt_tmr2[11]_net_1\, C => 
        \timeout_cnt_tmr3[11]_net_1\, Y => 
        \timeout_cnt[11]_net_1\);
    
    \rx_32bit_sreg_tmr3[24]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNITG1S[24]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[24]_net_1\);
    
    spi_clk_2c_tmr2 : DFN1C0
      port map(D => \spi_clk_1c\, CLK => clk_5m_gl, CLR => 
        gb_spi_rst_b, Q => \spi_clk_2c_tmr2\);
    
    \n_rx_32bit_sreg[10]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[9]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIETKF1\, CLR => \spi_clr_maj_RNIETKF1_0\, 
        Q => \n_rx_32bit_sreg_0[10]\);
    
    \timeout_cnt_tmr2[3]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI05D81[3]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[3]_net_1\);
    
    \sw2_sw5_channel_on_a_18\ : MX2B
      port map(A => sw2_sw5_channel_on_a(4), B => 
        SW2_SW3_CHANNEL_ON_BAR_c_1, S => N_210_i, Y => 
        sw2_sw5_channel_on_a_18);
    
    \i_spi_rx_word_maj_RNICQ6MV[0]\ : MX2
      port map(A => channels_desired_on(1), B => 
        \channels_to_be_on[1]\, S => bad_crc_0_sqmuxa_1, Y => 
        i_spi_rx_word_maj_RNICQ6MV_0);
    
    spi_clr_maj : MAJ3
      port map(A => spi_clr_1, B => \spi_clr_tmr2\, C => 
        \spi_clr_tmr3\, Y => spi_clr_0);
    
    \n_rx_32bit_sreg_tmr3[9]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[8]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIB7ML1\, CLR => \spi_clr_maj_RNIB7ML1_0\, 
        Q => \n_rx_32bit_sreg_tmr3[9]_net_1\);
    
    \nullclk_cnt_maj_RNIA7OU[4]\ : OR2A
      port map(A => \nullclk_cnt[4]_net_1\, B => N_221, Y => 
        N_172);
    
    \rx_32bit_sreg_tmr3[14]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIRCVR[14]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[14]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[31]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[30]_net_1\, CLK => GLB, PRE
         => spi_slave_GND, CLR => \spi_clr\, Q => 
        \n_rx_32bit_sreg_tmr3[31]_net_1\);
    
    m91 : NOR2B
      port map(A => channels_desired_on(4), B => N_91, Y => 
        \channels_on[4]\);
    
    un1_clk_fcnt_I_35 : AND2
      port map(A => \clk_fcnt[2]_net_1\, B => \clk_fcnt[3]_net_1\, 
        Y => \DWACT_ADD_CI_0_pog_array_1[0]\);
    
    \i_spi_rx_word_maj_RNIEF7I2[20]\ : XOR3
      port map(A => un4_spi_rx_command_1_0, B => N_30, C => 
        un4_spi_rx_command_1_6, Y => un4_spi_rx_command_1_8);
    
    \i_spi_rx_word_maj_RNI503FV[6]\ : MX2
      port map(A => channels_desired_on(7), B => 
        \channels_to_be_on[7]\, S => bad_crc_0_sqmuxa_1, Y => 
        i_spi_rx_word_maj_RNI503FV_0);
    
    \n_rx_32bit_sreg_tmr2[25]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[24]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIETQ6Q\, CLR => 
        \spi_clr_maj_RNIETQ6Q_0\, Q => 
        \n_rx_32bit_sreg_tmr2[25]_net_1\);
    
    \timeout_cnt_tmr2[1]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI52BQ[1]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[1]_net_1\);
    
    \n_rx_32bit_sreg[16]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[15]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIRHQ62\, CLR => 
        \spi_clr_maj_RNIRHQ62_0\, Q => \n_rx_32bit_sreg_0[16]\);
    
    \i_spi_rx_word_maj_RNI46JJ[22]\ : MX2
      port map(A => \spi_rx_word[22]\, B => 
        \rx_32bit_sreg[22]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNI46JJ[22]_net_1\);
    
    \clk_fcnt_1c[1]\ : DFN1C0
      port map(D => \clk_fcnt[1]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_0[1]\);
    
    \timeout_cnt_tmr2[6]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNIBNNE3[6]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[6]_net_1\);
    
    \i_spi_rx_word_maj_RNITRC4V[8]\ : MX2
      port map(A => channels_desired_ready(1), B => 
        \spi_rx_word[8]\, S => bad_crc_0_sqmuxa_1, Y => 
        i_spi_rx_word_maj_RNITRC4V_0);
    
    \i_spi_rx_word_maj_RNIGGHJ[19]\ : MX2
      port map(A => \spi_rx_word[19]\, B => 
        \rx_32bit_sreg[19]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNIGGHJ[19]_net_1\);
    
    \spi_sm_tmr2[2]\ : DFN1C0
      port map(D => \spi_sm_maj_RNIMQL7[2]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \spi_sm_tmr2[2]_net_1\);
    
    \n_rx_32bit_sreg[12]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[11]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNI96792\, CLR => 
        \spi_clr_maj_RNI96792_0\, Q => \n_rx_32bit_sreg_0[12]\);
    
    m38 : MX2
      port map(A => bad_crc, B => i43_mux_2, S => \N_63_0\, Y => 
        \i42_mux_0\);
    
    \timeout_cnt_maj_RNIB67H1_0[6]\ : OA1C
      port map(A => \timeout_cnt[5]_net_1\, B => N_144, C => 
        \timeout_cnt[6]_net_1\, Y => N_208);
    
    \i_spi_rx_word[10]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNIF9VI[10]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[10]_net_1\);
    
    un1_clk_fcnt_I_22 : XOR2
      port map(A => \clk_fcnt[3]_net_1\, B => 
        \DWACT_ADD_CI_0_g_array_12[0]\, Y => I_22);
    
    \i_spi_rx_word_tmr2[26]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNICEJJ[26]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[26]_net_1\);
    
    \rx_32bit_sreg_maj[27]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[27]\, B => 
        \rx_32bit_sreg_tmr2[27]_net_1\, C => 
        \rx_32bit_sreg_tmr3[27]_net_1\, Y => 
        \rx_32bit_sreg[27]_net_1\);
    
    \P_TX_32BIT_REG_RNIIF5F[18]\ : MX2
      port map(A => \P_TX_32BIT_REG[18]_net_1\, B => 
        \P_TX_32BIT_REG[2]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_662);
    
    \i_spi_rx_word_maj_RNIAP35V[11]\ : MX2B
      port map(A => channels_desired_ready(4), B => N_28, S => 
        bad_crc_0_sqmuxa_1, Y => i_spi_rx_word_maj_RNIAP35V_0);
    
    \timeout_cnt_maj[14]\ : MAJ3
      port map(A => \timeout_cnt_0[14]\, B => 
        \timeout_cnt_tmr2[14]_net_1\, C => 
        \timeout_cnt_tmr3[14]_net_1\, Y => 
        \timeout_cnt[14]_net_1\);
    
    \clk_fcnt_tmr3[0]\ : DFN0C1
      port map(D => \half_clk_fcnt_maj_RNIT7BL[0]_net_1\, CLK => 
        GLB, CLR => \spi_clr\, Q => \clk_fcnt_tmr3[0]_net_1\);
    
    \half_clk_fcnt_maj_RNIBAAN2[1]\ : MX2
      port map(A => N_275, B => N_659, S => 
        \half_clk_fcnt[1]_net_1\, Y => N_283);
    
    spi_clk_2c_maj : MAJ3
      port map(A => spi_clk_2c_0, B => \spi_clk_2c_tmr2\, C => 
        \spi_clk_2c_tmr3\, Y => \spi_clk_2c\);
    
    \i_spi_rx_word_tmr2[18]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIEEHJ[18]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[18]_net_1\);
    
    \rx_32bit_sreg[25]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIVI1S[25]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[25]\);
    
    \clk_fcnt_2c_maj[0]\ : MAJ3
      port map(A => \clk_fcnt_2c_0[0]\, B => 
        \clk_fcnt_2c_tmr2[0]_net_1\, C => 
        \clk_fcnt_2c_tmr3[0]_net_1\, Y => \clk_fcnt_2c[0]_net_1\);
    
    \i_spi_rx_word_maj_RNIRNMK[7]\ : MX2
      port map(A => \spi_rx_word[7]\, B => 
        \rx_32bit_sreg[7]_net_1\, S => \spi_sm_1[0]\, Y => 
        \i_spi_rx_word_maj_RNIRNMK[7]_net_1\);
    
    \i_spi_rx_word_maj_RNI75E31[28]\ : XOR3
      port map(A => N_26, B => \spi_rx_word[17]\, C => 
        \spi_rx_crc[4]\, Y => un4_spi_rx_command_4_0);
    
    \rx_32bit_sreg_tmr3[20]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIL81S[20]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[20]_net_1\);
    
    m75 : NOR2A
      port map(A => spi_rx_command_reg(0), B => 
        SW4_SLAVE_PAIRS_BAR_c(3), Y => i43_mux_18);
    
    \clk_fcnt_maj[3]\ : MAJ3
      port map(A => \clk_fcnt_0[3]\, B => 
        \clk_fcnt_tmr2[3]_net_1\, C => \clk_fcnt_tmr3[3]_net_1\, 
        Y => \clk_fcnt[3]_net_1\);
    
    \rx_32bit_sreg_maj[16]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[16]\, B => 
        \rx_32bit_sreg_tmr2[16]_net_1\, C => 
        \rx_32bit_sreg_tmr3[16]_net_1\, Y => 
        \rx_32bit_sreg[16]_net_1\);
    
    i_spi_rx_strb_maj : MAJ3
      port map(A => i_spi_rx_strb_0, B => \i_spi_rx_strb_tmr2\, C
         => \i_spi_rx_strb_tmr3\, Y => i_spi_rx_strb_1);
    
    \nullclk_cnt[1]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNI0T8R1[1]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \nullclk_cnt_0[1]\);
    
    \rx_32bit_sreg_maj[15]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[15]\, B => 
        \rx_32bit_sreg_tmr2[15]_net_1\, C => 
        \rx_32bit_sreg_tmr3[15]_net_1\, Y => 
        \rx_32bit_sreg[15]_net_1\);
    
    \n_rx_32bit_sreg[30]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[29]_net_1\, CLK => GLB, PRE
         => spi_slave_GND, CLR => \spi_clr\, Q => 
        \n_rx_32bit_sreg_0[30]\);
    
    \clk_fcnt_2c_tmr2[4]\ : DFN1C0
      port map(D => \clk_fcnt_1c[4]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_tmr2[4]_net_1\);
    
    \timeout_cnt_tmr3[1]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI52BQ[1]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[1]_net_1\);
    
    \n_rx_32bit_sreg_maj[2]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[2]\, B => 
        \n_rx_32bit_sreg_tmr2[2]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[2]_net_1\, Y => 
        \n_rx_32bit_sreg[2]_net_1\);
    
    \i_spi_rx_word_maj_RNIB2EI[15]\ : NOR2B
      port map(A => \spi_rx_word[7]\, B => \spi_rx_word[15]\, Y
         => N_138);
    
    \half_clk_fcnt_maj_RNIBIF41[2]\ : MX2
      port map(A => N_286, B => N_663, S => 
        \half_clk_fcnt[2]_net_1\, Y => N_290);
    
    \timeout_cnt[11]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI9CE33[11]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[11]\);
    
    \rx_32bit_sreg_tmr3[10]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI47RJ[10]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[10]_net_1\);
    
    \i_spi_rx_word_maj_RNICCHJ[17]\ : MX2
      port map(A => \spi_rx_word[17]\, B => 
        \rx_32bit_sreg[17]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNICCHJ[17]_net_1\);
    
    \rx_32bit_sreg[2]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI6P8E[2]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[2]\);
    
    \P_TX_32BIT_REG[29]\ : DLN1
      port map(D => tx_crc(5), G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[29]_net_1\);
    
    m78 : NOR3C
      port map(A => channel_involtage_ok(3), B => STATUS_LED_c, C
         => active_switch_constraints(6), Y => \N_79\);
    
    \i_spi_rx_word_tmr2[29]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIIKJJ[29]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[29]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[26]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[25]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIRECDT\, CLR => 
        \spi_clr_maj_RNIRECDT_0\, Q => 
        \n_rx_32bit_sreg_tmr2[26]_net_1\);
    
    \i_spi_rx_word_tmr3[4]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNILHMK[4]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[4]_net_1\);
    
    \clk_fcnt_1c_maj[3]\ : MAJ3
      port map(A => \clk_fcnt_1c_0[3]\, B => 
        \clk_fcnt_1c_tmr2[3]_net_1\, C => 
        \clk_fcnt_1c_tmr3[3]_net_1\, Y => \clk_fcnt_1c[3]_net_1\);
    
    \OUT_CHANNEL_IAUX_1[2]\ : OA1A
      port map(A => J11_DEBUG_c_c(0), B => ch_out1(1), C => 
        channel_involtage_ok(1), Y => OUT_CHANNEL_IAUX_c(2));
    
    \i_spi_rx_word_tmr2[25]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIACJJ[25]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[25]_net_1\);
    
    \rx_32bit_sreg[21]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNINA1S[21]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[21]\);
    
    \n_rx_32bit_sreg_maj[17]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[17]\, B => 
        \n_rx_32bit_sreg_tmr2[17]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[17]_net_1\, Y => 
        \n_rx_32bit_sreg[17]_net_1\);
    
    un1_clk_fcnt_I_33 : NOR2B
      port map(A => \DWACT_ADD_CI_0_g_array_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2[0]\);
    
    \clk_fcnt_1c_maj[5]\ : MAJ3
      port map(A => \clk_fcnt_1c_0[5]\, B => 
        \clk_fcnt_1c_tmr2[5]_net_1\, C => 
        \clk_fcnt_1c_tmr3[5]_net_1\, Y => \clk_fcnt_1c[5]_net_1\);
    
    \i_spi_rx_word[20]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI02JJ[20]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[20]_net_1\);
    
    \rx_32bit_sreg_maj_RNINHVI[14]\ : MX2
      port map(A => \spi_rx_word[14]\, B => 
        \rx_32bit_sreg[14]_net_1\, S => \spi_sm_1[0]\, Y => 
        \rx_32bit_sreg_maj_RNINHVI[14]_net_1\);
    
    m84 : NOR3C
      port map(A => channel_involtage_ok(3), B => STATUS_LED_c, C
         => active_switch_constraints(5), Y => \N_85\);
    
    \i_spi_rx_word[8]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNITPMK[8]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[8]_net_1\);
    
    \spi_sm_tmr2[4]\ : DFN1C0
      port map(D => N_82, CLK => clk_5m_gl, CLR => gb_spi_rst_b, 
        Q => \spi_sm_tmr2[4]_net_1\);
    
    \i_spi_rx_word_maj_RNI8OBK3[17]\ : XOR3
      port map(A => un4_spi_rx_command_0_1, B => 
        un4_spi_rx_command_0_0, C => un4_spi_rx_command_0_5, Y
         => un4_spi_rx_command_0);
    
    \timeout_cnt_maj_RNI9CE33[11]\ : MX2
      port map(A => N_26_1, B => \timeout_cnt[11]_net_1\, S => 
        N_530, Y => \timeout_cnt_maj_RNI9CE33[11]_net_1\);
    
    \P_TX_32BIT_REG[15]\ : DLN1
      port map(D => \i42_mux_7\, G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[15]_net_1\);
    
    \i_spi_rx_word[1]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNIFBMK[1]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[1]_net_1\);
    
    \i_spi_rx_word_maj[6]\ : MAJ3
      port map(A => \i_spi_rx_word[6]_net_1\, B => 
        \i_spi_rx_word_tmr2[6]_net_1\, C => 
        \i_spi_rx_word_tmr3[6]_net_1\, Y => \spi_rx_word[6]\);
    
    m25 : XA1B
      port map(A => dtycyc_cnt(2), B => N_18_0, C => 
        un2_dutycycle_mode_1, Y => N_26_0);
    
    \i_spi_rx_word_tmr2[21]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI24JJ[21]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[21]_net_1\);
    
    \P_TX_32BIT_REG_RNINL6F[25]\ : MX2
      port map(A => \P_TX_32BIT_REG[25]_net_1\, B => 
        \P_TX_32BIT_REG[9]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_656);
    
    i_spi_rx_strb_tmr2 : DFN1C0
      port map(D => \spi_sm_0[0]\, CLK => clk_5m_gl, CLR => 
        gb_spi_rst_b, Q => \i_spi_rx_strb_tmr2\);
    
    \P_TX_32BIT_REG[21]\ : DLN1
      port map(D => \spi_tx_word[21]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[21]_net_1\);
    
    \timeout_cnt_maj_RNII9UV2[12]\ : XA1C
      port map(A => \timeout_cnt[12]_net_1\, B => N_173, C => 
        N_304, Y => N_29_0);
    
    \i_spi_rx_word[17]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNICCHJ[17]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[17]_net_1\);
    
    \half_clk_fcnt_maj_RNIIPF41[2]\ : MX2
      port map(A => N_271, B => N_652, S => 
        \half_clk_fcnt[2]_net_1\, Y => N_275);
    
    \n_rx_32bit_sreg_tmr3[24]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[23]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIB629M\, CLR => 
        \spi_clr_maj_RNIB629M_0\, Q => 
        \n_rx_32bit_sreg_tmr3[24]_net_1\);
    
    \i_spi_rx_word_maj[22]\ : MAJ3
      port map(A => \i_spi_rx_word[22]_net_1\, B => 
        \i_spi_rx_word_tmr2[22]_net_1\, C => 
        \i_spi_rx_word_tmr3[22]_net_1\, Y => \spi_rx_word[22]\);
    
    \timeout_cnt_maj[7]\ : MAJ3
      port map(A => \timeout_cnt_0[7]\, B => 
        \timeout_cnt_tmr2[7]_net_1\, C => 
        \timeout_cnt_tmr3[7]_net_1\, Y => \timeout_cnt[7]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[15]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[14]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIJ3632\, CLR => 
        \spi_clr_maj_RNIJ3632_0\, Q => 
        \n_rx_32bit_sreg_tmr2[15]_net_1\);
    
    \n_rx_32bit_sreg[1]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[0]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIIFHQ2\, CLR => \spi_clr_maj_RNIIFHQ2_0\, 
        Q => \n_rx_32bit_sreg_0[1]\);
    
    m90 : NOR3C
      port map(A => channel_involtage_ok(2), B => STATUS_LED_c, C
         => active_switch_constraints(4), Y => N_91);
    
    \n_rx_32bit_sreg_tmr2[31]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[30]_net_1\, CLK => GLB, PRE
         => spi_slave_GND, CLR => \spi_clr\, Q => 
        \n_rx_32bit_sreg_tmr2[31]_net_1\);
    
    \i_spi_rx_word_maj_RNIF8MHU[30]\ : NOR3C
      port map(A => SW5_IGNORE_CRC_BAR_c, B => 
        un4_spi_rx_command_NE, C => bad_crc_0_sqmuxa, Y => 
        bad_crc_1_sqmuxa);
    
    \i_spi_rx_word_maj_RNICIVG[21]\ : XOR3
      port map(A => \spi_rx_word[10]\, B => \spi_rx_word[12]\, C
         => \spi_rx_word[21]\, Y => un4_spi_rx_command_2_1);
    
    \timeout_cnt_maj[13]\ : MAJ3
      port map(A => \timeout_cnt_0[13]\, B => 
        \timeout_cnt_tmr2[13]_net_1\, C => 
        \timeout_cnt_tmr3[13]_net_1\, Y => 
        \timeout_cnt[13]_net_1\);
    
    spi_clr_maj_RNIB7ML1 : NOR2B
      port map(A => \spi_tx_word[9]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIB7ML1\);
    
    \i_spi_rx_word_maj_RNIU3GD[12]\ : MX2C
      port map(A => \spi_rx_word[12]\, B => \spi_rx_word[13]\, S
         => SW4_SLAVE_PAIRS_BAR_c(3), Y => N_135);
    
    \i_spi_rx_word_maj_RNIGIJJ[28]\ : MX2
      port map(A => \spi_rx_crc[4]\, B => 
        \rx_32bit_sreg[28]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNIGIJJ[28]_net_1\);
    
    \timeout_cnt_tmr3[4]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNIV7EF1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[4]_net_1\);
    
    \i_spi_rx_word_maj_RNIILKH1[1]\ : XOR3
      port map(A => \spi_rx_word[10]\, B => \spi_rx_word[1]\, C
         => un4_spi_rx_command_3_4, Y => un4_spi_rx_command_3_7);
    
    \clk_fcnt_1c_maj[4]\ : MAJ3
      port map(A => \clk_fcnt_1c_0[4]\, B => 
        \clk_fcnt_1c_tmr2[4]_net_1\, C => 
        \clk_fcnt_1c_tmr3[4]_net_1\, Y => \clk_fcnt_1c[4]_net_1\);
    
    \timeout_cnt[14]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI502C4[14]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \timeout_cnt_0[14]\);
    
    \clk_fcnt_1c_tmr3[0]\ : DFN1C0
      port map(D => \clk_fcnt[0]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_tmr3[0]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNI1L1S[26]\ : MX2
      port map(A => \rx_32bit_sreg[26]_net_1\, B => 
        \n_rx_32bit_sreg[26]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNI1L1S[26]_net_1\);
    
    \i_spi_rx_word_maj[16]\ : MAJ3
      port map(A => \i_spi_rx_word[16]_net_1\, B => 
        \i_spi_rx_word_tmr2[16]_net_1\, C => 
        \i_spi_rx_word_tmr3[16]_net_1\, Y => \spi_rx_word[16]\);
    
    \n_rx_32bit_sreg_tmr2[3]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[2]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNI70U52\, CLR => \spi_clr_maj_RNI70U52_0\, 
        Q => \n_rx_32bit_sreg_tmr2[3]_net_1\);
    
    \i_spi_rx_word_maj_RNINJMK[5]\ : MX2
      port map(A => \spi_rx_word[5]\, B => 
        \rx_32bit_sreg[5]_net_1\, S => \spi_sm_1[0]\, Y => 
        \i_spi_rx_word_maj_RNINJMK[5]_net_1\);
    
    \timeout_cnt_maj[4]\ : MAJ3
      port map(A => \timeout_cnt_0[4]\, B => 
        \timeout_cnt_tmr2[4]_net_1\, C => 
        \timeout_cnt_tmr3[4]_net_1\, Y => \timeout_cnt[4]_net_1\);
    
    \rx_32bit_sreg_tmr2[17]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI1JVR[17]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[17]_net_1\);
    
    \n_rx_32bit_sreg_maj[15]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[15]\, B => 
        \n_rx_32bit_sreg_tmr2[15]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[15]_net_1\, Y => 
        \n_rx_32bit_sreg[15]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[22]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[21]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNI0CAQ1\, CLR => 
        \spi_clr_maj_RNI0CAQ1_0\, Q => 
        \n_rx_32bit_sreg_tmr2[22]_net_1\);
    
    \half_clk_fcnt[3]\ : DFN1C1
      port map(D => I_22, CLK => GLB, CLR => \spi_clr\, Q => 
        \half_clk_fcnt_0[3]\);
    
    \nullclk_cnt_tmr2[4]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNI47BI2[4]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \nullclk_cnt_tmr2[4]_net_1\);
    
    \debounce.5.un32_sw2_sw3_channel_on_bar\ : NOR3B
      port map(A => sw2_sw5_channel_on_b(5), B => 
        sw2_sw5_channel_on_a(5), C => J11_DEBUG_c_c(7), Y => 
        un32_sw2_sw3_channel_on_bar);
    
    \rx_32bit_sreg_tmr2[19]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI5NVR[19]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[19]_net_1\);
    
    \i_spi_rx_word_maj_RNI1ODI[2]\ : NOR2B
      port map(A => \spi_rx_word[2]\, B => \spi_rx_word[10]\, Y
         => \channels_to_be_on[3]\);
    
    \i_spi_rx_word[14]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNINHVI[14]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[14]_net_1\);
    
    \sw2_sw5_channel_on_a_19\ : MX2B
      port map(A => sw2_sw5_channel_on_a(5), B => 
        J11_DEBUG_c_c(7), S => N_210_i, Y => 
        sw2_sw5_channel_on_a_19);
    
    \sw2_sw5_channel_on_a_17\ : MX2B
      port map(A => sw2_sw5_channel_on_a(3), B => 
        SW2_SW3_CHANNEL_ON_BAR_c_0, S => N_210_i, Y => 
        sw2_sw5_channel_on_a_17);
    
    \i_spi_rx_word[27]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIEGJJ[27]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[27]_net_1\);
    
    \rx_32bit_sreg_maj[20]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[20]\, B => 
        \rx_32bit_sreg_tmr2[20]_net_1\, C => 
        \rx_32bit_sreg_tmr3[20]_net_1\, Y => 
        \rx_32bit_sreg[20]_net_1\);
    
    \nullclk_cnt_maj[3]\ : MAJ3
      port map(A => \nullclk_cnt_0[3]\, B => 
        \nullclk_cnt_tmr2[3]_net_1\, C => 
        \nullclk_cnt_tmr3[3]_net_1\, Y => \nullclk_cnt[3]_net_1\);
    
    \i_spi_rx_word_tmr3[24]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI8AJJ[24]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[24]_net_1\);
    
    \sw2_sw5_channel_on_b_23\ : MX2
      port map(A => sw2_sw5_channel_on_b(1), B => 
        sw2_sw5_channel_on_a(1), S => N_210_i, Y => 
        sw2_sw5_channel_on_b_23);
    
    \n_rx_32bit_sreg_maj[22]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[22]\, B => 
        \n_rx_32bit_sreg_tmr2[22]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[22]_net_1\, Y => 
        \n_rx_32bit_sreg[22]_net_1\);
    
    \n_rx_32bit_sreg_maj[1]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[1]\, B => 
        \n_rx_32bit_sreg_tmr2[1]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[1]_net_1\, Y => 
        \n_rx_32bit_sreg[1]_net_1\);
    
    \i_spi_rx_word_maj_RNIQ5V29[13]\ : XO1
      port map(A => un4_spi_rx_command_1_7, B => 
        un4_spi_rx_command_1_8, C => un4_spi_rx_command_2, Y => 
        un4_spi_rx_command_NE_1);
    
    \OUT_CHANNEL_MREG_1[2]\ : OA1A
      port map(A => J11_DEBUG_c_c(0), B => ch_out1(2), C => 
        channel_involtage_ok(1), Y => OUT_CHANNEL_MREG_c_1);
    
    \n_rx_32bit_sreg_tmr2[16]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[15]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIRHQ62\, CLR => 
        \spi_clr_maj_RNIRHQ62_0\, Q => 
        \n_rx_32bit_sreg_tmr2[16]_net_1\);
    
    \rx_32bit_sreg_tmr2[9]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIK79E[9]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[9]_net_1\);
    
    \n_rx_32bit_sreg[2]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[1]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIMFTI2\, CLR => \spi_clr_maj_RNIMFTI2_0\, 
        Q => \n_rx_32bit_sreg_0[2]\);
    
    \timeout_cnt_maj_RNI0C3L[6]\ : NOR3C
      port map(A => \timeout_cnt[6]_net_1\, B => 
        \timeout_cnt[7]_net_1\, C => \timeout_cnt[5]_net_1\, Y
         => SPI_TIMEOUT_PULSE_i_0_a2_2_1);
    
    clk_fcnt_en_tmr3 : DFN1C0
      port map(D => \spi_sm_maj_RNIDU2E[3]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \clk_fcnt_en_tmr3\);
    
    \timeout_cnt_maj_RNII1HA[0]\ : XA1B
      port map(A => \spi_sm[1]_net_1\, B => 
        \timeout_cnt[0]_net_1\, C => N_304, Y => 
        \timeout_cnt_maj_RNII1HA[0]_net_1\);
    
    \timeout_cnt_maj_RNIER282[9]\ : XA1C
      port map(A => \timeout_cnt[9]_net_1\, B => N_166, C => 
        N_304, Y => timeout_cnt_n9);
    
    \timeout_cnt_maj_RNIIVPF[0]\ : XO1A
      port map(A => \timeout_cnt[0]_net_1\, B => 
        \timeout_cnt[1]_net_1\, C => N_304, Y => N_78);
    
    \timeout_cnt_maj_RNIP91G2[10]\ : XA1C
      port map(A => \timeout_cnt[10]_net_1\, B => N_180, C => 
        N_304, Y => N_24);
    
    \i_spi_rx_word_tmr3[1]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNIFBMK[1]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[1]_net_1\);
    
    \i_spi_rx_word[5]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNINJMK[5]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[5]_net_1\);
    
    \timeout_cnt_maj_RNINTCB3[12]\ : MX2
      port map(A => N_29_0, B => \timeout_cnt[12]_net_1\, S => 
        N_530, Y => \timeout_cnt_maj_RNINTCB3[12]_net_1\);
    
    \clk_fcnt[5]\ : DFN0C1
      port map(D => \half_clk_fcnt_maj_RNI7IBL[5]_net_1\, CLK => 
        GLB, CLR => \spi_clr\, Q => \clk_fcnt_0[5]\);
    
    \i_spi_rx_word_maj_RNICS171[3]\ : MX2C
      port map(A => \channels_to_be_on[3]\, B => N_36, S => 
        J11_DEBUG_c_c(1), Y => N_37);
    
    \clk_fcnt_2c_maj[3]\ : MAJ3
      port map(A => \clk_fcnt_2c_0[3]\, B => 
        \clk_fcnt_2c_tmr2[3]_net_1\, C => 
        \clk_fcnt_2c_tmr3[3]_net_1\, Y => \clk_fcnt_2c[3]_net_1\);
    
    \timeout_cnt_maj[5]\ : MAJ3
      port map(A => \timeout_cnt_0[5]\, B => 
        \timeout_cnt_tmr2[5]_net_1\, C => 
        \timeout_cnt_tmr3[5]_net_1\, Y => \timeout_cnt[5]_net_1\);
    
    \n_rx_32bit_sreg[3]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[2]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNI70U52\, CLR => \spi_clr_maj_RNI70U52_0\, 
        Q => \n_rx_32bit_sreg_0[3]\);
    
    \clk_fcnt_2c_maj[5]\ : MAJ3
      port map(A => \clk_fcnt_2c_0[5]\, B => 
        \clk_fcnt_2c_tmr2[5]_net_1\, C => 
        \clk_fcnt_2c_tmr3[5]_net_1\, Y => \clk_fcnt_2c[5]_net_1\);
    
    spi_clr_maj_RNIETQ6Q : NOR2B
      port map(A => tx_crc(1), B => \spi_clr\, Y => 
        \spi_clr_maj_RNIETQ6Q\);
    
    \P_TX_32BIT_REG[12]\ : DLN1
      port map(D => \i42_mux_10\, G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[12]_net_1\);
    
    \m31\ : NOR2A
      port map(A => J11_DEBUG_c_c(5), B => master_rst_b, Y => m31);
    
    \rx_32bit_sreg_tmr2[31]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIPE3S[31]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[31]_net_1\);
    
    \i_spi_rx_word_tmr3[0]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNID9MK[0]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[0]_net_1\);
    
    \i_spi_rx_word[24]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI8AJJ[24]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[24]_net_1\);
    
    \half_clk_fcnt_tmr3[2]\ : DFN1C1
      port map(D => I_23, CLK => GLB, CLR => \spi_clr\, Q => 
        \half_clk_fcnt_tmr3[2]_net_1\);
    
    \half_clk_fcnt_maj_RNI1GBI[3]\ : MX2
      port map(A => N_664, B => N_665, S => 
        \half_clk_fcnt[3]_net_1\, Y => N_666);
    
    \spi_sm_maj[1]\ : MAJ3
      port map(A => \spi_sm_0[1]\, B => \spi_sm_tmr2[1]_net_1\, C
         => \spi_sm_tmr3[1]_net_1\, Y => \spi_sm[1]_net_1\);
    
    m17 : NOR2
      port map(A => dtycyc_cnt(1), B => dtycyc_cnt(0), Y => 
        N_18_0);
    
    i_spi_miso_tmr3 : DFN0C1
      port map(D => \i_spi_miso_maj_RNILQNM5\, CLK => GLB, CLR
         => \spi_sm[2]_net_1\, Q => \i_spi_miso_tmr3\);
    
    \n_rx_32bit_sreg_tmr3[27]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[26]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNITKFFR\, CLR => 
        \spi_clr_maj_RNITKFFR_0\, Q => 
        \n_rx_32bit_sreg_tmr3[27]_net_1\);
    
    \nullclk_cnt_maj_RNIQJ2G1[0]\ : XAI1
      port map(A => \nullclk_cnt[0]_net_1\, B => 
        \nullclk_cnt[1]_net_1\, C => N_186, Y => N_23);
    
    \clk_fcnt_maj[5]\ : MAJ3
      port map(A => \clk_fcnt_0[5]\, B => 
        \clk_fcnt_tmr2[5]_net_1\, C => \clk_fcnt_tmr3[5]_net_1\, 
        Y => \clk_fcnt[5]_net_1\);
    
    \rx_32bit_sreg[12]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIN8VR[12]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[12]\);
    
    \n_rx_32bit_sreg_maj_RNI5NVR[19]\ : MX2
      port map(A => \rx_32bit_sreg[19]_net_1\, B => 
        \n_rx_32bit_sreg[19]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNI5NVR[19]_net_1\);
    
    m57 : MX2A
      port map(A => channel_involtage_ok(3), B => i43_mux_10, S
         => \N_63_0\, Y => \spi_tx_word[18]\);
    
    \i_spi_rx_word_maj_RNIM0IP[0]\ : NOR2B
      port map(A => \spi_rx_word[0]\, B => \spi_rx_word[8]\, Y
         => \channels_to_be_on[1]\);
    
    spi_clk_1c : DFN1C0
      port map(D => GLB, CLK => clk_5m_gl, CLR => gb_spi_rst_b, Q
         => spi_clk_1c_0);
    
    \rx_32bit_sreg_maj[18]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[18]\, B => 
        \rx_32bit_sreg_tmr2[18]_net_1\, C => 
        \rx_32bit_sreg_tmr3[18]_net_1\, Y => 
        \rx_32bit_sreg[18]_net_1\);
    
    spi_clr_maj_RNIGVKF1_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[11]\, Y => 
        \spi_clr_maj_RNIGVKF1_0\);
    
    \rx_32bit_sreg_tmr2[27]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI3N1S[27]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[27]_net_1\);
    
    \clk_fcnt_tmr2[2]\ : DFN0C1
      port map(D => \half_clk_fcnt_maj_RNI1CBL[2]_net_1\, CLK => 
        GLB, CLR => \spi_clr\, Q => \clk_fcnt_tmr2[2]_net_1\);
    
    \rx_32bit_sreg_tmr2[29]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI7R1S[29]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[29]_net_1\);
    
    \P_TX_32BIT_REG[18]\ : DLN1
      port map(D => \spi_tx_word[18]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[18]_net_1\);
    
    \rx_32bit_sreg_tmr3[25]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIVI1S[25]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[25]_net_1\);
    
    \P_TX_32BIT_REG_RNI4RE2[12]\ : MX2
      port map(A => \P_TX_32BIT_REG[28]_net_1\, B => 
        \P_TX_32BIT_REG[12]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_664);
    
    \i_spi_rx_word_maj_RNIG4N301[5]\ : MX2B
      port map(A => channels_desired_on(6), B => N_141, S => 
        bad_crc_0_sqmuxa_1, Y => i_spi_rx_word_maj_RNIG4N301_0);
    
    \rx_32bit_sreg_tmr3[31]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIPE3S[31]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[31]_net_1\);
    
    \rx_32bit_sreg_tmr3[15]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNITEVR[15]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[15]_net_1\);
    
    \rx_32bit_sreg_tmr2[14]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIRCVR[14]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[14]_net_1\);
    
    \half_clk_fcnt_maj[5]\ : MAJ3
      port map(A => \half_clk_fcnt_0[5]\, B => 
        \half_clk_fcnt_tmr2[5]_net_1\, C => 
        \half_clk_fcnt_tmr3[5]_net_1\, Y => 
        \half_clk_fcnt[5]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNITEVR[15]\ : MX2
      port map(A => \rx_32bit_sreg[15]_net_1\, B => 
        \n_rx_32bit_sreg[15]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNITEVR[15]_net_1\);
    
    spi_clr_maj_RNIB7ML1_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[9]\, Y => 
        \spi_clr_maj_RNIB7ML1_0\);
    
    \i_spi_rx_word_maj_RNICN8TU[12]\ : MX2
      port map(A => channels_desired_ready(5), B => 
        \spi_rx_word[12]\, S => bad_crc_0_sqmuxa_1, Y => 
        i_spi_rx_word_maj_RNICN8TU_0);
    
    \clk_fcnt_maj_RNI3EBL[3]\ : MX2
      port map(A => \clk_fcnt[3]_net_1\, B => 
        \half_clk_fcnt[3]_net_1\, S => clk_fcnt_en_1, Y => 
        \clk_fcnt_maj_RNI3EBL[3]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[12]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[11]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNI96792\, CLR => 
        \spi_clr_maj_RNI96792_0\, Q => 
        \n_rx_32bit_sreg_tmr2[12]_net_1\);
    
    m33 : MX2
      port map(A => spi_timeout, B => i43_mux_0, S => \N_63_0\, Y
         => \i42_mux\);
    
    \i_spi_rx_word[7]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIRNMK[7]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[7]_net_1\);
    
    \spi_sm_maj_RNIMFV51[4]\ : MX2
      port map(A => \spi_sm[4]_net_1\, B => \spi_clr\, S => 
        un1_spi_sm_5, Y => \spi_sm_maj_RNIMFV51[4]_net_1\);
    
    m71 : MX2
      port map(A => \channels_ready[8]\, B => i43_mux_16, S => 
        \N_63_0\, Y => \i42_mux_7\);
    
    \n_rx_32bit_sreg_maj[5]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[5]\, B => 
        \n_rx_32bit_sreg_tmr2[5]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[5]_net_1\, Y => 
        \n_rx_32bit_sreg[5]_net_1\);
    
    \clk_fcnt_2c_maj[4]\ : MAJ3
      port map(A => \clk_fcnt_2c_0[4]\, B => 
        \clk_fcnt_2c_tmr2[4]_net_1\, C => 
        \clk_fcnt_2c_tmr3[4]_net_1\, Y => \clk_fcnt_2c[4]_net_1\);
    
    un1_clk_fcnt_I_27 : NOR2B
      port map(A => \DWACT_ADD_CI_0_TMP[0]\, B => 
        \clk_fcnt[1]_net_1\, Y => \DWACT_ADD_CI_0_g_array_1[0]\);
    
    \n_rx_32bit_sreg_maj_RNI47RJ[10]\ : MX2
      port map(A => \rx_32bit_sreg[10]_net_1\, B => 
        \n_rx_32bit_sreg[10]_net_1\, S => clk_fcnt_en_1, Y => 
        \n_rx_32bit_sreg_maj_RNI47RJ[10]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNIPAVR[13]\ : MX2
      port map(A => \rx_32bit_sreg[13]_net_1\, B => 
        \n_rx_32bit_sreg[13]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNIPAVR[13]_net_1\);
    
    \n_rx_32bit_sreg[25]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[24]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIETQ6Q\, CLR => 
        \spi_clr_maj_RNIETQ6Q_0\, Q => \n_rx_32bit_sreg_0[25]\);
    
    \i_spi_rx_word_maj_RNI4PT0V[20]\ : MX2
      port map(A => spi_dutycycle_mode, B => \spi_rx_word[20]\, S
         => bad_crc_0_sqmuxa_1, Y => i_spi_rx_word_maj_RNI4PT0V_0);
    
    \rx_32bit_sreg_maj[5]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[5]\, B => 
        \rx_32bit_sreg_tmr2[5]_net_1\, C => 
        \rx_32bit_sreg_tmr3[5]_net_1\, Y => 
        \rx_32bit_sreg[5]_net_1\);
    
    \clk_fcnt_2c[3]\ : DFN1C0
      port map(D => \clk_fcnt_1c[3]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_0[3]\);
    
    \P_TX_32BIT_REG[25]\ : DLN1
      port map(D => tx_crc(1), G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[25]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[3]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[2]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNI70U52\, CLR => \spi_clr_maj_RNI70U52_0\, 
        Q => \n_rx_32bit_sreg_tmr3[3]_net_1\);
    
    \i_spi_rx_word_maj_RNIGR8TU[14]\ : MX2
      port map(A => channels_desired_ready(7), B => 
        \spi_rx_word[14]\, S => bad_crc_0_sqmuxa_1, Y => 
        i_spi_rx_word_maj_RNIGR8TU_0);
    
    spi_clr_maj_RNI2IJO1 : NOR2B
      port map(A => \spi_tx_word[7]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNI2IJO1\);
    
    \P_TX_32BIT_REG[10]\ : DLN1
      port map(D => \spi_tx_word[10]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[10]_net_1\);
    
    \sw2_sw5_channel_on_a_16\ : MX2B
      port map(A => sw2_sw5_channel_on_a(2), B => 
        J11_DEBUG_c_c(2), S => N_210_i, Y => 
        sw2_sw5_channel_on_a_16);
    
    \n_rx_32bit_sreg_tmr3[20]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[19]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNI5CPP1\, CLR => 
        \spi_clr_maj_RNI5CPP1_0\, Q => 
        \n_rx_32bit_sreg_tmr3[20]_net_1\);
    
    \i_spi_rx_word_maj_RNIUTF31[20]\ : XOR3
      port map(A => \spi_rx_word[31]\, B => \spi_rx_word[20]\, C
         => un4_spi_rx_command_2_2, Y => un4_spi_rx_command_2_7);
    
    \i_spi_rx_word_maj[19]\ : MAJ3
      port map(A => \i_spi_rx_word[19]_net_1\, B => 
        \i_spi_rx_word_tmr2[19]_net_1\, C => 
        \i_spi_rx_word_tmr3[19]_net_1\, Y => \spi_rx_word[19]\);
    
    \rx_32bit_sreg_tmr2[0]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI2L8E[0]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[0]_net_1\);
    
    \i_spi_rx_word_maj_RNI90EI[6]\ : NOR2B
      port map(A => \spi_rx_word[6]\, B => \spi_rx_word[14]\, Y
         => \channels_to_be_on[7]\);
    
    \clk_fcnt_1c[0]\ : DFN1C0
      port map(D => \clk_fcnt[0]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_0[0]\);
    
    \P_TX_32BIT_REG[16]\ : DLN1
      port map(D => \spi_tx_word[16]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[16]_net_1\);
    
    clk_fcnt_en : DFN1C0
      port map(D => \spi_sm_maj_RNIDU2E[3]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \clk_fcnt_en\);
    
    \n_rx_32bit_sreg_tmr3[14]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[13]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIG0632\, CLR => 
        \spi_clr_maj_RNIG0632_0\, Q => 
        \n_rx_32bit_sreg_tmr3[14]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNI6P8E[2]\ : MX2
      port map(A => \rx_32bit_sreg[2]_net_1\, B => 
        \n_rx_32bit_sreg[2]_net_1\, S => clk_fcnt_en_1, Y => 
        \n_rx_32bit_sreg_maj_RNI6P8E[2]_net_1\);
    
    \n_rx_32bit_sreg_maj[8]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[8]\, B => 
        \n_rx_32bit_sreg_tmr2[8]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[8]_net_1\, Y => 
        \n_rx_32bit_sreg[8]_net_1\);
    
    \rx_32bit_sreg_tmr2[2]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI6P8E[2]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[2]_net_1\);
    
    \OUT_CHANNEL_MREG_1[6]\ : OA1A
      port map(A => SW4_SLAVE_PAIRS_BAR_c(3), B => ch_out1_0(2), 
        C => channel_involtage_ok(3), Y => OUT_CHANNEL_MREG_c_5);
    
    \i_spi_rx_word_tmr3[20]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI02JJ[20]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[20]_net_1\);
    
    \i_spi_rx_word_maj_RNIS1NH1[13]\ : XOR3
      port map(A => \spi_rx_word[13]\, B => \spi_rx_word[31]\, C
         => un4_spi_rx_command_1_4, Y => un4_spi_rx_command_1_7);
    
    \rx_32bit_sreg_maj[2]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[2]\, B => 
        \rx_32bit_sreg_tmr2[2]_net_1\, C => 
        \rx_32bit_sreg_tmr3[2]_net_1\, Y => 
        \rx_32bit_sreg[2]_net_1\);
    
    \sw2_sw5_channel_on_b_24\ : MX2
      port map(A => sw2_sw5_channel_on_b(2), B => 
        sw2_sw5_channel_on_a(2), S => N_210_i, Y => 
        sw2_sw5_channel_on_b_24);
    
    \spi_sm_maj_RNIHHAU1[1]\ : AO1
      port map(A => SPI_TIMEOUT_PULSE_i_0_a2_0_1, B => N_219, C
         => N_202, Y => SPI_TIMEOUT_PULSE_i_0_0);
    
    \rx_32bit_sreg_tmr3[28]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI5P1S[28]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[28]_net_1\);
    
    \half_clk_fcnt_maj_RNISQ9N2[1]\ : MX2
      port map(A => N_290, B => N_670, S => 
        \half_clk_fcnt[1]_net_1\, Y => N_298);
    
    \timeout_cnt_maj_RNI3O463[13]\ : OR2A
      port map(A => \timeout_cnt[13]_net_1\, B => N_177, Y => 
        N_181);
    
    \half_clk_fcnt_maj[0]\ : MAJ3
      port map(A => \half_clk_fcnt_0[0]\, B => 
        \half_clk_fcnt_tmr2[0]_net_1\, C => 
        \half_clk_fcnt_tmr3[0]_net_1\, Y => 
        \half_clk_fcnt[0]_net_1\);
    
    \timeout_cnt_maj_RNIL6R61[11]\ : NOR3B
      port map(A => SPI_TIMEOUT_PULSE_i_0_a2_1_0, B => 
        \timeout_cnt[11]_net_1\, C => N_167, Y => 
        SPI_TIMEOUT_PULSE_i_0_a2_1_2);
    
    \n_rx_32bit_sreg_maj[3]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[3]\, B => 
        \n_rx_32bit_sreg_tmr2[3]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[3]_net_1\, Y => 
        \n_rx_32bit_sreg[3]_net_1\);
    
    m73 : NOR2B
      port map(A => channels_desired_ready(7), B => N_73, Y => 
        \channels_ready[7]\);
    
    m21 : XA1C
      port map(A => dtycyc_cnt(4), B => N_20_0, C => 
        un2_dutycycle_mode_1, Y => N_296);
    
    \timeout_cnt_tmr2[9]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI96KI2[9]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[9]_net_1\);
    
    \rx_32bit_sreg_tmr2[10]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI47RJ[10]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[10]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNINA1S[21]\ : MX2
      port map(A => \rx_32bit_sreg[21]_net_1\, B => 
        \n_rx_32bit_sreg[21]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNINA1S[21]_net_1\);
    
    \clk_fcnt_2c[1]\ : DFN1C0
      port map(D => \clk_fcnt_1c[1]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_2c_0[1]\);
    
    spi_clr_maj_RNI70U52 : NOR2B
      port map(A => \i42_mux_11\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNI70U52\);
    
    \rx_32bit_sreg_tmr3[18]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI3LVR[18]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[18]_net_1\);
    
    \rx_32bit_sreg[22]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIPC1S[22]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => \rx_32bit_sreg_0[22]\);
    
    spi_clr_maj_RNI0CAQ1_0 : NOR2A
      port map(A => \spi_clr\, B => \i42_mux_0\, Y => 
        \spi_clr_maj_RNI0CAQ1_0\);
    
    \n_rx_32bit_sreg_maj_RNI5P1S[28]\ : MX2
      port map(A => \rx_32bit_sreg[28]_net_1\, B => 
        \n_rx_32bit_sreg[28]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNI5P1S[28]_net_1\);
    
    \i_spi_rx_word[2]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNIHDMK[2]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word[2]_net_1\);
    
    \P_TX_32BIT_REG_RNILJ6F[24]\ : MX2
      port map(A => \P_TX_32BIT_REG[24]_net_1\, B => 
        \P_TX_32BIT_REG[8]_net_1\, S => \half_clk_fcnt[4]_net_1\, 
        Y => N_667);
    
    \n_rx_32bit_sreg_maj[18]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[18]\, B => 
        \n_rx_32bit_sreg_tmr2[18]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[18]_net_1\, Y => 
        \n_rx_32bit_sreg[18]_net_1\);
    
    \timeout_cnt_maj_RNI3SDC5[14]\ : OA1B
      port map(A => \timeout_cnt[14]_net_1\, B => N_223, C => 
        SPI_TIMEOUT_PULSE_i_0_0, Y => \spi_timeout_pulse_i_1\);
    
    \n_rx_32bit_sreg[0]\ : DFN1P1C1
      port map(D => sca_dat_out_c, CLK => GLB, PRE => 
        \spi_clr_maj_RNI02QU2\, CLR => \spi_clr_maj_RNI02QU2_0\, 
        Q => \n_rx_32bit_sreg_0[0]\);
    
    \i_spi_rx_word_maj_RNIPJVI[15]\ : MX2
      port map(A => \spi_rx_word[15]\, B => 
        \rx_32bit_sreg[15]_net_1\, S => \spi_sm_1[0]\, Y => 
        \i_spi_rx_word_maj_RNIPJVI[15]_net_1\);
    
    \i_spi_rx_word_maj[26]\ : MAJ3
      port map(A => \i_spi_rx_word[26]_net_1\, B => 
        \i_spi_rx_word_tmr2[26]_net_1\, C => 
        \i_spi_rx_word_tmr3[26]_net_1\, Y => \spi_rx_crc[2]\);
    
    \timeout_cnt_maj_RNIS69E2[10]\ : OR2
      port map(A => N_167, B => N_166, Y => N_169);
    
    \rx_32bit_sreg_tmr2[24]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNITG1S[24]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[24]_net_1\);
    
    \half_clk_fcnt_maj_RNI7IBL[5]\ : MX2
      port map(A => \clk_fcnt[5]_net_1\, B => 
        \half_clk_fcnt[5]_net_1\, S => clk_fcnt_en_1, Y => 
        \half_clk_fcnt_maj_RNI7IBL[5]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[9]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[8]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIB7ML1\, CLR => \spi_clr_maj_RNIB7ML1_0\, 
        Q => \n_rx_32bit_sreg_tmr2[9]_net_1\);
    
    \i_spi_rx_word_maj_RNI64E31[27]\ : XOR3
      port map(A => N_26, B => \spi_rx_word[17]\, C => 
        \spi_rx_crc[3]\, Y => un4_spi_rx_command_3_0);
    
    \P_TX_32BIT_REG[7]\ : DLN1
      port map(D => \spi_tx_word[7]\, G => \spi_sm[2]_net_1\, Q
         => \P_TX_32BIT_REG[7]_net_1\);
    
    \n_rx_32bit_sreg_tmr2[4]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[3]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNIRNKU1\, CLR => \spi_clr_maj_RNIRNKU1_0\, 
        Q => \n_rx_32bit_sreg_tmr2[4]_net_1\);
    
    \rx_32bit_sreg_tmr2[8]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNII59E[8]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[8]_net_1\);
    
    \n_rx_32bit_sreg[8]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[7]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNI95ML1\, CLR => \spi_clr_maj_RNI95ML1_0\, 
        Q => \n_rx_32bit_sreg_0[8]\);
    
    \n_rx_32bit_sreg[15]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[14]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIJ3632\, CLR => 
        \spi_clr_maj_RNIJ3632_0\, Q => \n_rx_32bit_sreg_0[15]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \spi_sm_maj_0[0]\ : MAJ3
      port map(A => \spi_sm[0]_net_1\, B => 
        \spi_sm_tmr2[0]_net_1\, C => \spi_sm_tmr3[0]_net_1\, Y
         => \spi_sm_0[0]\);
    
    \i_spi_rx_word_tmr3[17]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNICCHJ[17]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[17]_net_1\);
    
    spi_clr_maj_RNIRC3M1 : NOR2B
      port map(A => \spi_tx_word[21]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNIRC3M1\);
    
    \i_spi_rx_word_maj_RNIT0AB[19]\ : XOR2
      port map(A => \spi_rx_word[19]\, B => \spi_rx_word[14]\, Y
         => un4_spi_rx_command_1_2);
    
    spi_clr_maj_RNIN9UQQ_0 : NOR2A
      port map(A => \spi_clr\, B => tx_crc(4), Y => 
        \spi_clr_maj_RNIN9UQQ_0\);
    
    \n_rx_32bit_sreg_tmr2[5]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[4]_net_1\, CLK => GLB, PRE => 
        \spi_clr_maj_RNITPKU1\, CLR => \spi_clr_maj_RNITPKU1_0\, 
        Q => \n_rx_32bit_sreg_tmr2[5]_net_1\);
    
    \i_spi_rx_word_maj_RNI7UDI[5]\ : NOR2B
      port map(A => \spi_rx_word[5]\, B => \spi_rx_word[13]\, Y
         => N_140);
    
    \n_rx_32bit_sreg_maj_RNITG1S[24]\ : MX2
      port map(A => \rx_32bit_sreg[24]_net_1\, B => 
        \n_rx_32bit_sreg[24]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNITG1S[24]_net_1\);
    
    \half_clk_fcnt_maj_RNIV9BL[1]\ : MX2
      port map(A => \clk_fcnt[1]_net_1\, B => 
        \half_clk_fcnt[1]_net_1\, S => clk_fcnt_en_1, Y => 
        \half_clk_fcnt_maj_RNIV9BL[1]_net_1\);
    
    \rx_32bit_sreg_tmr3[2]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNI6P8E[2]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[2]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNIPE3S[31]\ : MX2
      port map(A => \rx_32bit_sreg[31]_net_1\, B => 
        \n_rx_32bit_sreg[31]_net_1\, S => clk_fcnt_en_0, Y => 
        \n_rx_32bit_sreg_maj_RNIPE3S[31]_net_1\);
    
    \spi_sm[5]\ : DFN1P0
      port map(D => \spi_sm_1[0]\, CLK => clk_5m_gl, PRE => 
        gb_spi_rst_b, Q => \spi_sm_0[5]\);
    
    \nullclk_cnt_tmr3[0]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNIESSB1[0]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \nullclk_cnt_tmr3[0]_net_1\);
    
    m23 : XA1B
      port map(A => dtycyc_cnt(3), B => N_19_0, C => 
        un2_dutycycle_mode_1, Y => N_24_0);
    
    \nullclk_cnt_tmr3[3]\ : DFN1C0
      port map(D => \nullclk_cnt_maj_RNIN2LA2[3]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \nullclk_cnt_tmr3[3]_net_1\);
    
    \i_spi_rx_word_tmr3[22]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI46JJ[22]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr3[22]_net_1\);
    
    \timeout_cnt_tmr3[6]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNIBNNE3[6]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[6]_net_1\);
    
    \i_spi_rx_word_maj_RNIEEHJ[18]\ : MX2
      port map(A => \spi_rx_word[18]\, B => 
        \rx_32bit_sreg[18]_net_1\, S => \spi_sm_0[0]\, Y => 
        \i_spi_rx_word_maj_RNIEEHJ[18]_net_1\);
    
    \half_clk_fcnt_maj_RNIT7BL[0]\ : MX2
      port map(A => \clk_fcnt[0]_net_1\, B => 
        \half_clk_fcnt[0]_net_1\, S => clk_fcnt_en_1, Y => 
        \half_clk_fcnt_maj_RNIT7BL[0]_net_1\);
    
    \P_TX_32BIT_REG[13]\ : DLN1
      port map(D => \i42_mux_9\, G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[13]_net_1\);
    
    spi_clr_tmr2 : DFN1P0
      port map(D => \spi_sm_maj_RNIMFV51[4]_net_1\, CLK => 
        clk_5m_gl, PRE => gb_spi_rst_b, Q => \spi_clr_tmr2\);
    
    \timeout_cnt_tmr3[0]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNII1HA[0]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr3[0]_net_1\);
    
    m18_0 : MX2C
      port map(A => N_17_0, B => J11_DEBUG_c_c(4), S => 
        spi_tx_word_sn_N_3, Y => \SPI_TX_WORD_i_1[1]\);
    
    spi_clr_maj_RNIJ3632_0 : NOR2A
      port map(A => \spi_clr\, B => \i42_mux_7\, Y => 
        \spi_clr_maj_RNIJ3632_0\);
    
    m70 : NOR2A
      port map(A => spi_rx_command_reg(0), B => 
        SW4_SLAVE_PAIRS_BAR_c(4), Y => i43_mux_16);
    
    i_spi_miso : DFN0C1
      port map(D => \i_spi_miso_maj_RNILQNM5\, CLK => GLB, CLR
         => \spi_sm[2]_net_1\, Q => \i_spi_miso\);
    
    \rx_32bit_sreg_maj[13]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[13]\, B => 
        \rx_32bit_sreg_tmr2[13]_net_1\, C => 
        \rx_32bit_sreg_tmr3[13]_net_1\, Y => 
        \rx_32bit_sreg[13]_net_1\);
    
    \half_clk_fcnt[1]\ : DFN1C1
      port map(D => I_24, CLK => GLB, CLR => \spi_clr\, Q => 
        \half_clk_fcnt_0[1]\);
    
    \nullclk_cnt_maj[2]\ : MAJ3
      port map(A => \nullclk_cnt_0[2]\, B => 
        \nullclk_cnt_tmr2[2]_net_1\, C => 
        \nullclk_cnt_tmr3[2]_net_1\, Y => \nullclk_cnt[2]_net_1\);
    
    m41 : NOR2B
      port map(A => active_switch_constraints(6), B => 
        spi_rx_command_reg(0), Y => i43_mux_4);
    
    \timeout_cnt_maj_RNIL66U2[12]\ : OR2A
      port map(A => \timeout_cnt[12]_net_1\, B => N_173, Y => 
        N_177);
    
    spi_clr_maj_RNIN9UQQ : NOR2B
      port map(A => tx_crc(4), B => \spi_clr\, Y => 
        \spi_clr_maj_RNIN9UQQ\);
    
    \i_spi_rx_word_tmr2[9]\ : DFN1C0
      port map(D => \rx_32bit_sreg_maj_RNIVRMK[9]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[9]_net_1\);
    
    \i_spi_rx_word_maj[1]\ : MAJ3
      port map(A => \i_spi_rx_word[1]_net_1\, B => 
        \i_spi_rx_word_tmr2[1]_net_1\, C => 
        \i_spi_rx_word_tmr3[1]_net_1\, Y => \spi_rx_word[1]\);
    
    \spi_sm[2]\ : DFN1C0
      port map(D => \spi_sm_maj_RNIMQL7[2]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => \spi_sm_0_0[2]\);
    
    spi_clr_maj_RNIRHQ62_0 : NOR2A
      port map(A => \spi_clr\, B => \spi_tx_word[16]\, Y => 
        \spi_clr_maj_RNIRHQ62_0\);
    
    m12 : NOR2A
      port map(A => spi_rx_command_reg(1), B => 
        spi_rx_command_reg(0), Y => spi_tx_word_sn_N_3);
    
    m19 : NOR2A
      port map(A => N_19_0, B => dtycyc_cnt(3), Y => N_20_0);
    
    \rx_32bit_sreg_maj_RNILFVI[13]\ : MX2
      port map(A => \spi_rx_word[13]\, B => 
        \rx_32bit_sreg[13]_net_1\, S => \spi_sm_1[0]\, Y => 
        \rx_32bit_sreg_maj_RNILFVI[13]_net_1\);
    
    spi_clr_maj_RNI0GJO1 : NOR2B
      port map(A => \spi_tx_word[6]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNI0GJO1\);
    
    \i_spi_rx_word_maj_RNI7NSC7[8]\ : XO1
      port map(A => un4_spi_rx_command_4_5, B => 
        un4_spi_rx_command_4_6, C => un4_spi_rx_command_5, Y => 
        un4_spi_rx_command_NE_0);
    
    m52 : MX2A
      port map(A => channel_involtage_ok(4), B => i43_mux_8, S
         => \N_63_0\, Y => \spi_tx_word[19]\);
    
    \rx_32bit_sreg_tmr2[20]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIL81S[20]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr2[20]_net_1\);
    
    \clk_fcnt_1c_tmr3[3]\ : DFN1C0
      port map(D => \clk_fcnt[3]_net_1\, CLK => clk_5m_gl, CLR
         => gb_spi_rst_b, Q => \clk_fcnt_1c_tmr3[3]_net_1\);
    
    \rx_32bit_sreg_tmr3[22]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIPC1S[22]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[22]_net_1\);
    
    \P_TX_32BIT_REG[22]\ : DLN1
      port map(D => \i42_mux_0\, G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[22]_net_1\);
    
    \timeout_cnt_tmr2[7]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNI2NH42[7]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[7]_net_1\);
    
    \n_rx_32bit_sreg_maj[19]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[19]\, B => 
        \n_rx_32bit_sreg_tmr2[19]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[19]_net_1\, Y => 
        \n_rx_32bit_sreg[19]_net_1\);
    
    \half_clk_fcnt_tmr2[1]\ : DFN1C1
      port map(D => I_24, CLK => GLB, CLR => \spi_clr\, Q => 
        \half_clk_fcnt_tmr2[1]_net_1\);
    
    \timeout_cnt_maj_RNIB0ST[3]\ : XO1
      port map(A => \timeout_cnt[3]_net_1\, B => N_121, C => 
        N_304, Y => N_74);
    
    spi_clr_maj_RNI02QU2 : NOR2B
      port map(A => \spi_tx_word[0]\, B => \spi_clr\, Y => 
        \spi_clr_maj_RNI02QU2\);
    
    \i_spi_rx_word_maj_RNITS291[20]\ : XOR3
      port map(A => \spi_rx_word[20]\, B => N_26, C => 
        un4_spi_rx_command_1_2, Y => un4_spi_rx_command_1_6);
    
    \n_rx_32bit_sreg_maj[31]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[31]\, B => 
        \n_rx_32bit_sreg_tmr2[31]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[31]_net_1\, Y => 
        \n_rx_32bit_sreg[31]_net_1\);
    
    \n_rx_32bit_sreg_maj[0]\ : MAJ3
      port map(A => \n_rx_32bit_sreg_0[0]\, B => 
        \n_rx_32bit_sreg_tmr2[0]_net_1\, C => 
        \n_rx_32bit_sreg_tmr3[0]_net_1\, Y => 
        \n_rx_32bit_sreg[0]_net_1\);
    
    \n_rx_32bit_sreg_maj_RNII59E[8]\ : MX2
      port map(A => \rx_32bit_sreg[8]_net_1\, B => 
        \n_rx_32bit_sreg[8]_net_1\, S => clk_fcnt_en_1, Y => 
        \n_rx_32bit_sreg_maj_RNII59E[8]_net_1\);
    
    \rx_32bit_sreg_tmr3[12]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIN8VR[12]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[12]_net_1\);
    
    \i_spi_rx_word_maj_RNIO2IP[1]\ : NOR2B
      port map(A => \spi_rx_word[9]\, B => \spi_rx_word[1]\, Y
         => N_38);
    
    \i_spi_rx_word_tmr2[24]\ : DFN1C0
      port map(D => \i_spi_rx_word_maj_RNI8AJJ[24]_net_1\, CLK
         => clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \i_spi_rx_word_tmr2[24]_net_1\);
    
    \half_clk_fcnt_tmr2[5]\ : DFN1P1
      port map(D => \half_clk_fcnt_4[5]\, CLK => GLB, PRE => 
        \spi_clr\, Q => \half_clk_fcnt_tmr2[5]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[17]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[16]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIA89C1\, CLR => 
        \spi_clr_maj_RNIA89C1_0\, Q => 
        \n_rx_32bit_sreg_tmr3[17]_net_1\);
    
    \rx_32bit_sreg_maj[4]\ : MAJ3
      port map(A => \rx_32bit_sreg_0[4]\, B => 
        \rx_32bit_sreg_tmr2[4]_net_1\, C => 
        \rx_32bit_sreg_tmr3[4]_net_1\, Y => 
        \rx_32bit_sreg[4]_net_1\);
    
    \timeout_cnt_tmr2[0]\ : DFN1C0
      port map(D => \timeout_cnt_maj_RNII1HA[0]_net_1\, CLK => 
        clk_5m_gl, CLR => gb_spi_rst_b, Q => 
        \timeout_cnt_tmr2[0]_net_1\);
    
    \n_rx_32bit_sreg_tmr3[28]\ : DFN1P1C1
      port map(D => \rx_32bit_sreg[27]_net_1\, CLK => GLB, PRE
         => \spi_clr_maj_RNIN9UQQ\, CLR => 
        \spi_clr_maj_RNIN9UQQ_0\, Q => 
        \n_rx_32bit_sreg_tmr3[28]_net_1\);
    
    \P_TX_32BIT_REG[28]\ : DLN1
      port map(D => tx_crc(4), G => \spi_sm[2]_net_1\, Q => 
        \P_TX_32BIT_REG[28]_net_1\);
    
    un1_clk_fcnt_I_24 : XOR2
      port map(A => \clk_fcnt[1]_net_1\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, Y => I_24);
    
    \rx_32bit_sreg_tmr3[6]\ : DFN0C1
      port map(D => \n_rx_32bit_sreg_maj_RNIE19E[6]_net_1\, CLK
         => GLB, CLR => \spi_clr\, Q => 
        \rx_32bit_sreg_tmr3[6]_net_1\);
    
    \i_spi_rx_word_maj_RNICE591[26]\ : XOR3
      port map(A => N_30, B => \spi_rx_crc[2]\, C => 
        un4_spi_rx_command_2_1, Y => un4_spi_rx_command_2_6);
    
    \i_spi_rx_word_maj_RNIK18V[24]\ : XOR2
      port map(A => \spi_rx_crc[0]\, B => N_33, Y => 
        un4_spi_rx_command_0_0);
    
    \rx_32bit_sreg_maj_RNIVRMK[9]\ : MX2
      port map(A => \spi_rx_word[9]\, B => 
        \rx_32bit_sreg[9]_net_1\, S => \spi_sm_1[0]\, Y => 
        \rx_32bit_sreg_maj_RNIVRMK[9]_net_1\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity main_sequencer_new_3_1 is

    port( channels_on        : in    std_logic_vector(4 downto 3);
          ch_out1            : out   std_logic_vector(2 downto 1);
          ch_mreg_en_0       : out   std_logic;
          ch_iaux_en_0       : out   std_logic;
          OUT_CHANNEL_VOSG_c : out   std_logic_vector(4 downto 3);
          J11_DEBUG_c_c_0    : in    std_logic;
          channels_ready     : in    std_logic_vector(4 downto 3);
          master_rst_b       : in    std_logic;
          clk_5m_gl          : in    std_logic;
          dtycyc_en          : in    std_logic
        );

end main_sequencer_new_3_1;

architecture DEF_ARCH of main_sequencer_new_3_1 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component OA1A
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

  component NOR3
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

  component OR3
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

  component AND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component NOR3C
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

  component NOR2A
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

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component NOR3B
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

  component AO1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component MX2C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XA1
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

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_276_0, \sequencer_state1[0]_net_1\, N_380_0, 
        \sequencer_state0[0]_net_1\, 
        \sequencer_state0_ns_a2_0[4]\, \ret_state0[1]_net_1\, 
        \ret_state0[2]_net_1\, \sequencer_state1_ns_a2_0[3]\, 
        \ret_state1[2]_net_1\, \ret_state1[1]_net_1\, 
        \sequencer_state0_ns_a2_0[3]\, 
        \sequencer_state1_ns_a2_0[4]\, 
        \sequencer_state0_ns_i_0[2]\, 
        \sequencer_state0_ns_i_a2_0_0[2]\, N_374, N_359, 
        \sequencer_state1_ns_i_0[2]\, 
        \sequencer_state1_ns_i_a2_0_0[2]\, N_270, N_255, 
        \sequencer_state1_ns_a2_0_1[5]\, \ret_state1[0]_net_1\, 
        N_271, \ret_state1[5]_net_1\, 
        \sequencer_state0_ns_a2_0_1[5]\, \ret_state0[0]_net_1\, 
        N_375, \ret_state0[5]_net_1\, \sequencer_state1_ns_0[1]\, 
        \sequencer_state1[3]_net_1\, N_243, 
        \sequencer_state0_ns_0[1]\, \sequencer_state0[3]_net_1\, 
        N_347, \sequencer_state1_ns_a2_0[1]\, 
        \sequencer_state1[4]_net_1\, N_236, 
        \sequencer_state0_ns_a2_0[1]\, 
        \sequencer_state0[4]_net_1\, N_340, 
        \sequencer_state1_ns_a2_0[0]\, 
        \sequencer_state0_ns_a2_0[0]\, 
        \sequencer_state0_ns_a2_0_1[0]\, 
        \sequencer_state1_ns_a2_0_1[0]\, 
        \sequencer_state1_ns_a2_2_0[0]\, N_267, 
        \sequencer_state0_ns_a2_2_0[0]\, N_371, un6_del_cntr1_11, 
        un6_del_cntr1_2, un6_del_cntr1_1, un6_del_cntr1_7, 
        un6_del_cntr1_10, un6_del_cntr1_6, \del_cntr1[10]_net_1\, 
        \del_cntr1[9]_net_1\, un6_del_cntr1_9, un6_del_cntr1_4, 
        \del_cntr1[6]_net_1\, \del_cntr1[5]_net_1\, 
        \del_cntr1[1]_net_1\, \del_cntr1[14]_net_1\, 
        \del_cntr1[13]_net_1\, \del_cntr1[11]_net_1\, 
        \del_cntr1[12]_net_1\, \del_cntr1[7]_net_1\, 
        \del_cntr1[8]_net_1\, \del_cntr1[3]_net_1\, 
        \del_cntr1[4]_net_1\, \del_cntr1[2]_net_1\, 
        \del_cntr1[0]_net_1\, un5_del_cntr0_11, un5_del_cntr0_2, 
        un5_del_cntr0_1, un5_del_cntr0_7, un5_del_cntr0_10, 
        un5_del_cntr0_6, \del_cntr0[9]_net_1\, 
        \del_cntr0[10]_net_1\, un5_del_cntr0_9, un5_del_cntr0_4, 
        \del_cntr0[5]_net_1\, \del_cntr0[6]_net_1\, 
        \del_cntr0[2]_net_1\, \del_cntr0[14]_net_1\, 
        \del_cntr0[13]_net_1\, \del_cntr0[12]_net_1\, 
        \del_cntr0[11]_net_1\, \del_cntr0[8]_net_1\, 
        \del_cntr0[7]_net_1\, \del_cntr0[4]_net_1\, 
        \del_cntr0[3]_net_1\, \del_cntr0[1]_net_1\, 
        \del_cntr0[0]_net_1\, \sequencer_state0_ns_a2_0_0[1]\, 
        \ret_state0[4]_net_1\, \ret_state0[3]_net_1\, 
        \sequencer_state1_ns_a2_0_0[1]\, \ret_state1[4]_net_1\, 
        \ret_state1[3]_net_1\, N_254_1, N_358_1, un5_del_cntr0, 
        N_370, \sequencer_state0_ns[1]\, 
        \sequencer_state0_maj_RNINPBV[1]_net_1\, 
        \sequencer_state0[1]_net_1\, N_367, 
        \sequencer_state0_maj_RNIMOBV[2]_net_1\, 
        \sequencer_state0[2]_net_1\, N_368, 
        \sequencer_state1_ns[1]\, 
        \sequencer_state1_maj_RNIRL0E1[1]_net_1\, 
        \sequencer_state1[1]_net_1\, N_263, 
        \sequencer_state1_maj_RNIQK0E1[2]_net_1\, 
        \sequencer_state1[2]_net_1\, N_264, N_251, un6_del_cntr1, 
        N_238_i, \sequencer_state1_ns[3]\, N_274, 
        \sequencer_state1_ns[4]\, N_266, 
        \sequencer_state1_maj_RNI33AOA[5]_net_1\, N_253, N_355, 
        N_342_i, \sequencer_state0_ns[3]\, N_378, 
        \sequencer_state0_ns[4]\, 
        \sequencer_state0_maj_RNISNL68[5]_net_1\, N_357, 
        \ch_out1[0]_net_1\, \n_del_cntr1[0]\, N_275, N_260, 
        \DWACT_ADD_CI_0_partial_sum[0]\, \n_del_cntr1[1]\, I_56_3, 
        \n_del_cntr1[2]\, I_52_3, \n_del_cntr1[3]\, I_51_3, 
        \n_del_cntr1[4]\, I_53_3, \n_del_cntr1[5]\, I_62_3, 
        \n_del_cntr1[6]\, I_49_3, \n_del_cntr1[7]\, I_59_3, 
        \n_del_cntr1[8]\, I_57_3, \n_del_cntr1[9]\, I_55_3, 
        \n_del_cntr1[10]\, I_54_3, \n_del_cntr1[11]\, I_48_3, 
        \n_del_cntr1[12]\, I_50_3, \n_del_cntr1[13]\, I_60_3, 
        \n_del_cntr1[14]\, I_58_3, 
        \ch_out0_maj_RNID4O12[0]_net_1\, \n_ch_out0[0]\, 
        \OUT_CHANNEL_VOSG_c[3]\, \ch_out0_maj_RNIJ0941[1]_net_1\, 
        N_369, \ch_iaux_en[3]\, \ch_out0_maj_RNIE4KS[2]_net_1\, 
        N_353, \ch_mreg_en[3]\, \ch_out1_maj_RNIJ2DG2[0]_net_1\, 
        \n_ch_out1[0]\, \ch_out1_maj_RNIO3JM1[1]_net_1\, N_265, 
        \ch_out1[1]_net_1\, \ch_out1_maj_RNII09B1[2]_net_1\, 
        N_249, \ch_out1[2]_net_1\, \sequencer_state0[5]_net_1\, 
        N_362, \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, 
        \sequencer_state0_ns[0]\, \sequencer_state0_ns[5]\, 
        \ret_state0_maj_RNIU0CV[5]_net_1\, N_379, 
        \ret_state0_maj_RNITVBV[4]_net_1\, 
        \ret_state0_maj_RNISUBV[3]_net_1\, 
        \sequencer_state0_maj_RNIOQBV[3]_net_1\, 
        \sequencer_state1[5]_net_1\, un2_n_ch_out1, N_258, 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, 
        \sequencer_state1_ns[0]\, \sequencer_state1_ns[5]\, 
        \ret_state1_maj_RNI2T0E1[5]_net_1\, 
        \ret_state1_maj_RNI1S0E1[4]_net_1\, 
        \ret_state1_maj_RNI0R0E1[3]_net_1\, 
        \sequencer_state1_maj_RNISM0E1[3]_net_1\, un5_n_ch_out0, 
        N_364, \n_del_cntr0[14]\, I_58_4, \n_del_cntr0[13]\, 
        I_60_4, \n_del_cntr0[12]\, I_50_4, \n_del_cntr0[11]\, 
        I_48_4, \n_del_cntr0[10]\, I_54_4, \n_del_cntr0[9]\, 
        I_55_4, \n_del_cntr0[8]\, I_57_4, \n_del_cntr0[7]\, 
        I_59_4, \n_del_cntr0[6]\, I_49_4, \n_del_cntr0[5]\, 
        I_62_4, \n_del_cntr0[4]\, I_53_4, \n_del_cntr0[3]\, 
        I_51_4, \n_del_cntr0[2]\, I_52_4, \n_del_cntr0[1]\, 
        I_56_4, \n_del_cntr0[0]\, 
        \DWACT_ADD_CI_0_partial_sum_0[0]\, \ret_state0_0[0]\, 
        \ret_state0_tmr2_0[0]\, \ret_state0_tmr3_0[0]\, 
        \ret_state0_0[1]\, \ret_state0_tmr2_0[1]\, 
        \ret_state0_tmr3_0[1]\, \ret_state0_0[2]\, 
        \ret_state0_tmr2_0[2]\, \ret_state0_tmr3_0[2]\, 
        \ret_state0_0[3]\, \ret_state0_tmr2_0[3]\, 
        \ret_state0_tmr3_0[3]\, \ret_state0_0[4]\, 
        \ret_state0_tmr2_0[4]\, \ret_state0_tmr3_0[4]\, 
        \ret_state0_0[5]\, \ret_state0_tmr2_0[5]\, 
        \ret_state0_tmr3_0[5]\, \ret_state1_0[0]\, 
        \ret_state1_tmr2_0[0]\, \ret_state1_tmr3_0[0]\, 
        \ret_state1_0[1]\, \ret_state1_tmr2_0[1]\, 
        \ret_state1_tmr3_0[1]\, \ret_state1_0[2]\, 
        \ret_state1_tmr2_0[2]\, \ret_state1_tmr3_0[2]\, 
        \ret_state1_0[3]\, \ret_state1_tmr2_0[3]\, 
        \ret_state1_tmr3_0[3]\, \ret_state1_0[4]\, 
        \ret_state1_tmr2_0[4]\, \ret_state1_tmr3_0[4]\, 
        \ret_state1_0[5]\, \ret_state1_tmr2_0[5]\, 
        \ret_state1_tmr3_0[5]\, \ch_out0_0[2]\, 
        \ch_out0_tmr2_0[2]\, \ch_out0_tmr3_0[2]\, \ch_out0_0[1]\, 
        \ch_out0_tmr2_0[1]\, \ch_out0_tmr3_0[1]\, \ch_out0_0[0]\, 
        \ch_out0_tmr2_0[0]\, \ch_out0_tmr3_0[0]\, \ch_out1_0[2]\, 
        \ch_out1_tmr2_0[2]\, \ch_out1_tmr3_0[2]\, \ch_out1_0[1]\, 
        \ch_out1_tmr2_0[1]\, \ch_out1_tmr3_0[1]\, \ch_out1_0[0]\, 
        \ch_out1_tmr2_0[0]\, \ch_out1_tmr3_0[0]\, 
        \sequencer_state0_0[0]\, \sequencer_state0_tmr2_0[0]\, 
        \sequencer_state0_tmr3_0[0]\, \sequencer_state0_0[1]\, 
        \sequencer_state0_tmr2_0[1]\, 
        \sequencer_state0_tmr3_0[1]\, \sequencer_state0_0[2]\, 
        \sequencer_state0_tmr2_0[2]\, 
        \sequencer_state0_tmr3_0[2]\, \sequencer_state0_0[3]\, 
        \sequencer_state0_tmr2_0[3]\, 
        \sequencer_state0_tmr3_0[3]\, \sequencer_state0_0[4]\, 
        \sequencer_state0_tmr2_0[4]\, 
        \sequencer_state0_tmr3_0[4]\, \sequencer_state0_0[5]\, 
        \sequencer_state0_tmr2_0[5]\, 
        \sequencer_state0_tmr3_0[5]\, \sequencer_state1_0[0]\, 
        \sequencer_state1_tmr2_0[0]\, 
        \sequencer_state1_tmr3_0[0]\, \sequencer_state1_0[1]\, 
        \sequencer_state1_tmr2_0[1]\, 
        \sequencer_state1_tmr3_0[1]\, \sequencer_state1_0[2]\, 
        \sequencer_state1_tmr2_0[2]\, 
        \sequencer_state1_tmr3_0[2]\, \sequencer_state1_0[3]\, 
        \sequencer_state1_tmr2_0[3]\, 
        \sequencer_state1_tmr3_0[3]\, \sequencer_state1_0[4]\, 
        \sequencer_state1_tmr2_0[4]\, 
        \sequencer_state1_tmr3_0[4]\, \sequencer_state1_0[5]\, 
        \sequencer_state1_tmr2_0[5]\, 
        \sequencer_state1_tmr3_0[5]\, \del_cntr1_0[14]\, 
        \del_cntr1_tmr2_0[14]\, \del_cntr1_tmr3_0[14]\, 
        \del_cntr0_0[14]\, \del_cntr0_tmr2_0[14]\, 
        \del_cntr0_tmr3_0[14]\, \del_cntr1_0[13]\, 
        \del_cntr1_tmr2_0[13]\, \del_cntr1_tmr3_0[13]\, 
        \del_cntr0_0[13]\, \del_cntr0_tmr2_0[13]\, 
        \del_cntr0_tmr3_0[13]\, \del_cntr1_0[12]\, 
        \del_cntr1_tmr2_0[12]\, \del_cntr1_tmr3_0[12]\, 
        \del_cntr0_0[12]\, \del_cntr0_tmr2_0[12]\, 
        \del_cntr0_tmr3_0[12]\, \del_cntr1_0[11]\, 
        \del_cntr1_tmr2_0[11]\, \del_cntr1_tmr3_0[11]\, 
        \del_cntr0_0[11]\, \del_cntr0_tmr2_0[11]\, 
        \del_cntr0_tmr3_0[11]\, \del_cntr1_0[10]\, 
        \del_cntr1_tmr2_0[10]\, \del_cntr1_tmr3_0[10]\, 
        \del_cntr0_0[10]\, \del_cntr0_tmr2_0[10]\, 
        \del_cntr0_tmr3_0[10]\, \del_cntr1_0[9]\, 
        \del_cntr1_tmr2_0[9]\, \del_cntr1_tmr3_0[9]\, 
        \del_cntr0_0[9]\, \del_cntr0_tmr2_0[9]\, 
        \del_cntr0_tmr3_0[9]\, \del_cntr1_0[8]\, 
        \del_cntr1_tmr2_0[8]\, \del_cntr1_tmr3_0[8]\, 
        \del_cntr0_0[8]\, \del_cntr0_tmr2_0[8]\, 
        \del_cntr0_tmr3_0[8]\, \del_cntr1_0[7]\, 
        \del_cntr1_tmr2_0[7]\, \del_cntr1_tmr3_0[7]\, 
        \del_cntr0_0[7]\, \del_cntr0_tmr2_0[7]\, 
        \del_cntr0_tmr3_0[7]\, \del_cntr1_0[6]\, 
        \del_cntr1_tmr2_0[6]\, \del_cntr1_tmr3_0[6]\, 
        \del_cntr0_0[6]\, \del_cntr0_tmr2_0[6]\, 
        \del_cntr0_tmr3_0[6]\, \del_cntr1_0[5]\, 
        \del_cntr1_tmr2_0[5]\, \del_cntr1_tmr3_0[5]\, 
        \del_cntr0_0[5]\, \del_cntr0_tmr2_0[5]\, 
        \del_cntr0_tmr3_0[5]\, \del_cntr1_0[4]\, 
        \del_cntr1_tmr2_0[4]\, \del_cntr1_tmr3_0[4]\, 
        \del_cntr0_0[4]\, \del_cntr0_tmr2_0[4]\, 
        \del_cntr0_tmr3_0[4]\, \del_cntr1_0[3]\, 
        \del_cntr1_tmr2_0[3]\, \del_cntr1_tmr3_0[3]\, 
        \del_cntr0_0[3]\, \del_cntr0_tmr2_0[3]\, 
        \del_cntr0_tmr3_0[3]\, \del_cntr1_0[2]\, 
        \del_cntr1_tmr2_0[2]\, \del_cntr1_tmr3_0[2]\, 
        \del_cntr0_0[2]\, \del_cntr0_tmr2_0[2]\, 
        \del_cntr0_tmr3_0[2]\, \del_cntr1_0[1]\, 
        \del_cntr1_tmr2_0[1]\, \del_cntr1_tmr3_0[1]\, 
        \del_cntr0_0[1]\, \del_cntr0_tmr2_0[1]\, 
        \del_cntr0_tmr3_0[1]\, \del_cntr1_0[0]\, 
        \del_cntr1_tmr2_0[0]\, \del_cntr1_tmr3_0[0]\, 
        \del_cntr0_0[0]\, \del_cntr0_tmr2_0[0]\, 
        \del_cntr0_tmr3_0[0]\, \DWACT_ADD_CI_0_pog_array_1_5[0]\, 
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
        \DWACT_ADD_CI_0_partial_sum[11]\, 
        \DWACT_ADD_CI_0_pog_array_1_5_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_11_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_12_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_4_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_9_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_10_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_3_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_7_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_8_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_2_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_2_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_2_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_5_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_6_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_2_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_3_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_2_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_5_0[0]\, 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, 
        \DWACT_ADD_CI_0_g_array_2_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_5_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_11_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_6_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_13_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_7_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\, 
        \DWACT_ADD_CI_0_g_array_11_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_11_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_5_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_0[0]\, 
        \DWACT_ADD_CI_0_TMP_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_9_0[0]\, 
        \DWACT_ADD_CI_0_partial_sum_0[5]\, 
        \DWACT_ADD_CI_0_partial_sum_0[13]\, 
        \DWACT_ADD_CI_0_partial_sum_0[7]\, 
        \DWACT_ADD_CI_0_partial_sum_0[14]\, 
        \DWACT_ADD_CI_0_partial_sum_0[8]\, 
        \DWACT_ADD_CI_0_partial_sum_0[1]\, 
        \DWACT_ADD_CI_0_partial_sum_0[9]\, 
        \DWACT_ADD_CI_0_partial_sum_0[10]\, 
        \DWACT_ADD_CI_0_partial_sum_0[4]\, 
        \DWACT_ADD_CI_0_partial_sum_0[2]\, 
        \DWACT_ADD_CI_0_partial_sum_0[3]\, 
        \DWACT_ADD_CI_0_partial_sum_0[12]\, 
        \DWACT_ADD_CI_0_partial_sum_0[6]\, 
        \DWACT_ADD_CI_0_partial_sum_0[11]\, \GND\, \VCC\
         : std_logic;

begin 

    ch_out1(2) <= \ch_out1[2]_net_1\;
    ch_out1(1) <= \ch_out1[1]_net_1\;
    ch_mreg_en_0 <= \ch_mreg_en[3]\;
    ch_iaux_en_0 <= \ch_iaux_en[3]\;
    OUT_CHANNEL_VOSG_c(3) <= \OUT_CHANNEL_VOSG_c[3]\;

    \sequencer_state1[2]\ : DFN1C0
      port map(D => \sequencer_state1_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_0[2]\);
    
    \ret_state0_maj_RNIU0CV[5]\ : OA1A
      port map(A => N_379, B => \sequencer_state0[5]_net_1\, C
         => \ret_state0[5]_net_1\, Y => 
        \ret_state0_maj_RNIU0CV[5]_net_1\);
    
    \del_cntr1_tmr3[0]\ : DFN1P0
      port map(D => \n_del_cntr1[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[0]\);
    
    \del_cntr0_maj_RNINC5I[14]\ : NOR3
      port map(A => \del_cntr0[2]_net_1\, B => 
        \del_cntr0[14]_net_1\, C => \del_cntr0[13]_net_1\, Y => 
        un5_del_cntr0_7);
    
    \del_cntr0_maj_RNIDCVF[11]\ : NOR2
      port map(A => \del_cntr0[12]_net_1\, B => 
        \del_cntr0[11]_net_1\, Y => un5_del_cntr0_6);
    
    \del_cntr0[14]\ : DFN1P0
      port map(D => \n_del_cntr0[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[14]\);
    
    \sequencer_state0_maj_RNIBCS9B[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_53_4, Y => 
        \n_del_cntr0[4]\);
    
    \del_cntr1_maj[14]\ : MAJ3
      port map(A => \del_cntr1_0[14]\, B => 
        \del_cntr1_tmr2_0[14]\, C => \del_cntr1_tmr3_0[14]\, Y
         => \del_cntr1[14]_net_1\);
    
    un1_del_cntr1_I_88 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2[0]\);
    
    \del_cntr0_tmr2[14]\ : DFN1P0
      port map(D => \n_del_cntr0[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[14]\);
    
    \del_cntr0[4]\ : DFN1P0
      port map(D => \n_del_cntr0[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[4]\);
    
    \ch_out0_maj_RNIJ0941[1]\ : MX2A
      port map(A => N_369, B => \ch_iaux_en[3]\, S => 
        \sequencer_state0[4]_net_1\, Y => 
        \ch_out0_maj_RNIJ0941[1]_net_1\);
    
    \sequencer_state1_maj_RNI1PPBA[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_51_3, Y => 
        \n_del_cntr1[3]\);
    
    \del_cntr1_tmr3[3]\ : DFN1P0
      port map(D => \n_del_cntr1[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[3]\);
    
    \del_cntr0[9]\ : DFN1P0
      port map(D => \n_del_cntr0[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[9]\);
    
    \ret_state1_tmr3[5]\ : DFN1P0
      port map(D => \ret_state1_maj_RNI2T0E1[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state1_tmr3_0[5]\);
    
    \del_cntr0_maj_RNI85QT1[5]\ : NOR3C
      port map(A => un5_del_cntr0_10, B => un5_del_cntr0_9, C => 
        un5_del_cntr0_11, Y => un5_del_cntr0);
    
    \sequencer_state0_maj_RNI4L82M[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_57_4, Y => 
        \n_del_cntr0[8]\);
    
    un1_del_cntr0_I_21 : XOR2
      port map(A => \del_cntr0[13]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_12_0[0]\);
    
    \del_cntr0_tmr2[4]\ : DFN1P0
      port map(D => \n_del_cntr0[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[4]\);
    
    \del_cntr0_tmr2[11]\ : DFN1P0
      port map(D => \n_del_cntr0[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[11]\);
    
    \del_cntr0[5]\ : DFN1P0
      port map(D => \n_del_cntr0[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[5]\);
    
    \ret_state1_maj[0]\ : MAJ3
      port map(A => \ret_state1_0[0]\, B => 
        \ret_state1_tmr2_0[0]\, C => \ret_state1_tmr3_0[0]\, Y
         => \ret_state1[0]_net_1\);
    
    \ch_out1[1]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIO3JM1[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_0[1]\);
    
    \sequencer_state0_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state0_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr2_0[2]\);
    
    \ch_out1_tmr2[1]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIO3JM1[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr2_0[1]\);
    
    \ret_state0_maj_RNISUBV[3]\ : OA1A
      port map(A => N_379, B => \sequencer_state0[5]_net_1\, C
         => \ret_state0[3]_net_1\, Y => 
        \ret_state0_maj_RNISUBV[3]_net_1\);
    
    \del_cntr1_maj_RNIP2J7[14]\ : NOR3
      port map(A => \del_cntr1[1]_net_1\, B => 
        \del_cntr1[14]_net_1\, C => \del_cntr1[13]_net_1\, Y => 
        un6_del_cntr1_7);
    
    \ret_state1_maj_RNIDJ4O[1]\ : NOR2A
      port map(A => \ret_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => \sequencer_state1_ns_a2_0[3]\);
    
    \ret_state1_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNISM0E1[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_0[2]\);
    
    \sequencer_state0_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state0_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr3_0[2]\);
    
    un1_del_cntr0_I_10 : AND2
      port map(A => \del_cntr0[4]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\);
    
    un1_del_cntr0_I_47 : XOR2
      port map(A => \del_cntr0[5]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[5]\);
    
    \ret_state1_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIQK0E1[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_0[0]\);
    
    \sequencer_state1_maj_RNIE0L36[0]\ : AO1
      port map(A => \sequencer_state1_ns_a2_0_1[5]\, B => N_274, 
        C => N_258, Y => \sequencer_state1_ns[5]\);
    
    un1_del_cntr0_I_33 : XOR2
      port map(A => \del_cntr0[3]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[3]\);
    
    \del_cntr1_maj_RNIPHMB[7]\ : NOR2
      port map(A => \del_cntr1[7]_net_1\, B => 
        \del_cntr1[8]_net_1\, Y => un6_del_cntr1_4);
    
    \del_cntr0_maj[3]\ : MAJ3
      port map(A => \del_cntr0_0[3]\, B => \del_cntr0_tmr2_0[3]\, 
        C => \del_cntr0_tmr3_0[3]\, Y => \del_cntr0[3]_net_1\);
    
    un1_del_cntr1_I_70 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    \ret_state0[3]\ : DFN1C0
      port map(D => \ret_state0_maj_RNISUBV[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state0_0[3]\);
    
    un1_del_cntr1_I_63 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_8[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\);
    
    un1_del_cntr0_I_38 : XOR2
      port map(A => \del_cntr0[2]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[2]\);
    
    un1_del_cntr1_I_39 : XOR2
      port map(A => \del_cntr1[13]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[13]\);
    
    \sequencer_state0_maj_RNILIPJ8[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_51_4, Y => 
        \n_del_cntr0[3]\);
    
    \del_cntr1_maj[4]\ : MAJ3
      port map(A => \del_cntr1_0[4]\, B => \del_cntr1_tmr2_0[4]\, 
        C => \del_cntr1_tmr3_0[4]\, Y => \del_cntr1[4]_net_1\);
    
    un1_del_cntr1_I_91 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\);
    
    \del_cntr1_maj[0]\ : MAJ3
      port map(A => \del_cntr1_0[0]\, B => \del_cntr1_tmr2_0[0]\, 
        C => \del_cntr1_tmr3_0[0]\, Y => \del_cntr1[0]_net_1\);
    
    un1_del_cntr1_I_68 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\);
    
    \sequencer_state0_maj_RNIFKUM[0]\ : NOR2
      port map(A => N_347, B => \sequencer_state0[0]_net_1\, Y
         => N_369);
    
    un1_del_cntr1_I_80 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\);
    
    \sequencer_state0_maj_RNIMOBV[2]\ : NOR3
      port map(A => \sequencer_state0[3]_net_1\, B => 
        \sequencer_state0[2]_net_1\, C => N_368, Y => 
        \sequencer_state0_maj_RNIMOBV[2]_net_1\);
    
    \del_cntr1_maj[10]\ : MAJ3
      port map(A => \del_cntr1_0[10]\, B => 
        \del_cntr1_tmr2_0[10]\, C => \del_cntr1_tmr3_0[10]\, Y
         => \del_cntr1[10]_net_1\);
    
    \del_cntr0_tmr2[5]\ : DFN1P0
      port map(D => \n_del_cntr0[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[5]\);
    
    un1_del_cntr1_I_21 : XOR2
      port map(A => \del_cntr1[13]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\);
    
    \del_cntr0_maj[4]\ : MAJ3
      port map(A => \del_cntr0_0[4]\, B => \del_cntr0_tmr2_0[4]\, 
        C => \del_cntr0_tmr3_0[4]\, Y => \del_cntr0[4]_net_1\);
    
    un1_del_cntr0_I_86 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_0[0]\);
    
    \del_cntr1[14]\ : DFN1P0
      port map(D => \n_del_cntr1[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[14]\);
    
    \sequencer_state1_maj_RNIRL0E1[1]\ : NOR3
      port map(A => \sequencer_state1[3]_net_1\, B => 
        \sequencer_state1[1]_net_1\, C => N_263, Y => 
        \sequencer_state1_maj_RNIRL0E1[1]_net_1\);
    
    \sequencer_state0_maj_RNI0BGQ[0]\ : NOR2B
      port map(A => \sequencer_state0[0]_net_1\, B => 
        channels_ready(3), Y => N_362);
    
    \del_cntr1_maj[7]\ : MAJ3
      port map(A => \del_cntr1_0[7]\, B => \del_cntr1_tmr2_0[7]\, 
        C => \del_cntr1_tmr3_0[7]\, Y => \del_cntr1[7]_net_1\);
    
    \ret_state0_maj_RNI0D7K3[1]\ : AO1
      port map(A => \sequencer_state0_ns_i_a2_0_0[2]\, B => N_374, 
        C => N_359, Y => \sequencer_state0_ns_i_0[2]\);
    
    \sequencer_state0_maj_RNIINUM_0[3]\ : NOR2
      port map(A => \sequencer_state0[3]_net_1\, B => N_347, Y
         => \sequencer_state0_ns_a2_0[0]\);
    
    \sequencer_state0[5]\ : DFN1P0
      port map(D => \sequencer_state0_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state0_0[5]\);
    
    \ret_state1_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNISM0E1[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_0[2]\);
    
    \del_cntr0[11]\ : DFN1P0
      port map(D => \n_del_cntr0[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[11]\);
    
    \sequencer_state1_maj_RNIQ71T2[0]\ : NOR2B
      port map(A => \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, B
         => un6_del_cntr1, Y => N_260);
    
    un1_del_cntr0_I_56 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[1]\, B => 
        \DWACT_ADD_CI_0_TMP_0[0]\, Y => I_56_4);
    
    \del_cntr1[1]\ : DFN1P0
      port map(D => \n_del_cntr1[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[1]\);
    
    \sequencer_state0_maj_RNISV83D[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_62_4, Y => 
        \n_del_cntr0[5]\);
    
    \ch_out1_tmr3[2]\ : DFN1C0
      port map(D => \ch_out1_maj_RNII09B1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr3_0[2]\);
    
    \ch_out0_tmr3[0]\ : DFN1C0
      port map(D => \ch_out0_maj_RNID4O12[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr3_0[0]\);
    
    \sequencer_state0_maj_RNI0RIV3[5]\ : OA1C
      port map(A => \sequencer_state0[4]_net_1\, B => N_340, C
         => \sequencer_state0[5]_net_1\, Y => N_357);
    
    un1_del_cntr0_I_76 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_0[0]\);
    
    un1_del_cntr0_I_25 : XOR2
      port map(A => \del_cntr0[12]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_11_0[0]\);
    
    \ret_state1_tmr2[4]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI1S0E1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_0[4]\);
    
    \ret_state0_tmr3[3]\ : DFN1C0
      port map(D => \ret_state0_maj_RNISUBV[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_0[3]\);
    
    \ret_state0_maj_RNIOCK11_0[0]\ : NOR3B
      port map(A => \ret_state0[5]_net_1\, B => N_375, C => 
        \ret_state0[0]_net_1\, Y => 
        \sequencer_state0_ns_a2_0_1[0]\);
    
    \del_cntr1_tmr2[11]\ : DFN1P0
      port map(D => \n_del_cntr1[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[11]\);
    
    un1_del_cntr1_I_51 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[3]\, B => 
        \DWACT_ADD_CI_0_g_array_12[0]\, Y => I_51_3);
    
    un1_del_cntr1_I_16 : AND2
      port map(A => \del_cntr1[11]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\);
    
    un1_del_cntr0_I_30 : XOR2
      port map(A => \del_cntr0[1]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_0[0]\);
    
    \del_cntr1_tmr2[8]\ : DFN1P0
      port map(D => \n_del_cntr1[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[8]\);
    
    un1_del_cntr0_I_22 : XOR2
      port map(A => \del_cntr0[9]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_8_0[0]\);
    
    \del_cntr0_tmr2[12]\ : DFN1P0
      port map(D => \n_del_cntr0[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[12]\);
    
    un1_del_cntr1_I_60 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[13]\, B => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\, Y => I_60_3);
    
    un1_del_cntr1_I_46 : XOR2
      port map(A => \del_cntr1[6]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[6]\);
    
    un1_del_cntr0_I_65 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_5_0[0]\);
    
    \del_cntr0_tmr2[10]\ : DFN1P0
      port map(D => \n_del_cntr0[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[10]\);
    
    un1_del_cntr1_I_34 : XOR2
      port map(A => \del_cntr1[4]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[4]\);
    
    \del_cntr1_tmr2[0]\ : DFN1P0
      port map(D => \n_del_cntr1[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[0]\);
    
    \del_cntr1[2]\ : DFN1P0
      port map(D => \n_del_cntr1[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[2]\);
    
    \ch_out1[2]\ : DFN1C0
      port map(D => \ch_out1_maj_RNII09B1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_0[2]\);
    
    \ret_state1_maj_RNIN7OJ2[0]\ : NOR3C
      port map(A => N_254_1, B => N_238_i, C => N_271, Y => N_255);
    
    \ret_state0_tmr3[5]\ : DFN1P0
      port map(D => \ret_state0_maj_RNIU0CV[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state0_tmr3_0[5]\);
    
    \del_cntr1_maj_RNIJ3F8[10]\ : NOR3A
      port map(A => un6_del_cntr1_6, B => \del_cntr1[10]_net_1\, 
        C => \del_cntr1[9]_net_1\, Y => un6_del_cntr1_10);
    
    un1_del_cntr0_I_62 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[5]\, B => 
        \DWACT_ADD_CI_0_g_array_12_1_0[0]\, Y => I_62_4);
    
    un1_del_cntr0_I_6 : AND2
      port map(A => \del_cntr0[3]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_3_0[0]\);
    
    \ret_state0[1]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNINPBV[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_0[1]\);
    
    \del_cntr1_maj_RNIFSN1[11]\ : NOR2
      port map(A => \del_cntr1[11]_net_1\, B => 
        \del_cntr1[12]_net_1\, Y => un6_del_cntr1_6);
    
    \del_cntr1[8]\ : DFN1P0
      port map(D => \n_del_cntr1[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[8]\);
    
    \ret_state0[5]\ : DFN1P0
      port map(D => \ret_state0_maj_RNIU0CV[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => \ret_state0_0[5]\);
    
    un1_del_cntr0_I_87 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_6_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_2_0[0]\);
    
    \sequencer_state1_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state1_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr3_0[0]\);
    
    \sequencer_state0_maj_RNINQTN3[4]\ : NOR2B
      port map(A => \sequencer_state0[4]_net_1\, B => N_340, Y
         => \sequencer_state0_ns_a2_0[1]\);
    
    \ret_state1_maj_RNIBCF55[1]\ : NOR3C
      port map(A => N_270, B => N_274, C => 
        \sequencer_state1_ns_a2_0[4]\, Y => 
        \sequencer_state1_ns[4]\);
    
    \ret_state0_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIOQBV[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_0[2]\);
    
    \sequencer_state0_maj_RNIOQBV[3]\ : AO1A
      port map(A => N_347, B => \ret_state0[2]_net_1\, C => 
        \sequencer_state0[3]_net_1\, Y => 
        \sequencer_state0_maj_RNIOQBV[3]_net_1\);
    
    \sequencer_state0_maj_RNI0BGQ_1[0]\ : NOR2A
      port map(A => channels_ready(3), B => 
        \sequencer_state0[0]_net_1\, Y => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\);
    
    \del_cntr0_maj[12]\ : MAJ3
      port map(A => \del_cntr0_0[12]\, B => 
        \del_cntr0_tmr2_0[12]\, C => \del_cntr0_tmr3_0[12]\, Y
         => \del_cntr0[12]_net_1\);
    
    un1_del_cntr0_I_91 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_10_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_4_0[0]\);
    
    \del_cntr1_tmr2[6]\ : DFN1P0
      port map(D => \n_del_cntr1[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[6]\);
    
    un1_del_cntr1_I_25 : XOR2
      port map(A => \del_cntr1[12]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_11[0]\);
    
    \sequencer_state0_maj_RNIAPDK1[5]\ : MX2C
      port map(A => \sequencer_state0[5]_net_1\, B => 
        un5_n_ch_out0, S => \sequencer_state0[0]_net_1\, Y => 
        \n_ch_out0[0]\);
    
    \ret_state0_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIMOBV[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_0[0]\);
    
    \del_cntr0_tmr3[2]\ : DFN1P0
      port map(D => \n_del_cntr0[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[2]\);
    
    un1_del_cntr1_I_92 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_5[0]\);
    
    un1_del_cntr1_I_9 : AND2
      port map(A => \del_cntr1[10]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\);
    
    \sequencer_state0_maj_RNIBP9F[2]\ : OR2
      port map(A => \sequencer_state0[2]_net_1\, B => 
        \sequencer_state0[1]_net_1\, Y => N_347);
    
    \sequencer_state0_maj_RNI52O15[3]\ : AO1A
      port map(A => channels_ready(3), B => 
        \sequencer_state0_ns_a2_0[0]\, C => N_355, Y => 
        \sequencer_state0_ns[0]\);
    
    \del_cntr1_tmr2[14]\ : DFN1P0
      port map(D => \n_del_cntr1[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[14]\);
    
    \del_cntr0[13]\ : DFN1P0
      port map(D => \n_del_cntr0[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[13]\);
    
    un1_del_cntr0_I_57 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[8]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, Y => I_57_4);
    
    \ret_state0_maj_RNID7QG[0]\ : XOR2
      port map(A => \ret_state0[5]_net_1\, B => 
        \ret_state0[0]_net_1\, Y => N_342_i);
    
    \ch_out0_tmr2[1]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIJ0941[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr2_0[1]\);
    
    \sequencer_state1_maj_RNITIMG71[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_50_3, Y => 
        \n_del_cntr1[12]\);
    
    \del_cntr1[11]\ : DFN1P0
      port map(D => \n_del_cntr1[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[11]\);
    
    \sequencer_state1[3]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI33AOA[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state1_0[3]\);
    
    \sequencer_state0_maj_RNIDNOIH[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_59_4, Y => 
        \n_del_cntr0[7]\);
    
    \ret_state1[5]\ : DFN1P0
      port map(D => \ret_state1_maj_RNI2T0E1[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => \ret_state1_0[5]\);
    
    \del_cntr0_tmr3[7]\ : DFN1P0
      port map(D => \n_del_cntr0[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[7]\);
    
    un1_del_cntr0_I_41 : XOR2
      port map(A => \del_cntr0[12]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[12]\);
    
    un1_del_cntr0_I_16 : AND2
      port map(A => \del_cntr0[11]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_11_0[0]\);
    
    un1_del_cntr1_I_22 : XOR2
      port map(A => \del_cntr1[9]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\);
    
    un1_del_cntr0_I_77 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_1_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\);
    
    \sequencer_state1_maj_RNI1V1KL[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_59_3, Y => 
        \n_del_cntr1[7]\);
    
    \sequencer_state0_maj[4]\ : MAJ3
      port map(A => \sequencer_state0_0[4]\, B => 
        \sequencer_state0_tmr2_0[4]\, C => 
        \sequencer_state0_tmr3_0[4]\, Y => 
        \sequencer_state0[4]_net_1\);
    
    \ret_state0_maj[2]\ : MAJ3
      port map(A => \ret_state0_0[2]\, B => 
        \ret_state0_tmr2_0[2]\, C => \ret_state0_tmr3_0[2]\, Y
         => \ret_state0[2]_net_1\);
    
    \ret_state0_maj[0]\ : MAJ3
      port map(A => \ret_state0_0[0]\, B => 
        \ret_state0_tmr2_0[0]\, C => \ret_state0_tmr3_0[0]\, Y
         => \ret_state0[0]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_del_cntr1_I_76 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11[0]\);
    
    \ret_state1_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIRL0E1[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_0[1]\);
    
    un1_del_cntr1_I_17 : AND2
      port map(A => \del_cntr1[13]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\);
    
    \ret_state0_maj_RNI7MEI1[3]\ : NOR3C
      port map(A => N_374, B => \sequencer_state0_ns_a2_0_0[1]\, 
        C => N_375, Y => N_370);
    
    \sequencer_state1_maj_RNI33AOA[5]\ : NOR3A
      port map(A => channels_ready(4), B => 
        \sequencer_state1_ns_i_0[2]\, C => N_253, Y => 
        \sequencer_state1_maj_RNI33AOA[5]_net_1\);
    
    \del_cntr1_maj[6]\ : MAJ3
      port map(A => \del_cntr1_0[6]\, B => \del_cntr1_tmr2_0[6]\, 
        C => \del_cntr1_tmr3_0[6]\, Y => \del_cntr1[6]_net_1\);
    
    un1_del_cntr1_I_47 : XOR2
      port map(A => \del_cntr1[5]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[5]\);
    
    \ch_out0[1]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIJ0941[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_0[1]\);
    
    \ret_state1_maj_RNIS89G1_0[0]\ : NOR3B
      port map(A => \ret_state1[5]_net_1\, B => N_271, C => 
        \ret_state1[0]_net_1\, Y => 
        \sequencer_state1_ns_a2_0_1[0]\);
    
    \del_cntr0_tmr3[5]\ : DFN1P0
      port map(D => \n_del_cntr0[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[5]\);
    
    \del_cntr0[1]\ : DFN1P0
      port map(D => \n_del_cntr0[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[1]\);
    
    un1_del_cntr0_I_29 : XOR2
      port map(A => \del_cntr0[4]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_3_0[0]\);
    
    \del_cntr1_maj[2]\ : MAJ3
      port map(A => \del_cntr1_0[2]\, B => \del_cntr1_tmr2_0[2]\, 
        C => \del_cntr1_tmr3_0[2]\, Y => \del_cntr1[2]_net_1\);
    
    \sequencer_state0_maj_RNITUIL71[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_58_4, Y => 
        \n_del_cntr0[14]\);
    
    un1_del_cntr1_I_86 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1[0]\);
    
    un1_del_cntr1_I_33 : XOR2
      port map(A => \del_cntr1[3]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_partial_sum[3]\);
    
    \del_cntr0[7]\ : DFN1P0
      port map(D => \n_del_cntr0[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[7]\);
    
    \sequencer_state1_maj_RNI3K5U[0]\ : NOR2B
      port map(A => \sequencer_state1[0]_net_1\, B => 
        channels_ready(4), Y => N_258);
    
    \del_cntr0_tmr3[1]\ : DFN1P0
      port map(D => \n_del_cntr0[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[1]\);
    
    \del_cntr0_tmr2[9]\ : DFN1P0
      port map(D => \n_del_cntr0[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[9]\);
    
    un1_del_cntr1_I_55 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[9]\, B => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\, Y => I_55_3);
    
    \sequencer_state1_tmr2[3]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI33AOA[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state1_tmr2_0[3]\);
    
    \del_cntr1_tmr2[1]\ : DFN1P0
      port map(D => \n_del_cntr1[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[1]\);
    
    un1_del_cntr1_I_38 : XOR2
      port map(A => \del_cntr1[2]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[2]\);
    
    \sequencer_state1_maj_RNIRPEL21[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_48_3, Y => 
        \n_del_cntr1[11]\);
    
    \ret_state0_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIOQBV[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_0[2]\);
    
    \ch_out0_maj_RNID4O12[0]\ : MX2
      port map(A => \n_ch_out0[0]\, B => \OUT_CHANNEL_VOSG_c[3]\, 
        S => \sequencer_state0[4]_net_1\, Y => 
        \ch_out0_maj_RNID4O12[0]_net_1\);
    
    un1_del_cntr0_I_69 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_4_0[0]\);
    
    un1_del_cntr1_I_52 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[2]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, Y => I_52_3);
    
    un1_del_cntr1_I_5 : AND2
      port map(A => \del_cntr1[7]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\);
    
    \sequencer_state1_maj_RNIG5MN4[0]\ : OR3
      port map(A => N_275, B => N_260, C => 
        \DWACT_ADD_CI_0_partial_sum[0]\, Y => \n_del_cntr1[0]\);
    
    \del_cntr1_maj_RNIH9MB[3]\ : NOR2
      port map(A => \del_cntr1[3]_net_1\, B => 
        \del_cntr1[4]_net_1\, Y => un6_del_cntr1_2);
    
    \sequencer_state0_maj_RNITL015[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_56_4, Y => 
        \n_del_cntr0[1]\);
    
    \sequencer_state0_maj_RNIRT493[4]\ : NOR3C
      port map(A => un5_del_cntr0, B => 
        \sequencer_state0_ns_a2_2_0[0]\, C => channels_ready(3), 
        Y => N_378);
    
    \ret_state1_maj_RNIFL4O[0]\ : XOR2
      port map(A => \ret_state1[5]_net_1\, B => 
        \ret_state1[0]_net_1\, Y => N_238_i);
    
    \ret_state0_tmr2[4]\ : DFN1C0
      port map(D => \ret_state0_maj_RNITVBV[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_0[4]\);
    
    \del_cntr0[10]\ : DFN1P0
      port map(D => \n_del_cntr0[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[10]\);
    
    \del_cntr1[7]\ : DFN1P0
      port map(D => \n_del_cntr1[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[7]\);
    
    \sequencer_state0_maj_RNIJL955[0]\ : AO1
      port map(A => \sequencer_state0_ns_a2_0_1[5]\, B => N_378, 
        C => N_362, Y => \sequencer_state0_ns[5]\);
    
    \del_cntr1[13]\ : DFN1P0
      port map(D => \n_del_cntr1[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[13]\);
    
    un1_del_cntr0_I_17 : AND2
      port map(A => \del_cntr0[13]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_13_0[0]\);
    
    \ch_out0_tmr3[2]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIE4KS[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr3_0[2]\);
    
    \sequencer_state1_tmr2[5]\ : DFN1P0
      port map(D => \sequencer_state1_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state1_tmr2_0[5]\);
    
    \ret_state0_maj_RNIF9QG_0[3]\ : NOR2
      port map(A => \ret_state0[4]_net_1\, B => 
        \ret_state0[3]_net_1\, Y => N_371);
    
    \del_cntr0_maj[9]\ : MAJ3
      port map(A => \del_cntr0_0[9]\, B => \del_cntr0_tmr2_0[9]\, 
        C => \del_cntr0_tmr3_0[9]\, Y => \del_cntr0[9]_net_1\);
    
    \ret_state1_maj_RNI8IJR1[1]\ : XA1
      port map(A => \ret_state1[1]_net_1\, B => 
        \ret_state1[2]_net_1\, C => N_254_1, Y => 
        \sequencer_state1_ns_i_a2_0_0[2]\);
    
    un1_del_cntr1_I_29 : XOR2
      port map(A => \del_cntr1[4]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_3[0]\);
    
    un1_del_cntr0_I_36 : XOR2
      port map(A => \del_cntr0[1]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[1]\);
    
    un1_del_cntr1_I_77 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2[0]\);
    
    \sequencer_state0_maj_RNIN8FO[4]\ : NOR2B
      port map(A => \sequencer_state0[4]_net_1\, B => N_371, Y
         => \sequencer_state0_ns_a2_2_0[0]\);
    
    \sequencer_state0_maj[3]\ : MAJ3
      port map(A => \sequencer_state0_0[3]\, B => 
        \sequencer_state0_tmr2_0[3]\, C => 
        \sequencer_state0_tmr3_0[3]\, Y => 
        \sequencer_state0[3]_net_1\);
    
    un1_del_cntr1_I_66 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\);
    
    un1_del_cntr0_I_92 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_12_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_5_0[0]\);
    
    un1_del_cntr0_I_9 : AND2
      port map(A => \del_cntr0[10]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\);
    
    un1_del_cntr0_I_45 : XOR2
      port map(A => \del_cntr0[9]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[9]\);
    
    \sequencer_state1_maj[2]\ : MAJ3
      port map(A => \sequencer_state1_0[2]\, B => 
        \sequencer_state1_tmr2_0[2]\, C => 
        \sequencer_state1_tmr3_0[2]\, Y => 
        \sequencer_state1[2]_net_1\);
    
    \sequencer_state1[1]\ : DFN1C0
      port map(D => \sequencer_state1_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_0[1]\);
    
    un1_del_cntr0_I_24 : XOR2
      port map(A => \del_cntr0[2]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_1_0[0]\);
    
    \ret_state1_maj_RNIFL4O_0[0]\ : NOR2
      port map(A => \ret_state1[5]_net_1\, B => 
        \ret_state1[0]_net_1\, Y => N_270);
    
    \sequencer_state1_maj_RNIRUE31[5]\ : NOR2A
      port map(A => N_267, B => \sequencer_state1[5]_net_1\, Y
         => N_254_1);
    
    \sequencer_state0_maj_RNICDINQ[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_54_4, Y => 
        \n_del_cntr0[10]\);
    
    \del_cntr0_maj[13]\ : MAJ3
      port map(A => \del_cntr0_0[13]\, B => 
        \del_cntr0_tmr2_0[13]\, C => \del_cntr0_tmr3_0[13]\, Y
         => \del_cntr0[13]_net_1\);
    
    un1_del_cntr1_I_87 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\);
    
    un1_del_cntr1_I_30 : XOR2
      port map(A => \del_cntr1[1]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0[0]\);
    
    \sequencer_state1_tmr3[3]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI33AOA[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state1_tmr3_0[3]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \sequencer_state1_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state1_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr2_0[0]\);
    
    \sequencer_state1_maj_RNIKPPE91[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_60_3, Y => 
        \n_del_cntr1[13]\);
    
    un1_del_cntr0_I_42 : XOR2
      port map(A => \del_cntr0[0]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[0]\);
    
    \sequencer_state1_maj_RNIE8KM[0]\ : NOR2
      port map(A => \sequencer_state1[0]_net_1\, B => 
        \sequencer_state1[4]_net_1\, Y => N_275);
    
    \ch_out1_tmr3[1]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIO3JM1[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr3_0[1]\);
    
    un1_del_cntr0_I_81 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\);
    
    \del_cntr0_tmr3[4]\ : DFN1P0
      port map(D => \n_del_cntr0[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[4]\);
    
    \ch_out1[0]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIJ2DG2[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_0[0]\);
    
    \del_cntr1_tmr2[4]\ : DFN1P0
      port map(D => \n_del_cntr1[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[4]\);
    
    \ch_out1_maj_RNI4TGB[0]\ : OR2A
      port map(A => J11_DEBUG_c_c_0, B => \ch_out1[0]_net_1\, Y
         => OUT_CHANNEL_VOSG_c(4));
    
    \sequencer_state1_maj_RNIPRMR5[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_56_3, Y => 
        \n_del_cntr1[1]\);
    
    un1_del_cntr0_I_64 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_0[0]\, B => 
        \DWACT_ADD_CI_0_TMP_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_1_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\);
    
    \del_cntr0_tmr2[2]\ : DFN1P0
      port map(D => \n_del_cntr0[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[2]\);
    
    \sequencer_state0[0]\ : DFN1C0
      port map(D => \sequencer_state0_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_0[0]\);
    
    \del_cntr1_maj[5]\ : MAJ3
      port map(A => \del_cntr1_0[5]\, B => \del_cntr1_tmr2_0[5]\, 
        C => \del_cntr1_tmr3_0[5]\, Y => \del_cntr1[5]_net_1\);
    
    \sequencer_state1_maj_RNI3K5U_0[0]\ : NOR2A
      port map(A => channels_ready(4), B => 
        \sequencer_state1[0]_net_1\, Y => N_276_0);
    
    un1_del_cntr1_I_59 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[7]\, B => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\, Y => I_59_3);
    
    \del_cntr0_tmr2[7]\ : DFN1P0
      port map(D => \n_del_cntr0[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[7]\);
    
    un1_del_cntr0_I_51 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[3]\, B => 
        \DWACT_ADD_CI_0_g_array_12_0[0]\, Y => I_51_4);
    
    \sequencer_state0_maj_RNICQ9F[0]\ : NOR2
      port map(A => \sequencer_state0[0]_net_1\, B => 
        \sequencer_state0[4]_net_1\, Y => N_379);
    
    \ch_out1_maj[0]\ : MAJ3
      port map(A => \ch_out1_0[0]\, B => \ch_out1_tmr2_0[0]\, C
         => \ch_out1_tmr3_0[0]\, Y => \ch_out1[0]_net_1\);
    
    \ret_state0_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNINPBV[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_0[1]\);
    
    \del_cntr0_tmr3[13]\ : DFN1P0
      port map(D => \n_del_cntr0[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[13]\);
    
    \del_cntr1[10]\ : DFN1P0
      port map(D => \n_del_cntr1[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[10]\);
    
    \ch_out1_maj_RNIO3JM1[1]\ : MX2A
      port map(A => N_265, B => \ch_out1[1]_net_1\, S => 
        \sequencer_state1[4]_net_1\, Y => 
        \ch_out1_maj_RNIO3JM1[1]_net_1\);
    
    un1_del_cntr0_I_71 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_0[0]\);
    
    \sequencer_state1_maj_RNIN1UT4[5]\ : OA1C
      port map(A => \sequencer_state1[4]_net_1\, B => N_236, C
         => \sequencer_state1[5]_net_1\, Y => N_253);
    
    \ret_state0_maj[3]\ : MAJ3
      port map(A => \ret_state0_0[3]\, B => 
        \ret_state0_tmr2_0[3]\, C => \ret_state0_tmr3_0[3]\, Y
         => \ret_state0[3]_net_1\);
    
    \ret_state1_maj_RNIS89G1[0]\ : NOR3B
      port map(A => \ret_state1[0]_net_1\, B => N_271, C => 
        \ret_state1[5]_net_1\, Y => 
        \sequencer_state1_ns_a2_0_1[5]\);
    
    \sequencer_state0_maj_RNI5H2921[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_50_4, Y => 
        \n_del_cntr0[12]\);
    
    \del_cntr0_maj[1]\ : MAJ3
      port map(A => \del_cntr0_0[1]\, B => \del_cntr0_tmr2_0[1]\, 
        C => \del_cntr0_tmr3_0[1]\, Y => \del_cntr0[1]_net_1\);
    
    \del_cntr0_maj[11]\ : MAJ3
      port map(A => \del_cntr0_0[11]\, B => 
        \del_cntr0_tmr2_0[11]\, C => \del_cntr0_tmr3_0[11]\, Y
         => \del_cntr0[11]_net_1\);
    
    un1_del_cntr1_I_11 : AND2
      port map(A => \del_cntr1[6]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\);
    
    \sequencer_state1_tmr3[5]\ : DFN1P0
      port map(D => \sequencer_state1_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state1_tmr3_0[5]\);
    
    \ret_state1_tmr3[4]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI1S0E1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_0[4]\);
    
    un1_del_cntr1_I_24 : XOR2
      port map(A => \del_cntr1[2]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_1[0]\);
    
    un1_del_cntr0_I_37 : XOR2
      port map(A => \del_cntr0[14]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[14]\);
    
    \sequencer_state1_maj_RNIBBCN[1]\ : NOR2
      port map(A => \sequencer_state1[1]_net_1\, B => 
        \ret_state1[0]_net_1\, Y => N_264);
    
    un1_del_cntr1_I_41 : XOR2
      port map(A => \del_cntr1[12]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[12]\);
    
    un1_del_cntr1_I_67 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_10[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\);
    
    \ret_state1_maj_RNIDJ4O_1[1]\ : NOR2
      port map(A => \ret_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => N_271);
    
    \del_cntr1_maj[1]\ : MAJ3
      port map(A => \del_cntr1_0[1]\, B => \del_cntr1_tmr2_0[1]\, 
        C => \del_cntr1_tmr3_0[1]\, Y => \del_cntr1[1]_net_1\);
    
    \del_cntr1_tmr2[5]\ : DFN1P0
      port map(D => \n_del_cntr1[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[5]\);
    
    \sequencer_state1_maj[3]\ : MAJ3
      port map(A => \sequencer_state1_0[3]\, B => 
        \sequencer_state1_tmr2_0[3]\, C => 
        \sequencer_state1_tmr3_0[3]\, Y => 
        \sequencer_state1[3]_net_1\);
    
    \ret_state1_maj_RNIEFG75[1]\ : AO1
      port map(A => \sequencer_state1_ns_i_a2_0_0[2]\, B => N_270, 
        C => N_255, Y => \sequencer_state1_ns_i_0[2]\);
    
    \del_cntr0_maj_RNIF45Q[9]\ : NOR3A
      port map(A => un5_del_cntr0_6, B => \del_cntr0[9]_net_1\, C
         => \del_cntr0[10]_net_1\, Y => un5_del_cntr0_10);
    
    \ch_out1_tmr2[2]\ : DFN1C0
      port map(D => \ch_out1_maj_RNII09B1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr2_0[2]\);
    
    un1_del_cntr0_I_23 : XOR2
      port map(A => \del_cntr0[5]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_4_0[0]\);
    
    un1_del_cntr0_I_28 : XOR2
      port map(A => \del_cntr0[8]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_7_0[0]\);
    
    un1_del_cntr0_I_49 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[6]\, B => 
        \DWACT_ADD_CI_0_g_array_11_0[0]\, Y => I_49_4);
    
    \sequencer_state1_tmr2[4]\ : DFN1C0
      port map(D => \sequencer_state1_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr2_0[4]\);
    
    \del_cntr0_tmr2[3]\ : DFN1P0
      port map(D => \n_del_cntr0[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[3]\);
    
    \sequencer_state1_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state1_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr2_0[1]\);
    
    \ret_state1_maj_RNIBCF55_0[1]\ : NOR3C
      port map(A => N_270, B => N_274, C => 
        \sequencer_state1_ns_a2_0[3]\, Y => 
        \sequencer_state1_ns[3]\);
    
    un1_del_cntr0_I_63 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_8_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_9_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\);
    
    \sequencer_state0_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state0_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr3_0[0]\);
    
    un1_del_cntr1_I_54 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[10]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, Y => I_54_3);
    
    \sequencer_state0_maj_RNI9N9F[1]\ : NOR2
      port map(A => \sequencer_state0[1]_net_1\, B => 
        \sequencer_state0[0]_net_1\, Y => N_353);
    
    \ret_state1_maj[2]\ : MAJ3
      port map(A => \ret_state1_0[2]\, B => 
        \ret_state1_tmr2_0[2]\, C => \ret_state1_tmr3_0[2]\, Y
         => \ret_state1[2]_net_1\);
    
    un1_del_cntr0_I_85 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_1_0[0]\);
    
    un1_del_cntr0_I_68 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_5_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_6_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_2_0[0]\);
    
    \ret_state1_maj_RNI2T0E1[5]\ : OA1A
      port map(A => N_275, B => \sequencer_state1[5]_net_1\, C
         => \ret_state1[5]_net_1\, Y => 
        \ret_state1_maj_RNI2T0E1[5]_net_1\);
    
    \ret_state0_maj_RNID7QG_0[0]\ : NOR2
      port map(A => \ret_state0[5]_net_1\, B => 
        \ret_state0[0]_net_1\, Y => N_374);
    
    \del_cntr0_maj[5]\ : MAJ3
      port map(A => \del_cntr0_0[5]\, B => \del_cntr0_tmr2_0[5]\, 
        C => \del_cntr0_tmr3_0[5]\, Y => \del_cntr0[5]_net_1\);
    
    \ret_state0_maj_RNIJAPA4[1]\ : NOR3C
      port map(A => N_374, B => N_378, C => 
        \sequencer_state0_ns_a2_0[4]\, Y => 
        \sequencer_state0_ns[4]\);
    
    \del_cntr0_maj[14]\ : MAJ3
      port map(A => \del_cntr0_0[14]\, B => 
        \del_cntr0_tmr2_0[14]\, C => \del_cntr0_tmr3_0[14]\, Y
         => \del_cntr0[14]_net_1\);
    
    \ret_state1_tmr2[5]\ : DFN1P0
      port map(D => \ret_state1_maj_RNI2T0E1[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state1_tmr2_0[5]\);
    
    \ret_state0_maj_RNIB5QG_0[1]\ : NOR2A
      port map(A => \ret_state0[1]_net_1\, B => 
        \ret_state0[2]_net_1\, Y => \sequencer_state0_ns_a2_0[4]\);
    
    un1_del_cntr0_I_11 : AND2
      port map(A => \del_cntr0[6]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\);
    
    \sequencer_state0_maj_RNIKL2E41[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_60_4, Y => 
        \n_del_cntr0[13]\);
    
    \del_cntr1_tmr3[12]\ : DFN1P0
      port map(D => \n_del_cntr1[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[12]\);
    
    \del_cntr1[4]\ : DFN1P0
      port map(D => \n_del_cntr1[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[4]\);
    
    un1_del_cntr0_I_82 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_4_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_5_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\);
    
    un1_del_cntr0_I_8 : AND2
      port map(A => \del_cntr0[8]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\);
    
    \ret_state0_maj_RNIOCK11[0]\ : NOR3B
      port map(A => \ret_state0[0]_net_1\, B => N_375, C => 
        \ret_state0[5]_net_1\, Y => 
        \sequencer_state0_ns_a2_0_1[5]\);
    
    \ch_out1_maj_RNIJ2DG2[0]\ : MX2
      port map(A => \n_ch_out1[0]\, B => \ch_out1[0]_net_1\, S
         => \sequencer_state1[4]_net_1\, Y => 
        \ch_out1_maj_RNIJ2DG2[0]_net_1\);
    
    un1_del_cntr1_I_71 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12[0]\);
    
    un1_del_cntr0_I_55 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[9]\, B => 
        \DWACT_ADD_CI_0_g_array_12_3_0[0]\, Y => I_55_4);
    
    \sequencer_state1_maj_RNIB5KM[1]\ : NOR2
      port map(A => \sequencer_state1[1]_net_1\, B => 
        \sequencer_state1[0]_net_1\, Y => N_249);
    
    \ch_out1_maj[2]\ : MAJ3
      port map(A => \ch_out1_0[2]\, B => \ch_out1_tmr2_0[2]\, C
         => \ch_out1_tmr3_0[2]\, Y => \ch_out1[2]_net_1\);
    
    \del_cntr0[12]\ : DFN1P0
      port map(D => \n_del_cntr0[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[12]\);
    
    \sequencer_state0_maj_RNI8GAO2[0]\ : NOR2B
      port map(A => N_380_0, B => un5_del_cntr0, Y => N_364);
    
    \ret_state1_maj[3]\ : MAJ3
      port map(A => \ret_state1_0[3]\, B => 
        \ret_state1_tmr2_0[3]\, C => \ret_state1_tmr3_0[3]\, Y
         => \ret_state1[3]_net_1\);
    
    \ret_state0_maj_RNIF9QG[3]\ : NOR2A
      port map(A => \ret_state0[4]_net_1\, B => 
        \ret_state0[3]_net_1\, Y => 
        \sequencer_state0_ns_a2_0_0[1]\);
    
    \ch_out0_maj_RNIE4KS[2]\ : MX2A
      port map(A => N_353, B => \ch_mreg_en[3]\, S => 
        \sequencer_state0[4]_net_1\, Y => 
        \ch_out0_maj_RNIE4KS[2]_net_1\);
    
    un1_del_cntr1_I_23 : XOR2
      port map(A => \del_cntr1[5]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\);
    
    \sequencer_state0_maj_RNIOVBPF[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_49_4, Y => 
        \n_del_cntr0[6]\);
    
    un1_del_cntr0_I_75 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_2_0[0]\);
    
    \sequencer_state1_maj_RNILCU11[3]\ : OR2
      port map(A => \sequencer_state1[3]_net_1\, B => N_243, Y
         => \sequencer_state1_ns_0[1]\);
    
    un1_del_cntr0_I_52 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[2]\, B => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, Y => I_52_4);
    
    un1_del_cntr0_I_5 : AND2
      port map(A => \del_cntr0[7]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_7_0[0]\);
    
    \sequencer_state0_maj_RNI0BGQ_0[0]\ : NOR2A
      port map(A => channels_ready(3), B => 
        \sequencer_state0[0]_net_1\, Y => N_380_0);
    
    un1_del_cntr1_I_81 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_10[0]\);
    
    un1_del_cntr1_I_28 : XOR2
      port map(A => \del_cntr1[8]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_7[0]\);
    
    un1_del_cntr1_I_36 : XOR2
      port map(A => \del_cntr1[1]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[1]\);
    
    \sequencer_state1_maj_RNI33SND[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_53_3, Y => 
        \n_del_cntr1[4]\);
    
    \del_cntr0_tmr3[6]\ : DFN1P0
      port map(D => \n_del_cntr0[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[6]\);
    
    \del_cntr0[0]\ : DFN1P0
      port map(D => \n_del_cntr0[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[0]\);
    
    un1_del_cntr0_I_20 : XOR2
      port map(A => \del_cntr0[10]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_9_0[0]\);
    
    \ret_state1_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIRL0E1[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_0[1]\);
    
    un1_del_cntr0_I_72 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_6_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_7_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_3_0[0]\);
    
    un1_del_cntr0_I_7 : AND2
      port map(A => \del_cntr0[2]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\);
    
    \ret_state0_maj_RNIB5QG_1[1]\ : NOR2
      port map(A => \ret_state0[2]_net_1\, B => 
        \ret_state0[1]_net_1\, Y => N_375);
    
    un1_del_cntr1_I_45 : XOR2
      port map(A => \del_cntr1[9]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[9]\);
    
    \del_cntr1_tmr3[10]\ : DFN1P0
      port map(D => \n_del_cntr1[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[10]\);
    
    \ch_out1_tmr2[0]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIJ2DG2[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr2_0[0]\);
    
    \sequencer_state0_tmr2[3]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNISNL68[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state0_tmr2_0[3]\);
    
    \ch_out0_tmr3[1]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIJ0941[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr3_0[1]\);
    
    \ret_state0_maj_RNITVBV[4]\ : OA1A
      port map(A => N_379, B => \sequencer_state0[5]_net_1\, C
         => \ret_state0[4]_net_1\, Y => 
        \ret_state0_maj_RNITVBV[4]_net_1\);
    
    un1_del_cntr1_I_12 : AND2
      port map(A => \del_cntr1[9]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\);
    
    un1_del_cntr1_I_1 : AND2
      port map(A => \del_cntr1[0]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_TMP[0]\);
    
    un1_del_cntr0_I_44 : XOR2
      port map(A => \del_cntr0[10]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[10]\);
    
    \del_cntr0_tmr3[9]\ : DFN1P0
      port map(D => \n_del_cntr0[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[9]\);
    
    \sequencer_state1_maj_RNIC9O38[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_52_3, Y => 
        \n_del_cntr1[2]\);
    
    \del_cntr1_tmr3[2]\ : DFN1P0
      port map(D => \n_del_cntr1[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[2]\);
    
    un1_del_cntr1_I_42 : XOR2
      port map(A => \del_cntr1[0]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[0]\);
    
    un1_del_cntr0_I_60 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[13]\, B => 
        \DWACT_ADD_CI_0_g_array_12_5_0[0]\, Y => I_60_4);
    
    \del_cntr1[0]\ : DFN1P0
      port map(D => \n_del_cntr1[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[0]\);
    
    \del_cntr1_tmr3[7]\ : DFN1P0
      port map(D => \n_del_cntr1[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[7]\);
    
    \del_cntr0_maj[10]\ : MAJ3
      port map(A => \del_cntr0_0[10]\, B => 
        \del_cntr0_tmr2_0[10]\, C => \del_cntr0_tmr3_0[10]\, Y
         => \del_cntr0[10]_net_1\);
    
    \sequencer_state0_maj_RNI52O15_0[3]\ : AO1
      port map(A => \sequencer_state0_ns_a2_0[1]\, B => 
        channels_ready(3), C => \sequencer_state0_ns_0[1]\, Y => 
        \sequencer_state0_ns[1]\);
    
    \ch_out1_maj_RNII09B1[2]\ : MX2A
      port map(A => N_249, B => \ch_out1[2]_net_1\, S => 
        \sequencer_state1[4]_net_1\, Y => 
        \ch_out1_maj_RNII09B1[2]_net_1\);
    
    \ch_out0[2]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIE4KS[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_0[2]\);
    
    un1_del_cntr1_I_53 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[4]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, Y => I_53_3);
    
    \ret_state0_tmr3[4]\ : DFN1C0
      port map(D => \ret_state0_maj_RNITVBV[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_0[4]\);
    
    \ret_state1_maj_RNIDJ4O_0[1]\ : NOR2A
      port map(A => \ret_state1[1]_net_1\, B => 
        \ret_state1[2]_net_1\, Y => \sequencer_state1_ns_a2_0[4]\);
    
    \del_cntr0_maj[7]\ : MAJ3
      port map(A => \del_cntr0_0[7]\, B => \del_cntr0_tmr2_0[7]\, 
        C => \del_cntr0_tmr3_0[7]\, Y => \del_cntr0[7]_net_1\);
    
    un1_del_cntr1_I_58 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[14]\, B => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\, Y => I_58_3);
    
    un1_del_cntr1_I_90 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_3[0]\);
    
    un1_del_cntr0_I_31 : XOR2
      port map(A => \del_cntr0[3]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_2_0[0]\);
    
    \del_cntr1_tmr3[5]\ : DFN1P0
      port map(D => \n_del_cntr1[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[5]\);
    
    \sequencer_state1_maj_RNICD68R[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_57_3, Y => 
        \n_del_cntr1[8]\);
    
    un1_del_cntr0_I_89 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_1_0[0]\);
    
    \sequencer_state1_maj_RNIF36L3[4]\ : NOR3C
      port map(A => un6_del_cntr1, B => 
        \sequencer_state1_ns_a2_2_0[0]\, C => channels_ready(4), 
        Y => N_274);
    
    \sequencer_state0_tmr2[5]\ : DFN1P0
      port map(D => \sequencer_state0_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state0_tmr2_0[5]\);
    
    \del_cntr0_tmr3[8]\ : DFN1P0
      port map(D => \n_del_cntr0[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[8]\);
    
    un1_del_cntr1_I_20 : XOR2
      port map(A => \del_cntr1[10]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_9[0]\);
    
    \sequencer_state0_maj[5]\ : MAJ3
      port map(A => \sequencer_state0_0[5]\, B => 
        \sequencer_state0_tmr2_0[5]\, C => 
        \sequencer_state0_tmr3_0[5]\, Y => 
        \sequencer_state0[5]_net_1\);
    
    \ret_state1[4]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI1S0E1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state1_0[4]\);
    
    \del_cntr1_tmr3[1]\ : DFN1P0
      port map(D => \n_del_cntr1[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[1]\);
    
    \del_cntr1_tmr2[9]\ : DFN1P0
      port map(D => \n_del_cntr1[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[9]\);
    
    \ret_state0_maj_RNIB5QG[1]\ : NOR2A
      port map(A => \ret_state0[2]_net_1\, B => 
        \ret_state0[1]_net_1\, Y => \sequencer_state0_ns_a2_0[3]\);
    
    \del_cntr1[12]\ : DFN1P0
      port map(D => \n_del_cntr1[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[12]\);
    
    \sequencer_state0[1]\ : DFN1C0
      port map(D => \sequencer_state0_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_0[1]\);
    
    \del_cntr0_tmr3[0]\ : DFN1P0
      port map(D => \n_del_cntr0[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[0]\);
    
    \del_cntr0_maj[8]\ : MAJ3
      port map(A => \del_cntr0_0[8]\, B => \del_cntr0_tmr2_0[8]\, 
        C => \del_cntr0_tmr3_0[8]\, Y => \del_cntr0[8]_net_1\);
    
    \sequencer_state1_maj_RNI0PD76_0[3]\ : AO1
      port map(A => \sequencer_state1_ns_a2_0[1]\, B => 
        channels_ready(4), C => \sequencer_state1_ns_0[1]\, Y => 
        \sequencer_state1_ns[1]\);
    
    \sequencer_state1_maj[5]\ : MAJ3
      port map(A => \sequencer_state1_0[5]\, B => 
        \sequencer_state1_tmr2_0[5]\, C => 
        \sequencer_state1_tmr3_0[5]\, Y => 
        \sequencer_state1[5]_net_1\);
    
    \main_sequencer.un5_n_ch_out0\ : NOR2B
      port map(A => channels_on(3), B => dtycyc_en, Y => 
        un5_n_ch_out0);
    
    un1_del_cntr1_I_75 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\);
    
    un1_del_cntr1_I_37 : XOR2
      port map(A => \del_cntr1[14]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[14]\);
    
    \del_cntr1_maj[9]\ : MAJ3
      port map(A => \del_cntr1_0[9]\, B => \del_cntr1_tmr2_0[9]\, 
        C => \del_cntr1_tmr3_0[9]\, Y => \del_cntr1[9]_net_1\);
    
    un1_del_cntr0_I_59 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[7]\, B => 
        \DWACT_ADD_CI_0_g_array_12_2_0[0]\, Y => I_59_4);
    
    un1_del_cntr0_I_12 : AND2
      port map(A => \del_cntr0[9]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_9_0[0]\);
    
    un1_del_cntr0_I_1 : AND2
      port map(A => \del_cntr0[0]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_TMP_0[0]\);
    
    \del_cntr0_tmr3[3]\ : DFN1P0
      port map(D => \n_del_cntr0[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[3]\);
    
    \del_cntr0[2]\ : DFN1P0
      port map(D => \n_del_cntr0[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[2]\);
    
    \del_cntr0_maj[6]\ : MAJ3
      port map(A => \del_cntr0_0[6]\, B => \del_cntr0_tmr2_0[6]\, 
        C => \del_cntr0_tmr3_0[6]\, Y => \del_cntr0[6]_net_1\);
    
    \ch_out0_tmr2[2]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIE4KS[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr2_0[2]\);
    
    \sequencer_state1_tmr3[4]\ : DFN1C0
      port map(D => \sequencer_state1_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr3_0[4]\);
    
    \sequencer_state1_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state1_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr3_0[1]\);
    
    \ret_state0[0]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIMOBV[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_0[0]\);
    
    \del_cntr1[5]\ : DFN1P0
      port map(D => \n_del_cntr1[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[5]\);
    
    \sequencer_state0_tmr3[3]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNISNL68[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state0_tmr3_0[3]\);
    
    un1_del_cntr0_I_79 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_2_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_3_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_1_0[0]\);
    
    \sequencer_state0_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state0_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr2_0[0]\);
    
    un1_del_cntr1_I_72 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_6[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\);
    
    un1_del_cntr1_I_7 : AND2
      port map(A => \del_cntr1[2]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\);
    
    \ret_state1_maj_RNI1S0E1[4]\ : OA1A
      port map(A => N_275, B => \sequencer_state1[5]_net_1\, C
         => \ret_state1[4]_net_1\, Y => 
        \ret_state1_maj_RNI1S0E1[4]_net_1\);
    
    \ret_state1[3]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI0R0E1[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state1_0[3]\);
    
    un1_del_cntr1_I_85 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_1[0]\);
    
    \ret_state1_maj[4]\ : MAJ3
      port map(A => \ret_state1_0[4]\, B => 
        \ret_state1_tmr2_0[4]\, C => \ret_state1_tmr3_0[4]\, Y
         => \ret_state1[4]_net_1\);
    
    \ret_state0_tmr2[5]\ : DFN1P0
      port map(D => \ret_state0_maj_RNIU0CV[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state0_tmr2_0[5]\);
    
    un1_del_cntr0_I_43 : XOR2
      port map(A => \del_cntr0[11]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[11]\);
    
    \ret_state1_maj_RNIHN4O[3]\ : NOR2A
      port map(A => \ret_state1[4]_net_1\, B => 
        \ret_state1[3]_net_1\, Y => 
        \sequencer_state1_ns_a2_0_0[1]\);
    
    \ret_state0[4]\ : DFN1C0
      port map(D => \ret_state0_maj_RNITVBV[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state0_0[4]\);
    
    \del_cntr0[8]\ : DFN1P0
      port map(D => \n_del_cntr0[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[8]\);
    
    \sequencer_state1_maj_RNISMTVF[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_62_3, Y => 
        \n_del_cntr1[5]\);
    
    un1_del_cntr1_I_19 : XOR2
      port map(A => \del_cntr1[7]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\);
    
    \sequencer_state0_maj_RNINDISS[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_48_4, Y => 
        \n_del_cntr0[11]\);
    
    \ret_state0_maj_RNI3F991[1]\ : XA1
      port map(A => \ret_state0[1]_net_1\, B => 
        \ret_state0[2]_net_1\, C => N_358_1, Y => 
        \sequencer_state0_ns_i_a2_0_0[2]\);
    
    un1_del_cntr1_I_49 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[6]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, Y => I_49_3);
    
    un1_del_cntr0_I_48 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[11]\, B => 
        \DWACT_ADD_CI_0_g_array_12_4_0[0]\, Y => I_48_4);
    
    \sequencer_state1_maj_RNII9U11[0]\ : NOR2
      port map(A => N_243, B => \sequencer_state1[0]_net_1\, Y
         => N_265);
    
    \ch_out0_maj[2]\ : MAJ3
      port map(A => \ch_out0_0[2]\, B => \ch_out0_tmr2_0[2]\, C
         => \ch_out0_tmr3_0[2]\, Y => \ch_mreg_en[3]\);
    
    un1_del_cntr1_I_82 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\);
    
    un1_del_cntr1_I_8 : AND2
      port map(A => \del_cntr1[8]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\);
    
    \ret_state1_maj_RNID0E82[3]\ : NOR3C
      port map(A => N_270, B => \sequencer_state1_ns_a2_0_0[1]\, 
        C => N_271, Y => N_266);
    
    \ret_state1[0]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIQK0E1[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_0[0]\);
    
    un1_del_cntr1_I_50 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[12]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, Y => I_50_3);
    
    \sequencer_state0[4]\ : DFN1C0
      port map(D => \sequencer_state0_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_0[4]\);
    
    \ret_state0_maj[5]\ : MAJ3
      port map(A => \ret_state0_0[5]\, B => 
        \ret_state0_tmr2_0[5]\, C => \ret_state0_tmr3_0[5]\, Y
         => \ret_state0[5]_net_1\);
    
    \del_cntr1_tmr3[13]\ : DFN1P0
      port map(D => \n_del_cntr1[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[13]\);
    
    \del_cntr0_maj[0]\ : MAJ3
      port map(A => \del_cntr0_0[0]\, B => \del_cntr0_tmr2_0[0]\, 
        C => \del_cntr0_tmr3_0[0]\, Y => \del_cntr0[0]_net_1\);
    
    \sequencer_state1[5]\ : DFN1P0
      port map(D => \sequencer_state1_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state1_0[5]\);
    
    \sequencer_state1[4]\ : DFN1C0
      port map(D => \sequencer_state1_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_0[4]\);
    
    \del_cntr0_tmr3[14]\ : DFN1P0
      port map(D => \n_del_cntr0[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[14]\);
    
    \del_cntr1_maj[12]\ : MAJ3
      port map(A => \del_cntr1_0[12]\, B => 
        \del_cntr1_tmr2_0[12]\, C => \del_cntr1_tmr3_0[12]\, Y
         => \del_cntr1[12]_net_1\);
    
    \sequencer_state1_maj_RNIQTE31[4]\ : NOR2B
      port map(A => \sequencer_state1[4]_net_1\, B => N_267, Y
         => \sequencer_state1_ns_a2_2_0[0]\);
    
    \ch_out1_maj[1]\ : MAJ3
      port map(A => \ch_out1_0[1]\, B => \ch_out1_tmr2_0[1]\, C
         => \ch_out1_tmr3_0[1]\, Y => \ch_out1[1]_net_1\);
    
    \sequencer_state0_maj_RNIO9FO[5]\ : NOR2A
      port map(A => N_371, B => \sequencer_state0[5]_net_1\, Y
         => N_358_1);
    
    \sequencer_state1_maj[4]\ : MAJ3
      port map(A => \sequencer_state1_0[4]\, B => 
        \sequencer_state1_tmr2_0[4]\, C => 
        \sequencer_state1_tmr3_0[4]\, Y => 
        \sequencer_state1[4]_net_1\);
    
    \del_cntr0_tmr2[13]\ : DFN1P0
      port map(D => \n_del_cntr0[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[13]\);
    
    \ch_out0_maj[0]\ : MAJ3
      port map(A => \ch_out0_0[0]\, B => \ch_out0_tmr2_0[0]\, C
         => \ch_out0_tmr3_0[0]\, Y => \OUT_CHANNEL_VOSG_c[3]\);
    
    \del_cntr1[6]\ : DFN1P0
      port map(D => \n_del_cntr1[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[6]\);
    
    \sequencer_state0_maj_RNITGLRN[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_55_4, Y => 
        \n_del_cntr0[9]\);
    
    \ret_state0_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNINPBV[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_0[1]\);
    
    \del_cntr0_tmr3[11]\ : DFN1P0
      port map(D => \n_del_cntr0[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[11]\);
    
    \sequencer_state0_tmr3[5]\ : DFN1P0
      port map(D => \sequencer_state0_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state0_tmr3_0[5]\);
    
    \sequencer_state1_maj_RNIDQJI4[4]\ : NOR2B
      port map(A => \sequencer_state1[4]_net_1\, B => N_236, Y
         => \sequencer_state1_ns_a2_0[1]\);
    
    \sequencer_state1_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state1_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr2_0[2]\);
    
    \del_cntr1_maj[3]\ : MAJ3
      port map(A => \del_cntr1_0[3]\, B => \del_cntr1_tmr2_0[3]\, 
        C => \del_cntr1_tmr3_0[3]\, Y => \del_cntr1[3]_net_1\);
    
    un1_del_cntr0_I_35 : XOR2
      port map(A => \del_cntr0[7]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[7]\);
    
    \ret_state1_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIQK0E1[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_0[0]\);
    
    \del_cntr1_tmr3[4]\ : DFN1P0
      port map(D => \n_del_cntr1[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[4]\);
    
    un1_del_cntr0_I_26 : XOR2
      port map(A => \del_cntr0[6]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_5_0[0]\);
    
    \sequencer_state1_maj_RNI0PD76[3]\ : AO1A
      port map(A => channels_ready(4), B => 
        \sequencer_state1_ns_a2_0[0]\, C => N_251, Y => 
        \sequencer_state1_ns[0]\);
    
    \del_cntr1_maj_RNINJRU1[10]\ : NOR3C
      port map(A => un6_del_cntr1_10, B => un6_del_cntr1_9, C => 
        un6_del_cntr1_11, Y => un6_del_cntr1);
    
    \del_cntr1[3]\ : DFN1P0
      port map(D => \n_del_cntr1[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[3]\);
    
    \ret_state1_maj[1]\ : MAJ3
      port map(A => \ret_state1_0[1]\, B => 
        \ret_state1_tmr2_0[1]\, C => \ret_state1_tmr3_0[1]\, Y
         => \ret_state1[1]_net_1\);
    
    un1_del_cntr1_I_65 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\);
    
    un1_del_cntr0_I_54 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[10]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\, Y => I_54_4);
    
    un1_del_cntr0_I_90 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_8_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_3_0[0]\);
    
    \del_cntr1_tmr2[2]\ : DFN1P0
      port map(D => \n_del_cntr1[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[2]\);
    
    \sequencer_state1_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state1_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr3_0[2]\);
    
    \sequencer_state0_maj_RNI9T1G[1]\ : NOR2
      port map(A => \sequencer_state0[1]_net_1\, B => 
        \ret_state0[0]_net_1\, Y => N_368);
    
    un1_del_cntr0_I_19 : XOR2
      port map(A => \del_cntr0[7]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_6_0[0]\);
    
    \sequencer_state1_maj_RNISM0E1[3]\ : AO1A
      port map(A => N_243, B => \ret_state1[2]_net_1\, C => 
        \sequencer_state1[3]_net_1\, Y => 
        \sequencer_state1_maj_RNISM0E1[3]_net_1\);
    
    un1_del_cntr0_I_74 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_3_0[0]\);
    
    \sequencer_state1_maj_RNI470CJ[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_49_3, Y => 
        \n_del_cntr1[6]\);
    
    \del_cntr1_tmr2[7]\ : DFN1P0
      port map(D => \n_del_cntr1[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[7]\);
    
    \ch_out0_tmr2[0]\ : DFN1C0
      port map(D => \ch_out0_maj_RNID4O12[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr2_0[0]\);
    
    \sequencer_state1_maj[0]\ : MAJ3
      port map(A => \sequencer_state1_0[0]\, B => 
        \sequencer_state1_tmr2_0[0]\, C => 
        \sequencer_state1_tmr3_0[0]\, Y => 
        \sequencer_state1[0]_net_1\);
    
    un1_del_cntr1_I_62 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[5]\, B => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, Y => I_62_3);
    
    un1_del_cntr1_I_6 : AND2
      port map(A => \del_cntr1[3]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\);
    
    un1_del_cntr0_I_66 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_2_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_3_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_1_0[0]\);
    
    un1_del_cntr0_I_40 : XOR2
      port map(A => \del_cntr0[8]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[8]\);
    
    \del_cntr1_maj_RNIMGVU[14]\ : NOR3C
      port map(A => un6_del_cntr1_2, B => un6_del_cntr1_1, C => 
        un6_del_cntr1_7, Y => un6_del_cntr1_11);
    
    un1_del_cntr1_I_79 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\);
    
    \sequencer_state0_maj_RNISNL68[5]\ : NOR3A
      port map(A => channels_ready(3), B => 
        \sequencer_state0_ns_i_0[2]\, C => N_357, Y => 
        \sequencer_state0_maj_RNISNL68[5]_net_1\);
    
    un1_del_cntr1_I_14 : AND2
      port map(A => \del_cntr1[5]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\);
    
    \sequencer_state0_tmr2[4]\ : DFN1C0
      port map(D => \sequencer_state0_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr2_0[4]\);
    
    \ret_state1[1]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIRL0E1[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_0[1]\);
    
    \sequencer_state0_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state0_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr2_0[1]\);
    
    un1_del_cntr1_I_44 : XOR2
      port map(A => \del_cntr1[10]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[10]\);
    
    un1_del_cntr1_I_89 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_1[0]\);
    
    \ret_state1_tmr2[3]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI0R0E1[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_0[3]\);
    
    \ret_state1[2]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNISM0E1[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_0[2]\);
    
    \del_cntr0_tmr2[8]\ : DFN1P0
      port map(D => \n_del_cntr0[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[8]\);
    
    \ch_out0_maj[1]\ : MAJ3
      port map(A => \ch_out0_0[1]\, B => \ch_out0_tmr2_0[1]\, C
         => \ch_out0_tmr3_0[1]\, Y => \ch_iaux_en[3]\);
    
    \del_cntr0_maj_RNI9LB4[0]\ : NOR2
      port map(A => \del_cntr0[1]_net_1\, B => 
        \del_cntr0[0]_net_1\, Y => un5_del_cntr0_1);
    
    \ret_state1_maj_RNIHN4O_0[3]\ : NOR2
      port map(A => \ret_state1[3]_net_1\, B => 
        \ret_state1[4]_net_1\, Y => N_267);
    
    \del_cntr1_tmr2[12]\ : DFN1P0
      port map(D => \n_del_cntr1[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[12]\);
    
    \del_cntr0_tmr2[0]\ : DFN1P0
      port map(D => \n_del_cntr0[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[0]\);
    
    \del_cntr0_maj_RNIFRB4[3]\ : NOR2
      port map(A => \del_cntr0[4]_net_1\, B => 
        \del_cntr0[3]_net_1\, Y => un5_del_cntr0_2);
    
    un1_del_cntr1_I_26 : XOR2
      port map(A => \del_cntr1[6]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_5[0]\);
    
    \sequencer_state0_maj_RNIINUM[3]\ : OR2
      port map(A => \sequencer_state0[3]_net_1\, B => N_347, Y
         => \sequencer_state0_ns_0[1]\);
    
    un1_del_cntr0_I_83 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_1_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\);
    
    \sequencer_state0_maj_RNIOFA44[0]\ : OR3
      port map(A => N_379, B => N_364, C => 
        \DWACT_ADD_CI_0_partial_sum_0[0]\, Y => \n_del_cntr0[0]\);
    
    \sequencer_state0_maj_RNINPBV[1]\ : NOR3
      port map(A => \sequencer_state0[3]_net_1\, B => 
        \sequencer_state0[1]_net_1\, C => N_367, Y => 
        \sequencer_state0_maj_RNINPBV[1]_net_1\);
    
    \sequencer_state1_maj_RNI8NBN01[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_54_3, Y => 
        \n_del_cntr1[10]\);
    
    \sequencer_state1_maj_RNID7KM[2]\ : OR2
      port map(A => \sequencer_state1[2]_net_1\, B => 
        \sequencer_state1[1]_net_1\, Y => N_243);
    
    \sequencer_state0_maj[0]\ : MAJ3
      port map(A => \sequencer_state0_0[0]\, B => 
        \sequencer_state0_tmr2_0[0]\, C => 
        \sequencer_state0_tmr3_0[0]\, Y => 
        \sequencer_state0[0]_net_1\);
    
    \ret_state0_maj_RNIJAPA4_0[1]\ : NOR3C
      port map(A => N_374, B => N_378, C => 
        \sequencer_state0_ns_a2_0[3]\, Y => 
        \sequencer_state0_ns[3]\);
    
    un1_del_cntr1_I_31 : XOR2
      port map(A => \del_cntr1[3]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\);
    
    \ret_state0_maj_RNINQTN3[0]\ : NOR3C
      port map(A => un5_del_cntr0, B => 
        \sequencer_state0_ns_a2_2_0[0]\, C => 
        \sequencer_state0_ns_a2_0_1[0]\, Y => N_355);
    
    \ret_state1_maj_RNI0R0E1[3]\ : OA1A
      port map(A => N_275, B => \sequencer_state1[5]_net_1\, C
         => \ret_state1[3]_net_1\, Y => 
        \ret_state1_maj_RNI0R0E1[3]_net_1\);
    
    \ret_state0_maj_RNIGM3Q1[0]\ : NOR3C
      port map(A => N_358_1, B => N_342_i, C => N_375, Y => N_359);
    
    \ret_state0_maj[1]\ : MAJ3
      port map(A => \ret_state0_0[1]\, B => 
        \ret_state0_tmr2_0[1]\, C => \ret_state0_tmr3_0[1]\, Y
         => \ret_state0[1]_net_1\);
    
    \del_cntr1[9]\ : DFN1P0
      port map(D => \n_del_cntr1[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[9]\);
    
    un1_del_cntr0_I_88 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_0[0]\);
    
    un1_del_cntr0_I_27 : XOR2
      port map(A => \del_cntr0[11]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_10_0[0]\);
    
    \sequencer_state1[0]\ : DFN1C0
      port map(D => \sequencer_state1_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_0[0]\);
    
    \del_cntr1_tmr2[3]\ : DFN1P0
      port map(D => \n_del_cntr1[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[3]\);
    
    un1_del_cntr0_I_53 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[4]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, Y => I_53_4);
    
    \del_cntr1_tmr3[11]\ : DFN1P0
      port map(D => \n_del_cntr1[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[11]\);
    
    un1_del_cntr0_I_14 : AND2
      port map(A => \del_cntr0[5]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_5_0[0]\);
    
    \del_cntr0_tmr2[6]\ : DFN1P0
      port map(D => \n_del_cntr0[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[6]\);
    
    \sequencer_state1_maj_RNILCU11_0[3]\ : NOR2
      port map(A => \sequencer_state1[3]_net_1\, B => N_243, Y
         => \sequencer_state1_ns_a2_0[0]\);
    
    un1_del_cntr0_I_73 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_12_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_13_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_6_0[0]\);
    
    un1_del_cntr0_I_58 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[14]\, B => 
        \DWACT_ADD_CI_0_g_array_11_2_0[0]\, Y => I_58_4);
    
    \del_cntr1_maj[13]\ : MAJ3
      port map(A => \del_cntr1_0[13]\, B => 
        \del_cntr1_tmr2_0[13]\, C => \del_cntr1_tmr3_0[13]\, Y
         => \del_cntr1[13]_net_1\);
    
    \del_cntr0_tmr3[12]\ : DFN1P0
      port map(D => \n_del_cntr0[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[12]\);
    
    un1_del_cntr0_I_67 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_10_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_11_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_5_0[0]\);
    
    un1_del_cntr0_I_39 : XOR2
      port map(A => \del_cntr0[13]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[13]\);
    
    \del_cntr1_tmr2[10]\ : DFN1P0
      port map(D => \n_del_cntr1[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[10]\);
    
    un1_del_cntr1_I_74 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\);
    
    \del_cntr0_tmr3[10]\ : DFN1P0
      port map(D => \n_del_cntr0[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_0[10]\);
    
    un1_del_cntr1_I_69 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\);
    
    un1_del_cntr0_I_78 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\);
    
    un1_del_cntr1_I_13 : AND2
      port map(A => \del_cntr1[12]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\);
    
    \ret_state1_maj[5]\ : MAJ3
      port map(A => \ret_state1_0[5]\, B => 
        \ret_state1_tmr2_0[5]\, C => \ret_state1_tmr3_0[5]\, Y
         => \ret_state1[5]_net_1\);
    
    un1_del_cntr1_I_56 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[1]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, Y => I_56_3);
    
    \ret_state0_maj[4]\ : MAJ3
      port map(A => \ret_state0_0[4]\, B => 
        \ret_state0_tmr2_0[4]\, C => \ret_state0_tmr3_0[4]\, Y
         => \ret_state0[4]_net_1\);
    
    un1_del_cntr1_I_43 : XOR2
      port map(A => \del_cntr1[11]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[11]\);
    
    \sequencer_state1_maj_RNIQK0E1[2]\ : NOR3
      port map(A => \sequencer_state1[3]_net_1\, B => 
        \sequencer_state1[2]_net_1\, C => N_264, Y => 
        \sequencer_state1_maj_RNIQK0E1[2]_net_1\);
    
    \sequencer_state1_maj_RNID98GT[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_55_3, Y => 
        \n_del_cntr1[9]\);
    
    un1_del_cntr1_I_18 : AND2
      port map(A => \del_cntr1[1]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\);
    
    \ret_state1_maj_RNI4K974[3]\ : OR2A
      port map(A => un6_del_cntr1, B => N_266, Y => N_236);
    
    un1_del_cntr1_I_48 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[11]\, B => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\, Y => I_48_3);
    
    \del_cntr0_maj[2]\ : MAJ3
      port map(A => \del_cntr0_0[2]\, B => \del_cntr0_tmr2_0[2]\, 
        C => \del_cntr0_tmr3_0[2]\, Y => \del_cntr0[2]_net_1\);
    
    \main_sequencer.un2_n_ch_out1\ : NOR2B
      port map(A => channels_on(4), B => dtycyc_en, Y => 
        un2_n_ch_out1);
    
    \ret_state0_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIMOBV[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_0[0]\);
    
    \del_cntr1_maj[8]\ : MAJ3
      port map(A => \del_cntr1_0[8]\, B => \del_cntr1_tmr2_0[8]\, 
        C => \del_cntr1_tmr3_0[8]\, Y => \del_cntr1[8]_net_1\);
    
    un1_del_cntr1_I_27 : XOR2
      port map(A => \del_cntr1[11]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\);
    
    \del_cntr1_tmr3[6]\ : DFN1P0
      port map(D => \n_del_cntr1[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[6]\);
    
    \ch_out0[0]\ : DFN1C0
      port map(D => \ch_out0_maj_RNID4O12[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_0[0]\);
    
    un1_del_cntr0_I_80 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_4_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_5_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_2_0[0]\);
    
    \del_cntr0_tmr2[1]\ : DFN1P0
      port map(D => \n_del_cntr0[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_0[1]\);
    
    \sequencer_state0_maj_RNIBV1G[2]\ : NOR2
      port map(A => \sequencer_state0[2]_net_1\, B => 
        \ret_state0[1]_net_1\, Y => N_367);
    
    \del_cntr1_tmr3[14]\ : DFN1P0
      port map(D => \n_del_cntr1[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[14]\);
    
    \del_cntr0[6]\ : DFN1P0
      port map(D => \n_del_cntr0[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[6]\);
    
    \sequencer_state1_maj_RNI3K5U_1[0]\ : NOR2A
      port map(A => channels_ready(4), B => 
        \sequencer_state1[0]_net_1\, Y => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\);
    
    \sequencer_state0_maj[2]\ : MAJ3
      port map(A => \sequencer_state0_0[2]\, B => 
        \sequencer_state0_tmr2_0[2]\, C => 
        \sequencer_state0_tmr3_0[2]\, Y => 
        \sequencer_state0[2]_net_1\);
    
    \del_cntr1_maj[11]\ : MAJ3
      port map(A => \del_cntr1_0[11]\, B => 
        \del_cntr1_tmr2_0[11]\, C => \del_cntr1_tmr3_0[11]\, Y
         => \del_cntr1[11]_net_1\);
    
    \ret_state0[2]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIOQBV[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_0[2]\);
    
    \sequencer_state0[2]\ : DFN1C0
      port map(D => \sequencer_state0_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_0[2]\);
    
    \ret_state1_maj_RNIDQJI4[0]\ : NOR3C
      port map(A => un6_del_cntr1, B => 
        \sequencer_state1_ns_a2_2_0[0]\, C => 
        \sequencer_state1_ns_a2_0_1[0]\, Y => N_251);
    
    \del_cntr1_tmr3[9]\ : DFN1P0
      port map(D => \n_del_cntr1[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[9]\);
    
    \del_cntr0_maj_RNIA3O8[5]\ : NOR3A
      port map(A => un5_del_cntr0_4, B => \del_cntr0[5]_net_1\, C
         => \del_cntr0[6]_net_1\, Y => un5_del_cntr0_9);
    
    \del_cntr1_maj_RNIEVCN[5]\ : NOR3A
      port map(A => un6_del_cntr1_4, B => \del_cntr1[6]_net_1\, C
         => \del_cntr1[5]_net_1\, Y => un6_del_cntr1_9);
    
    \ch_out1_tmr3[0]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIJ2DG2[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr3_0[0]\);
    
    un1_del_cntr0_I_50 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[12]\, B => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, Y => I_50_4);
    
    \del_cntr0[3]\ : DFN1P0
      port map(D => \n_del_cntr0[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[3]\);
    
    \sequencer_state1_maj_RNI9MUBC1[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_58_3, Y => 
        \n_del_cntr1[14]\);
    
    \ret_state0_maj_RNIFR8G3[3]\ : OR2A
      port map(A => un5_del_cntr0, B => N_370, Y => N_340);
    
    un1_del_cntr1_I_35 : XOR2
      port map(A => \del_cntr1[7]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[7]\);
    
    \sequencer_state0_tmr3[4]\ : DFN1C0
      port map(D => \sequencer_state0_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr3_0[4]\);
    
    un1_del_cntr0_I_13 : AND2
      port map(A => \del_cntr0[12]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\);
    
    \sequencer_state0_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state0_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr3_0[1]\);
    
    un1_del_cntr0_I_70 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1_0[0]\);
    
    un1_del_cntr0_I_46 : XOR2
      port map(A => \del_cntr0[6]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[6]\);
    
    \del_cntr0_maj_RNIN3C4[7]\ : NOR2
      port map(A => \del_cntr0[8]_net_1\, B => 
        \del_cntr0[7]_net_1\, Y => un5_del_cntr0_4);
    
    un1_del_cntr0_I_34 : XOR2
      port map(A => \del_cntr0[4]_net_1\, B => 
        \sequencer_state0_maj_RNI0BGQ_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[4]\);
    
    \ret_state0_tmr2[3]\ : DFN1C0
      port map(D => \ret_state0_maj_RNISUBV[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_0[3]\);
    
    un1_del_cntr0_I_18 : AND2
      port map(A => \del_cntr0[1]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_1_0[0]\);
    
    un1_del_cntr1_I_73 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_12[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\);
    
    un1_del_cntr1_I_64 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0[0]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1[0]\);
    
    \sequencer_state0[3]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNISNL68[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state0_0[3]\);
    
    un1_del_cntr1_I_10 : AND2
      port map(A => \del_cntr1[4]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\);
    
    \del_cntr1_maj_RNIC4MB[0]\ : NOR2
      port map(A => \del_cntr1[2]_net_1\, B => 
        \del_cntr1[0]_net_1\, Y => un6_del_cntr1_1);
    
    un1_del_cntr1_I_57 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[8]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, Y => I_57_3);
    
    \sequencer_state0_maj[1]\ : MAJ3
      port map(A => \sequencer_state0_0[1]\, B => 
        \sequencer_state0_tmr2_0[1]\, C => 
        \sequencer_state0_tmr3_0[1]\, Y => 
        \sequencer_state0[1]_net_1\);
    
    un1_del_cntr1_I_40 : XOR2
      port map(A => \del_cntr1[8]_net_1\, B => 
        \sequencer_state1_maj_RNI3K5U_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[8]\);
    
    \sequencer_state1_maj[1]\ : MAJ3
      port map(A => \sequencer_state1_0[1]\, B => 
        \sequencer_state1_tmr2_0[1]\, C => 
        \sequencer_state1_tmr3_0[1]\, Y => 
        \sequencer_state1[1]_net_1\);
    
    un1_del_cntr1_I_78 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\);
    
    \sequencer_state1_maj_RNIE9OR1[5]\ : MX2C
      port map(A => \sequencer_state1[5]_net_1\, B => 
        un2_n_ch_out1, S => \sequencer_state1[0]_net_1\, Y => 
        \n_ch_out1[0]\);
    
    \del_cntr0_maj_RNIFTSQ[0]\ : NOR3C
      port map(A => un5_del_cntr0_2, B => un5_del_cntr0_1, C => 
        un5_del_cntr0_7, Y => un5_del_cntr0_11);
    
    \sequencer_state0_maj_RNI83DQ6[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_52_4, Y => 
        \n_del_cntr0[2]\);
    
    \ret_state1_tmr3[3]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI0R0E1[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_0[3]\);
    
    \del_cntr1_tmr3[8]\ : DFN1P0
      port map(D => \n_del_cntr1[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_0[8]\);
    
    un1_del_cntr1_I_83 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_3[0]\);
    
    \sequencer_state1_maj_RNIDDCN[2]\ : NOR2
      port map(A => \sequencer_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => N_263);
    
    \del_cntr1_tmr2[13]\ : DFN1P0
      port map(D => \n_del_cntr1[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_0[13]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity CCC_Glob_3xBuff is

    port( sca_clk_out_c   : in    std_logic;
          gb_spi_rst_b    : out   std_logic;
          CLK40M_OSC_c    : in    std_logic;
          GLB             : out   std_logic;
          master_rst_b    : in    std_logic;
          sca_reset_out_c : in    std_logic
        );

end CCC_Glob_3xBuff;

architecture DEF_ARCH of CCC_Glob_3xBuff is 

  component DYNCCC
    generic (VCOFREQUENCY:real := 0.0);

    port( CLKA      : in    std_logic := 'U';
          EXTFB     : in    std_logic := 'U';
          POWERDOWN : in    std_logic := 'U';
          GLA       : out   std_logic;
          LOCK      : out   std_logic;
          CLKB      : in    std_logic := 'U';
          GLB       : out   std_logic;
          YB        : out   std_logic;
          CLKC      : in    std_logic := 'U';
          GLC       : out   std_logic;
          YC        : out   std_logic;
          SDIN      : in    std_logic := 'U';
          SCLK      : in    std_logic := 'U';
          SSHIFT    : in    std_logic := 'U';
          SUPDATE   : in    std_logic := 'U';
          MODE      : in    std_logic := 'U';
          SDOUT     : out   std_logic;
          OADIV0    : in    std_logic := 'U';
          OADIV1    : in    std_logic := 'U';
          OADIV2    : in    std_logic := 'U';
          OADIV3    : in    std_logic := 'U';
          OADIV4    : in    std_logic := 'U';
          OAMUX0    : in    std_logic := 'U';
          OAMUX1    : in    std_logic := 'U';
          OAMUX2    : in    std_logic := 'U';
          DLYGLA0   : in    std_logic := 'U';
          DLYGLA1   : in    std_logic := 'U';
          DLYGLA2   : in    std_logic := 'U';
          DLYGLA3   : in    std_logic := 'U';
          DLYGLA4   : in    std_logic := 'U';
          OBDIV0    : in    std_logic := 'U';
          OBDIV1    : in    std_logic := 'U';
          OBDIV2    : in    std_logic := 'U';
          OBDIV3    : in    std_logic := 'U';
          OBDIV4    : in    std_logic := 'U';
          OBMUX0    : in    std_logic := 'U';
          OBMUX1    : in    std_logic := 'U';
          OBMUX2    : in    std_logic := 'U';
          DLYYB0    : in    std_logic := 'U';
          DLYYB1    : in    std_logic := 'U';
          DLYYB2    : in    std_logic := 'U';
          DLYYB3    : in    std_logic := 'U';
          DLYYB4    : in    std_logic := 'U';
          DLYGLB0   : in    std_logic := 'U';
          DLYGLB1   : in    std_logic := 'U';
          DLYGLB2   : in    std_logic := 'U';
          DLYGLB3   : in    std_logic := 'U';
          DLYGLB4   : in    std_logic := 'U';
          OCDIV0    : in    std_logic := 'U';
          OCDIV1    : in    std_logic := 'U';
          OCDIV2    : in    std_logic := 'U';
          OCDIV3    : in    std_logic := 'U';
          OCDIV4    : in    std_logic := 'U';
          OCMUX0    : in    std_logic := 'U';
          OCMUX1    : in    std_logic := 'U';
          OCMUX2    : in    std_logic := 'U';
          DLYYC0    : in    std_logic := 'U';
          DLYYC1    : in    std_logic := 'U';
          DLYYC2    : in    std_logic := 'U';
          DLYYC3    : in    std_logic := 'U';
          DLYYC4    : in    std_logic := 'U';
          DLYGLC0   : in    std_logic := 'U';
          DLYGLC1   : in    std_logic := 'U';
          DLYGLC2   : in    std_logic := 'U';
          DLYGLC3   : in    std_logic := 'U';
          DLYGLC4   : in    std_logic := 'U';
          FINDIV0   : in    std_logic := 'U';
          FINDIV1   : in    std_logic := 'U';
          FINDIV2   : in    std_logic := 'U';
          FINDIV3   : in    std_logic := 'U';
          FINDIV4   : in    std_logic := 'U';
          FINDIV5   : in    std_logic := 'U';
          FINDIV6   : in    std_logic := 'U';
          FBDIV0    : in    std_logic := 'U';
          FBDIV1    : in    std_logic := 'U';
          FBDIV2    : in    std_logic := 'U';
          FBDIV3    : in    std_logic := 'U';
          FBDIV4    : in    std_logic := 'U';
          FBDIV5    : in    std_logic := 'U';
          FBDIV6    : in    std_logic := 'U';
          FBDLY0    : in    std_logic := 'U';
          FBDLY1    : in    std_logic := 'U';
          FBDLY2    : in    std_logic := 'U';
          FBDLY3    : in    std_logic := 'U';
          FBDLY4    : in    std_logic := 'U';
          FBSEL0    : in    std_logic := 'U';
          FBSEL1    : in    std_logic := 'U';
          XDLYSEL   : in    std_logic := 'U';
          VCOSEL0   : in    std_logic := 'U';
          VCOSEL1   : in    std_logic := 'U';
          VCOSEL2   : in    std_logic := 'U'
        );
  end component;

  component PLLINT
    port( A : in    std_logic := 'U';
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

  component GND
    port( Y : out   std_logic
        );
  end component;

    signal spi_rst_b, CLKAP, GLA, LOCK, SDOUT, Core_YB, Core_YC, 
        CLKBP, CCC_Glob_3xBuff_GND, CCC_Glob_3xBuff_VCC
         : std_logic;

begin 


    Core : DYNCCC
      generic map(VCOFREQUENCY => 40.0)

      port map(CLKA => CLKAP, EXTFB => CCC_Glob_3xBuff_GND, 
        POWERDOWN => CCC_Glob_3xBuff_GND, GLA => GLA, LOCK => 
        LOCK, CLKB => CLKBP, GLB => GLB, YB => Core_YB, CLKC => 
        spi_rst_b, GLC => gb_spi_rst_b, YC => Core_YC, SDIN => 
        CCC_Glob_3xBuff_GND, SCLK => CCC_Glob_3xBuff_GND, SSHIFT
         => CCC_Glob_3xBuff_GND, SUPDATE => CCC_Glob_3xBuff_GND, 
        MODE => CCC_Glob_3xBuff_GND, SDOUT => SDOUT, OADIV0 => 
        CCC_Glob_3xBuff_GND, OADIV1 => CCC_Glob_3xBuff_GND, 
        OADIV2 => CCC_Glob_3xBuff_GND, OADIV3 => 
        CCC_Glob_3xBuff_GND, OADIV4 => CCC_Glob_3xBuff_GND, 
        OAMUX0 => CCC_Glob_3xBuff_GND, OAMUX1 => 
        CCC_Glob_3xBuff_GND, OAMUX2 => CCC_Glob_3xBuff_GND, 
        DLYGLA0 => CCC_Glob_3xBuff_GND, DLYGLA1 => 
        CCC_Glob_3xBuff_GND, DLYGLA2 => CCC_Glob_3xBuff_GND, 
        DLYGLA3 => CCC_Glob_3xBuff_GND, DLYGLA4 => 
        CCC_Glob_3xBuff_GND, OBDIV0 => CCC_Glob_3xBuff_GND, 
        OBDIV1 => CCC_Glob_3xBuff_GND, OBDIV2 => 
        CCC_Glob_3xBuff_GND, OBDIV3 => CCC_Glob_3xBuff_GND, 
        OBDIV4 => CCC_Glob_3xBuff_GND, OBMUX0 => 
        CCC_Glob_3xBuff_GND, OBMUX1 => CCC_Glob_3xBuff_GND, 
        OBMUX2 => CCC_Glob_3xBuff_GND, DLYYB0 => 
        CCC_Glob_3xBuff_GND, DLYYB1 => CCC_Glob_3xBuff_GND, 
        DLYYB2 => CCC_Glob_3xBuff_GND, DLYYB3 => 
        CCC_Glob_3xBuff_GND, DLYYB4 => CCC_Glob_3xBuff_GND, 
        DLYGLB0 => CCC_Glob_3xBuff_GND, DLYGLB1 => 
        CCC_Glob_3xBuff_GND, DLYGLB2 => CCC_Glob_3xBuff_GND, 
        DLYGLB3 => CCC_Glob_3xBuff_GND, DLYGLB4 => 
        CCC_Glob_3xBuff_GND, OCDIV0 => CCC_Glob_3xBuff_GND, 
        OCDIV1 => CCC_Glob_3xBuff_GND, OCDIV2 => 
        CCC_Glob_3xBuff_GND, OCDIV3 => CCC_Glob_3xBuff_GND, 
        OCDIV4 => CCC_Glob_3xBuff_GND, OCMUX0 => 
        CCC_Glob_3xBuff_GND, OCMUX1 => CCC_Glob_3xBuff_GND, 
        OCMUX2 => CCC_Glob_3xBuff_GND, DLYYC0 => 
        CCC_Glob_3xBuff_GND, DLYYC1 => CCC_Glob_3xBuff_GND, 
        DLYYC2 => CCC_Glob_3xBuff_GND, DLYYC3 => 
        CCC_Glob_3xBuff_GND, DLYYC4 => CCC_Glob_3xBuff_GND, 
        DLYGLC0 => CCC_Glob_3xBuff_GND, DLYGLC1 => 
        CCC_Glob_3xBuff_GND, DLYGLC2 => CCC_Glob_3xBuff_GND, 
        DLYGLC3 => CCC_Glob_3xBuff_GND, DLYGLC4 => 
        CCC_Glob_3xBuff_GND, FINDIV0 => CCC_Glob_3xBuff_GND, 
        FINDIV1 => CCC_Glob_3xBuff_GND, FINDIV2 => 
        CCC_Glob_3xBuff_GND, FINDIV3 => CCC_Glob_3xBuff_GND, 
        FINDIV4 => CCC_Glob_3xBuff_GND, FINDIV5 => 
        CCC_Glob_3xBuff_GND, FINDIV6 => CCC_Glob_3xBuff_GND, 
        FBDIV0 => CCC_Glob_3xBuff_GND, FBDIV1 => 
        CCC_Glob_3xBuff_GND, FBDIV2 => CCC_Glob_3xBuff_GND, 
        FBDIV3 => CCC_Glob_3xBuff_GND, FBDIV4 => 
        CCC_Glob_3xBuff_GND, FBDIV5 => CCC_Glob_3xBuff_GND, 
        FBDIV6 => CCC_Glob_3xBuff_GND, FBDLY0 => 
        CCC_Glob_3xBuff_GND, FBDLY1 => CCC_Glob_3xBuff_GND, 
        FBDLY2 => CCC_Glob_3xBuff_GND, FBDLY3 => 
        CCC_Glob_3xBuff_GND, FBDLY4 => CCC_Glob_3xBuff_GND, 
        FBSEL0 => CCC_Glob_3xBuff_VCC, FBSEL1 => 
        CCC_Glob_3xBuff_GND, XDLYSEL => CCC_Glob_3xBuff_GND, 
        VCOSEL0 => CCC_Glob_3xBuff_GND, VCOSEL1 => 
        CCC_Glob_3xBuff_GND, VCOSEL2 => CCC_Glob_3xBuff_GND);
    
    pllint1 : PLLINT
      port map(A => CLK40M_OSC_c, Y => CLKAP);
    
    VCC_i : VCC
      port map(Y => CCC_Glob_3xBuff_VCC);
    
    Core_RNO : NOR2B
      port map(A => sca_reset_out_c, B => master_rst_b, Y => 
        spi_rst_b);
    
    pllint2 : PLLINT
      port map(A => sca_clk_out_c, Y => CLKBP);
    
    GND_i : GND
      port map(Y => CCC_Glob_3xBuff_GND);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity IIR_FILT_4_1 is

    port( IN_INVOLTAGE_OK_c_0    : in    std_logic;
          channel_involtage_ok_0 : out   std_logic;
          master_rst_b           : in    std_logic;
          clk_5m_gl              : in    std_logic
        );

end IIR_FILT_4_1;

architecture DEF_ARCH of IIR_FILT_4_1 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AO1A
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

  component XA1A
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

  component VCC
    port( Y : out   std_logic
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

  component AO1
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

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component NOR3
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

    signal n_sigout15lto7_2, \FILT_OUT[3]_net_1\, 
        \FILT_OUT[7]_net_1\, \FILT_OUT[5]_net_1\, 
        n_sigout15lto7_1, \FILT_OUT[6]_net_1\, 
        \FILT_OUT[4]_net_1\, n_sigout3lto6_1, n_sigout3lto6_0, 
        N_23_i, i10_mux, N_27_i, i6_mux, N_29_i, i4_mux, N_31_i, 
        \FILT_OUT[2]_net_1\, i2_mux, N_33_i, \FILT_OUT[0]_net_1\, 
        \FILT_OUT[1]_net_1\, ADD_4x4_slow_I1_S_1, I0_un1_CO1, 
        \SUM_IN_A[5]_net_1\, N70, n_sigout3, 
        \THRESH_VAL_maj_RNI8TP62[1]_net_1\, \THRESH_VAL[1]_net_1\, 
        N_113, \THRESH_VAL_ns[0]\, \THRESH_VAL[0]_net_1\, N_93, 
        N_95, ADD_4x4_slow_I2_S_1, i12_mux, ADD_4x4_slow_I0_S_1, 
        i8_mux, N_40, \SUM_IN_A[4]_net_1\, ADD_4x4_slow_I3_Y_1, 
        \SIGOUT_maj_RNIT6FB3\, \channel_involtage_ok[3]\, 
        \SIG_IN_DEL_maj_RNIEVME\, \SIG_IN_DEL\, 
        \SIG_IN_DEL_maj_RNIEVME_0\, \FILT_OUT_1[7]\, 
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
        SIGOUT_tmr3_1, SIG_IN_DEL_1, SIG_IN_DEL_tmr2_1, 
        SIG_IN_DEL_tmr3_1, \GND\, \VCC\ : std_logic;

begin 

    channel_involtage_ok_0 <= \channel_involtage_ok[3]\;

    \FILT_OUT[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S_1, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_1[4]\);
    
    \THRESH_VAL_maj_RNI7SP62_0[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_95, Y => N_93);
    
    SIGOUT_tmr2 : DFN1C0
      port map(D => \SIGOUT_maj_RNIT6FB3\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIGOUT_tmr2_1);
    
    \THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNI8TP62[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \THRESH_VAL_tmr2_1[1]\);
    
    \FILT_OUT_maj_RNIPG8A[3]\ : NOR2B
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[6]_net_1\, 
        Y => n_sigout3lto6_0);
    
    \SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIEVME_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr2_1[5]\);
    
    \FILT_OUT[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S_1, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_1[6]\);
    
    \THRESH_VAL[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_1[0]\);
    
    SIGOUT_tmr3 : DFN1C0
      port map(D => \SIGOUT_maj_RNIT6FB3\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIGOUT_tmr3_1);
    
    un2_n_filt_out_ADD_4x4_slow_I0_un1_CO1 : XA1A
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => I0_un1_CO1);
    
    un1_tmp_sum_in_b_0_m22 : XNOR3
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => i10_mux, Y => N_23_i);
    
    \THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_tmr3_1[0]\);
    
    \FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y_1, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2_1[7]\);
    
    \FILT_OUT_maj[3]\ : MAJ3
      port map(A => \FILT_OUT_1[3]\, B => \FILT_OUT_tmr2_1[3]\, C
         => \FILT_OUT_tmr3_1[3]\, Y => \FILT_OUT[3]_net_1\);
    
    \FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_1[3]\);
    
    un2_n_filt_out_ADD_4x4_slow_I1_S : XOR3
      port map(A => I0_un1_CO1, B => \SUM_IN_A[5]_net_1\, C => 
        N_23_i, Y => ADD_4x4_slow_I1_S_1);
    
    un2_n_filt_out_ADD_4x4_slow_I1_CO1 : MAJ3
      port map(A => I0_un1_CO1, B => N_23_i, C => 
        \SUM_IN_A[5]_net_1\, Y => N70);
    
    SIGOUT_maj_RNIT6FB3 : MX2
      port map(A => n_sigout3, B => \channel_involtage_ok[3]\, S
         => N_93, Y => \SIGOUT_maj_RNIT6FB3\);
    
    \FILT_OUT_maj[6]\ : MAJ3
      port map(A => \FILT_OUT_1[6]\, B => \FILT_OUT_tmr2_1[6]\, C
         => \FILT_OUT_tmr3_1[6]\, Y => \FILT_OUT[6]_net_1\);
    
    \SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \SUM_IN_A_1[4]\, B => \SUM_IN_A_tmr2_1[4]\, C
         => \SUM_IN_A_tmr3_1[4]\, Y => \SUM_IN_A[4]_net_1\);
    
    \FILT_OUT[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_1[1]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S_1, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2_1[5]\);
    
    \SUM_IN_A[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIEVME_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_1[5]\);
    
    \FILT_OUT[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_1[2]\);
    
    SIG_IN_DEL : DFN1C0
      port map(D => IN_INVOLTAGE_OK_c_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIG_IN_DEL_1);
    
    \FILT_OUT[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y_1, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_1[7]\);
    
    \FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_1[2]\);
    
    un2_n_filt_out_ADD_4x4_slow_I3_Y : AO13
      port map(A => N70, B => \FILT_OUT[7]_net_1\, C => i12_mux, 
        Y => ADD_4x4_slow_I3_Y_1);
    
    \FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S_1, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2_1[4]\);
    
    un1_tmp_sum_in_b_0_m13 : AO18
      port map(A => \FILT_OUT[4]_net_1\, B => i6_mux, C => 
        \FILT_OUT[5]_net_1\, Y => i8_mux);
    
    \FILT_OUT[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_1[0]\);
    
    SIG_IN_DEL_tmr2 : DFN1C0
      port map(D => IN_INVOLTAGE_OK_c_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIG_IN_DEL_tmr2_1);
    
    SIGOUT_maj : MAJ3
      port map(A => SIGOUT_1, B => SIGOUT_tmr2_1, C => 
        SIGOUT_tmr3_1, Y => \channel_involtage_ok[3]\);
    
    un1_tmp_sum_in_b_0_m4 : OAI1
      port map(A => \FILT_OUT[2]_net_1\, B => \FILT_OUT[0]_net_1\, 
        C => \FILT_OUT[1]_net_1\, Y => i2_mux);
    
    \FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_1[1]\);
    
    \FILT_OUT_maj_RNIHCLP[7]\ : AO1
      port map(A => n_sigout3lto6_1, B => n_sigout3lto6_0, C => 
        \FILT_OUT[7]_net_1\, Y => n_sigout3);
    
    \FILT_OUT[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_1[3]\);
    
    \THRESH_VAL[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNI8TP62[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \THRESH_VAL_1[1]\);
    
    \THRESH_VAL_maj_RNIKUC31_0[1]\ : AOI1B
      port map(A => n_sigout15lto7_2, B => n_sigout15lto7_1, C
         => \THRESH_VAL[1]_net_1\, Y => N_95);
    
    un1_tmp_sum_in_b_0_m16 : AO18
      port map(A => \FILT_OUT[5]_net_1\, B => i8_mux, C => 
        \FILT_OUT[6]_net_1\, Y => i10_mux);
    
    \FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S_1, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2_1[6]\);
    
    \FILT_OUT_maj_RNIQH8A[4]\ : NOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout15lto7_1);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_tmp_sum_in_b_0_m26 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[5]_net_1\, 
        C => i6_mux, Y => N_27_i);
    
    un1_tmp_sum_in_b_0_m19 : AO18
      port map(A => \FILT_OUT[6]_net_1\, B => i10_mux, C => 
        \FILT_OUT[7]_net_1\, Y => i12_mux);
    
    SIG_IN_DEL_maj_RNIEVME : XOR2
      port map(A => IN_INVOLTAGE_OK_c_0, B => \SIG_IN_DEL\, Y => 
        \SIG_IN_DEL_maj_RNIEVME\);
    
    \THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNI8TP62[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \THRESH_VAL_tmr3_1[1]\);
    
    un1_tmp_sum_in_b_0_m30 : XNOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[2]_net_1\, 
        C => i2_mux, Y => N_31_i);
    
    \SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIEVME\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr2_1[4]\);
    
    \FILT_OUT_maj[7]\ : MAJ3
      port map(A => \FILT_OUT_1[7]\, B => \FILT_OUT_tmr2_1[7]\, C
         => \FILT_OUT_tmr3_1[7]\, Y => \FILT_OUT[7]_net_1\);
    
    \THRESH_VAL_maj_RNI7SP62[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_113, Y => \THRESH_VAL_ns[0]\);
    
    un1_tmp_sum_in_b_0_m15 : XOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => N_40);
    
    \FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S_1, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3_1[6]\);
    
    \SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIEVME\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr3_1[4]\);
    
    un1_tmp_sum_in_b_0_m7 : AO18
      port map(A => \FILT_OUT[2]_net_1\, B => i2_mux, C => 
        \FILT_OUT[3]_net_1\, Y => i4_mux);
    
    un1_tmp_sum_in_b_0_m28 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[3]_net_1\, 
        C => i4_mux, Y => N_29_i);
    
    SIG_IN_DEL_tmr3 : DFN1C0
      port map(D => IN_INVOLTAGE_OK_c_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIG_IN_DEL_tmr3_1);
    
    \THRESH_VAL_maj_RNI8TP62[1]\ : OA1B
      port map(A => n_sigout3, B => \THRESH_VAL[1]_net_1\, C => 
        N_113, Y => \THRESH_VAL_maj_RNI8TP62[1]_net_1\);
    
    \THRESH_VAL_maj_RNIKUC31[1]\ : NOR3C
      port map(A => n_sigout15lto7_1, B => n_sigout15lto7_2, C
         => \THRESH_VAL[1]_net_1\, Y => N_113);
    
    SIGOUT : DFN1C0
      port map(D => \SIGOUT_maj_RNIT6FB3\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIGOUT_1);
    
    \FILT_OUT_maj_RNINQCF[3]\ : NOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => \FILT_OUT[5]_net_1\, Y => n_sigout15lto7_2);
    
    \FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y_1, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3_1[7]\);
    
    \FILT_OUT_maj[5]\ : MAJ3
      port map(A => \FILT_OUT_1[5]\, B => \FILT_OUT_tmr2_1[5]\, C
         => \FILT_OUT_tmr3_1[5]\, Y => \FILT_OUT[5]_net_1\);
    
    \FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_1[3]\);
    
    \THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \THRESH_VAL_1[1]\, B => 
        \THRESH_VAL_tmr2_1[1]\, C => \THRESH_VAL_tmr3_1[1]\, Y
         => \THRESH_VAL[1]_net_1\);
    
    \FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_1[2]\);
    
    \FILT_OUT_maj[1]\ : MAJ3
      port map(A => \FILT_OUT_1[1]\, B => \FILT_OUT_tmr2_1[1]\, C
         => \FILT_OUT_tmr3_1[1]\, Y => \FILT_OUT[1]_net_1\);
    
    \FILT_OUT_maj[0]\ : MAJ3
      port map(A => \FILT_OUT_1[0]\, B => \FILT_OUT_tmr2_1[0]\, C
         => \FILT_OUT_tmr3_1[0]\, Y => \FILT_OUT[0]_net_1\);
    
    un1_tmp_sum_in_b_0_m32 : AX1
      port map(A => \FILT_OUT[0]_net_1\, B => \FILT_OUT[1]_net_1\, 
        C => \FILT_OUT[2]_net_1\, Y => N_33_i);
    
    SIG_IN_DEL_maj_RNIEVME_0 : NOR2B
      port map(A => \SIG_IN_DEL\, B => IN_INVOLTAGE_OK_c_0, Y => 
        \SIG_IN_DEL_maj_RNIEVME_0\);
    
    \SUM_IN_A_maj[5]\ : MAJ3
      port map(A => \SUM_IN_A_1[5]\, B => \SUM_IN_A_tmr2_1[5]\, C
         => \SUM_IN_A_tmr3_1[5]\, Y => \SUM_IN_A[5]_net_1\);
    
    un2_n_filt_out_ADD_4x4_slow_I2_S : XNOR3
      port map(A => \FILT_OUT[7]_net_1\, B => i12_mux, C => N70, 
        Y => ADD_4x4_slow_I2_S_1);
    
    \SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIEVME_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr3_1[5]\);
    
    \THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_tmr2_1[0]\);
    
    \THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \THRESH_VAL_1[0]\, B => 
        \THRESH_VAL_tmr2_1[0]\, C => \THRESH_VAL_tmr3_1[0]\, Y
         => \THRESH_VAL[0]_net_1\);
    
    \FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_1[1]\);
    
    \FILT_OUT[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S_1, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_1[5]\);
    
    un1_tmp_sum_in_b_0_m10 : AO18
      port map(A => \FILT_OUT[3]_net_1\, B => i4_mux, C => 
        \FILT_OUT[4]_net_1\, Y => i6_mux);
    
    \FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_1[0]\);
    
    \FILT_OUT_maj[2]\ : MAJ3
      port map(A => \FILT_OUT_1[2]\, B => \FILT_OUT_tmr2_1[2]\, C
         => \FILT_OUT_tmr3_1[2]\, Y => \FILT_OUT[2]_net_1\);
    
    un2_n_filt_out_ADD_4x4_slow_I0_S : XNOR3
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => ADD_4x4_slow_I0_S_1);
    
    \FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S_1, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3_1[4]\);
    
    SIG_IN_DEL_maj : MAJ3
      port map(A => SIG_IN_DEL_1, B => SIG_IN_DEL_tmr2_1, C => 
        SIG_IN_DEL_tmr3_1, Y => \SIG_IN_DEL\);
    
    \FILT_OUT_maj[4]\ : MAJ3
      port map(A => \FILT_OUT_1[4]\, B => \FILT_OUT_tmr2_1[4]\, C
         => \FILT_OUT_tmr3_1[4]\, Y => \FILT_OUT[4]_net_1\);
    
    \FILT_OUT_maj_RNIPG8A[4]\ : NOR2B
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => n_sigout3lto6_1);
    
    \SUM_IN_A[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIEVME\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_1[4]\);
    
    \FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S_1, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3_1[5]\);
    
    \FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_1[0]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity main_sequencer_new_3_0 is

    port( channels_desired_on     : in    std_logic_vector(6 downto 5);
          ch_out1                 : out   std_logic_vector(2 downto 1);
          ch_mreg_en_0            : out   std_logic;
          ch_iaux_en_0            : out   std_logic;
          OUT_CHANNEL_VOSG_c      : out   std_logic_vector(6 downto 5);
          SW4_SLAVE_PAIRS_BAR_c_0 : in    std_logic;
          channels_ready          : in    std_logic_vector(6 downto 5);
          master_rst_b            : in    std_logic;
          clk_5m_gl               : in    std_logic;
          N_85                    : in    std_logic;
          dtycyc_en               : in    std_logic;
          N_79                    : in    std_logic
        );

end main_sequencer_new_3_0;

architecture DEF_ARCH of main_sequencer_new_3_0 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component OR2A
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

  component AND2
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

  component OR3
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

  component NOR3A
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

  component MX2C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
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

  component OA1C
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

  component NOR3B
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

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XA1
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

    signal N_276_0, \sequencer_state1[0]_net_1\, N_380_0, 
        \sequencer_state0[0]_net_1\, 
        \sequencer_state0_ns_a2_0_1[1]_net_1\, N_374, 
        \sequencer_state0_ns_a2_0_0[1]\, N_370, N_375, N_340, 
        un5_del_cntr0, \sequencer_state0_ns_a2_0[4]\, 
        \ret_state0[1]_net_1\, \ret_state0[2]_net_1\, 
        \sequencer_state0_ns_a2_0[3]\, 
        \sequencer_state1_ns_a2_0[3]\, \ret_state1[2]_net_1\, 
        \ret_state1[1]_net_1\, \sequencer_state1_ns_a2_0[4]\, 
        \sequencer_state0_ns_i_0[2]\, 
        \sequencer_state0_ns_i_a2_0_0[2]\, N_359, 
        \sequencer_state1_ns_i_0[2]\, 
        \sequencer_state1_ns_i_a2_0_0[2]\, N_270, N_255, 
        \sequencer_state0_ns_a2_0_1[5]\, \ret_state0[0]_net_1\, 
        \ret_state0[5]_net_1\, \sequencer_state1_ns_a2_0_1[5]\, 
        \ret_state1[0]_net_1\, N_271, \ret_state1[5]_net_1\, 
        \sequencer_state0_ns_0[1]\, \sequencer_state0[3]_net_1\, 
        N_347, \sequencer_state1_ns_0[1]\, 
        \sequencer_state1[3]_net_1\, N_243, 
        \sequencer_state1_ns_a2_0[0]\, 
        \sequencer_state0_ns_a2_0[1]_net_1\, 
        \sequencer_state0[4]_net_1\, 
        \sequencer_state1_ns_a2_0[1]\, 
        \sequencer_state1[4]_net_1\, N_236, 
        \sequencer_state0_ns_a2_0[0]\, 
        \sequencer_state0_ns_a2_0_1[0]\, 
        \sequencer_state1_ns_a2_0_1[0]\, 
        \sequencer_state1_ns_a2_2_0[0]\, N_267, 
        \sequencer_state0_ns_a2_2_0[0]\, N_371, un5_del_cntr0_11, 
        un5_del_cntr0_2, un5_del_cntr0_1, un5_del_cntr0_7, 
        un5_del_cntr0_10, un5_del_cntr0_6, \del_cntr0[10]_net_1\, 
        \del_cntr0[9]_net_1\, un5_del_cntr0_9, un5_del_cntr0_4, 
        \del_cntr0[6]_net_1\, \del_cntr0[5]_net_1\, 
        \del_cntr0[1]_net_1\, \del_cntr0[14]_net_1\, 
        \del_cntr0[13]_net_1\, \del_cntr0[11]_net_1\, 
        \del_cntr0[12]_net_1\, \del_cntr0[7]_net_1\, 
        \del_cntr0[8]_net_1\, \del_cntr0[3]_net_1\, 
        \del_cntr0[4]_net_1\, \del_cntr0[2]_net_1\, 
        \del_cntr0[0]_net_1\, un6_del_cntr1_11, un6_del_cntr1_2, 
        un6_del_cntr1_1, un6_del_cntr1_7, un6_del_cntr1_10, 
        un6_del_cntr1_6, \del_cntr1[10]_net_1\, 
        \del_cntr1[9]_net_1\, un6_del_cntr1_9, un6_del_cntr1_4, 
        \del_cntr1[6]_net_1\, \del_cntr1[5]_net_1\, 
        \del_cntr1[1]_net_1\, \del_cntr1[14]_net_1\, 
        \del_cntr1[13]_net_1\, \del_cntr1[11]_net_1\, 
        \del_cntr1[12]_net_1\, \del_cntr1[7]_net_1\, 
        \del_cntr1[8]_net_1\, \del_cntr1[3]_net_1\, 
        \del_cntr1[4]_net_1\, \del_cntr1[2]_net_1\, 
        \del_cntr1[0]_net_1\, \ret_state0[4]_net_1\, 
        \ret_state0[3]_net_1\, \sequencer_state1_ns_a2_0_0[1]\, 
        \ret_state1[4]_net_1\, \ret_state1[3]_net_1\, N_358_1, 
        N_254_1, \sequencer_state0_ns[1]\, 
        \sequencer_state0_maj_RNIR35G1[1]_net_1\, 
        \sequencer_state0[1]_net_1\, N_367, 
        \sequencer_state0_maj_RNIQ25G1[2]_net_1\, 
        \sequencer_state0[2]_net_1\, N_368, 
        \sequencer_state1_ns[1]\, 
        \sequencer_state1_maj_RNIVVPE[1]_net_1\, 
        \sequencer_state1[1]_net_1\, N_263, 
        \sequencer_state1_maj_RNIUUPE[2]_net_1\, 
        \sequencer_state1[2]_net_1\, N_264, N_251, un6_del_cntr1, 
        N_238_i, \sequencer_state1_ns[3]\, N_274, 
        \sequencer_state1_ns[4]\, N_266, 
        \sequencer_state1_maj_RNID0LP8[5]_net_1\, N_253, N_355, 
        N_342_i, \sequencer_state0_ns[3]\, N_378, 
        \sequencer_state0_ns[4]\, 
        \sequencer_state0_ns_o2_0_RNI0NSR3[1]_net_1\, N_357, 
        \ch_out1[0]_net_1\, \n_del_cntr0[0]\, N_379, N_364, 
        \DWACT_ADD_CI_0_partial_sum[0]\, \n_del_cntr0[1]\, I_56_2, 
        \n_del_cntr0[2]\, I_52_2, \n_del_cntr0[3]\, I_51_2, 
        \n_del_cntr0[4]\, I_53_2, \n_del_cntr0[5]\, I_62_2, 
        \n_del_cntr0[6]\, I_49_2, \n_del_cntr0[7]\, I_59_2, 
        \n_del_cntr0[8]\, I_57_2, \n_del_cntr0[9]\, I_55_2, 
        \n_del_cntr0[10]\, I_54_2, \n_del_cntr0[11]\, I_48_2, 
        \n_del_cntr0[12]\, I_50_2, \n_del_cntr0[13]\, I_60_2, 
        \n_del_cntr0[14]\, I_58_2, \n_del_cntr1[0]\, N_275, N_260, 
        \DWACT_ADD_CI_0_partial_sum_0[0]\, \n_del_cntr1[1]\, 
        I_56_1, \n_del_cntr1[2]\, I_52_1, \n_del_cntr1[3]\, 
        I_51_1, \n_del_cntr1[4]\, I_53_1, \n_del_cntr1[5]\, 
        I_62_1, \n_del_cntr1[6]\, I_49_1, \n_del_cntr1[7]\, 
        I_59_1, \n_del_cntr1[8]\, I_57_1, \n_del_cntr1[9]\, 
        I_55_1, \n_del_cntr1[10]\, I_54_1, \n_del_cntr1[11]\, 
        I_48_1, \n_del_cntr1[12]\, I_50_1, \n_del_cntr1[13]\, 
        I_60_1, \n_del_cntr1[14]\, I_58_1, 
        \ch_out0_maj_RNIM3SA3[0]_net_1\, \n_ch_out0[0]\, 
        \OUT_CHANNEL_VOSG_c[5]\, \ch_out0_maj_RNIOB5B2[1]_net_1\, 
        N_369, \ch_iaux_en[5]\, \ch_out0_maj_RNIIBPR1[2]_net_1\, 
        N_353, \ch_mreg_en[5]\, \ch_out1_maj_RNIS1HP1[0]_net_1\, 
        \n_ch_out1[0]\, \ch_out1_maj_RNITEFD[1]_net_1\, N_265, 
        \ch_out1[1]_net_1\, \ch_out1_maj_RNIM7EA[2]_net_1\, N_249, 
        \ch_out1[2]_net_1\, \sequencer_state0[5]_net_1\, N_362, 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, 
        \sequencer_state0_ns[0]\, \sequencer_state0_ns[5]\, 
        \ret_state0_maj_RNI2B5G1[5]_net_1\, 
        \ret_state0_maj_RNI1A5G1[4]_net_1\, 
        \ret_state0_maj_RNI095G1[3]_net_1\, 
        \ret_state0_maj_RNIS45G1[2]_net_1\, 
        \sequencer_state1[5]_net_1\, un2_n_ch_out1, 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, 
        \sequencer_state1_ns[0]\, 
        \ret_state1_maj_RNI67QE[5]_net_1\, 
        \ret_state1_maj_RNI56QE[4]_net_1\, 
        \ret_state1_maj_RNI45QE[3]_net_1\, 
        \sequencer_state1_maj_RNI01QE[3]_net_1\, un5_n_ch_out0, 
        \sequencer_state1_ns[5]\, N_258, \ret_state0_1[0]\, 
        \ret_state0_tmr2_1[0]\, \ret_state0_tmr3_1[0]\, 
        \ret_state0_1[1]\, \ret_state0_tmr2_1[1]\, 
        \ret_state0_tmr3_1[1]\, \ret_state0_1[2]\, 
        \ret_state0_tmr2_1[2]\, \ret_state0_tmr3_1[2]\, 
        \ret_state0_1[3]\, \ret_state0_tmr2_1[3]\, 
        \ret_state0_tmr3_1[3]\, \ret_state0_1[4]\, 
        \ret_state0_tmr2_1[4]\, \ret_state0_tmr3_1[4]\, 
        \ret_state0_1[5]\, \ret_state0_tmr2_1[5]\, 
        \ret_state0_tmr3_1[5]\, \ret_state1_1[0]\, 
        \ret_state1_tmr2_1[0]\, \ret_state1_tmr3_1[0]\, 
        \ret_state1_1[1]\, \ret_state1_tmr2_1[1]\, 
        \ret_state1_tmr3_1[1]\, \ret_state1_1[2]\, 
        \ret_state1_tmr2_1[2]\, \ret_state1_tmr3_1[2]\, 
        \ret_state1_1[3]\, \ret_state1_tmr2_1[3]\, 
        \ret_state1_tmr3_1[3]\, \ret_state1_1[4]\, 
        \ret_state1_tmr2_1[4]\, \ret_state1_tmr3_1[4]\, 
        \ret_state1_1[5]\, \ret_state1_tmr2_1[5]\, 
        \ret_state1_tmr3_1[5]\, \ch_out0_1[2]\, 
        \ch_out0_tmr2_1[2]\, \ch_out0_tmr3_1[2]\, \ch_out0_1[1]\, 
        \ch_out0_tmr2_1[1]\, \ch_out0_tmr3_1[1]\, \ch_out0_1[0]\, 
        \ch_out0_tmr2_1[0]\, \ch_out0_tmr3_1[0]\, \ch_out1_1[2]\, 
        \ch_out1_tmr2_1[2]\, \ch_out1_tmr3_1[2]\, \ch_out1_1[1]\, 
        \ch_out1_tmr2_1[1]\, \ch_out1_tmr3_1[1]\, \ch_out1_1[0]\, 
        \ch_out1_tmr2_1[0]\, \ch_out1_tmr3_1[0]\, 
        \sequencer_state0_1[0]\, \sequencer_state0_tmr2_1[0]\, 
        \sequencer_state0_tmr3_1[0]\, \sequencer_state0_1[1]\, 
        \sequencer_state0_tmr2_1[1]\, 
        \sequencer_state0_tmr3_1[1]\, \sequencer_state0_1[2]\, 
        \sequencer_state0_tmr2_1[2]\, 
        \sequencer_state0_tmr3_1[2]\, \sequencer_state0_1[3]\, 
        \sequencer_state0_tmr2_1[3]\, 
        \sequencer_state0_tmr3_1[3]\, \sequencer_state0_1[4]\, 
        \sequencer_state0_tmr2_1[4]\, 
        \sequencer_state0_tmr3_1[4]\, \sequencer_state0_1[5]\, 
        \sequencer_state0_tmr2_1[5]\, 
        \sequencer_state0_tmr3_1[5]\, \sequencer_state1_1[0]\, 
        \sequencer_state1_tmr2_1[0]\, 
        \sequencer_state1_tmr3_1[0]\, \sequencer_state1_1[1]\, 
        \sequencer_state1_tmr2_1[1]\, 
        \sequencer_state1_tmr3_1[1]\, \sequencer_state1_1[2]\, 
        \sequencer_state1_tmr2_1[2]\, 
        \sequencer_state1_tmr3_1[2]\, \sequencer_state1_1[3]\, 
        \sequencer_state1_tmr2_1[3]\, 
        \sequencer_state1_tmr3_1[3]\, \sequencer_state1_1[4]\, 
        \sequencer_state1_tmr2_1[4]\, 
        \sequencer_state1_tmr3_1[4]\, \sequencer_state1_1[5]\, 
        \sequencer_state1_tmr2_1[5]\, 
        \sequencer_state1_tmr3_1[5]\, \del_cntr1_1[14]\, 
        \del_cntr1_tmr2_1[14]\, \del_cntr1_tmr3_1[14]\, 
        \del_cntr0_1[14]\, \del_cntr0_tmr2_1[14]\, 
        \del_cntr0_tmr3_1[14]\, \del_cntr1_1[13]\, 
        \del_cntr1_tmr2_1[13]\, \del_cntr1_tmr3_1[13]\, 
        \del_cntr0_1[13]\, \del_cntr0_tmr2_1[13]\, 
        \del_cntr0_tmr3_1[13]\, \del_cntr1_1[12]\, 
        \del_cntr1_tmr2_1[12]\, \del_cntr1_tmr3_1[12]\, 
        \del_cntr0_1[12]\, \del_cntr0_tmr2_1[12]\, 
        \del_cntr0_tmr3_1[12]\, \del_cntr1_1[11]\, 
        \del_cntr1_tmr2_1[11]\, \del_cntr1_tmr3_1[11]\, 
        \del_cntr0_1[11]\, \del_cntr0_tmr2_1[11]\, 
        \del_cntr0_tmr3_1[11]\, \del_cntr1_1[10]\, 
        \del_cntr1_tmr2_1[10]\, \del_cntr1_tmr3_1[10]\, 
        \del_cntr0_1[10]\, \del_cntr0_tmr2_1[10]\, 
        \del_cntr0_tmr3_1[10]\, \del_cntr1_1[9]\, 
        \del_cntr1_tmr2_1[9]\, \del_cntr1_tmr3_1[9]\, 
        \del_cntr0_1[9]\, \del_cntr0_tmr2_1[9]\, 
        \del_cntr0_tmr3_1[9]\, \del_cntr1_1[8]\, 
        \del_cntr1_tmr2_1[8]\, \del_cntr1_tmr3_1[8]\, 
        \del_cntr0_1[8]\, \del_cntr0_tmr2_1[8]\, 
        \del_cntr0_tmr3_1[8]\, \del_cntr1_1[7]\, 
        \del_cntr1_tmr2_1[7]\, \del_cntr1_tmr3_1[7]\, 
        \del_cntr0_1[7]\, \del_cntr0_tmr2_1[7]\, 
        \del_cntr0_tmr3_1[7]\, \del_cntr1_1[6]\, 
        \del_cntr1_tmr2_1[6]\, \del_cntr1_tmr3_1[6]\, 
        \del_cntr0_1[6]\, \del_cntr0_tmr2_1[6]\, 
        \del_cntr0_tmr3_1[6]\, \del_cntr1_1[5]\, 
        \del_cntr1_tmr2_1[5]\, \del_cntr1_tmr3_1[5]\, 
        \del_cntr0_1[5]\, \del_cntr0_tmr2_1[5]\, 
        \del_cntr0_tmr3_1[5]\, \del_cntr1_1[4]\, 
        \del_cntr1_tmr2_1[4]\, \del_cntr1_tmr3_1[4]\, 
        \del_cntr0_1[4]\, \del_cntr0_tmr2_1[4]\, 
        \del_cntr0_tmr3_1[4]\, \del_cntr1_1[3]\, 
        \del_cntr1_tmr2_1[3]\, \del_cntr1_tmr3_1[3]\, 
        \del_cntr0_1[3]\, \del_cntr0_tmr2_1[3]\, 
        \del_cntr0_tmr3_1[3]\, \del_cntr1_1[2]\, 
        \del_cntr1_tmr2_1[2]\, \del_cntr1_tmr3_1[2]\, 
        \del_cntr0_1[2]\, \del_cntr0_tmr2_1[2]\, 
        \del_cntr0_tmr3_1[2]\, \del_cntr1_1[1]\, 
        \del_cntr1_tmr2_1[1]\, \del_cntr1_tmr3_1[1]\, 
        \del_cntr0_1[1]\, \del_cntr0_tmr2_1[1]\, 
        \del_cntr0_tmr3_1[1]\, \del_cntr1_1[0]\, 
        \del_cntr1_tmr2_1[0]\, \del_cntr1_tmr3_1[0]\, 
        \del_cntr0_1[0]\, \del_cntr0_tmr2_1[0]\, 
        \del_cntr0_tmr3_1[0]\, \DWACT_ADD_CI_0_pog_array_1_5[0]\, 
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
        \DWACT_ADD_CI_0_partial_sum[11]\, 
        \DWACT_ADD_CI_0_pog_array_1_5_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_11_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_12_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_4_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_9_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_10_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_3_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_7_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_8_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_2_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_2_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_2_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_5_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_6_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_2_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_3_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_2_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_5_0[0]\, 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, 
        \DWACT_ADD_CI_0_g_array_2_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_5_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_11_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_6_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_13_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_7_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\, 
        \DWACT_ADD_CI_0_g_array_11_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_11_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_5_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_0[0]\, 
        \DWACT_ADD_CI_0_TMP_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_9_0[0]\, 
        \DWACT_ADD_CI_0_partial_sum_0[5]\, 
        \DWACT_ADD_CI_0_partial_sum_0[13]\, 
        \DWACT_ADD_CI_0_partial_sum_0[7]\, 
        \DWACT_ADD_CI_0_partial_sum_0[14]\, 
        \DWACT_ADD_CI_0_partial_sum_0[8]\, 
        \DWACT_ADD_CI_0_partial_sum_0[1]\, 
        \DWACT_ADD_CI_0_partial_sum_0[9]\, 
        \DWACT_ADD_CI_0_partial_sum_0[10]\, 
        \DWACT_ADD_CI_0_partial_sum_0[4]\, 
        \DWACT_ADD_CI_0_partial_sum_0[2]\, 
        \DWACT_ADD_CI_0_partial_sum_0[3]\, 
        \DWACT_ADD_CI_0_partial_sum_0[12]\, 
        \DWACT_ADD_CI_0_partial_sum_0[6]\, 
        \DWACT_ADD_CI_0_partial_sum_0[11]\, \GND\, \VCC\
         : std_logic;

begin 

    ch_out1(2) <= \ch_out1[2]_net_1\;
    ch_out1(1) <= \ch_out1[1]_net_1\;
    ch_mreg_en_0 <= \ch_mreg_en[5]\;
    ch_iaux_en_0 <= \ch_iaux_en[5]\;
    OUT_CHANNEL_VOSG_c(5) <= \OUT_CHANNEL_VOSG_c[5]\;

    \sequencer_state1[2]\ : DFN1C0
      port map(D => \sequencer_state1_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_1[2]\);
    
    \sequencer_state0_ns_o2_0[1]\ : OR2A
      port map(A => un5_del_cntr0, B => N_370, Y => N_340);
    
    \ret_state0_maj_RNIKQLT4[0]\ : AO1
      port map(A => \sequencer_state0_ns_a2_0_1[5]\, B => N_378, 
        C => N_362, Y => \sequencer_state0_ns[5]\);
    
    \del_cntr1_tmr3[0]\ : DFN1P0
      port map(D => \n_del_cntr1[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[0]\);
    
    \del_cntr0[14]\ : DFN1P0
      port map(D => \n_del_cntr0[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[14]\);
    
    \del_cntr1_maj[14]\ : MAJ3
      port map(A => \del_cntr1_1[14]\, B => 
        \del_cntr1_tmr2_1[14]\, C => \del_cntr1_tmr3_1[14]\, Y
         => \del_cntr1[14]_net_1\);
    
    un1_del_cntr1_I_88 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2[0]\);
    
    \del_cntr0_tmr2[14]\ : DFN1P0
      port map(D => \n_del_cntr0[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[14]\);
    
    \del_cntr0[4]\ : DFN1P0
      port map(D => \n_del_cntr0[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[4]\);
    
    \sequencer_state0_maj_RNI676C1_0[0]\ : NOR2A
      port map(A => channels_ready(5), B => 
        \sequencer_state0[0]_net_1\, Y => N_380_0);
    
    \del_cntr1_tmr3[3]\ : DFN1P0
      port map(D => \n_del_cntr1[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[3]\);
    
    \del_cntr0[9]\ : DFN1P0
      port map(D => \n_del_cntr0[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[9]\);
    
    \ret_state1_tmr3[5]\ : DFN1P0
      port map(D => \ret_state1_maj_RNI67QE[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state1_tmr3_1[5]\);
    
    un1_del_cntr0_I_21 : XOR2
      port map(A => \del_cntr0[13]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_12_0[0]\);
    
    \ret_state1_maj_RNI6L5C6_0[1]\ : NOR3C
      port map(A => N_270, B => N_274, C => 
        \sequencer_state1_ns_a2_0[3]\, Y => 
        \sequencer_state1_ns[3]\);
    
    \del_cntr0_tmr2[4]\ : DFN1P0
      port map(D => \n_del_cntr0[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[4]\);
    
    \del_cntr0_tmr2[11]\ : DFN1P0
      port map(D => \n_del_cntr0[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[11]\);
    
    \del_cntr0[5]\ : DFN1P0
      port map(D => \n_del_cntr0[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[5]\);
    
    \ret_state1_maj[0]\ : MAJ3
      port map(A => \ret_state1_1[0]\, B => 
        \ret_state1_tmr2_1[0]\, C => \ret_state1_tmr3_1[0]\, Y
         => \ret_state1[0]_net_1\);
    
    \ch_out1[1]\ : DFN1C0
      port map(D => \ch_out1_maj_RNITEFD[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_1[1]\);
    
    \sequencer_state0_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state0_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr2_1[2]\);
    
    \ch_out1_tmr2[1]\ : DFN1C0
      port map(D => \ch_out1_maj_RNITEFD[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr2_1[1]\);
    
    \ret_state1_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI01QE[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_1[2]\);
    
    \sequencer_state0_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state0_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr3_1[2]\);
    
    un1_del_cntr0_I_10 : AND2
      port map(A => \del_cntr0[4]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\);
    
    un1_del_cntr0_I_47 : XOR2
      port map(A => \del_cntr0[5]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[5]\);
    
    \ret_state1_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIUUPE[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_1[0]\);
    
    un1_del_cntr0_I_33 : XOR2
      port map(A => \del_cntr0[3]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[3]\);
    
    \del_cntr0_maj[3]\ : MAJ3
      port map(A => \del_cntr0_1[3]\, B => \del_cntr0_tmr2_1[3]\, 
        C => \del_cntr0_tmr3_1[3]\, Y => \del_cntr0[3]_net_1\);
    
    un1_del_cntr1_I_70 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    \sequencer_state0_maj_RNIU6V2T1[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_58_2, Y => 
        \n_del_cntr0[14]\);
    
    \ret_state0[3]\ : DFN1C0
      port map(D => \ret_state0_maj_RNI095G1[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state0_1[3]\);
    
    un1_del_cntr1_I_63 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_8[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\);
    
    \sequencer_state1_maj_RNIMRO191[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_48_1, Y => 
        \n_del_cntr1[11]\);
    
    un1_del_cntr0_I_38 : XOR2
      port map(A => \del_cntr0[2]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[2]\);
    
    un1_del_cntr1_I_39 : XOR2
      port map(A => \del_cntr1[13]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[13]\);
    
    \ret_state1_maj_RNIJJCB_0[3]\ : NOR2
      port map(A => \ret_state1[3]_net_1\, B => 
        \ret_state1[4]_net_1\, Y => N_267);
    
    \ret_state1_maj_RNIHHCB[0]\ : XOR2
      port map(A => \ret_state1[0]_net_1\, B => 
        \ret_state1[5]_net_1\, Y => N_238_i);
    
    \del_cntr1_maj[4]\ : MAJ3
      port map(A => \del_cntr1_1[4]\, B => \del_cntr1_tmr2_1[4]\, 
        C => \del_cntr1_tmr3_1[4]\, Y => \del_cntr1[4]_net_1\);
    
    un1_del_cntr1_I_91 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\);
    
    \del_cntr1_maj[0]\ : MAJ3
      port map(A => \del_cntr1_1[0]\, B => \del_cntr1_tmr2_1[0]\, 
        C => \del_cntr1_tmr3_1[0]\, Y => \del_cntr1[0]_net_1\);
    
    un1_del_cntr1_I_68 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\);
    
    un1_del_cntr1_I_80 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\);
    
    \sequencer_state1_maj_RNILL39[0]\ : NOR2
      port map(A => N_243, B => \sequencer_state1[0]_net_1\, Y
         => N_265);
    
    \sequencer_state1_maj_RNID0LP8[5]\ : NOR3A
      port map(A => channels_ready(6), B => 
        \sequencer_state1_ns_i_0[2]\, C => N_253, Y => 
        \sequencer_state1_maj_RNID0LP8[5]_net_1\);
    
    \sequencer_state0_maj_RNIIEB93[4]\ : NOR3C
      port map(A => un5_del_cntr0, B => 
        \sequencer_state0_ns_a2_2_0[0]\, C => channels_ready(5), 
        Y => N_378);
    
    \del_cntr1_maj[10]\ : MAJ3
      port map(A => \del_cntr1_1[10]\, B => 
        \del_cntr1_tmr2_1[10]\, C => \del_cntr1_tmr3_1[10]\, Y
         => \del_cntr1[10]_net_1\);
    
    \del_cntr0_tmr2[5]\ : DFN1P0
      port map(D => \n_del_cntr0[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[5]\);
    
    un1_del_cntr1_I_21 : XOR2
      port map(A => \del_cntr1[13]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\);
    
    \del_cntr0_maj[4]\ : MAJ3
      port map(A => \del_cntr0_1[4]\, B => \del_cntr0_tmr2_1[4]\, 
        C => \del_cntr0_tmr3_1[4]\, Y => \del_cntr0[4]_net_1\);
    
    un1_del_cntr0_I_86 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_0[0]\);
    
    \ret_state1_maj_RNI45QE[3]\ : OA1A
      port map(A => N_275, B => \sequencer_state1[5]_net_1\, C
         => \ret_state1[3]_net_1\, Y => 
        \ret_state1_maj_RNI45QE[3]_net_1\);
    
    \del_cntr1[14]\ : DFN1P0
      port map(D => \n_del_cntr1[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[14]\);
    
    \del_cntr1_maj[7]\ : MAJ3
      port map(A => \del_cntr1_1[7]\, B => \del_cntr1_tmr2_1[7]\, 
        C => \del_cntr1_tmr3_1[7]\, Y => \del_cntr1[7]_net_1\);
    
    \sequencer_state0[5]\ : DFN1P0
      port map(D => \sequencer_state0_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state0_1[5]\);
    
    \ret_state1_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI01QE[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_1[2]\);
    
    \del_cntr0[11]\ : DFN1P0
      port map(D => \n_del_cntr0[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[11]\);
    
    \sequencer_state1_maj_RNI2DJ2D[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_51_1, Y => 
        \n_del_cntr1[3]\);
    
    un1_del_cntr0_I_56 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[1]\, B => 
        \DWACT_ADD_CI_0_TMP_0[0]\, Y => I_56_2);
    
    \del_cntr1[1]\ : DFN1P0
      port map(D => \n_del_cntr1[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[1]\);
    
    \sequencer_state0_ns_o2_0_RNI0NSR3[1]\ : NOR3A
      port map(A => channels_ready(5), B => 
        \sequencer_state0_ns_i_0[2]\, C => N_357, Y => 
        \sequencer_state0_ns_o2_0_RNI0NSR3[1]_net_1\);
    
    \sequencer_state0_maj_RNIM6JAD[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_51_2, Y => 
        \n_del_cntr0[3]\);
    
    \ch_out1_tmr3[2]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIM7EA[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr3_1[2]\);
    
    \ch_out0_tmr3[0]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIM3SA3[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr3_1[0]\);
    
    un1_del_cntr0_I_76 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_0[0]\);
    
    un1_del_cntr0_I_25 : XOR2
      port map(A => \del_cntr0[12]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_11_0[0]\);
    
    \sequencer_state0_maj_RNIR4D8A[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_52_2, Y => 
        \n_del_cntr0[2]\);
    
    \ret_state1_tmr2[4]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI56QE[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_1[4]\);
    
    \sequencer_state0_maj_RNIL34E1_0[3]\ : NOR2
      port map(A => \sequencer_state0[3]_net_1\, B => N_347, Y
         => \sequencer_state0_ns_a2_0[0]\);
    
    \sequencer_state1_maj_RNIL95L1[5]\ : MX2C
      port map(A => \sequencer_state1[5]_net_1\, B => 
        un2_n_ch_out1, S => \sequencer_state1[0]_net_1\, Y => 
        \n_ch_out1[0]\);
    
    \ret_state0_tmr3[3]\ : DFN1C0
      port map(D => \ret_state0_maj_RNI095G1[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_1[3]\);
    
    \del_cntr1_tmr2[11]\ : DFN1P0
      port map(D => \n_del_cntr1[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[11]\);
    
    \sequencer_state1_maj_RNIVVPE[1]\ : NOR3
      port map(A => \sequencer_state1[3]_net_1\, B => 
        \sequencer_state1[1]_net_1\, C => N_263, Y => 
        \sequencer_state1_maj_RNIVVPE[1]_net_1\);
    
    \sequencer_state1_maj_RNIVAOHA[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_52_1, Y => 
        \n_del_cntr1[2]\);
    
    un1_del_cntr1_I_51 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[3]\, B => 
        \DWACT_ADD_CI_0_g_array_12[0]\, Y => I_51_1);
    
    un1_del_cntr1_I_16 : AND2
      port map(A => \del_cntr1[11]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\);
    
    un1_del_cntr0_I_30 : XOR2
      port map(A => \del_cntr0[1]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_0[0]\);
    
    \del_cntr1_tmr2[8]\ : DFN1P0
      port map(D => \n_del_cntr1[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[8]\);
    
    \ret_state1_maj_RNI67QE[5]\ : OA1A
      port map(A => N_275, B => \sequencer_state1[5]_net_1\, C
         => \ret_state1[5]_net_1\, Y => 
        \ret_state1_maj_RNI67QE[5]_net_1\);
    
    un1_del_cntr0_I_22 : XOR2
      port map(A => \del_cntr0[9]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_8_0[0]\);
    
    \ret_state0_maj_RNIF324[0]\ : XOR2
      port map(A => \ret_state0[5]_net_1\, B => 
        \ret_state0[0]_net_1\, Y => N_342_i);
    
    \del_cntr0_tmr2[12]\ : DFN1P0
      port map(D => \n_del_cntr0[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[12]\);
    
    un1_del_cntr1_I_60 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[13]\, B => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\, Y => I_60_1);
    
    un1_del_cntr1_I_46 : XOR2
      port map(A => \del_cntr1[6]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[6]\);
    
    un1_del_cntr0_I_65 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_5_0[0]\);
    
    \ret_state0_maj_RNIDBLK2[0]\ : NOR3C
      port map(A => un5_del_cntr0, B => 
        \sequencer_state0_ns_a2_2_0[0]\, C => 
        \sequencer_state0_ns_a2_0_1[0]\, Y => N_355);
    
    \del_cntr0_tmr2[10]\ : DFN1P0
      port map(D => \n_del_cntr0[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[10]\);
    
    un1_del_cntr1_I_34 : XOR2
      port map(A => \del_cntr1[4]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[4]\);
    
    \del_cntr1_tmr2[0]\ : DFN1P0
      port map(D => \n_del_cntr1[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[0]\);
    
    \del_cntr1[2]\ : DFN1P0
      port map(D => \n_del_cntr1[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[2]\);
    
    \ch_out1[2]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIM7EA[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_1[2]\);
    
    \del_cntr1_maj_RNIEU3H[0]\ : NOR2
      port map(A => \del_cntr1[2]_net_1\, B => 
        \del_cntr1[0]_net_1\, Y => un6_del_cntr1_1);
    
    \sequencer_state1_maj_RNIAUA9M1[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_58_1, Y => 
        \n_del_cntr1[14]\);
    
    \ret_state1_maj_RNIUV651[0]\ : NOR3C
      port map(A => N_254_1, B => N_238_i, C => N_271, Y => N_255);
    
    \ret_state0_tmr3[5]\ : DFN1P0
      port map(D => \ret_state0_maj_RNI2B5G1[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state0_tmr3_1[5]\);
    
    \sequencer_state1_maj_RNIT406N[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_49_1, Y => 
        \n_del_cntr1[6]\);
    
    un1_del_cntr0_I_62 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[5]\, B => 
        \DWACT_ADD_CI_0_g_array_12_1_0[0]\, Y => I_62_2);
    
    un1_del_cntr0_I_6 : AND2
      port map(A => \del_cntr0[3]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_3_0[0]\);
    
    \ret_state0[1]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIR35G1[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_1[1]\);
    
    \del_cntr1[8]\ : DFN1P0
      port map(D => \n_del_cntr1[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[8]\);
    
    \sequencer_state1_maj_RNI6KCL5[4]\ : NOR3C
      port map(A => un6_del_cntr1, B => 
        \sequencer_state1_ns_a2_2_0[0]\, C => channels_ready(6), 
        Y => N_274);
    
    \sequencer_state1_maj_RNIEMCI5[5]\ : OA1C
      port map(A => \sequencer_state1[4]_net_1\, B => N_236, C
         => \sequencer_state1[5]_net_1\, Y => N_253);
    
    \ret_state0[5]\ : DFN1P0
      port map(D => \ret_state0_maj_RNI2B5G1[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => \ret_state0_1[5]\);
    
    un1_del_cntr0_I_87 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_6_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_2_0[0]\);
    
    \sequencer_state1_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state1_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr3_1[0]\);
    
    \ch_out1_maj_RNIM7EA[2]\ : MX2A
      port map(A => N_249, B => \ch_out1[2]_net_1\, S => 
        \sequencer_state1[4]_net_1\, Y => 
        \ch_out1_maj_RNIM7EA[2]_net_1\);
    
    \ret_state0_tmr2[2]\ : DFN1C0
      port map(D => \ret_state0_maj_RNIS45G1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_1[2]\);
    
    \del_cntr0_maj_RNIHLP9[3]\ : NOR2
      port map(A => \del_cntr0[3]_net_1\, B => 
        \del_cntr0[4]_net_1\, Y => un5_del_cntr0_2);
    
    \del_cntr0_maj[12]\ : MAJ3
      port map(A => \del_cntr0_1[12]\, B => 
        \del_cntr0_tmr2_1[12]\, C => \del_cntr0_tmr3_1[12]\, Y
         => \del_cntr0[12]_net_1\);
    
    un1_del_cntr0_I_91 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_10_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_4_0[0]\);
    
    \sequencer_state1_maj_RNIUUPE[2]\ : NOR3
      port map(A => \sequencer_state1[3]_net_1\, B => 
        \sequencer_state1[2]_net_1\, C => N_264, Y => 
        \sequencer_state1_maj_RNIUUPE[2]_net_1\);
    
    \ret_state0_maj_RNIS448[0]\ : NOR3B
      port map(A => \ret_state0[0]_net_1\, B => N_375, C => 
        \ret_state0[5]_net_1\, Y => 
        \sequencer_state0_ns_a2_0_1[5]\);
    
    \del_cntr1_tmr2[6]\ : DFN1P0
      port map(D => \n_del_cntr1[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[6]\);
    
    un1_del_cntr1_I_25 : XOR2
      port map(A => \del_cntr1[12]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_11[0]\);
    
    \ret_state0_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIQ25G1[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_1[0]\);
    
    \del_cntr0_tmr3[2]\ : DFN1P0
      port map(D => \n_del_cntr0[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[2]\);
    
    un1_del_cntr1_I_92 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_5[0]\);
    
    un1_del_cntr1_I_9 : AND2
      port map(A => \del_cntr1[10]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\);
    
    \del_cntr1_tmr2[14]\ : DFN1P0
      port map(D => \n_del_cntr1[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[14]\);
    
    \del_cntr0[13]\ : DFN1P0
      port map(D => \n_del_cntr0[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[13]\);
    
    un1_del_cntr0_I_57 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[8]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, Y => I_57_2);
    
    \del_cntr0_maj_RNIJRN9[10]\ : NOR3A
      port map(A => un5_del_cntr0_6, B => \del_cntr0[10]_net_1\, 
        C => \del_cntr0[9]_net_1\, Y => un5_del_cntr0_10);
    
    \ch_out0_tmr2[1]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIOB5B2[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr2_1[1]\);
    
    \del_cntr1[11]\ : DFN1P0
      port map(D => \n_del_cntr1[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[11]\);
    
    \sequencer_state1[3]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNID0LP8[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state1_1[3]\);
    
    \ret_state1[5]\ : DFN1P0
      port map(D => \ret_state1_maj_RNI67QE[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => \ret_state1_1[5]\);
    
    \del_cntr0_tmr3[7]\ : DFN1P0
      port map(D => \n_del_cntr0[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[7]\);
    
    un1_del_cntr0_I_41 : XOR2
      port map(A => \del_cntr0[12]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[12]\);
    
    un1_del_cntr0_I_16 : AND2
      port map(A => \del_cntr0[11]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_11_0[0]\);
    
    \sequencer_state1_maj_RNIUUDE[5]\ : NOR2A
      port map(A => N_267, B => \sequencer_state1[5]_net_1\, Y
         => N_254_1);
    
    un1_del_cntr1_I_22 : XOR2
      port map(A => \del_cntr1[9]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\);
    
    un1_del_cntr0_I_77 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_1_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\);
    
    \sequencer_state1_maj_RNIGG26[0]\ : NOR2
      port map(A => \sequencer_state1[0]_net_1\, B => 
        \sequencer_state1[4]_net_1\, Y => N_275);
    
    \sequencer_state1_maj_RNI0J8AI1[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_60_1, Y => 
        \n_del_cntr1[13]\);
    
    \sequencer_state0_maj[4]\ : MAJ3
      port map(A => \sequencer_state0_1[4]\, B => 
        \sequencer_state0_tmr2_1[4]\, C => 
        \sequencer_state0_tmr3_1[4]\, Y => 
        \sequencer_state0[4]_net_1\);
    
    \ret_state0_maj[2]\ : MAJ3
      port map(A => \ret_state0_1[2]\, B => 
        \ret_state0_tmr2_1[2]\, C => \ret_state0_tmr3_1[2]\, Y
         => \ret_state0[2]_net_1\);
    
    \ret_state0_maj[0]\ : MAJ3
      port map(A => \ret_state0_1[0]\, B => 
        \ret_state0_tmr2_1[0]\, C => \ret_state0_tmr3_1[0]\, Y
         => \ret_state0[0]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_del_cntr1_I_76 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11[0]\);
    
    \ret_state1_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIVVPE[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_1[1]\);
    
    un1_del_cntr1_I_17 : AND2
      port map(A => \del_cntr1[13]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\);
    
    \del_cntr1_maj[6]\ : MAJ3
      port map(A => \del_cntr1_1[6]\, B => \del_cntr1_tmr2_1[6]\, 
        C => \del_cntr1_tmr3_1[6]\, Y => \del_cntr1[6]_net_1\);
    
    un1_del_cntr1_I_47 : XOR2
      port map(A => \del_cntr1[5]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[5]\);
    
    \ch_out0[1]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIOB5B2[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_1[1]\);
    
    \del_cntr0_tmr3[5]\ : DFN1P0
      port map(D => \n_del_cntr0[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[5]\);
    
    \del_cntr0[1]\ : DFN1P0
      port map(D => \n_del_cntr0[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[1]\);
    
    un1_del_cntr0_I_29 : XOR2
      port map(A => \del_cntr0[4]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_3_0[0]\);
    
    \del_cntr1_maj[2]\ : MAJ3
      port map(A => \del_cntr1_1[2]\, B => \del_cntr1_tmr2_1[2]\, 
        C => \del_cntr1_tmr3_1[2]\, Y => \del_cntr1[2]_net_1\);
    
    un1_del_cntr1_I_86 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1[0]\);
    
    un1_del_cntr1_I_33 : XOR2
      port map(A => \del_cntr1[3]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[3]\);
    
    \ret_state0_maj_RNIEJFH3[1]\ : NOR3C
      port map(A => N_374, B => N_378, C => 
        \sequencer_state0_ns_a2_0[4]\, Y => 
        \sequencer_state0_ns[4]\);
    
    \del_cntr0[7]\ : DFN1P0
      port map(D => \n_del_cntr0[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[7]\);
    
    \del_cntr0_tmr3[1]\ : DFN1P0
      port map(D => \n_del_cntr0[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[1]\);
    
    \del_cntr0_tmr2[9]\ : DFN1P0
      port map(D => \n_del_cntr0[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[9]\);
    
    un1_del_cntr1_I_55 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[9]\, B => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\, Y => I_55_1);
    
    \sequencer_state1_tmr2[3]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNID0LP8[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state1_tmr2_1[3]\);
    
    \sequencer_state0_maj_RNI3NJV4[3]\ : AO1A
      port map(A => channels_ready(5), B => 
        \sequencer_state0_ns_a2_0[0]\, C => N_355, Y => 
        \sequencer_state0_ns[0]\);
    
    \ret_state1_maj_RNIHHCB_0[0]\ : NOR2
      port map(A => \ret_state1[0]_net_1\, B => 
        \ret_state1[5]_net_1\, Y => N_270);
    
    \del_cntr1_tmr2[1]\ : DFN1P0
      port map(D => \n_del_cntr1[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[1]\);
    
    \del_cntr1_maj_RNIHOVK[11]\ : NOR2
      port map(A => \del_cntr1[11]_net_1\, B => 
        \del_cntr1[12]_net_1\, Y => un6_del_cntr1_6);
    
    \sequencer_state1_maj_RNI9GRV_1[0]\ : NOR2A
      port map(A => channels_ready(6), B => 
        \sequencer_state1[0]_net_1\, Y => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\);
    
    un1_del_cntr1_I_38 : XOR2
      port map(A => \del_cntr1[2]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[2]\);
    
    \ret_state0_tmr3[2]\ : DFN1C0
      port map(D => \ret_state0_maj_RNIS45G1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_1[2]\);
    
    \sequencer_state1_maj_RNI5ARH21[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_55_1, Y => 
        \n_del_cntr1[9]\);
    
    \sequencer_state1_maj_RNI09NCJ[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_62_1, Y => 
        \n_del_cntr1[5]\);
    
    un1_del_cntr0_I_69 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_4_0[0]\);
    
    \ret_state0_maj_RNI2B5G1[5]\ : OA1A
      port map(A => N_379, B => \sequencer_state0[5]_net_1\, C
         => \ret_state0[5]_net_1\, Y => 
        \ret_state0_maj_RNI2B5G1[5]_net_1\);
    
    \sequencer_state0_maj_RNIQ25G1[2]\ : NOR3
      port map(A => \sequencer_state0[3]_net_1\, B => 
        \sequencer_state0[2]_net_1\, C => N_368, Y => 
        \sequencer_state0_maj_RNIQ25G1[2]_net_1\);
    
    \del_cntr0_maj_RNIF873[11]\ : NOR2
      port map(A => \del_cntr0[11]_net_1\, B => 
        \del_cntr0[12]_net_1\, Y => un5_del_cntr0_6);
    
    un1_del_cntr1_I_52 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[2]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, Y => I_52_1);
    
    un1_del_cntr1_I_5 : AND2
      port map(A => \del_cntr1[7]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\);
    
    \sequencer_state0_maj_RNI25767[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_56_2, Y => 
        \n_del_cntr0[1]\);
    
    \ret_state0_tmr2[4]\ : DFN1C0
      port map(D => \ret_state0_maj_RNI1A5G1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_1[4]\);
    
    \del_cntr0[10]\ : DFN1P0
      port map(D => \n_del_cntr0[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[10]\);
    
    \sequencer_state1_maj_RNIOO39[3]\ : OR2
      port map(A => \sequencer_state1[3]_net_1\, B => N_243, Y
         => \sequencer_state1_ns_0[1]\);
    
    \del_cntr1[7]\ : DFN1P0
      port map(D => \n_del_cntr1[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[7]\);
    
    \ret_state0_maj_RNI8BGN[1]\ : XA1
      port map(A => \ret_state0[1]_net_1\, B => 
        \ret_state0[2]_net_1\, C => N_358_1, Y => 
        \sequencer_state0_ns_i_a2_0_0[2]\);
    
    \del_cntr1[13]\ : DFN1P0
      port map(D => \n_del_cntr1[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[13]\);
    
    un1_del_cntr0_I_17 : AND2
      port map(A => \del_cntr0[13]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_13_0[0]\);
    
    \ch_out0_tmr3[2]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIIBPR1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr3_1[2]\);
    
    \del_cntr0_maj_RNIP448[14]\ : NOR3
      port map(A => \del_cntr0[1]_net_1\, B => 
        \del_cntr0[14]_net_1\, C => \del_cntr0[13]_net_1\, Y => 
        un5_del_cntr0_7);
    
    \sequencer_state1_tmr2[5]\ : DFN1P0
      port map(D => \sequencer_state1_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state1_tmr2_1[5]\);
    
    \sequencer_state0_maj_RNID1DH[2]\ : NOR2
      port map(A => \sequencer_state0[2]_net_1\, B => 
        \ret_state0[1]_net_1\, Y => N_367);
    
    \del_cntr0_maj[9]\ : MAJ3
      port map(A => \del_cntr0_1[9]\, B => \del_cntr0_tmr2_1[9]\, 
        C => \del_cntr0_tmr3_1[9]\, Y => \del_cntr0[9]_net_1\);
    
    un1_del_cntr1_I_29 : XOR2
      port map(A => \del_cntr1[4]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_3[0]\);
    
    un1_del_cntr0_I_36 : XOR2
      port map(A => \del_cntr0[1]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[1]\);
    
    un1_del_cntr1_I_77 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2[0]\);
    
    \sequencer_state0_maj[3]\ : MAJ3
      port map(A => \sequencer_state0_1[3]\, B => 
        \sequencer_state0_tmr2_1[3]\, C => 
        \sequencer_state0_tmr3_1[3]\, Y => 
        \sequencer_state0[3]_net_1\);
    
    \del_cntr1_maj_RNINQ181[9]\ : NOR3A
      port map(A => un6_del_cntr1_6, B => \del_cntr1[10]_net_1\, 
        C => \del_cntr1[9]_net_1\, Y => un6_del_cntr1_10);
    
    un1_del_cntr1_I_66 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\);
    
    \del_cntr1_maj_RNIIJ821[5]\ : NOR3A
      port map(A => un6_del_cntr1_4, B => \del_cntr1[6]_net_1\, C
         => \del_cntr1[5]_net_1\, Y => un6_del_cntr1_9);
    
    un1_del_cntr0_I_92 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_12_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_5_0[0]\);
    
    un1_del_cntr0_I_9 : AND2
      port map(A => \del_cntr0[10]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\);
    
    un1_del_cntr0_I_45 : XOR2
      port map(A => \del_cntr0[9]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[9]\);
    
    \sequencer_state1_maj[2]\ : MAJ3
      port map(A => \sequencer_state1_1[2]\, B => 
        \sequencer_state1_tmr2_1[2]\, C => 
        \sequencer_state1_tmr3_1[2]\, Y => 
        \sequencer_state1[2]_net_1\);
    
    \sequencer_state0_maj_RNIHPQD2[5]\ : MX2C
      port map(A => \sequencer_state0[5]_net_1\, B => 
        un5_n_ch_out0, S => \sequencer_state0[0]_net_1\, Y => 
        \n_ch_out0[0]\);
    
    \sequencer_state1[1]\ : DFN1C0
      port map(D => \sequencer_state1_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_1[1]\);
    
    un1_del_cntr0_I_24 : XOR2
      port map(A => \del_cntr0[2]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_1_0[0]\);
    
    \ret_state0_maj_RNIF324_0[0]\ : NOR2
      port map(A => \ret_state0[5]_net_1\, B => 
        \ret_state0[0]_net_1\, Y => N_374);
    
    \del_cntr0_maj[13]\ : MAJ3
      port map(A => \del_cntr0_1[13]\, B => 
        \del_cntr0_tmr2_1[13]\, C => \del_cntr0_tmr3_1[13]\, Y
         => \del_cntr0[13]_net_1\);
    
    un1_del_cntr1_I_87 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\);
    
    un1_del_cntr1_I_30 : XOR2
      port map(A => \del_cntr1[1]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0[0]\);
    
    \sequencer_state1_tmr3[3]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNID0LP8[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state1_tmr3_1[3]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \sequencer_state1_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state1_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr2_1[0]\);
    
    un1_del_cntr0_I_42 : XOR2
      port map(A => \del_cntr0[0]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[0]\);
    
    \ch_out1_tmr3[1]\ : DFN1C0
      port map(D => \ch_out1_maj_RNITEFD[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr3_1[1]\);
    
    un1_del_cntr0_I_81 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\);
    
    \sequencer_state0_ns_o2_0_RNI7DHO[1]\ : NOR2B
      port map(A => \sequencer_state0[4]_net_1\, B => N_340, Y
         => \sequencer_state0_ns_a2_0[1]_net_1\);
    
    \del_cntr0_tmr3[4]\ : DFN1P0
      port map(D => \n_del_cntr0[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[4]\);
    
    \ch_out1[0]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIS1HP1[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_1[0]\);
    
    \del_cntr1_tmr2[4]\ : DFN1P0
      port map(D => \n_del_cntr1[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[4]\);
    
    un1_del_cntr0_I_64 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_0[0]\, B => 
        \DWACT_ADD_CI_0_TMP_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_1_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\);
    
    \del_cntr0_tmr2[2]\ : DFN1P0
      port map(D => \n_del_cntr0[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[2]\);
    
    \ch_out1_maj_RNIS1HP1[0]\ : MX2
      port map(A => \n_ch_out1[0]\, B => \ch_out1[0]_net_1\, S
         => \sequencer_state1[4]_net_1\, Y => 
        \ch_out1_maj_RNIS1HP1[0]_net_1\);
    
    \sequencer_state1_maj_RNIDDN8[1]\ : NOR2
      port map(A => \sequencer_state1[1]_net_1\, B => 
        \ret_state1[0]_net_1\, Y => N_264);
    
    \sequencer_state0[0]\ : DFN1C0
      port map(D => \sequencer_state0_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_1[0]\);
    
    \del_cntr1_maj[5]\ : MAJ3
      port map(A => \del_cntr1_1[5]\, B => \del_cntr1_tmr2_1[5]\, 
        C => \del_cntr1_tmr3_1[5]\, Y => \del_cntr1[5]_net_1\);
    
    \ch_out0_maj_RNIM3SA3[0]\ : MX2
      port map(A => \n_ch_out0[0]\, B => \OUT_CHANNEL_VOSG_c[5]\, 
        S => \sequencer_state0[4]_net_1\, Y => 
        \ch_out0_maj_RNIM3SA3[0]_net_1\);
    
    un1_del_cntr1_I_59 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[7]\, B => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\, Y => I_59_1);
    
    \del_cntr0_tmr2[7]\ : DFN1P0
      port map(D => \n_del_cntr0[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[7]\);
    
    un1_del_cntr0_I_51 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[3]\, B => 
        \DWACT_ADD_CI_0_g_array_12_0[0]\, Y => I_51_2);
    
    \sequencer_state0_ns_a2_0[1]\ : AND2
      port map(A => N_375, B => 
        \sequencer_state0_ns_a2_0_1[1]_net_1\, Y => N_370);
    
    \ch_out1_maj[0]\ : MAJ3
      port map(A => \ch_out1_1[0]\, B => \ch_out1_tmr2_1[0]\, C
         => \ch_out1_tmr3_1[0]\, Y => \ch_out1[0]_net_1\);
    
    \ret_state0_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIR35G1[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_1[1]\);
    
    \del_cntr0_tmr3[13]\ : DFN1P0
      port map(D => \n_del_cntr0[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[13]\);
    
    \sequencer_state1_maj_RNITTDE[4]\ : NOR2B
      port map(A => \sequencer_state1[4]_net_1\, B => N_267, Y
         => \sequencer_state1_ns_a2_2_0[0]\);
    
    \del_cntr1[10]\ : DFN1P0
      port map(D => \n_del_cntr1[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[10]\);
    
    un1_del_cntr0_I_71 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_0[0]\);
    
    \ret_state0_maj[3]\ : MAJ3
      port map(A => \ret_state0_1[3]\, B => 
        \ret_state0_tmr2_1[3]\, C => \ret_state0_tmr3_1[3]\, Y
         => \ret_state0[3]_net_1\);
    
    \ch_out1_maj_RNITEFD[1]\ : MX2A
      port map(A => N_265, B => \ch_out1[1]_net_1\, S => 
        \sequencer_state1[4]_net_1\, Y => 
        \ch_out1_maj_RNITEFD[1]_net_1\);
    
    \ret_state1_maj_RNIP0AC5[3]\ : OR2A
      port map(A => un6_del_cntr1, B => N_266, Y => N_236);
    
    \sequencer_state1_maj_RNI01QE[3]\ : AO1A
      port map(A => N_243, B => \ret_state1[2]_net_1\, C => 
        \sequencer_state1[3]_net_1\, Y => 
        \sequencer_state1_maj_RNI01QE[3]_net_1\);
    
    \del_cntr0_maj_RNINT2P1[10]\ : NOR3C
      port map(A => un5_del_cntr0_10, B => un5_del_cntr0_9, C => 
        un5_del_cntr0_11, Y => un5_del_cntr0);
    
    \del_cntr0_maj[1]\ : MAJ3
      port map(A => \del_cntr0_1[1]\, B => \del_cntr0_tmr2_1[1]\, 
        C => \del_cntr0_tmr3_1[1]\, Y => \del_cntr0[1]_net_1\);
    
    \del_cntr0_maj[11]\ : MAJ3
      port map(A => \del_cntr0_1[11]\, B => 
        \del_cntr0_tmr2_1[11]\, C => \del_cntr0_tmr3_1[11]\, Y
         => \del_cntr0[11]_net_1\);
    
    un1_del_cntr1_I_11 : AND2
      port map(A => \del_cntr1[6]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\);
    
    \sequencer_state1_tmr3[5]\ : DFN1P0
      port map(D => \sequencer_state1_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state1_tmr3_1[5]\);
    
    \ret_state1_tmr3[4]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI56QE[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_1[4]\);
    
    un1_del_cntr1_I_24 : XOR2
      port map(A => \del_cntr1[2]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_1[0]\);
    
    un1_del_cntr0_I_37 : XOR2
      port map(A => \del_cntr0[14]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[14]\);
    
    \sequencer_state1_maj_RNIUD9L6_0[3]\ : AO1
      port map(A => \sequencer_state1_ns_a2_0[1]\, B => 
        channels_ready(6), C => \sequencer_state1_ns_0[1]\, Y => 
        \sequencer_state1_ns[1]\);
    
    un1_del_cntr1_I_41 : XOR2
      port map(A => \del_cntr1[12]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[12]\);
    
    \del_cntr0_maj_RNIPTP9[7]\ : NOR2
      port map(A => \del_cntr0[7]_net_1\, B => 
        \del_cntr0[8]_net_1\, Y => un5_del_cntr0_4);
    
    un1_del_cntr1_I_67 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_10[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\);
    
    \sequencer_state1_maj_RNIFFN8[2]\ : NOR2
      port map(A => \sequencer_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => N_263);
    
    \del_cntr1_maj[1]\ : MAJ3
      port map(A => \del_cntr1_1[1]\, B => \del_cntr1_tmr2_1[1]\, 
        C => \del_cntr1_tmr3_1[1]\, Y => \del_cntr1[1]_net_1\);
    
    \del_cntr1_tmr2[5]\ : DFN1P0
      port map(D => \n_del_cntr1[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[5]\);
    
    \sequencer_state1_maj_RNIDD26[1]\ : NOR2
      port map(A => \sequencer_state1[1]_net_1\, B => 
        \sequencer_state1[0]_net_1\, Y => N_249);
    
    \sequencer_state1_maj[3]\ : MAJ3
      port map(A => \sequencer_state1_1[3]\, B => 
        \sequencer_state1_tmr2_1[3]\, C => 
        \sequencer_state1_tmr3_1[3]\, Y => 
        \sequencer_state1[3]_net_1\);
    
    \ch_out1_tmr2[2]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIM7EA[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr2_1[2]\);
    
    un1_del_cntr0_I_23 : XOR2
      port map(A => \del_cntr0[5]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_4_0[0]\);
    
    \sequencer_state0_ns_a2_0_1_RNO[1]\ : NOR2A
      port map(A => \ret_state0[4]_net_1\, B => 
        \ret_state0[3]_net_1\, Y => 
        \sequencer_state0_ns_a2_0_0[1]\);
    
    \sequencer_state1_maj_RNI9GRV[0]\ : NOR2B
      port map(A => \sequencer_state1[0]_net_1\, B => 
        channels_ready(6), Y => N_258);
    
    un1_del_cntr0_I_28 : XOR2
      port map(A => \del_cntr0[8]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_7_0[0]\);
    
    un1_del_cntr0_I_49 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[6]\, B => 
        \DWACT_ADD_CI_0_g_array_11_0[0]\, Y => I_49_2);
    
    \sequencer_state1_tmr2[4]\ : DFN1C0
      port map(D => \sequencer_state1_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr2_1[4]\);
    
    \del_cntr0_tmr2[3]\ : DFN1P0
      port map(D => \n_del_cntr0[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[3]\);
    
    \sequencer_state1_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state1_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr2_1[1]\);
    
    un1_del_cntr0_I_63 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_8_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_9_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\);
    
    \ret_state0_maj_RNIS45G1[2]\ : AO1A
      port map(A => N_347, B => \ret_state0[2]_net_1\, C => 
        \sequencer_state0[3]_net_1\, Y => 
        \ret_state0_maj_RNIS45G1[2]_net_1\);
    
    \sequencer_state1_maj_RNIUAT08[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_56_1, Y => 
        \n_del_cntr1[1]\);
    
    \sequencer_state0_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state0_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr3_1[0]\);
    
    un1_del_cntr1_I_54 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[10]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, Y => I_54_1);
    
    \ret_state1_maj[2]\ : MAJ3
      port map(A => \ret_state1_1[2]\, B => 
        \ret_state1_tmr2_1[2]\, C => \ret_state1_tmr3_1[2]\, Y
         => \ret_state1[2]_net_1\);
    
    un1_del_cntr0_I_85 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_1_0[0]\);
    
    un1_del_cntr0_I_68 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_5_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_6_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_2_0[0]\);
    
    \del_cntr0_maj[5]\ : MAJ3
      port map(A => \del_cntr0_1[5]\, B => \del_cntr0_tmr2_1[5]\, 
        C => \del_cntr0_tmr3_1[5]\, Y => \del_cntr0[5]_net_1\);
    
    \sequencer_state1_maj_RNIRNHLF1[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_50_1, Y => 
        \n_del_cntr1[12]\);
    
    \del_cntr0_maj[14]\ : MAJ3
      port map(A => \del_cntr0_1[14]\, B => 
        \del_cntr0_tmr2_1[14]\, C => \del_cntr0_tmr3_1[14]\, Y
         => \del_cntr0[14]_net_1\);
    
    \sequencer_state1_maj_RNIL42D61[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_54_1, Y => 
        \n_del_cntr1[10]\);
    
    \ret_state1_tmr2[5]\ : DFN1P0
      port map(D => \ret_state1_maj_RNI67QE[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state1_tmr2_1[5]\);
    
    un1_del_cntr0_I_11 : AND2
      port map(A => \del_cntr0[6]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\);
    
    \del_cntr1_tmr3[12]\ : DFN1P0
      port map(D => \n_del_cntr1[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[12]\);
    
    \del_cntr1[4]\ : DFN1P0
      port map(D => \n_del_cntr1[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[4]\);
    
    \ret_state1_maj_RNI56QE[4]\ : OA1A
      port map(A => N_275, B => \sequencer_state1[5]_net_1\, C
         => \ret_state1[4]_net_1\, Y => 
        \ret_state1_maj_RNI56QE[4]_net_1\);
    
    un1_del_cntr0_I_82 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_4_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_5_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\);
    
    un1_del_cntr0_I_8 : AND2
      port map(A => \del_cntr0[8]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\);
    
    un1_del_cntr1_I_71 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12[0]\);
    
    un1_del_cntr0_I_55 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[9]\, B => 
        \DWACT_ADD_CI_0_g_array_12_3_0[0]\, Y => I_55_2);
    
    \ch_out1_maj[2]\ : MAJ3
      port map(A => \ch_out1_1[2]\, B => \ch_out1_tmr2_1[2]\, C
         => \ch_out1_tmr3_1[2]\, Y => \ch_out1[2]_net_1\);
    
    \sequencer_state0_maj_RNI1CSTH[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_53_2, Y => 
        \n_del_cntr0[4]\);
    
    \del_cntr0[12]\ : DFN1P0
      port map(D => \n_del_cntr0[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[12]\);
    
    \ret_state1_maj[3]\ : MAJ3
      port map(A => \ret_state1_1[3]\, B => 
        \ret_state1_tmr2_1[3]\, C => \ret_state1_tmr3_1[3]\, Y
         => \ret_state1[3]_net_1\);
    
    un1_del_cntr1_I_23 : XOR2
      port map(A => \del_cntr1[5]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\);
    
    \sequencer_state1_maj_RNIMRV001[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_57_1, Y => 
        \n_del_cntr1[8]\);
    
    un1_del_cntr0_I_75 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_2_0[0]\);
    
    \sequencer_state0_maj_RNIK7ILS[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_59_2, Y => 
        \n_del_cntr0[7]\);
    
    \sequencer_state0_maj_RNIIFSOE1[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_48_2, Y => 
        \n_del_cntr0[11]\);
    
    un1_del_cntr0_I_52 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[2]\, B => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, Y => I_52_2);
    
    un1_del_cntr0_I_5 : AND2
      port map(A => \del_cntr0[7]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_7_0[0]\);
    
    un1_del_cntr1_I_81 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_10[0]\);
    
    un1_del_cntr1_I_28 : XOR2
      port map(A => \del_cntr1[8]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_7[0]\);
    
    un1_del_cntr1_I_36 : XOR2
      port map(A => \del_cntr1[1]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[1]\);
    
    \del_cntr0_tmr3[6]\ : DFN1P0
      port map(D => \n_del_cntr0[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[6]\);
    
    \sequencer_state1_maj_RNIP2SRG[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_53_1, Y => 
        \n_del_cntr1[4]\);
    
    \del_cntr0[0]\ : DFN1P0
      port map(D => \n_del_cntr0[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[0]\);
    
    \ch_out1_maj_RNI6PG3[0]\ : OR2A
      port map(A => SW4_SLAVE_PAIRS_BAR_c_0, B => 
        \ch_out1[0]_net_1\, Y => OUT_CHANNEL_VOSG_c(6));
    
    un1_del_cntr0_I_20 : XOR2
      port map(A => \del_cntr0[10]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_9_0[0]\);
    
    \ret_state1_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIVVPE[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_1[1]\);
    
    un1_del_cntr0_I_72 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_6_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_7_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_3_0[0]\);
    
    un1_del_cntr0_I_7 : AND2
      port map(A => \del_cntr0[2]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\);
    
    \sequencer_state0_maj_RNIBVCH[1]\ : NOR2
      port map(A => \sequencer_state0[1]_net_1\, B => 
        \ret_state0[0]_net_1\, Y => N_368);
    
    \ret_state1_maj_RNIFFCB[1]\ : NOR2A
      port map(A => \ret_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => \sequencer_state1_ns_a2_0[3]\);
    
    un1_del_cntr1_I_45 : XOR2
      port map(A => \del_cntr1[9]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[9]\);
    
    \del_cntr1_tmr3[10]\ : DFN1P0
      port map(D => \n_del_cntr1[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[10]\);
    
    \ch_out1_tmr2[0]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIS1HP1[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr2_1[0]\);
    
    \sequencer_state0_tmr2[3]\ : DFN1C0
      port map(D => \sequencer_state0_ns_o2_0_RNI0NSR3[1]_net_1\, 
        CLK => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state0_tmr2_1[3]\);
    
    \ch_out0_tmr3[1]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIOB5B2[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr3_1[1]\);
    
    un1_del_cntr1_I_12 : AND2
      port map(A => \del_cntr1[9]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\);
    
    un1_del_cntr1_I_1 : AND2
      port map(A => \del_cntr1[0]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_TMP[0]\);
    
    un1_del_cntr0_I_44 : XOR2
      port map(A => \del_cntr0[10]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[10]\);
    
    \sequencer_state1_maj_RNIFF26[2]\ : OR2
      port map(A => \sequencer_state1[2]_net_1\, B => 
        \sequencer_state1[1]_net_1\, Y => N_243);
    
    \del_cntr0_tmr3[9]\ : DFN1P0
      port map(D => \n_del_cntr0[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[9]\);
    
    \ret_state1_maj_RNI01PM[0]\ : NOR3B
      port map(A => \ret_state1[0]_net_1\, B => N_271, C => 
        \ret_state1[5]_net_1\, Y => 
        \sequencer_state1_ns_a2_0_1[5]\);
    
    \del_cntr1_tmr3[2]\ : DFN1P0
      port map(D => \n_del_cntr1[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[2]\);
    
    un1_del_cntr1_I_42 : XOR2
      port map(A => \del_cntr1[0]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[0]\);
    
    un1_del_cntr0_I_60 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[13]\, B => 
        \DWACT_ADD_CI_0_g_array_12_5_0[0]\, Y => I_60_2);
    
    \del_cntr1[0]\ : DFN1P0
      port map(D => \n_del_cntr1[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[0]\);
    
    \ret_state1_maj_RNIJK521[3]\ : NOR3C
      port map(A => N_270, B => \sequencer_state1_ns_a2_0_0[1]\, 
        C => N_271, Y => N_266);
    
    \del_cntr1_tmr3[7]\ : DFN1P0
      port map(D => \n_del_cntr1[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[7]\);
    
    \del_cntr0_maj[10]\ : MAJ3
      port map(A => \del_cntr0_1[10]\, B => 
        \del_cntr0_tmr2_1[10]\, C => \del_cntr0_tmr3_1[10]\, Y
         => \del_cntr0[10]_net_1\);
    
    \ch_out0[2]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIIBPR1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_1[2]\);
    
    \sequencer_state1_maj_RNIF51C7[0]\ : AO1
      port map(A => \sequencer_state1_ns_a2_0_1[5]\, B => N_274, 
        C => N_258, Y => \sequencer_state1_ns[5]\);
    
    un1_del_cntr1_I_53 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[4]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, Y => I_53_1);
    
    \ret_state0_tmr3[4]\ : DFN1C0
      port map(D => \ret_state0_maj_RNI1A5G1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_1[4]\);
    
    \del_cntr0_maj[7]\ : MAJ3
      port map(A => \del_cntr0_1[7]\, B => \del_cntr0_tmr2_1[7]\, 
        C => \del_cntr0_tmr3_1[7]\, Y => \del_cntr0[7]_net_1\);
    
    un1_del_cntr1_I_58 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[14]\, B => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\, Y => I_58_1);
    
    \ret_state1_maj_RNI01PM_0[0]\ : NOR3B
      port map(A => \ret_state1[5]_net_1\, B => N_271, C => 
        \ret_state1[0]_net_1\, Y => 
        \sequencer_state1_ns_a2_0_1[0]\);
    
    un1_del_cntr1_I_90 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_3[0]\);
    
    un1_del_cntr0_I_31 : XOR2
      port map(A => \del_cntr0[3]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_2_0[0]\);
    
    \sequencer_state1_maj_RNI3BBF5[4]\ : NOR2B
      port map(A => \sequencer_state1[4]_net_1\, B => N_236, Y
         => \sequencer_state1_ns_a2_0[1]\);
    
    \sequencer_state0_ns_a2_0_1[1]\ : AND2
      port map(A => N_374, B => \sequencer_state0_ns_a2_0_0[1]\, 
        Y => \sequencer_state0_ns_a2_0_1[1]_net_1\);
    
    \ret_state1_maj_RNIJJCB[3]\ : NOR2A
      port map(A => \ret_state1[4]_net_1\, B => 
        \ret_state1[3]_net_1\, Y => 
        \sequencer_state1_ns_a2_0_0[1]\);
    
    \del_cntr1_tmr3[5]\ : DFN1P0
      port map(D => \n_del_cntr1[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[5]\);
    
    \ch_out0_maj_RNIIBPR1[2]\ : MX2A
      port map(A => N_353, B => \ch_mreg_en[5]\, S => 
        \sequencer_state0[4]_net_1\, Y => 
        \ch_out0_maj_RNIIBPR1[2]_net_1\);
    
    un1_del_cntr0_I_89 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_1_0[0]\);
    
    \sequencer_state0_tmr2[5]\ : DFN1P0
      port map(D => \sequencer_state0_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state0_tmr2_1[5]\);
    
    \del_cntr0_tmr3[8]\ : DFN1P0
      port map(D => \n_del_cntr0[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[8]\);
    
    un1_del_cntr1_I_20 : XOR2
      port map(A => \del_cntr1[10]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_9[0]\);
    
    \sequencer_state0_maj[5]\ : MAJ3
      port map(A => \sequencer_state0_1[5]\, B => 
        \sequencer_state0_tmr2_1[5]\, C => 
        \sequencer_state0_tmr3_1[5]\, Y => 
        \sequencer_state0[5]_net_1\);
    
    \sequencer_state1_maj_RNI8FRMP[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_59_1, Y => 
        \n_del_cntr1[7]\);
    
    \ret_state1[4]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI56QE[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state1_1[4]\);
    
    \del_cntr1_tmr3[1]\ : DFN1P0
      port map(D => \n_del_cntr1[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[1]\);
    
    \del_cntr1_tmr2[9]\ : DFN1P0
      port map(D => \n_del_cntr1[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[9]\);
    
    \del_cntr1[12]\ : DFN1P0
      port map(D => \n_del_cntr1[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[12]\);
    
    \sequencer_state0_maj_RNIQ8EJ[4]\ : NOR2B
      port map(A => \sequencer_state0[4]_net_1\, B => N_371, Y
         => \sequencer_state0_ns_a2_2_0[0]\);
    
    \sequencer_state0[1]\ : DFN1C0
      port map(D => \sequencer_state0_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_1[1]\);
    
    \del_cntr0_tmr3[0]\ : DFN1P0
      port map(D => \n_del_cntr0[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[0]\);
    
    \del_cntr0_maj[8]\ : MAJ3
      port map(A => \del_cntr0_1[8]\, B => \del_cntr0_tmr2_1[8]\, 
        C => \del_cntr0_tmr3_1[8]\, Y => \del_cntr0[8]_net_1\);
    
    \ret_state1_maj_RNIFFCB_1[1]\ : NOR2
      port map(A => \ret_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => N_271);
    
    \sequencer_state1_maj_RNIOO39_0[3]\ : NOR2
      port map(A => \sequencer_state1[3]_net_1\, B => N_243, Y
         => \sequencer_state1_ns_a2_0[0]\);
    
    \sequencer_state1_maj[5]\ : MAJ3
      port map(A => \sequencer_state1_1[5]\, B => 
        \sequencer_state1_tmr2_1[5]\, C => 
        \sequencer_state1_tmr3_1[5]\, Y => 
        \sequencer_state1[5]_net_1\);
    
    \sequencer_state0_maj_RNIR35G1[1]\ : NOR3
      port map(A => \sequencer_state0[3]_net_1\, B => 
        \sequencer_state0[1]_net_1\, C => N_367, Y => 
        \sequencer_state0_maj_RNIR35G1[1]_net_1\);
    
    \ret_state0_maj_RNIH524[3]\ : NOR2
      port map(A => \ret_state0[3]_net_1\, B => 
        \ret_state0[4]_net_1\, Y => N_371);
    
    \main_sequencer.un5_n_ch_out0\ : NOR3C
      port map(A => N_85, B => channels_desired_on(5), C => 
        dtycyc_en, Y => un5_n_ch_out0);
    
    un1_del_cntr1_I_75 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\);
    
    un1_del_cntr1_I_37 : XOR2
      port map(A => \del_cntr1[14]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[14]\);
    
    \del_cntr1_maj[9]\ : MAJ3
      port map(A => \del_cntr1_1[9]\, B => \del_cntr1_tmr2_1[9]\, 
        C => \del_cntr1_tmr3_1[9]\, Y => \del_cntr1[9]_net_1\);
    
    \ch_out0_maj_RNIOB5B2[1]\ : MX2A
      port map(A => N_369, B => \ch_iaux_en[5]\, S => 
        \sequencer_state0[4]_net_1\, Y => 
        \ch_out0_maj_RNIOB5B2[1]_net_1\);
    
    un1_del_cntr0_I_59 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[7]\, B => 
        \DWACT_ADD_CI_0_g_array_12_2_0[0]\, Y => I_59_2);
    
    un1_del_cntr0_I_12 : AND2
      port map(A => \del_cntr0[9]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_9_0[0]\);
    
    un1_del_cntr0_I_1 : AND2
      port map(A => \del_cntr0[0]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_TMP_0[0]\);
    
    \ret_state1_maj_RNISVDA2[1]\ : AO1
      port map(A => \sequencer_state1_ns_i_a2_0_0[2]\, B => N_270, 
        C => N_255, Y => \sequencer_state1_ns_i_0[2]\);
    
    \del_cntr0_tmr3[3]\ : DFN1P0
      port map(D => \n_del_cntr0[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[3]\);
    
    \del_cntr0[2]\ : DFN1P0
      port map(D => \n_del_cntr0[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[2]\);
    
    \sequencer_state0_ns_o2_0_RNITOF33[1]\ : AO1
      port map(A => \sequencer_state0_ns_a2_0[1]_net_1\, B => 
        channels_ready(5), C => \sequencer_state0_ns_0[1]\, Y => 
        \sequencer_state0_ns[1]\);
    
    \del_cntr0_maj[6]\ : MAJ3
      port map(A => \del_cntr0_1[6]\, B => \del_cntr0_tmr2_1[6]\, 
        C => \del_cntr0_tmr3_1[6]\, Y => \del_cntr0[6]_net_1\);
    
    \ch_out0_tmr2[2]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIIBPR1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr2_1[2]\);
    
    \sequencer_state1_tmr3[4]\ : DFN1C0
      port map(D => \sequencer_state1_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr3_1[4]\);
    
    \sequencer_state1_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state1_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr3_1[1]\);
    
    \ret_state0[0]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIQ25G1[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_1[0]\);
    
    \del_cntr1[5]\ : DFN1P0
      port map(D => \n_del_cntr1[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[5]\);
    
    \sequencer_state0_tmr3[3]\ : DFN1C0
      port map(D => \sequencer_state0_ns_o2_0_RNI0NSR3[1]_net_1\, 
        CLK => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state0_tmr3_1[3]\);
    
    un1_del_cntr0_I_79 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_2_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_3_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_1_0[0]\);
    
    \sequencer_state0_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state0_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr2_1[0]\);
    
    un1_del_cntr1_I_72 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_6[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\);
    
    un1_del_cntr1_I_7 : AND2
      port map(A => \del_cntr1[2]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\);
    
    \sequencer_state0_maj_RNIPQ8TB1[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_54_2, Y => 
        \n_del_cntr0[10]\);
    
    \ret_state1[3]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI45QE[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state1_1[3]\);
    
    \del_cntr0_maj_RNIENJJ[5]\ : NOR3A
      port map(A => un5_del_cntr0_4, B => \del_cntr0[6]_net_1\, C
         => \del_cntr0[5]_net_1\, Y => un5_del_cntr0_9);
    
    un1_del_cntr1_I_85 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_1[0]\);
    
    \ret_state1_maj[4]\ : MAJ3
      port map(A => \ret_state1_1[4]\, B => 
        \ret_state1_tmr2_1[4]\, C => \ret_state1_tmr3_1[4]\, Y
         => \ret_state1[4]_net_1\);
    
    \del_cntr1_maj_RNISRHT[14]\ : NOR3
      port map(A => \del_cntr1[1]_net_1\, B => 
        \del_cntr1[14]_net_1\, C => \del_cntr1[13]_net_1\, Y => 
        un6_del_cntr1_7);
    
    \ret_state0_tmr2[5]\ : DFN1P0
      port map(D => \ret_state0_maj_RNI2B5G1[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state0_tmr2_1[5]\);
    
    un1_del_cntr0_I_43 : XOR2
      port map(A => \del_cntr0[11]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[11]\);
    
    \sequencer_state0_maj_RNIE32B41[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_57_2, Y => 
        \n_del_cntr0[8]\);
    
    \ret_state0[4]\ : DFN1C0
      port map(D => \ret_state0_maj_RNI1A5G1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state0_1[4]\);
    
    \del_cntr0[8]\ : DFN1P0
      port map(D => \n_del_cntr0[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[8]\);
    
    un1_del_cntr1_I_19 : XOR2
      port map(A => \del_cntr1[7]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\);
    
    \ret_state0_maj_RNI095G1[3]\ : OA1A
      port map(A => N_379, B => \sequencer_state0[5]_net_1\, C
         => \ret_state0[3]_net_1\, Y => 
        \ret_state0_maj_RNI095G1[3]_net_1\);
    
    un1_del_cntr1_I_49 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[6]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, Y => I_49_1);
    
    un1_del_cntr0_I_48 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[11]\, B => 
        \DWACT_ADD_CI_0_g_array_12_4_0[0]\, Y => I_48_2);
    
    \ch_out0_maj[2]\ : MAJ3
      port map(A => \ch_out0_1[2]\, B => \ch_out0_tmr2_1[2]\, C
         => \ch_out0_tmr3_1[2]\, Y => \ch_mreg_en[5]\);
    
    un1_del_cntr1_I_82 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\);
    
    un1_del_cntr1_I_8 : AND2
      port map(A => \del_cntr1[8]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\);
    
    \ret_state1[0]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIUUPE[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_1[0]\);
    
    \del_cntr1_maj_RNI6C4A4[5]\ : NOR3C
      port map(A => un6_del_cntr1_10, B => un6_del_cntr1_9, C => 
        un6_del_cntr1_11, Y => un6_del_cntr1);
    
    un1_del_cntr1_I_50 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[12]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, Y => I_50_1);
    
    \sequencer_state0[4]\ : DFN1C0
      port map(D => \sequencer_state0_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_1[4]\);
    
    \ret_state0_maj[5]\ : MAJ3
      port map(A => \ret_state0_1[5]\, B => 
        \ret_state0_tmr2_1[5]\, C => \ret_state0_tmr3_1[5]\, Y
         => \ret_state0[5]_net_1\);
    
    \del_cntr1_tmr3[13]\ : DFN1P0
      port map(D => \n_del_cntr1[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[13]\);
    
    \del_cntr0_maj_RNIMANR[14]\ : NOR3C
      port map(A => un5_del_cntr0_2, B => un5_del_cntr0_1, C => 
        un5_del_cntr0_7, Y => un5_del_cntr0_11);
    
    \del_cntr0_maj[0]\ : MAJ3
      port map(A => \del_cntr0_1[0]\, B => \del_cntr0_tmr2_1[0]\, 
        C => \del_cntr0_tmr3_1[0]\, Y => \del_cntr0[0]_net_1\);
    
    \sequencer_state1[5]\ : DFN1P0
      port map(D => \sequencer_state1_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state1_1[5]\);
    
    \sequencer_state1[4]\ : DFN1C0
      port map(D => \sequencer_state1_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_1[4]\);
    
    \sequencer_state0_maj_RNI3MTTL1[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_50_2, Y => 
        \n_del_cntr0[12]\);
    
    \del_cntr0_tmr3[14]\ : DFN1P0
      port map(D => \n_del_cntr0[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[14]\);
    
    \del_cntr1_maj[12]\ : MAJ3
      port map(A => \del_cntr1_1[12]\, B => 
        \del_cntr1_tmr2_1[12]\, C => \del_cntr1_tmr3_1[12]\, Y
         => \del_cntr1[12]_net_1\);
    
    \ret_state0_maj_RNINEIR[0]\ : NOR3C
      port map(A => N_358_1, B => N_342_i, C => N_375, Y => N_359);
    
    \ch_out1_maj[1]\ : MAJ3
      port map(A => \ch_out1_1[1]\, B => \ch_out1_tmr2_1[1]\, C
         => \ch_out1_tmr3_1[1]\, Y => \ch_out1[1]_net_1\);
    
    \ret_state0_maj_RNIEJFH3_0[1]\ : NOR3C
      port map(A => N_374, B => N_378, C => 
        \sequencer_state0_ns_a2_0[3]\, Y => 
        \sequencer_state0_ns[3]\);
    
    \sequencer_state1_maj[4]\ : MAJ3
      port map(A => \sequencer_state1_1[4]\, B => 
        \sequencer_state1_tmr2_1[4]\, C => 
        \sequencer_state1_tmr3_1[4]\, Y => 
        \sequencer_state1[4]_net_1\);
    
    \del_cntr0_tmr2[13]\ : DFN1P0
      port map(D => \n_del_cntr0[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[13]\);
    
    \ret_state0_maj_RNIET4N1[1]\ : AO1
      port map(A => \sequencer_state0_ns_i_a2_0_0[2]\, B => N_374, 
        C => N_359, Y => \sequencer_state0_ns_i_0[2]\);
    
    \ch_out0_maj[0]\ : MAJ3
      port map(A => \ch_out0_1[0]\, B => \ch_out0_tmr2_1[0]\, C
         => \ch_out0_tmr3_1[0]\, Y => \OUT_CHANNEL_VOSG_c[5]\);
    
    \del_cntr1[6]\ : DFN1P0
      port map(D => \n_del_cntr1[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[6]\);
    
    \sequencer_state0_maj_RNII04E1[0]\ : NOR2
      port map(A => N_347, B => \sequencer_state0[0]_net_1\, Y
         => N_369);
    
    \ret_state0_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIR35G1[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_1[1]\);
    
    \del_cntr0_tmr3[11]\ : DFN1P0
      port map(D => \n_del_cntr0[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[11]\);
    
    \sequencer_state0_maj_RNILH8D71[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_55_2, Y => 
        \n_del_cntr0[9]\);
    
    \sequencer_state0_tmr3[5]\ : DFN1P0
      port map(D => \sequencer_state0_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state0_tmr3_1[5]\);
    
    \del_cntr1_maj_RNITTPV1[0]\ : NOR3C
      port map(A => un6_del_cntr1_2, B => un6_del_cntr1_1, C => 
        un6_del_cntr1_7, Y => un6_del_cntr1_11);
    
    \sequencer_state1_maj_RNIFSV95[0]\ : NOR2B
      port map(A => \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, B
         => un6_del_cntr1, Y => N_260);
    
    \ret_state0_maj_RNID124_0[1]\ : NOR2A
      port map(A => \ret_state0[1]_net_1\, B => 
        \ret_state0[2]_net_1\, Y => \sequencer_state0_ns_a2_0[4]\);
    
    \sequencer_state1_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state1_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr2_1[2]\);
    
    \del_cntr1_maj[3]\ : MAJ3
      port map(A => \del_cntr1_1[3]\, B => \del_cntr1_tmr2_1[3]\, 
        C => \del_cntr1_tmr3_1[3]\, Y => \del_cntr1[3]_net_1\);
    
    un1_del_cntr0_I_35 : XOR2
      port map(A => \del_cntr0[7]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[7]\);
    
    \ret_state1_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIUUPE[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_1[0]\);
    
    \del_cntr1_tmr3[4]\ : DFN1P0
      port map(D => \n_del_cntr1[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[4]\);
    
    un1_del_cntr0_I_26 : XOR2
      port map(A => \del_cntr0[6]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_5_0[0]\);
    
    \del_cntr1[3]\ : DFN1P0
      port map(D => \n_del_cntr1[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[3]\);
    
    \ret_state1_maj[1]\ : MAJ3
      port map(A => \ret_state1_1[1]\, B => 
        \ret_state1_tmr2_1[1]\, C => \ret_state1_tmr3_1[1]\, Y
         => \ret_state1[1]_net_1\);
    
    \del_cntr1_maj_RNIJ34H[3]\ : NOR2
      port map(A => \del_cntr1[3]_net_1\, B => 
        \del_cntr1[4]_net_1\, Y => un6_del_cntr1_2);
    
    un1_del_cntr1_I_65 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\);
    
    un1_del_cntr0_I_54 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[10]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\, Y => I_54_2);
    
    un1_del_cntr0_I_90 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_8_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_3_0[0]\);
    
    \del_cntr1_tmr2[2]\ : DFN1P0
      port map(D => \n_del_cntr1[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[2]\);
    
    \sequencer_state1_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state1_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr3_1[2]\);
    
    \del_cntr1_maj_RNIRB4H[7]\ : NOR2
      port map(A => \del_cntr1[7]_net_1\, B => 
        \del_cntr1[8]_net_1\, Y => un6_del_cntr1_4);
    
    un1_del_cntr0_I_19 : XOR2
      port map(A => \del_cntr0[7]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_6_0[0]\);
    
    un1_del_cntr0_I_74 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_3_0[0]\);
    
    \del_cntr1_tmr2[7]\ : DFN1P0
      port map(D => \n_del_cntr1[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[7]\);
    
    \ch_out0_tmr2[0]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIM3SA3[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr2_1[0]\);
    
    \sequencer_state1_maj[0]\ : MAJ3
      port map(A => \sequencer_state1_1[0]\, B => 
        \sequencer_state1_tmr2_1[0]\, C => 
        \sequencer_state1_tmr3_1[0]\, Y => 
        \sequencer_state1[0]_net_1\);
    
    un1_del_cntr1_I_62 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[5]\, B => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, Y => I_62_1);
    
    un1_del_cntr1_I_6 : AND2
      port map(A => \del_cntr1[3]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\);
    
    un1_del_cntr0_I_66 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_2_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_3_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_1_0[0]\);
    
    un1_del_cntr0_I_40 : XOR2
      port map(A => \del_cntr0[8]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[8]\);
    
    un1_del_cntr1_I_79 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\);
    
    un1_del_cntr1_I_14 : AND2
      port map(A => \del_cntr1[5]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\);
    
    \sequencer_state0_tmr2[4]\ : DFN1C0
      port map(D => \sequencer_state0_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr2_1[4]\);
    
    \sequencer_state0_maj_RNI676C1_1[0]\ : NOR2A
      port map(A => channels_ready(5), B => 
        \sequencer_state0[0]_net_1\, Y => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\);
    
    \ret_state1[1]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIVVPE[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_1[1]\);
    
    \sequencer_state0_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state0_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr2_1[1]\);
    
    \sequencer_state0_maj_RNIHTBJP[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_49_2, Y => 
        \n_del_cntr0[6]\);
    
    un1_del_cntr1_I_44 : XOR2
      port map(A => \del_cntr1[10]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[10]\);
    
    \sequencer_state0_maj_RNI0I20L[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_62_2, Y => 
        \n_del_cntr0[5]\);
    
    \sequencer_state0_maj_RNIE2OU[0]\ : NOR2
      port map(A => \sequencer_state0[0]_net_1\, B => 
        \sequencer_state0[4]_net_1\, Y => N_379);
    
    un1_del_cntr1_I_89 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_1[0]\);
    
    \ret_state1_tmr2[3]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI45QE[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_1[3]\);
    
    \ret_state1[2]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI01QE[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_1[2]\);
    
    \del_cntr0_tmr2[8]\ : DFN1P0
      port map(D => \n_del_cntr0[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[8]\);
    
    \ch_out0_maj[1]\ : MAJ3
      port map(A => \ch_out0_1[1]\, B => \ch_out0_tmr2_1[1]\, C
         => \ch_out0_tmr3_1[1]\, Y => \ch_iaux_en[5]\);
    
    \sequencer_state0_maj_RNIT4953[0]\ : NOR2B
      port map(A => N_380_0, B => un5_del_cntr0, Y => N_364);
    
    \sequencer_state0_maj_RNIL34E1[3]\ : OR2
      port map(A => \sequencer_state0[3]_net_1\, B => N_347, Y
         => \sequencer_state0_ns_0[1]\);
    
    \ret_state1_maj_RNI6L5C6[1]\ : NOR3C
      port map(A => N_270, B => N_274, C => 
        \sequencer_state1_ns_a2_0[4]\, Y => 
        \sequencer_state1_ns[4]\);
    
    \del_cntr1_tmr2[12]\ : DFN1P0
      port map(D => \n_del_cntr1[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[12]\);
    
    \del_cntr0_tmr2[0]\ : DFN1P0
      port map(D => \n_del_cntr0[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[0]\);
    
    \del_cntr0_maj_RNICGP9[0]\ : NOR2
      port map(A => \del_cntr0[2]_net_1\, B => 
        \del_cntr0[0]_net_1\, Y => un5_del_cntr0_1);
    
    un1_del_cntr1_I_26 : XOR2
      port map(A => \del_cntr1[6]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_5[0]\);
    
    un1_del_cntr0_I_83 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_1_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\);
    
    \sequencer_state1_maj_RNI9GRV_0[0]\ : NOR2A
      port map(A => channels_ready(6), B => 
        \sequencer_state1[0]_net_1\, Y => N_276_0);
    
    \sequencer_state0_maj[0]\ : MAJ3
      port map(A => \sequencer_state0_1[0]\, B => 
        \sequencer_state0_tmr2_1[0]\, C => 
        \sequencer_state0_tmr3_1[0]\, Y => 
        \sequencer_state0[0]_net_1\);
    
    un1_del_cntr1_I_31 : XOR2
      port map(A => \del_cntr1[3]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\);
    
    \ret_state0_maj[1]\ : MAJ3
      port map(A => \ret_state0_1[1]\, B => 
        \ret_state0_tmr2_1[1]\, C => \ret_state0_tmr3_1[1]\, Y
         => \ret_state0[1]_net_1\);
    
    \del_cntr1[9]\ : DFN1P0
      port map(D => \n_del_cntr1[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_1[9]\);
    
    un1_del_cntr0_I_88 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_0[0]\);
    
    un1_del_cntr0_I_27 : XOR2
      port map(A => \del_cntr0[11]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_10_0[0]\);
    
    \sequencer_state1[0]\ : DFN1C0
      port map(D => \sequencer_state1_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_1[0]\);
    
    \sequencer_state0_maj_RNID1OU[2]\ : OR2
      port map(A => \sequencer_state0[2]_net_1\, B => 
        \sequencer_state0[1]_net_1\, Y => N_347);
    
    \del_cntr1_tmr2[3]\ : DFN1P0
      port map(D => \n_del_cntr1[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[3]\);
    
    \sequencer_state0_maj_RNIBVNU[1]\ : NOR2
      port map(A => \sequencer_state0[1]_net_1\, B => 
        \sequencer_state0[0]_net_1\, Y => N_353);
    
    un1_del_cntr0_I_53 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[4]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, Y => I_53_2);
    
    \ret_state1_maj_RNI3BBF5[0]\ : NOR3C
      port map(A => un6_del_cntr1, B => 
        \sequencer_state1_ns_a2_2_0[0]\, C => 
        \sequencer_state1_ns_a2_0_1[0]\, Y => N_251);
    
    \del_cntr1_tmr3[11]\ : DFN1P0
      port map(D => \n_del_cntr1[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[11]\);
    
    un1_del_cntr0_I_14 : AND2
      port map(A => \del_cntr0[5]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_5_0[0]\);
    
    \del_cntr0_tmr2[6]\ : DFN1P0
      port map(D => \n_del_cntr0[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[6]\);
    
    un1_del_cntr0_I_73 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_12_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_13_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_6_0[0]\);
    
    un1_del_cntr0_I_58 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[14]\, B => 
        \DWACT_ADD_CI_0_g_array_11_2_0[0]\, Y => I_58_2);
    
    \del_cntr1_maj[13]\ : MAJ3
      port map(A => \del_cntr1_1[13]\, B => 
        \del_cntr1_tmr2_1[13]\, C => \del_cntr1_tmr3_1[13]\, Y
         => \del_cntr1[13]_net_1\);
    
    \del_cntr0_tmr3[12]\ : DFN1P0
      port map(D => \n_del_cntr0[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[12]\);
    
    un1_del_cntr0_I_67 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_10_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_11_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_5_0[0]\);
    
    un1_del_cntr0_I_39 : XOR2
      port map(A => \del_cntr0[13]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[13]\);
    
    \sequencer_state1_maj_RNIUD9L6[3]\ : AO1A
      port map(A => channels_ready(6), B => 
        \sequencer_state1_ns_a2_0[0]\, C => N_251, Y => 
        \sequencer_state1_ns[0]\);
    
    \del_cntr1_tmr2[10]\ : DFN1P0
      port map(D => \n_del_cntr1[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[10]\);
    
    un1_del_cntr1_I_74 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\);
    
    \del_cntr0_tmr3[10]\ : DFN1P0
      port map(D => \n_del_cntr0[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_1[10]\);
    
    un1_del_cntr1_I_69 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\);
    
    un1_del_cntr0_I_78 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\);
    
    un1_del_cntr1_I_13 : AND2
      port map(A => \del_cntr1[12]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\);
    
    \ret_state1_maj[5]\ : MAJ3
      port map(A => \ret_state1_1[5]\, B => 
        \ret_state1_tmr2_1[5]\, C => \ret_state1_tmr3_1[5]\, Y
         => \ret_state1[5]_net_1\);
    
    un1_del_cntr1_I_56 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[1]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, Y => I_56_1);
    
    \ret_state0_maj[4]\ : MAJ3
      port map(A => \ret_state0_1[4]\, B => 
        \ret_state0_tmr2_1[4]\, C => \ret_state0_tmr3_1[4]\, Y
         => \ret_state0[4]_net_1\);
    
    un1_del_cntr1_I_43 : XOR2
      port map(A => \del_cntr1[11]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[11]\);
    
    un1_del_cntr1_I_18 : AND2
      port map(A => \del_cntr1[1]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\);
    
    un1_del_cntr1_I_48 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[11]\, B => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\, Y => I_48_1);
    
    \del_cntr0_maj[2]\ : MAJ3
      port map(A => \del_cntr0_1[2]\, B => \del_cntr0_tmr2_1[2]\, 
        C => \del_cntr0_tmr3_1[2]\, Y => \del_cntr0[2]_net_1\);
    
    \sequencer_state0_maj_RNIR9EJ[5]\ : NOR2A
      port map(A => N_371, B => \sequencer_state0[5]_net_1\, Y
         => N_358_1);
    
    \main_sequencer.un2_n_ch_out1\ : NOR3C
      port map(A => N_79, B => channels_desired_on(6), C => 
        dtycyc_en, Y => un2_n_ch_out1);
    
    \ret_state0_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIQ25G1[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_1[0]\);
    
    \del_cntr1_maj[8]\ : MAJ3
      port map(A => \del_cntr1_1[8]\, B => \del_cntr1_tmr2_1[8]\, 
        C => \del_cntr1_tmr3_1[8]\, Y => \del_cntr1[8]_net_1\);
    
    \ret_state0_maj_RNIS448_0[0]\ : NOR3B
      port map(A => \ret_state0[5]_net_1\, B => N_375, C => 
        \ret_state0[0]_net_1\, Y => 
        \sequencer_state0_ns_a2_0_1[0]\);
    
    \ret_state0_maj_RNID124[1]\ : NOR2A
      port map(A => \ret_state0[2]_net_1\, B => 
        \ret_state0[1]_net_1\, Y => \sequencer_state0_ns_a2_0[3]\);
    
    un1_del_cntr1_I_27 : XOR2
      port map(A => \del_cntr1[11]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\);
    
    \del_cntr1_tmr3[6]\ : DFN1P0
      port map(D => \n_del_cntr1[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[6]\);
    
    \ch_out0[0]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIM3SA3[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_1[0]\);
    
    un1_del_cntr0_I_80 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_4_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_5_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_2_0[0]\);
    
    \del_cntr0_tmr2[1]\ : DFN1P0
      port map(D => \n_del_cntr0[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_1[1]\);
    
    \del_cntr1_tmr3[14]\ : DFN1P0
      port map(D => \n_del_cntr1[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[14]\);
    
    \del_cntr0[6]\ : DFN1P0
      port map(D => \n_del_cntr0[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[6]\);
    
    \sequencer_state0_maj[2]\ : MAJ3
      port map(A => \sequencer_state0_1[2]\, B => 
        \sequencer_state0_tmr2_1[2]\, C => 
        \sequencer_state0_tmr3_1[2]\, Y => 
        \sequencer_state0[2]_net_1\);
    
    \del_cntr1_maj[11]\ : MAJ3
      port map(A => \del_cntr1_1[11]\, B => 
        \del_cntr1_tmr2_1[11]\, C => \del_cntr1_tmr3_1[11]\, Y
         => \del_cntr1[11]_net_1\);
    
    \ret_state0[2]\ : DFN1C0
      port map(D => \ret_state0_maj_RNIS45G1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state0_1[2]\);
    
    \sequencer_state0_maj_RNI676C1[0]\ : NOR2B
      port map(A => \sequencer_state0[0]_net_1\, B => 
        channels_ready(5), Y => N_362);
    
    \sequencer_state0[2]\ : DFN1C0
      port map(D => \sequencer_state0_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_1[2]\);
    
    \sequencer_state0_maj_RNIM54L5[0]\ : OR3
      port map(A => N_379, B => N_364, C => 
        \DWACT_ADD_CI_0_partial_sum[0]\, Y => \n_del_cntr0[0]\);
    
    \del_cntr1_tmr3[9]\ : DFN1P0
      port map(D => \n_del_cntr1[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[9]\);
    
    \ch_out1_tmr3[0]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIS1HP1[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr3_1[0]\);
    
    un1_del_cntr0_I_50 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[12]\, B => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, Y => I_50_2);
    
    \del_cntr0[3]\ : DFN1P0
      port map(D => \n_del_cntr0[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_1[3]\);
    
    un1_del_cntr1_I_35 : XOR2
      port map(A => \del_cntr1[7]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[7]\);
    
    \sequencer_state0_tmr3[4]\ : DFN1C0
      port map(D => \sequencer_state0_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr3_1[4]\);
    
    un1_del_cntr0_I_13 : AND2
      port map(A => \del_cntr0[12]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\);
    
    \sequencer_state1_maj_RNIERFO6[0]\ : OR3
      port map(A => N_275, B => N_260, C => 
        \DWACT_ADD_CI_0_partial_sum_0[0]\, Y => \n_del_cntr1[0]\);
    
    \sequencer_state0_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state0_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr3_1[1]\);
    
    \ret_state1_maj_RNIDEQP[1]\ : XA1
      port map(A => \ret_state1[1]_net_1\, B => 
        \ret_state1[2]_net_1\, C => N_254_1, Y => 
        \sequencer_state1_ns_i_a2_0_0[2]\);
    
    un1_del_cntr0_I_70 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1_0[0]\);
    
    un1_del_cntr0_I_46 : XOR2
      port map(A => \del_cntr0[6]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[6]\);
    
    un1_del_cntr0_I_34 : XOR2
      port map(A => \del_cntr0[4]_net_1\, B => 
        \sequencer_state0_maj_RNI676C1_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[4]\);
    
    \ret_state0_tmr2[3]\ : DFN1C0
      port map(D => \ret_state0_maj_RNI095G1[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_1[3]\);
    
    un1_del_cntr0_I_18 : AND2
      port map(A => \del_cntr0[1]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_1_0[0]\);
    
    \ret_state0_maj_RNID124_1[1]\ : NOR2
      port map(A => \ret_state0[2]_net_1\, B => 
        \ret_state0[1]_net_1\, Y => N_375);
    
    un1_del_cntr1_I_73 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_12[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\);
    
    un1_del_cntr1_I_64 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0[0]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1[0]\);
    
    \sequencer_state0[3]\ : DFN1C0
      port map(D => \sequencer_state0_ns_o2_0_RNI0NSR3[1]_net_1\, 
        CLK => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state0_1[3]\);
    
    un1_del_cntr1_I_10 : AND2
      port map(A => \del_cntr1[4]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\);
    
    un1_del_cntr1_I_57 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[8]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, Y => I_57_1);
    
    \sequencer_state0_maj_RNI0FHPO1[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_60_2, Y => 
        \n_del_cntr0[13]\);
    
    \sequencer_state0_maj[1]\ : MAJ3
      port map(A => \sequencer_state0_1[1]\, B => 
        \sequencer_state0_tmr2_1[1]\, C => 
        \sequencer_state0_tmr3_1[1]\, Y => 
        \sequencer_state0[1]_net_1\);
    
    un1_del_cntr1_I_40 : XOR2
      port map(A => \del_cntr1[8]_net_1\, B => 
        \sequencer_state1_maj_RNI9GRV_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[8]\);
    
    \sequencer_state1_maj[1]\ : MAJ3
      port map(A => \sequencer_state1_1[1]\, B => 
        \sequencer_state1_tmr2_1[1]\, C => 
        \sequencer_state1_tmr3_1[1]\, Y => 
        \sequencer_state1[1]_net_1\);
    
    \ret_state0_maj_RNI1A5G1[4]\ : OA1A
      port map(A => N_379, B => \sequencer_state0[5]_net_1\, C
         => \ret_state0[4]_net_1\, Y => 
        \ret_state0_maj_RNI1A5G1[4]_net_1\);
    
    un1_del_cntr1_I_78 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\);
    
    \ret_state1_tmr3[3]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI45QE[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_1[3]\);
    
    \del_cntr1_tmr3[8]\ : DFN1P0
      port map(D => \n_del_cntr1[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_1[8]\);
    
    un1_del_cntr1_I_83 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_3[0]\);
    
    \ret_state1_maj_RNIFFCB_0[1]\ : NOR2A
      port map(A => \ret_state1[1]_net_1\, B => 
        \ret_state1[2]_net_1\, Y => \sequencer_state1_ns_a2_0[4]\);
    
    \sequencer_state0_ns_o2_0_RNIHHT71[1]\ : OA1C
      port map(A => \sequencer_state0[4]_net_1\, B => N_340, C
         => \sequencer_state0[5]_net_1\, Y => N_357);
    
    \del_cntr1_tmr2[13]\ : DFN1P0
      port map(D => \n_del_cntr1[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_1[13]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity IIR_FILT_4_0 is

    port( IN_INVOLTAGE_OK_c_0  : in    std_logic;
          ch_out1_0            : in    std_logic;
          J11_DEBUG_c_c_0      : in    std_logic;
          OUT_CHANNEL_MREG_c_0 : out   std_logic;
          channel_involtage_ok : inout std_logic_vector(4 downto 1) := (others => 'Z');
          master_rst_b         : in    std_logic;
          clk_5m_gl            : in    std_logic;
          N_152_mux            : out   std_logic
        );

end IIR_FILT_4_0;

architecture DEF_ARCH of IIR_FILT_4_0 is 

  component AO1A
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

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component NOR3C
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

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component OR3A
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

  component AOI1B
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

  component OAI1
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

  component XOR2
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

  component NOR2
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

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal n_sigout15lto7_2, \FILT_OUT[3]_net_1\, 
        \FILT_OUT[7]_net_1\, \FILT_OUT[5]_net_1\, 
        n_sigout15lto7_1, \FILT_OUT[6]_net_1\, 
        \FILT_OUT[4]_net_1\, n_sigout3lto6_1, n_sigout3lto6_0, 
        m15_0, N_23_i, i10_mux, N_27_i, i6_mux, N_29_i, i4_mux, 
        N_31_i, \FILT_OUT[2]_net_1\, i2_mux, N_33_i, 
        \FILT_OUT[0]_net_1\, \FILT_OUT[1]_net_1\, 
        ADD_4x4_slow_I1_S_0, I0_un1_CO1, \SUM_IN_A[5]_net_1\, N70, 
        n_sigout3, \THRESH_VAL_maj_RNISCQ05[1]_net_1\, 
        \THRESH_VAL[1]_net_1\, N_113, \THRESH_VAL_ns[0]\, 
        \THRESH_VAL[0]_net_1\, N_93, N_95, ADD_4x4_slow_I2_S_0, 
        i12_mux, ADD_4x4_slow_I0_S_0, i8_mux, N_40, 
        \SUM_IN_A[4]_net_1\, ADD_4x4_slow_I3_Y_0, 
        \SIGOUT_maj_RNIB5HG7\, \SIG_IN_DEL_maj_RNIC62E\, 
        \SIG_IN_DEL\, \SIG_IN_DEL_maj_RNIC62E_0\, \FILT_OUT_2[7]\, 
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
        SIGOUT_tmr3_2, SIG_IN_DEL_2, SIG_IN_DEL_tmr2_2, 
        SIG_IN_DEL_tmr3_2, \GND\, \VCC\ : std_logic;

begin 


    \THRESH_VAL_maj_RNIRBQ05[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_113, Y => \THRESH_VAL_ns[0]\);
    
    SIG_IN_DEL_maj_RNIC62E_0 : NOR2B
      port map(A => \SIG_IN_DEL\, B => IN_INVOLTAGE_OK_c_0, Y => 
        \SIG_IN_DEL_maj_RNIC62E_0\);
    
    \FILT_OUT[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_2[4]\);
    
    SIGOUT_tmr2 : DFN1C0
      port map(D => \SIGOUT_maj_RNIB5HG7\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIGOUT_tmr2_2);
    
    \THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNISCQ05[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \THRESH_VAL_tmr2_2[1]\);
    
    \THRESH_VAL_maj_RNIE6DG2[1]\ : NOR3C
      port map(A => n_sigout15lto7_1, B => n_sigout15lto7_2, C
         => \THRESH_VAL[1]_net_1\, Y => N_113);
    
    \SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIC62E_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr2_2[5]\);
    
    \FILT_OUT[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_2[6]\);
    
    \THRESH_VAL[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_2[0]\);
    
    SIGOUT_tmr3 : DFN1C0
      port map(D => \SIGOUT_maj_RNIB5HG7\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIGOUT_tmr3_2);
    
    un2_n_filt_out_ADD_4x4_slow_I0_un1_CO1 : XA1A
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => I0_un1_CO1);
    
    un1_tmp_sum_in_b_0_m22 : XNOR3
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => i10_mux, Y => N_23_i);
    
    \THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_tmr3_2[0]\);
    
    \FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2_2[7]\);
    
    \FILT_OUT_maj_RNINUEV[4]\ : NOR2B
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => n_sigout3lto6_1);
    
    \FILT_OUT_maj[3]\ : MAJ3
      port map(A => \FILT_OUT_2[3]\, B => \FILT_OUT_tmr2_2[3]\, C
         => \FILT_OUT_tmr3_2[3]\, Y => \FILT_OUT[3]_net_1\);
    
    \FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_2[3]\);
    
    un2_n_filt_out_ADD_4x4_slow_I1_S : XOR3
      port map(A => I0_un1_CO1, B => \SUM_IN_A[5]_net_1\, C => 
        N_23_i, Y => ADD_4x4_slow_I1_S_0);
    
    un2_n_filt_out_ADD_4x4_slow_I1_CO1 : MAJ3
      port map(A => I0_un1_CO1, B => N_23_i, C => 
        \SUM_IN_A[5]_net_1\, Y => N70);
    
    \FILT_OUT_maj_RNINUEV[3]\ : NOR2B
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[6]_net_1\, 
        Y => n_sigout3lto6_0);
    
    \FILT_OUT_maj[6]\ : MAJ3
      port map(A => \FILT_OUT_2[6]\, B => \FILT_OUT_tmr2_2[6]\, C
         => \FILT_OUT_tmr3_2[6]\, Y => \FILT_OUT[6]_net_1\);
    
    \SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \SUM_IN_A_2[4]\, B => \SUM_IN_A_tmr2_2[4]\, C
         => \SUM_IN_A_tmr3_2[4]\, Y => \SUM_IN_A[4]_net_1\);
    
    \FILT_OUT[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_2[1]\);
    
    SIGOUT_maj_RNIB5HG7 : MX2
      port map(A => n_sigout3, B => channel_involtage_ok(2), S
         => N_93, Y => \SIGOUT_maj_RNIB5HG7\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    un2_n_filt_out_m15 : OR3A
      port map(A => m15_0, B => channel_involtage_ok(4), C => 
        channel_involtage_ok(3), Y => N_152_mux);
    
    \FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2_2[5]\);
    
    \SUM_IN_A[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIC62E_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_2[5]\);
    
    \FILT_OUT[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_2[2]\);
    
    SIG_IN_DEL : DFN1C0
      port map(D => IN_INVOLTAGE_OK_c_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIG_IN_DEL_2);
    
    \FILT_OUT[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_2[7]\);
    
    \FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_2[2]\);
    
    \un2_n_filt_out_OUT_CHANNEL_MREG_1[4]\ : OA1A
      port map(A => J11_DEBUG_c_c_0, B => ch_out1_0, C => 
        channel_involtage_ok(2), Y => OUT_CHANNEL_MREG_c_0);
    
    un2_n_filt_out_ADD_4x4_slow_I3_Y : AO13
      port map(A => N70, B => \FILT_OUT[7]_net_1\, C => i12_mux, 
        Y => ADD_4x4_slow_I3_Y_0);
    
    \FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2_2[4]\);
    
    un1_tmp_sum_in_b_0_m13 : AO18
      port map(A => \FILT_OUT[4]_net_1\, B => i6_mux, C => 
        \FILT_OUT[5]_net_1\, Y => i8_mux);
    
    \FILT_OUT[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_2[0]\);
    
    \THRESH_VAL_maj_RNIE6DG2_0[1]\ : AOI1B
      port map(A => n_sigout15lto7_2, B => n_sigout15lto7_1, C
         => \THRESH_VAL[1]_net_1\, Y => N_95);
    
    SIG_IN_DEL_tmr2 : DFN1C0
      port map(D => IN_INVOLTAGE_OK_c_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIG_IN_DEL_tmr2_2);
    
    SIGOUT_maj : MAJ3
      port map(A => SIGOUT_2, B => SIGOUT_tmr2_2, C => 
        SIGOUT_tmr3_2, Y => channel_involtage_ok(2));
    
    \THRESH_VAL_maj_RNISCQ05[1]\ : OA1B
      port map(A => n_sigout3, B => \THRESH_VAL[1]_net_1\, C => 
        N_113, Y => \THRESH_VAL_maj_RNISCQ05[1]_net_1\);
    
    un1_tmp_sum_in_b_0_m4 : OAI1
      port map(A => \FILT_OUT[2]_net_1\, B => \FILT_OUT[0]_net_1\, 
        C => \FILT_OUT[1]_net_1\, Y => i2_mux);
    
    \FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_2[1]\);
    
    \FILT_OUT[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_2[3]\);
    
    \THRESH_VAL[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNISCQ05[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \THRESH_VAL_2[1]\);
    
    un1_tmp_sum_in_b_0_m16 : AO18
      port map(A => \FILT_OUT[5]_net_1\, B => i8_mux, C => 
        \FILT_OUT[6]_net_1\, Y => i10_mux);
    
    \FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2_2[6]\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_tmp_sum_in_b_0_m26 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[5]_net_1\, 
        C => i6_mux, Y => N_27_i);
    
    un1_tmp_sum_in_b_0_m19 : AO18
      port map(A => \FILT_OUT[6]_net_1\, B => i10_mux, C => 
        \FILT_OUT[7]_net_1\, Y => i12_mux);
    
    \THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNISCQ05[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \THRESH_VAL_tmr3_2[1]\);
    
    un1_tmp_sum_in_b_0_m30 : XNOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[2]_net_1\, 
        C => i2_mux, Y => N_31_i);
    
    \SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIC62E\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr2_2[4]\);
    
    \FILT_OUT_maj[7]\ : MAJ3
      port map(A => \FILT_OUT_2[7]\, B => \FILT_OUT_tmr2_2[7]\, C
         => \FILT_OUT_tmr3_2[7]\, Y => \FILT_OUT[7]_net_1\);
    
    un1_tmp_sum_in_b_0_m15 : XOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => N_40);
    
    \THRESH_VAL_maj_RNIRBQ05_0[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_95, Y => N_93);
    
    \FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3_2[6]\);
    
    \SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIC62E\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr3_2[4]\);
    
    un1_tmp_sum_in_b_0_m7 : AO18
      port map(A => \FILT_OUT[2]_net_1\, B => i2_mux, C => 
        \FILT_OUT[3]_net_1\, Y => i4_mux);
    
    un1_tmp_sum_in_b_0_m28 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[3]_net_1\, 
        C => i4_mux, Y => N_29_i);
    
    SIG_IN_DEL_tmr3 : DFN1C0
      port map(D => IN_INVOLTAGE_OK_c_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIG_IN_DEL_tmr3_2);
    
    SIGOUT : DFN1C0
      port map(D => \SIGOUT_maj_RNIB5HG7\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIGOUT_2);
    
    \FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3_2[7]\);
    
    \FILT_OUT_maj[5]\ : MAJ3
      port map(A => \FILT_OUT_2[5]\, B => \FILT_OUT_tmr2_2[5]\, C
         => \FILT_OUT_tmr3_2[5]\, Y => \FILT_OUT[5]_net_1\);
    
    \FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_2[3]\);
    
    \THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \THRESH_VAL_2[1]\, B => 
        \THRESH_VAL_tmr2_2[1]\, C => \THRESH_VAL_tmr3_2[1]\, Y
         => \THRESH_VAL[1]_net_1\);
    
    \FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_2[2]\);
    
    \FILT_OUT_maj[1]\ : MAJ3
      port map(A => \FILT_OUT_2[1]\, B => \FILT_OUT_tmr2_2[1]\, C
         => \FILT_OUT_tmr3_2[1]\, Y => \FILT_OUT[1]_net_1\);
    
    \FILT_OUT_maj[0]\ : MAJ3
      port map(A => \FILT_OUT_2[0]\, B => \FILT_OUT_tmr2_2[0]\, C
         => \FILT_OUT_tmr3_2[0]\, Y => \FILT_OUT[0]_net_1\);
    
    un1_tmp_sum_in_b_0_m32 : AX1
      port map(A => \FILT_OUT[0]_net_1\, B => \FILT_OUT[1]_net_1\, 
        C => \FILT_OUT[2]_net_1\, Y => N_33_i);
    
    un2_n_filt_out_m15_0 : NOR2
      port map(A => channel_involtage_ok(2), B => 
        channel_involtage_ok(1), Y => m15_0);
    
    \SUM_IN_A_maj[5]\ : MAJ3
      port map(A => \SUM_IN_A_2[5]\, B => \SUM_IN_A_tmr2_2[5]\, C
         => \SUM_IN_A_tmr3_2[5]\, Y => \SUM_IN_A[5]_net_1\);
    
    un2_n_filt_out_ADD_4x4_slow_I2_S : XNOR3
      port map(A => \FILT_OUT[7]_net_1\, B => i12_mux, C => N70, 
        Y => ADD_4x4_slow_I2_S_0);
    
    \SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIC62E_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr3_2[5]\);
    
    \THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_tmr2_2[0]\);
    
    \THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \THRESH_VAL_2[0]\, B => 
        \THRESH_VAL_tmr2_2[0]\, C => \THRESH_VAL_tmr3_2[0]\, Y
         => \THRESH_VAL[0]_net_1\);
    
    \FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_2[1]\);
    
    \FILT_OUT_maj_RNIOVEV[4]\ : NOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout15lto7_1);
    
    \FILT_OUT[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_2[5]\);
    
    un1_tmp_sum_in_b_0_m10 : AO18
      port map(A => \FILT_OUT[3]_net_1\, B => i4_mux, C => 
        \FILT_OUT[4]_net_1\, Y => i6_mux);
    
    \FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_2[0]\);
    
    \FILT_OUT_maj[2]\ : MAJ3
      port map(A => \FILT_OUT_2[2]\, B => \FILT_OUT_tmr2_2[2]\, C
         => \FILT_OUT_tmr3_2[2]\, Y => \FILT_OUT[2]_net_1\);
    
    SIG_IN_DEL_maj_RNIC62E : XOR2
      port map(A => IN_INVOLTAGE_OK_c_0, B => \SIG_IN_DEL\, Y => 
        \SIG_IN_DEL_maj_RNIC62E\);
    
    un2_n_filt_out_ADD_4x4_slow_I0_S : XNOR3
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => ADD_4x4_slow_I0_S_0);
    
    \FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3_2[4]\);
    
    \FILT_OUT_maj_RNICFLE2[7]\ : AO1
      port map(A => n_sigout3lto6_1, B => n_sigout3lto6_0, C => 
        \FILT_OUT[7]_net_1\, Y => n_sigout3);
    
    SIG_IN_DEL_maj : MAJ3
      port map(A => SIG_IN_DEL_2, B => SIG_IN_DEL_tmr2_2, C => 
        SIG_IN_DEL_tmr3_2, Y => \SIG_IN_DEL\);
    
    \FILT_OUT_maj[4]\ : MAJ3
      port map(A => \FILT_OUT_2[4]\, B => \FILT_OUT_tmr2_2[4]\, C
         => \FILT_OUT_tmr3_2[4]\, Y => \FILT_OUT[4]_net_1\);
    
    \SUM_IN_A[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIC62E\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_2[4]\);
    
    \FILT_OUT_maj_RNIKF6F1[3]\ : NOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => \FILT_OUT[5]_net_1\, Y => n_sigout15lto7_2);
    
    \FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3_2[5]\);
    
    \FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_2[0]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity main_sequencer_new_3_2 is

    port( ch_iaux_en_0            : out   std_logic;
          channels_desired_on     : in    std_logic_vector(8 downto 7);
          ch_out1                 : out   std_logic_vector(2 downto 1);
          ch_mreg_en_0            : out   std_logic;
          OUT_CHANNEL_VOSG_c      : out   std_logic_vector(8 downto 7);
          SW4_SLAVE_PAIRS_BAR_c_0 : in    std_logic;
          channels_ready          : in    std_logic_vector(8 downto 7);
          master_rst_b            : in    std_logic;
          clk_5m_gl               : in    std_logic;
          N_73                    : in    std_logic;
          dtycyc_en               : in    std_logic;
          N_68                    : in    std_logic
        );

end main_sequencer_new_3_2;

architecture DEF_ARCH of main_sequencer_new_3_2 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component OR3
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

  component NOR3
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

  component NOR3B
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

  component NOR3C
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

  component NOR3A
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

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component MX2C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
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

  component OA1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component XA1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_276_0, \sequencer_state1[0]_net_1\, N_380_0, 
        \sequencer_state0[0]_net_1\, 
        \sequencer_state0_ns_a2_0[4]\, \ret_state0[1]_net_1\, 
        \ret_state0[2]_net_1\, \sequencer_state1_ns_a2_0[4]\, 
        \ret_state1[1]_net_1\, \ret_state1[2]_net_1\, 
        \sequencer_state0_ns_a2_0[3]\, 
        \sequencer_state1_ns_a2_0[3]\, 
        \sequencer_state0_ns_i_0[2]\, 
        \sequencer_state0_ns_i_a2_0_0[2]\, N_374, N_359, 
        \sequencer_state1_ns_i_1[2]\, N_255, N_254, 
        \sequencer_state0_ns_a2_0_1[5]\, \ret_state0[0]_net_1\, 
        N_375, \ret_state0[5]_net_1\, 
        \sequencer_state1_ns_a2_0_1[5]\, \ret_state1[0]_net_1\, 
        N_271, \ret_state1[5]_net_1\, \sequencer_state1_ns_0[1]\, 
        \sequencer_state1[3]_net_1\, N_243, 
        \sequencer_state0_ns_0[1]\, \sequencer_state0[3]_net_1\, 
        N_347, \sequencer_state1_ns_a2_0[1]\, un6_del_cntr1, 
        N_266, \sequencer_state1[4]_net_1\, 
        \sequencer_state1_ns_a2_0[0]\, 
        \sequencer_state0_ns_a2_0[1]\, 
        \sequencer_state0[4]_net_1\, N_340, 
        \sequencer_state1_ns_a2_0_1[0]\, 
        \sequencer_state0_ns_a2_0_1[0]\, 
        \sequencer_state1_ns_a2_2_0[0]\, \ret_state1[4]_net_1\, 
        \ret_state1[3]_net_1\, \sequencer_state0_ns_a2_2_0[0]\, 
        N_371, un6_del_cntr1_11, un6_del_cntr1_2, un6_del_cntr1_1, 
        un6_del_cntr1_7, un6_del_cntr1_10, un6_del_cntr1_6, 
        \del_cntr1[10]_net_1\, \del_cntr1[9]_net_1\, 
        un6_del_cntr1_9, un6_del_cntr1_4, \del_cntr1[6]_net_1\, 
        \del_cntr1[5]_net_1\, \del_cntr1[1]_net_1\, 
        \del_cntr1[14]_net_1\, \del_cntr1[13]_net_1\, 
        \del_cntr1[11]_net_1\, \del_cntr1[12]_net_1\, 
        \del_cntr1[7]_net_1\, \del_cntr1[8]_net_1\, 
        \del_cntr1[3]_net_1\, \del_cntr1[4]_net_1\, 
        \del_cntr1[2]_net_1\, \del_cntr1[0]_net_1\, 
        un5_del_cntr0_11, un5_del_cntr0_2, un5_del_cntr0_1, 
        un5_del_cntr0_7, un5_del_cntr0_10, un5_del_cntr0_6, 
        \del_cntr0[10]_net_1\, \del_cntr0[9]_net_1\, 
        un5_del_cntr0_9, un5_del_cntr0_4, \del_cntr0[6]_net_1\, 
        \del_cntr0[5]_net_1\, \del_cntr0[1]_net_1\, 
        \del_cntr0[14]_net_1\, \del_cntr0[13]_net_1\, 
        \del_cntr0[11]_net_1\, \del_cntr0[12]_net_1\, 
        \del_cntr0[7]_net_1\, \del_cntr0[8]_net_1\, 
        \del_cntr0[3]_net_1\, \del_cntr0[4]_net_1\, 
        \del_cntr0[2]_net_1\, \del_cntr0[0]_net_1\, 
        \sequencer_state0_ns_a2_0_0[1]\, \ret_state0[4]_net_1\, 
        \ret_state0[3]_net_1\, \sequencer_state1_ns_a2_0_0[1]\, 
        N_358_1, \sequencer_state0_ns[4]\, N_378, 
        \sequencer_state0_ns[3]\, 
        \sequencer_state0_maj_RNIVDU01[1]_net_1\, 
        \sequencer_state0[1]_net_1\, N_367, N_354, 
        \sequencer_state0_ns[1]\, 
        \sequencer_state0_maj_RNIUCU01[2]_net_1\, 
        \sequencer_state0[2]_net_1\, N_368, 
        \sequencer_state1_ns[1]\, 
        \sequencer_state1_maj_RNI3AJF1[1]_net_1\, 
        \sequencer_state1[1]_net_1\, N_263, 
        \sequencer_state1_maj_RNI29JF1[2]_net_1\, 
        \sequencer_state1[2]_net_1\, N_264, N_251, N_254_1, 
        N_239_i, N_270, N_238_i, \sequencer_state1_ns[3]\, N_274, 
        \sequencer_state1_ns[4]\, 
        \sequencer_state1_maj_RNINTVQE[5]_net_1\, N_245, 
        \sequencer_state1[5]_net_1\, N_342_i, N_370, 
        \sequencer_state0_maj_RNIGIB9C[5]_net_1\, N_357, N_377, 
        un5_del_cntr0, \ch_out1[0]_net_1\, \n_del_cntr0[0]\, 
        N_379, N_364, \DWACT_ADD_CI_0_partial_sum[0]\, 
        \n_del_cntr0[1]\, I_56_6, \n_del_cntr0[2]\, I_52_6, 
        \n_del_cntr0[3]\, I_51_6, \n_del_cntr0[4]\, I_53_6, 
        \n_del_cntr0[5]\, I_62_6, \n_del_cntr0[6]\, I_49_6, 
        \n_del_cntr0[7]\, I_59_6, \n_del_cntr0[8]\, I_57_6, 
        \n_del_cntr0[9]\, I_55_6, \n_del_cntr0[10]\, I_54_6, 
        \n_del_cntr0[11]\, I_48_6, \n_del_cntr0[12]\, I_50_6, 
        \n_del_cntr0[13]\, I_60_6, \n_del_cntr0[14]\, I_58_6, 
        \ch_out0_maj_RNIV2042[0]_net_1\, \n_ch_out0[0]\, 
        \OUT_CHANNEL_VOSG_c[7]\, \ch_out0_maj_RNIMIUQ[2]_net_1\, 
        N_353, \ch_mreg_en[7]\, \ch_out1_maj_RNI51LI2[0]_net_1\, 
        \n_ch_out1[0]\, \ch_out1_maj_RNI2QBK1[1]_net_1\, N_265, 
        \ch_out1[1]_net_1\, \ch_out1_maj_RNIQEJ91[2]_net_1\, 
        N_249, \ch_out1[2]_net_1\, \sequencer_state0[5]_net_1\, 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, 
        \sequencer_state0_ns[0]\, un2_n_ch_out1, N_258, 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, 
        \sequencer_state1_ns[0]\, \sequencer_state1_ns[5]\, 
        \ret_state1_maj_RNIAHJF1[5]_net_1\, N_275, 
        \ret_state1_maj_RNI9GJF1[4]_net_1\, 
        \ret_state1_maj_RNI8FJF1[3]_net_1\, 
        \sequencer_state1_maj_RNI4BJF1[3]_net_1\, un5_n_ch_out0, 
        \sequencer_state0_maj_RNI0FU01[3]_net_1\, 
        \ret_state0_maj_RNI4JU01[3]_net_1\, 
        \ret_state0_maj_RNI5KU01[4]_net_1\, 
        \ret_state0_maj_RNI6LU01[5]_net_1\, N_369, 
        \ch_out0_maj_RNITM121[1]_net_1\, \ch_iaux_en[7]\, N_260, 
        \sequencer_state0_ns[5]\, N_362, \n_del_cntr1[14]\, 
        I_58_5, \n_del_cntr1[13]\, I_60_5, \n_del_cntr1[12]\, 
        I_50_5, \n_del_cntr1[11]\, I_48_5, \n_del_cntr1[10]\, 
        I_54_5, \n_del_cntr1[9]\, I_55_5, \n_del_cntr1[8]\, 
        I_57_5, \n_del_cntr1[7]\, I_59_5, \n_del_cntr1[6]\, 
        I_49_5, \n_del_cntr1[5]\, I_62_5, \n_del_cntr1[4]\, 
        I_53_5, \n_del_cntr1[3]\, I_51_5, \n_del_cntr1[2]\, 
        I_52_5, \n_del_cntr1[1]\, I_56_5, \n_del_cntr1[0]\, 
        \DWACT_ADD_CI_0_partial_sum_0[0]\, \ret_state0_0[0]\, 
        \ret_state0_tmr2[0]_net_1\, \ret_state0_tmr3[0]_net_1\, 
        \ret_state0_0[1]\, \ret_state0_tmr2[1]_net_1\, 
        \ret_state0_tmr3[1]_net_1\, \ret_state0_0[2]\, 
        \ret_state0_tmr2[2]_net_1\, \ret_state0_tmr3[2]_net_1\, 
        \ret_state0_0[3]\, \ret_state0_tmr2[3]_net_1\, 
        \ret_state0_tmr3[3]_net_1\, \ret_state0_0[4]\, 
        \ret_state0_tmr2[4]_net_1\, \ret_state0_tmr3[4]_net_1\, 
        \ret_state0_0[5]\, \ret_state0_tmr2[5]_net_1\, 
        \ret_state0_tmr3[5]_net_1\, \ret_state1_0[0]\, 
        \ret_state1_tmr2[0]_net_1\, \ret_state1_tmr3[0]_net_1\, 
        \ret_state1_0[1]\, \ret_state1_tmr2[1]_net_1\, 
        \ret_state1_tmr3[1]_net_1\, \ret_state1_0[2]\, 
        \ret_state1_tmr2[2]_net_1\, \ret_state1_tmr3[2]_net_1\, 
        \ret_state1_0[3]\, \ret_state1_tmr2[3]_net_1\, 
        \ret_state1_tmr3[3]_net_1\, \ret_state1_0[4]\, 
        \ret_state1_tmr2[4]_net_1\, \ret_state1_tmr3[4]_net_1\, 
        \ret_state1_0[5]\, \ret_state1_tmr2[5]_net_1\, 
        \ret_state1_tmr3[5]_net_1\, \ch_out0[2]_net_1\, 
        \ch_out0_tmr2[2]_net_1\, \ch_out0_tmr3[2]_net_1\, 
        \ch_out0[1]_net_1\, \ch_out0_tmr2[1]_net_1\, 
        \ch_out0_tmr3[1]_net_1\, \ch_out0[0]_net_1\, 
        \ch_out0_tmr2[0]_net_1\, \ch_out0_tmr3[0]_net_1\, 
        \ch_out1_0[2]\, \ch_out1_tmr2[2]_net_1\, 
        \ch_out1_tmr3[2]_net_1\, \ch_out1_0[1]\, 
        \ch_out1_tmr2[1]_net_1\, \ch_out1_tmr3[1]_net_1\, 
        \ch_out1_0[0]\, \ch_out1_tmr2[0]_net_1\, 
        \ch_out1_tmr3[0]_net_1\, \sequencer_state0_0[0]\, 
        \sequencer_state0_tmr2[0]_net_1\, 
        \sequencer_state0_tmr3[0]_net_1\, \sequencer_state0_0[1]\, 
        \sequencer_state0_tmr2[1]_net_1\, 
        \sequencer_state0_tmr3[1]_net_1\, \sequencer_state0_0[2]\, 
        \sequencer_state0_tmr2[2]_net_1\, 
        \sequencer_state0_tmr3[2]_net_1\, \sequencer_state0_0[3]\, 
        \sequencer_state0_tmr2[3]_net_1\, 
        \sequencer_state0_tmr3[3]_net_1\, \sequencer_state0_0[4]\, 
        \sequencer_state0_tmr2[4]_net_1\, 
        \sequencer_state0_tmr3[4]_net_1\, \sequencer_state0_0[5]\, 
        \sequencer_state0_tmr2[5]_net_1\, 
        \sequencer_state0_tmr3[5]_net_1\, \sequencer_state1_0[0]\, 
        \sequencer_state1_tmr2[0]_net_1\, 
        \sequencer_state1_tmr3[0]_net_1\, \sequencer_state1_0[1]\, 
        \sequencer_state1_tmr2[1]_net_1\, 
        \sequencer_state1_tmr3[1]_net_1\, \sequencer_state1_0[2]\, 
        \sequencer_state1_tmr2[2]_net_1\, 
        \sequencer_state1_tmr3[2]_net_1\, \sequencer_state1_0[3]\, 
        \sequencer_state1_tmr2[3]_net_1\, 
        \sequencer_state1_tmr3[3]_net_1\, \sequencer_state1_0[4]\, 
        \sequencer_state1_tmr2[4]_net_1\, 
        \sequencer_state1_tmr3[4]_net_1\, \sequencer_state1_0[5]\, 
        \sequencer_state1_tmr2[5]_net_1\, 
        \sequencer_state1_tmr3[5]_net_1\, \del_cntr1_0[14]\, 
        \del_cntr1_tmr2[14]_net_1\, \del_cntr1_tmr3[14]_net_1\, 
        \del_cntr0_0[14]\, \del_cntr0_tmr2[14]_net_1\, 
        \del_cntr0_tmr3[14]_net_1\, \del_cntr1_0[13]\, 
        \del_cntr1_tmr2[13]_net_1\, \del_cntr1_tmr3[13]_net_1\, 
        \del_cntr0_0[13]\, \del_cntr0_tmr2[13]_net_1\, 
        \del_cntr0_tmr3[13]_net_1\, \del_cntr1_0[12]\, 
        \del_cntr1_tmr2[12]_net_1\, \del_cntr1_tmr3[12]_net_1\, 
        \del_cntr0_0[12]\, \del_cntr0_tmr2[12]_net_1\, 
        \del_cntr0_tmr3[12]_net_1\, \del_cntr1_0[11]\, 
        \del_cntr1_tmr2[11]_net_1\, \del_cntr1_tmr3[11]_net_1\, 
        \del_cntr0_0[11]\, \del_cntr0_tmr2[11]_net_1\, 
        \del_cntr0_tmr3[11]_net_1\, \del_cntr1_0[10]\, 
        \del_cntr1_tmr2[10]_net_1\, \del_cntr1_tmr3[10]_net_1\, 
        \del_cntr0_0[10]\, \del_cntr0_tmr2[10]_net_1\, 
        \del_cntr0_tmr3[10]_net_1\, \del_cntr1_0[9]\, 
        \del_cntr1_tmr2[9]_net_1\, \del_cntr1_tmr3[9]_net_1\, 
        \del_cntr0_0[9]\, \del_cntr0_tmr2[9]_net_1\, 
        \del_cntr0_tmr3[9]_net_1\, \del_cntr1_0[8]\, 
        \del_cntr1_tmr2[8]_net_1\, \del_cntr1_tmr3[8]_net_1\, 
        \del_cntr0_0[8]\, \del_cntr0_tmr2[8]_net_1\, 
        \del_cntr0_tmr3[8]_net_1\, \del_cntr1_0[7]\, 
        \del_cntr1_tmr2[7]_net_1\, \del_cntr1_tmr3[7]_net_1\, 
        \del_cntr0_0[7]\, \del_cntr0_tmr2[7]_net_1\, 
        \del_cntr0_tmr3[7]_net_1\, \del_cntr1_0[6]\, 
        \del_cntr1_tmr2[6]_net_1\, \del_cntr1_tmr3[6]_net_1\, 
        \del_cntr0_0[6]\, \del_cntr0_tmr2[6]_net_1\, 
        \del_cntr0_tmr3[6]_net_1\, \del_cntr1_0[5]\, 
        \del_cntr1_tmr2[5]_net_1\, \del_cntr1_tmr3[5]_net_1\, 
        \del_cntr0_0[5]\, \del_cntr0_tmr2[5]_net_1\, 
        \del_cntr0_tmr3[5]_net_1\, \del_cntr1_0[4]\, 
        \del_cntr1_tmr2[4]_net_1\, \del_cntr1_tmr3[4]_net_1\, 
        \del_cntr0_0[4]\, \del_cntr0_tmr2[4]_net_1\, 
        \del_cntr0_tmr3[4]_net_1\, \del_cntr1_0[3]\, 
        \del_cntr1_tmr2[3]_net_1\, \del_cntr1_tmr3[3]_net_1\, 
        \del_cntr0_0[3]\, \del_cntr0_tmr2[3]_net_1\, 
        \del_cntr0_tmr3[3]_net_1\, \del_cntr1_0[2]\, 
        \del_cntr1_tmr2[2]_net_1\, \del_cntr1_tmr3[2]_net_1\, 
        \del_cntr0_0[2]\, \del_cntr0_tmr2[2]_net_1\, 
        \del_cntr0_tmr3[2]_net_1\, \del_cntr1_0[1]\, 
        \del_cntr1_tmr2[1]_net_1\, \del_cntr1_tmr3[1]_net_1\, 
        \del_cntr0_0[1]\, \del_cntr0_tmr2[1]_net_1\, 
        \del_cntr0_tmr3[1]_net_1\, \del_cntr1_0[0]\, 
        \del_cntr1_tmr2[0]_net_1\, \del_cntr1_tmr3[0]_net_1\, 
        \del_cntr0_0[0]\, \del_cntr0_tmr2[0]_net_1\, 
        \del_cntr0_tmr3[0]_net_1\, 
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
        \DWACT_ADD_CI_0_partial_sum[11]\, 
        \DWACT_ADD_CI_0_pog_array_1_5_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_11_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_12_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_4_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_9_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_10_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_3_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_7_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_8_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_2_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_2_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_2_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_5_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_6_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_2_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_3_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_2_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_5_0[0]\, 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, 
        \DWACT_ADD_CI_0_g_array_2_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_5_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_11_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_6_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_13_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_7_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\, 
        \DWACT_ADD_CI_0_g_array_11_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_11_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_5_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_0[0]\, 
        \DWACT_ADD_CI_0_TMP_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_9_0[0]\, 
        \DWACT_ADD_CI_0_partial_sum_0[5]\, 
        \DWACT_ADD_CI_0_partial_sum_0[13]\, 
        \DWACT_ADD_CI_0_partial_sum_0[7]\, 
        \DWACT_ADD_CI_0_partial_sum_0[14]\, 
        \DWACT_ADD_CI_0_partial_sum_0[8]\, 
        \DWACT_ADD_CI_0_partial_sum_0[1]\, 
        \DWACT_ADD_CI_0_partial_sum_0[9]\, 
        \DWACT_ADD_CI_0_partial_sum_0[10]\, 
        \DWACT_ADD_CI_0_partial_sum_0[4]\, 
        \DWACT_ADD_CI_0_partial_sum_0[2]\, 
        \DWACT_ADD_CI_0_partial_sum_0[3]\, 
        \DWACT_ADD_CI_0_partial_sum_0[12]\, 
        \DWACT_ADD_CI_0_partial_sum_0[6]\, 
        \DWACT_ADD_CI_0_partial_sum_0[11]\, \GND\, \VCC\
         : std_logic;

begin 

    ch_iaux_en_0 <= \ch_iaux_en[7]\;
    ch_out1(2) <= \ch_out1[2]_net_1\;
    ch_out1(1) <= \ch_out1[1]_net_1\;
    ch_mreg_en_0 <= \ch_mreg_en[7]\;
    OUT_CHANNEL_VOSG_c(7) <= \OUT_CHANNEL_VOSG_c[7]\;

    \sequencer_state1[2]\ : DFN1C0
      port map(D => \sequencer_state1_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_0[2]\);
    
    \ret_state0_maj_RNIPK9A6[3]\ : OR2A
      port map(A => un5_del_cntr0, B => N_370, Y => N_340);
    
    \del_cntr1_tmr3[0]\ : DFN1P0
      port map(D => \n_del_cntr1[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[0]_net_1\);
    
    \del_cntr0[14]\ : DFN1P0
      port map(D => \n_del_cntr0[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[14]\);
    
    \del_cntr1_maj[14]\ : MAJ3
      port map(A => \del_cntr1_0[14]\, B => 
        \del_cntr1_tmr2[14]_net_1\, C => 
        \del_cntr1_tmr3[14]_net_1\, Y => \del_cntr1[14]_net_1\);
    
    un1_del_cntr1_I_88 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2[0]\);
    
    \del_cntr1_maj_RNIJK78[11]\ : NOR2
      port map(A => \del_cntr1[11]_net_1\, B => 
        \del_cntr1[12]_net_1\, Y => un6_del_cntr1_6);
    
    \del_cntr0_tmr2[14]\ : DFN1P0
      port map(D => \n_del_cntr0[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[14]_net_1\);
    
    \del_cntr0[4]\ : DFN1P0
      port map(D => \n_del_cntr0[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[4]\);
    
    \sequencer_state1_maj_RNIHT2EC1[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_48_5, Y => 
        \n_del_cntr1[11]\);
    
    \sequencer_state0_maj_RNIGA6E[0]\ : NOR2
      port map(A => \sequencer_state0[0]_net_1\, B => 
        \sequencer_state0[4]_net_1\, Y => N_379);
    
    \del_cntr1_tmr3[3]\ : DFN1P0
      port map(D => \n_del_cntr1[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[3]_net_1\);
    
    \del_cntr0[9]\ : DFN1P0
      port map(D => \n_del_cntr0[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[9]\);
    
    \sequencer_state0_maj_RNID1OI[1]\ : NOR2
      port map(A => \sequencer_state0[1]_net_1\, B => 
        \ret_state0[0]_net_1\, Y => N_368);
    
    \ret_state1_tmr3[5]\ : DFN1P0
      port map(D => \ret_state1_maj_RNIAHJF1[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state1_tmr3[5]_net_1\);
    
    un1_del_cntr0_I_21 : XOR2
      port map(A => \del_cntr0[13]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_12_0[0]\);
    
    \sequencer_state1_maj_RNI3AJF1[1]\ : NOR3
      port map(A => \sequencer_state1[3]_net_1\, B => 
        \sequencer_state1[1]_net_1\, C => N_263, Y => 
        \sequencer_state1_maj_RNI3AJF1[1]_net_1\);
    
    \del_cntr0_tmr2[4]\ : DFN1P0
      port map(D => \n_del_cntr0[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[4]_net_1\);
    
    \del_cntr0_tmr2[11]\ : DFN1P0
      port map(D => \n_del_cntr0[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[11]_net_1\);
    
    \del_cntr0[5]\ : DFN1P0
      port map(D => \n_del_cntr0[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[5]\);
    
    \ret_state1_maj[0]\ : MAJ3
      port map(A => \ret_state1_0[0]\, B => 
        \ret_state1_tmr2[0]_net_1\, C => 
        \ret_state1_tmr3[0]_net_1\, Y => \ret_state1[0]_net_1\);
    
    \ch_out1[1]\ : DFN1C0
      port map(D => \ch_out1_maj_RNI2QBK1[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_0[1]\);
    
    \sequencer_state0_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state0_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state0_tmr2[2]_net_1\);
    
    \ch_out1_tmr2[1]\ : DFN1C0
      port map(D => \ch_out1_maj_RNI2QBK1[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ch_out1_tmr2[1]_net_1\);
    
    \sequencer_state1_maj_RNIS2539[3]\ : AO1A
      port map(A => channels_ready(8), B => 
        \sequencer_state1_ns_a2_0[0]\, C => N_251, Y => 
        \sequencer_state1_ns[0]\);
    
    \ret_state1_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI4BJF1[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2[2]_net_1\);
    
    \sequencer_state0_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state0_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state0_tmr3[2]_net_1\);
    
    un1_del_cntr0_I_10 : AND2
      port map(A => \del_cntr0[4]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\);
    
    \sequencer_state0_maj_RNIT8DU[4]\ : NOR2B
      port map(A => \sequencer_state0[4]_net_1\, B => N_371, Y
         => \sequencer_state0_ns_a2_2_0[0]\);
    
    un1_del_cntr0_I_47 : XOR2
      port map(A => \del_cntr0[5]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[5]\);
    
    \ret_state1_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI29JF1[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2[0]_net_1\);
    
    \ret_state1_maj_RNIHBKU_2[1]\ : NOR2
      port map(A => \ret_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => N_271);
    
    \ret_state1_maj_RNI1VC91[3]\ : NOR3
      port map(A => \ret_state1[4]_net_1\, B => 
        \ret_state1[3]_net_1\, C => \sequencer_state1[5]_net_1\, 
        Y => N_254_1);
    
    un1_del_cntr0_I_33 : XOR2
      port map(A => \del_cntr0[3]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[3]\);
    
    \sequencer_state0_maj_RNIC3ST[0]\ : NOR2B
      port map(A => \sequencer_state0[0]_net_1\, B => 
        channels_ready(7), Y => N_362);
    
    \ret_state0_maj_RNISD2Q4[1]\ : AO1
      port map(A => \sequencer_state0_ns_i_a2_0_0[2]\, B => N_374, 
        C => N_359, Y => \sequencer_state0_ns_i_0[2]\);
    
    \del_cntr0_maj[3]\ : MAJ3
      port map(A => \del_cntr0_0[3]\, B => 
        \del_cntr0_tmr2[3]_net_1\, C => \del_cntr0_tmr3[3]_net_1\, 
        Y => \del_cntr0[3]_net_1\);
    
    un1_del_cntr1_I_70 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    \ret_state0[3]\ : DFN1C0
      port map(D => \ret_state0_maj_RNI4JU01[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state0_0[3]\);
    
    \sequencer_state0_maj_RNIDIRE01[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_55_6, Y => 
        \n_del_cntr0[9]\);
    
    un1_del_cntr1_I_63 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_8[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\);
    
    un1_del_cntr0_I_38 : XOR2
      port map(A => \del_cntr0[2]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[2]\);
    
    \ret_state1_maj_RNI4P8T1_0[0]\ : NOR3B
      port map(A => \ret_state1[5]_net_1\, B => N_271, C => 
        \ret_state1[0]_net_1\, Y => 
        \sequencer_state1_ns_a2_0_1[0]\);
    
    un1_del_cntr1_I_39 : XOR2
      port map(A => \del_cntr1[13]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[13]\);
    
    \del_cntr1_maj[4]\ : MAJ3
      port map(A => \del_cntr1_0[4]\, B => 
        \del_cntr1_tmr2[4]_net_1\, C => \del_cntr1_tmr3[4]_net_1\, 
        Y => \del_cntr1[4]_net_1\);
    
    un1_del_cntr1_I_91 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\);
    
    \del_cntr1_maj[0]\ : MAJ3
      port map(A => \del_cntr1_0[0]\, B => 
        \del_cntr1_tmr2[0]_net_1\, C => \del_cntr1_tmr3[0]_net_1\, 
        Y => \del_cntr1[0]_net_1\);
    
    un1_del_cntr1_I_68 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\);
    
    un1_del_cntr1_I_80 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\);
    
    \del_cntr1_maj[10]\ : MAJ3
      port map(A => \del_cntr1_0[10]\, B => 
        \del_cntr1_tmr2[10]_net_1\, C => 
        \del_cntr1_tmr3[10]_net_1\, Y => \del_cntr1[10]_net_1\);
    
    \del_cntr0_tmr2[5]\ : DFN1P0
      port map(D => \n_del_cntr0[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[5]_net_1\);
    
    un1_del_cntr1_I_21 : XOR2
      port map(A => \del_cntr1[13]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\);
    
    \sequencer_state0_maj_RNIC3ST_1[0]\ : NOR2A
      port map(A => channels_ready(7), B => 
        \sequencer_state0[0]_net_1\, Y => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\);
    
    \del_cntr0_maj[4]\ : MAJ3
      port map(A => \del_cntr0_0[4]\, B => 
        \del_cntr0_tmr2[4]_net_1\, C => \del_cntr0_tmr3[4]_net_1\, 
        Y => \del_cntr0[4]_net_1\);
    
    \sequencer_state0_maj_RNI1CFT7_0[3]\ : AO1
      port map(A => \sequencer_state0_ns_a2_0_1[0]\, B => N_377, 
        C => N_354, Y => \sequencer_state0_ns[0]\);
    
    \del_cntr1_maj_RNIT5IM[7]\ : NOR2
      port map(A => \del_cntr1[7]_net_1\, B => 
        \del_cntr1[8]_net_1\, Y => un6_del_cntr1_4);
    
    un1_del_cntr0_I_86 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_0[0]\);
    
    \del_cntr1[14]\ : DFN1P0
      port map(D => \n_del_cntr1[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[14]\);
    
    \ret_state0_maj_RNI0TJE1[0]\ : NOR3B
      port map(A => \ret_state0[5]_net_1\, B => N_375, C => 
        \ret_state0[0]_net_1\, Y => 
        \sequencer_state0_ns_a2_0_1[0]\);
    
    \del_cntr1_maj[7]\ : MAJ3
      port map(A => \del_cntr1_0[7]\, B => 
        \del_cntr1_tmr2[7]_net_1\, C => \del_cntr1_tmr3[7]_net_1\, 
        Y => \del_cntr1[7]_net_1\);
    
    \ret_state1_maj_RNI1UR28_0[1]\ : NOR3C
      port map(A => N_270, B => N_274, C => 
        \sequencer_state1_ns_a2_0[3]\, Y => 
        \sequencer_state1_ns[3]\);
    
    \sequencer_state0[5]\ : DFN1P0
      port map(D => \sequencer_state0_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state0_0[5]\);
    
    \ret_state1_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI4BJF1[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3[2]_net_1\);
    
    \del_cntr0[11]\ : DFN1P0
      port map(D => \n_del_cntr0[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[11]\);
    
    un1_del_cntr0_I_56 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[1]\, B => 
        \DWACT_ADD_CI_0_TMP_0[0]\, Y => I_56_6);
    
    \del_cntr1[1]\ : DFN1P0
      port map(D => \n_del_cntr1[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[1]\);
    
    \ret_state1_maj_RNIHBKU_1[1]\ : NOR2A
      port map(A => \ret_state1[1]_net_1\, B => 
        \ret_state1[2]_net_1\, Y => \sequencer_state1_ns_a2_0[4]\);
    
    \ch_out1_tmr3[2]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIQEJ91[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ch_out1_tmr3[2]_net_1\);
    
    \del_cntr1_maj_RNILTHM[3]\ : NOR2
      port map(A => \del_cntr1[3]_net_1\, B => 
        \del_cntr1[4]_net_1\, Y => un6_del_cntr1_2);
    
    \ch_out0_tmr3[0]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIV2042[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ch_out0_tmr3[0]_net_1\);
    
    un1_del_cntr0_I_76 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_0[0]\);
    
    un1_del_cntr0_I_25 : XOR2
      port map(A => \del_cntr0[12]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_11_0[0]\);
    
    \ret_state1_tmr2[4]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI9GJF1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2[4]_net_1\);
    
    \sequencer_state1_maj_RNITAE361[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_55_5, Y => 
        \n_del_cntr1[9]\);
    
    \sequencer_state0_maj_RNIDH6L61[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_48_6, Y => 
        \n_del_cntr0[11]\);
    
    \ret_state0_maj_RNI0TJE1_0[0]\ : NOR3B
      port map(A => \ret_state0[0]_net_1\, B => N_375, C => 
        \ret_state0[5]_net_1\, Y => 
        \sequencer_state0_ns_a2_0_1[5]\);
    
    \ret_state0_tmr3[3]\ : DFN1C0
      port map(D => \ret_state0_maj_RNI4JU01[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3[3]_net_1\);
    
    \del_cntr1_tmr2[11]\ : DFN1P0
      port map(D => \n_del_cntr1[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[11]_net_1\);
    
    un1_del_cntr1_I_51 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[3]\, B => 
        \DWACT_ADD_CI_0_g_array_12[0]\, Y => I_51_5);
    
    un1_del_cntr1_I_16 : AND2
      port map(A => \del_cntr1[11]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\);
    
    un1_del_cntr0_I_30 : XOR2
      port map(A => \del_cntr0[1]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_0[0]\);
    
    \del_cntr1_tmr2[8]\ : DFN1P0
      port map(D => \n_del_cntr1[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[8]_net_1\);
    
    un1_del_cntr0_I_22 : XOR2
      port map(A => \del_cntr0[9]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_8_0[0]\);
    
    \del_cntr0_tmr2[12]\ : DFN1P0
      port map(D => \n_del_cntr0[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[12]_net_1\);
    
    un1_del_cntr1_I_60 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[13]\, B => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\, Y => I_60_5);
    
    un1_del_cntr1_I_46 : XOR2
      port map(A => \del_cntr1[6]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[6]\);
    
    \ret_state1_maj_RNI8FJF1[3]\ : OA1A
      port map(A => N_275, B => \sequencer_state1[5]_net_1\, C
         => \ret_state1[3]_net_1\, Y => 
        \ret_state1_maj_RNI8FJF1[3]_net_1\);
    
    un1_del_cntr0_I_65 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_5_0[0]\);
    
    \del_cntr0_tmr2[10]\ : DFN1P0
      port map(D => \n_del_cntr0[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[10]_net_1\);
    
    un1_del_cntr1_I_34 : XOR2
      port map(A => \del_cntr1[4]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[4]\);
    
    \del_cntr1_tmr2[0]\ : DFN1P0
      port map(D => \n_del_cntr1[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[0]_net_1\);
    
    \del_cntr1[2]\ : DFN1P0
      port map(D => \n_del_cntr1[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[2]\);
    
    \ch_out1[2]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIQEJ91[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_0[2]\);
    
    \sequencer_state1_maj_RNIF2SFI[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_53_5, Y => 
        \n_del_cntr1[4]\);
    
    \ret_state1_maj_RNI1UR28[1]\ : NOR3C
      port map(A => N_270, B => N_274, C => 
        \sequencer_state1_ns_a2_0[4]\, Y => 
        \sequencer_state1_ns[4]\);
    
    \ret_state0_tmr3[5]\ : DFN1P0
      port map(D => \ret_state0_maj_RNI6LU01[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state0_tmr3[5]_net_1\);
    
    un1_del_cntr0_I_62 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[5]\, B => 
        \DWACT_ADD_CI_0_g_array_12_1_0[0]\, Y => I_62_6);
    
    un1_del_cntr0_I_6 : AND2
      port map(A => \del_cntr0[3]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_3_0[0]\);
    
    \ret_state0[1]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIVDU01[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_0[1]\);
    
    \del_cntr1[8]\ : DFN1P0
      port map(D => \n_del_cntr1[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[8]\);
    
    \ret_state0[5]\ : DFN1P0
      port map(D => \ret_state0_maj_RNI6LU01[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => \ret_state0_0[5]\);
    
    \ret_state1_maj_RNI4P8T1[0]\ : NOR3B
      port map(A => \ret_state1[0]_net_1\, B => N_271, C => 
        \ret_state1[5]_net_1\, Y => 
        \sequencer_state1_ns_a2_0_1[5]\);
    
    un1_del_cntr0_I_87 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_6_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_2_0[0]\);
    
    \sequencer_state1_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state1_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state1_tmr3[0]_net_1\);
    
    \sequencer_state1_maj_RNI3Q3M8[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_56_5, Y => 
        \n_del_cntr1[1]\);
    
    \ret_state1_maj_RNI9GJF1[4]\ : OA1A
      port map(A => N_275, B => \sequencer_state1[5]_net_1\, C
         => \ret_state1[4]_net_1\, Y => 
        \ret_state1_maj_RNI9GJF1[4]_net_1\);
    
    \ret_state0_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNI0FU01[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2[2]_net_1\);
    
    \sequencer_state1_maj_RNIIOGL[0]\ : NOR2
      port map(A => \sequencer_state1[0]_net_1\, B => 
        \sequencer_state1[4]_net_1\, Y => N_275);
    
    \del_cntr0_maj[12]\ : MAJ3
      port map(A => \del_cntr0_0[12]\, B => 
        \del_cntr0_tmr2[12]_net_1\, C => 
        \del_cntr0_tmr3[12]_net_1\, Y => \del_cntr0[12]_net_1\);
    
    un1_del_cntr0_I_91 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_10_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_4_0[0]\);
    
    \del_cntr1_tmr2[6]\ : DFN1P0
      port map(D => \n_del_cntr1[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[6]_net_1\);
    
    un1_del_cntr1_I_25 : XOR2
      port map(A => \del_cntr1[12]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_11[0]\);
    
    \ret_state0_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIUCU01[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2[0]_net_1\);
    
    \del_cntr0_tmr3[2]\ : DFN1P0
      port map(D => \n_del_cntr0[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[2]_net_1\);
    
    un1_del_cntr1_I_92 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_5[0]\);
    
    un1_del_cntr1_I_9 : AND2
      port map(A => \del_cntr1[10]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\);
    
    \del_cntr1_tmr2[14]\ : DFN1P0
      port map(D => \n_del_cntr1[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[14]_net_1\);
    
    \del_cntr0[13]\ : DFN1P0
      port map(D => \n_del_cntr0[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[13]\);
    
    un1_del_cntr0_I_57 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[8]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, Y => I_57_6);
    
    \del_cntr0_maj_RNIEA7F[0]\ : NOR2
      port map(A => \del_cntr0[2]_net_1\, B => 
        \del_cntr0[0]_net_1\, Y => un5_del_cntr0_1);
    
    \ch_out0_tmr2[1]\ : DFN1C0
      port map(D => \ch_out0_maj_RNITM121[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ch_out0_tmr2[1]_net_1\);
    
    \del_cntr1[11]\ : DFN1P0
      port map(D => \n_del_cntr1[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[11]\);
    
    \sequencer_state1_maj_RNI4RG9L[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_62_5, Y => 
        \n_del_cntr1[5]\);
    
    \sequencer_state1[3]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNINTVQE[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state1_0[3]\);
    
    \ret_state1[5]\ : DFN1P0
      port map(D => \ret_state1_maj_RNIAHJF1[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => \ret_state1_0[5]\);
    
    \del_cntr1_maj_RNIRHKN[10]\ : NOR3A
      port map(A => un6_del_cntr1_6, B => \del_cntr1[10]_net_1\, 
        C => \del_cntr1[9]_net_1\, Y => un6_del_cntr1_10);
    
    \del_cntr0_tmr3[7]\ : DFN1P0
      port map(D => \n_del_cntr0[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[7]_net_1\);
    
    un1_del_cntr0_I_41 : XOR2
      port map(A => \del_cntr0[12]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[12]\);
    
    un1_del_cntr0_I_16 : AND2
      port map(A => \del_cntr0[11]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_11_0[0]\);
    
    un1_del_cntr1_I_22 : XOR2
      port map(A => \del_cntr1[9]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\);
    
    un1_del_cntr0_I_77 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_1_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\);
    
    \sequencer_state0_maj[4]\ : MAJ3
      port map(A => \sequencer_state0_0[4]\, B => 
        \sequencer_state0_tmr2[4]_net_1\, C => 
        \sequencer_state0_tmr3[4]_net_1\, Y => 
        \sequencer_state0[4]_net_1\);
    
    \del_cntr1_maj_RNIGOHM[0]\ : NOR2
      port map(A => \del_cntr1[2]_net_1\, B => 
        \del_cntr1[0]_net_1\, Y => un6_del_cntr1_1);
    
    \ret_state0_maj[2]\ : MAJ3
      port map(A => \ret_state0_0[2]\, B => 
        \ret_state0_tmr2[2]_net_1\, C => 
        \ret_state0_tmr3[2]_net_1\, Y => \ret_state0[2]_net_1\);
    
    \ret_state0_maj[0]\ : MAJ3
      port map(A => \ret_state0_0[0]\, B => 
        \ret_state0_tmr2[0]_net_1\, C => 
        \ret_state0_tmr3[0]_net_1\, Y => \ret_state0[0]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_del_cntr1_I_76 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11[0]\);
    
    \ret_state1_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI3AJF1[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3[1]_net_1\);
    
    un1_del_cntr1_I_17 : AND2
      port map(A => \del_cntr1[13]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\);
    
    \del_cntr1_maj[6]\ : MAJ3
      port map(A => \del_cntr1_0[6]\, B => 
        \del_cntr1_tmr2[6]_net_1\, C => \del_cntr1_tmr3[6]_net_1\, 
        Y => \del_cntr1[6]_net_1\);
    
    un1_del_cntr1_I_47 : XOR2
      port map(A => \del_cntr1[5]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[5]\);
    
    \ch_out0[1]\ : DFN1C0
      port map(D => \ch_out0_maj_RNITM121[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0[1]_net_1\);
    
    \del_cntr0_tmr3[5]\ : DFN1P0
      port map(D => \n_del_cntr0[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[5]_net_1\);
    
    \del_cntr0[1]\ : DFN1P0
      port map(D => \n_del_cntr0[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[1]\);
    
    un1_del_cntr0_I_29 : XOR2
      port map(A => \del_cntr0[4]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_3_0[0]\);
    
    \del_cntr1_maj[2]\ : MAJ3
      port map(A => \del_cntr1_0[2]\, B => 
        \del_cntr1_tmr2[2]_net_1\, C => \del_cntr1_tmr3[2]_net_1\, 
        Y => \del_cntr1[2]_net_1\);
    
    un1_del_cntr1_I_86 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1[0]\);
    
    un1_del_cntr1_I_33 : XOR2
      port map(A => \del_cntr1[3]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_partial_sum[3]\);
    
    \del_cntr0[7]\ : DFN1P0
      port map(D => \n_del_cntr0[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[7]\);
    
    \sequencer_state1_maj_RNICCNLK1[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_60_5, Y => 
        \n_del_cntr1[13]\);
    
    \del_cntr0_tmr3[1]\ : DFN1P0
      port map(D => \n_del_cntr0[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[1]_net_1\);
    
    \del_cntr0_tmr2[9]\ : DFN1P0
      port map(D => \n_del_cntr0[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[9]_net_1\);
    
    un1_del_cntr1_I_55 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[9]\, B => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\, Y => I_55_5);
    
    \sequencer_state1_tmr2[3]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNINTVQE[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state1_tmr2[3]_net_1\);
    
    \del_cntr1_tmr2[1]\ : DFN1P0
      port map(D => \n_del_cntr1[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[1]_net_1\);
    
    un1_del_cntr1_I_38 : XOR2
      port map(A => \del_cntr1[2]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[2]\);
    
    \ret_state0_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNI0FU01[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3[2]_net_1\);
    
    un1_del_cntr0_I_69 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_4_0[0]\);
    
    un1_del_cntr1_I_52 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[2]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, Y => I_52_5);
    
    un1_del_cntr1_I_5 : AND2
      port map(A => \del_cntr1[7]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\);
    
    \ret_state0_maj_RNIU61D2[0]\ : NOR3C
      port map(A => N_358_1, B => N_342_i, C => N_375, Y => N_359);
    
    \ret_state0_tmr2[4]\ : DFN1C0
      port map(D => \ret_state0_maj_RNI5KU01[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2[4]_net_1\);
    
    \del_cntr0_maj_RNIH4FM[11]\ : NOR2
      port map(A => \del_cntr0[11]_net_1\, B => 
        \del_cntr0[12]_net_1\, Y => un5_del_cntr0_6);
    
    \del_cntr0[10]\ : DFN1P0
      port map(D => \n_del_cntr0[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[10]\);
    
    \del_cntr1[7]\ : DFN1P0
      port map(D => \n_del_cntr1[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[7]\);
    
    \sequencer_state1_maj_RNIFVK9S[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_59_5, Y => 
        \n_del_cntr1[7]\);
    
    \ret_state0_maj_RNI9S587_0[1]\ : NOR3C
      port map(A => N_374, B => N_378, C => 
        \sequencer_state0_ns_a2_0[3]\, Y => 
        \sequencer_state0_ns[3]\);
    
    \del_cntr1[13]\ : DFN1P0
      port map(D => \n_del_cntr1[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[13]\);
    
    un1_del_cntr0_I_17 : AND2
      port map(A => \del_cntr0[13]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_13_0[0]\);
    
    \ch_out0_tmr3[2]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIMIUQ[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ch_out0_tmr3[2]_net_1\);
    
    \sequencer_state1_maj_RNIHH2Q[2]\ : NOR2
      port map(A => \sequencer_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => N_263);
    
    \sequencer_state1_tmr2[5]\ : DFN1P0
      port map(D => \sequencer_state1_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => 
        \sequencer_state1_tmr2[5]_net_1\);
    
    \del_cntr0_maj[9]\ : MAJ3
      port map(A => \del_cntr0_0[9]\, B => 
        \del_cntr0_tmr2[9]_net_1\, C => \del_cntr0_tmr3[9]_net_1\, 
        Y => \del_cntr0[9]_net_1\);
    
    \sequencer_state1_maj_RNIO1901[0]\ : NOR2
      port map(A => N_243, B => \sequencer_state1[0]_net_1\, Y
         => N_265);
    
    \sequencer_state1_maj_RNIFF2Q[1]\ : NOR2
      port map(A => \sequencer_state1[1]_net_1\, B => 
        \ret_state1[0]_net_1\, Y => N_264);
    
    \ret_state1_maj_RNIAHJF1[5]\ : OA1A
      port map(A => N_275, B => \sequencer_state1[5]_net_1\, C
         => \ret_state1[5]_net_1\, Y => 
        \ret_state1_maj_RNIAHJF1[5]_net_1\);
    
    un1_del_cntr1_I_29 : XOR2
      port map(A => \del_cntr1[4]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_3[0]\);
    
    un1_del_cntr0_I_36 : XOR2
      port map(A => \del_cntr0[1]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[1]\);
    
    \sequencer_state0_maj_RNI7KDR7[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_56_6, Y => 
        \n_del_cntr0[1]\);
    
    un1_del_cntr1_I_77 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2[0]\);
    
    \sequencer_state0_maj[3]\ : MAJ3
      port map(A => \sequencer_state0_0[3]\, B => 
        \sequencer_state0_tmr2[3]_net_1\, C => 
        \sequencer_state0_tmr3[3]_net_1\, Y => 
        \sequencer_state0[3]_net_1\);
    
    \ch_out0_maj_RNIV2042[0]\ : MX2
      port map(A => \n_ch_out0[0]\, B => \OUT_CHANNEL_VOSG_c[7]\, 
        S => \sequencer_state0[4]_net_1\, Y => 
        \ch_out0_maj_RNIV2042[0]_net_1\);
    
    un1_del_cntr1_I_66 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\);
    
    un1_del_cntr0_I_92 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_12_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_5_0[0]\);
    
    un1_del_cntr0_I_9 : AND2
      port map(A => \del_cntr0[10]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\);
    
    un1_del_cntr0_I_45 : XOR2
      port map(A => \del_cntr0[9]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[9]\);
    
    \sequencer_state1_maj[2]\ : MAJ3
      port map(A => \sequencer_state1_0[2]\, B => 
        \sequencer_state1_tmr2[2]_net_1\, C => 
        \sequencer_state1_tmr3[2]_net_1\, Y => 
        \sequencer_state1[2]_net_1\);
    
    \sequencer_state1[1]\ : DFN1C0
      port map(D => \sequencer_state1_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_0[1]\);
    
    un1_del_cntr0_I_24 : XOR2
      port map(A => \del_cntr0[2]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_1_0[0]\);
    
    \del_cntr0_maj[13]\ : MAJ3
      port map(A => \del_cntr0_0[13]\, B => 
        \del_cntr0_tmr2[13]_net_1\, C => 
        \del_cntr0_tmr3[13]_net_1\, Y => \del_cntr0[13]_net_1\);
    
    un1_del_cntr1_I_87 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\);
    
    un1_del_cntr1_I_30 : XOR2
      port map(A => \del_cntr1[1]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0[0]\);
    
    \sequencer_state1_tmr3[3]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNINTVQE[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state1_tmr3[3]_net_1\);
    
    \sequencer_state1_maj_RNIR4901[3]\ : OR2
      port map(A => \sequencer_state1[3]_net_1\, B => N_243, Y
         => \sequencer_state1_ns_0[1]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \sequencer_state1_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state1_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state1_tmr2[0]_net_1\);
    
    un1_del_cntr0_I_42 : XOR2
      port map(A => \del_cntr0[0]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[0]\);
    
    \ch_out1_tmr3[1]\ : DFN1C0
      port map(D => \ch_out1_maj_RNI2QBK1[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ch_out1_tmr3[1]_net_1\);
    
    \sequencer_state0_maj_RNIVEBGJ1[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_58_6, Y => 
        \n_del_cntr0[14]\);
    
    un1_del_cntr0_I_81 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\);
    
    \ret_state0_maj_RNI9S587[1]\ : NOR3C
      port map(A => N_374, B => N_378, C => 
        \sequencer_state0_ns_a2_0[4]\, Y => 
        \sequencer_state0_ns[4]\);
    
    \del_cntr0_tmr3[4]\ : DFN1P0
      port map(D => \n_del_cntr0[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[4]_net_1\);
    
    \ch_out1[0]\ : DFN1C0
      port map(D => \ch_out1_maj_RNI51LI2[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_0[0]\);
    
    \sequencer_state1_maj_RNIFCH11[0]\ : NOR2B
      port map(A => \sequencer_state1[0]_net_1\, B => 
        channels_ready(8), Y => N_258);
    
    \del_cntr1_tmr2[4]\ : DFN1P0
      port map(D => \n_del_cntr1[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[4]_net_1\);
    
    un1_del_cntr0_I_64 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_0[0]\, B => 
        \DWACT_ADD_CI_0_TMP_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_1_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\);
    
    \sequencer_state1_maj_RNIB6N6O1[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_58_5, Y => 
        \n_del_cntr1[14]\);
    
    \del_cntr0_tmr2[2]\ : DFN1P0
      port map(D => \n_del_cntr0[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[2]_net_1\);
    
    \sequencer_state0[0]\ : DFN1C0
      port map(D => \sequencer_state0_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_0[0]\);
    
    \del_cntr1_maj[5]\ : MAJ3
      port map(A => \del_cntr1_0[5]\, B => 
        \del_cntr1_tmr2[5]_net_1\, C => \del_cntr1_tmr3[5]_net_1\, 
        Y => \del_cntr1[5]_net_1\);
    
    \sequencer_state0_maj_RNI9VHP5[4]\ : NOR2B
      port map(A => N_377, B => channels_ready(7), Y => N_378);
    
    un1_del_cntr1_I_59 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[7]\, B => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\, Y => I_59_5);
    
    \del_cntr0_tmr2[7]\ : DFN1P0
      port map(D => \n_del_cntr0[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[7]_net_1\);
    
    un1_del_cntr0_I_51 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[3]\, B => 
        \DWACT_ADD_CI_0_g_array_12_0[0]\, Y => I_51_6);
    
    \sequencer_state0_maj_RNIOHR3U[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_57_6, Y => 
        \n_del_cntr0[8]\);
    
    \ch_out1_maj[0]\ : MAJ3
      port map(A => \ch_out1_0[0]\, B => \ch_out1_tmr2[0]_net_1\, 
        C => \ch_out1_tmr3[0]_net_1\, Y => \ch_out1[0]_net_1\);
    
    \ret_state0_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIVDU01[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3[1]_net_1\);
    
    \ret_state0_maj_RNI5KU01[4]\ : OA1A
      port map(A => N_379, B => \sequencer_state0[5]_net_1\, C
         => \ret_state0[4]_net_1\, Y => 
        \ret_state0_maj_RNI5KU01[4]_net_1\);
    
    \del_cntr0_tmr3[13]\ : DFN1P0
      port map(D => \n_del_cntr0[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[13]_net_1\);
    
    \del_cntr1[10]\ : DFN1P0
      port map(D => \n_del_cntr1[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[10]\);
    
    un1_del_cntr0_I_71 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_0[0]\);
    
    \ret_state0_maj[3]\ : MAJ3
      port map(A => \ret_state0_0[3]\, B => 
        \ret_state0_tmr2[3]_net_1\, C => 
        \ret_state0_tmr3[3]_net_1\, Y => \ret_state0[3]_net_1\);
    
    \sequencer_state1_maj_RNIS9IU1[5]\ : MX2C
      port map(A => \sequencer_state1[5]_net_1\, B => 
        un2_n_ch_out1, S => \sequencer_state1[0]_net_1\, Y => 
        \n_ch_out1[0]\);
    
    \del_cntr0_maj[1]\ : MAJ3
      port map(A => \del_cntr0_0[1]\, B => 
        \del_cntr0_tmr2[1]_net_1\, C => \del_cntr0_tmr3[1]_net_1\, 
        Y => \del_cntr0[1]_net_1\);
    
    \del_cntr0_maj[11]\ : MAJ3
      port map(A => \del_cntr0_0[11]\, B => 
        \del_cntr0_tmr2[11]_net_1\, C => 
        \del_cntr0_tmr3[11]_net_1\, Y => \del_cntr0[11]_net_1\);
    
    un1_del_cntr1_I_11 : AND2
      port map(A => \del_cntr1[6]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\);
    
    \sequencer_state1_tmr3[5]\ : DFN1P0
      port map(D => \sequencer_state1_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => 
        \sequencer_state1_tmr3[5]_net_1\);
    
    \ret_state1_tmr3[4]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI9GJF1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3[4]_net_1\);
    
    un1_del_cntr1_I_24 : XOR2
      port map(A => \del_cntr1[2]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_1[0]\);
    
    un1_del_cntr0_I_37 : XOR2
      port map(A => \del_cntr0[14]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[14]\);
    
    \sequencer_state0_maj_RNI3SCH6[4]\ : NOR2B
      port map(A => \sequencer_state0[4]_net_1\, B => N_340, Y
         => \sequencer_state0_ns_a2_0[1]\);
    
    un1_del_cntr1_I_41 : XOR2
      port map(A => \del_cntr1[12]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[12]\);
    
    \ret_state0_maj_RNIJUT52[3]\ : NOR3C
      port map(A => N_374, B => \sequencer_state0_ns_a2_0_0[1]\, 
        C => N_375, Y => N_370);
    
    un1_del_cntr1_I_67 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_10[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\);
    
    \del_cntr1_maj[1]\ : MAJ3
      port map(A => \del_cntr1_0[1]\, B => 
        \del_cntr1_tmr2[1]_net_1\, C => \del_cntr1_tmr3[1]_net_1\, 
        Y => \del_cntr1[1]_net_1\);
    
    \sequencer_state1_maj_RNI4BJF1[3]\ : AO1A
      port map(A => N_243, B => \ret_state1[2]_net_1\, C => 
        \sequencer_state1[3]_net_1\, Y => 
        \sequencer_state1_maj_RNI4BJF1[3]_net_1\);
    
    \del_cntr1_tmr2[5]\ : DFN1P0
      port map(D => \n_del_cntr1[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[5]_net_1\);
    
    \sequencer_state1_maj[3]\ : MAJ3
      port map(A => \sequencer_state1_0[3]\, B => 
        \sequencer_state1_tmr2[3]_net_1\, C => 
        \sequencer_state1_tmr3[3]_net_1\, Y => 
        \sequencer_state1[3]_net_1\);
    
    \sequencer_state0_maj_RNI68V241[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_54_6, Y => 
        \n_del_cntr0[10]\);
    
    \sequencer_state0_maj_RNI1CFT7[3]\ : AO1
      port map(A => \sequencer_state0_ns_a2_0[1]\, B => 
        channels_ready(7), C => \sequencer_state0_ns_0[1]\, Y => 
        \sequencer_state0_ns[1]\);
    
    \ret_state1_maj_RNIT4J56[3]\ : NOR3C
      port map(A => un6_del_cntr1, B => 
        \sequencer_state1_ns_a2_2_0[0]\, C => channels_ready(8), 
        Y => N_274);
    
    \ret_state0_maj_RNI6LU01[5]\ : OA1A
      port map(A => N_379, B => \sequencer_state0[5]_net_1\, C
         => \ret_state0[5]_net_1\, Y => 
        \ret_state0_maj_RNI6LU01[5]_net_1\);
    
    \ch_out1_tmr2[2]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIQEJ91[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ch_out1_tmr2[2]_net_1\);
    
    un1_del_cntr0_I_23 : XOR2
      port map(A => \del_cntr0[5]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_4_0[0]\);
    
    un1_del_cntr0_I_28 : XOR2
      port map(A => \del_cntr0[8]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_7_0[0]\);
    
    \del_cntr0_maj_RNINIA91[9]\ : NOR3A
      port map(A => un5_del_cntr0_6, B => \del_cntr0[10]_net_1\, 
        C => \del_cntr0[9]_net_1\, Y => un5_del_cntr0_10);
    
    un1_del_cntr0_I_49 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[6]\, B => 
        \DWACT_ADD_CI_0_g_array_11_0[0]\, Y => I_49_6);
    
    \sequencer_state1_tmr2[4]\ : DFN1C0
      port map(D => \sequencer_state1_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state1_tmr2[4]_net_1\);
    
    \del_cntr0_tmr2[3]\ : DFN1P0
      port map(D => \n_del_cntr0[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[3]_net_1\);
    
    \sequencer_state1_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state1_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state1_tmr2[1]_net_1\);
    
    un1_del_cntr0_I_63 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_8_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_9_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\);
    
    \sequencer_state1_maj_RNIFCH11_1[0]\ : NOR2A
      port map(A => channels_ready(8), B => 
        \sequencer_state1[0]_net_1\, Y => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\);
    
    \sequencer_state0_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state0_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state0_tmr3[0]_net_1\);
    
    \ch_out1_maj_RNI8LGB[0]\ : OR2A
      port map(A => SW4_SLAVE_PAIRS_BAR_c_0, B => 
        \ch_out1[0]_net_1\, Y => OUT_CHANNEL_VOSG_c(8));
    
    un1_del_cntr1_I_54 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[10]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, Y => I_54_5);
    
    \ret_state1_maj[2]\ : MAJ3
      port map(A => \ret_state1_0[2]\, B => 
        \ret_state1_tmr2[2]_net_1\, C => 
        \ret_state1_tmr3[2]_net_1\, Y => \ret_state1[2]_net_1\);
    
    un1_del_cntr0_I_85 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_1_0[0]\);
    
    un1_del_cntr0_I_68 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_5_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_6_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_2_0[0]\);
    
    \sequencer_state0_maj_RNIUCU01[2]\ : NOR3
      port map(A => \sequencer_state0[3]_net_1\, B => 
        \sequencer_state0[2]_net_1\, C => N_368, Y => 
        \sequencer_state0_maj_RNIUCU01[2]_net_1\);
    
    \del_cntr0_maj[5]\ : MAJ3
      port map(A => \del_cntr0_0[5]\, B => 
        \del_cntr0_tmr2[5]_net_1\, C => \del_cntr0_tmr3[5]_net_1\, 
        Y => \del_cntr0[5]_net_1\);
    
    \del_cntr0_maj[14]\ : MAJ3
      port map(A => \del_cntr0_0[14]\, B => 
        \del_cntr0_tmr2[14]_net_1\, C => 
        \del_cntr0_tmr3[14]_net_1\, Y => \del_cntr0[14]_net_1\);
    
    \ret_state1_tmr2[5]\ : DFN1P0
      port map(D => \ret_state1_maj_RNIAHJF1[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state1_tmr2[5]_net_1\);
    
    un1_del_cntr0_I_11 : AND2
      port map(A => \del_cntr0[6]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\);
    
    \del_cntr1_tmr3[12]\ : DFN1P0
      port map(D => \n_del_cntr1[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[12]_net_1\);
    
    \del_cntr1_maj_RNI4BK02[14]\ : NOR3C
      port map(A => un6_del_cntr1_2, B => un6_del_cntr1_1, C => 
        un6_del_cntr1_7, Y => un6_del_cntr1_11);
    
    \sequencer_state1_maj_RNIHNGL[2]\ : OR2
      port map(A => \sequencer_state1[2]_net_1\, B => 
        \sequencer_state1[1]_net_1\, Y => N_243);
    
    \del_cntr1[4]\ : DFN1P0
      port map(D => \n_del_cntr1[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[4]\);
    
    \sequencer_state0_maj_RNIF96E[2]\ : OR2
      port map(A => \sequencer_state0[2]_net_1\, B => 
        \sequencer_state0[1]_net_1\, Y => N_347);
    
    un1_del_cntr0_I_82 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_4_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_5_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\);
    
    un1_del_cntr0_I_8 : AND2
      port map(A => \del_cntr0[8]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\);
    
    \sequencer_state1_maj_RNICH997[0]\ : OR3
      port map(A => N_275, B => N_260, C => 
        \DWACT_ADD_CI_0_partial_sum_0[0]\, Y => \n_del_cntr1[0]\);
    
    un1_del_cntr1_I_71 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12[0]\);
    
    un1_del_cntr0_I_55 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[9]\, B => 
        \DWACT_ADD_CI_0_g_array_12_3_0[0]\, Y => I_55_6);
    
    \ch_out1_maj_RNI2QBK1[1]\ : MX2A
      port map(A => N_265, B => \ch_out1[1]_net_1\, S => 
        \sequencer_state1[4]_net_1\, Y => 
        \ch_out1_maj_RNI2QBK1[1]_net_1\);
    
    \ch_out1_maj[2]\ : MAJ3
      port map(A => \ch_out1_0[2]\, B => \ch_out1_tmr2[2]_net_1\, 
        C => \ch_out1_tmr3[2]_net_1\, Y => \ch_out1[2]_net_1\);
    
    \sequencer_state0_maj_RNINBS1G[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_53_6, Y => 
        \n_del_cntr0[4]\);
    
    \ret_state1_maj_RNILFKU[3]\ : NOR2A
      port map(A => \ret_state1[4]_net_1\, B => 
        \ret_state1[3]_net_1\, Y => 
        \sequencer_state1_ns_a2_0_0[1]\);
    
    \del_cntr0[12]\ : DFN1P0
      port map(D => \n_del_cntr0[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[12]\);
    
    \ret_state1_maj[3]\ : MAJ3
      port map(A => \ret_state1_0[3]\, B => 
        \ret_state1_tmr2[3]_net_1\, C => 
        \ret_state1_tmr3[3]_net_1\, Y => \ret_state1[3]_net_1\);
    
    un1_del_cntr1_I_23 : XOR2
      port map(A => \del_cntr1[5]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\);
    
    \sequencer_state1_maj_RNIGAD49[0]\ : AO1
      port map(A => \sequencer_state1_ns_a2_0_1[5]\, B => N_274, 
        C => N_258, Y => \sequencer_state1_ns[5]\);
    
    un1_del_cntr0_I_75 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_2_0[0]\);
    
    \sequencer_state0_maj_RNI3VO25[4]\ : NOR2B
      port map(A => \sequencer_state0_ns_a2_2_0[0]\, B => 
        un5_del_cntr0, Y => N_377);
    
    \sequencer_state0_maj_RNIOP7N1[5]\ : MX2C
      port map(A => \sequencer_state0[5]_net_1\, B => 
        un5_n_ch_out0, S => \sequencer_state0[0]_net_1\, Y => 
        \n_ch_out0[0]\);
    
    un1_del_cntr0_I_52 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[2]\, B => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, Y => I_52_6);
    
    un1_del_cntr0_I_5 : AND2
      port map(A => \del_cntr0[7]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_7_0[0]\);
    
    un1_del_cntr1_I_81 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_10[0]\);
    
    un1_del_cntr1_I_28 : XOR2
      port map(A => \del_cntr1[8]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_7[0]\);
    
    \ret_state0_maj_RNIFT9N_1[1]\ : NOR2
      port map(A => \ret_state0[2]_net_1\, B => 
        \ret_state0[1]_net_1\, Y => N_375);
    
    un1_del_cntr1_I_36 : XOR2
      port map(A => \del_cntr1[1]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[1]\);
    
    \del_cntr0_tmr3[6]\ : DFN1P0
      port map(D => \n_del_cntr0[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[6]_net_1\);
    
    \sequencer_state1_maj_RNIR4901_0[3]\ : NOR2
      port map(A => \sequencer_state1[3]_net_1\, B => N_243, Y
         => \sequencer_state1_ns_a2_0[0]\);
    
    \ret_state0_maj_RNIFT9N_0[1]\ : NOR2A
      port map(A => \ret_state0[1]_net_1\, B => 
        \ret_state0[2]_net_1\, Y => \sequencer_state0_ns_a2_0[4]\);
    
    \del_cntr0[0]\ : DFN1P0
      port map(D => \n_del_cntr0[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[0]\);
    
    un1_del_cntr0_I_20 : XOR2
      port map(A => \del_cntr0[10]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_9_0[0]\);
    
    \ret_state1_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI3AJF1[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2[1]_net_1\);
    
    un1_del_cntr0_I_72 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_6_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_7_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_3_0[0]\);
    
    un1_del_cntr0_I_7 : AND2
      port map(A => \del_cntr0[2]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\);
    
    un1_del_cntr1_I_45 : XOR2
      port map(A => \del_cntr1[9]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[9]\);
    
    \sequencer_state1_maj_RNINTVQE[5]\ : OA1C
      port map(A => N_245, B => \sequencer_state1[5]_net_1\, C
         => \sequencer_state1_ns_i_1[2]\, Y => 
        \sequencer_state1_maj_RNINTVQE[5]_net_1\);
    
    \del_cntr1_tmr3[10]\ : DFN1P0
      port map(D => \n_del_cntr1[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[10]_net_1\);
    
    \ch_out1_tmr2[0]\ : DFN1C0
      port map(D => \ch_out1_maj_RNI51LI2[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ch_out1_tmr2[0]_net_1\);
    
    \sequencer_state0_tmr2[3]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIGIB9C[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state0_tmr2[3]_net_1\);
    
    \ch_out0_tmr3[1]\ : DFN1C0
      port map(D => \ch_out0_maj_RNITM121[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ch_out0_tmr3[1]_net_1\);
    
    un1_del_cntr1_I_12 : AND2
      port map(A => \del_cntr1[9]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\);
    
    un1_del_cntr1_I_1 : AND2
      port map(A => \del_cntr1[0]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_TMP[0]\);
    
    un1_del_cntr0_I_44 : XOR2
      port map(A => \del_cntr0[10]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[10]\);
    
    \del_cntr1_maj_RNIL4D54[10]\ : NOR3C
      port map(A => un6_del_cntr1_10, B => un6_del_cntr1_9, C => 
        un6_del_cntr1_11, Y => un6_del_cntr1);
    
    \del_cntr0_tmr3[9]\ : DFN1P0
      port map(D => \n_del_cntr0[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[9]_net_1\);
    
    \del_cntr1_tmr3[2]\ : DFN1P0
      port map(D => \n_del_cntr1[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[2]_net_1\);
    
    \sequencer_state1_maj_RNIPR2C7_0[4]\ : OA1A
      port map(A => un6_del_cntr1, B => N_266, C => 
        \sequencer_state1[4]_net_1\, Y => 
        \sequencer_state1_ns_a2_0[1]\);
    
    \ret_state1_maj_RNI5OL63[1]\ : NOR3C
      port map(A => N_254_1, B => N_239_i, C => N_270, Y => N_254);
    
    un1_del_cntr1_I_42 : XOR2
      port map(A => \del_cntr1[0]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[0]\);
    
    un1_del_cntr0_I_60 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[13]\, B => 
        \DWACT_ADD_CI_0_g_array_12_5_0[0]\, Y => I_60_6);
    
    \ret_state0_maj_RNIFT9N[1]\ : NOR2A
      port map(A => \ret_state0[2]_net_1\, B => 
        \ret_state0[1]_net_1\, Y => \sequencer_state0_ns_a2_0[3]\);
    
    \del_cntr1[0]\ : DFN1P0
      port map(D => \n_del_cntr1[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[0]\);
    
    \del_cntr1_tmr3[7]\ : DFN1P0
      port map(D => \n_del_cntr1[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[7]_net_1\);
    
    \del_cntr0_maj[10]\ : MAJ3
      port map(A => \del_cntr0_0[10]\, B => 
        \del_cntr0_tmr2[10]_net_1\, C => 
        \del_cntr0_tmr3[10]_net_1\, Y => \del_cntr0[10]_net_1\);
    
    \ch_out0[2]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIMIUQ[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0[2]_net_1\);
    
    un1_del_cntr1_I_53 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[4]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, Y => I_53_5);
    
    \ret_state0_tmr3[4]\ : DFN1C0
      port map(D => \ret_state0_maj_RNI5KU01[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3[4]_net_1\);
    
    \del_cntr0_maj[7]\ : MAJ3
      port map(A => \del_cntr0_0[7]\, B => 
        \del_cntr0_tmr2[7]_net_1\, C => \del_cntr0_tmr3[7]_net_1\, 
        Y => \del_cntr0[7]_net_1\);
    
    \ret_state0_maj_RNIJ1AN[3]\ : NOR2A
      port map(A => \ret_state0[4]_net_1\, B => 
        \ret_state0[3]_net_1\, Y => 
        \sequencer_state0_ns_a2_0_0[1]\);
    
    un1_del_cntr1_I_58 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[14]\, B => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\, Y => I_58_5);
    
    \sequencer_state0_maj_RNI0FU01[3]\ : AO1A
      port map(A => N_347, B => \ret_state0[2]_net_1\, C => 
        \sequencer_state0[3]_net_1\, Y => 
        \sequencer_state0_maj_RNI0FU01[3]_net_1\);
    
    un1_del_cntr1_I_90 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_3[0]\);
    
    un1_del_cntr0_I_31 : XOR2
      port map(A => \del_cntr0[3]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_2_0[0]\);
    
    \ret_state0_maj_RNI4JU01[3]\ : OA1A
      port map(A => N_379, B => \sequencer_state0[5]_net_1\, C
         => \ret_state0[3]_net_1\, Y => 
        \ret_state0_maj_RNI4JU01[3]_net_1\);
    
    \del_cntr1_tmr3[5]\ : DFN1P0
      port map(D => \n_del_cntr1[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[5]_net_1\);
    
    un1_del_cntr0_I_89 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_1_0[0]\);
    
    \sequencer_state0_tmr2[5]\ : DFN1P0
      port map(D => \sequencer_state0_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => 
        \sequencer_state0_tmr2[5]_net_1\);
    
    \del_cntr0_tmr3[8]\ : DFN1P0
      port map(D => \n_del_cntr0[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[8]_net_1\);
    
    \del_cntr0_maj_RNIIBFU[5]\ : NOR3A
      port map(A => un5_del_cntr0_4, B => \del_cntr0[6]_net_1\, C
         => \del_cntr0[5]_net_1\, Y => un5_del_cntr0_9);
    
    un1_del_cntr1_I_20 : XOR2
      port map(A => \del_cntr1[10]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_9[0]\);
    
    \sequencer_state0_maj[5]\ : MAJ3
      port map(A => \sequencer_state0_0[5]\, B => 
        \sequencer_state0_tmr2[5]_net_1\, C => 
        \sequencer_state0_tmr3[5]_net_1\, Y => 
        \sequencer_state0[5]_net_1\);
    
    \sequencer_state0_maj_RNIIP725[0]\ : NOR2B
      port map(A => \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, B
         => un5_del_cntr0, Y => N_364);
    
    \ret_state1[4]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI9GJF1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state1_0[4]\);
    
    \del_cntr1_tmr3[1]\ : DFN1P0
      port map(D => \n_del_cntr1[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[1]_net_1\);
    
    \del_cntr1_tmr2[9]\ : DFN1P0
      port map(D => \n_del_cntr1[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[9]_net_1\);
    
    \del_cntr1[12]\ : DFN1P0
      port map(D => \n_del_cntr1[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[12]\);
    
    \sequencer_state0[1]\ : DFN1C0
      port map(D => \sequencer_state0_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_0[1]\);
    
    \del_cntr0_tmr3[0]\ : DFN1P0
      port map(D => \n_del_cntr0[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[0]_net_1\);
    
    \del_cntr0_maj[8]\ : MAJ3
      port map(A => \del_cntr0_0[8]\, B => 
        \del_cntr0_tmr2[8]_net_1\, C => \del_cntr0_tmr3[8]_net_1\, 
        Y => \del_cntr0[8]_net_1\);
    
    \ch_out0_maj_RNITM121[1]\ : MX2A
      port map(A => N_369, B => \ch_iaux_en[7]\, S => 
        \sequencer_state0[4]_net_1\, Y => 
        \ch_out0_maj_RNITM121[1]_net_1\);
    
    \sequencer_state1_maj[5]\ : MAJ3
      port map(A => \sequencer_state1_0[5]\, B => 
        \sequencer_state1_tmr2[5]_net_1\, C => 
        \sequencer_state1_tmr3[5]_net_1\, Y => 
        \sequencer_state1[5]_net_1\);
    
    \main_sequencer.un5_n_ch_out0\ : NOR3C
      port map(A => N_73, B => channels_desired_on(7), C => 
        dtycyc_en, Y => un5_n_ch_out0);
    
    un1_del_cntr1_I_75 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\);
    
    un1_del_cntr1_I_37 : XOR2
      port map(A => \del_cntr1[14]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[14]\);
    
    \del_cntr1_maj[9]\ : MAJ3
      port map(A => \del_cntr1_0[9]\, B => 
        \del_cntr1_tmr2[9]_net_1\, C => \del_cntr1_tmr3[9]_net_1\, 
        Y => \del_cntr1[9]_net_1\);
    
    un1_del_cntr0_I_59 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[7]\, B => 
        \DWACT_ADD_CI_0_g_array_12_2_0[0]\, Y => I_59_6);
    
    un1_del_cntr0_I_12 : AND2
      port map(A => \del_cntr0[9]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_9_0[0]\);
    
    un1_del_cntr0_I_1 : AND2
      port map(A => \del_cntr0[0]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_TMP_0[0]\);
    
    \del_cntr0_tmr3[3]\ : DFN1P0
      port map(D => \n_del_cntr0[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[3]_net_1\);
    
    \del_cntr0[2]\ : DFN1P0
      port map(D => \n_del_cntr0[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[2]\);
    
    \del_cntr0_maj[6]\ : MAJ3
      port map(A => \del_cntr0_0[6]\, B => 
        \del_cntr0_tmr2[6]_net_1\, C => \del_cntr0_tmr3[6]_net_1\, 
        Y => \del_cntr0[6]_net_1\);
    
    \ch_out0_tmr2[2]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIMIUQ[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ch_out0_tmr2[2]_net_1\);
    
    \sequencer_state1_tmr3[4]\ : DFN1C0
      port map(D => \sequencer_state1_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state1_tmr3[4]_net_1\);
    
    \ret_state0_maj_RNIHV9N[0]\ : XOR2
      port map(A => \ret_state0[0]_net_1\, B => 
        \ret_state0[5]_net_1\, Y => N_342_i);
    
    \del_cntr0_maj_RNIST2U[14]\ : NOR3
      port map(A => \del_cntr0[1]_net_1\, B => 
        \del_cntr0[14]_net_1\, C => \del_cntr0[13]_net_1\, Y => 
        un5_del_cntr0_7);
    
    \sequencer_state1_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state1_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state1_tmr3[1]_net_1\);
    
    \sequencer_state1_maj_RNIPR2C7[4]\ : OR3B
      port map(A => un6_del_cntr1, B => 
        \sequencer_state1[4]_net_1\, C => N_266, Y => N_245);
    
    \ret_state0[0]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIUCU01[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_0[0]\);
    
    \del_cntr1[5]\ : DFN1P0
      port map(D => \n_del_cntr1[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[5]\);
    
    \sequencer_state0_tmr3[3]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIGIB9C[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state0_tmr3[3]_net_1\);
    
    un1_del_cntr0_I_79 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_2_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_3_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_1_0[0]\);
    
    \sequencer_state0_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state0_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state0_tmr2[0]_net_1\);
    
    un1_del_cntr1_I_72 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_6[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\);
    
    un1_del_cntr1_I_7 : AND2
      port map(A => \del_cntr1[2]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\);
    
    \ret_state1[3]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI8FJF1[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state1_0[3]\);
    
    un1_del_cntr1_I_85 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_1[0]\);
    
    \ret_state1_maj_RNIII447[0]\ : OR3A
      port map(A => channels_ready(8), B => N_255, C => N_254, Y
         => \sequencer_state1_ns_i_1[2]\);
    
    \ret_state1_maj[4]\ : MAJ3
      port map(A => \ret_state1_0[4]\, B => 
        \ret_state1_tmr2[4]_net_1\, C => 
        \ret_state1_tmr3[4]_net_1\, Y => \ret_state1[4]_net_1\);
    
    \ret_state0_tmr2[5]\ : DFN1P0
      port map(D => \ret_state0_maj_RNI6LU01[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state0_tmr2[5]_net_1\);
    
    un1_del_cntr0_I_43 : XOR2
      port map(A => \del_cntr0[11]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[11]\);
    
    \ret_state0_maj_RNIHV9N_0[0]\ : NOR2
      port map(A => \ret_state0[0]_net_1\, B => 
        \ret_state0[5]_net_1\, Y => N_374);
    
    \ret_state0[4]\ : DFN1C0
      port map(D => \ret_state0_maj_RNI5KU01[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state0_0[4]\);
    
    \del_cntr0[8]\ : DFN1P0
      port map(D => \n_del_cntr0[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[8]\);
    
    un1_del_cntr1_I_19 : XOR2
      port map(A => \del_cntr1[7]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\);
    
    \sequencer_state0_maj_RNIARBTL[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_49_6, Y => 
        \n_del_cntr0[6]\);
    
    \sequencer_state0_maj_RNIOF9L[3]\ : OR2
      port map(A => \sequencer_state0[3]_net_1\, B => N_347, Y
         => \sequencer_state0_ns_0[1]\);
    
    un1_del_cntr1_I_49 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[6]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, Y => I_49_5);
    
    un1_del_cntr0_I_48 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[11]\, B => 
        \DWACT_ADD_CI_0_g_array_12_4_0[0]\, Y => I_48_6);
    
    \del_cntr0_maj_RNIRN7F[7]\ : NOR2
      port map(A => \del_cntr0[7]_net_1\, B => 
        \del_cntr0[8]_net_1\, Y => un5_del_cntr0_4);
    
    \ch_out0_maj[2]\ : MAJ3
      port map(A => \ch_out0[2]_net_1\, B => 
        \ch_out0_tmr2[2]_net_1\, C => \ch_out0_tmr3[2]_net_1\, Y
         => \ch_mreg_en[7]\);
    
    un1_del_cntr1_I_82 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\);
    
    un1_del_cntr1_I_8 : AND2
      port map(A => \del_cntr1[8]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\);
    
    \sequencer_state1_maj_RNIPSCAI1[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_50_5, Y => 
        \n_del_cntr1[12]\);
    
    \ret_state1[0]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI29JF1[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_0[0]\);
    
    un1_del_cntr1_I_50 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[12]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, Y => I_50_5);
    
    \sequencer_state1_maj_RNI2IO2A1[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_54_5, Y => 
        \n_del_cntr1[10]\);
    
    \sequencer_state0[4]\ : DFN1C0
      port map(D => \sequencer_state0_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_0[4]\);
    
    \ret_state0_maj[5]\ : MAJ3
      port map(A => \ret_state0_0[5]\, B => 
        \ret_state0_tmr2[5]_net_1\, C => 
        \ret_state0_tmr3[5]_net_1\, Y => \ret_state0[5]_net_1\);
    
    \del_cntr1_tmr3[13]\ : DFN1P0
      port map(D => \n_del_cntr1[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[13]_net_1\);
    
    \del_cntr0_maj[0]\ : MAJ3
      port map(A => \del_cntr0_0[0]\, B => 
        \del_cntr0_tmr2[0]_net_1\, C => \del_cntr0_tmr3[0]_net_1\, 
        Y => \del_cntr0[0]_net_1\);
    
    \ret_state0_maj_RNID7NL1[1]\ : XA1
      port map(A => \ret_state0[1]_net_1\, B => 
        \ret_state0[2]_net_1\, C => N_358_1, Y => 
        \sequencer_state0_ns_i_a2_0_0[2]\);
    
    \sequencer_state1[5]\ : DFN1P0
      port map(D => \sequencer_state1_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state1_0[5]\);
    
    \sequencer_state1[4]\ : DFN1C0
      port map(D => \sequencer_state1_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_0[4]\);
    
    \del_cntr0_maj_RNIJF7F[3]\ : NOR2
      port map(A => \del_cntr0[3]_net_1\, B => 
        \del_cntr0[4]_net_1\, Y => un5_del_cntr0_2);
    
    \ch_out1_maj_RNI51LI2[0]\ : MX2
      port map(A => \n_ch_out1[0]\, B => \ch_out1[0]_net_1\, S
         => \sequencer_state1[4]_net_1\, Y => 
        \ch_out1_maj_RNI51LI2[0]_net_1\);
    
    \sequencer_state1_maj_RNIFCH11_0[0]\ : NOR2A
      port map(A => channels_ready(8), B => 
        \sequencer_state1[0]_net_1\, Y => N_276_0);
    
    \ret_state1_maj_RNIHBKU_0[1]\ : NOR2A
      port map(A => \ret_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => \sequencer_state1_ns_a2_0[3]\);
    
    \del_cntr0_tmr3[14]\ : DFN1P0
      port map(D => \n_del_cntr0[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[14]_net_1\);
    
    \del_cntr1_maj[12]\ : MAJ3
      port map(A => \del_cntr1_0[12]\, B => 
        \del_cntr1_tmr2[12]_net_1\, C => 
        \del_cntr1_tmr3[12]_net_1\, Y => \del_cntr1[12]_net_1\);
    
    \ch_out1_maj[1]\ : MAJ3
      port map(A => \ch_out1_0[1]\, B => \ch_out1_tmr2[1]_net_1\, 
        C => \ch_out1_tmr3[1]_net_1\, Y => \ch_out1[1]_net_1\);
    
    \ch_out0_maj_RNIMIUQ[2]\ : MX2A
      port map(A => N_353, B => \ch_mreg_en[7]\, S => 
        \sequencer_state0[4]_net_1\, Y => 
        \ch_out0_maj_RNIMIUQ[2]_net_1\);
    
    \sequencer_state1_maj[4]\ : MAJ3
      port map(A => \sequencer_state1_0[4]\, B => 
        \sequencer_state1_tmr2[4]_net_1\, C => 
        \sequencer_state1_tmr3[4]_net_1\, Y => 
        \sequencer_state1[4]_net_1\);
    
    \del_cntr0_tmr2[13]\ : DFN1P0
      port map(D => \n_del_cntr0[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[13]_net_1\);
    
    \ret_state1_maj_RNIJDKU_0[0]\ : NOR2
      port map(A => \ret_state1[5]_net_1\, B => 
        \ret_state1[0]_net_1\, Y => N_270);
    
    \ch_out0_maj[0]\ : MAJ3
      port map(A => \ch_out0[0]_net_1\, B => 
        \ch_out0_tmr2[0]_net_1\, C => \ch_out0_tmr3[0]_net_1\, Y
         => \OUT_CHANNEL_VOSG_c[7]\);
    
    \del_cntr1[6]\ : DFN1P0
      port map(D => \n_del_cntr1[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[6]\);
    
    \ret_state0_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIVDU01[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2[1]_net_1\);
    
    \del_cntr0_tmr3[11]\ : DFN1P0
      port map(D => \n_del_cntr0[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[11]_net_1\);
    
    \sequencer_state0_tmr3[5]\ : DFN1P0
      port map(D => \sequencer_state0_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => 
        \sequencer_state0_tmr3[5]_net_1\);
    
    \sequencer_state0_maj_RNIC80LF1[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_60_6, Y => 
        \n_del_cntr0[13]\);
    
    \ret_state0_maj_RNIJ1AN_0[3]\ : NOR2
      port map(A => \ret_state0[4]_net_1\, B => 
        \ret_state0[3]_net_1\, Y => N_371);
    
    \sequencer_state0_maj_RNI1RO2D1[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_50_6, Y => 
        \n_del_cntr0[12]\);
    
    \sequencer_state1_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state1_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state1_tmr2[2]_net_1\);
    
    \sequencer_state0_maj_RNIC3ST_0[0]\ : NOR2A
      port map(A => channels_ready(7), B => 
        \sequencer_state0[0]_net_1\, Y => N_380_0);
    
    \del_cntr1_maj[3]\ : MAJ3
      port map(A => \del_cntr1_0[3]\, B => 
        \del_cntr1_tmr2[3]_net_1\, C => \del_cntr1_tmr3[3]_net_1\, 
        Y => \del_cntr1[3]_net_1\);
    
    un1_del_cntr0_I_35 : XOR2
      port map(A => \del_cntr0[7]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[7]\);
    
    \ret_state1_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI29JF1[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3[0]_net_1\);
    
    \del_cntr1_tmr3[4]\ : DFN1P0
      port map(D => \n_del_cntr1[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[4]_net_1\);
    
    \del_cntr1_maj_RNIM74D1[5]\ : NOR3A
      port map(A => un6_del_cntr1_4, B => \del_cntr1[6]_net_1\, C
         => \del_cntr1[5]_net_1\, Y => un6_del_cntr1_9);
    
    un1_del_cntr0_I_26 : XOR2
      port map(A => \del_cntr0[6]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_5_0[0]\);
    
    \del_cntr1[3]\ : DFN1P0
      port map(D => \n_del_cntr1[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[3]\);
    
    \ret_state1_maj[1]\ : MAJ3
      port map(A => \ret_state1_0[1]\, B => 
        \ret_state1_tmr2[1]_net_1\, C => 
        \ret_state1_tmr3[1]_net_1\, Y => \ret_state1[1]_net_1\);
    
    un1_del_cntr1_I_65 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\);
    
    un1_del_cntr0_I_54 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[10]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\, Y => I_54_6);
    
    un1_del_cntr0_I_90 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_8_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_3_0[0]\);
    
    \del_cntr1_tmr2[2]\ : DFN1P0
      port map(D => \n_del_cntr1[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[2]_net_1\);
    
    \sequencer_state1_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state1_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state1_tmr3[2]_net_1\);
    
    \sequencer_state1_maj_RNI31D9E[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_51_5, Y => 
        \n_del_cntr1[3]\);
    
    un1_del_cntr0_I_19 : XOR2
      port map(A => \del_cntr0[7]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_6_0[0]\);
    
    un1_del_cntr0_I_74 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_3_0[0]\);
    
    \ret_state1_maj_RNIJDKU[0]\ : XOR2
      port map(A => \ret_state1[5]_net_1\, B => 
        \ret_state1[0]_net_1\, Y => N_238_i);
    
    \sequencer_state0_maj_RNI44SCI[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_62_6, Y => 
        \n_del_cntr0[5]\);
    
    \del_cntr1_tmr2[7]\ : DFN1P0
      port map(D => \n_del_cntr1[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[7]_net_1\);
    
    \ch_out0_tmr2[0]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIV2042[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ch_out0_tmr2[0]_net_1\);
    
    \sequencer_state1_maj[0]\ : MAJ3
      port map(A => \sequencer_state1_0[0]\, B => 
        \sequencer_state1_tmr2[0]_net_1\, C => 
        \sequencer_state1_tmr3[0]_net_1\, Y => 
        \sequencer_state1[0]_net_1\);
    
    un1_del_cntr1_I_62 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[5]\, B => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, Y => I_62_5);
    
    un1_del_cntr1_I_6 : AND2
      port map(A => \del_cntr1[3]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\);
    
    un1_del_cntr0_I_66 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_2_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_3_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_1_0[0]\);
    
    \ret_state1_maj_RNI0UC91[3]\ : NOR3A
      port map(A => \sequencer_state1[4]_net_1\, B => 
        \ret_state1[4]_net_1\, C => \ret_state1[3]_net_1\, Y => 
        \sequencer_state1_ns_a2_2_0[0]\);
    
    un1_del_cntr0_I_40 : XOR2
      port map(A => \del_cntr0[8]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[8]\);
    
    un1_del_cntr1_I_79 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\);
    
    un1_del_cntr1_I_14 : AND2
      port map(A => \del_cntr1[5]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\);
    
    \sequencer_state0_tmr2[4]\ : DFN1C0
      port map(D => \sequencer_state0_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state0_tmr2[4]_net_1\);
    
    \ret_state1[1]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI3AJF1[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_0[1]\);
    
    \sequencer_state0_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state0_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state0_tmr2[1]_net_1\);
    
    \sequencer_state0_maj_RNIRNB8O[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_59_6, Y => 
        \n_del_cntr0[7]\);
    
    \ret_state1_maj_RNIP8TR2[3]\ : NOR3C
      port map(A => N_270, B => \sequencer_state1_ns_a2_0_0[1]\, 
        C => N_271, Y => N_266);
    
    un1_del_cntr1_I_44 : XOR2
      port map(A => \del_cntr1[10]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[10]\);
    
    un1_del_cntr1_I_89 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_1[0]\);
    
    \ret_state1_tmr2[3]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI8FJF1[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2[3]_net_1\);
    
    \ret_state1[2]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNI4BJF1[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_0[2]\);
    
    \del_cntr0_tmr2[8]\ : DFN1P0
      port map(D => \n_del_cntr0[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[8]_net_1\);
    
    \ch_out0_maj[1]\ : MAJ3
      port map(A => \ch_out0[1]_net_1\, B => 
        \ch_out0_tmr2[1]_net_1\, C => \ch_out0_tmr3[1]_net_1\, Y
         => \ch_iaux_en[7]\);
    
    \sequencer_state0_maj_RNILV168[0]\ : AO1
      port map(A => \sequencer_state0_ns_a2_0_1[5]\, B => N_378, 
        C => N_362, Y => \sequencer_state0_ns[5]\);
    
    \del_cntr1_tmr2[12]\ : DFN1P0
      port map(D => \n_del_cntr1[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[12]_net_1\);
    
    \del_cntr0_tmr2[0]\ : DFN1P0
      port map(D => \n_del_cntr0[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[0]_net_1\);
    
    un1_del_cntr1_I_26 : XOR2
      port map(A => \del_cntr1[6]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_5[0]\);
    
    un1_del_cntr0_I_83 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_1_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\);
    
    \ch_out1_maj_RNIQEJ91[2]\ : MX2A
      port map(A => N_249, B => \ch_out1[2]_net_1\, S => 
        \sequencer_state1[4]_net_1\, Y => 
        \ch_out1_maj_RNIQEJ91[2]_net_1\);
    
    \sequencer_state0_maj[0]\ : MAJ3
      port map(A => \sequencer_state0_0[0]\, B => 
        \sequencer_state0_tmr2[0]_net_1\, C => 
        \sequencer_state0_tmr3[0]_net_1\, Y => 
        \sequencer_state0[0]_net_1\);
    
    un1_del_cntr1_I_31 : XOR2
      port map(A => \del_cntr1[3]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\);
    
    \ret_state0_maj[1]\ : MAJ3
      port map(A => \ret_state0_0[1]\, B => 
        \ret_state0_tmr2[1]_net_1\, C => 
        \ret_state0_tmr3[1]_net_1\, Y => \ret_state0[1]_net_1\);
    
    \del_cntr1[9]\ : DFN1P0
      port map(D => \n_del_cntr1[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_0[9]\);
    
    un1_del_cntr0_I_88 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_0[0]\);
    
    un1_del_cntr0_I_27 : XOR2
      port map(A => \del_cntr0[11]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_10_0[0]\);
    
    \sequencer_state0_maj_RNIKRTL6[0]\ : OR3
      port map(A => N_379, B => N_364, C => 
        \DWACT_ADD_CI_0_partial_sum[0]\, Y => \n_del_cntr0[0]\);
    
    \sequencer_state1_maj_RNIS2539_0[3]\ : AO1
      port map(A => \sequencer_state1_ns_a2_0[1]\, B => 
        channels_ready(8), C => \sequencer_state1_ns_0[1]\, Y => 
        \sequencer_state1_ns[1]\);
    
    \sequencer_state1[0]\ : DFN1C0
      port map(D => \sequencer_state1_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_0[0]\);
    
    \del_cntr1_tmr2[3]\ : DFN1P0
      port map(D => \n_del_cntr1[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[3]_net_1\);
    
    un1_del_cntr0_I_53 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[4]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, Y => I_53_6);
    
    \sequencer_state0_maj_RNILC9L[0]\ : NOR2
      port map(A => N_347, B => \sequencer_state0[0]_net_1\, Y
         => N_369);
    
    \del_cntr1_tmr3[11]\ : DFN1P0
      port map(D => \n_del_cntr1[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[11]_net_1\);
    
    un1_del_cntr0_I_14 : AND2
      port map(A => \del_cntr0[5]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_5_0[0]\);
    
    \sequencer_state0_maj_RNINQCHC[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_51_6, Y => 
        \n_del_cntr0[3]\);
    
    \del_cntr0_tmr2[6]\ : DFN1P0
      port map(D => \n_del_cntr0[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[6]_net_1\);
    
    \ret_state1_maj_RNIHBKU[1]\ : XOR2
      port map(A => \ret_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => N_239_i);
    
    un1_del_cntr0_I_73 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_12_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_13_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_6_0[0]\);
    
    un1_del_cntr0_I_58 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[14]\, B => 
        \DWACT_ADD_CI_0_g_array_11_2_0[0]\, Y => I_58_6);
    
    \del_cntr1_maj[13]\ : MAJ3
      port map(A => \del_cntr1_0[13]\, B => 
        \del_cntr1_tmr2[13]_net_1\, C => 
        \del_cntr1_tmr3[13]_net_1\, Y => \del_cntr1[13]_net_1\);
    
    \del_cntr0_tmr3[12]\ : DFN1P0
      port map(D => \n_del_cntr0[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[12]_net_1\);
    
    un1_del_cntr0_I_67 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_10_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_11_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_5_0[0]\);
    
    un1_del_cntr0_I_39 : XOR2
      port map(A => \del_cntr0[13]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[13]\);
    
    \del_cntr1_tmr2[10]\ : DFN1P0
      port map(D => \n_del_cntr1[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[10]_net_1\);
    
    un1_del_cntr1_I_74 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\);
    
    \del_cntr0_tmr3[10]\ : DFN1P0
      port map(D => \n_del_cntr0[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3[10]_net_1\);
    
    \sequencer_state0_maj_RNIUF2C1[3]\ : NOR3
      port map(A => N_347, B => \sequencer_state0[3]_net_1\, C
         => channels_ready(7), Y => N_354);
    
    un1_del_cntr1_I_69 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\);
    
    un1_del_cntr0_I_78 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\);
    
    un1_del_cntr1_I_13 : AND2
      port map(A => \del_cntr1[12]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\);
    
    \sequencer_state1_maj_RNI4HU65[0]\ : NOR2B
      port map(A => \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, B
         => un6_del_cntr1, Y => N_260);
    
    \ret_state1_maj[5]\ : MAJ3
      port map(A => \ret_state1_0[5]\, B => 
        \ret_state1_tmr2[5]_net_1\, C => 
        \ret_state1_tmr3[5]_net_1\, Y => \ret_state1[5]_net_1\);
    
    un1_del_cntr1_I_56 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[1]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, Y => I_56_5);
    
    \sequencer_state0_maj_RNIE6D6A[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_52_6, Y => 
        \n_del_cntr0[2]\);
    
    \ret_state0_maj[4]\ : MAJ3
      port map(A => \ret_state0_0[4]\, B => 
        \ret_state0_tmr2[4]_net_1\, C => 
        \ret_state0_tmr3[4]_net_1\, Y => \ret_state0[4]_net_1\);
    
    un1_del_cntr1_I_43 : XOR2
      port map(A => \del_cntr1[11]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[11]\);
    
    \sequencer_state0_maj_RNID76E[1]\ : NOR2
      port map(A => \sequencer_state0[1]_net_1\, B => 
        \sequencer_state0[0]_net_1\, Y => N_353);
    
    \ret_state1_maj_RNI5OL63[0]\ : NOR3C
      port map(A => N_254_1, B => N_238_i, C => N_271, Y => N_255);
    
    un1_del_cntr1_I_18 : AND2
      port map(A => \del_cntr1[1]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\);
    
    \sequencer_state0_maj_RNIE4GO6[5]\ : OA1C
      port map(A => \sequencer_state0[4]_net_1\, B => N_340, C
         => \sequencer_state0[5]_net_1\, Y => N_357);
    
    \sequencer_state0_maj_RNIU9DU[5]\ : NOR2A
      port map(A => N_371, B => \sequencer_state0[5]_net_1\, Y
         => N_358_1);
    
    \sequencer_state1_maj_RNIM20GP[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_49_5, Y => 
        \n_del_cntr1[6]\);
    
    un1_del_cntr1_I_48 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[11]\, B => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\, Y => I_48_5);
    
    \del_cntr0_maj[2]\ : MAJ3
      port map(A => \del_cntr0_0[2]\, B => 
        \del_cntr0_tmr2[2]_net_1\, C => \del_cntr0_tmr3[2]_net_1\, 
        Y => \del_cntr0[2]_net_1\);
    
    \main_sequencer.un2_n_ch_out1\ : NOR3C
      port map(A => N_68, B => channels_desired_on(8), C => 
        dtycyc_en, Y => un2_n_ch_out1);
    
    \ret_state0_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIUCU01[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3[0]_net_1\);
    
    \del_cntr1_maj[8]\ : MAJ3
      port map(A => \del_cntr1_0[8]\, B => 
        \del_cntr1_tmr2[8]_net_1\, C => \del_cntr1_tmr3[8]_net_1\, 
        Y => \del_cntr1[8]_net_1\);
    
    \sequencer_state1_maj_RNI0AP931[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_57_5, Y => 
        \n_del_cntr1[8]\);
    
    \del_cntr0_maj_RNITNHS1[0]\ : NOR3C
      port map(A => un5_del_cntr0_2, B => un5_del_cntr0_1, C => 
        un5_del_cntr0_7, Y => un5_del_cntr0_11);
    
    un1_del_cntr1_I_27 : XOR2
      port map(A => \del_cntr1[11]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\);
    
    \del_cntr1_tmr3[6]\ : DFN1P0
      port map(D => \n_del_cntr1[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[6]_net_1\);
    
    \ch_out0[0]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIV2042[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0[0]_net_1\);
    
    un1_del_cntr0_I_80 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_4_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_5_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_2_0[0]\);
    
    \del_cntr0_tmr2[1]\ : DFN1P0
      port map(D => \n_del_cntr0[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2[1]_net_1\);
    
    \del_cntr1_tmr3[14]\ : DFN1P0
      port map(D => \n_del_cntr1[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[14]_net_1\);
    
    \del_cntr0[6]\ : DFN1P0
      port map(D => \n_del_cntr0[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[6]\);
    
    \sequencer_state0_maj[2]\ : MAJ3
      port map(A => \sequencer_state0_0[2]\, B => 
        \sequencer_state0_tmr2[2]_net_1\, C => 
        \sequencer_state0_tmr3[2]_net_1\, Y => 
        \sequencer_state0[2]_net_1\);
    
    \del_cntr1_maj[11]\ : MAJ3
      port map(A => \del_cntr1_0[11]\, B => 
        \del_cntr1_tmr2[11]_net_1\, C => 
        \del_cntr1_tmr3[11]_net_1\, Y => \del_cntr1[11]_net_1\);
    
    \sequencer_state0_maj_RNIVDU01[1]\ : NOR3
      port map(A => \sequencer_state0[3]_net_1\, B => 
        \sequencer_state0[1]_net_1\, C => N_367, Y => 
        \sequencer_state0_maj_RNIVDU01[1]_net_1\);
    
    \ret_state1_maj_RNIPR2C7[0]\ : NOR3C
      port map(A => un6_del_cntr1, B => 
        \sequencer_state1_ns_a2_2_0[0]\, C => 
        \sequencer_state1_ns_a2_0_1[0]\, Y => N_251);
    
    \ret_state0[2]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNI0FU01[3]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_0[2]\);
    
    \sequencer_state0[2]\ : DFN1C0
      port map(D => \sequencer_state0_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_0[2]\);
    
    \sequencer_state0_maj_RNIF3OI[2]\ : NOR2
      port map(A => \sequencer_state0[2]_net_1\, B => 
        \ret_state0[1]_net_1\, Y => N_367);
    
    \del_cntr1_tmr3[9]\ : DFN1P0
      port map(D => \n_del_cntr1[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[9]_net_1\);
    
    \del_cntr1_maj_RNIVKGJ[14]\ : NOR3
      port map(A => \del_cntr1[1]_net_1\, B => 
        \del_cntr1[14]_net_1\, C => \del_cntr1[13]_net_1\, Y => 
        un6_del_cntr1_7);
    
    \ch_out1_tmr3[0]\ : DFN1C0
      port map(D => \ch_out1_maj_RNI51LI2[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ch_out1_tmr3[0]_net_1\);
    
    un1_del_cntr0_I_50 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[12]\, B => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, Y => I_50_6);
    
    \del_cntr0[3]\ : DFN1P0
      port map(D => \n_del_cntr0[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_0[3]\);
    
    \sequencer_state1_maj_RNI29JF1[2]\ : NOR3
      port map(A => \sequencer_state1[3]_net_1\, B => 
        \sequencer_state1[2]_net_1\, C => N_264, Y => 
        \sequencer_state1_maj_RNI29JF1[2]_net_1\);
    
    un1_del_cntr1_I_35 : XOR2
      port map(A => \del_cntr1[7]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[7]\);
    
    \sequencer_state0_tmr3[4]\ : DFN1C0
      port map(D => \sequencer_state0_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state0_tmr3[4]_net_1\);
    
    \sequencer_state0_maj_RNIGIB9C[5]\ : NOR3A
      port map(A => channels_ready(7), B => 
        \sequencer_state0_ns_i_0[2]\, C => N_357, Y => 
        \sequencer_state0_maj_RNIGIB9C[5]_net_1\);
    
    un1_del_cntr0_I_13 : AND2
      port map(A => \del_cntr0[12]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\);
    
    \sequencer_state0_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state0_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => 
        \sequencer_state0_tmr3[1]_net_1\);
    
    un1_del_cntr0_I_70 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1_0[0]\);
    
    un1_del_cntr0_I_46 : XOR2
      port map(A => \del_cntr0[6]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[6]\);
    
    un1_del_cntr0_I_34 : XOR2
      port map(A => \del_cntr0[4]_net_1\, B => 
        \sequencer_state0_maj_RNIC3ST_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[4]\);
    
    \ret_state0_tmr2[3]\ : DFN1C0
      port map(D => \ret_state0_maj_RNI4JU01[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2[3]_net_1\);
    
    un1_del_cntr0_I_18 : AND2
      port map(A => \del_cntr0[1]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_1_0[0]\);
    
    un1_del_cntr1_I_73 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_12[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\);
    
    un1_del_cntr1_I_64 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0[0]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1[0]\);
    
    \sequencer_state0[3]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIGIB9C[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state0_0[3]\);
    
    un1_del_cntr1_I_10 : AND2
      port map(A => \del_cntr1[4]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\);
    
    un1_del_cntr1_I_57 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[8]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, Y => I_57_5);
    
    \del_cntr0_maj_RNI6MB44[5]\ : NOR3C
      port map(A => un5_del_cntr0_10, B => un5_del_cntr0_9, C => 
        un5_del_cntr0_11, Y => un5_del_cntr0);
    
    \sequencer_state0_maj[1]\ : MAJ3
      port map(A => \sequencer_state0_0[1]\, B => 
        \sequencer_state0_tmr2[1]_net_1\, C => 
        \sequencer_state0_tmr3[1]_net_1\, Y => 
        \sequencer_state0[1]_net_1\);
    
    un1_del_cntr1_I_40 : XOR2
      port map(A => \del_cntr1[8]_net_1\, B => 
        \sequencer_state1_maj_RNIFCH11_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[8]\);
    
    \sequencer_state1_maj[1]\ : MAJ3
      port map(A => \sequencer_state1_0[1]\, B => 
        \sequencer_state1_tmr2[1]_net_1\, C => 
        \sequencer_state1_tmr3[1]_net_1\, Y => 
        \sequencer_state1[1]_net_1\);
    
    un1_del_cntr1_I_78 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\);
    
    \sequencer_state1_maj_RNIICOFB[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_52_5, Y => 
        \n_del_cntr1[2]\);
    
    \sequencer_state1_maj_RNIFLGL[1]\ : NOR2
      port map(A => \sequencer_state1[1]_net_1\, B => 
        \sequencer_state1[0]_net_1\, Y => N_249);
    
    \ret_state1_tmr3[3]\ : DFN1C0
      port map(D => \ret_state1_maj_RNI8FJF1[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3[3]_net_1\);
    
    \del_cntr1_tmr3[8]\ : DFN1P0
      port map(D => \n_del_cntr1[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3[8]_net_1\);
    
    un1_del_cntr1_I_83 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_3[0]\);
    
    \del_cntr1_tmr2[13]\ : DFN1P0
      port map(D => \n_del_cntr1[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2[13]_net_1\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity IIR_FILT_4 is

    port( IN_INVOLTAGE_OK_c_0    : in    std_logic;
          channel_involtage_ok_0 : out   std_logic;
          master_rst_b           : in    std_logic;
          clk_5m_gl              : in    std_logic
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

  component NOR3C
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

  component XA1A
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

  component AO1A
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

  component MX2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
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

  component AO1
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

    signal n_sigout15lto7_2, \FILT_OUT[3]_net_1\, 
        \FILT_OUT[7]_net_1\, \FILT_OUT[5]_net_1\, 
        n_sigout15lto7_1, \FILT_OUT[6]_net_1\, 
        \FILT_OUT[4]_net_1\, n_sigout3lto6_1, n_sigout3lto6_0, 
        N_23_i, i10_mux, N_27_i, i6_mux, N_29_i, i4_mux, N_31_i, 
        \FILT_OUT[2]_net_1\, i2_mux, N_33_i, \FILT_OUT[0]_net_1\, 
        \FILT_OUT[1]_net_1\, ADD_4x4_slow_I1_S, I0_un1_CO1, 
        \SUM_IN_A[5]_net_1\, N70, n_sigout3, 
        \THRESH_VAL_maj_RNIGSQQ3[1]_net_1\, \THRESH_VAL[1]_net_1\, 
        N_113, \THRESH_VAL_ns[0]\, \THRESH_VAL[0]_net_1\, N_93, 
        N_95, ADD_4x4_slow_I2_S, i12_mux, ADD_4x4_slow_I0_S, 
        i8_mux, N_40, \SUM_IN_A[4]_net_1\, ADD_4x4_slow_I3_Y, 
        \SIGOUT_maj_RNIP3JL5\, \channel_involtage_ok[1]\, 
        \SIG_IN_DEL_maj_RNIADDD\, \SIG_IN_DEL\, 
        \SIG_IN_DEL_maj_RNIADDD_0\, \FILT_OUT_3[7]\, 
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
        \THRESH_VAL_tmr3_3[0]\, SIGOUT_3, SIGOUT_tmr2_3, 
        SIGOUT_tmr3_3, SIG_IN_DEL_3, SIG_IN_DEL_tmr2_3, 
        SIG_IN_DEL_tmr3_3, \GND\, \VCC\ : std_logic;

begin 

    channel_involtage_ok_0 <= \channel_involtage_ok[1]\;

    \FILT_OUT[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \FILT_OUT_3[4]\);
    
    SIGOUT_tmr2 : DFN1C0
      port map(D => \SIGOUT_maj_RNIP3JL5\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIGOUT_tmr2_3);
    
    \THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIGSQQ3[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \THRESH_VAL_tmr2_3[1]\);
    
    \SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIADDD_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr2_3[5]\);
    
    \THRESH_VAL_maj_RNI8EDT1[1]\ : NOR3C
      port map(A => n_sigout15lto7_1, B => n_sigout15lto7_2, C
         => \THRESH_VAL[1]_net_1\, Y => N_113);
    
    \FILT_OUT[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \FILT_OUT_3[6]\);
    
    \THRESH_VAL[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_3[0]\);
    
    SIGOUT_tmr3 : DFN1C0
      port map(D => \SIGOUT_maj_RNIP3JL5\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIGOUT_tmr3_3);
    
    \THRESH_VAL_maj_RNIGSQQ3[1]\ : OA1B
      port map(A => n_sigout3, B => \THRESH_VAL[1]_net_1\, C => 
        N_113, Y => \THRESH_VAL_maj_RNIGSQQ3[1]_net_1\);
    
    un2_n_filt_out_ADD_4x4_slow_I0_un1_CO1 : XA1A
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => I0_un1_CO1);
    
    un1_tmp_sum_in_b_0_m22 : XNOR3
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => i10_mux, Y => N_23_i);
    
    \THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_tmr3_3[0]\);
    
    \FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \FILT_OUT_tmr2_3[7]\);
    
    \FILT_OUT_maj[3]\ : MAJ3
      port map(A => \FILT_OUT_3[3]\, B => \FILT_OUT_tmr2_3[3]\, C
         => \FILT_OUT_tmr3_3[3]\, Y => \FILT_OUT[3]_net_1\);
    
    \FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_3[3]\);
    
    un2_n_filt_out_ADD_4x4_slow_I1_S : XOR3
      port map(A => I0_un1_CO1, B => \SUM_IN_A[5]_net_1\, C => 
        N_23_i, Y => ADD_4x4_slow_I1_S);
    
    un2_n_filt_out_ADD_4x4_slow_I1_CO1 : MAJ3
      port map(A => I0_un1_CO1, B => N_23_i, C => 
        \SUM_IN_A[5]_net_1\, Y => N70);
    
    \FILT_OUT_maj[6]\ : MAJ3
      port map(A => \FILT_OUT_3[6]\, B => \FILT_OUT_tmr2_3[6]\, C
         => \FILT_OUT_tmr3_3[6]\, Y => \FILT_OUT[6]_net_1\);
    
    \SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \SUM_IN_A_3[4]\, B => \SUM_IN_A_tmr2_3[4]\, C
         => \SUM_IN_A_tmr3_3[4]\, Y => \SUM_IN_A[4]_net_1\);
    
    \FILT_OUT[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_3[1]\);
    
    SIG_IN_DEL_maj_RNIADDD : XOR2
      port map(A => IN_INVOLTAGE_OK_c_0, B => \SIG_IN_DEL\, Y => 
        \SIG_IN_DEL_maj_RNIADDD\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    SIG_IN_DEL_maj_RNIADDD_0 : NOR2B
      port map(A => \SIG_IN_DEL\, B => IN_INVOLTAGE_OK_c_0, Y => 
        \SIG_IN_DEL_maj_RNIADDD_0\);
    
    \FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \FILT_OUT_tmr2_3[5]\);
    
    \FILT_OUT_maj_RNILCLK[3]\ : NOR2B
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[6]_net_1\, 
        Y => n_sigout3lto6_0);
    
    \SUM_IN_A[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIADDD_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_3[5]\);
    
    \FILT_OUT[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_3[2]\);
    
    SIG_IN_DEL : DFN1C0
      port map(D => IN_INVOLTAGE_OK_c_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIG_IN_DEL_3);
    
    \FILT_OUT_maj_RNILCLK[4]\ : NOR2B
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => n_sigout3lto6_1);
    
    \THRESH_VAL_maj_RNIFRQQ3_0[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_95, Y => N_93);
    
    \FILT_OUT[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \FILT_OUT_3[7]\);
    
    \FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_3[2]\);
    
    un2_n_filt_out_ADD_4x4_slow_I3_Y : AO13
      port map(A => N70, B => \FILT_OUT[7]_net_1\, C => i12_mux, 
        Y => ADD_4x4_slow_I3_Y);
    
    \FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \FILT_OUT_tmr2_3[4]\);
    
    un1_tmp_sum_in_b_0_m13 : AO18
      port map(A => \FILT_OUT[4]_net_1\, B => i6_mux, C => 
        \FILT_OUT[5]_net_1\, Y => i8_mux);
    
    \FILT_OUT[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_3[0]\);
    
    SIG_IN_DEL_tmr2 : DFN1C0
      port map(D => IN_INVOLTAGE_OK_c_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIG_IN_DEL_tmr2_3);
    
    SIGOUT_maj : MAJ3
      port map(A => SIGOUT_3, B => SIGOUT_tmr2_3, C => 
        SIGOUT_tmr3_3, Y => \channel_involtage_ok[1]\);
    
    un1_tmp_sum_in_b_0_m4 : OAI1
      port map(A => \FILT_OUT[2]_net_1\, B => \FILT_OUT[0]_net_1\, 
        C => \FILT_OUT[1]_net_1\, Y => i2_mux);
    
    \FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_3[1]\);
    
    SIGOUT_maj_RNIP3JL5 : MX2
      port map(A => n_sigout3, B => \channel_involtage_ok[1]\, S
         => N_93, Y => \SIGOUT_maj_RNIP3JL5\);
    
    \FILT_OUT_maj_RNIH40V[3]\ : NOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => \FILT_OUT[5]_net_1\, Y => n_sigout15lto7_2);
    
    \FILT_OUT[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_3[3]\);
    
    \THRESH_VAL[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIGSQQ3[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \THRESH_VAL_3[1]\);
    
    \THRESH_VAL_maj_RNI8EDT1_0[1]\ : AOI1B
      port map(A => n_sigout15lto7_2, B => n_sigout15lto7_1, C
         => \THRESH_VAL[1]_net_1\, Y => N_95);
    
    un1_tmp_sum_in_b_0_m16 : AO18
      port map(A => \FILT_OUT[5]_net_1\, B => i8_mux, C => 
        \FILT_OUT[6]_net_1\, Y => i10_mux);
    
    \FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \FILT_OUT_tmr2_3[6]\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_tmp_sum_in_b_0_m26 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[5]_net_1\, 
        C => i6_mux, Y => N_27_i);
    
    un1_tmp_sum_in_b_0_m19 : AO18
      port map(A => \FILT_OUT[6]_net_1\, B => i10_mux, C => 
        \FILT_OUT[7]_net_1\, Y => i12_mux);
    
    \THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIGSQQ3[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \THRESH_VAL_tmr3_3[1]\);
    
    \FILT_OUT_maj_RNIMDLK[4]\ : NOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout15lto7_1);
    
    un1_tmp_sum_in_b_0_m30 : XNOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[2]_net_1\, 
        C => i2_mux, Y => N_31_i);
    
    \SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIADDD\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr2_3[4]\);
    
    \FILT_OUT_maj[7]\ : MAJ3
      port map(A => \FILT_OUT_3[7]\, B => \FILT_OUT_tmr2_3[7]\, C
         => \FILT_OUT_tmr3_3[7]\, Y => \FILT_OUT[7]_net_1\);
    
    un1_tmp_sum_in_b_0_m15 : XOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => N_40);
    
    \FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \FILT_OUT_tmr3_3[6]\);
    
    \SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIADDD\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr3_3[4]\);
    
    un1_tmp_sum_in_b_0_m7 : AO18
      port map(A => \FILT_OUT[2]_net_1\, B => i2_mux, C => 
        \FILT_OUT[3]_net_1\, Y => i4_mux);
    
    un1_tmp_sum_in_b_0_m28 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[3]_net_1\, 
        C => i4_mux, Y => N_29_i);
    
    SIG_IN_DEL_tmr3 : DFN1C0
      port map(D => IN_INVOLTAGE_OK_c_0, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIG_IN_DEL_tmr3_3);
    
    SIGOUT : DFN1C0
      port map(D => \SIGOUT_maj_RNIP3JL5\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => SIGOUT_3);
    
    \THRESH_VAL_maj_RNIFRQQ3[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_113, Y => \THRESH_VAL_ns[0]\);
    
    \FILT_OUT_maj_RNI7ILJ1[7]\ : AO1
      port map(A => n_sigout3lto6_1, B => n_sigout3lto6_0, C => 
        \FILT_OUT[7]_net_1\, Y => n_sigout3);
    
    \FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \FILT_OUT_tmr3_3[7]\);
    
    \FILT_OUT_maj[5]\ : MAJ3
      port map(A => \FILT_OUT_3[5]\, B => \FILT_OUT_tmr2_3[5]\, C
         => \FILT_OUT_tmr3_3[5]\, Y => \FILT_OUT[5]_net_1\);
    
    \FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_3[3]\);
    
    \THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \THRESH_VAL_3[1]\, B => 
        \THRESH_VAL_tmr2_3[1]\, C => \THRESH_VAL_tmr3_3[1]\, Y
         => \THRESH_VAL[1]_net_1\);
    
    \FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_3[2]\);
    
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
    
    un2_n_filt_out_ADD_4x4_slow_I2_S : XNOR3
      port map(A => \FILT_OUT[7]_net_1\, B => i12_mux, C => N70, 
        Y => ADD_4x4_slow_I2_S);
    
    \SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIADDD_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr3_3[5]\);
    
    \THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_tmr2_3[0]\);
    
    \THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \THRESH_VAL_3[0]\, B => 
        \THRESH_VAL_tmr2_3[0]\, C => \THRESH_VAL_tmr3_3[0]\, Y
         => \THRESH_VAL[0]_net_1\);
    
    \FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_3[1]\);
    
    \FILT_OUT[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \FILT_OUT_3[5]\);
    
    un1_tmp_sum_in_b_0_m10 : AO18
      port map(A => \FILT_OUT[3]_net_1\, B => i4_mux, C => 
        \FILT_OUT[4]_net_1\, Y => i6_mux);
    
    \FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3_3[0]\);
    
    \FILT_OUT_maj[2]\ : MAJ3
      port map(A => \FILT_OUT_3[2]\, B => \FILT_OUT_tmr2_3[2]\, C
         => \FILT_OUT_tmr3_3[2]\, Y => \FILT_OUT[2]_net_1\);
    
    un2_n_filt_out_ADD_4x4_slow_I0_S : XNOR3
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => ADD_4x4_slow_I0_S);
    
    \FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \FILT_OUT_tmr3_3[4]\);
    
    SIG_IN_DEL_maj : MAJ3
      port map(A => SIG_IN_DEL_3, B => SIG_IN_DEL_tmr2_3, C => 
        SIG_IN_DEL_tmr3_3, Y => \SIG_IN_DEL\);
    
    \FILT_OUT_maj[4]\ : MAJ3
      port map(A => \FILT_OUT_3[4]\, B => \FILT_OUT_tmr2_3[4]\, C
         => \FILT_OUT_tmr3_3[4]\, Y => \FILT_OUT[4]_net_1\);
    
    \SUM_IN_A[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNIADDD\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_3[4]\);
    
    \FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \FILT_OUT_tmr3_3[5]\);
    
    \FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2_3[0]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity SLOW_PULSE_EN_GEN is

    port( N_210_i      : out   std_logic;
          master_rst_b : in    std_logic;
          clk_5m_gl    : in    std_logic
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

  component NOR2B
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

  component NOR2A
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

  component NOR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component AX1C
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

  component OA1B
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

    signal CNT_VAL_41_0, \CNT_VAL[19]_net_1\, un9_cnt_val, 
        un9_cnt_vallto19_0, \CNT_VAL[18]_net_1\, 
        un9_cnt_vallto17_0, \CNT_VAL[16]_net_1\, 
        \CNT_VAL[17]_net_1\, un9_cnt_vallto15_1, 
        \CNT_VAL[14]_net_1\, \CNT_VAL[13]_net_1\, 
        \CNT_VAL[15]_net_1\, un9_cnt_vallto11_0, 
        \CNT_VAL[10]_net_1\, \CNT_VAL[11]_net_1\, 
        un9_cnt_vallto7_0, \CNT_VAL[6]_net_1\, \CNT_VAL[7]_net_1\, 
        un9_cnt_vallto5_0, \CNT_VAL[4]_net_1\, \CNT_VAL[5]_net_1\, 
        un9_cnt_vallt20, un9_cnt_vallt17, \CNT_VAL[12]_net_1\, 
        un9_cnt_vallt12, \CNT_VAL[9]_net_1\, un9_cnt_vallt9, 
        un9_cnt_vallt7, CNT_VAL_c2, \CNT_VAL[3]_net_1\, 
        CNT_VAL_n19, CNT_VAL_c18, CNT_VAL_n18, CNT_VAL_c17, 
        CNT_VAL_n17, CNT_VAL_c16, CNT_VAL_n16, CNT_VAL_c15, 
        CNT_VAL_n15, CNT_VAL_c14, CNT_VAL_n14, CNT_VAL_c13, 
        CNT_VAL_n13, CNT_VAL_c12, CNT_VAL_n12, CNT_VAL_n12_tz, 
        CNT_VAL_c10, CNT_VAL_n11, CNT_VAL_n11_tz, CNT_VAL_n10, 
        CNT_VAL_n10_tz, CNT_VAL_c8, CNT_VAL_n9, CNT_VAL_n9_tz, 
        CNT_VAL_n8, CNT_VAL_n8_tz, CNT_VAL_c6, \CNT_VAL[8]_net_1\, 
        CNT_VAL_n7, CNT_VAL_n7_tz, CNT_VAL_n6, CNT_VAL_n6_tz, 
        CNT_VAL_c4, CNT_VAL_n5, CNT_VAL_n5_tz, CNT_VAL_n4, 
        CNT_VAL_n4_tz, CNT_VAL_n3, CNT_VAL_n3_tz, CNT_VAL_n2, 
        CNT_VAL_n2_tz, \CNT_VAL[1]_net_1\, \CNT_VAL[0]_net_1\, 
        \CNT_VAL[2]_net_1\, CNT_VAL_n20, N_149, CNT_VAL_n1, 
        CNT_VAL_n0, \CNT_VAL[20]_net_1\, \CNT_VAL_0[20]\, 
        \CNT_VAL_tmr2[20]_net_1\, \CNT_VAL_tmr3[20]_net_1\, 
        \CNT_VAL_0[19]\, \CNT_VAL_tmr2[19]_net_1\, 
        \CNT_VAL_tmr3[19]_net_1\, \CNT_VAL_0[18]\, 
        \CNT_VAL_tmr2[18]_net_1\, \CNT_VAL_tmr3[18]_net_1\, 
        \CNT_VAL_0[17]\, \CNT_VAL_tmr2[17]_net_1\, 
        \CNT_VAL_tmr3[17]_net_1\, \CNT_VAL_0[16]\, 
        \CNT_VAL_tmr2[16]_net_1\, \CNT_VAL_tmr3[16]_net_1\, 
        \CNT_VAL_0[15]\, \CNT_VAL_tmr2[15]_net_1\, 
        \CNT_VAL_tmr3[15]_net_1\, \CNT_VAL_0[14]\, 
        \CNT_VAL_tmr2[14]_net_1\, \CNT_VAL_tmr3[14]_net_1\, 
        \CNT_VAL_0[13]\, \CNT_VAL_tmr2[13]_net_1\, 
        \CNT_VAL_tmr3[13]_net_1\, \CNT_VAL_0[12]\, 
        \CNT_VAL_tmr2[12]_net_1\, \CNT_VAL_tmr3[12]_net_1\, 
        \CNT_VAL_0[11]\, \CNT_VAL_tmr2[11]_net_1\, 
        \CNT_VAL_tmr3[11]_net_1\, \CNT_VAL_0[10]\, 
        \CNT_VAL_tmr2[10]_net_1\, \CNT_VAL_tmr3[10]_net_1\, 
        \CNT_VAL_0[9]\, \CNT_VAL_tmr2[9]_net_1\, 
        \CNT_VAL_tmr3[9]_net_1\, \CNT_VAL_0[8]\, 
        \CNT_VAL_tmr2[8]_net_1\, \CNT_VAL_tmr3[8]_net_1\, 
        \CNT_VAL_0[7]\, \CNT_VAL_tmr2[7]_net_1\, 
        \CNT_VAL_tmr3[7]_net_1\, \CNT_VAL_0[6]\, 
        \CNT_VAL_tmr2[6]_net_1\, \CNT_VAL_tmr3[6]_net_1\, 
        \CNT_VAL_0[5]\, \CNT_VAL_tmr2[5]_net_1\, 
        \CNT_VAL_tmr3[5]_net_1\, \CNT_VAL_0[4]\, 
        \CNT_VAL_tmr2[4]_net_1\, \CNT_VAL_tmr3[4]_net_1\, 
        \CNT_VAL_0[3]\, \CNT_VAL_tmr2[3]_net_1\, 
        \CNT_VAL_tmr3[3]_net_1\, \CNT_VAL_0[2]\, 
        \CNT_VAL_tmr2[2]_net_1\, \CNT_VAL_tmr3[2]_net_1\, 
        \CNT_VAL_0[1]\, \CNT_VAL_tmr2[1]_net_1\, 
        \CNT_VAL_tmr3[1]_net_1\, \CNT_VAL_0[0]\, 
        \CNT_VAL_tmr2[0]_net_1\, \CNT_VAL_tmr3[0]_net_1\, 
        \MS250_CLK_EN_SIG\, \MS250_CLK_EN_SIG_tmr2\, 
        \MS250_CLK_EN_SIG_tmr3\, \GND\, \VCC\ : std_logic;

begin 


    \CNT_VAL_tmr3[7]\ : DFN1C0
      port map(D => CNT_VAL_n7, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[7]_net_1\);
    
    \CNT_VAL_maj[16]\ : MAJ3
      port map(A => \CNT_VAL_0[16]\, B => 
        \CNT_VAL_tmr2[16]_net_1\, C => \CNT_VAL_tmr3[16]_net_1\, 
        Y => \CNT_VAL[16]_net_1\);
    
    \CNT_VAL_tmr3[2]\ : DFN1C0
      port map(D => CNT_VAL_n2, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[2]_net_1\);
    
    \CNT_VAL_maj_RNITJNO4[18]\ : NOR2B
      port map(A => CNT_VAL_c17, B => \CNT_VAL[18]_net_1\, Y => 
        CNT_VAL_c18);
    
    \CNT_VAL[3]\ : DFN1C0
      port map(D => CNT_VAL_n3, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[3]\);
    
    \CNT_VAL_maj[11]\ : MAJ3
      port map(A => \CNT_VAL_0[11]\, B => 
        \CNT_VAL_tmr2[11]_net_1\, C => \CNT_VAL_tmr3[11]_net_1\, 
        Y => \CNT_VAL[11]_net_1\);
    
    \CNT_VAL_maj[15]\ : MAJ3
      port map(A => \CNT_VAL_0[15]\, B => 
        \CNT_VAL_tmr2[15]_net_1\, C => \CNT_VAL_tmr3[15]_net_1\, 
        Y => \CNT_VAL[15]_net_1\);
    
    \CNT_VAL_maj_RNI61I69[14]\ : XA1B
      port map(A => \CNT_VAL[14]_net_1\, B => CNT_VAL_c13, C => 
        un9_cnt_val, Y => CNT_VAL_n14);
    
    \CNT_VAL_tmr2[10]\ : DFN1C0
      port map(D => CNT_VAL_n10, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[10]_net_1\);
    
    \CNT_VAL_maj[8]\ : MAJ3
      port map(A => \CNT_VAL_0[8]\, B => \CNT_VAL_tmr2[8]_net_1\, 
        C => \CNT_VAL_tmr3[8]_net_1\, Y => \CNT_VAL[8]_net_1\);
    
    \CNT_VAL_tmr2[18]\ : DFN1C0
      port map(D => CNT_VAL_n18, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[18]_net_1\);
    
    \CNT_VAL_maj_RNIOVR08[8]\ : NOR2A
      port map(A => CNT_VAL_n8_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n8);
    
    \CNT_VAL_maj_RNIIBA84[12]\ : OA1A
      port map(A => \CNT_VAL[12]_net_1\, B => un9_cnt_vallt12, C
         => un9_cnt_vallto15_1, Y => un9_cnt_vallt17);
    
    \CNT_VAL[17]\ : DFN1C0
      port map(D => CNT_VAL_n17, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[17]\);
    
    \CNT_VAL_maj_RNI6F1V[2]\ : NOR3C
      port map(A => \CNT_VAL[1]_net_1\, B => \CNT_VAL[0]_net_1\, 
        C => \CNT_VAL[2]_net_1\, Y => CNT_VAL_c2);
    
    \CNT_VAL_tmr2[5]\ : DFN1C0
      port map(D => CNT_VAL_n5, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[5]_net_1\);
    
    \CNT_VAL_tmr2[19]\ : DFN1C0
      port map(D => CNT_VAL_n19, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[19]_net_1\);
    
    \CNT_VAL_maj_RNIBMM35[20]\ : NOR2B
      port map(A => un9_cnt_vallt20, B => \CNT_VAL[20]_net_1\, Y
         => N_149);
    
    \CNT_VAL_maj[3]\ : MAJ3
      port map(A => \CNT_VAL_0[3]\, B => \CNT_VAL_tmr2[3]_net_1\, 
        C => \CNT_VAL_tmr3[3]_net_1\, Y => \CNT_VAL[3]_net_1\);
    
    \CNT_VAL_maj_RNIG1319[13]\ : XA1B
      port map(A => \CNT_VAL[13]_net_1\, B => CNT_VAL_c12, C => 
        un9_cnt_val, Y => CNT_VAL_n13);
    
    \CNT_VAL_tmr3[6]\ : DFN1C0
      port map(D => CNT_VAL_n6, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[6]_net_1\);
    
    \CNT_VAL_maj_RNISEEI3[9]\ : OA1A
      port map(A => \CNT_VAL[9]_net_1\, B => un9_cnt_vallt9, C
         => un9_cnt_vallto11_0, Y => un9_cnt_vallt12);
    
    \CNT_VAL[14]\ : DFN1C0
      port map(D => CNT_VAL_n14, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[14]\);
    
    \CNT_VAL_tmr2[16]\ : DFN1C0
      port map(D => CNT_VAL_n16, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[16]_net_1\);
    
    \CNT_VAL_maj[20]\ : MAJ3
      port map(A => \CNT_VAL_0[20]\, B => 
        \CNT_VAL_tmr2[20]_net_1\, C => \CNT_VAL_tmr3[20]_net_1\, 
        Y => \CNT_VAL[20]_net_1\);
    
    \CNT_VAL_maj_RNIFLMK[6]\ : OR2B
      port map(A => \CNT_VAL[6]_net_1\, B => \CNT_VAL[7]_net_1\, 
        Y => un9_cnt_vallto7_0);
    
    \CNT_VAL_tmr3[3]\ : DFN1C0
      port map(D => CNT_VAL_n3, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[3]_net_1\);
    
    \CNT_VAL_tmr2[8]\ : DFN1C0
      port map(D => CNT_VAL_n8, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[8]_net_1\);
    
    \CNT_VAL_maj_RNISEEI3[11]\ : XOR2
      port map(A => CNT_VAL_c10, B => \CNT_VAL[11]_net_1\, Y => 
        CNT_VAL_n11_tz);
    
    \CNT_VAL_tmr3[15]\ : DFN1C0
      port map(D => CNT_VAL_n15, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[15]_net_1\);
    
    \CNT_VAL_maj_RNI5OTA[10]\ : NOR2
      port map(A => \CNT_VAL[10]_net_1\, B => \CNT_VAL[11]_net_1\, 
        Y => un9_cnt_vallto11_0);
    
    \CNT_VAL_tmr2[2]\ : DFN1C0
      port map(D => CNT_VAL_n2, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[2]_net_1\);
    
    \CNT_VAL_maj[2]\ : MAJ3
      port map(A => \CNT_VAL_0[2]\, B => \CNT_VAL_tmr2[2]_net_1\, 
        C => \CNT_VAL_tmr3[2]_net_1\, Y => \CNT_VAL[2]_net_1\);
    
    \CNT_VAL_tmr3[13]\ : DFN1C0
      port map(D => CNT_VAL_n13, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[13]_net_1\);
    
    \CNT_VAL[7]\ : DFN1C0
      port map(D => CNT_VAL_n7, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[7]\);
    
    \CNT_VAL[15]\ : DFN1C0
      port map(D => CNT_VAL_n15, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[15]\);
    
    \CNT_VAL_tmr2[3]\ : DFN1C0
      port map(D => CNT_VAL_n3, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[3]_net_1\);
    
    \CNT_VAL_maj[13]\ : MAJ3
      port map(A => \CNT_VAL_0[13]\, B => 
        \CNT_VAL_tmr2[13]_net_1\, C => \CNT_VAL_tmr3[13]_net_1\, 
        Y => \CNT_VAL[13]_net_1\);
    
    \CNT_VAL_maj_RNI785C7[6]\ : NOR2A
      port map(A => CNT_VAL_n6_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n6);
    
    \CNT_VAL[11]\ : DFN1C0
      port map(D => CNT_VAL_n11, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[11]\);
    
    \CNT_VAL_tmr3[5]\ : DFN1C0
      port map(D => CNT_VAL_n5, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[5]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \CNT_VAL_maj_RNI9IVC3_0[10]\ : AX1C
      port map(A => \CNT_VAL[9]_net_1\, B => CNT_VAL_c8, C => 
        \CNT_VAL[10]_net_1\, Y => CNT_VAL_n10_tz);
    
    \CNT_VAL_tmr3[11]\ : DFN1C0
      port map(D => CNT_VAL_n11, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[11]_net_1\);
    
    \CNT_VAL_maj_RNINMG73[9]\ : XOR2
      port map(A => CNT_VAL_c8, B => \CNT_VAL[9]_net_1\, Y => 
        CNT_VAL_n9_tz);
    
    \CNT_VAL_maj_RNIL8UA[18]\ : NOR2
      port map(A => \CNT_VAL[18]_net_1\, B => \CNT_VAL[19]_net_1\, 
        Y => un9_cnt_vallto19_0);
    
    \CNT_VAL_maj[6]\ : MAJ3
      port map(A => \CNT_VAL_0[6]\, B => \CNT_VAL_tmr2[6]_net_1\, 
        C => \CNT_VAL_tmr3[6]_net_1\, Y => \CNT_VAL[6]_net_1\);
    
    \CNT_VAL_maj_RNISHE82[6]\ : NOR3C
      port map(A => \CNT_VAL[5]_net_1\, B => CNT_VAL_c4, C => 
        \CNT_VAL[6]_net_1\, Y => CNT_VAL_c6);
    
    \CNT_VAL[9]\ : DFN1C0
      port map(D => CNT_VAL_n9, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[9]\);
    
    \CNT_VAL_maj[17]\ : MAJ3
      port map(A => \CNT_VAL_0[17]\, B => 
        \CNT_VAL_tmr2[17]_net_1\, C => \CNT_VAL_tmr3[17]_net_1\, 
        Y => \CNT_VAL[17]_net_1\);
    
    \CNT_VAL[4]\ : DFN1C0
      port map(D => CNT_VAL_n4, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[4]\);
    
    MS250_CLK_EN_SIG_tmr2 : DFN1C0
      port map(D => un9_cnt_val, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \MS250_CLK_EN_SIG_tmr2\);
    
    \CNT_VAL[5]\ : DFN1C0
      port map(D => CNT_VAL_n5, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[5]\);
    
    \CNT_VAL_maj_RNIOO6U4[12]\ : OA1
      port map(A => un9_cnt_vallt17, B => un9_cnt_vallto17_0, C
         => un9_cnt_vallto19_0, Y => un9_cnt_vallt20);
    
    \CNT_VAL_maj_RNIEVCO5[1]\ : XA1B
      port map(A => \CNT_VAL[0]_net_1\, B => \CNT_VAL[1]_net_1\, 
        C => un9_cnt_val, Y => CNT_VAL_n1);
    
    \CNT_VAL_maj_RNIK8MG8[10]\ : NOR2A
      port map(A => CNT_VAL_n10_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n10);
    
    \CNT_VAL_maj_RNIFUNJ1[4]\ : NOR3C
      port map(A => \CNT_VAL[3]_net_1\, B => CNT_VAL_c2, C => 
        \CNT_VAL[4]_net_1\, Y => CNT_VAL_c4);
    
    \CNT_VAL_maj_RNICQ1E5[0]\ : NOR2
      port map(A => \CNT_VAL[0]_net_1\, B => un9_cnt_val, Y => 
        CNT_VAL_n0);
    
    \CNT_VAL_tmr3[1]\ : DFN1C0
      port map(D => CNT_VAL_n1, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[1]_net_1\);
    
    \CNT_VAL_maj_RNI3FT1A[19]\ : XA1B
      port map(A => \CNT_VAL[19]_net_1\, B => CNT_VAL_c18, C => 
        un9_cnt_val, Y => CNT_VAL_n19);
    
    \CNT_VAL_maj_RNIBMM35_0[20]\ : NOR2A
      port map(A => \CNT_VAL[20]_net_1\, B => un9_cnt_vallt20, Y
         => un9_cnt_val);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \CNT_VAL_maj[14]\ : MAJ3
      port map(A => \CNT_VAL_0[14]\, B => 
        \CNT_VAL_tmr2[14]_net_1\, C => \CNT_VAL_tmr3[14]_net_1\, 
        Y => \CNT_VAL[14]_net_1\);
    
    \CNT_VAL_tmr3[14]\ : DFN1C0
      port map(D => CNT_VAL_n14, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[14]_net_1\);
    
    \CNT_VAL_tmr3[20]\ : DFN1C0
      port map(D => CNT_VAL_n20, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[20]_net_1\);
    
    \CNT_VAL_maj_RNI2VCG[13]\ : NOR3
      port map(A => \CNT_VAL[14]_net_1\, B => \CNT_VAL[13]_net_1\, 
        C => \CNT_VAL[15]_net_1\, Y => un9_cnt_vallto15_1);
    
    \CNT_VAL_tmr2[20]\ : DFN1C0
      port map(D => CNT_VAL_n20, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[20]_net_1\);
    
    \CNT_VAL_maj_RNID95T2[8]\ : OA1B
      port map(A => un9_cnt_vallt7, B => un9_cnt_vallto7_0, C => 
        \CNT_VAL[8]_net_1\, Y => un9_cnt_vallt9);
    
    \CNT_VAL[18]\ : DFN1C0
      port map(D => CNT_VAL_n18, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[18]\);
    
    \CNT_VAL_maj_RNIE5K5F[19]\ : AX1C
      port map(A => CNT_VAL_c18, B => CNT_VAL_41_0, C => N_149, Y
         => CNT_VAL_n20);
    
    \CNT_VAL_maj_RNI4TPI2[7]\ : XOR2
      port map(A => CNT_VAL_c6, B => \CNT_VAL[7]_net_1\, Y => 
        CNT_VAL_n7_tz);
    
    \CNT_VAL_maj_RNIL3GH9[16]\ : XA1B
      port map(A => \CNT_VAL[16]_net_1\, B => CNT_VAL_c15, C => 
        un9_cnt_val, Y => CNT_VAL_n16);
    
    \CNT_VAL_tmr3[12]\ : DFN1C0
      port map(D => CNT_VAL_n12, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[12]_net_1\);
    
    \CNT_VAL_maj_RNIH5O26[2]\ : NOR2A
      port map(A => CNT_VAL_n2_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n2);
    
    \CNT_VAL_maj_RNI755M8[11]\ : NOR2A
      port map(A => CNT_VAL_n11_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n11);
    
    \CNT_VAL_maj[10]\ : MAJ3
      port map(A => \CNT_VAL_0[10]\, B => 
        \CNT_VAL_tmr2[10]_net_1\, C => \CNT_VAL_tmr3[10]_net_1\, 
        Y => \CNT_VAL[10]_net_1\);
    
    \CNT_VAL[0]\ : DFN1C0
      port map(D => CNT_VAL_n0, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[0]\);
    
    \CNT_VAL[16]\ : DFN1C0
      port map(D => CNT_VAL_n16, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[16]\);
    
    \CNT_VAL_maj_RNIH4UA[16]\ : OR2B
      port map(A => \CNT_VAL[16]_net_1\, B => \CNT_VAL[17]_net_1\, 
        Y => un9_cnt_vallto17_0);
    
    \CNT_VAL_maj_RNIBHMK[4]\ : NOR2
      port map(A => \CNT_VAL[4]_net_1\, B => \CNT_VAL[5]_net_1\, 
        Y => un9_cnt_vallto5_0);
    
    \CNT_VAL_tmr2[1]\ : DFN1C0
      port map(D => CNT_VAL_n1, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[1]_net_1\);
    
    \CNT_VAL_maj_RNIR2KR8[12]\ : NOR2A
      port map(A => CNT_VAL_n12_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n12);
    
    \CNT_VAL_maj_RNIT11C9[15]\ : XA1B
      port map(A => \CNT_VAL[15]_net_1\, B => CNT_VAL_c14, C => 
        un9_cnt_val, Y => CNT_VAL_n15);
    
    \CNT_VAL[19]\ : DFN1C0
      port map(D => CNT_VAL_n19, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[19]\);
    
    \CNT_VAL_tmr2[6]\ : DFN1C0
      port map(D => CNT_VAL_n6, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[6]_net_1\);
    
    \CNT_VAL[12]\ : DFN1C0
      port map(D => CNT_VAL_n12, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[12]\);
    
    \CNT_VAL_tmr3[17]\ : DFN1C0
      port map(D => CNT_VAL_n17, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[17]_net_1\);
    
    MS250_CLK_EN_SIG_tmr3 : DFN1C0
      port map(D => un9_cnt_val, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \MS250_CLK_EN_SIG_tmr3\);
    
    \CNT_VAL_maj_RNIIBA84[15]\ : NOR2B
      port map(A => CNT_VAL_c14, B => \CNT_VAL[15]_net_1\, Y => 
        CNT_VAL_c15);
    
    \CNT_VAL_maj_RNIL73U1[3]\ : AOI1B
      port map(A => CNT_VAL_c2, B => \CNT_VAL[3]_net_1\, C => 
        un9_cnt_vallto5_0, Y => un9_cnt_vallt7);
    
    \CNT_VAL_tmr2[15]\ : DFN1C0
      port map(D => CNT_VAL_n15, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[15]_net_1\);
    
    \CNT_VAL_maj_RNIRAR24[14]\ : NOR2B
      port map(A => CNT_VAL_c13, B => \CNT_VAL[14]_net_1\, Y => 
        CNT_VAL_c14);
    
    \CNT_VAL_tmr3[0]\ : DFN1C0
      port map(D => CNT_VAL_n0, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[0]_net_1\);
    
    \CNT_VAL_maj_RNID95T2_0[8]\ : NOR3C
      port map(A => \CNT_VAL[7]_net_1\, B => CNT_VAL_c6, C => 
        \CNT_VAL[8]_net_1\, Y => CNT_VAL_c8);
    
    \CNT_VAL_tmr2[13]\ : DFN1C0
      port map(D => CNT_VAL_n13, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[13]_net_1\);
    
    \CNT_VAL_maj_RNIE6VM9[17]\ : XA1B
      port map(A => \CNT_VAL[17]_net_1\, B => CNT_VAL_c16, C => 
        un9_cnt_val, Y => CNT_VAL_n17);
    
    \CNT_VAL_maj_RNIGCTN3_0[12]\ : AX1C
      port map(A => \CNT_VAL[11]_net_1\, B => CNT_VAL_c10, C => 
        \CNT_VAL[12]_net_1\, Y => CNT_VAL_n12_tz);
    
    \CNT_VAL[6]\ : DFN1C0
      port map(D => CNT_VAL_n6, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[6]\);
    
    \CNT_VAL_tmr3[10]\ : DFN1C0
      port map(D => CNT_VAL_n10, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[10]_net_1\);
    
    \CNT_VAL_maj_RNISHE82_0[6]\ : AX1C
      port map(A => \CNT_VAL[5]_net_1\, B => CNT_VAL_c4, C => 
        \CNT_VAL[6]_net_1\, Y => CNT_VAL_n6_tz);
    
    \CNT_VAL_maj_RNIGCTN3[12]\ : NOR3C
      port map(A => \CNT_VAL[11]_net_1\, B => CNT_VAL_c10, C => 
        \CNT_VAL[12]_net_1\, Y => CNT_VAL_c12);
    
    \CNT_VAL_tmr3[18]\ : DFN1C0
      port map(D => CNT_VAL_n18, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[18]_net_1\);
    
    \CNT_VAL[10]\ : DFN1C0
      port map(D => CNT_VAL_n10, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[10]\);
    
    \CNT_VAL[2]\ : DFN1C0
      port map(D => CNT_VAL_n2, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[2]\);
    
    \CNT_VAL_tmr2[11]\ : DFN1C0
      port map(D => CNT_VAL_n11, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[11]_net_1\);
    
    MS250_CLK_EN_SIG_maj : MAJ3
      port map(A => \MS250_CLK_EN_SIG\, B => 
        \MS250_CLK_EN_SIG_tmr2\, C => \MS250_CLK_EN_SIG_tmr3\, Y
         => N_210_i);
    
    \CNT_VAL_tmr3[19]\ : DFN1C0
      port map(D => CNT_VAL_n19, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[19]_net_1\);
    
    \CNT_VAL_maj[4]\ : MAJ3
      port map(A => \CNT_VAL_0[4]\, B => \CNT_VAL_tmr2[4]_net_1\, 
        C => \CNT_VAL_tmr3[4]_net_1\, Y => \CNT_VAL[4]_net_1\);
    
    \CNT_VAL_maj[19]\ : MAJ3
      port map(A => \CNT_VAL_0[19]\, B => 
        \CNT_VAL_tmr2[19]_net_1\, C => \CNT_VAL_tmr3[19]_net_1\, 
        Y => \CNT_VAL[19]_net_1\);
    
    \CNT_VAL_maj_RNI2D7B8[9]\ : NOR2A
      port map(A => CNT_VAL_n9_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n9);
    
    \CNT_VAL_tmr3[8]\ : DFN1C0
      port map(D => CNT_VAL_n8, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[8]_net_1\);
    
    \CNT_VAL_maj_RNIL73U1[5]\ : XOR2
      port map(A => CNT_VAL_c4, B => \CNT_VAL[5]_net_1\, Y => 
        CNT_VAL_n5_tz);
    
    \CNT_VAL_tmr2[4]\ : DFN1C0
      port map(D => CNT_VAL_n4, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[4]_net_1\);
    
    \CNT_VAL_maj_RNIAMC91[3]\ : XOR2
      port map(A => CNT_VAL_c2, B => \CNT_VAL[3]_net_1\, Y => 
        CNT_VAL_n3_tz);
    
    \CNT_VAL_tmr3[16]\ : DFN1C0
      port map(D => CNT_VAL_n16, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[16]_net_1\);
    
    \CNT_VAL_maj[9]\ : MAJ3
      port map(A => \CNT_VAL_0[9]\, B => \CNT_VAL_tmr2[9]_net_1\, 
        C => \CNT_VAL_tmr3[9]_net_1\, Y => \CNT_VAL[9]_net_1\);
    
    \CNT_VAL_maj_RNI0UP17[5]\ : NOR2A
      port map(A => CNT_VAL_n5_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n5);
    
    \CNT_VAL_maj_RNILC3D6[3]\ : NOR2A
      port map(A => CNT_VAL_n3_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n3);
    
    \CNT_VAL[8]\ : DFN1C0
      port map(D => CNT_VAL_n8, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[8]\);
    
    \CNT_VAL[13]\ : DFN1C0
      port map(D => CNT_VAL_n13, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[13]\);
    
    \CNT_VAL_maj_RNIQKEN6[4]\ : NOR2A
      port map(A => CNT_VAL_n4_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n4);
    
    \CNT_VAL_maj_RNI3G8J4[17]\ : NOR2B
      port map(A => CNT_VAL_c16, B => \CNT_VAL[17]_net_1\, Y => 
        CNT_VAL_c17);
    
    \CNT_VAL_tmr3[9]\ : DFN1C0
      port map(D => CNT_VAL_n9, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[9]_net_1\);
    
    \CNT_VAL_tmr2[14]\ : DFN1C0
      port map(D => CNT_VAL_n14, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[14]_net_1\);
    
    \CNT_VAL_maj_RNID95T2_1[8]\ : AX1C
      port map(A => \CNT_VAL[7]_net_1\, B => CNT_VAL_c6, C => 
        \CNT_VAL[8]_net_1\, Y => CNT_VAL_n8_tz);
    
    \CNT_VAL_maj[12]\ : MAJ3
      port map(A => \CNT_VAL_0[12]\, B => 
        \CNT_VAL_tmr2[12]_net_1\, C => \CNT_VAL_tmr3[12]_net_1\, 
        Y => \CNT_VAL[12]_net_1\);
    
    \CNT_VAL_maj_RNI6R595[19]\ : NOR2A
      port map(A => \CNT_VAL[19]_net_1\, B => un9_cnt_val, Y => 
        CNT_VAL_41_0);
    
    \CNT_VAL_tmr2[7]\ : DFN1C0
      port map(D => CNT_VAL_n7, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[7]_net_1\);
    
    \CNT_VAL_maj_RNI8AES9[18]\ : XA1B
      port map(A => \CNT_VAL[18]_net_1\, B => CNT_VAL_c17, C => 
        un9_cnt_val, Y => CNT_VAL_n18);
    
    \CNT_VAL[1]\ : DFN1C0
      port map(D => CNT_VAL_n1, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[1]\);
    
    \CNT_VAL_maj[18]\ : MAJ3
      port map(A => \CNT_VAL_0[18]\, B => 
        \CNT_VAL_tmr2[18]_net_1\, C => \CNT_VAL_tmr3[18]_net_1\, 
        Y => \CNT_VAL[18]_net_1\);
    
    \CNT_VAL_maj_RNIADPD4[16]\ : NOR2B
      port map(A => CNT_VAL_c15, B => \CNT_VAL[16]_net_1\, Y => 
        CNT_VAL_c16);
    
    \CNT_VAL_maj_RNI9IVC3[10]\ : NOR3C
      port map(A => \CNT_VAL[9]_net_1\, B => CNT_VAL_c8, C => 
        \CNT_VAL[10]_net_1\, Y => CNT_VAL_c10);
    
    \CNT_VAL_maj_RNIFUNJ1_0[4]\ : AX1C
      port map(A => \CNT_VAL[3]_net_1\, B => CNT_VAL_c2, C => 
        \CNT_VAL[4]_net_1\, Y => CNT_VAL_n4_tz);
    
    \CNT_VAL_maj_RNI5BCT3[13]\ : NOR2B
      port map(A => CNT_VAL_c12, B => \CNT_VAL[13]_net_1\, Y => 
        CNT_VAL_c13);
    
    \CNT_VAL_maj[5]\ : MAJ3
      port map(A => \CNT_VAL_0[5]\, B => \CNT_VAL_tmr2[5]_net_1\, 
        C => \CNT_VAL_tmr3[5]_net_1\, Y => \CNT_VAL[5]_net_1\);
    
    \CNT_VAL_maj[7]\ : MAJ3
      port map(A => \CNT_VAL_0[7]\, B => \CNT_VAL_tmr2[7]_net_1\, 
        C => \CNT_VAL_tmr3[7]_net_1\, Y => \CNT_VAL[7]_net_1\);
    
    \CNT_VAL_maj_RNI6F1V_0[2]\ : AX1C
      port map(A => \CNT_VAL[1]_net_1\, B => \CNT_VAL[0]_net_1\, 
        C => \CNT_VAL[2]_net_1\, Y => CNT_VAL_n2_tz);
    
    \CNT_VAL_tmr3[4]\ : DFN1C0
      port map(D => CNT_VAL_n4, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr3[4]_net_1\);
    
    \CNT_VAL_tmr2[12]\ : DFN1C0
      port map(D => CNT_VAL_n12, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[12]_net_1\);
    
    \CNT_VAL_tmr2[9]\ : DFN1C0
      port map(D => CNT_VAL_n9, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[9]_net_1\);
    
    MS250_CLK_EN_SIG : DFN1C0
      port map(D => un9_cnt_val, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \MS250_CLK_EN_SIG\);
    
    \CNT_VAL_maj_RNIFJGM7[7]\ : NOR2A
      port map(A => CNT_VAL_n7_tz, B => un9_cnt_val, Y => 
        CNT_VAL_n7);
    
    \CNT_VAL_tmr2[17]\ : DFN1C0
      port map(D => CNT_VAL_n17, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[17]_net_1\);
    
    \CNT_VAL_maj[1]\ : MAJ3
      port map(A => \CNT_VAL_0[1]\, B => \CNT_VAL_tmr2[1]_net_1\, 
        C => \CNT_VAL_tmr3[1]_net_1\, Y => \CNT_VAL[1]_net_1\);
    
    \CNT_VAL_maj[0]\ : MAJ3
      port map(A => \CNT_VAL_0[0]\, B => \CNT_VAL_tmr2[0]_net_1\, 
        C => \CNT_VAL_tmr3[0]_net_1\, Y => \CNT_VAL[0]_net_1\);
    
    \CNT_VAL_tmr2[0]\ : DFN1C0
      port map(D => CNT_VAL_n0, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_tmr2[0]_net_1\);
    
    \CNT_VAL[20]\ : DFN1C0
      port map(D => CNT_VAL_n20, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \CNT_VAL_0[20]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity main_sequencer_new_3 is

    port( OUT_CHANNEL_VOSG_c          : out   std_logic_vector(2 downto 1);
          channels_desired_on         : in    std_logic_vector(2 downto 1);
          total_channel_constraints_0 : in    std_logic;
          ch_out1                     : out   std_logic_vector(2 downto 1);
          ch_mreg_en_0                : out   std_logic;
          ch_iaux_en_0                : out   std_logic;
          J11_DEBUG_c_c_0             : in    std_logic;
          channels_ready              : in    std_logic_vector(2 downto 1);
          master_rst_b                : in    std_logic;
          clk_5m_gl                   : in    std_logic;
          dtycyc_en                   : in    std_logic;
          N_7_0                       : in    std_logic
        );

end main_sequencer_new_3;

architecture DEF_ARCH of main_sequencer_new_3 is 

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
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

  component NOR3C
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

  component NOR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component AO1A
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

  component OA1A
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

  component XA1
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

  component MX2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
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

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
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

  component MX2C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_276_0, \sequencer_state1[0]_net_1\, N_380_0, 
        \sequencer_state0[0]_net_1\, 
        \sequencer_state0_ns_i_1[2]_net_1\, 
        \sequencer_state0_ns_i_0[2]\, 
        \sequencer_state0_ns_i[2]_net_1\, N_357, N_349, 
        \sequencer_state0[5]_net_1\, 
        \sequencer_state1_ns_a2_0[3]\, \ret_state1[2]_net_1\, 
        \ret_state1[1]_net_1\, \sequencer_state1_ns_a2_0[4]\, 
        \sequencer_state0_ns_a2_0[4]\, \ret_state0[1]_net_1\, 
        \ret_state0[2]_net_1\, \sequencer_state0_ns_a2_0[3]\, 
        \sequencer_state1_ns_a2_0_1[5]\, \ret_state1[0]_net_1\, 
        N_271, \ret_state1[5]_net_1\, 
        \sequencer_state0_ns_i_a2_0_0[2]\, N_374, N_359, 
        \sequencer_state1_ns_i_0[2]\, 
        \sequencer_state1_ns_i_a2_0_0[2]\, N_270, N_255, 
        \sequencer_state1_ns_0[1]\, \sequencer_state1[3]_net_1\, 
        N_243, \sequencer_state0_ns_a2_0_1[5]\, 
        \ret_state0[0]_net_1\, N_375, \ret_state0[5]_net_1\, 
        \sequencer_state0_ns_0[1]\, \sequencer_state0[3]_net_1\, 
        N_347, \sequencer_state1_ns_a2_0[0]\, 
        \sequencer_state1_ns_a2_0[1]\, 
        \sequencer_state1[4]_net_1\, N_236, 
        \sequencer_state0_ns_a2_0[0]\, 
        \sequencer_state0_ns_a2_0[1]\, un5_del_cntr0, N_370, 
        \sequencer_state0[4]_net_1\, 
        \sequencer_state0_ns_a2_0_1[0]\, 
        \sequencer_state1_ns_a2_0_1[0]\, 
        \sequencer_state0_ns_a2_2_0[0]\, \ret_state0[4]_net_1\, 
        \ret_state0[3]_net_1\, \sequencer_state1_ns_a2_2_0[0]\, 
        N_267, un5_del_cntr0_11, un5_del_cntr0_2, un5_del_cntr0_1, 
        un5_del_cntr0_7, un5_del_cntr0_10, un5_del_cntr0_6, 
        \del_cntr0[10]_net_1\, \del_cntr0[9]_net_1\, 
        un5_del_cntr0_9, un5_del_cntr0_4, \del_cntr0[6]_net_1\, 
        \del_cntr0[5]_net_1\, \del_cntr0[1]_net_1\, 
        \del_cntr0[14]_net_1\, \del_cntr0[13]_net_1\, 
        \del_cntr0[11]_net_1\, \del_cntr0[12]_net_1\, 
        \del_cntr0[7]_net_1\, \del_cntr0[8]_net_1\, 
        \del_cntr0[3]_net_1\, \del_cntr0[4]_net_1\, 
        \del_cntr0[2]_net_1\, \del_cntr0[0]_net_1\, 
        un6_del_cntr1_11, un6_del_cntr1_2, un6_del_cntr1_1, 
        un6_del_cntr1_7, un6_del_cntr1_10, un6_del_cntr1_6, 
        \del_cntr1[10]_net_1\, \del_cntr1[9]_net_1\, 
        un6_del_cntr1_9, un6_del_cntr1_4, \del_cntr1[6]_net_1\, 
        \del_cntr1[5]_net_1\, \del_cntr1[1]_net_1\, 
        \del_cntr1[14]_net_1\, \del_cntr1[13]_net_1\, 
        \del_cntr1[11]_net_1\, \del_cntr1[12]_net_1\, 
        \del_cntr1[7]_net_1\, \del_cntr1[8]_net_1\, 
        \del_cntr1[3]_net_1\, \del_cntr1[4]_net_1\, 
        \del_cntr1[2]_net_1\, \del_cntr1[0]_net_1\, 
        \sequencer_state0_ns_a2_0_0[1]\, 
        \sequencer_state1_ns_a2_0_0[1]\, \ret_state1[4]_net_1\, 
        \ret_state1[3]_net_1\, N_254_1, N_358_1, N_354, 
        \sequencer_state0_ns[1]\, 
        \sequencer_state0_maj_RNIJFIU1[1]_net_1\, 
        \sequencer_state0[1]_net_1\, N_367, 
        \sequencer_state0_maj_RNIIEIU1[2]_net_1\, 
        \sequencer_state0[2]_net_1\, N_368, 
        \sequencer_state1_ns[1]\, 
        \sequencer_state1_maj_RNINB7D[1]_net_1\, 
        \sequencer_state1[1]_net_1\, N_263, 
        \sequencer_state1_maj_RNIMA7D[2]_net_1\, 
        \sequencer_state1[2]_net_1\, N_264, N_251, un6_del_cntr1, 
        N_238_i, \sequencer_state1_ns[3]\, N_274, 
        \sequencer_state1_ns[4]\, N_266, 
        \sequencer_state1_maj_RNIP5VM4[5]_net_1\, N_253, N_342_i, 
        \sequencer_state0_ns[3]\, N_378, \sequencer_state0_ns[4]\, 
        N_377, \ch_out1[0]_net_1\, \n_del_cntr0[0]\, N_379, N_364, 
        \DWACT_ADD_CI_0_partial_sum[0]\, \n_del_cntr0[1]\, I_56_0, 
        \n_del_cntr0[2]\, I_52_0, \n_del_cntr0[3]\, I_51_0, 
        \n_del_cntr0[4]\, I_53_0, \n_del_cntr0[5]\, I_62_0, 
        \n_del_cntr0[6]\, I_49_0, \n_del_cntr0[7]\, I_59_0, 
        \n_del_cntr0[8]\, I_57_0, \n_del_cntr0[9]\, I_55_0, 
        \n_del_cntr0[10]\, I_54_0, \n_del_cntr0[11]\, I_48_0, 
        \n_del_cntr0[12]\, I_50_0, \n_del_cntr0[13]\, I_60_0, 
        \n_del_cntr0[14]\, I_58_0, \n_del_cntr1[0]\, N_275, N_260, 
        \DWACT_ADD_CI_0_partial_sum_0[0]\, \n_del_cntr1[1]\, I_56, 
        \n_del_cntr1[2]\, I_52, \n_del_cntr1[3]\, I_51, 
        \n_del_cntr1[4]\, I_53, \n_del_cntr1[5]\, I_62, 
        \n_del_cntr1[6]\, I_49, \n_del_cntr1[7]\, I_59, 
        \n_del_cntr1[8]\, I_57, \n_del_cntr1[9]\, I_55, 
        \n_del_cntr1[10]\, I_54, \n_del_cntr1[11]\, I_48, 
        \n_del_cntr1[12]\, I_50, \n_del_cntr1[13]\, I_60, 
        \n_del_cntr1[14]\, I_58, \ch_out0_maj_RNIELCD2[1]_net_1\, 
        N_369, \ch_iaux_en[1]\, \ch_out0_maj_RNIATET1[2]_net_1\, 
        N_353, \ch_mreg_en[1]\, \ch_out1_maj_RNIA39N1[0]_net_1\, 
        \n_ch_out1[0]\, \ch_out1_maj_RNIJOMF[1]_net_1\, N_265, 
        \ch_out1[1]_net_1\, \ch_out1_maj_RNIEP3C[2]_net_1\, N_249, 
        \ch_out1[2]_net_1\, N_362, 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, 
        \sequencer_state0_ns[0]\, \sequencer_state0_ns[5]\, 
        \ret_state0_maj_RNIQMIU1[5]_net_1\, 
        \ret_state0_maj_RNIPLIU1[4]_net_1\, 
        \ret_state0_maj_RNIOKIU1[3]_net_1\, 
        \ret_state0_maj_RNIKGIU1[2]_net_1\, 
        \sequencer_state1[5]_net_1\, un2_n_ch_out1, N_258, 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, 
        \sequencer_state1_ns[0]\, \sequencer_state1_ns[5]\, 
        \ret_state1_maj_RNIUI7D[5]_net_1\, 
        \ret_state1_maj_RNITH7D[4]_net_1\, 
        \ret_state1_maj_RNISG7D[3]_net_1\, 
        \ret_state1_maj_RNIOC7D[2]_net_1\, un5_n_ch_out0, 
        \n_ch_out0[0]\, \ch_out0_maj_RNI45K83[0]_net_1\, 
        \OUT_CHANNEL_VOSG_c[1]\, \ret_state0_2[0]\, 
        \ret_state0_tmr2_2[0]\, \ret_state0_tmr3_2[0]\, 
        \ret_state0_2[1]\, \ret_state0_tmr2_2[1]\, 
        \ret_state0_tmr3_2[1]\, \ret_state0_2[2]\, 
        \ret_state0_tmr2_2[2]\, \ret_state0_tmr3_2[2]\, 
        \ret_state0_2[3]\, \ret_state0_tmr2_2[3]\, 
        \ret_state0_tmr3_2[3]\, \ret_state0_2[4]\, 
        \ret_state0_tmr2_2[4]\, \ret_state0_tmr3_2[4]\, 
        \ret_state0_2[5]\, \ret_state0_tmr2_2[5]\, 
        \ret_state0_tmr3_2[5]\, \ret_state1_2[0]\, 
        \ret_state1_tmr2_2[0]\, \ret_state1_tmr3_2[0]\, 
        \ret_state1_2[1]\, \ret_state1_tmr2_2[1]\, 
        \ret_state1_tmr3_2[1]\, \ret_state1_2[2]\, 
        \ret_state1_tmr2_2[2]\, \ret_state1_tmr3_2[2]\, 
        \ret_state1_2[3]\, \ret_state1_tmr2_2[3]\, 
        \ret_state1_tmr3_2[3]\, \ret_state1_2[4]\, 
        \ret_state1_tmr2_2[4]\, \ret_state1_tmr3_2[4]\, 
        \ret_state1_2[5]\, \ret_state1_tmr2_2[5]\, 
        \ret_state1_tmr3_2[5]\, \ch_out0_2[2]\, 
        \ch_out0_tmr2_2[2]\, \ch_out0_tmr3_2[2]\, \ch_out0_2[1]\, 
        \ch_out0_tmr2_2[1]\, \ch_out0_tmr3_2[1]\, \ch_out0_2[0]\, 
        \ch_out0_tmr2_2[0]\, \ch_out0_tmr3_2[0]\, \ch_out1_2[2]\, 
        \ch_out1_tmr2_2[2]\, \ch_out1_tmr3_2[2]\, \ch_out1_2[1]\, 
        \ch_out1_tmr2_2[1]\, \ch_out1_tmr3_2[1]\, \ch_out1_2[0]\, 
        \ch_out1_tmr2_2[0]\, \ch_out1_tmr3_2[0]\, 
        \sequencer_state0_2[0]\, \sequencer_state0_tmr2_2[0]\, 
        \sequencer_state0_tmr3_2[0]\, \sequencer_state0_2[1]\, 
        \sequencer_state0_tmr2_2[1]\, 
        \sequencer_state0_tmr3_2[1]\, \sequencer_state0_2[2]\, 
        \sequencer_state0_tmr2_2[2]\, 
        \sequencer_state0_tmr3_2[2]\, \sequencer_state0_2[3]\, 
        \sequencer_state0_tmr2_2[3]\, 
        \sequencer_state0_tmr3_2[3]\, \sequencer_state0_2[4]\, 
        \sequencer_state0_tmr2_2[4]\, 
        \sequencer_state0_tmr3_2[4]\, \sequencer_state0_2[5]\, 
        \sequencer_state0_tmr2_2[5]\, 
        \sequencer_state0_tmr3_2[5]\, \sequencer_state1_2[0]\, 
        \sequencer_state1_tmr2_2[0]\, 
        \sequencer_state1_tmr3_2[0]\, \sequencer_state1_2[1]\, 
        \sequencer_state1_tmr2_2[1]\, 
        \sequencer_state1_tmr3_2[1]\, \sequencer_state1_2[2]\, 
        \sequencer_state1_tmr2_2[2]\, 
        \sequencer_state1_tmr3_2[2]\, \sequencer_state1_2[3]\, 
        \sequencer_state1_tmr2_2[3]\, 
        \sequencer_state1_tmr3_2[3]\, \sequencer_state1_2[4]\, 
        \sequencer_state1_tmr2_2[4]\, 
        \sequencer_state1_tmr3_2[4]\, \sequencer_state1_2[5]\, 
        \sequencer_state1_tmr2_2[5]\, 
        \sequencer_state1_tmr3_2[5]\, \del_cntr1_2[14]\, 
        \del_cntr1_tmr2_2[14]\, \del_cntr1_tmr3_2[14]\, 
        \del_cntr0_2[14]\, \del_cntr0_tmr2_2[14]\, 
        \del_cntr0_tmr3_2[14]\, \del_cntr1_2[13]\, 
        \del_cntr1_tmr2_2[13]\, \del_cntr1_tmr3_2[13]\, 
        \del_cntr0_2[13]\, \del_cntr0_tmr2_2[13]\, 
        \del_cntr0_tmr3_2[13]\, \del_cntr1_2[12]\, 
        \del_cntr1_tmr2_2[12]\, \del_cntr1_tmr3_2[12]\, 
        \del_cntr0_2[12]\, \del_cntr0_tmr2_2[12]\, 
        \del_cntr0_tmr3_2[12]\, \del_cntr1_2[11]\, 
        \del_cntr1_tmr2_2[11]\, \del_cntr1_tmr3_2[11]\, 
        \del_cntr0_2[11]\, \del_cntr0_tmr2_2[11]\, 
        \del_cntr0_tmr3_2[11]\, \del_cntr1_2[10]\, 
        \del_cntr1_tmr2_2[10]\, \del_cntr1_tmr3_2[10]\, 
        \del_cntr0_2[10]\, \del_cntr0_tmr2_2[10]\, 
        \del_cntr0_tmr3_2[10]\, \del_cntr1_2[9]\, 
        \del_cntr1_tmr2_2[9]\, \del_cntr1_tmr3_2[9]\, 
        \del_cntr0_2[9]\, \del_cntr0_tmr2_2[9]\, 
        \del_cntr0_tmr3_2[9]\, \del_cntr1_2[8]\, 
        \del_cntr1_tmr2_2[8]\, \del_cntr1_tmr3_2[8]\, 
        \del_cntr0_2[8]\, \del_cntr0_tmr2_2[8]\, 
        \del_cntr0_tmr3_2[8]\, \del_cntr1_2[7]\, 
        \del_cntr1_tmr2_2[7]\, \del_cntr1_tmr3_2[7]\, 
        \del_cntr0_2[7]\, \del_cntr0_tmr2_2[7]\, 
        \del_cntr0_tmr3_2[7]\, \del_cntr1_2[6]\, 
        \del_cntr1_tmr2_2[6]\, \del_cntr1_tmr3_2[6]\, 
        \del_cntr0_2[6]\, \del_cntr0_tmr2_2[6]\, 
        \del_cntr0_tmr3_2[6]\, \del_cntr1_2[5]\, 
        \del_cntr1_tmr2_2[5]\, \del_cntr1_tmr3_2[5]\, 
        \del_cntr0_2[5]\, \del_cntr0_tmr2_2[5]\, 
        \del_cntr0_tmr3_2[5]\, \del_cntr1_2[4]\, 
        \del_cntr1_tmr2_2[4]\, \del_cntr1_tmr3_2[4]\, 
        \del_cntr0_2[4]\, \del_cntr0_tmr2_2[4]\, 
        \del_cntr0_tmr3_2[4]\, \del_cntr1_2[3]\, 
        \del_cntr1_tmr2_2[3]\, \del_cntr1_tmr3_2[3]\, 
        \del_cntr0_2[3]\, \del_cntr0_tmr2_2[3]\, 
        \del_cntr0_tmr3_2[3]\, \del_cntr1_2[2]\, 
        \del_cntr1_tmr2_2[2]\, \del_cntr1_tmr3_2[2]\, 
        \del_cntr0_2[2]\, \del_cntr0_tmr2_2[2]\, 
        \del_cntr0_tmr3_2[2]\, \del_cntr1_2[1]\, 
        \del_cntr1_tmr2_2[1]\, \del_cntr1_tmr3_2[1]\, 
        \del_cntr0_2[1]\, \del_cntr0_tmr2_2[1]\, 
        \del_cntr0_tmr3_2[1]\, \del_cntr1_2[0]\, 
        \del_cntr1_tmr2_2[0]\, \del_cntr1_tmr3_2[0]\, 
        \del_cntr0_2[0]\, \del_cntr0_tmr2_2[0]\, 
        \del_cntr0_tmr3_2[0]\, \DWACT_ADD_CI_0_pog_array_1_5[0]\, 
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
        \DWACT_ADD_CI_0_partial_sum[11]\, 
        \DWACT_ADD_CI_0_pog_array_1_5_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_11_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_12_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_4_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_9_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_10_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_3_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_7_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_8_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_2_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_2_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_2_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_5_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_6_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_1_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_2_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_3_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_2_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_5_0[0]\, 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, 
        \DWACT_ADD_CI_0_g_array_2_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_5_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_11_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\, 
        \DWACT_ADD_CI_0_g_array_1_6_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_13_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_7_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_4_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\, 
        \DWACT_ADD_CI_0_g_array_11_2_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_11_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_3_0[0]\, 
        \DWACT_ADD_CI_0_g_array_12_5_0[0]\, 
        \DWACT_ADD_CI_0_pog_array_0_0[0]\, 
        \DWACT_ADD_CI_0_TMP_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_1_0[0]\, 
        \DWACT_ADD_CI_0_g_array_0_9_0[0]\, 
        \DWACT_ADD_CI_0_partial_sum_0[5]\, 
        \DWACT_ADD_CI_0_partial_sum_0[13]\, 
        \DWACT_ADD_CI_0_partial_sum_0[7]\, 
        \DWACT_ADD_CI_0_partial_sum_0[14]\, 
        \DWACT_ADD_CI_0_partial_sum_0[8]\, 
        \DWACT_ADD_CI_0_partial_sum_0[1]\, 
        \DWACT_ADD_CI_0_partial_sum_0[9]\, 
        \DWACT_ADD_CI_0_partial_sum_0[10]\, 
        \DWACT_ADD_CI_0_partial_sum_0[4]\, 
        \DWACT_ADD_CI_0_partial_sum_0[2]\, 
        \DWACT_ADD_CI_0_partial_sum_0[3]\, 
        \DWACT_ADD_CI_0_partial_sum_0[12]\, 
        \DWACT_ADD_CI_0_partial_sum_0[6]\, 
        \DWACT_ADD_CI_0_partial_sum_0[11]\, \GND\, \VCC\
         : std_logic;

begin 

    OUT_CHANNEL_VOSG_c(1) <= \OUT_CHANNEL_VOSG_c[1]\;
    ch_out1(2) <= \ch_out1[2]_net_1\;
    ch_out1(1) <= \ch_out1[1]_net_1\;
    ch_mreg_en_0 <= \ch_mreg_en[1]\;
    ch_iaux_en_0 <= \ch_iaux_en[1]\;

    \sequencer_state1[2]\ : DFN1C0
      port map(D => \sequencer_state1_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_2[2]\);
    
    \del_cntr1_tmr3[0]\ : DFN1P0
      port map(D => \n_del_cntr1[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[0]\);
    
    \del_cntr0[14]\ : DFN1P0
      port map(D => \n_del_cntr0[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[14]\);
    
    \del_cntr1_maj[14]\ : MAJ3
      port map(A => \del_cntr1_2[14]\, B => 
        \del_cntr1_tmr2_2[14]\, C => \del_cntr1_tmr3_2[14]\, Y
         => \del_cntr1[14]_net_1\);
    
    un1_del_cntr1_I_88 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2[0]\);
    
    \del_cntr0_tmr2[14]\ : DFN1P0
      port map(D => \n_del_cntr0[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[14]\);
    
    \del_cntr0[4]\ : DFN1P0
      port map(D => \n_del_cntr0[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[4]\);
    
    \del_cntr1_maj_RNIAA86[0]\ : NOR2
      port map(A => \del_cntr1[2]_net_1\, B => 
        \del_cntr1[0]_net_1\, Y => un6_del_cntr1_1);
    
    \sequencer_state1_maj_RNII0PA[3]\ : OR2
      port map(A => \sequencer_state1[3]_net_1\, B => N_243, Y
         => \sequencer_state1_ns_0[1]\);
    
    \del_cntr1_tmr3[3]\ : DFN1P0
      port map(D => \n_del_cntr1[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[3]\);
    
    \del_cntr0[9]\ : DFN1P0
      port map(D => \n_del_cntr0[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[9]\);
    
    \ret_state1_tmr3[5]\ : DFN1P0
      port map(D => \ret_state1_maj_RNIUI7D[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state1_tmr3_2[5]\);
    
    \ret_state1_maj_RNIN9SL2[0]\ : NOR3C
      port map(A => un6_del_cntr1, B => 
        \sequencer_state1_ns_a2_2_0[0]\, C => 
        \sequencer_state1_ns_a2_0_1[0]\, Y => N_251);
    
    un1_del_cntr0_I_21 : XOR2
      port map(A => \del_cntr0[13]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_12_0[0]\);
    
    \sequencer_state1_maj_RNI24IP3_0[3]\ : AO1
      port map(A => \sequencer_state1_ns_a2_0[1]\, B => 
        channels_ready(2), C => \sequencer_state1_ns_0[1]\, Y => 
        \sequencer_state1_ns[1]\);
    
    \del_cntr0_tmr2[4]\ : DFN1P0
      port map(D => \n_del_cntr0[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[4]\);
    
    \del_cntr0_tmr2[11]\ : DFN1P0
      port map(D => \n_del_cntr0[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[11]\);
    
    \del_cntr0[5]\ : DFN1P0
      port map(D => \n_del_cntr0[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[5]\);
    
    \ret_state1_maj[0]\ : MAJ3
      port map(A => \ret_state1_2[0]\, B => 
        \ret_state1_tmr2_2[0]\, C => \ret_state1_tmr3_2[0]\, Y
         => \ret_state1[0]_net_1\);
    
    \ch_out1[1]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIJOMF[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_2[1]\);
    
    \sequencer_state1_maj_RNIN9SL2[4]\ : NOR2B
      port map(A => \sequencer_state1[4]_net_1\, B => N_236, Y
         => \sequencer_state1_ns_a2_0[1]\);
    
    \sequencer_state0_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state0_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr2_2[2]\);
    
    \ch_out1_tmr2[1]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIJOMF[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr2_2[1]\);
    
    \ret_state0_maj_RNIBBIT[0]\ : NOR2
      port map(A => \ret_state0[5]_net_1\, B => 
        \ret_state0[0]_net_1\, Y => N_374);
    
    \sequencer_state0_maj_RNIQ6F9E1[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_57_0, Y => 
        \n_del_cntr0[8]\);
    
    \ret_state1_tmr2[2]\ : DFN1C0
      port map(D => \ret_state1_maj_RNIOC7D[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_2[2]\);
    
    \ret_state0_maj_RNIKGIU1[2]\ : AO1A
      port map(A => N_347, B => \ret_state0[2]_net_1\, C => 
        \sequencer_state0[3]_net_1\, Y => 
        \ret_state0_maj_RNIKGIU1[2]_net_1\);
    
    \sequencer_state1_maj_RNIB902H[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_49, Y => 
        \n_del_cntr1[6]\);
    
    \sequencer_state0_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state0_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr3_2[2]\);
    
    un1_del_cntr0_I_10 : AND2
      port map(A => \del_cntr0[4]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\);
    
    un1_del_cntr0_I_47 : XOR2
      port map(A => \del_cntr0[5]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[5]\);
    
    \ret_state1_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIMA7D[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_2[0]\);
    
    un1_del_cntr0_I_33 : XOR2
      port map(A => \del_cntr0[3]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[3]\);
    
    \sequencer_state1_maj_RNIIFS64[0]\ : OR3
      port map(A => N_275, B => N_260, C => 
        \DWACT_ADD_CI_0_partial_sum_0[0]\, Y => \n_del_cntr1[0]\);
    
    \del_cntr0_maj[3]\ : MAJ3
      port map(A => \del_cntr0_2[3]\, B => \del_cntr0_tmr2_2[3]\, 
        C => \del_cntr0_tmr3_2[3]\, Y => \del_cntr0[3]_net_1\);
    
    un1_del_cntr1_I_70 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    \ret_state0[3]\ : DFN1C0
      port map(D => \ret_state0_maj_RNIOKIU1[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state0_2[3]\);
    
    un1_del_cntr1_I_63 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_8[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\);
    
    \ret_state0_maj_RNIDDIT[3]\ : NOR2A
      port map(A => \ret_state0[4]_net_1\, B => 
        \ret_state0[3]_net_1\, Y => 
        \sequencer_state0_ns_a2_0_0[1]\);
    
    un1_del_cntr0_I_38 : XOR2
      port map(A => \del_cntr0[2]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[2]\);
    
    un1_del_cntr1_I_39 : XOR2
      port map(A => \del_cntr1[13]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[13]\);
    
    \ret_state0_maj_RNIIGTCC[0]\ : AO1
      port map(A => \sequencer_state0_ns_a2_0_1[5]\, B => N_378, 
        C => N_362, Y => \sequencer_state0_ns[5]\);
    
    \del_cntr1_maj[4]\ : MAJ3
      port map(A => \del_cntr1_2[4]\, B => \del_cntr1_tmr2_2[4]\, 
        C => \del_cntr1_tmr3_2[4]\, Y => \del_cntr1[4]_net_1\);
    
    un1_del_cntr1_I_91 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\);
    
    \ret_state0_maj_RNI4DU89[3]\ : NOR2B
      port map(A => N_377, B => channels_ready(1), Y => N_378);
    
    \del_cntr1_maj[0]\ : MAJ3
      port map(A => \del_cntr1_2[0]\, B => \del_cntr1_tmr2_2[0]\, 
        C => \del_cntr1_tmr3_2[0]\, Y => \del_cntr1[0]_net_1\);
    
    un1_del_cntr1_I_68 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\);
    
    un1_del_cntr1_I_80 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\);
    
    \sequencer_state0_maj_RNIQEQ81_0[0]\ : NOR2A
      port map(A => channels_ready(1), B => 
        \sequencer_state0[0]_net_1\, Y => N_380_0);
    
    \del_cntr1_maj[10]\ : MAJ3
      port map(A => \del_cntr1_2[10]\, B => 
        \del_cntr1_tmr2_2[10]\, C => \del_cntr1_tmr3_2[10]\, Y
         => \del_cntr1[10]_net_1\);
    
    \del_cntr0_tmr2[5]\ : DFN1P0
      port map(D => \n_del_cntr0[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[5]\);
    
    \sequencer_state0_maj_RNI8SJI62[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_60_0, Y => 
        \n_del_cntr0[13]\);
    
    un1_del_cntr1_I_21 : XOR2
      port map(A => \del_cntr1[13]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\);
    
    \del_cntr0_maj[4]\ : MAJ3
      port map(A => \del_cntr0_2[4]\, B => \del_cntr0_tmr2_2[4]\, 
        C => \del_cntr0_tmr3_2[4]\, Y => \del_cntr0[4]_net_1\);
    
    \sequencer_state0_maj_RNI9TMU[2]\ : NOR2
      port map(A => \sequencer_state0[2]_net_1\, B => 
        \ret_state0[1]_net_1\, Y => N_367);
    
    un1_del_cntr0_I_86 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_0[0]\);
    
    \del_cntr1[14]\ : DFN1P0
      port map(D => \n_del_cntr1[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[14]\);
    
    \ret_state0_maj_RNIPLIU1[4]\ : OA1A
      port map(A => N_379, B => \sequencer_state0[5]_net_1\, C
         => \ret_state0[4]_net_1\, Y => 
        \ret_state0_maj_RNIPLIU1[4]_net_1\);
    
    \del_cntr1_maj[7]\ : MAJ3
      port map(A => \del_cntr1_2[7]\, B => \del_cntr1_tmr2_2[7]\, 
        C => \del_cntr1_tmr3_2[7]\, Y => \del_cntr1[7]_net_1\);
    
    \ch_out0_maj_RNI45K83[0]\ : MX2
      port map(A => \n_ch_out0[0]\, B => \OUT_CHANNEL_VOSG_c[1]\, 
        S => \sequencer_state0[4]_net_1\, Y => 
        \ch_out0_maj_RNI45K83[0]_net_1\);
    
    \sequencer_state1_maj_RNI9916[1]\ : NOR2
      port map(A => \sequencer_state1[1]_net_1\, B => 
        \ret_state1[0]_net_1\, Y => N_264);
    
    \sequencer_state0[5]\ : DFN1P0
      port map(D => \sequencer_state0_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state0_2[5]\);
    
    \ret_state1_tmr3[2]\ : DFN1C0
      port map(D => \ret_state1_maj_RNIOC7D[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_2[2]\);
    
    \del_cntr0[11]\ : DFN1P0
      port map(D => \n_del_cntr0[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[11]\);
    
    un1_del_cntr0_I_56 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[1]\, B => 
        \DWACT_ADD_CI_0_TMP_0[0]\, Y => I_56_0);
    
    \ret_state1_maj_RNI3MCD[1]\ : XA1
      port map(A => \ret_state1[1]_net_1\, B => 
        \ret_state1[2]_net_1\, C => N_254_1, Y => 
        \sequencer_state1_ns_i_a2_0_0[2]\);
    
    \del_cntr1[1]\ : DFN1P0
      port map(D => \n_del_cntr1[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[1]\);
    
    \ret_state1_maj_RNIUI7D[5]\ : OA1A
      port map(A => N_275, B => \sequencer_state1[5]_net_1\, C
         => \ret_state1[5]_net_1\, Y => 
        \ret_state1_maj_RNIUI7D[5]_net_1\);
    
    \ch_out1_tmr3[2]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIEP3C[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr3_2[2]\);
    
    \ch_out0_tmr3[0]\ : DFN1C0
      port map(D => \ch_out0_maj_RNI45K83[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr3_2[0]\);
    
    \ret_state0_maj_RNIK8GD1[3]\ : NOR3A
      port map(A => \sequencer_state0[4]_net_1\, B => 
        \ret_state0[4]_net_1\, C => \ret_state0[3]_net_1\, Y => 
        \sequencer_state0_ns_a2_2_0[0]\);
    
    un1_del_cntr0_I_76 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_0[0]\);
    
    un1_del_cntr0_I_25 : XOR2
      port map(A => \del_cntr0[12]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_11_0[0]\);
    
    \sequencer_state1_maj_RNI5J203[0]\ : NOR2B
      port map(A => \sequencer_state1_maj_RNITNFS_1[0]_net_1\, B
         => un6_del_cntr1, Y => N_260);
    
    \sequencer_state0_maj_RNIV1CV11[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_49_0, Y => 
        \n_del_cntr0[6]\);
    
    \ret_state1_tmr2[4]\ : DFN1C0
      port map(D => \ret_state1_maj_RNITH7D[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_2[4]\);
    
    \sequencer_state1_maj_RNI0O49V[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_48, Y => 
        \n_del_cntr1[11]\);
    
    \sequencer_state0_maj_RNILCS5P[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_53_0, Y => 
        \n_del_cntr0[4]\);
    
    \ret_state0_tmr3[3]\ : DFN1C0
      port map(D => \ret_state0_maj_RNIOKIU1[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_2[3]\);
    
    \del_cntr1_tmr2[11]\ : DFN1P0
      port map(D => \n_del_cntr1[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[11]\);
    
    un1_del_cntr1_I_51 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[3]\, B => 
        \DWACT_ADD_CI_0_g_array_12[0]\, Y => I_51);
    
    un1_del_cntr1_I_16 : AND2
      port map(A => \del_cntr1[11]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\);
    
    un1_del_cntr0_I_30 : XOR2
      port map(A => \del_cntr0[1]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_0[0]\);
    
    \del_cntr1_tmr2[8]\ : DFN1P0
      port map(D => \n_del_cntr1[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[8]\);
    
    \ret_state1_maj_RNIBNS4_1[1]\ : NOR2
      port map(A => \ret_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => N_271);
    
    un1_del_cntr0_I_22 : XOR2
      port map(A => \del_cntr0[9]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_8_0[0]\);
    
    \del_cntr0_tmr2[12]\ : DFN1P0
      port map(D => \n_del_cntr0[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[12]\);
    
    un1_del_cntr1_I_60 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[13]\, B => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\, Y => I_60);
    
    un1_del_cntr1_I_46 : XOR2
      port map(A => \del_cntr1[6]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[6]\);
    
    \del_cntr0_maj_RNI8G2A3[14]\ : NOR3C
      port map(A => un5_del_cntr0_2, B => un5_del_cntr0_1, C => 
        un5_del_cntr0_7, Y => un5_del_cntr0_11);
    
    un1_del_cntr0_I_65 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_5_0[0]\);
    
    \del_cntr0_tmr2[10]\ : DFN1P0
      port map(D => \n_del_cntr0[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[10]\);
    
    un1_del_cntr1_I_34 : XOR2
      port map(A => \del_cntr1[4]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[4]\);
    
    \del_cntr1_tmr2[0]\ : DFN1P0
      port map(D => \n_del_cntr1[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[0]\);
    
    \del_cntr1[2]\ : DFN1P0
      port map(D => \n_del_cntr1[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[2]\);
    
    \ch_out1[2]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIEP3C[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_2[2]\);
    
    \sequencer_state1_maj_RNI24IP3[3]\ : AO1A
      port map(A => channels_ready(2), B => 
        \sequencer_state1_ns_a2_0[0]\, C => N_251, Y => 
        \sequencer_state1_ns[0]\);
    
    \ch_out1_maj_RNIEP3C[2]\ : MX2A
      port map(A => N_249, B => \ch_out1[2]_net_1\, S => 
        \sequencer_state1[4]_net_1\, Y => 
        \ch_out1_maj_RNIEP3C[2]_net_1\);
    
    \ret_state0_tmr3[5]\ : DFN1P0
      port map(D => \ret_state0_maj_RNIQMIU1[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state0_tmr3_2[5]\);
    
    \del_cntr1_maj_RNID0GE[11]\ : NOR2
      port map(A => \del_cntr1[11]_net_1\, B => 
        \del_cntr1[12]_net_1\, Y => un6_del_cntr1_6);
    
    un1_del_cntr0_I_62 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[5]\, B => 
        \DWACT_ADD_CI_0_g_array_12_1_0[0]\, Y => I_62_0);
    
    un1_del_cntr0_I_6 : AND2
      port map(A => \del_cntr0[3]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_3_0[0]\);
    
    \ret_state0[1]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIJFIU1[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_2[1]\);
    
    \del_cntr1[8]\ : DFN1P0
      port map(D => \n_del_cntr1[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[8]\);
    
    \sequencer_state0_maj_RNI9HRV[2]\ : OR2
      port map(A => \sequencer_state0[2]_net_1\, B => 
        \sequencer_state0[1]_net_1\, Y => N_347);
    
    \ret_state0[5]\ : DFN1P0
      port map(D => \ret_state0_maj_RNIQMIU1[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => \ret_state0_2[5]\);
    
    un1_del_cntr0_I_87 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_6_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_2_0[0]\);
    
    \sequencer_state1_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state1_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr3_2[0]\);
    
    \ret_state0_tmr2[2]\ : DFN1C0
      port map(D => \ret_state0_maj_RNIKGIU1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_2[2]\);
    
    \sequencer_state0_ns_i_1_RNO_0[2]\ : XA1
      port map(A => \ret_state0[1]_net_1\, B => 
        \ret_state0[2]_net_1\, C => N_358_1, Y => 
        \sequencer_state0_ns_i_a2_0_0[2]\);
    
    \ret_state1_maj_RNIOGP9_0[0]\ : NOR3B
      port map(A => \ret_state1[5]_net_1\, B => N_271, C => 
        \ret_state1[0]_net_1\, Y => 
        \sequencer_state1_ns_a2_0_1[0]\);
    
    \ret_state1_maj_RNIDPS4_0[0]\ : NOR2
      port map(A => \ret_state1[5]_net_1\, B => 
        \ret_state1[0]_net_1\, Y => N_270);
    
    \del_cntr0_maj[12]\ : MAJ3
      port map(A => \del_cntr0_2[12]\, B => 
        \del_cntr0_tmr2_2[12]\, C => \del_cntr0_tmr3_2[12]\, Y
         => \del_cntr0[12]_net_1\);
    
    un1_del_cntr0_I_91 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_10_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_4_0[0]\);
    
    \del_cntr1_tmr2[6]\ : DFN1P0
      port map(D => \n_del_cntr1[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[6]\);
    
    un1_del_cntr1_I_25 : XOR2
      port map(A => \del_cntr1[12]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_11[0]\);
    
    \ret_state0_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIIEIU1[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_2[0]\);
    
    \ret_state0_maj_RNI99IT_1[1]\ : NOR2
      port map(A => \ret_state0[2]_net_1\, B => 
        \ret_state0[1]_net_1\, Y => N_375);
    
    \del_cntr0_tmr3[2]\ : DFN1P0
      port map(D => \n_del_cntr0[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[2]\);
    
    un1_del_cntr1_I_92 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_5[0]\);
    
    un1_del_cntr1_I_9 : AND2
      port map(A => \del_cntr1[10]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\);
    
    \del_cntr1_tmr2[14]\ : DFN1P0
      port map(D => \n_del_cntr1[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[14]\);
    
    \del_cntr0[13]\ : DFN1P0
      port map(D => \n_del_cntr0[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[13]\);
    
    un1_del_cntr0_I_57 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[8]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, Y => I_57_0);
    
    \ch_out0_tmr2[1]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIELCD2[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr2_2[1]\);
    
    \sequencer_state0_maj_RNI7RMU[1]\ : NOR2
      port map(A => \sequencer_state0[1]_net_1\, B => 
        \ret_state0[0]_net_1\, Y => N_368);
    
    \del_cntr1[11]\ : DFN1P0
      port map(D => \n_del_cntr1[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[11]\);
    
    \sequencer_state1[3]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIP5VM4[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state1_2[3]\);
    
    \ret_state1[5]\ : DFN1P0
      port map(D => \ret_state1_maj_RNIUI7D[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => \ret_state1_2[5]\);
    
    \del_cntr0_tmr3[7]\ : DFN1P0
      port map(D => \n_del_cntr0[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[7]\);
    
    un1_del_cntr0_I_41 : XOR2
      port map(A => \del_cntr0[12]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[12]\);
    
    un1_del_cntr0_I_16 : AND2
      port map(A => \del_cntr0[11]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_11_0[0]\);
    
    \ret_state1_maj_RNISG7D[3]\ : OA1A
      port map(A => N_275, B => \sequencer_state1[5]_net_1\, C
         => \ret_state1[3]_net_1\, Y => 
        \ret_state1_maj_RNISG7D[3]_net_1\);
    
    un1_del_cntr1_I_22 : XOR2
      port map(A => \del_cntr1[9]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\);
    
    un1_del_cntr0_I_77 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_1_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\);
    
    \sequencer_state0_ns_i_1[2]\ : OR2A
      port map(A => channels_ready(1), B => 
        \sequencer_state0_ns_i_0[2]\, Y => 
        \sequencer_state0_ns_i_1[2]_net_1\);
    
    \sequencer_state0_maj[4]\ : MAJ3
      port map(A => \sequencer_state0_2[4]\, B => 
        \sequencer_state0_tmr2_2[4]\, C => 
        \sequencer_state0_tmr3_2[4]\, Y => 
        \sequencer_state0[4]_net_1\);
    
    \sequencer_state0_maj_RNISB8GQ1[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_48_0, Y => 
        \n_del_cntr0[11]\);
    
    \ret_state0_maj[2]\ : MAJ3
      port map(A => \ret_state0_2[2]\, B => 
        \ret_state0_tmr2_2[2]\, C => \ret_state0_tmr3_2[2]\, Y
         => \ret_state0[2]_net_1\);
    
    \ret_state0_maj[0]\ : MAJ3
      port map(A => \ret_state0_2[0]\, B => 
        \ret_state0_tmr2_2[0]\, C => \ret_state0_tmr3_2[0]\, Y
         => \ret_state0[0]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_del_cntr1_I_76 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11[0]\);
    
    \ret_state1_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNINB7D[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_2[1]\);
    
    un1_del_cntr1_I_17 : AND2
      port map(A => \del_cntr1[13]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\);
    
    \sequencer_state1_maj_RNI9T57[1]\ : NOR2
      port map(A => \sequencer_state1[1]_net_1\, B => 
        \sequencer_state1[0]_net_1\, Y => N_249);
    
    \sequencer_state0_ns_i_1_RNO[2]\ : AO1
      port map(A => \sequencer_state0_ns_i_a2_0_0[2]\, B => N_374, 
        C => N_359, Y => \sequencer_state0_ns_i_0[2]\);
    
    \del_cntr1_maj[6]\ : MAJ3
      port map(A => \del_cntr1_2[6]\, B => \del_cntr1_tmr2_2[6]\, 
        C => \del_cntr1_tmr3_2[6]\, Y => \del_cntr1[6]_net_1\);
    
    un1_del_cntr1_I_47 : XOR2
      port map(A => \del_cntr1[5]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[5]\);
    
    \ch_out0[1]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIELCD2[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_2[1]\);
    
    \del_cntr0_tmr3[5]\ : DFN1P0
      port map(D => \n_del_cntr0[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[5]\);
    
    \del_cntr0_maj_RNIPCH27[10]\ : NOR3C
      port map(A => un5_del_cntr0_10, B => un5_del_cntr0_9, C => 
        un5_del_cntr0_11, Y => un5_del_cntr0);
    
    \del_cntr0[1]\ : DFN1P0
      port map(D => \n_del_cntr0[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[1]\);
    
    un1_del_cntr0_I_29 : XOR2
      port map(A => \del_cntr0[4]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_3_0[0]\);
    
    \ret_state1_maj_RNIG3PE3[1]\ : NOR3C
      port map(A => N_270, B => N_274, C => 
        \sequencer_state1_ns_a2_0[4]\, Y => 
        \sequencer_state1_ns[4]\);
    
    \del_cntr1_maj[2]\ : MAJ3
      port map(A => \del_cntr1_2[2]\, B => \del_cntr1_tmr2_2[2]\, 
        C => \del_cntr1_tmr3_2[2]\, Y => \del_cntr1[2]_net_1\);
    
    \sequencer_state1_maj_RNI0DFP2[5]\ : OA1C
      port map(A => \sequencer_state1[4]_net_1\, B => N_236, C
         => \sequencer_state1[5]_net_1\, Y => N_253);
    
    un1_del_cntr1_I_86 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1[0]\);
    
    un1_del_cntr1_I_33 : XOR2
      port map(A => \del_cntr1[3]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_partial_sum[3]\);
    
    \del_cntr0[7]\ : DFN1P0
      port map(D => \n_del_cntr0[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[7]\);
    
    \del_cntr0_tmr3[1]\ : DFN1P0
      port map(D => \n_del_cntr0[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[1]\);
    
    \del_cntr0_tmr2[9]\ : DFN1P0
      port map(D => \n_del_cntr0[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[9]\);
    
    un1_del_cntr1_I_55 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[9]\, B => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\, Y => I_55);
    
    \sequencer_state1_tmr2[3]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIP5VM4[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state1_tmr2_2[3]\);
    
    \del_cntr1_tmr2[1]\ : DFN1P0
      port map(D => \n_del_cntr1[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[1]\);
    
    \del_cntr1_maj_RNIFCSO[9]\ : NOR3A
      port map(A => un6_del_cntr1_6, B => \del_cntr1[10]_net_1\, 
        C => \del_cntr1[9]_net_1\, Y => un6_del_cntr1_10);
    
    \ret_state0_maj_RNI12NO2[3]\ : NOR3C
      port map(A => N_374, B => \sequencer_state0_ns_a2_0_0[1]\, 
        C => N_375, Y => N_370);
    
    un1_del_cntr1_I_38 : XOR2
      port map(A => \del_cntr1[2]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[2]\);
    
    \ret_state0_tmr3[2]\ : DFN1C0
      port map(D => \ret_state0_maj_RNIKGIU1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_2[2]\);
    
    un1_del_cntr0_I_69 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_4_0[0]\);
    
    \sequencer_state0_maj_RNIFBPF1_0[3]\ : NOR2
      port map(A => \sequencer_state0[3]_net_1\, B => N_347, Y
         => \sequencer_state0_ns_a2_0[0]\);
    
    \sequencer_state0_maj_RNIFBPF1[3]\ : OR2
      port map(A => \sequencer_state0[3]_net_1\, B => N_347, Y
         => \sequencer_state0_ns_0[1]\);
    
    un1_del_cntr1_I_52 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[2]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, Y => I_52);
    
    un1_del_cntr1_I_5 : AND2
      port map(A => \del_cntr1[7]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\);
    
    \ret_state1_maj_RNIG3PE3_0[1]\ : NOR3C
      port map(A => N_270, B => N_274, C => 
        \sequencer_state1_ns_a2_0[3]\, Y => 
        \sequencer_state1_ns[3]\);
    
    \ret_state0_tmr2[4]\ : DFN1C0
      port map(D => \ret_state0_maj_RNIPLIU1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_2[4]\);
    
    \ret_state0_maj_RNI7DSJC[0]\ : AO1
      port map(A => \sequencer_state0_ns_a2_0_1[0]\, B => N_377, 
        C => N_354, Y => \sequencer_state0_ns[0]\);
    
    \del_cntr0[10]\ : DFN1P0
      port map(D => \n_del_cntr0[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[10]\);
    
    \del_cntr1[7]\ : DFN1P0
      port map(D => \n_del_cntr1[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[7]\);
    
    \ret_state1_maj_RNIDPS4[0]\ : XOR2
      port map(A => \ret_state1[5]_net_1\, B => 
        \ret_state1[0]_net_1\, Y => N_238_i);
    
    \ret_state1_maj_RNI0VI41[1]\ : AO1
      port map(A => \sequencer_state1_ns_i_a2_0_0[2]\, B => N_270, 
        C => N_255, Y => \sequencer_state1_ns_i_0[2]\);
    
    \del_cntr1[13]\ : DFN1P0
      port map(D => \n_del_cntr1[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[13]\);
    
    un1_del_cntr0_I_17 : AND2
      port map(A => \del_cntr0[13]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_13_0[0]\);
    
    \ch_out0_tmr3[2]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIATET1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr3_2[2]\);
    
    \del_cntr1_maj_RNIABHC[5]\ : NOR3A
      port map(A => un6_del_cntr1_4, B => \del_cntr1[6]_net_1\, C
         => \del_cntr1[5]_net_1\, Y => un6_del_cntr1_9);
    
    \sequencer_state1_tmr2[5]\ : DFN1P0
      port map(D => \sequencer_state1_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state1_tmr2_2[5]\);
    
    \del_cntr0_maj[9]\ : MAJ3
      port map(A => \del_cntr0_2[9]\, B => \del_cntr0_tmr2_2[9]\, 
        C => \del_cntr0_tmr3_2[9]\, Y => \del_cntr0[9]_net_1\);
    
    \sequencer_state0_maj_RNIJRBB8[0]\ : NOR2B
      port map(A => N_380_0, B => un5_del_cntr0, Y => N_364);
    
    \sequencer_state0_maj_RNI7FRV[1]\ : NOR2
      port map(A => \sequencer_state0[1]_net_1\, B => 
        \sequencer_state0[0]_net_1\, Y => N_353);
    
    un1_del_cntr1_I_29 : XOR2
      port map(A => \del_cntr1[4]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_3[0]\);
    
    un1_del_cntr0_I_36 : XOR2
      port map(A => \del_cntr0[1]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[1]\);
    
    \sequencer_state0_maj_RNIC8PF1[0]\ : NOR2
      port map(A => N_347, B => \sequencer_state0[0]_net_1\, Y
         => N_369);
    
    un1_del_cntr1_I_77 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2[0]\);
    
    \sequencer_state0_maj_RNI63M82[3]\ : NOR2A
      port map(A => \sequencer_state0_ns_a2_0[0]\, B => 
        channels_ready(1), Y => N_354);
    
    \sequencer_state0_maj[3]\ : MAJ3
      port map(A => \sequencer_state0_2[3]\, B => 
        \sequencer_state0_tmr2_2[3]\, C => 
        \sequencer_state0_tmr3_2[3]\, Y => 
        \sequencer_state0[3]_net_1\);
    
    un1_del_cntr1_I_66 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_1[0]\);
    
    \sequencer_state1_maj_RNIKCG65[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_56, Y => 
        \n_del_cntr1[1]\);
    
    un1_del_cntr0_I_92 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_12_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_5_0[0]\);
    
    un1_del_cntr0_I_9 : AND2
      port map(A => \del_cntr0[10]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\);
    
    un1_del_cntr0_I_45 : XOR2
      port map(A => \del_cntr0[9]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[9]\);
    
    \sequencer_state1_maj[2]\ : MAJ3
      port map(A => \sequencer_state1_2[2]\, B => 
        \sequencer_state1_tmr2_2[2]\, C => 
        \sequencer_state1_tmr3_2[2]\, Y => 
        \sequencer_state1[2]_net_1\);
    
    \sequencer_state1[1]\ : DFN1C0
      port map(D => \sequencer_state1_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_2[1]\);
    
    \ret_state1_maj_RNIF79I2[3]\ : OR2A
      port map(A => un6_del_cntr1, B => N_266, Y => N_236);
    
    \sequencer_state0_maj_RNIO6QRC[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_56_0, Y => 
        \n_del_cntr0[1]\);
    
    un1_del_cntr0_I_24 : XOR2
      port map(A => \del_cntr0[2]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_1_0[0]\);
    
    \del_cntr0_maj[13]\ : MAJ3
      port map(A => \del_cntr0_2[13]\, B => 
        \del_cntr0_tmr2_2[13]\, C => \del_cntr0_tmr3_2[13]\, Y
         => \del_cntr0[13]_net_1\);
    
    un1_del_cntr1_I_87 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_2[0]\);
    
    un1_del_cntr1_I_30 : XOR2
      port map(A => \del_cntr1[1]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0[0]\);
    
    \sequencer_state1_tmr3[3]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIP5VM4[5]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state1_tmr3_2[3]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \sequencer_state1_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state1_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr2_2[0]\);
    
    un1_del_cntr0_I_42 : XOR2
      port map(A => \del_cntr0[0]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[0]\);
    
    \ch_out1_tmr3[1]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIJOMF[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr3_2[1]\);
    
    \ch_out0_maj_RNIELCD2[1]\ : MX2A
      port map(A => N_369, B => \ch_iaux_en[1]\, S => 
        \sequencer_state0[4]_net_1\, Y => 
        \ch_out0_maj_RNIELCD2[1]_net_1\);
    
    un1_del_cntr0_I_81 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\);
    
    \del_cntr0_tmr3[4]\ : DFN1P0
      port map(D => \n_del_cntr0[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[4]\);
    
    \ch_out1[0]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIA39N1[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_2[0]\);
    
    \del_cntr1_tmr2[4]\ : DFN1P0
      port map(D => \n_del_cntr1[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[4]\);
    
    un1_del_cntr0_I_64 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_0[0]\, B => 
        \DWACT_ADD_CI_0_TMP_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_1_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\);
    
    \ret_state0_maj_RNIQMIU1[5]\ : OA1A
      port map(A => N_379, B => \sequencer_state0[5]_net_1\, C
         => \ret_state0[5]_net_1\, Y => 
        \ret_state0_maj_RNIQMIU1[5]_net_1\);
    
    \del_cntr0_tmr2[2]\ : DFN1P0
      port map(D => \n_del_cntr0[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[2]\);
    
    \sequencer_state0[0]\ : DFN1C0
      port map(D => \sequencer_state0_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_2[0]\);
    
    \del_cntr1_maj[5]\ : MAJ3
      port map(A => \del_cntr1_2[5]\, B => \del_cntr1_tmr2_2[5]\, 
        C => \del_cntr1_tmr3_2[5]\, Y => \del_cntr1[5]_net_1\);
    
    un1_del_cntr1_I_59 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[7]\, B => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\, Y => I_59);
    
    \sequencer_state0_ns_i_1_RNO_2[2]\ : XOR2
      port map(A => \ret_state0[5]_net_1\, B => 
        \ret_state0[0]_net_1\, Y => N_342_i);
    
    \del_cntr0_tmr2[7]\ : DFN1P0
      port map(D => \n_del_cntr0[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[7]\);
    
    un1_del_cntr0_I_51 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[3]\, B => 
        \DWACT_ADD_CI_0_g_array_12_0[0]\, Y => I_51_0);
    
    \sequencer_state0_maj_RNI1A6BA[4]\ : OA1A
      port map(A => un5_del_cntr0, B => N_370, C => 
        \sequencer_state0[4]_net_1\, Y => 
        \sequencer_state0_ns_a2_0[1]\);
    
    \ch_out1_maj[0]\ : MAJ3
      port map(A => \ch_out1_2[0]\, B => \ch_out1_tmr2_2[0]\, C
         => \ch_out1_tmr3_2[0]\, Y => \ch_out1[0]_net_1\);
    
    \ret_state0_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIJFIU1[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_2[1]\);
    
    \del_cntr0_tmr3[13]\ : DFN1P0
      port map(D => \n_del_cntr0[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[13]\);
    
    \del_cntr1[10]\ : DFN1P0
      port map(D => \n_del_cntr1[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[10]\);
    
    \del_cntr0_maj_RNID1UU[3]\ : NOR2
      port map(A => \del_cntr0[3]_net_1\, B => 
        \del_cntr0[4]_net_1\, Y => un5_del_cntr0_2);
    
    un1_del_cntr0_I_71 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_0[0]\);
    
    \ret_state0_maj[3]\ : MAJ3
      port map(A => \ret_state0_2[3]\, B => 
        \ret_state0_tmr2_2[3]\, C => \ret_state0_tmr3_2[3]\, Y
         => \ret_state0[3]_net_1\);
    
    \sequencer_state1_maj_RNIOIV43[4]\ : NOR3C
      port map(A => un6_del_cntr1, B => 
        \sequencer_state1_ns_a2_2_0[0]\, C => channels_ready(2), 
        Y => N_274);
    
    \ret_state0_maj_RNIO134B_0[1]\ : NOR3C
      port map(A => N_374, B => N_378, C => 
        \sequencer_state0_ns_a2_0[3]\, Y => 
        \sequencer_state0_ns[3]\);
    
    \ret_state0_maj_RNIL9GD1[3]\ : NOR3
      port map(A => \ret_state0[4]_net_1\, B => 
        \ret_state0[3]_net_1\, C => \sequencer_state0[5]_net_1\, 
        Y => N_358_1);
    
    \sequencer_state0_maj_RNI7DSJC[3]\ : AO1
      port map(A => \sequencer_state0_ns_a2_0[1]\, B => 
        channels_ready(1), C => \sequencer_state0_ns_0[1]\, Y => 
        \sequencer_state0_ns[1]\);
    
    \del_cntr0_maj[1]\ : MAJ3
      port map(A => \del_cntr0_2[1]\, B => \del_cntr0_tmr2_2[1]\, 
        C => \del_cntr0_tmr3_2[1]\, Y => \del_cntr0[1]_net_1\);
    
    \del_cntr0_maj[11]\ : MAJ3
      port map(A => \del_cntr0_2[11]\, B => 
        \del_cntr0_tmr2_2[11]\, C => \del_cntr0_tmr3_2[11]\, Y
         => \del_cntr0[11]_net_1\);
    
    un1_del_cntr1_I_11 : AND2
      port map(A => \del_cntr1[6]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\);
    
    \sequencer_state1_tmr3[5]\ : DFN1P0
      port map(D => \sequencer_state1_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state1_tmr3_2[5]\);
    
    \ret_state1_tmr3[4]\ : DFN1C0
      port map(D => \ret_state1_maj_RNITH7D[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_2[4]\);
    
    \ch_out1_maj_RNIA39N1[0]\ : MX2
      port map(A => \n_ch_out1[0]\, B => \ch_out1[0]_net_1\, S
         => \sequencer_state1[4]_net_1\, Y => 
        \ch_out1_maj_RNIA39N1[0]_net_1\);
    
    un1_del_cntr1_I_24 : XOR2
      port map(A => \del_cntr1[2]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_1[0]\);
    
    un1_del_cntr0_I_37 : XOR2
      port map(A => \del_cntr0[14]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[14]\);
    
    un1_del_cntr1_I_41 : XOR2
      port map(A => \del_cntr1[12]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[12]\);
    
    \ret_state1_maj_RNIDR8B4[0]\ : AO1
      port map(A => \sequencer_state1_ns_a2_0_1[5]\, B => N_274, 
        C => N_258, Y => \sequencer_state1_ns[5]\);
    
    un1_del_cntr1_I_67 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_10[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_11[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_5[0]\);
    
    \del_cntr1_maj[1]\ : MAJ3
      port map(A => \del_cntr1_2[1]\, B => \del_cntr1_tmr2_2[1]\, 
        C => \del_cntr1_tmr3_2[1]\, Y => \del_cntr1[1]_net_1\);
    
    \del_cntr1_tmr2[5]\ : DFN1P0
      port map(D => \n_del_cntr1[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[5]\);
    
    \sequencer_state1_maj[3]\ : MAJ3
      port map(A => \sequencer_state1_2[3]\, B => 
        \sequencer_state1_tmr2_2[3]\, C => 
        \sequencer_state1_tmr3_2[3]\, Y => 
        \sequencer_state1[3]_net_1\);
    
    \ch_out1_tmr2[2]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIEP3C[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr2_2[2]\);
    
    un1_del_cntr0_I_23 : XOR2
      port map(A => \del_cntr0[5]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_4_0[0]\);
    
    \sequencer_state0_maj_RNIIEIU1[2]\ : NOR3
      port map(A => \sequencer_state0[3]_net_1\, B => 
        \sequencer_state0[2]_net_1\, C => N_368, Y => 
        \sequencer_state0_maj_RNIIEIU1[2]_net_1\);
    
    un1_del_cntr0_I_28 : XOR2
      port map(A => \del_cntr0[8]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_7_0[0]\);
    
    un1_del_cntr0_I_49 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[6]\, B => 
        \DWACT_ADD_CI_0_g_array_11_0[0]\, Y => I_49_0);
    
    \sequencer_state1_tmr2[4]\ : DFN1C0
      port map(D => \sequencer_state1_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr2_2[4]\);
    
    \del_cntr0_tmr2[3]\ : DFN1P0
      port map(D => \n_del_cntr0[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[3]\);
    
    \sequencer_state1_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state1_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr2_2[1]\);
    
    un1_del_cntr0_I_63 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_8_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_9_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\);
    
    \del_cntr0_maj_RNI8STU[0]\ : NOR2
      port map(A => \del_cntr0[2]_net_1\, B => 
        \del_cntr0[0]_net_1\, Y => un5_del_cntr0_1);
    
    \sequencer_state1_maj_RNI2VCVN[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_57, Y => 
        \n_del_cntr1[8]\);
    
    \sequencer_state0_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state0_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr3_2[0]\);
    
    un1_del_cntr1_I_54 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[10]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, Y => I_54);
    
    \sequencer_state0_maj_RNI3P0B2[5]\ : MX2C
      port map(A => \sequencer_state0[5]_net_1\, B => 
        un5_n_ch_out0, S => \sequencer_state0[0]_net_1\, Y => 
        \n_ch_out0[0]\);
    
    \ret_state1_maj[2]\ : MAJ3
      port map(A => \ret_state1_2[2]\, B => 
        \ret_state1_tmr2_2[2]\, C => \ret_state1_tmr3_2[2]\, Y
         => \ret_state1[2]_net_1\);
    
    un1_del_cntr0_I_85 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_1_0[0]\);
    
    un1_del_cntr0_I_68 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_5_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_6_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_2_0[0]\);
    
    \sequencer_state1_maj_RNIOUF8[5]\ : NOR2A
      port map(A => N_267, B => \sequencer_state1[5]_net_1\, Y
         => N_254_1);
    
    \ret_state1_maj_RNITH7D[4]\ : OA1A
      port map(A => N_275, B => \sequencer_state1[5]_net_1\, C
         => \ret_state1[4]_net_1\, Y => 
        \ret_state1_maj_RNITH7D[4]_net_1\);
    
    \del_cntr0_maj[5]\ : MAJ3
      port map(A => \del_cntr0_2[5]\, B => \del_cntr0_tmr2_2[5]\, 
        C => \del_cntr0_tmr3_2[5]\, Y => \del_cntr0[5]_net_1\);
    
    \sequencer_state1_maj_RNI8EIEA1[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_58, Y => 
        \n_del_cntr1[14]\);
    
    \del_cntr0_maj[14]\ : MAJ3
      port map(A => \del_cntr0_2[14]\, B => 
        \del_cntr0_tmr2_2[14]\, C => \del_cntr0_tmr3_2[14]\, Y
         => \del_cntr0[14]_net_1\);
    
    \ret_state1_tmr2[5]\ : DFN1P0
      port map(D => \ret_state1_maj_RNIUI7D[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state1_tmr2_2[5]\);
    
    un1_del_cntr0_I_11 : AND2
      port map(A => \del_cntr0[6]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\);
    
    \del_cntr1_tmr3[12]\ : DFN1P0
      port map(D => \n_del_cntr1[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[12]\);
    
    \del_cntr1[4]\ : DFN1P0
      port map(D => \n_del_cntr1[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[4]\);
    
    un1_del_cntr0_I_82 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_4_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_5_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\);
    
    un1_del_cntr0_I_8 : AND2
      port map(A => \del_cntr0[8]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\);
    
    \ret_state0_maj_RNI99IT_0[1]\ : NOR2A
      port map(A => \ret_state0[1]_net_1\, B => 
        \ret_state0[2]_net_1\, Y => \sequencer_state0_ns_a2_0[4]\);
    
    \ch_out1_maj_RNI21H3[0]\ : OR2A
      port map(A => J11_DEBUG_c_c_0, B => \ch_out1[0]_net_1\, Y
         => OUT_CHANNEL_VOSG_c(2));
    
    un1_del_cntr1_I_71 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12[0]\);
    
    un1_del_cntr0_I_55 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[9]\, B => 
        \DWACT_ADD_CI_0_g_array_12_3_0[0]\, Y => I_55_0);
    
    \sequencer_state0_ns_i_a2[2]\ : NOR2A
      port map(A => N_349, B => \sequencer_state0[5]_net_1\, Y
         => N_357);
    
    \sequencer_state0_maj_RNIQEQ81_1[0]\ : NOR2A
      port map(A => channels_ready(1), B => 
        \sequencer_state0[0]_net_1\, Y => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\);
    
    \ch_out1_maj[2]\ : MAJ3
      port map(A => \ch_out1_2[2]\, B => \ch_out1_tmr2_2[2]\, C
         => \ch_out1_tmr3_2[2]\, Y => \ch_out1[2]_net_1\);
    
    \ret_state1_maj_RNIGF9I[0]\ : NOR3C
      port map(A => N_254_1, B => N_238_i, C => N_271, Y => N_255);
    
    \del_cntr1_maj_RNI8RI32[5]\ : NOR3C
      port map(A => un6_del_cntr1_10, B => un6_del_cntr1_9, C => 
        un6_del_cntr1_11, Y => un6_del_cntr1);
    
    \del_cntr0[12]\ : DFN1P0
      port map(D => \n_del_cntr0[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[12]\);
    
    \ret_state1_maj[3]\ : MAJ3
      port map(A => \ret_state1_2[3]\, B => 
        \ret_state1_tmr2_2[3]\, C => \ret_state1_tmr3_2[3]\, Y
         => \ret_state1[3]_net_1\);
    
    un1_del_cntr1_I_23 : XOR2
      port map(A => \del_cntr1[5]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\);
    
    un1_del_cntr0_I_75 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_2_0[0]\);
    
    un1_del_cntr0_I_52 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[2]\, B => 
        \DWACT_ADD_CI_0_g_array_1_0[0]\, Y => I_52_0);
    
    un1_del_cntr0_I_5 : AND2
      port map(A => \del_cntr0[7]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_7_0[0]\);
    
    un1_del_cntr1_I_81 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_1[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_2[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_10[0]\);
    
    un1_del_cntr1_I_28 : XOR2
      port map(A => \del_cntr1[8]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_7[0]\);
    
    un1_del_cntr1_I_36 : XOR2
      port map(A => \del_cntr1[1]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[1]\);
    
    \del_cntr0_tmr3[6]\ : DFN1P0
      port map(D => \n_del_cntr0[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[6]\);
    
    \del_cntr0[0]\ : DFN1P0
      port map(D => \n_del_cntr0[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[0]\);
    
    un1_del_cntr0_I_20 : XOR2
      port map(A => \del_cntr0[10]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_9_0[0]\);
    
    \ret_state1_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNINB7D[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_2[1]\);
    
    un1_del_cntr0_I_72 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_6_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_6_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_7_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_3_0[0]\);
    
    un1_del_cntr0_I_7 : AND2
      port map(A => \del_cntr0[2]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\);
    
    \sequencer_state1_maj_RNIP7O57[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_52, Y => 
        \n_del_cntr1[2]\);
    
    un1_del_cntr1_I_45 : XOR2
      port map(A => \del_cntr1[9]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[9]\);
    
    \sequencer_state1_maj_RNIMA7D[2]\ : NOR3
      port map(A => \sequencer_state1[3]_net_1\, B => 
        \sequencer_state1[2]_net_1\, C => N_264, Y => 
        \sequencer_state1_maj_RNIMA7D[2]_net_1\);
    
    \del_cntr1_tmr3[10]\ : DFN1P0
      port map(D => \n_del_cntr1[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[10]\);
    
    \ch_out1_tmr2[0]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIA39N1[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr2_2[0]\);
    
    \sequencer_state0_tmr2[3]\ : DFN1C0
      port map(D => \sequencer_state0_ns_i[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state0_tmr2_2[3]\);
    
    \ch_out0_tmr3[1]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIELCD2[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr3_2[1]\);
    
    \del_cntr1_maj_RNIM9KH[14]\ : NOR3
      port map(A => \del_cntr1[1]_net_1\, B => 
        \del_cntr1[14]_net_1\, C => \del_cntr1[13]_net_1\, Y => 
        un6_del_cntr1_7);
    
    un1_del_cntr1_I_12 : AND2
      port map(A => \del_cntr1[9]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_9[0]\);
    
    un1_del_cntr1_I_1 : AND2
      port map(A => \del_cntr1[0]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_TMP[0]\);
    
    un1_del_cntr0_I_44 : XOR2
      port map(A => \del_cntr0[10]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[10]\);
    
    \del_cntr0_tmr3[9]\ : DFN1P0
      port map(D => \n_del_cntr0[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[9]\);
    
    \del_cntr1_tmr3[2]\ : DFN1P0
      port map(D => \n_del_cntr1[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[2]\);
    
    un1_del_cntr1_I_42 : XOR2
      port map(A => \del_cntr1[0]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[0]\);
    
    un1_del_cntr0_I_60 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[13]\, B => 
        \DWACT_ADD_CI_0_g_array_12_5_0[0]\, Y => I_60_0);
    
    \del_cntr1[0]\ : DFN1P0
      port map(D => \n_del_cntr1[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[0]\);
    
    \sequencer_state0_maj_RNIKUVSJ[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_51_0, Y => 
        \n_del_cntr0[3]\);
    
    \del_cntr1_tmr3[7]\ : DFN1P0
      port map(D => \n_del_cntr1[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[7]\);
    
    \del_cntr0_maj[10]\ : MAJ3
      port map(A => \del_cntr0_2[10]\, B => 
        \del_cntr0_tmr2_2[10]\, C => \del_cntr0_tmr3_2[10]\, Y
         => \del_cntr0[10]_net_1\);
    
    \ch_out0[2]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIATET1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_2[2]\);
    
    un1_del_cntr1_I_53 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[4]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, Y => I_53);
    
    \ret_state0_tmr3[4]\ : DFN1C0
      port map(D => \ret_state0_maj_RNIPLIU1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_2[4]\);
    
    \del_cntr0_maj[7]\ : MAJ3
      port map(A => \del_cntr0_2[7]\, B => \del_cntr0_tmr2_2[7]\, 
        C => \del_cntr0_tmr3_2[7]\, Y => \del_cntr0[7]_net_1\);
    
    \ret_state0_maj_RNI99IT[1]\ : NOR2A
      port map(A => \ret_state0[2]_net_1\, B => 
        \ret_state0[1]_net_1\, Y => \sequencer_state0_ns_a2_0[3]\);
    
    un1_del_cntr1_I_58 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[14]\, B => 
        \DWACT_ADD_CI_0_g_array_11_2[0]\, Y => I_58);
    
    un1_del_cntr1_I_90 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_3[0]\);
    
    \sequencer_state1_maj_RNITNFS_0[0]\ : NOR2A
      port map(A => channels_ready(2), B => 
        \sequencer_state1[0]_net_1\, Y => N_276_0);
    
    \ret_state1_maj_RNI7CME[3]\ : NOR3C
      port map(A => N_270, B => \sequencer_state1_ns_a2_0_0[1]\, 
        C => N_271, Y => N_266);
    
    un1_del_cntr0_I_31 : XOR2
      port map(A => \del_cntr0[3]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_2_0[0]\);
    
    \del_cntr1_tmr3[5]\ : DFN1P0
      port map(D => \n_del_cntr1[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[5]\);
    
    un1_del_cntr0_I_89 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_1_0[0]\);
    
    \sequencer_state0_tmr2[5]\ : DFN1P0
      port map(D => \sequencer_state0_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state0_tmr2_2[5]\);
    
    \ret_state1_maj_RNIOGP9[0]\ : NOR3B
      port map(A => \ret_state1[0]_net_1\, B => N_271, C => 
        \ret_state1[5]_net_1\, Y => 
        \sequencer_state1_ns_a2_0_1[5]\);
    
    \del_cntr0_tmr3[8]\ : DFN1P0
      port map(D => \n_del_cntr0[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[8]\);
    
    \sequencer_state1_maj_RNI05059[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_51, Y => 
        \n_del_cntr1[3]\);
    
    un1_del_cntr1_I_20 : XOR2
      port map(A => \del_cntr1[10]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_9[0]\);
    
    \sequencer_state0_maj[5]\ : MAJ3
      port map(A => \sequencer_state0_2[5]\, B => 
        \sequencer_state0_tmr2_2[5]\, C => 
        \sequencer_state0_tmr3_2[5]\, Y => 
        \sequencer_state0[5]_net_1\);
    
    \ret_state1[4]\ : DFN1C0
      port map(D => \ret_state1_maj_RNITH7D[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state1_2[4]\);
    
    \del_cntr1_tmr3[1]\ : DFN1P0
      port map(D => \n_del_cntr1[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[1]\);
    
    \del_cntr1_tmr2[9]\ : DFN1P0
      port map(D => \n_del_cntr1[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[9]\);
    
    \sequencer_state0_maj_RNIVVR1N1[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_54_0, Y => 
        \n_del_cntr0[10]\);
    
    \del_cntr1[12]\ : DFN1P0
      port map(D => \n_del_cntr1[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[12]\);
    
    \sequencer_state0[1]\ : DFN1C0
      port map(D => \sequencer_state0_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_2[1]\);
    
    \del_cntr0_tmr3[0]\ : DFN1P0
      port map(D => \n_del_cntr0[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[0]\);
    
    \del_cntr0_maj[8]\ : MAJ3
      port map(A => \del_cntr0_2[8]\, B => \del_cntr0_tmr2_2[8]\, 
        C => \del_cntr0_tmr3_2[8]\, Y => \del_cntr0[8]_net_1\);
    
    \sequencer_state1_maj_RNIVDRR41[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_50, Y => 
        \n_del_cntr1[12]\);
    
    \sequencer_state1_maj[5]\ : MAJ3
      port map(A => \sequencer_state1_2[5]\, B => 
        \sequencer_state1_tmr2_2[5]\, C => 
        \sequencer_state1_tmr3_2[5]\, Y => 
        \sequencer_state1[5]_net_1\);
    
    \main_sequencer.un5_n_ch_out0\ : NOR3C
      port map(A => total_channel_constraints_0, B => 
        channels_desired_on(1), C => dtycyc_en, Y => 
        un5_n_ch_out0);
    
    un1_del_cntr1_I_75 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_5[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_2[0]\);
    
    un1_del_cntr1_I_37 : XOR2
      port map(A => \del_cntr1[14]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[14]\);
    
    \del_cntr1_maj[9]\ : MAJ3
      port map(A => \del_cntr1_2[9]\, B => \del_cntr1_tmr2_2[9]\, 
        C => \del_cntr1_tmr3_2[9]\, Y => \del_cntr1[9]_net_1\);
    
    un1_del_cntr0_I_59 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[7]\, B => 
        \DWACT_ADD_CI_0_g_array_12_2_0[0]\, Y => I_59_0);
    
    un1_del_cntr0_I_12 : AND2
      port map(A => \del_cntr0[9]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_9_0[0]\);
    
    un1_del_cntr0_I_1 : AND2
      port map(A => \del_cntr0[0]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_TMP_0[0]\);
    
    \del_cntr0_tmr3[3]\ : DFN1P0
      port map(D => \n_del_cntr0[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[3]\);
    
    \del_cntr0[2]\ : DFN1P0
      port map(D => \n_del_cntr0[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[2]\);
    
    \del_cntr0_maj[6]\ : MAJ3
      port map(A => \del_cntr0_2[6]\, B => \del_cntr0_tmr2_2[6]\, 
        C => \del_cntr0_tmr3_2[6]\, Y => \del_cntr0[6]_net_1\);
    
    \ch_out0_tmr2[2]\ : DFN1C0
      port map(D => \ch_out0_maj_RNIATET1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr2_2[2]\);
    
    \sequencer_state1_tmr3[4]\ : DFN1C0
      port map(D => \sequencer_state1_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr3_2[4]\);
    
    \sequencer_state1_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state1_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr3_2[1]\);
    
    \ret_state0[0]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIIEIU1[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_2[0]\);
    
    \del_cntr1[5]\ : DFN1P0
      port map(D => \n_del_cntr1[5]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[5]\);
    
    \sequencer_state0_tmr3[3]\ : DFN1C0
      port map(D => \sequencer_state0_ns_i[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state0_tmr3_2[3]\);
    
    \sequencer_state0_maj_RNIQPG3B[0]\ : OR3
      port map(A => N_379, B => N_364, C => 
        \DWACT_ADD_CI_0_partial_sum[0]\, Y => \n_del_cntr0[0]\);
    
    un1_del_cntr0_I_79 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_2_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_3_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_1_0[0]\);
    
    \sequencer_state0_tmr2[0]\ : DFN1C0
      port map(D => \sequencer_state0_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr2_2[0]\);
    
    un1_del_cntr1_I_72 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_6[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_6[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_7[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\);
    
    un1_del_cntr1_I_7 : AND2
      port map(A => \del_cntr1[2]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_2[0]\);
    
    \ret_state1[3]\ : DFN1C0
      port map(D => \ret_state1_maj_RNISG7D[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state1_2[3]\);
    
    un1_del_cntr1_I_85 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_1[0]\);
    
    \ret_state1_maj[4]\ : MAJ3
      port map(A => \ret_state1_2[4]\, B => 
        \ret_state1_tmr2_2[4]\, C => \ret_state1_tmr3_2[4]\, Y
         => \ret_state1[4]_net_1\);
    
    \sequencer_state1_maj_RNIL8LUP[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_55, Y => 
        \n_del_cntr1[9]\);
    
    \ret_state0_tmr2[5]\ : DFN1P0
      port map(D => \ret_state0_maj_RNIQMIU1[5]_net_1\, CLK => 
        clk_5m_gl, PRE => master_rst_b, Q => 
        \ret_state0_tmr2_2[5]\);
    
    un1_del_cntr0_I_43 : XOR2
      port map(A => \del_cntr0[11]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[11]\);
    
    \ret_state0[4]\ : DFN1C0
      port map(D => \ret_state0_maj_RNIPLIU1[4]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state0_2[4]\);
    
    \del_cntr0[8]\ : DFN1P0
      port map(D => \n_del_cntr0[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[8]\);
    
    \ret_state1_maj_RNIFRS4_0[3]\ : NOR2
      port map(A => \ret_state1[3]_net_1\, B => 
        \ret_state1[4]_net_1\, Y => N_267);
    
    un1_del_cntr1_I_19 : XOR2
      port map(A => \del_cntr1[7]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_6[0]\);
    
    \sequencer_state0_maj_RNIQEQ81[0]\ : NOR2B
      port map(A => \sequencer_state0[0]_net_1\, B => 
        channels_ready(1), Y => N_362);
    
    \sequencer_state0_maj_RNI67VF51[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_59_0, Y => 
        \n_del_cntr0[7]\);
    
    un1_del_cntr1_I_49 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[6]\, B => 
        \DWACT_ADD_CI_0_g_array_11[0]\, Y => I_49);
    
    un1_del_cntr0_I_48 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[11]\, B => 
        \DWACT_ADD_CI_0_g_array_12_4_0[0]\, Y => I_48_0);
    
    \ch_out0_maj[2]\ : MAJ3
      port map(A => \ch_out0_2[2]\, B => \ch_out0_tmr2_2[2]\, C
         => \ch_out0_tmr3_2[2]\, Y => \ch_mreg_en[1]\);
    
    un1_del_cntr1_I_82 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_4[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\);
    
    un1_del_cntr1_I_8 : AND2
      port map(A => \del_cntr1[8]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\);
    
    \sequencer_state1_maj_RNIBV57[2]\ : OR2
      port map(A => \sequencer_state1[2]_net_1\, B => 
        \sequencer_state1[1]_net_1\, Y => N_243);
    
    \ret_state1[0]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIMA7D[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_2[0]\);
    
    un1_del_cntr1_I_50 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[12]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, Y => I_50);
    
    \sequencer_state0[4]\ : DFN1C0
      port map(D => \sequencer_state0_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_2[4]\);
    
    \ret_state0_maj[5]\ : MAJ3
      port map(A => \ret_state0_2[5]\, B => 
        \ret_state0_tmr2_2[5]\, C => \ret_state0_tmr3_2[5]\, Y
         => \ret_state0[5]_net_1\);
    
    \del_cntr1_tmr3[13]\ : DFN1P0
      port map(D => \n_del_cntr1[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[13]\);
    
    \del_cntr0_maj[0]\ : MAJ3
      port map(A => \del_cntr0_2[0]\, B => \del_cntr0_tmr2_2[0]\, 
        C => \del_cntr0_tmr3_2[0]\, Y => \del_cntr0[0]_net_1\);
    
    \ret_state0_maj_RNIKK4R1_0[0]\ : NOR3B
      port map(A => \ret_state0[0]_net_1\, B => N_375, C => 
        \ret_state0[5]_net_1\, Y => 
        \sequencer_state0_ns_a2_0_1[5]\);
    
    \sequencer_state1[5]\ : DFN1P0
      port map(D => \sequencer_state1_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state1_2[5]\);
    
    \sequencer_state1[4]\ : DFN1C0
      port map(D => \sequencer_state1_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_2[4]\);
    
    \del_cntr0_tmr3[14]\ : DFN1P0
      port map(D => \n_del_cntr0[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[14]\);
    
    \del_cntr1_maj[12]\ : MAJ3
      port map(A => \del_cntr1_2[12]\, B => 
        \del_cntr1_tmr2_2[12]\, C => \del_cntr1_tmr3_2[12]\, Y
         => \del_cntr1[12]_net_1\);
    
    \ch_out1_maj[1]\ : MAJ3
      port map(A => \ch_out1_2[1]\, B => \ch_out1_tmr2_2[1]\, C
         => \ch_out1_tmr3_2[1]\, Y => \ch_out1[1]_net_1\);
    
    \ch_out1_maj_RNIJOMF[1]\ : MX2A
      port map(A => N_265, B => \ch_out1[1]_net_1\, S => 
        \sequencer_state1[4]_net_1\, Y => 
        \ch_out1_maj_RNIJOMF[1]_net_1\);
    
    \sequencer_state1_maj[4]\ : MAJ3
      port map(A => \sequencer_state1_2[4]\, B => 
        \sequencer_state1_tmr2_2[4]\, C => 
        \sequencer_state1_tmr3_2[4]\, Y => 
        \sequencer_state1[4]_net_1\);
    
    \del_cntr0_tmr2[13]\ : DFN1P0
      port map(D => \n_del_cntr0[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[13]\);
    
    \ch_out0_maj[0]\ : MAJ3
      port map(A => \ch_out0_2[0]\, B => \ch_out0_tmr2_2[0]\, C
         => \ch_out0_tmr3_2[0]\, Y => \OUT_CHANNEL_VOSG_c[1]\);
    
    \del_cntr1[6]\ : DFN1P0
      port map(D => \n_del_cntr1[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[6]\);
    
    \ret_state0_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIJFIU1[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_2[1]\);
    
    \ret_state0_maj_RNIOKIU1[3]\ : OA1A
      port map(A => N_379, B => \sequencer_state0[5]_net_1\, C
         => \ret_state0[3]_net_1\, Y => 
        \ret_state0_maj_RNIOKIU1[3]_net_1\);
    
    \del_cntr0_tmr3[11]\ : DFN1P0
      port map(D => \n_del_cntr0[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[11]\);
    
    \sequencer_state0_tmr3[5]\ : DFN1P0
      port map(D => \sequencer_state0_ns[0]\, CLK => clk_5m_gl, 
        PRE => master_rst_b, Q => \sequencer_state0_tmr3_2[5]\);
    
    \sequencer_state1_maj_RNIFTOA[0]\ : NOR2
      port map(A => N_243, B => \sequencer_state1[0]_net_1\, Y
         => N_265);
    
    \sequencer_state1_maj_RNI80B371[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_60, Y => 
        \n_del_cntr1[13]\);
    
    \sequencer_state1_tmr2[2]\ : DFN1C0
      port map(D => \sequencer_state1_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr2_2[2]\);
    
    \ret_state0_maj_RNIO134B[1]\ : NOR3C
      port map(A => N_374, B => N_378, C => 
        \sequencer_state0_ns_a2_0[4]\, Y => 
        \sequencer_state0_ns[4]\);
    
    \del_cntr1_maj[3]\ : MAJ3
      port map(A => \del_cntr1_2[3]\, B => \del_cntr1_tmr2_2[3]\, 
        C => \del_cntr1_tmr3_2[3]\, Y => \del_cntr1[3]_net_1\);
    
    un1_del_cntr0_I_35 : XOR2
      port map(A => \del_cntr0[7]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[7]\);
    
    \sequencer_state1_maj_RNIC067[0]\ : NOR2
      port map(A => \sequencer_state1[0]_net_1\, B => 
        \sequencer_state1[4]_net_1\, Y => N_275);
    
    \ret_state1_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNIMA7D[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_2[0]\);
    
    \ret_state1_maj_RNIFRS4[3]\ : NOR2A
      port map(A => \ret_state1[4]_net_1\, B => 
        \ret_state1[3]_net_1\, Y => 
        \sequencer_state1_ns_a2_0_0[1]\);
    
    \del_cntr1_tmr3[4]\ : DFN1P0
      port map(D => \n_del_cntr1[4]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[4]\);
    
    un1_del_cntr0_I_26 : XOR2
      port map(A => \del_cntr0[6]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_5_0[0]\);
    
    \del_cntr1[3]\ : DFN1P0
      port map(D => \n_del_cntr1[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[3]\);
    
    \ret_state1_maj[1]\ : MAJ3
      port map(A => \ret_state1_2[1]\, B => 
        \ret_state1_tmr2_2[1]\, C => \ret_state1_tmr3_2[1]\, Y
         => \ret_state1[1]_net_1\);
    
    un1_del_cntr1_I_65 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_11[0]\, B => 
        \DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_5[0]\);
    
    un1_del_cntr0_I_54 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[10]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\, Y => I_54_0);
    
    \del_cntr1_maj_RNIFF86[3]\ : NOR2
      port map(A => \del_cntr1[3]_net_1\, B => 
        \del_cntr1[4]_net_1\, Y => un6_del_cntr1_2);
    
    un1_del_cntr0_I_90 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_0_8_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_1_3_0[0]\);
    
    \del_cntr1_tmr2[2]\ : DFN1P0
      port map(D => \n_del_cntr1[2]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[2]\);
    
    \sequencer_state1_tmr3[2]\ : DFN1C0
      port map(D => \sequencer_state1_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_tmr3_2[2]\);
    
    un1_del_cntr0_I_19 : XOR2
      port map(A => \del_cntr0[7]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_6_0[0]\);
    
    un1_del_cntr0_I_74 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_8_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_3_0[0]\);
    
    \sequencer_state0_maj_RNIL1DCG[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_52_0, Y => 
        \n_del_cntr0[2]\);
    
    \del_cntr1_tmr2[7]\ : DFN1P0
      port map(D => \n_del_cntr1[7]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[7]\);
    
    \ch_out0_tmr2[0]\ : DFN1C0
      port map(D => \ch_out0_maj_RNI45K83[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_tmr2_2[0]\);
    
    \sequencer_state1_maj[0]\ : MAJ3
      port map(A => \sequencer_state1_2[0]\, B => 
        \sequencer_state1_tmr2_2[0]\, C => 
        \sequencer_state1_tmr3_2[0]\, Y => 
        \sequencer_state1[0]_net_1\);
    
    un1_del_cntr1_I_62 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[5]\, B => 
        \DWACT_ADD_CI_0_g_array_12_1[0]\, Y => I_62);
    
    un1_del_cntr1_I_6 : AND2
      port map(A => \del_cntr1[3]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_g_array_0_3[0]\);
    
    un1_del_cntr0_I_66 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_2_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_3_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_1_0[0]\);
    
    un1_del_cntr0_I_40 : XOR2
      port map(A => \del_cntr0[8]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[8]\);
    
    un1_del_cntr1_I_79 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_3[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\);
    
    un1_del_cntr1_I_14 : AND2
      port map(A => \del_cntr1[5]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_5[0]\);
    
    \sequencer_state0_tmr2[4]\ : DFN1C0
      port map(D => \sequencer_state0_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr2_2[4]\);
    
    \ret_state1[1]\ : DFN1C0
      port map(D => \sequencer_state1_maj_RNINB7D[1]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_2[1]\);
    
    \sequencer_state0_tmr2[1]\ : DFN1C0
      port map(D => \sequencer_state0_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr2_2[1]\);
    
    \sequencer_state1_maj_RNINB7D[1]\ : NOR3
      port map(A => \sequencer_state1[3]_net_1\, B => 
        \sequencer_state1[1]_net_1\, C => N_263, Y => 
        \sequencer_state1_maj_RNINB7D[1]_net_1\);
    
    un1_del_cntr1_I_44 : XOR2
      port map(A => \del_cntr1[10]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[10]\);
    
    \sequencer_state0_maj_RNIAIRV[0]\ : NOR2
      port map(A => \sequencer_state0[0]_net_1\, B => 
        \sequencer_state0[4]_net_1\, Y => N_379);
    
    un1_del_cntr1_I_89 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_1[0]\);
    
    \ret_state1_tmr2[3]\ : DFN1C0
      port map(D => \ret_state1_maj_RNISG7D[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr2_2[3]\);
    
    \ret_state1_maj_RNIOC7D[2]\ : AO1A
      port map(A => N_243, B => \ret_state1[2]_net_1\, C => 
        \sequencer_state1[3]_net_1\, Y => 
        \ret_state1_maj_RNIOC7D[2]_net_1\);
    
    \ret_state1[2]\ : DFN1C0
      port map(D => \ret_state1_maj_RNIOC7D[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state1_2[2]\);
    
    \del_cntr0_tmr2[8]\ : DFN1P0
      port map(D => \n_del_cntr0[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[8]\);
    
    \sequencer_state0_maj_RNI5G2QH1[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_55_0, Y => 
        \n_del_cntr0[9]\);
    
    \ch_out0_maj[1]\ : MAJ3
      port map(A => \ch_out0_2[1]\, B => \ch_out0_tmr2_2[1]\, C
         => \ch_out0_tmr3_2[1]\, Y => \ch_iaux_en[1]\);
    
    \sequencer_state1_maj_RNIP5VM4[5]\ : NOR3A
      port map(A => channels_ready(2), B => 
        \sequencer_state1_ns_i_0[2]\, C => N_253, Y => 
        \sequencer_state1_maj_RNIP5VM4[5]_net_1\);
    
    \ch_out0_maj_RNIATET1[2]\ : MX2A
      port map(A => N_353, B => \ch_mreg_en[1]\, S => 
        \sequencer_state0[4]_net_1\, Y => 
        \ch_out0_maj_RNIATET1[2]_net_1\);
    
    \del_cntr1_tmr2[12]\ : DFN1P0
      port map(D => \n_del_cntr1[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[12]\);
    
    \del_cntr0_tmr2[0]\ : DFN1P0
      port map(D => \n_del_cntr0[0]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[0]\);
    
    \sequencer_state1_maj_RNINTF8[4]\ : NOR2B
      port map(A => \sequencer_state1[4]_net_1\, B => N_267, Y
         => \sequencer_state1_ns_a2_2_0[0]\);
    
    un1_del_cntr1_I_26 : XOR2
      port map(A => \del_cntr1[6]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_5[0]\);
    
    un1_del_cntr0_I_83 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_1_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\);
    
    \sequencer_state0_maj[0]\ : MAJ3
      port map(A => \sequencer_state0_2[0]\, B => 
        \sequencer_state0_tmr2_2[0]\, C => 
        \sequencer_state0_tmr3_2[0]\, Y => 
        \sequencer_state0[0]_net_1\);
    
    un1_del_cntr1_I_31 : XOR2
      port map(A => \del_cntr1[3]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_2[0]\);
    
    \ret_state0_maj[1]\ : MAJ3
      port map(A => \ret_state0_2[1]\, B => 
        \ret_state0_tmr2_2[1]\, C => \ret_state0_tmr3_2[1]\, Y
         => \ret_state0[1]_net_1\);
    
    \del_cntr1[9]\ : DFN1P0
      port map(D => \n_del_cntr1[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_2[9]\);
    
    un1_del_cntr0_I_88 : AND2
      port map(A => \DWACT_ADD_CI_0_pog_array_1_1_0[0]\, B => 
        \DWACT_ADD_CI_0_pog_array_1_2_0[0]\, Y => 
        \DWACT_ADD_CI_0_pog_array_2_0[0]\);
    
    un1_del_cntr0_I_27 : XOR2
      port map(A => \del_cntr0[11]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_pog_array_0_10_0[0]\);
    
    \sequencer_state1[0]\ : DFN1C0
      port map(D => \sequencer_state1_ns[5]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state1_2[0]\);
    
    \sequencer_state0_maj_RNISM6OB2[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_58_0, Y => 
        \n_del_cntr0[14]\);
    
    \del_cntr1_tmr2[3]\ : DFN1P0
      port map(D => \n_del_cntr1[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[3]\);
    
    un1_del_cntr0_I_53 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[4]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, Y => I_53_0);
    
    \del_cntr1_tmr3[11]\ : DFN1P0
      port map(D => \n_del_cntr1[11]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[11]\);
    
    \del_cntr1_maj_RNIF35U[0]\ : NOR3C
      port map(A => un6_del_cntr1_2, B => un6_del_cntr1_1, C => 
        un6_del_cntr1_7, Y => un6_del_cntr1_11);
    
    un1_del_cntr0_I_14 : AND2
      port map(A => \del_cntr0[5]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_5_0[0]\);
    
    \del_cntr0_tmr2[6]\ : DFN1P0
      port map(D => \n_del_cntr0[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[6]\);
    
    un1_del_cntr0_I_73 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_12_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_13_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_6_0[0]\);
    
    un1_del_cntr0_I_58 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[14]\, B => 
        \DWACT_ADD_CI_0_g_array_11_2_0[0]\, Y => I_58_0);
    
    \del_cntr1_maj[13]\ : MAJ3
      port map(A => \del_cntr1_2[13]\, B => 
        \del_cntr1_tmr2_2[13]\, C => \del_cntr1_tmr3_2[13]\, Y
         => \del_cntr1[13]_net_1\);
    
    \del_cntr0_tmr3[12]\ : DFN1P0
      port map(D => \n_del_cntr0[12]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[12]\);
    
    un1_del_cntr0_I_67 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_10_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_10_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_11_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_5_0[0]\);
    
    \sequencer_state1_maj_RNITNFS[0]\ : NOR2B
      port map(A => \sequencer_state1[0]_net_1\, B => 
        channels_ready(2), Y => N_258);
    
    un1_del_cntr0_I_39 : XOR2
      port map(A => \del_cntr0[13]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[13]\);
    
    \del_cntr1_tmr2[10]\ : DFN1P0
      port map(D => \n_del_cntr1[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[10]\);
    
    un1_del_cntr1_I_74 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_7[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_8[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_3[0]\);
    
    \del_cntr0_tmr3[10]\ : DFN1P0
      port map(D => \n_del_cntr0[10]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr3_2[10]\);
    
    un1_del_cntr1_I_69 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_9[0]\, B => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_10[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\);
    
    un1_del_cntr0_I_78 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_1_0[0]\);
    
    un1_del_cntr1_I_13 : AND2
      port map(A => \del_cntr1[12]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\);
    
    \ret_state1_maj[5]\ : MAJ3
      port map(A => \ret_state1_2[5]\, B => 
        \ret_state1_tmr2_2[5]\, C => \ret_state1_tmr3_2[5]\, Y
         => \ret_state1[5]_net_1\);
    
    un1_del_cntr1_I_56 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[1]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, Y => I_56);
    
    \ret_state0_maj[4]\ : MAJ3
      port map(A => \ret_state0_2[4]\, B => 
        \ret_state0_tmr2_2[4]\, C => \ret_state0_tmr3_2[4]\, Y
         => \ret_state0[4]_net_1\);
    
    un1_del_cntr1_I_43 : XOR2
      port map(A => \del_cntr1[11]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[11]\);
    
    un1_del_cntr1_I_18 : AND2
      port map(A => \del_cntr1[1]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\);
    
    \sequencer_state1_maj_RNII0PA_0[3]\ : NOR2
      port map(A => \sequencer_state1[3]_net_1\, B => N_243, Y
         => \sequencer_state1_ns_a2_0[0]\);
    
    \del_cntr0_maj_RNIL9UU[7]\ : NOR2
      port map(A => \del_cntr0[7]_net_1\, B => 
        \del_cntr0[8]_net_1\, Y => un5_del_cntr0_4);
    
    un1_del_cntr1_I_48 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[11]\, B => 
        \DWACT_ADD_CI_0_g_array_12_4[0]\, Y => I_48);
    
    \del_cntr0_maj_RNIBDIQ1[10]\ : NOR3A
      port map(A => un5_del_cntr0_6, B => \del_cntr0[10]_net_1\, 
        C => \del_cntr0[9]_net_1\, Y => un5_del_cntr0_10);
    
    \del_cntr0_maj[2]\ : MAJ3
      port map(A => \del_cntr0_2[2]\, B => \del_cntr0_tmr2_2[2]\, 
        C => \del_cntr0_tmr3_2[2]\, Y => \del_cntr0[2]_net_1\);
    
    \sequencer_state1_maj_RNID3S3C[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_53, Y => 
        \n_del_cntr1[4]\);
    
    \main_sequencer.un2_n_ch_out1\ : NOR3C
      port map(A => N_7_0, B => channels_desired_on(2), C => 
        dtycyc_en, Y => un2_n_ch_out1);
    
    \ret_state0_tmr3[0]\ : DFN1C0
      port map(D => \sequencer_state0_maj_RNIIEIU1[2]_net_1\, CLK
         => clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr3_2[0]\);
    
    \del_cntr1_maj[8]\ : MAJ3
      port map(A => \del_cntr1_2[8]\, B => \del_cntr1_tmr2_2[8]\, 
        C => \del_cntr1_tmr3_2[8]\, Y => \del_cntr1[8]_net_1\);
    
    \sequencer_state0_ns_i[2]\ : NOR2
      port map(A => \sequencer_state0_ns_i_1[2]_net_1\, B => 
        N_357, Y => \sequencer_state0_ns_i[2]_net_1\);
    
    \del_cntr1_maj_RNINN86[7]\ : NOR2
      port map(A => \del_cntr1[7]_net_1\, B => 
        \del_cntr1[8]_net_1\, Y => un6_del_cntr1_4);
    
    \sequencer_state1_maj_RNIQE81J[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_59, Y => 
        \n_del_cntr1[7]\);
    
    \del_cntr0_maj_RNIJI6C1[14]\ : NOR3
      port map(A => \del_cntr0[1]_net_1\, B => 
        \del_cntr0[14]_net_1\, C => \del_cntr0[13]_net_1\, Y => 
        un5_del_cntr0_7);
    
    un1_del_cntr1_I_27 : XOR2
      port map(A => \del_cntr1[11]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_pog_array_0_10[0]\);
    
    \del_cntr1_tmr3[6]\ : DFN1P0
      port map(D => \n_del_cntr1[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[6]\);
    
    \ch_out0[0]\ : DFN1C0
      port map(D => \ch_out0_maj_RNI45K83[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out0_2[0]\);
    
    un1_del_cntr0_I_80 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_4_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_1_4_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_5_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_2_2_0[0]\);
    
    \ret_state1_maj_RNIBNS4[1]\ : NOR2A
      port map(A => \ret_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => \sequencer_state1_ns_a2_0[3]\);
    
    \del_cntr0_tmr2[1]\ : DFN1P0
      port map(D => \n_del_cntr0[1]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_tmr2_2[1]\);
    
    \del_cntr1_tmr3[14]\ : DFN1P0
      port map(D => \n_del_cntr1[14]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[14]\);
    
    \del_cntr0[6]\ : DFN1P0
      port map(D => \n_del_cntr0[6]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[6]\);
    
    \ret_state0_maj_RNIDL1G8[3]\ : NOR2B
      port map(A => \sequencer_state0_ns_a2_2_0[0]\, B => 
        un5_del_cntr0, Y => N_377);
    
    \sequencer_state1_maj_RNIBB16[2]\ : NOR2
      port map(A => \sequencer_state1[2]_net_1\, B => 
        \ret_state1[1]_net_1\, Y => N_263);
    
    \sequencer_state0_maj[2]\ : MAJ3
      port map(A => \sequencer_state0_2[2]\, B => 
        \sequencer_state0_tmr2_2[2]\, C => 
        \sequencer_state0_tmr3_2[2]\, Y => 
        \sequencer_state0[2]_net_1\);
    
    \del_cntr1_maj[11]\ : MAJ3
      port map(A => \del_cntr1_2[11]\, B => 
        \del_cntr1_tmr2_2[11]\, C => \del_cntr1_tmr3_2[11]\, Y
         => \del_cntr1[11]_net_1\);
    
    \sequencer_state0_ns_i_a2_RNO[2]\ : OR3B
      port map(A => un5_del_cntr0, B => 
        \sequencer_state0[4]_net_1\, C => N_370, Y => N_349);
    
    \ret_state0[2]\ : DFN1C0
      port map(D => \ret_state0_maj_RNIKGIU1[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ret_state0_2[2]\);
    
    \sequencer_state0_ns_i_1_RNO_1[2]\ : NOR3C
      port map(A => N_358_1, B => N_342_i, C => N_375, Y => N_359);
    
    \sequencer_state0[2]\ : DFN1C0
      port map(D => \sequencer_state0_ns[3]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_2[2]\);
    
    \del_cntr0_maj_RNIBGNS[11]\ : NOR2
      port map(A => \del_cntr0[11]_net_1\, B => 
        \del_cntr0[12]_net_1\, Y => un5_del_cntr0_6);
    
    \del_cntr1_tmr3[9]\ : DFN1P0
      port map(D => \n_del_cntr1[9]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[9]\);
    
    \del_cntr0_maj_RNI6FST1[5]\ : NOR3A
      port map(A => un5_del_cntr0_4, B => \del_cntr0[6]_net_1\, C
         => \del_cntr0[5]_net_1\, Y => un5_del_cntr0_9);
    
    \ch_out1_tmr3[0]\ : DFN1C0
      port map(D => \ch_out1_maj_RNIA39N1[0]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \ch_out1_tmr3_2[0]\);
    
    un1_del_cntr0_I_50 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum_0[12]\, B => 
        \DWACT_ADD_CI_0_g_array_10_0[0]\, Y => I_50_0);
    
    \ret_state0_maj_RNIKK4R1[0]\ : NOR3B
      port map(A => \ret_state0[5]_net_1\, B => N_375, C => 
        \ret_state0[0]_net_1\, Y => 
        \sequencer_state0_ns_a2_0_1[0]\);
    
    \sequencer_state1_maj_RNIO443E[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_62, Y => 
        \n_del_cntr1[5]\);
    
    \del_cntr0[3]\ : DFN1P0
      port map(D => \n_del_cntr0[3]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr0_2[3]\);
    
    \sequencer_state1_maj_RNITNFS_1[0]\ : NOR2A
      port map(A => channels_ready(2), B => 
        \sequencer_state1[0]_net_1\, Y => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\);
    
    \sequencer_state1_maj_RNI79BI1[5]\ : MX2C
      port map(A => \sequencer_state1[5]_net_1\, B => 
        un2_n_ch_out1, S => \sequencer_state1[0]_net_1\, Y => 
        \n_ch_out1[0]\);
    
    un1_del_cntr1_I_35 : XOR2
      port map(A => \del_cntr1[7]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[7]\);
    
    \sequencer_state0_tmr3[4]\ : DFN1C0
      port map(D => \sequencer_state0_ns[1]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr3_2[4]\);
    
    \sequencer_state0_maj_RNIODFMS[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_62_0, Y => 
        \n_del_cntr0[5]\);
    
    un1_del_cntr0_I_13 : AND2
      port map(A => \del_cntr0[12]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_12_0[0]\);
    
    \sequencer_state0_tmr3[1]\ : DFN1C0
      port map(D => \sequencer_state0_ns[4]\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \sequencer_state0_tmr3_2[1]\);
    
    un1_del_cntr0_I_70 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_3_0[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2_0[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_4_0[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_12_1_0[0]\);
    
    un1_del_cntr0_I_46 : XOR2
      port map(A => \del_cntr0[6]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[6]\);
    
    un1_del_cntr0_I_34 : XOR2
      port map(A => \del_cntr0[4]_net_1\, B => 
        \sequencer_state0_maj_RNIQEQ81_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum_0[4]\);
    
    \ret_state0_tmr2[3]\ : DFN1C0
      port map(D => \ret_state0_maj_RNIOKIU1[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state0_tmr2_2[3]\);
    
    un1_del_cntr0_I_18 : AND2
      port map(A => \del_cntr0[1]_net_1\, B => N_380_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_1_0[0]\);
    
    un1_del_cntr1_I_73 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0_12[0]\, B => 
        \DWACT_ADD_CI_0_g_array_0_12[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_13[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1_6[0]\);
    
    un1_del_cntr1_I_64 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_0[0]\, B => 
        \DWACT_ADD_CI_0_TMP[0]\, C => 
        \DWACT_ADD_CI_0_g_array_0_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_1[0]\);
    
    \sequencer_state0[3]\ : DFN1C0
      port map(D => \sequencer_state0_ns_i[2]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \sequencer_state0_2[3]\);
    
    \ret_state1_maj_RNIBNS4_0[1]\ : NOR2A
      port map(A => \ret_state1[1]_net_1\, B => 
        \ret_state1[2]_net_1\, Y => \sequencer_state1_ns_a2_0[4]\);
    
    un1_del_cntr1_I_10 : AND2
      port map(A => \del_cntr1[4]_net_1\, B => N_276_0, Y => 
        \DWACT_ADD_CI_0_g_array_0_4[0]\);
    
    un1_del_cntr1_I_57 : XOR2
      port map(A => \DWACT_ADD_CI_0_partial_sum[8]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, Y => I_57);
    
    \sequencer_state0_maj_RNI7C7432[0]\ : OR3
      port map(A => N_379, B => N_364, C => I_50_0, Y => 
        \n_del_cntr0[12]\);
    
    \sequencer_state0_maj[1]\ : MAJ3
      port map(A => \sequencer_state0_2[1]\, B => 
        \sequencer_state0_tmr2_2[1]\, C => 
        \sequencer_state0_tmr3_2[1]\, Y => 
        \sequencer_state0[1]_net_1\);
    
    un1_del_cntr1_I_40 : XOR2
      port map(A => \del_cntr1[8]_net_1\, B => 
        \sequencer_state1_maj_RNITNFS_1[0]_net_1\, Y => 
        \DWACT_ADD_CI_0_partial_sum[8]\);
    
    \sequencer_state1_maj[1]\ : MAJ3
      port map(A => \sequencer_state1_2[1]\, B => 
        \sequencer_state1_tmr2_2[1]\, C => 
        \sequencer_state1_tmr3_2[1]\, Y => 
        \sequencer_state1[1]_net_1\);
    
    un1_del_cntr1_I_78 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_1_3[0]\, B => 
        \DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \DWACT_ADD_CI_0_g_array_1_4[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_11_1[0]\);
    
    \sequencer_state1_maj_RNIR9L1T[0]\ : OR3
      port map(A => N_275, B => N_260, C => I_54, Y => 
        \n_del_cntr1[10]\);
    
    \ret_state1_tmr3[3]\ : DFN1C0
      port map(D => \ret_state1_maj_RNISG7D[3]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \ret_state1_tmr3_2[3]\);
    
    \del_cntr1_tmr3[8]\ : DFN1P0
      port map(D => \n_del_cntr1[8]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr3_2[8]\);
    
    un1_del_cntr1_I_83 : AO1
      port map(A => \DWACT_ADD_CI_0_pog_array_2[0]\, B => 
        \DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \DWACT_ADD_CI_0_g_array_2_1[0]\, Y => 
        \DWACT_ADD_CI_0_g_array_3[0]\);
    
    \sequencer_state0_maj_RNIJFIU1[1]\ : NOR3
      port map(A => \sequencer_state0[3]_net_1\, B => 
        \sequencer_state0[1]_net_1\, C => N_367, Y => 
        \sequencer_state0_maj_RNIJFIU1[1]_net_1\);
    
    \del_cntr1_tmr2[13]\ : DFN1P0
      port map(D => \n_del_cntr1[13]\, CLK => clk_5m_gl, PRE => 
        master_rst_b, Q => \del_cntr1_tmr2_2[13]\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity IIR_FILT_4_3 is

    port( spi_tx_word_0               : out   std_logic;
          active_switch_constraints_0 : in    std_logic;
          channel_involtage_ok_0      : in    std_logic;
          channels_desired_ready_0    : in    std_logic;
          master_rst_b                : in    std_logic;
          clk_5m_gl                   : in    std_logic;
          IN_TEMP_OK_c                : in    std_logic;
          N_63                        : in    std_logic;
          STATUS_LED_c                : out   std_logic
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

  component NOR2B
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

  component XNOR3
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

  component MAJ3
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

  component VCC
    port( Y : out   std_logic
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

  component AO18
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

  component OAI1
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

  component AX1
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

  component NOR2
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

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal n_sigout15lto7_2, \FILT_OUT[3]_net_1\, 
        \FILT_OUT[7]_net_1\, \FILT_OUT[5]_net_1\, 
        n_sigout15lto7_1, \FILT_OUT[6]_net_1\, 
        \FILT_OUT[4]_net_1\, n_sigout3lto6_1, n_sigout3lto6_0, 
        m111_2, \STATUS_LED_c\, m111_1, N_23_i, i10_mux, N_27_i, 
        i6_mux, N_29_i, i4_mux, N_31_i, \FILT_OUT[2]_net_1\, 
        i2_mux, N_33_i, \FILT_OUT[0]_net_1\, \FILT_OUT[1]_net_1\, 
        ADD_4x4_slow_I1_S_3, I0_un1_CO1, \SUM_IN_A[5]_net_1\, N70, 
        n_sigout3, \THRESH_VAL_maj_RNIOH2J[1]_net_1\, 
        \THRESH_VAL[1]_net_1\, N_113, \THRESH_VAL_ns[0]\, 
        \THRESH_VAL[0]_net_1\, N_93, N_95, ADD_4x4_slow_I2_S_3, 
        i12_mux, ADD_4x4_slow_I0_S_3, i8_mux, N_40, 
        \SUM_IN_A[4]_net_1\, ADD_4x4_slow_I3_Y_3, 
        \SIGOUT_maj_RNILH961\, \SIG_IN_DEL_maj_RNISDK7\, 
        \SIG_IN_DEL\, \SIG_IN_DEL_maj_RNISDK7_0\, \FILT_OUT_0[7]\, 
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
        \SIGOUT_tmr3\, SIG_IN_DEL_0, \SIG_IN_DEL_tmr2\, 
        \SIG_IN_DEL_tmr3\, \GND\, \VCC\ : std_logic;

begin 

    STATUS_LED_c <= \STATUS_LED_c\;

    \FILT_OUT[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S_3, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_0[4]\);
    
    SIGOUT_tmr2 : DFN1C0
      port map(D => \SIGOUT_maj_RNILH961\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \SIGOUT_tmr2\);
    
    \THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIOH2J[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \THRESH_VAL_tmr2[1]_net_1\);
    
    \SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNISDK7_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr2[5]_net_1\);
    
    \FILT_OUT[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S_3, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_0[6]\);
    
    \THRESH_VAL[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_0[0]\);
    
    SIGOUT_tmr3 : DFN1C0
      port map(D => \SIGOUT_maj_RNILH961\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \SIGOUT_tmr3\);
    
    un2_n_filt_out_m111 : NOR2B
      port map(A => m111_2, B => m111_1, Y => spi_tx_word_0);
    
    \FILT_OUT_maj_RNIH1B3[4]\ : NOR2B
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => n_sigout3lto6_1);
    
    un2_n_filt_out_ADD_4x4_slow_I0_un1_CO1 : XA1A
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => I0_un1_CO1);
    
    un1_tmp_sum_in_b_0_m22 : XNOR3
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => i10_mux, Y => N_23_i);
    
    \THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_tmr3[0]_net_1\);
    
    SIG_IN_DEL_maj_RNISDK7 : XOR2
      port map(A => IN_TEMP_OK_c, B => \SIG_IN_DEL\, Y => 
        \SIG_IN_DEL_maj_RNISDK7\);
    
    \FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y_3, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2[7]_net_1\);
    
    \FILT_OUT_maj[3]\ : MAJ3
      port map(A => \FILT_OUT_0[3]\, B => 
        \FILT_OUT_tmr2[3]_net_1\, C => \FILT_OUT_tmr3[3]_net_1\, 
        Y => \FILT_OUT[3]_net_1\);
    
    \FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3[3]_net_1\);
    
    un2_n_filt_out_ADD_4x4_slow_I1_S : XOR3
      port map(A => I0_un1_CO1, B => \SUM_IN_A[5]_net_1\, C => 
        N_23_i, Y => ADD_4x4_slow_I1_S_3);
    
    un2_n_filt_out_ADD_4x4_slow_I1_CO1 : MAJ3
      port map(A => I0_un1_CO1, B => N_23_i, C => 
        \SUM_IN_A[5]_net_1\, Y => N70);
    
    \FILT_OUT_maj[6]\ : MAJ3
      port map(A => \FILT_OUT_0[6]\, B => 
        \FILT_OUT_tmr2[6]_net_1\, C => \FILT_OUT_tmr3[6]_net_1\, 
        Y => \FILT_OUT[6]_net_1\);
    
    \SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \SUM_IN_A_0[4]\, B => 
        \SUM_IN_A_tmr2[4]_net_1\, C => \SUM_IN_A_tmr3[4]_net_1\, 
        Y => \SUM_IN_A[4]_net_1\);
    
    \FILT_OUT[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_0[1]\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S_3, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2[5]_net_1\);
    
    \SUM_IN_A[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNISDK7_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_0[5]\);
    
    \FILT_OUT[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_0[2]\);
    
    SIG_IN_DEL : DFN1C0
      port map(D => IN_TEMP_OK_c, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => SIG_IN_DEL_0);
    
    \FILT_OUT[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y_3, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_0[7]\);
    
    \FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2[2]_net_1\);
    
    un2_n_filt_out_ADD_4x4_slow_I3_Y : AO13
      port map(A => N70, B => \FILT_OUT[7]_net_1\, C => i12_mux, 
        Y => ADD_4x4_slow_I3_Y_3);
    
    \FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S_3, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2[4]_net_1\);
    
    un2_n_filt_out_m111_2 : NOR3C
      port map(A => channels_desired_ready_0, B => \STATUS_LED_c\, 
        C => channel_involtage_ok_0, Y => m111_2);
    
    un1_tmp_sum_in_b_0_m13 : AO18
      port map(A => \FILT_OUT[4]_net_1\, B => i6_mux, C => 
        \FILT_OUT[5]_net_1\, Y => i8_mux);
    
    \FILT_OUT[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_0[0]\);
    
    SIG_IN_DEL_tmr2 : DFN1C0
      port map(D => IN_TEMP_OK_c, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \SIG_IN_DEL_tmr2\);
    
    SIGOUT_maj : MAJ3
      port map(A => \SIGOUT\, B => \SIGOUT_tmr2\, C => 
        \SIGOUT_tmr3\, Y => \STATUS_LED_c\);
    
    \THRESH_VAL_maj_RNING2J[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_113, Y => \THRESH_VAL_ns[0]\);
    
    SIGOUT_maj_RNILH961 : MX2
      port map(A => n_sigout3, B => \STATUS_LED_c\, S => N_93, Y
         => \SIGOUT_maj_RNILH961\);
    
    un1_tmp_sum_in_b_0_m4 : OAI1
      port map(A => \FILT_OUT[2]_net_1\, B => \FILT_OUT[0]_net_1\, 
        C => \FILT_OUT[1]_net_1\, Y => i2_mux);
    
    \FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3[1]_net_1\);
    
    \FILT_OUT[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_0[3]\);
    
    \THRESH_VAL[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIOH2J[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => \THRESH_VAL_0[1]\);
    
    un1_tmp_sum_in_b_0_m16 : AO18
      port map(A => \FILT_OUT[5]_net_1\, B => i8_mux, C => 
        \FILT_OUT[6]_net_1\, Y => i10_mux);
    
    \THRESH_VAL_maj_RNIS8H9[1]\ : NOR3C
      port map(A => n_sigout15lto7_1, B => n_sigout15lto7_2, C
         => \THRESH_VAL[1]_net_1\, Y => N_113);
    
    \FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S_3, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr2[6]_net_1\);
    
    GND_i : GND
      port map(Y => \GND\);
    
    un1_tmp_sum_in_b_0_m26 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[5]_net_1\, 
        C => i6_mux, Y => N_27_i);
    
    un1_tmp_sum_in_b_0_m19 : AO18
      port map(A => \FILT_OUT[6]_net_1\, B => i10_mux, C => 
        \FILT_OUT[7]_net_1\, Y => i12_mux);
    
    \THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \THRESH_VAL_maj_RNIOH2J[1]_net_1\, CLK => 
        clk_5m_gl, CLR => master_rst_b, Q => 
        \THRESH_VAL_tmr3[1]_net_1\);
    
    un1_tmp_sum_in_b_0_m30 : XNOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[2]_net_1\, 
        C => i2_mux, Y => N_31_i);
    
    \SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNISDK7\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr2[4]_net_1\);
    
    \FILT_OUT_maj[7]\ : MAJ3
      port map(A => \FILT_OUT_0[7]\, B => 
        \FILT_OUT_tmr2[7]_net_1\, C => \FILT_OUT_tmr3[7]_net_1\, 
        Y => \FILT_OUT[7]_net_1\);
    
    un1_tmp_sum_in_b_0_m15 : XOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[5]_net_1\, 
        Y => N_40);
    
    \FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => ADD_4x4_slow_I2_S_3, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3[6]_net_1\);
    
    \SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNISDK7\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr3[4]_net_1\);
    
    un1_tmp_sum_in_b_0_m7 : AO18
      port map(A => \FILT_OUT[2]_net_1\, B => i2_mux, C => 
        \FILT_OUT[3]_net_1\, Y => i4_mux);
    
    un2_n_filt_out_m111_1 : NOR2A
      port map(A => active_switch_constraints_0, B => N_63, Y => 
        m111_1);
    
    un1_tmp_sum_in_b_0_m28 : XNOR3
      port map(A => \FILT_OUT[4]_net_1\, B => \FILT_OUT[3]_net_1\, 
        C => i4_mux, Y => N_29_i);
    
    SIG_IN_DEL_tmr3 : DFN1C0
      port map(D => IN_TEMP_OK_c, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \SIG_IN_DEL_tmr3\);
    
    SIGOUT : DFN1C0
      port map(D => \SIGOUT_maj_RNILH961\, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \SIGOUT\);
    
    SIG_IN_DEL_maj_RNISDK7_0 : NOR2B
      port map(A => \SIG_IN_DEL\, B => IN_TEMP_OK_c, Y => 
        \SIG_IN_DEL_maj_RNISDK7_0\);
    
    \FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => ADD_4x4_slow_I3_Y_3, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3[7]_net_1\);
    
    \FILT_OUT_maj[5]\ : MAJ3
      port map(A => \FILT_OUT_0[5]\, B => 
        \FILT_OUT_tmr2[5]_net_1\, C => \FILT_OUT_tmr3[5]_net_1\, 
        Y => \FILT_OUT[5]_net_1\);
    
    \FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => N_27_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2[3]_net_1\);
    
    \FILT_OUT_maj_RNIH1B3[3]\ : NOR2B
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[6]_net_1\, 
        Y => n_sigout3lto6_0);
    
    \THRESH_VAL_maj_RNIS8H9_0[1]\ : AOI1B
      port map(A => n_sigout15lto7_2, B => n_sigout15lto7_1, C
         => \THRESH_VAL[1]_net_1\, Y => N_95);
    
    \THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \THRESH_VAL_0[1]\, B => 
        \THRESH_VAL_tmr2[1]_net_1\, C => 
        \THRESH_VAL_tmr3[1]_net_1\, Y => \THRESH_VAL[1]_net_1\);
    
    \FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => N_29_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3[2]_net_1\);
    
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
    
    un2_n_filt_out_ADD_4x4_slow_I2_S : XNOR3
      port map(A => \FILT_OUT[7]_net_1\, B => i12_mux, C => N70, 
        Y => ADD_4x4_slow_I2_S_3);
    
    \SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNISDK7_0\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_tmr3[5]_net_1\);
    
    \THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \THRESH_VAL_ns[0]\, CLK => clk_5m_gl, CLR => 
        master_rst_b, Q => \THRESH_VAL_tmr2[0]_net_1\);
    
    \THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \THRESH_VAL_0[0]\, B => 
        \THRESH_VAL_tmr2[0]_net_1\, C => 
        \THRESH_VAL_tmr3[0]_net_1\, Y => \THRESH_VAL[0]_net_1\);
    
    \FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => N_31_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2[1]_net_1\);
    
    \FILT_OUT[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S_3, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_0[5]\);
    
    \THRESH_VAL_maj_RNIOH2J[1]\ : OA1B
      port map(A => n_sigout3, B => \THRESH_VAL[1]_net_1\, C => 
        N_113, Y => \THRESH_VAL_maj_RNIOH2J[1]_net_1\);
    
    \FILT_OUT_maj_RNII2B3[4]\ : NOR2
      port map(A => \FILT_OUT[6]_net_1\, B => \FILT_OUT[4]_net_1\, 
        Y => n_sigout15lto7_1);
    
    un1_tmp_sum_in_b_0_m10 : AO18
      port map(A => \FILT_OUT[3]_net_1\, B => i4_mux, C => 
        \FILT_OUT[4]_net_1\, Y => i6_mux);
    
    \FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr3[0]_net_1\);
    
    \FILT_OUT_maj[2]\ : MAJ3
      port map(A => \FILT_OUT_0[2]\, B => 
        \FILT_OUT_tmr2[2]_net_1\, C => \FILT_OUT_tmr3[2]_net_1\, 
        Y => \FILT_OUT[2]_net_1\);
    
    un2_n_filt_out_ADD_4x4_slow_I0_S : XNOR3
      port map(A => i8_mux, B => N_40, C => \SUM_IN_A[4]_net_1\, 
        Y => ADD_4x4_slow_I0_S_3);
    
    \FILT_OUT_maj_RNIDMB8[7]\ : AO1
      port map(A => n_sigout3lto6_1, B => n_sigout3lto6_0, C => 
        \FILT_OUT[7]_net_1\, Y => n_sigout3);
    
    \THRESH_VAL_maj_RNING2J_0[0]\ : AO1A
      port map(A => n_sigout3, B => \THRESH_VAL[0]_net_1\, C => 
        N_95, Y => N_93);
    
    \FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => ADD_4x4_slow_I0_S_3, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3[4]_net_1\);
    
    SIG_IN_DEL_maj : MAJ3
      port map(A => SIG_IN_DEL_0, B => \SIG_IN_DEL_tmr2\, C => 
        \SIG_IN_DEL_tmr3\, Y => \SIG_IN_DEL\);
    
    \FILT_OUT_maj_RNIRJ05[3]\ : NOR3
      port map(A => \FILT_OUT[3]_net_1\, B => \FILT_OUT[7]_net_1\, 
        C => \FILT_OUT[5]_net_1\, Y => n_sigout15lto7_2);
    
    \FILT_OUT_maj[4]\ : MAJ3
      port map(A => \FILT_OUT_0[4]\, B => 
        \FILT_OUT_tmr2[4]_net_1\, C => \FILT_OUT_tmr3[4]_net_1\, 
        Y => \FILT_OUT[4]_net_1\);
    
    \SUM_IN_A[4]\ : DFN1C0
      port map(D => \SIG_IN_DEL_maj_RNISDK7\, CLK => clk_5m_gl, 
        CLR => master_rst_b, Q => \SUM_IN_A_0[4]\);
    
    \FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => ADD_4x4_slow_I1_S_3, CLK => clk_5m_gl, CLR
         => master_rst_b, Q => \FILT_OUT_tmr3[5]_net_1\);
    
    \FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => N_33_i, CLK => clk_5m_gl, CLR => master_rst_b, 
        Q => \FILT_OUT_tmr2[0]_net_1\);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity crc6_0 is

    port( spi_rx_word_9  : in    std_logic;
          spi_rx_word_16 : in    std_logic;
          spi_rx_word_11 : in    std_logic;
          spi_rx_word_10 : in    std_logic;
          spi_rx_word_12 : in    std_logic;
          spi_rx_word_18 : in    std_logic;
          spi_rx_word_30 : in    std_logic;
          spi_rx_word_0  : in    std_logic;
          spi_rx_word_5  : in    std_logic;
          spi_rx_word_2  : in    std_logic;
          spi_rx_word_4  : in    std_logic;
          spi_rx_word_7  : in    std_logic;
          spi_rx_word_3  : in    std_logic;
          spi_rx_word_6  : in    std_logic;
          spi_rx_word_15 : in    std_logic;
          spi_rx_word_8  : in    std_logic;
          N_34           : out   std_logic;
          N_33           : out   std_logic;
          N_32           : out   std_logic;
          N_31           : out   std_logic;
          N_30           : out   std_logic;
          N_29           : out   std_logic;
          N_26           : out   std_logic
        );

end crc6_0;

architecture DEF_ARCH of crc6_0 is 

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

  component XOR3
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

    signal \GND\, \VCC\ : std_logic;

begin 


    \CRC_1_0_a2_3[2]\ : XOR2
      port map(A => spi_rx_word_5, B => spi_rx_word_2, Y => N_31);
    
    \CRC_1_0_a2_2[2]\ : XOR2
      port map(A => spi_rx_word_30, B => spi_rx_word_0, Y => N_30);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \CRC_1_0_a2_4[2]\ : XOR2
      port map(A => spi_rx_word_3, B => spi_rx_word_6, Y => N_33);
    
    \CRC_1_0_a2_2[1]\ : XOR2
      port map(A => spi_rx_word_4, B => spi_rx_word_7, Y => N_32);
    
    \CRC_1_0_a2_1[1]\ : XOR3
      port map(A => spi_rx_word_10, B => spi_rx_word_12, C => 
        spi_rx_word_18, Y => N_29);
    
    GND_i : GND
      port map(Y => \GND\);
    
    \CRC_1_0_a2_5[2]\ : XOR2
      port map(A => spi_rx_word_15, B => spi_rx_word_8, Y => N_34);
    
    \CRC_1_0_a2_0[1]\ : XOR3
      port map(A => spi_rx_word_9, B => spi_rx_word_16, C => 
        spi_rx_word_11, Y => N_26);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity top_lvr_fw is

    port( CLK40M_OSC             : in    std_logic;
          IN_POWERON_RST_B       : in    std_logic;
          IN_INVOLTAGE_OK        : in    std_logic_vector(4 downto 1);
          IN_TEMP_OK             : in    std_logic;
          SW2_SW3_CHANNEL_ON_BAR : in    std_logic_vector(8 downto 1);
          SW4_SLAVE_PAIRS_BAR    : in    std_logic_vector(4 downto 1);
          SW5_DEFAULT_TURNON_BAR : in    std_logic;
          SW5_DUTYCYCLE_MODE_BAR : in    std_logic;
          SW5_IGNORE_CRC_BAR     : in    std_logic;
          SW5_PIN4_UNUSED        : in    std_logic;
          sca_clk_out            : in    std_logic;
          sca_reset_out          : in    std_logic;
          sca_dat_in             : out   std_logic;
          sca_dat_out            : in    std_logic;
          J11_DEBUG              : out   std_logic_vector(7 downto 0);
          OUT_CHANNEL_MREG       : out   std_logic_vector(8 downto 1);
          OUT_CHANNEL_IAUX       : out   std_logic_vector(8 downto 1);
          OUT_CHANNEL_VOSG       : out   std_logic_vector(8 downto 1);
          PWR_OK_LED             : out   std_logic;
          STATUS_LED             : out   std_logic
        );

end top_lvr_fw;

architecture DEF_ARCH of top_lvr_fw is 

  component INBUF
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component DFN0P1C1
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
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

  component DFN0C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component DFN1C0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          CLR : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component IIR_FILT_4_2
    port( IN_INVOLTAGE_OK_c_0    : in    std_logic := 'U';
          channel_involtage_ok_0 : out   std_logic;
          ch_mreg_en_0           : in    std_logic := 'U';
          OUT_CHANNEL_MREG_c_0   : out   std_logic;
          master_rst_b           : in    std_logic := 'U';
          clk_5m_gl              : in    std_logic := 'U'
        );
  end component;

  component OUTBUF
    port( D   : in    std_logic := 'U';
          PAD : out   std_logic
        );
  end component;

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component crc6_1
    port( spi_tx_word_0               : in    std_logic := 'U';
          spi_tx_word_16              : in    std_logic := 'U';
          spi_tx_word_19              : in    std_logic := 'U';
          spi_tx_word_21              : in    std_logic := 'U';
          spi_tx_word_7               : in    std_logic := 'U';
          spi_tx_word_4               : in    std_logic := 'U';
          spi_tx_word_9               : in    std_logic := 'U';
          spi_tx_word_6               : in    std_logic := 'U';
          spi_tx_word_11              : in    std_logic := 'U';
          spi_tx_word_8               : in    std_logic := 'U';
          spi_tx_word_10              : in    std_logic := 'U';
          spi_tx_word_18              : in    std_logic := 'U';
          spi_tx_word_5               : in    std_logic := 'U';
          spi_tx_word_17              : in    std_logic := 'U';
          ch_iaux_en_0                : in    std_logic := 'U';
          OUT_CHANNEL_IAUX_c          : out   std_logic_vector(8 downto 7);
          ch_out1_0                   : in    std_logic := 'U';
          SW4_SLAVE_PAIRS_BAR_c_0     : in    std_logic := 'U';
          active_switch_constraints_1 : in    std_logic := 'U';
          active_switch_constraints_0 : in    std_logic := 'U';
          active_switch_constraints_6 : in    std_logic := 'U';
          active_switch_constraints_7 : in    std_logic := 'U';
          channel_involtage_ok_0      : in    std_logic := 'U';
          channel_involtage_ok_3      : in    std_logic := 'U';
          total_channel_constraints_0 : out   std_logic;
          tx_crc                      : out   std_logic_vector(5 downto 0);
          SPI_TX_WORD_i_1_0           : in    std_logic := 'U';
          N_68                        : out   std_logic;
          N_73                        : out   std_logic;
          STATUS_LED_c                : in    std_logic := 'U';
          N_7_0                       : out   std_logic;
          i42_mux_11                  : in    std_logic := 'U';
          i42_mux_7                   : in    std_logic := 'U';
          i42_mux_8                   : in    std_logic := 'U';
          i42_mux_10                  : in    std_logic := 'U';
          i42_mux_2                   : in    std_logic := 'U';
          i42_mux_0                   : in    std_logic := 'U';
          i42_mux_9                   : in    std_logic := 'U';
          N_16_0                      : in    std_logic := 'U';
          i42_mux                     : in    std_logic := 'U'
        );
  end component;

  component spi_slave
    port( i_spi_rx_word_maj_RNIC1IV5_0   : out   std_logic;
          i_spi_rx_word_maj_RNIE3IV5_0   : out   std_logic;
          channels_ready                 : out   std_logic_vector(8 downto 1);
          active_switch_constraints      : in    std_logic_vector(8 downto 1) := (others => 'U');
          spi_tx_word_10                 : out   std_logic;
          spi_tx_word_11                 : out   std_logic;
          spi_tx_word_18                 : out   std_logic;
          spi_tx_word_19                 : out   std_logic;
          spi_tx_word_5                  : out   std_logic;
          spi_tx_word_9                  : out   std_logic;
          spi_tx_word_17                 : out   std_logic;
          spi_tx_word_0                  : out   std_logic;
          spi_tx_word_6                  : out   std_logic;
          spi_tx_word_7                  : out   std_logic;
          spi_tx_word_21                 : out   std_logic;
          spi_tx_word_4                  : out   std_logic;
          spi_tx_word_8                  : in    std_logic := 'U';
          spi_tx_word_16                 : out   std_logic;
          total_channel_constraints_0    : in    std_logic := 'U';
          J11_DEBUG_c_c                  : in    std_logic_vector(7 downto 0) := (others => 'U');
          dtycyc_cnt                     : in    std_logic_vector(4 downto 0) := (others => 'U');
          tx_crc                         : in    std_logic_vector(5 downto 0) := (others => 'U');
          channels_on                    : out   std_logic_vector(4 downto 3);
          spi_rx_command_reg             : in    std_logic_vector(1 downto 0) := (others => 'U');
          channels_desired_on            : in    std_logic_vector(8 downto 1) := (others => 'U');
          i_spi_rx_word_maj_RNIRFN301_0  : out   std_logic;
          i_spi_rx_word_maj_RNI503FV_0   : out   std_logic;
          i_spi_rx_word_maj_RNIG4N301_0  : out   std_logic;
          i_spi_rx_word_maj_RNIVP2FV_0   : out   std_logic;
          i_spi_rx_word_maj_RNI5PM301_0  : out   std_logic;
          i_spi_rx_word_maj_RNIPJ2FV_0   : out   std_logic;
          i_spi_rx_word_maj_RNIC7VH01_0  : out   std_logic;
          i_spi_rx_word_maj_RNICQ6MV_0   : out   std_logic;
          channels_desired_ready         : in    std_logic_vector(8 downto 1) := (others => 'U');
          i_spi_rx_word_maj_RNIO745V_0   : out   std_logic;
          i_spi_rx_word_maj_RNIGR8TU_0   : out   std_logic;
          i_spi_rx_word_maj_RNIH045V_0   : out   std_logic;
          i_spi_rx_word_maj_RNICN8TU_0   : out   std_logic;
          i_spi_rx_word_maj_RNIAP35V_0   : out   std_logic;
          i_spi_rx_word_maj_RNI8J8TU_0   : out   std_logic;
          i_spi_rx_word_maj_RNILBCJV_0   : out   std_logic;
          i_spi_rx_word_maj_RNITRC4V_0   : out   std_logic;
          i_spi_rx_word_maj_RNI4PT0V_0   : out   std_logic;
          ch_out1_1                      : in    std_logic_vector(2 downto 1) := (others => 'U');
          OUT_CHANNEL_IAUX_c             : out   std_logic_vector(6 downto 1);
          ch_iaux_en_0                   : in    std_logic := 'U';
          ch_iaux_en_2                   : in    std_logic := 'U';
          ch_iaux_en_4                   : in    std_logic := 'U';
          ch_out1_0                      : in    std_logic_vector(2 downto 1) := (others => 'U');
          ch_out1                        : in    std_logic_vector(2 downto 1) := (others => 'U');
          channel_involtage_ok           : in    std_logic_vector(4 downto 1) := (others => 'U');
          SW4_SLAVE_PAIRS_BAR_c          : in    std_logic_vector(4 downto 3) := (others => 'U');
          OUT_CHANNEL_MREG_c_0           : out   std_logic;
          OUT_CHANNEL_MREG_c_1           : out   std_logic;
          OUT_CHANNEL_MREG_c_2           : out   std_logic;
          OUT_CHANNEL_MREG_c_4           : out   std_logic;
          OUT_CHANNEL_MREG_c_5           : out   std_logic;
          OUT_CHANNEL_MREG_c_7           : out   std_logic;
          ch_mreg_en_0                   : in    std_logic := 'U';
          ch_mreg_en_2                   : in    std_logic := 'U';
          ch_mreg_en_4                   : in    std_logic := 'U';
          SPI_TX_WORD_i_1_0              : out   std_logic;
          spi_rx_word_7                  : out   std_logic;
          spi_rx_word_9                  : out   std_logic;
          spi_rx_word_16                 : out   std_logic;
          spi_rx_word_10                 : out   std_logic;
          spi_rx_word_12                 : out   std_logic;
          spi_rx_word_0                  : out   std_logic;
          spi_rx_word_6                  : out   std_logic;
          spi_rx_word_2                  : out   std_logic;
          spi_rx_word_8                  : out   std_logic;
          spi_rx_word_30                 : out   std_logic;
          spi_rx_word_3                  : out   std_logic;
          spi_rx_word_4                  : out   std_logic;
          spi_rx_word_5                  : out   std_logic;
          spi_rx_word_11                 : out   std_logic;
          spi_rx_word_15                 : out   std_logic;
          spi_rx_word_18                 : out   std_logic;
          SW2_SW3_CHANNEL_ON_BAR_c_5     : in    std_logic := 'U';
          SW2_SW3_CHANNEL_ON_BAR_c_0     : in    std_logic := 'U';
          SW2_SW3_CHANNEL_ON_BAR_c_1     : in    std_logic := 'U';
          SW2_SW3_CHANNEL_ON_BAR_c_4     : in    std_logic := 'U';
          sw2_sw5_channel_on_a           : in    std_logic_vector(8 downto 1) := (others => 'U');
          sw2_sw5_channel_on_b           : in    std_logic_vector(8 downto 1) := (others => 'U');
          i_spi_rx_strb_1                : out   std_logic;
          sca_dat_out_c                  : in    std_logic := 'U';
          GLB                            : in    std_logic := 'U';
          gb_spi_rst_b                   : in    std_logic := 'U';
          clk_5m_gl                      : in    std_logic := 'U';
          sw2_sw5_channel_on_a_15        : out   std_logic;
          sw2_sw5_channel_on_a_16        : out   std_logic;
          sw2_sw5_channel_on_a_17        : out   std_logic;
          sw2_sw5_channel_on_a_18        : out   std_logic;
          sw2_sw5_channel_on_a_20        : out   std_logic;
          sw2_sw5_channel_on_a_21        : out   std_logic;
          sw2_sw5_channel_on_a_22        : out   std_logic;
          sw2_sw5_channel_on_b_23        : out   std_logic;
          sw2_sw5_channel_on_b_24        : out   std_logic;
          sw2_sw5_channel_on_b_25        : out   std_logic;
          sw2_sw5_channel_on_b_26        : out   std_logic;
          sw2_sw5_channel_on_b_28        : out   std_logic;
          sw2_sw5_channel_on_b_29        : out   std_logic;
          sw2_sw5_channel_on_b_30        : out   std_logic;
          dtycyc_en                      : in    std_logic := 'U';
          dtycyc_en_32                   : out   std_logic;
          dtycyc_cnt_34                  : out   std_logic;
          dtycyc_cnt_35                  : out   std_logic;
          dtycyc_cnt_36                  : out   std_logic;
          dtycyc_cnt_37                  : out   std_logic;
          dtycyc_cnt_38                  : out   std_logic;
          m32_0                          : out   std_logic;
          m31                            : out   std_logic;
          SW5_IGNORE_CRC_BAR_c           : in    std_logic := 'U';
          bad_crc_1_sqmuxa               : out   std_logic;
          N_7_0                          : in    std_logic := 'U';
          SW5_PIN4_UNUSED_c              : in    std_logic := 'U';
          i42_mux_9                      : out   std_logic;
          bad_crc                        : in    std_logic := 'U';
          N_63_0                         : out   std_logic;
          spi_timeout                    : in    std_logic := 'U';
          N_85                           : out   std_logic;
          STATUS_LED_c                   : in    std_logic := 'U';
          N_79                           : out   std_logic;
          N_73                           : in    std_logic := 'U';
          N_68_0                         : in    std_logic := 'U';
          spi_dutycycle_mode             : in    std_logic := 'U';
          sw2_sw5_channel_on_b_27        : out   std_logic;
          N_210_i                        : in    std_logic := 'U';
          sw2_sw5_channel_on_a_19        : out   std_logic;
          i42_mux                        : out   std_logic;
          i42_mux_0                      : out   std_logic;
          i42_mux_7                      : out   std_logic;
          i42_mux_8                      : out   std_logic;
          i42_mux_2                      : out   std_logic;
          i42_mux_10                     : out   std_logic;
          N_16_0                         : out   std_logic;
          i42_mux_11                     : out   std_logic;
          sca_dat_in_c                   : out   std_logic;
          un46_sw2_sw3_channel_on_bar    : out   std_logic;
          un32_sw2_sw3_channel_on_bar    : out   std_logic;
          un25_sw2_sw3_channel_on_bar    : out   std_logic;
          un18_sw2_sw3_channel_on_bar    : out   std_logic;
          un4_sw2_sw3_channel_on_bar     : out   std_logic;
          un11_sw2_sw3_channel_on_bar    : out   std_logic;
          un39_sw2_sw3_channel_on_bar    : out   std_logic;
          un53_sw2_sw3_channel_on_bar    : out   std_logic;
          spi_timeout_pulse_i_1          : out   std_logic;
          N_32                           : in    std_logic := 'U';
          N_26                           : in    std_logic := 'U';
          N_29                           : in    std_logic := 'U';
          N_34                           : in    std_logic := 'U';
          N_30                           : in    std_logic := 'U';
          N_33                           : in    std_logic := 'U';
          N_31                           : in    std_logic := 'U';
          un1_sw5_default_turnon_bar_1_0 : out   std_logic;
          master_rst_b                   : in    std_logic := 'U';
          un1_master_rst_b_1_0           : out   std_logic
        );
  end component;

  component main_sequencer_new_3_1
    port( channels_on        : in    std_logic_vector(4 downto 3) := (others => 'U');
          ch_out1            : out   std_logic_vector(2 downto 1);
          ch_mreg_en_0       : out   std_logic;
          ch_iaux_en_0       : out   std_logic;
          OUT_CHANNEL_VOSG_c : out   std_logic_vector(4 downto 3);
          J11_DEBUG_c_c_0    : in    std_logic := 'U';
          channels_ready     : in    std_logic_vector(4 downto 3) := (others => 'U');
          master_rst_b       : in    std_logic := 'U';
          clk_5m_gl          : in    std_logic := 'U';
          dtycyc_en          : in    std_logic := 'U'
        );
  end component;

  component CCC_Glob_3xBuff
    port( sca_clk_out_c   : in    std_logic := 'U';
          gb_spi_rst_b    : out   std_logic;
          CLK40M_OSC_c    : in    std_logic := 'U';
          GLB             : out   std_logic;
          master_rst_b    : in    std_logic := 'U';
          sca_reset_out_c : in    std_logic := 'U'
        );
  end component;

  component IIR_FILT_4_1
    port( IN_INVOLTAGE_OK_c_0    : in    std_logic := 'U';
          channel_involtage_ok_0 : out   std_logic;
          master_rst_b           : in    std_logic := 'U';
          clk_5m_gl              : in    std_logic := 'U'
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component main_sequencer_new_3_0
    port( channels_desired_on     : in    std_logic_vector(6 downto 5) := (others => 'U');
          ch_out1                 : out   std_logic_vector(2 downto 1);
          ch_mreg_en_0            : out   std_logic;
          ch_iaux_en_0            : out   std_logic;
          OUT_CHANNEL_VOSG_c      : out   std_logic_vector(6 downto 5);
          SW4_SLAVE_PAIRS_BAR_c_0 : in    std_logic := 'U';
          channels_ready          : in    std_logic_vector(6 downto 5) := (others => 'U');
          master_rst_b            : in    std_logic := 'U';
          clk_5m_gl               : in    std_logic := 'U';
          N_85                    : in    std_logic := 'U';
          dtycyc_en               : in    std_logic := 'U';
          N_79                    : in    std_logic := 'U'
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component IIR_FILT_4_0
    port( IN_INVOLTAGE_OK_c_0  : in    std_logic := 'U';
          ch_out1_0            : in    std_logic := 'U';
          J11_DEBUG_c_c_0      : in    std_logic := 'U';
          OUT_CHANNEL_MREG_c_0 : out   std_logic;
          channel_involtage_ok : inout   std_logic_vector(4 downto 1);
          master_rst_b         : in    std_logic := 'U';
          clk_5m_gl            : in    std_logic := 'U';
          N_152_mux            : out   std_logic
        );
  end component;

  component MX2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component main_sequencer_new_3_2
    port( ch_iaux_en_0            : out   std_logic;
          channels_desired_on     : in    std_logic_vector(8 downto 7) := (others => 'U');
          ch_out1                 : out   std_logic_vector(2 downto 1);
          ch_mreg_en_0            : out   std_logic;
          OUT_CHANNEL_VOSG_c      : out   std_logic_vector(8 downto 7);
          SW4_SLAVE_PAIRS_BAR_c_0 : in    std_logic := 'U';
          channels_ready          : in    std_logic_vector(8 downto 7) := (others => 'U');
          master_rst_b            : in    std_logic := 'U';
          clk_5m_gl               : in    std_logic := 'U';
          N_73                    : in    std_logic := 'U';
          dtycyc_en               : in    std_logic := 'U';
          N_68                    : in    std_logic := 'U'
        );
  end component;

  component XOR2
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

  component IIR_FILT_4
    port( IN_INVOLTAGE_OK_c_0    : in    std_logic := 'U';
          channel_involtage_ok_0 : out   std_logic;
          master_rst_b           : in    std_logic := 'U';
          clk_5m_gl              : in    std_logic := 'U'
        );
  end component;

  component INV
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component SLOW_PULSE_EN_GEN
    port( N_210_i      : out   std_logic;
          master_rst_b : in    std_logic := 'U';
          clk_5m_gl    : in    std_logic := 'U'
        );
  end component;

  component main_sequencer_new_3
    port( OUT_CHANNEL_VOSG_c          : out   std_logic_vector(2 downto 1);
          channels_desired_on         : in    std_logic_vector(2 downto 1) := (others => 'U');
          total_channel_constraints_0 : in    std_logic := 'U';
          ch_out1                     : out   std_logic_vector(2 downto 1);
          ch_mreg_en_0                : out   std_logic;
          ch_iaux_en_0                : out   std_logic;
          J11_DEBUG_c_c_0             : in    std_logic := 'U';
          channels_ready              : in    std_logic_vector(2 downto 1) := (others => 'U');
          master_rst_b                : in    std_logic := 'U';
          clk_5m_gl                   : in    std_logic := 'U';
          dtycyc_en                   : in    std_logic := 'U';
          N_7_0                       : in    std_logic := 'U'
        );
  end component;

  component CLKINT
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component IIR_FILT_4_3
    port( spi_tx_word_0               : out   std_logic;
          active_switch_constraints_0 : in    std_logic := 'U';
          channel_involtage_ok_0      : in    std_logic := 'U';
          channels_desired_ready_0    : in    std_logic := 'U';
          master_rst_b                : in    std_logic := 'U';
          clk_5m_gl                   : in    std_logic := 'U';
          IN_TEMP_OK_c                : in    std_logic := 'U';
          N_63                        : in    std_logic := 'U';
          STATUS_LED_c                : out   std_logic
        );
  end component;

  component crc6_0
    port( spi_rx_word_9  : in    std_logic := 'U';
          spi_rx_word_16 : in    std_logic := 'U';
          spi_rx_word_11 : in    std_logic := 'U';
          spi_rx_word_10 : in    std_logic := 'U';
          spi_rx_word_12 : in    std_logic := 'U';
          spi_rx_word_18 : in    std_logic := 'U';
          spi_rx_word_30 : in    std_logic := 'U';
          spi_rx_word_0  : in    std_logic := 'U';
          spi_rx_word_5  : in    std_logic := 'U';
          spi_rx_word_2  : in    std_logic := 'U';
          spi_rx_word_4  : in    std_logic := 'U';
          spi_rx_word_7  : in    std_logic := 'U';
          spi_rx_word_3  : in    std_logic := 'U';
          spi_rx_word_6  : in    std_logic := 'U';
          spi_rx_word_15 : in    std_logic := 'U';
          spi_rx_word_8  : in    std_logic := 'U';
          N_34           : out   std_logic;
          N_33           : out   std_logic;
          N_32           : out   std_logic;
          N_31           : out   std_logic;
          N_30           : out   std_logic;
          N_29           : out   std_logic;
          N_26           : out   std_logic
        );
  end component;

    signal m32_0, m31, GLB, gb_spi_rst_b, \clk_5m_gl\, 
        \spi_tx_word[4]\, \spi_tx_word[5]\, \spi_tx_word[6]\, 
        \spi_tx_word[7]\, \spi_tx_word[8]\, \spi_tx_word[10]\, 
        \spi_tx_word[11]\, \tx_crc[0]\, \tx_crc[1]\, \tx_crc[2]\, 
        \tx_crc[3]\, \tx_crc[4]\, \tx_crc[5]\, \GND\, 
        i_spi_rx_strb, \master_rst_b\, \VCC\, 
        \debounce.1.un4_sw2_sw3_channel_on_bar\, 
        \debounce.2.un11_sw2_sw3_channel_on_bar\, 
        \debounce.3.un18_sw2_sw3_channel_on_bar\, 
        \debounce.4.un25_sw2_sw3_channel_on_bar\, 
        \debounce.5.un32_sw2_sw3_channel_on_bar\, 
        \debounce.6.un39_sw2_sw3_channel_on_bar\, 
        \debounce.7.un46_sw2_sw3_channel_on_bar\, 
        \debounce.8.un53_sw2_sw3_channel_on_bar\, 
        \gen_5m_clk.n_refcnt8\, bad_crc_1_sqmuxa, 
        \spi_tx_word[0]\, \spi_tx_word[9]\, \spi_tx_word[16]\, 
        \spi_tx_word[17]\, \spi_tx_word[18]\, \spi_tx_word[19]\, 
        \spi_tx_word[21]\, \i_spi_rx_word_maj_RNITRC4V[8]\, 
        \i_spi_rx_word_maj_RNILBCJV[9]\, 
        \i_spi_rx_word_maj_RNI8J8TU[10]\, 
        \i_spi_rx_word_maj_RNIAP35V[11]\, 
        \i_spi_rx_word_maj_RNICN8TU[12]\, 
        \i_spi_rx_word_maj_RNIH045V[12]\, 
        \i_spi_rx_word_maj_RNIGR8TU[14]\, 
        \i_spi_rx_word_maj_RNIO745V[15]\, 
        \i_spi_rx_word_maj_RNICQ6MV[0]\, 
        \i_spi_rx_word_maj_RNIC7VH01[1]\, 
        \i_spi_rx_word_maj_RNIPJ2FV[2]\, 
        \i_spi_rx_word_maj_RNI5PM301[3]\, 
        \i_spi_rx_word_maj_RNIVP2FV[4]\, 
        \i_spi_rx_word_maj_RNIG4N301[5]\, 
        \i_spi_rx_word_maj_RNI503FV[6]\, 
        \i_spi_rx_word_maj_RNIRFN301[15]\, 
        \i_spi_rx_word_maj_RNIC1IV5[30]\, 
        \i_spi_rx_word_maj_RNIE3IV5[31]\, sw2_sw5_channel_on_a_15, 
        sw2_sw5_channel_on_a_16, sw2_sw5_channel_on_a_17, 
        sw2_sw5_channel_on_a_18, sw2_sw5_channel_on_a_19, 
        sw2_sw5_channel_on_a_20, sw2_sw5_channel_on_a_21, 
        sw2_sw5_channel_on_a_22, sw2_sw5_channel_on_b_23, 
        sw2_sw5_channel_on_b_24, sw2_sw5_channel_on_b_25, 
        sw2_sw5_channel_on_b_26, sw2_sw5_channel_on_b_27, 
        sw2_sw5_channel_on_b_28, sw2_sw5_channel_on_b_29, 
        sw2_sw5_channel_on_b_30, \clk_5m_gl_maj_RNIOPBG1\, 
        dtycyc_en_32, \i_spi_rx_word_maj_RNI4PT0V[20]\, 
        dtycyc_cnt_34, dtycyc_cnt_35, dtycyc_cnt_36, 
        dtycyc_cnt_37, dtycyc_cnt_38, SUM1, N_152_mux, i42_mux, 
        i42_mux_0, i42_mux_2, i42_mux_7, i42_mux_8, i42_mux_9, 
        i42_mux_10, i42_mux_11, N_16_0, 
        \spi_slave_pm.SPI_TX_WORD_i_1[1]\, spi_timeout_pulse_i_1, 
        CLK40M_OSC_c, IN_POWERON_RST_B_c, \IN_INVOLTAGE_OK_c[1]\, 
        \IN_INVOLTAGE_OK_c[2]\, \IN_INVOLTAGE_OK_c[3]\, 
        \IN_INVOLTAGE_OK_c[4]\, IN_TEMP_OK_c, 
        \SW2_SW3_CHANNEL_ON_BAR_c[3]\, 
        \SW2_SW3_CHANNEL_ON_BAR_c[4]\, 
        \SW2_SW3_CHANNEL_ON_BAR_c[7]\, 
        \SW2_SW3_CHANNEL_ON_BAR_c[8]\, \SW4_SLAVE_PAIRS_BAR_c[3]\, 
        \SW4_SLAVE_PAIRS_BAR_c[4]\, SW5_IGNORE_CRC_BAR_c, 
        SW5_PIN4_UNUSED_c, sca_clk_out_c, sca_reset_out_c, 
        sca_dat_out_c, \J11_DEBUG_c_c[0]\, \J11_DEBUG_c_c[1]\, 
        \J11_DEBUG_c_c[2]\, \J11_DEBUG_c_c[3]\, 
        \J11_DEBUG_c_c[4]\, \J11_DEBUG_c_c[5]\, 
        \J11_DEBUG_c_c[6]\, \J11_DEBUG_c_c[7]\, 
        \OUT_CHANNEL_MREG_c[1]\, \OUT_CHANNEL_MREG_c[2]\, 
        \OUT_CHANNEL_MREG_c[3]\, \OUT_CHANNEL_MREG_c[4]\, 
        \OUT_CHANNEL_MREG_c[5]\, \OUT_CHANNEL_MREG_c[6]\, 
        \OUT_CHANNEL_MREG_c[7]\, \OUT_CHANNEL_MREG_c[8]\, 
        \OUT_CHANNEL_IAUX_c[1]\, \OUT_CHANNEL_IAUX_c[2]\, 
        \OUT_CHANNEL_IAUX_c[3]\, \OUT_CHANNEL_IAUX_c[4]\, 
        \OUT_CHANNEL_IAUX_c[5]\, \OUT_CHANNEL_IAUX_c[6]\, 
        \OUT_CHANNEL_IAUX_c[7]\, \OUT_CHANNEL_IAUX_c[8]\, 
        \OUT_CHANNEL_VOSG_c[2]\, \OUT_CHANNEL_VOSG_c[4]\, 
        \OUT_CHANNEL_VOSG_c[6]\, \OUT_CHANNEL_VOSG_c[8]\, 
        \channels_ready[1]\, \total_channel_constraints[1]\, N_63, 
        \channels_on[3]\, \channels_ready[2]\, 
        \channels_ready[7]\, \channels_ready[6]\, N_68, N_73, 
        N_7_0, \rxcrc_pm.N_34\, \rxcrc_pm.N_31\, \rxcrc_pm.N_33\, 
        \rxcrc_pm.N_30\, \rxcrc_pm.N_32\, \rxcrc_pm.N_26\, 
        \rxcrc_pm.N_29\, \channels_ready[5]\, \channels_ready[3]\, 
        \channels_ready[4]\, \channels_ready[8]\, 
        \channels_on[4]\, N_85, N_79, 
        \active_switch_constraints[8]_net_1\, 
        \active_switch_constraints[7]_net_1\, 
        \active_switch_constraints[6]_net_1\, 
        \active_switch_constraints[5]_net_1\, 
        \active_switch_constraints[4]_net_1\, 
        \active_switch_constraints[3]_net_1\, 
        \active_switch_constraints[2]_net_1\, 
        \active_switch_constraints[1]_net_1\, \refcnt[1]_net_1\, 
        \refcnt[0]_net_1\, \spi_rx_command_reg[1]_net_1\, 
        \spi_rx_command_reg[0]_net_1\, 
        \sw2_sw5_channel_on_a[8]_net_1\, 
        \sw2_sw5_channel_on_a[7]_net_1\, 
        \sw2_sw5_channel_on_a[6]_net_1\, 
        \sw2_sw5_channel_on_a[5]_net_1\, 
        \sw2_sw5_channel_on_a[4]_net_1\, 
        \sw2_sw5_channel_on_a[3]_net_1\, 
        \sw2_sw5_channel_on_a[2]_net_1\, 
        \sw2_sw5_channel_on_a[1]_net_1\, 
        \sw2_sw5_channel_on_b[8]_net_1\, 
        \sw2_sw5_channel_on_b[7]_net_1\, 
        \sw2_sw5_channel_on_b[6]_net_1\, 
        \sw2_sw5_channel_on_b[5]_net_1\, 
        \sw2_sw5_channel_on_b[4]_net_1\, 
        \sw2_sw5_channel_on_b[3]_net_1\, 
        \sw2_sw5_channel_on_b[2]_net_1\, 
        \sw2_sw5_channel_on_b[1]_net_1\, 
        \channels_desired_on[8]_net_1\, 
        \channels_desired_on[7]_net_1\, 
        \channels_desired_on[6]_net_1\, 
        \channels_desired_on[5]_net_1\, 
        \channels_desired_on[4]_net_1\, 
        \channels_desired_on[3]_net_1\, 
        \channels_desired_on[2]_net_1\, 
        \channels_desired_on[1]_net_1\, 
        \channels_desired_ready[8]_net_1\, 
        \channels_desired_ready[7]_net_1\, 
        \channels_desired_ready[6]_net_1\, 
        \channels_desired_ready[5]_net_1\, 
        \channels_desired_ready[4]_net_1\, 
        \channels_desired_ready[3]_net_1\, 
        \channels_desired_ready[2]_net_1\, 
        \channels_desired_ready[1]_net_1\, clk_5m_gl_0, 
        \dtycyc_en\, \spi_dutycycle_mode\, \dtycyc_cnt[4]_net_1\, 
        \dtycyc_cnt[3]_net_1\, \dtycyc_cnt[2]_net_1\, 
        \dtycyc_cnt[1]_net_1\, \dtycyc_cnt[0]_net_1\, \bad_crc\, 
        \del0_dev_rst_b\, master_rst_b_0, \spi_timeout\, 
        STATUS_LED_c, N_210_i, \channel_involtage_ok[4]\, 
        \channel_involtage_ok[3]\, \channel_involtage_ok[2]\, 
        \channel_involtage_ok[1]\, \ch_mreg_en[7]\, 
        \ch_iaux_en[7]\, \OUT_CHANNEL_VOSG_c[7]\, 
        \gen_channel_seqs.4.channel_seq.ch_out1[2]\, 
        \gen_channel_seqs.4.channel_seq.ch_out1[1]\, 
        \ch_mreg_en[3]\, \ch_iaux_en[3]\, \OUT_CHANNEL_VOSG_c[3]\, 
        \gen_channel_seqs.2.channel_seq.ch_out1[2]\, 
        \gen_channel_seqs.2.channel_seq.ch_out1[1]\, 
        \ch_mreg_en[5]\, \ch_iaux_en[5]\, \OUT_CHANNEL_VOSG_c[5]\, 
        \gen_channel_seqs.3.channel_seq.ch_out1[2]\, 
        \gen_channel_seqs.3.channel_seq.ch_out1[1]\, 
        \ch_mreg_en[1]\, \ch_iaux_en[1]\, \OUT_CHANNEL_VOSG_c[1]\, 
        \gen_channel_seqs.1.channel_seq.ch_out1[2]\, 
        \gen_channel_seqs.1.channel_seq.ch_out1[1]\, 
        \spi_rx_word[30]\, \spi_rx_word[18]\, \spi_rx_word[16]\, 
        \spi_rx_word[15]\, \spi_rx_word[12]\, \spi_rx_word[11]\, 
        \spi_rx_word[10]\, \spi_rx_word[9]\, \spi_rx_word[8]\, 
        \spi_rx_word[7]\, \spi_rx_word[6]\, \spi_rx_word[5]\, 
        \spi_rx_word[4]\, \spi_rx_word[3]\, \spi_rx_word[2]\, 
        \spi_rx_word[0]\, sca_dat_in_c, spi_timeout_0, 
        \spi_timeout_tmr2\, \spi_timeout_tmr3\, master_rst_b_1, 
        \master_rst_b_tmr2\, \master_rst_b_tmr3\, 
        del0_dev_rst_b_0, \del0_dev_rst_b_tmr2\, 
        \del0_dev_rst_b_tmr3\, bad_crc_0, \bad_crc_tmr2\, 
        \bad_crc_tmr3\, \dtycyc_cnt_0[0]\, 
        \dtycyc_cnt_tmr2[0]_net_1\, \dtycyc_cnt_tmr3[0]_net_1\, 
        \dtycyc_cnt_0[1]\, \dtycyc_cnt_tmr2[1]_net_1\, 
        \dtycyc_cnt_tmr3[1]_net_1\, \dtycyc_cnt_0[2]\, 
        \dtycyc_cnt_tmr2[2]_net_1\, \dtycyc_cnt_tmr3[2]_net_1\, 
        \dtycyc_cnt_0[3]\, \dtycyc_cnt_tmr2[3]_net_1\, 
        \dtycyc_cnt_tmr3[3]_net_1\, \dtycyc_cnt_0[4]\, 
        \dtycyc_cnt_tmr2[4]_net_1\, \dtycyc_cnt_tmr3[4]_net_1\, 
        spi_dutycycle_mode_0, \spi_dutycycle_mode_tmr2\, 
        \spi_dutycycle_mode_tmr3\, dtycyc_en_0, \dtycyc_en_tmr2\, 
        \dtycyc_en_tmr3\, clk_5m_gl_1, \clk_5m_gl_tmr2\, 
        \clk_5m_gl_tmr3\, \channels_desired_ready_0[1]\, 
        \channels_desired_ready_tmr2[1]_net_1\, 
        \channels_desired_ready_tmr3[1]_net_1\, 
        \channels_desired_ready_0[2]\, 
        \channels_desired_ready_tmr2[2]_net_1\, 
        \channels_desired_ready_tmr3[2]_net_1\, 
        \channels_desired_ready_0[3]\, 
        \channels_desired_ready_tmr2[3]_net_1\, 
        \channels_desired_ready_tmr3[3]_net_1\, 
        \channels_desired_ready_0[4]\, 
        \channels_desired_ready_tmr2[4]_net_1\, 
        \channels_desired_ready_tmr3[4]_net_1\, 
        \channels_desired_ready_0[5]\, 
        \channels_desired_ready_tmr2[5]_net_1\, 
        \channels_desired_ready_tmr3[5]_net_1\, 
        \channels_desired_ready_0[6]\, 
        \channels_desired_ready_tmr2[6]_net_1\, 
        \channels_desired_ready_tmr3[6]_net_1\, 
        \channels_desired_ready_0[7]\, 
        \channels_desired_ready_tmr2[7]_net_1\, 
        \channels_desired_ready_tmr3[7]_net_1\, 
        \channels_desired_ready_0[8]\, 
        \channels_desired_ready_tmr2[8]_net_1\, 
        \channels_desired_ready_tmr3[8]_net_1\, 
        \channels_desired_on_0[1]\, 
        \channels_desired_on_tmr2[1]_net_1\, 
        \channels_desired_on_tmr3[1]_net_1\, 
        \channels_desired_on_0[2]\, 
        \channels_desired_on_tmr2[2]_net_1\, 
        \channels_desired_on_tmr3[2]_net_1\, 
        \channels_desired_on_0[3]\, 
        \channels_desired_on_tmr2[3]_net_1\, 
        \channels_desired_on_tmr3[3]_net_1\, 
        \channels_desired_on_0[4]\, 
        \channels_desired_on_tmr2[4]_net_1\, 
        \channels_desired_on_tmr3[4]_net_1\, 
        \channels_desired_on_0[5]\, 
        \channels_desired_on_tmr2[5]_net_1\, 
        \channels_desired_on_tmr3[5]_net_1\, 
        \channels_desired_on_0[6]\, 
        \channels_desired_on_tmr2[6]_net_1\, 
        \channels_desired_on_tmr3[6]_net_1\, 
        \channels_desired_on_0[7]\, 
        \channels_desired_on_tmr2[7]_net_1\, 
        \channels_desired_on_tmr3[7]_net_1\, 
        \channels_desired_on_0[8]\, 
        \channels_desired_on_tmr2[8]_net_1\, 
        \channels_desired_on_tmr3[8]_net_1\, 
        \sw2_sw5_channel_on_b_0[1]\, 
        \sw2_sw5_channel_on_b_tmr2[1]_net_1\, 
        \sw2_sw5_channel_on_b_tmr3[1]_net_1\, 
        \sw2_sw5_channel_on_b_0[2]\, 
        \sw2_sw5_channel_on_b_tmr2[2]_net_1\, 
        \sw2_sw5_channel_on_b_tmr3[2]_net_1\, 
        \sw2_sw5_channel_on_b_0[3]\, 
        \sw2_sw5_channel_on_b_tmr2[3]_net_1\, 
        \sw2_sw5_channel_on_b_tmr3[3]_net_1\, 
        \sw2_sw5_channel_on_b_0[4]\, 
        \sw2_sw5_channel_on_b_tmr2[4]_net_1\, 
        \sw2_sw5_channel_on_b_tmr3[4]_net_1\, 
        \sw2_sw5_channel_on_b_0[5]\, 
        \sw2_sw5_channel_on_b_tmr2[5]_net_1\, 
        \sw2_sw5_channel_on_b_tmr3[5]_net_1\, 
        \sw2_sw5_channel_on_b_0[6]\, 
        \sw2_sw5_channel_on_b_tmr2[6]_net_1\, 
        \sw2_sw5_channel_on_b_tmr3[6]_net_1\, 
        \sw2_sw5_channel_on_b_0[7]\, 
        \sw2_sw5_channel_on_b_tmr2[7]_net_1\, 
        \sw2_sw5_channel_on_b_tmr3[7]_net_1\, 
        \sw2_sw5_channel_on_b_0[8]\, 
        \sw2_sw5_channel_on_b_tmr2[8]_net_1\, 
        \sw2_sw5_channel_on_b_tmr3[8]_net_1\, 
        \sw2_sw5_channel_on_a_0[1]\, 
        \sw2_sw5_channel_on_a_tmr2[1]_net_1\, 
        \sw2_sw5_channel_on_a_tmr3[1]_net_1\, 
        \sw2_sw5_channel_on_a_0[2]\, 
        \sw2_sw5_channel_on_a_tmr2[2]_net_1\, 
        \sw2_sw5_channel_on_a_tmr3[2]_net_1\, 
        \sw2_sw5_channel_on_a_0[3]\, 
        \sw2_sw5_channel_on_a_tmr2[3]_net_1\, 
        \sw2_sw5_channel_on_a_tmr3[3]_net_1\, 
        \sw2_sw5_channel_on_a_0[4]\, 
        \sw2_sw5_channel_on_a_tmr2[4]_net_1\, 
        \sw2_sw5_channel_on_a_tmr3[4]_net_1\, 
        \sw2_sw5_channel_on_a_0[5]\, 
        \sw2_sw5_channel_on_a_tmr2[5]_net_1\, 
        \sw2_sw5_channel_on_a_tmr3[5]_net_1\, 
        \sw2_sw5_channel_on_a_0[6]\, 
        \sw2_sw5_channel_on_a_tmr2[6]_net_1\, 
        \sw2_sw5_channel_on_a_tmr3[6]_net_1\, 
        \sw2_sw5_channel_on_a_0[7]\, 
        \sw2_sw5_channel_on_a_tmr2[7]_net_1\, 
        \sw2_sw5_channel_on_a_tmr3[7]_net_1\, 
        \sw2_sw5_channel_on_a_0[8]\, 
        \sw2_sw5_channel_on_a_tmr2[8]_net_1\, 
        \sw2_sw5_channel_on_a_tmr3[8]_net_1\, 
        \spi_rx_command_reg_0[0]\, 
        \spi_rx_command_reg_tmr2[0]_net_1\, 
        \spi_rx_command_reg_tmr3[0]_net_1\, 
        \spi_rx_command_reg_0[1]\, 
        \spi_rx_command_reg_tmr2[1]_net_1\, 
        \spi_rx_command_reg_tmr3[1]_net_1\, \refcnt_0[0]\, 
        \refcnt_tmr2[0]_net_1\, \refcnt_tmr3[0]_net_1\, 
        \refcnt_0[1]\, \refcnt_tmr2[1]_net_1\, 
        \refcnt_tmr3[1]_net_1\, \active_switch_constraints_0[1]\, 
        \active_switch_constraints_tmr2[1]_net_1\, 
        \active_switch_constraints_tmr3[1]_net_1\, 
        \active_switch_constraints_0[2]\, 
        \active_switch_constraints_tmr2[2]_net_1\, 
        \active_switch_constraints_tmr3[2]_net_1\, 
        \active_switch_constraints_0[3]\, 
        \active_switch_constraints_tmr2[3]_net_1\, 
        \active_switch_constraints_tmr3[3]_net_1\, 
        \active_switch_constraints_0[4]\, 
        \active_switch_constraints_tmr2[4]_net_1\, 
        \active_switch_constraints_tmr3[4]_net_1\, 
        \active_switch_constraints_0[5]\, 
        \active_switch_constraints_tmr2[5]_net_1\, 
        \active_switch_constraints_tmr3[5]_net_1\, 
        \active_switch_constraints_0[6]\, 
        \active_switch_constraints_tmr2[6]_net_1\, 
        \active_switch_constraints_tmr3[6]_net_1\, 
        \active_switch_constraints_0[7]\, 
        \active_switch_constraints_tmr2[7]_net_1\, 
        \active_switch_constraints_tmr3[7]_net_1\, 
        \active_switch_constraints_0[8]\, 
        \active_switch_constraints_tmr2[8]_net_1\, 
        \active_switch_constraints_tmr3[8]_net_1\, \refcnt_i[0]\, 
        un1_sw5_default_turnon_bar_1_0, un1_master_rst_b_1_0
         : std_logic;

    for all : IIR_FILT_4_2
	Use entity work.IIR_FILT_4_2(DEF_ARCH);
    for all : crc6_1
	Use entity work.crc6_1(DEF_ARCH);
    for all : spi_slave
	Use entity work.spi_slave(DEF_ARCH);
    for all : main_sequencer_new_3_1
	Use entity work.main_sequencer_new_3_1(DEF_ARCH);
    for all : CCC_Glob_3xBuff
	Use entity work.CCC_Glob_3xBuff(DEF_ARCH);
    for all : IIR_FILT_4_1
	Use entity work.IIR_FILT_4_1(DEF_ARCH);
    for all : main_sequencer_new_3_0
	Use entity work.main_sequencer_new_3_0(DEF_ARCH);
    for all : IIR_FILT_4_0
	Use entity work.IIR_FILT_4_0(DEF_ARCH);
    for all : main_sequencer_new_3_2
	Use entity work.main_sequencer_new_3_2(DEF_ARCH);
    for all : IIR_FILT_4
	Use entity work.IIR_FILT_4(DEF_ARCH);
    for all : SLOW_PULSE_EN_GEN
	Use entity work.SLOW_PULSE_EN_GEN(DEF_ARCH);
    for all : main_sequencer_new_3
	Use entity work.main_sequencer_new_3(DEF_ARCH);
    for all : IIR_FILT_4_3
	Use entity work.IIR_FILT_4_3(DEF_ARCH);
    for all : crc6_0
	Use entity work.crc6_0(DEF_ARCH);
begin 


    \SW2_SW3_CHANNEL_ON_BAR_pad[2]\ : INBUF
      port map(PAD => SW2_SW3_CHANNEL_ON_BAR(2), Y => 
        \J11_DEBUG_c_c[2]\);
    
    \channels_desired_ready_tmr3[7]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIGR8TU[14]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr3[7]_net_1\);
    
    \channels_desired_ready_maj[3]\ : MAJ3
      port map(A => \channels_desired_ready_0[3]\, B => 
        \channels_desired_ready_tmr2[3]_net_1\, C => 
        \channels_desired_ready_tmr3[3]_net_1\, Y => 
        \channels_desired_ready[3]_net_1\);
    
    \spi_rx_command_reg[0]\ : DFN0C0
      port map(D => \i_spi_rx_word_maj_RNIC1IV5[30]\, CLK => 
        i_spi_rx_strb, CLR => \master_rst_b\, Q => 
        \spi_rx_command_reg_0[0]\);
    
    \refcnt_tmr2[1]\ : DFN1C0
      port map(D => SUM1, CLK => CLK40M_OSC_c, CLR => 
        \master_rst_b\, Q => \refcnt_tmr2[1]_net_1\);
    
    \gen_channel_seqs.4.uvl_fuse\ : IIR_FILT_4_2
      port map(IN_INVOLTAGE_OK_c_0 => \IN_INVOLTAGE_OK_c[4]\, 
        channel_involtage_ok_0 => \channel_involtage_ok[4]\, 
        ch_mreg_en_0 => \ch_mreg_en[7]\, OUT_CHANNEL_MREG_c_0 => 
        \OUT_CHANNEL_MREG_c[7]\, master_rst_b => \master_rst_b\, 
        clk_5m_gl => \clk_5m_gl\);
    
    \J11_DEBUG_pad[2]\ : OUTBUF
      port map(D => \J11_DEBUG_c_c[2]\, PAD => J11_DEBUG(2));
    
    \SW4_SLAVE_PAIRS_BAR_pad[3]\ : INBUF
      port map(PAD => SW4_SLAVE_PAIRS_BAR(3), Y => 
        \SW4_SLAVE_PAIRS_BAR_c[3]\);
    
    \active_switch_constraints_tmr3[7]\ : DFN1C0
      port map(D => \debounce.7.un46_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr3[7]_net_1\);
    
    \dtycyc_cnt_maj[2]\ : MAJ3
      port map(A => \dtycyc_cnt_0[2]\, B => 
        \dtycyc_cnt_tmr2[2]_net_1\, C => 
        \dtycyc_cnt_tmr3[2]_net_1\, Y => \dtycyc_cnt[2]_net_1\);
    
    sca_dat_out_pad : INBUF
      port map(PAD => sca_dat_out, Y => sca_dat_out_c);
    
    \refcnt_maj[1]\ : MAJ3
      port map(A => \refcnt_0[1]\, B => \refcnt_tmr2[1]_net_1\, C
         => \refcnt_tmr3[1]_net_1\, Y => \refcnt[1]_net_1\);
    
    \channels_desired_on[3]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIPJ2FV[2]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_on_0[3]\);
    
    spi_dutycycle_mode_tmr2 : DFN0C0
      port map(D => \i_spi_rx_word_maj_RNI4PT0V[20]\, CLK => 
        i_spi_rx_strb, CLR => \master_rst_b\, Q => 
        \spi_dutycycle_mode_tmr2\);
    
    \sw2_sw5_channel_on_b_tmr2[4]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_26, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr2[4]_net_1\);
    
    del0_dev_rst_b : DFN1C0
      port map(D => \VCC\, CLK => CLK40M_OSC_c, CLR => 
        IN_POWERON_RST_B_c, Q => del0_dev_rst_b_0);
    
    \channels_desired_on_tmr3[4]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNI5PM301[3]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr3[4]_net_1\);
    
    \active_switch_constraints_tmr2[2]\ : DFN1C0
      port map(D => \debounce.2.un11_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr2[2]_net_1\);
    
    \dtycyc_cnt[2]\ : DFN1C0
      port map(D => dtycyc_cnt_36, CLK => \clk_5m_gl\, CLR => 
        \master_rst_b\, Q => \dtycyc_cnt_0[2]\);
    
    del0_dev_rst_b_tmr3 : DFN1C0
      port map(D => \VCC\, CLK => CLK40M_OSC_c, CLR => 
        IN_POWERON_RST_B_c, Q => \del0_dev_rst_b_tmr3\);
    
    clk_5m_gl_tmr3 : DFN1C0
      port map(D => \clk_5m_gl_maj_RNIOPBG1\, CLK => CLK40M_OSC_c, 
        CLR => \master_rst_b\, Q => \clk_5m_gl_tmr3\);
    
    \channels_desired_on[1]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNICQ6MV[0]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_on_0[1]\);
    
    \SW2_SW3_CHANNEL_ON_BAR_pad[7]\ : INBUF
      port map(PAD => SW2_SW3_CHANNEL_ON_BAR(7), Y => 
        \SW2_SW3_CHANNEL_ON_BAR_c[7]\);
    
    \dtycyc_cnt_tmr2[2]\ : DFN1C0
      port map(D => dtycyc_cnt_36, CLK => \clk_5m_gl\, CLR => 
        \master_rst_b\, Q => \dtycyc_cnt_tmr2[2]_net_1\);
    
    \active_switch_constraints_tmr2[8]\ : DFN1C0
      port map(D => \debounce.8.un53_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr2[8]_net_1\);
    
    spi_timeout_tmr2 : DFN0C0
      port map(D => spi_timeout_pulse_i_1, CLK => i_spi_rx_strb, 
        CLR => \master_rst_b\, Q => \spi_timeout_tmr2\);
    
    \dtycyc_cnt[4]\ : DFN1P0
      port map(D => dtycyc_cnt_34, CLK => \clk_5m_gl\, PRE => 
        \master_rst_b\, Q => \dtycyc_cnt_0[4]\);
    
    \sw2_sw5_channel_on_a_tmr3[7]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_21, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr3[7]_net_1\);
    
    \sw2_sw5_channel_on_a_tmr3[6]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_20, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr3[6]_net_1\);
    
    \OUT_CHANNEL_MREG_pad[6]\ : OUTBUF
      port map(D => \OUT_CHANNEL_MREG_c[6]\, PAD => 
        OUT_CHANNEL_MREG(6));
    
    \sw2_sw5_channel_on_b_tmr2[6]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_28, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr2[6]_net_1\);
    
    \SW2_SW3_CHANNEL_ON_BAR_pad[4]\ : INBUF
      port map(PAD => SW2_SW3_CHANNEL_ON_BAR(4), Y => 
        \SW2_SW3_CHANNEL_ON_BAR_c[4]\);
    
    \dtycyc_cnt_tmr2[3]\ : DFN1C0
      port map(D => dtycyc_cnt_35, CLK => \clk_5m_gl\, CLR => 
        \master_rst_b\, Q => \dtycyc_cnt_tmr2[3]_net_1\);
    
    \sw2_sw5_channel_on_b[7]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_29, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_b_0[7]\);
    
    \OUT_CHANNEL_MREG_pad[3]\ : OUTBUF
      port map(D => \OUT_CHANNEL_MREG_c[3]\, PAD => 
        OUT_CHANNEL_MREG(3));
    
    \active_switch_constraints[6]\ : DFN1C0
      port map(D => \debounce.6.un39_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_0[6]\);
    
    txcrc_pm : crc6_1
      port map(spi_tx_word_0 => \spi_tx_word[0]\, spi_tx_word_16
         => \spi_tx_word[16]\, spi_tx_word_19 => 
        \spi_tx_word[19]\, spi_tx_word_21 => \spi_tx_word[21]\, 
        spi_tx_word_7 => \spi_tx_word[7]\, spi_tx_word_4 => 
        \spi_tx_word[4]\, spi_tx_word_9 => \spi_tx_word[9]\, 
        spi_tx_word_6 => \spi_tx_word[6]\, spi_tx_word_11 => 
        \spi_tx_word[11]\, spi_tx_word_8 => \spi_tx_word[8]\, 
        spi_tx_word_10 => \spi_tx_word[10]\, spi_tx_word_18 => 
        \spi_tx_word[18]\, spi_tx_word_5 => \spi_tx_word[5]\, 
        spi_tx_word_17 => \spi_tx_word[17]\, ch_iaux_en_0 => 
        \ch_iaux_en[7]\, OUT_CHANNEL_IAUX_c(8) => 
        \OUT_CHANNEL_IAUX_c[8]\, OUT_CHANNEL_IAUX_c(7) => 
        \OUT_CHANNEL_IAUX_c[7]\, ch_out1_0 => 
        \gen_channel_seqs.4.channel_seq.ch_out1[1]\, 
        SW4_SLAVE_PAIRS_BAR_c_0 => \SW4_SLAVE_PAIRS_BAR_c[4]\, 
        active_switch_constraints_1 => 
        \active_switch_constraints[2]_net_1\, 
        active_switch_constraints_0 => 
        \active_switch_constraints[1]_net_1\, 
        active_switch_constraints_6 => 
        \active_switch_constraints[7]_net_1\, 
        active_switch_constraints_7 => 
        \active_switch_constraints[8]_net_1\, 
        channel_involtage_ok_0 => \channel_involtage_ok[1]\, 
        channel_involtage_ok_3 => \channel_involtage_ok[4]\, 
        total_channel_constraints_0 => 
        \total_channel_constraints[1]\, tx_crc(5) => \tx_crc[5]\, 
        tx_crc(4) => \tx_crc[4]\, tx_crc(3) => \tx_crc[3]\, 
        tx_crc(2) => \tx_crc[2]\, tx_crc(1) => \tx_crc[1]\, 
        tx_crc(0) => \tx_crc[0]\, SPI_TX_WORD_i_1_0 => 
        \spi_slave_pm.SPI_TX_WORD_i_1[1]\, N_68 => N_68, N_73 => 
        N_73, STATUS_LED_c => STATUS_LED_c, N_7_0 => N_7_0, 
        i42_mux_11 => i42_mux_11, i42_mux_7 => i42_mux_7, 
        i42_mux_8 => i42_mux_8, i42_mux_10 => i42_mux_10, 
        i42_mux_2 => i42_mux_2, i42_mux_0 => i42_mux_0, i42_mux_9
         => i42_mux_9, N_16_0 => N_16_0, i42_mux => i42_mux);
    
    \active_switch_constraints_maj[8]\ : MAJ3
      port map(A => \active_switch_constraints_0[8]\, B => 
        \active_switch_constraints_tmr2[8]_net_1\, C => 
        \active_switch_constraints_tmr3[8]_net_1\, Y => 
        \active_switch_constraints[8]_net_1\);
    
    \dtycyc_cnt_tmr2[4]\ : DFN1P0
      port map(D => dtycyc_cnt_34, CLK => \clk_5m_gl\, PRE => 
        \master_rst_b\, Q => \dtycyc_cnt_tmr2[4]_net_1\);
    
    spi_slave_pm : spi_slave
      port map(i_spi_rx_word_maj_RNIC1IV5_0 => 
        \i_spi_rx_word_maj_RNIC1IV5[30]\, 
        i_spi_rx_word_maj_RNIE3IV5_0 => 
        \i_spi_rx_word_maj_RNIE3IV5[31]\, channels_ready(8) => 
        \channels_ready[8]\, channels_ready(7) => 
        \channels_ready[7]\, channels_ready(6) => 
        \channels_ready[6]\, channels_ready(5) => 
        \channels_ready[5]\, channels_ready(4) => 
        \channels_ready[4]\, channels_ready(3) => 
        \channels_ready[3]\, channels_ready(2) => 
        \channels_ready[2]\, channels_ready(1) => 
        \channels_ready[1]\, active_switch_constraints(8) => 
        \active_switch_constraints[8]_net_1\, 
        active_switch_constraints(7) => 
        \active_switch_constraints[7]_net_1\, 
        active_switch_constraints(6) => 
        \active_switch_constraints[6]_net_1\, 
        active_switch_constraints(5) => 
        \active_switch_constraints[5]_net_1\, 
        active_switch_constraints(4) => 
        \active_switch_constraints[4]_net_1\, 
        active_switch_constraints(3) => 
        \active_switch_constraints[3]_net_1\, 
        active_switch_constraints(2) => 
        \active_switch_constraints[2]_net_1\, 
        active_switch_constraints(1) => 
        \active_switch_constraints[1]_net_1\, spi_tx_word_10 => 
        \spi_tx_word[10]\, spi_tx_word_11 => \spi_tx_word[11]\, 
        spi_tx_word_18 => \spi_tx_word[18]\, spi_tx_word_19 => 
        \spi_tx_word[19]\, spi_tx_word_5 => \spi_tx_word[5]\, 
        spi_tx_word_9 => \spi_tx_word[9]\, spi_tx_word_17 => 
        \spi_tx_word[17]\, spi_tx_word_0 => \spi_tx_word[0]\, 
        spi_tx_word_6 => \spi_tx_word[6]\, spi_tx_word_7 => 
        \spi_tx_word[7]\, spi_tx_word_21 => \spi_tx_word[21]\, 
        spi_tx_word_4 => \spi_tx_word[4]\, spi_tx_word_8 => 
        \spi_tx_word[8]\, spi_tx_word_16 => \spi_tx_word[16]\, 
        total_channel_constraints_0 => 
        \total_channel_constraints[1]\, J11_DEBUG_c_c(7) => 
        \J11_DEBUG_c_c[7]\, J11_DEBUG_c_c(6) => 
        \J11_DEBUG_c_c[6]\, J11_DEBUG_c_c(5) => 
        \J11_DEBUG_c_c[5]\, J11_DEBUG_c_c(4) => 
        \J11_DEBUG_c_c[4]\, J11_DEBUG_c_c(3) => 
        \J11_DEBUG_c_c[3]\, J11_DEBUG_c_c(2) => 
        \J11_DEBUG_c_c[2]\, J11_DEBUG_c_c(1) => 
        \J11_DEBUG_c_c[1]\, J11_DEBUG_c_c(0) => 
        \J11_DEBUG_c_c[0]\, dtycyc_cnt(4) => 
        \dtycyc_cnt[4]_net_1\, dtycyc_cnt(3) => 
        \dtycyc_cnt[3]_net_1\, dtycyc_cnt(2) => 
        \dtycyc_cnt[2]_net_1\, dtycyc_cnt(1) => 
        \dtycyc_cnt[1]_net_1\, dtycyc_cnt(0) => 
        \dtycyc_cnt[0]_net_1\, tx_crc(5) => \tx_crc[5]\, 
        tx_crc(4) => \tx_crc[4]\, tx_crc(3) => \tx_crc[3]\, 
        tx_crc(2) => \tx_crc[2]\, tx_crc(1) => \tx_crc[1]\, 
        tx_crc(0) => \tx_crc[0]\, channels_on(4) => 
        \channels_on[4]\, channels_on(3) => \channels_on[3]\, 
        spi_rx_command_reg(1) => \spi_rx_command_reg[1]_net_1\, 
        spi_rx_command_reg(0) => \spi_rx_command_reg[0]_net_1\, 
        channels_desired_on(8) => \channels_desired_on[8]_net_1\, 
        channels_desired_on(7) => \channels_desired_on[7]_net_1\, 
        channels_desired_on(6) => \channels_desired_on[6]_net_1\, 
        channels_desired_on(5) => \channels_desired_on[5]_net_1\, 
        channels_desired_on(4) => \channels_desired_on[4]_net_1\, 
        channels_desired_on(3) => \channels_desired_on[3]_net_1\, 
        channels_desired_on(2) => \channels_desired_on[2]_net_1\, 
        channels_desired_on(1) => \channels_desired_on[1]_net_1\, 
        i_spi_rx_word_maj_RNIRFN301_0 => 
        \i_spi_rx_word_maj_RNIRFN301[15]\, 
        i_spi_rx_word_maj_RNI503FV_0 => 
        \i_spi_rx_word_maj_RNI503FV[6]\, 
        i_spi_rx_word_maj_RNIG4N301_0 => 
        \i_spi_rx_word_maj_RNIG4N301[5]\, 
        i_spi_rx_word_maj_RNIVP2FV_0 => 
        \i_spi_rx_word_maj_RNIVP2FV[4]\, 
        i_spi_rx_word_maj_RNI5PM301_0 => 
        \i_spi_rx_word_maj_RNI5PM301[3]\, 
        i_spi_rx_word_maj_RNIPJ2FV_0 => 
        \i_spi_rx_word_maj_RNIPJ2FV[2]\, 
        i_spi_rx_word_maj_RNIC7VH01_0 => 
        \i_spi_rx_word_maj_RNIC7VH01[1]\, 
        i_spi_rx_word_maj_RNICQ6MV_0 => 
        \i_spi_rx_word_maj_RNICQ6MV[0]\, 
        channels_desired_ready(8) => 
        \channels_desired_ready[8]_net_1\, 
        channels_desired_ready(7) => 
        \channels_desired_ready[7]_net_1\, 
        channels_desired_ready(6) => 
        \channels_desired_ready[6]_net_1\, 
        channels_desired_ready(5) => 
        \channels_desired_ready[5]_net_1\, 
        channels_desired_ready(4) => 
        \channels_desired_ready[4]_net_1\, 
        channels_desired_ready(3) => 
        \channels_desired_ready[3]_net_1\, 
        channels_desired_ready(2) => 
        \channels_desired_ready[2]_net_1\, 
        channels_desired_ready(1) => 
        \channels_desired_ready[1]_net_1\, 
        i_spi_rx_word_maj_RNIO745V_0 => 
        \i_spi_rx_word_maj_RNIO745V[15]\, 
        i_spi_rx_word_maj_RNIGR8TU_0 => 
        \i_spi_rx_word_maj_RNIGR8TU[14]\, 
        i_spi_rx_word_maj_RNIH045V_0 => 
        \i_spi_rx_word_maj_RNIH045V[12]\, 
        i_spi_rx_word_maj_RNICN8TU_0 => 
        \i_spi_rx_word_maj_RNICN8TU[12]\, 
        i_spi_rx_word_maj_RNIAP35V_0 => 
        \i_spi_rx_word_maj_RNIAP35V[11]\, 
        i_spi_rx_word_maj_RNI8J8TU_0 => 
        \i_spi_rx_word_maj_RNI8J8TU[10]\, 
        i_spi_rx_word_maj_RNILBCJV_0 => 
        \i_spi_rx_word_maj_RNILBCJV[9]\, 
        i_spi_rx_word_maj_RNITRC4V_0 => 
        \i_spi_rx_word_maj_RNITRC4V[8]\, 
        i_spi_rx_word_maj_RNI4PT0V_0 => 
        \i_spi_rx_word_maj_RNI4PT0V[20]\, ch_out1_1(2) => 
        \gen_channel_seqs.4.channel_seq.ch_out1[2]\, ch_out1_1(1)
         => \gen_channel_seqs.3.channel_seq.ch_out1[1]\, 
        OUT_CHANNEL_IAUX_c(6) => \OUT_CHANNEL_IAUX_c[6]\, 
        OUT_CHANNEL_IAUX_c(5) => \OUT_CHANNEL_IAUX_c[5]\, 
        OUT_CHANNEL_IAUX_c(4) => \OUT_CHANNEL_IAUX_c[4]\, 
        OUT_CHANNEL_IAUX_c(3) => \OUT_CHANNEL_IAUX_c[3]\, 
        OUT_CHANNEL_IAUX_c(2) => \OUT_CHANNEL_IAUX_c[2]\, 
        OUT_CHANNEL_IAUX_c(1) => \OUT_CHANNEL_IAUX_c[1]\, 
        ch_iaux_en_0 => \ch_iaux_en[1]\, ch_iaux_en_2 => 
        \ch_iaux_en[3]\, ch_iaux_en_4 => \ch_iaux_en[5]\, 
        ch_out1_0(2) => 
        \gen_channel_seqs.3.channel_seq.ch_out1[2]\, ch_out1_0(1)
         => \gen_channel_seqs.2.channel_seq.ch_out1[1]\, 
        ch_out1(2) => \gen_channel_seqs.1.channel_seq.ch_out1[2]\, 
        ch_out1(1) => \gen_channel_seqs.1.channel_seq.ch_out1[1]\, 
        channel_involtage_ok(4) => \channel_involtage_ok[4]\, 
        channel_involtage_ok(3) => \channel_involtage_ok[3]\, 
        channel_involtage_ok(2) => \channel_involtage_ok[2]\, 
        channel_involtage_ok(1) => \channel_involtage_ok[1]\, 
        SW4_SLAVE_PAIRS_BAR_c(4) => \SW4_SLAVE_PAIRS_BAR_c[4]\, 
        SW4_SLAVE_PAIRS_BAR_c(3) => \SW4_SLAVE_PAIRS_BAR_c[3]\, 
        OUT_CHANNEL_MREG_c_0 => \OUT_CHANNEL_MREG_c[1]\, 
        OUT_CHANNEL_MREG_c_1 => \OUT_CHANNEL_MREG_c[2]\, 
        OUT_CHANNEL_MREG_c_2 => \OUT_CHANNEL_MREG_c[3]\, 
        OUT_CHANNEL_MREG_c_4 => \OUT_CHANNEL_MREG_c[5]\, 
        OUT_CHANNEL_MREG_c_5 => \OUT_CHANNEL_MREG_c[6]\, 
        OUT_CHANNEL_MREG_c_7 => \OUT_CHANNEL_MREG_c[8]\, 
        ch_mreg_en_0 => \ch_mreg_en[1]\, ch_mreg_en_2 => 
        \ch_mreg_en[3]\, ch_mreg_en_4 => \ch_mreg_en[5]\, 
        SPI_TX_WORD_i_1_0 => \spi_slave_pm.SPI_TX_WORD_i_1[1]\, 
        spi_rx_word_7 => \spi_rx_word[7]\, spi_rx_word_9 => 
        \spi_rx_word[9]\, spi_rx_word_16 => \spi_rx_word[16]\, 
        spi_rx_word_10 => \spi_rx_word[10]\, spi_rx_word_12 => 
        \spi_rx_word[12]\, spi_rx_word_0 => \spi_rx_word[0]\, 
        spi_rx_word_6 => \spi_rx_word[6]\, spi_rx_word_2 => 
        \spi_rx_word[2]\, spi_rx_word_8 => \spi_rx_word[8]\, 
        spi_rx_word_30 => \spi_rx_word[30]\, spi_rx_word_3 => 
        \spi_rx_word[3]\, spi_rx_word_4 => \spi_rx_word[4]\, 
        spi_rx_word_5 => \spi_rx_word[5]\, spi_rx_word_11 => 
        \spi_rx_word[11]\, spi_rx_word_15 => \spi_rx_word[15]\, 
        spi_rx_word_18 => \spi_rx_word[18]\, 
        SW2_SW3_CHANNEL_ON_BAR_c_5 => 
        \SW2_SW3_CHANNEL_ON_BAR_c[8]\, SW2_SW3_CHANNEL_ON_BAR_c_0
         => \SW2_SW3_CHANNEL_ON_BAR_c[3]\, 
        SW2_SW3_CHANNEL_ON_BAR_c_1 => 
        \SW2_SW3_CHANNEL_ON_BAR_c[4]\, SW2_SW3_CHANNEL_ON_BAR_c_4
         => \SW2_SW3_CHANNEL_ON_BAR_c[7]\, 
        sw2_sw5_channel_on_a(8) => 
        \sw2_sw5_channel_on_a[8]_net_1\, sw2_sw5_channel_on_a(7)
         => \sw2_sw5_channel_on_a[7]_net_1\, 
        sw2_sw5_channel_on_a(6) => 
        \sw2_sw5_channel_on_a[6]_net_1\, sw2_sw5_channel_on_a(5)
         => \sw2_sw5_channel_on_a[5]_net_1\, 
        sw2_sw5_channel_on_a(4) => 
        \sw2_sw5_channel_on_a[4]_net_1\, sw2_sw5_channel_on_a(3)
         => \sw2_sw5_channel_on_a[3]_net_1\, 
        sw2_sw5_channel_on_a(2) => 
        \sw2_sw5_channel_on_a[2]_net_1\, sw2_sw5_channel_on_a(1)
         => \sw2_sw5_channel_on_a[1]_net_1\, 
        sw2_sw5_channel_on_b(8) => 
        \sw2_sw5_channel_on_b[8]_net_1\, sw2_sw5_channel_on_b(7)
         => \sw2_sw5_channel_on_b[7]_net_1\, 
        sw2_sw5_channel_on_b(6) => 
        \sw2_sw5_channel_on_b[6]_net_1\, sw2_sw5_channel_on_b(5)
         => \sw2_sw5_channel_on_b[5]_net_1\, 
        sw2_sw5_channel_on_b(4) => 
        \sw2_sw5_channel_on_b[4]_net_1\, sw2_sw5_channel_on_b(3)
         => \sw2_sw5_channel_on_b[3]_net_1\, 
        sw2_sw5_channel_on_b(2) => 
        \sw2_sw5_channel_on_b[2]_net_1\, sw2_sw5_channel_on_b(1)
         => \sw2_sw5_channel_on_b[1]_net_1\, i_spi_rx_strb_1 => 
        i_spi_rx_strb, sca_dat_out_c => sca_dat_out_c, GLB => GLB, 
        gb_spi_rst_b => gb_spi_rst_b, clk_5m_gl => \clk_5m_gl\, 
        sw2_sw5_channel_on_a_15 => sw2_sw5_channel_on_a_15, 
        sw2_sw5_channel_on_a_16 => sw2_sw5_channel_on_a_16, 
        sw2_sw5_channel_on_a_17 => sw2_sw5_channel_on_a_17, 
        sw2_sw5_channel_on_a_18 => sw2_sw5_channel_on_a_18, 
        sw2_sw5_channel_on_a_20 => sw2_sw5_channel_on_a_20, 
        sw2_sw5_channel_on_a_21 => sw2_sw5_channel_on_a_21, 
        sw2_sw5_channel_on_a_22 => sw2_sw5_channel_on_a_22, 
        sw2_sw5_channel_on_b_23 => sw2_sw5_channel_on_b_23, 
        sw2_sw5_channel_on_b_24 => sw2_sw5_channel_on_b_24, 
        sw2_sw5_channel_on_b_25 => sw2_sw5_channel_on_b_25, 
        sw2_sw5_channel_on_b_26 => sw2_sw5_channel_on_b_26, 
        sw2_sw5_channel_on_b_28 => sw2_sw5_channel_on_b_28, 
        sw2_sw5_channel_on_b_29 => sw2_sw5_channel_on_b_29, 
        sw2_sw5_channel_on_b_30 => sw2_sw5_channel_on_b_30, 
        dtycyc_en => \dtycyc_en\, dtycyc_en_32 => dtycyc_en_32, 
        dtycyc_cnt_34 => dtycyc_cnt_34, dtycyc_cnt_35 => 
        dtycyc_cnt_35, dtycyc_cnt_36 => dtycyc_cnt_36, 
        dtycyc_cnt_37 => dtycyc_cnt_37, dtycyc_cnt_38 => 
        dtycyc_cnt_38, m32_0 => m32_0, m31 => m31, 
        SW5_IGNORE_CRC_BAR_c => SW5_IGNORE_CRC_BAR_c, 
        bad_crc_1_sqmuxa => bad_crc_1_sqmuxa, N_7_0 => N_7_0, 
        SW5_PIN4_UNUSED_c => SW5_PIN4_UNUSED_c, i42_mux_9 => 
        i42_mux_9, bad_crc => \bad_crc\, N_63_0 => N_63, 
        spi_timeout => \spi_timeout\, N_85 => N_85, STATUS_LED_c
         => STATUS_LED_c, N_79 => N_79, N_73 => N_73, N_68_0 => 
        N_68, spi_dutycycle_mode => \spi_dutycycle_mode\, 
        sw2_sw5_channel_on_b_27 => sw2_sw5_channel_on_b_27, 
        N_210_i => N_210_i, sw2_sw5_channel_on_a_19 => 
        sw2_sw5_channel_on_a_19, i42_mux => i42_mux, i42_mux_0
         => i42_mux_0, i42_mux_7 => i42_mux_7, i42_mux_8 => 
        i42_mux_8, i42_mux_2 => i42_mux_2, i42_mux_10 => 
        i42_mux_10, N_16_0 => N_16_0, i42_mux_11 => i42_mux_11, 
        sca_dat_in_c => sca_dat_in_c, un46_sw2_sw3_channel_on_bar
         => \debounce.7.un46_sw2_sw3_channel_on_bar\, 
        un32_sw2_sw3_channel_on_bar => 
        \debounce.5.un32_sw2_sw3_channel_on_bar\, 
        un25_sw2_sw3_channel_on_bar => 
        \debounce.4.un25_sw2_sw3_channel_on_bar\, 
        un18_sw2_sw3_channel_on_bar => 
        \debounce.3.un18_sw2_sw3_channel_on_bar\, 
        un4_sw2_sw3_channel_on_bar => 
        \debounce.1.un4_sw2_sw3_channel_on_bar\, 
        un11_sw2_sw3_channel_on_bar => 
        \debounce.2.un11_sw2_sw3_channel_on_bar\, 
        un39_sw2_sw3_channel_on_bar => 
        \debounce.6.un39_sw2_sw3_channel_on_bar\, 
        un53_sw2_sw3_channel_on_bar => 
        \debounce.8.un53_sw2_sw3_channel_on_bar\, 
        spi_timeout_pulse_i_1 => spi_timeout_pulse_i_1, N_32 => 
        \rxcrc_pm.N_32\, N_26 => \rxcrc_pm.N_26\, N_29 => 
        \rxcrc_pm.N_29\, N_34 => \rxcrc_pm.N_34\, N_30 => 
        \rxcrc_pm.N_30\, N_33 => \rxcrc_pm.N_33\, N_31 => 
        \rxcrc_pm.N_31\, un1_sw5_default_turnon_bar_1_0 => 
        un1_sw5_default_turnon_bar_1_0, master_rst_b => 
        \master_rst_b\, un1_master_rst_b_1_0 => 
        un1_master_rst_b_1_0);
    
    \channels_desired_ready_tmr2[5]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNICN8TU[12]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr2[5]_net_1\);
    
    \channels_desired_ready_maj[2]\ : MAJ3
      port map(A => \channels_desired_ready_0[2]\, B => 
        \channels_desired_ready_tmr2[2]_net_1\, C => 
        \channels_desired_ready_tmr3[2]_net_1\, Y => 
        \channels_desired_ready[2]_net_1\);
    
    IN_TEMP_OK_pad : INBUF
      port map(PAD => IN_TEMP_OK, Y => IN_TEMP_OK_c);
    
    \J11_DEBUG_pad[7]\ : OUTBUF
      port map(D => \J11_DEBUG_c_c[7]\, PAD => J11_DEBUG(7));
    
    \SW2_SW3_CHANNEL_ON_BAR_pad[5]\ : INBUF
      port map(PAD => SW2_SW3_CHANNEL_ON_BAR(5), Y => 
        \J11_DEBUG_c_c[7]\);
    
    \channels_desired_on[4]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNI5PM301[3]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_on_0[4]\);
    
    \active_switch_constraints[7]\ : DFN1C0
      port map(D => \debounce.7.un46_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_0[7]\);
    
    \dtycyc_cnt_maj[0]\ : MAJ3
      port map(A => \dtycyc_cnt_0[0]\, B => 
        \dtycyc_cnt_tmr2[0]_net_1\, C => 
        \dtycyc_cnt_tmr3[0]_net_1\, Y => \dtycyc_cnt[0]_net_1\);
    
    \OUT_CHANNEL_VOSG_pad[1]\ : OUTBUF
      port map(D => \OUT_CHANNEL_VOSG_c[1]\, PAD => 
        OUT_CHANNEL_VOSG(1));
    
    spi_timeout : DFN0C0
      port map(D => spi_timeout_pulse_i_1, CLK => i_spi_rx_strb, 
        CLR => \master_rst_b\, Q => spi_timeout_0);
    
    \OUT_CHANNEL_IAUX_pad[1]\ : OUTBUF
      port map(D => \OUT_CHANNEL_IAUX_c[1]\, PAD => 
        OUT_CHANNEL_IAUX(1));
    
    \gen_channel_seqs.2.channel_seq\ : main_sequencer_new_3_1
      port map(channels_on(4) => \channels_on[4]\, channels_on(3)
         => \channels_on[3]\, ch_out1(2) => 
        \gen_channel_seqs.2.channel_seq.ch_out1[2]\, ch_out1(1)
         => \gen_channel_seqs.2.channel_seq.ch_out1[1]\, 
        ch_mreg_en_0 => \ch_mreg_en[3]\, ch_iaux_en_0 => 
        \ch_iaux_en[3]\, OUT_CHANNEL_VOSG_c(4) => 
        \OUT_CHANNEL_VOSG_c[4]\, OUT_CHANNEL_VOSG_c(3) => 
        \OUT_CHANNEL_VOSG_c[3]\, J11_DEBUG_c_c_0 => 
        \J11_DEBUG_c_c[1]\, channels_ready(4) => 
        \channels_ready[4]\, channels_ready(3) => 
        \channels_ready[3]\, master_rst_b => \master_rst_b\, 
        clk_5m_gl => \clk_5m_gl\, dtycyc_en => \dtycyc_en\);
    
    \active_switch_constraints[3]\ : DFN1C0
      port map(D => \debounce.3.un18_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_0[3]\);
    
    \channels_desired_ready_tmr2[7]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIGR8TU[14]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr2[7]_net_1\);
    
    \spi_rx_command_reg_tmr2[0]\ : DFN0C0
      port map(D => \i_spi_rx_word_maj_RNIC1IV5[30]\, CLK => 
        i_spi_rx_strb, CLR => \master_rst_b\, Q => 
        \spi_rx_command_reg_tmr2[0]_net_1\);
    
    \active_switch_constraints_tmr2[1]\ : DFN1C0
      port map(D => \debounce.1.un4_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr2[1]_net_1\);
    
    \SW2_SW3_CHANNEL_ON_BAR_pad[3]\ : INBUF
      port map(PAD => SW2_SW3_CHANNEL_ON_BAR(3), Y => 
        \SW2_SW3_CHANNEL_ON_BAR_c[3]\);
    
    \sw2_sw5_channel_on_a_maj[8]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_a_0[8]\, B => 
        \sw2_sw5_channel_on_a_tmr2[8]_net_1\, C => 
        \sw2_sw5_channel_on_a_tmr3[8]_net_1\, Y => 
        \sw2_sw5_channel_on_a[8]_net_1\);
    
    del0_dev_rst_b_maj : MAJ3
      port map(A => del0_dev_rst_b_0, B => \del0_dev_rst_b_tmr2\, 
        C => \del0_dev_rst_b_tmr3\, Y => \del0_dev_rst_b\);
    
    glob_buff : CCC_Glob_3xBuff
      port map(sca_clk_out_c => sca_clk_out_c, gb_spi_rst_b => 
        gb_spi_rst_b, CLK40M_OSC_c => CLK40M_OSC_c, GLB => GLB, 
        master_rst_b => \master_rst_b\, sca_reset_out_c => 
        sca_reset_out_c);
    
    SW5_IGNORE_CRC_BAR_pad : INBUF
      port map(PAD => SW5_IGNORE_CRC_BAR, Y => 
        SW5_IGNORE_CRC_BAR_c);
    
    \sw2_sw5_channel_on_b_tmr2[7]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_29, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr2[7]_net_1\);
    
    \active_switch_constraints_tmr2[5]\ : DFN1C0
      port map(D => \debounce.5.un32_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr2[5]_net_1\);
    
    \sw2_sw5_channel_on_b_tmr3[2]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_24, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr3[2]_net_1\);
    
    \J11_DEBUG_pad[1]\ : OUTBUF
      port map(D => \J11_DEBUG_c_c[1]\, PAD => J11_DEBUG(1));
    
    clk_5m_gl_maj : MAJ3
      port map(A => clk_5m_gl_1, B => \clk_5m_gl_tmr2\, C => 
        \clk_5m_gl_tmr3\, Y => clk_5m_gl_0);
    
    \dtycyc_cnt_tmr3[1]\ : DFN1P0
      port map(D => dtycyc_cnt_37, CLK => \clk_5m_gl\, PRE => 
        \master_rst_b\, Q => \dtycyc_cnt_tmr3[1]_net_1\);
    
    \sw2_sw5_channel_on_b[3]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_25, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_b_0[3]\);
    
    \sw2_sw5_channel_on_a[4]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_18, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_a_0[4]\);
    
    \IN_INVOLTAGE_OK_pad[4]\ : INBUF
      port map(PAD => IN_INVOLTAGE_OK(4), Y => 
        \IN_INVOLTAGE_OK_c[4]\);
    
    \gen_channel_seqs.3.uvl_fuse\ : IIR_FILT_4_1
      port map(IN_INVOLTAGE_OK_c_0 => \IN_INVOLTAGE_OK_c[3]\, 
        channel_involtage_ok_0 => \channel_involtage_ok[3]\, 
        master_rst_b => \master_rst_b\, clk_5m_gl => \clk_5m_gl\);
    
    \dtycyc_cnt_tmr3[4]\ : DFN1P0
      port map(D => dtycyc_cnt_34, CLK => \clk_5m_gl\, PRE => 
        \master_rst_b\, Q => \dtycyc_cnt_tmr3[4]_net_1\);
    
    \sw2_sw5_channel_on_b_tmr3[8]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_30, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr3[8]_net_1\);
    
    \OUT_CHANNEL_VOSG_pad[2]\ : OUTBUF
      port map(D => \OUT_CHANNEL_VOSG_c[2]\, PAD => 
        OUT_CHANNEL_VOSG(2));
    
    GND_i : GND
      port map(Y => \GND\);
    
    sca_clk_out_pad : INBUF
      port map(PAD => sca_clk_out, Y => sca_clk_out_c);
    
    \channels_desired_on_tmr2[7]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNI503FV[6]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr2[7]_net_1\);
    
    \sw2_sw5_channel_on_a_maj[3]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_a_0[3]\, B => 
        \sw2_sw5_channel_on_a_tmr2[3]_net_1\, C => 
        \sw2_sw5_channel_on_a_tmr3[3]_net_1\, Y => 
        \sw2_sw5_channel_on_a[3]_net_1\);
    
    \IN_INVOLTAGE_OK_pad[2]\ : INBUF
      port map(PAD => IN_INVOLTAGE_OK(2), Y => 
        \IN_INVOLTAGE_OK_c[2]\);
    
    \channels_desired_on_maj[7]\ : MAJ3
      port map(A => \channels_desired_on_0[7]\, B => 
        \channels_desired_on_tmr2[7]_net_1\, C => 
        \channels_desired_on_tmr3[7]_net_1\, Y => 
        \channels_desired_on[7]_net_1\);
    
    \sw2_sw5_channel_on_a_maj[6]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_a_0[6]\, B => 
        \sw2_sw5_channel_on_a_tmr2[6]_net_1\, C => 
        \sw2_sw5_channel_on_a_tmr3[6]_net_1\, Y => 
        \sw2_sw5_channel_on_a[6]_net_1\);
    
    \spi_rx_command_reg[1]\ : DFN0C0
      port map(D => \i_spi_rx_word_maj_RNIE3IV5[31]\, CLK => 
        i_spi_rx_strb, CLR => \master_rst_b\, Q => 
        \spi_rx_command_reg_0[1]\);
    
    \OUT_CHANNEL_IAUX_pad[2]\ : OUTBUF
      port map(D => \OUT_CHANNEL_IAUX_c[2]\, PAD => 
        OUT_CHANNEL_IAUX(2));
    
    SW5_DEFAULT_TURNON_BAR_pad : INBUF
      port map(PAD => SW5_DEFAULT_TURNON_BAR, Y => 
        \J11_DEBUG_c_c[5]\);
    
    \sw2_sw5_channel_on_a[8]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_22, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_a_0[8]\);
    
    \IN_INVOLTAGE_OK_pad[1]\ : INBUF
      port map(PAD => IN_INVOLTAGE_OK(1), Y => 
        \IN_INVOLTAGE_OK_c[1]\);
    
    \active_switch_constraints_maj[5]\ : MAJ3
      port map(A => \active_switch_constraints_0[5]\, B => 
        \active_switch_constraints_tmr2[5]_net_1\, C => 
        \active_switch_constraints_tmr3[5]_net_1\, Y => 
        \active_switch_constraints[5]_net_1\);
    
    \SW2_SW3_CHANNEL_ON_BAR_pad[6]\ : INBUF
      port map(PAD => SW2_SW3_CHANNEL_ON_BAR(6), Y => 
        \J11_DEBUG_c_c[3]\);
    
    \channels_desired_ready_tmr3[2]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNILBCJV[9]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr3[2]_net_1\);
    
    \sw2_sw5_channel_on_a_tmr2[2]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_16, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr2[2]_net_1\);
    
    \active_switch_constraints_maj[2]\ : MAJ3
      port map(A => \active_switch_constraints_0[2]\, B => 
        \active_switch_constraints_tmr2[2]_net_1\, C => 
        \active_switch_constraints_tmr3[2]_net_1\, Y => 
        \active_switch_constraints[2]_net_1\);
    
    \spi_rx_command_reg_tmr3[0]\ : DFN0C0
      port map(D => \i_spi_rx_word_maj_RNIC1IV5[30]\, CLK => 
        i_spi_rx_strb, CLR => \master_rst_b\, Q => 
        \spi_rx_command_reg_tmr3[0]_net_1\);
    
    \channels_desired_on_tmr3[3]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIPJ2FV[2]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr3[3]_net_1\);
    
    \sw2_sw5_channel_on_a[1]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_15, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_a_0[1]\);
    
    \active_switch_constraints_tmr2[7]\ : DFN1C0
      port map(D => \debounce.7.un46_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr2[7]_net_1\);
    
    \channels_desired_on_tmr3[6]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIG4N301[5]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr3[6]_net_1\);
    
    \channels_desired_on_maj[6]\ : MAJ3
      port map(A => \channels_desired_on_0[6]\, B => 
        \channels_desired_on_tmr2[6]_net_1\, C => 
        \channels_desired_on_tmr3[6]_net_1\, Y => 
        \channels_desired_on[6]_net_1\);
    
    \OUT_CHANNEL_VOSG_pad[6]\ : OUTBUF
      port map(D => \OUT_CHANNEL_VOSG_c[6]\, PAD => 
        OUT_CHANNEL_VOSG(6));
    
    \J11_DEBUG_pad[3]\ : OUTBUF
      port map(D => \J11_DEBUG_c_c[3]\, PAD => J11_DEBUG(3));
    
    \gen_channel_seqs.3.channel_seq\ : main_sequencer_new_3_0
      port map(channels_desired_on(6) => 
        \channels_desired_on[6]_net_1\, channels_desired_on(5)
         => \channels_desired_on[5]_net_1\, ch_out1(2) => 
        \gen_channel_seqs.3.channel_seq.ch_out1[2]\, ch_out1(1)
         => \gen_channel_seqs.3.channel_seq.ch_out1[1]\, 
        ch_mreg_en_0 => \ch_mreg_en[5]\, ch_iaux_en_0 => 
        \ch_iaux_en[5]\, OUT_CHANNEL_VOSG_c(6) => 
        \OUT_CHANNEL_VOSG_c[6]\, OUT_CHANNEL_VOSG_c(5) => 
        \OUT_CHANNEL_VOSG_c[5]\, SW4_SLAVE_PAIRS_BAR_c_0 => 
        \SW4_SLAVE_PAIRS_BAR_c[3]\, channels_ready(6) => 
        \channels_ready[6]\, channels_ready(5) => 
        \channels_ready[5]\, master_rst_b => \master_rst_b\, 
        clk_5m_gl => \clk_5m_gl\, N_85 => N_85, dtycyc_en => 
        \dtycyc_en\, N_79 => N_79);
    
    \sw2_sw5_channel_on_b_tmr2[5]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_27, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr2[5]_net_1\);
    
    \active_switch_constraints_tmr2[6]\ : DFN1C0
      port map(D => \debounce.6.un39_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr2[6]_net_1\);
    
    \channels_desired_ready_tmr3[1]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNITRC4V[8]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr3[1]_net_1\);
    
    clk_5m_gl : DFN1C0
      port map(D => \clk_5m_gl_maj_RNIOPBG1\, CLK => CLK40M_OSC_c, 
        CLR => \master_rst_b\, Q => clk_5m_gl_1);
    
    \sw2_sw5_channel_on_b[2]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_24, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_b_0[2]\);
    
    clk_5m_gl_tmr2 : DFN1C0
      port map(D => \clk_5m_gl_maj_RNIOPBG1\, CLK => CLK40M_OSC_c, 
        CLR => \master_rst_b\, Q => \clk_5m_gl_tmr2\);
    
    \channels_desired_on_tmr2[2]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIC7VH01[1]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr2[2]_net_1\);
    
    \sw2_sw5_channel_on_a_tmr2[4]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_18, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr2[4]_net_1\);
    
    \channels_desired_on_tmr2[6]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIG4N301[5]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr2[6]_net_1\);
    
    VCC_i : VCC
      port map(Y => \VCC\);
    
    \dtycyc_cnt_maj[3]\ : MAJ3
      port map(A => \dtycyc_cnt_0[3]\, B => 
        \dtycyc_cnt_tmr2[3]_net_1\, C => 
        \dtycyc_cnt_tmr3[3]_net_1\, Y => \dtycyc_cnt[3]_net_1\);
    
    \channels_desired_ready_tmr3[4]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIAP35V[11]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr3[4]_net_1\);
    
    \channels_desired_on_tmr3[1]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNICQ6MV[0]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr3[1]_net_1\);
    
    \OUT_CHANNEL_IAUX_pad[8]\ : OUTBUF
      port map(D => \OUT_CHANNEL_IAUX_c[8]\, PAD => 
        OUT_CHANNEL_IAUX(8));
    
    \sw2_sw5_channel_on_b_tmr2[1]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_23, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr2[1]_net_1\);
    
    bad_crc : DFN0C0
      port map(D => bad_crc_1_sqmuxa, CLK => i_spi_rx_strb, CLR
         => \master_rst_b\, Q => bad_crc_0);
    
    \sw2_sw5_channel_on_b_tmr3[1]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_23, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr3[1]_net_1\);
    
    \J11_DEBUG_pad[5]\ : OUTBUF
      port map(D => \J11_DEBUG_c_c[5]\, PAD => J11_DEBUG(5));
    
    \J11_DEBUG_pad[0]\ : OUTBUF
      port map(D => \J11_DEBUG_c_c[0]\, PAD => J11_DEBUG(0));
    
    \gen_channel_seqs.2.uvl_fuse\ : IIR_FILT_4_0
      port map(IN_INVOLTAGE_OK_c_0 => \IN_INVOLTAGE_OK_c[2]\, 
        ch_out1_0 => \gen_channel_seqs.2.channel_seq.ch_out1[2]\, 
        J11_DEBUG_c_c_0 => \J11_DEBUG_c_c[1]\, 
        OUT_CHANNEL_MREG_c_0 => \OUT_CHANNEL_MREG_c[4]\, 
        channel_involtage_ok(4) => \channel_involtage_ok[4]\, 
        channel_involtage_ok(3) => \channel_involtage_ok[3]\, 
        channel_involtage_ok(2) => \channel_involtage_ok[2]\, 
        channel_involtage_ok(1) => \channel_involtage_ok[1]\, 
        master_rst_b => \master_rst_b\, clk_5m_gl => \clk_5m_gl\, 
        N_152_mux => N_152_mux);
    
    \channels_desired_on_maj[4]\ : MAJ3
      port map(A => \channels_desired_on_0[4]\, B => 
        \channels_desired_on_tmr2[4]_net_1\, C => 
        \channels_desired_on_tmr3[4]_net_1\, Y => 
        \channels_desired_on[4]_net_1\);
    
    \channels_desired_ready[6]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIH045V[12]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_ready_0[6]\);
    
    dtycyc_en_tmr3 : DFN1C0
      port map(D => dtycyc_en_32, CLK => \clk_5m_gl\, CLR => 
        \master_rst_b\, Q => \dtycyc_en_tmr3\);
    
    \OUT_CHANNEL_MREG_pad[1]\ : OUTBUF
      port map(D => \OUT_CHANNEL_MREG_c[1]\, PAD => 
        OUT_CHANNEL_MREG(1));
    
    \sw2_sw5_channel_on_b_tmr3[3]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_25, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr3[3]_net_1\);
    
    sca_reset_out_pad : INBUF
      port map(PAD => sca_reset_out, Y => sca_reset_out_c);
    
    \OUT_CHANNEL_VOSG_pad[5]\ : OUTBUF
      port map(D => \OUT_CHANNEL_VOSG_c[5]\, PAD => 
        OUT_CHANNEL_VOSG(5));
    
    \sw2_sw5_channel_on_b_tmr3[4]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_26, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr3[4]_net_1\);
    
    \sw2_sw5_channel_on_b_maj[3]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_b_0[3]\, B => 
        \sw2_sw5_channel_on_b_tmr2[3]_net_1\, C => 
        \sw2_sw5_channel_on_b_tmr3[3]_net_1\, Y => 
        \sw2_sw5_channel_on_b[3]_net_1\);
    
    \refcnt_maj[0]\ : MAJ3
      port map(A => \refcnt_0[0]\, B => \refcnt_tmr2[0]_net_1\, C
         => \refcnt_tmr3[0]_net_1\, Y => \refcnt[0]_net_1\);
    
    \active_switch_constraints[4]\ : DFN1C0
      port map(D => \debounce.4.un25_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_0[4]\);
    
    \sw2_sw5_channel_on_a_tmr2[6]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_20, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr2[6]_net_1\);
    
    SW5_PIN4_UNUSED_pad : INBUF
      port map(PAD => SW5_PIN4_UNUSED, Y => SW5_PIN4_UNUSED_c);
    
    \dtycyc_cnt_maj[1]\ : MAJ3
      port map(A => \dtycyc_cnt_0[1]\, B => 
        \dtycyc_cnt_tmr2[1]_net_1\, C => 
        \dtycyc_cnt_tmr3[1]_net_1\, Y => \dtycyc_cnt[1]_net_1\);
    
    \OUT_CHANNEL_IAUX_pad[7]\ : OUTBUF
      port map(D => \OUT_CHANNEL_IAUX_c[7]\, PAD => 
        OUT_CHANNEL_IAUX(7));
    
    \OUT_CHANNEL_IAUX_pad[3]\ : OUTBUF
      port map(D => \OUT_CHANNEL_IAUX_c[3]\, PAD => 
        OUT_CHANNEL_IAUX(3));
    
    \channels_desired_ready_tmr3[3]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNI8J8TU[10]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr3[3]_net_1\);
    
    \sw2_sw5_channel_on_a_maj[5]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_a_0[5]\, B => 
        \sw2_sw5_channel_on_a_tmr2[5]_net_1\, C => 
        \sw2_sw5_channel_on_a_tmr3[5]_net_1\, Y => 
        \sw2_sw5_channel_on_a[5]_net_1\);
    
    spi_dutycycle_mode_tmr3 : DFN0C0
      port map(D => \i_spi_rx_word_maj_RNI4PT0V[20]\, CLK => 
        i_spi_rx_strb, CLR => \master_rst_b\, Q => 
        \spi_dutycycle_mode_tmr3\);
    
    \sw2_sw5_channel_on_b[1]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_23, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_b_0[1]\);
    
    \channels_desired_ready_maj[4]\ : MAJ3
      port map(A => \channels_desired_ready_0[4]\, B => 
        \channels_desired_ready_tmr2[4]_net_1\, C => 
        \channels_desired_ready_tmr3[4]_net_1\, Y => 
        \channels_desired_ready[4]_net_1\);
    
    \sw2_sw5_channel_on_b[4]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_26, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_b_0[4]\);
    
    \channels_desired_ready_tmr3[5]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNICN8TU[12]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr3[5]_net_1\);
    
    \channels_desired_ready_tmr3[8]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIO745V[15]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr3[8]_net_1\);
    
    \channels_desired_ready_maj[6]\ : MAJ3
      port map(A => \channels_desired_ready_0[6]\, B => 
        \channels_desired_ready_tmr2[6]_net_1\, C => 
        \channels_desired_ready_tmr3[6]_net_1\, Y => 
        \channels_desired_ready[6]_net_1\);
    
    \channels_desired_on_tmr2[4]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNI5PM301[3]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr2[4]_net_1\);
    
    \sw2_sw5_channel_on_b_maj[4]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_b_0[4]\, B => 
        \sw2_sw5_channel_on_b_tmr2[4]_net_1\, C => 
        \sw2_sw5_channel_on_b_tmr3[4]_net_1\, Y => 
        \sw2_sw5_channel_on_b[4]_net_1\);
    
    \channels_desired_ready[4]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIAP35V[11]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_ready_0[4]\);
    
    spi_timeout_maj : MAJ3
      port map(A => spi_timeout_0, B => \spi_timeout_tmr2\, C => 
        \spi_timeout_tmr3\, Y => \spi_timeout\);
    
    \refcnt_tmr3[0]\ : DFN1C0
      port map(D => \refcnt_i[0]\, CLK => CLK40M_OSC_c, CLR => 
        \master_rst_b\, Q => \refcnt_tmr3[0]_net_1\);
    
    \OUT_CHANNEL_VOSG_pad[4]\ : OUTBUF
      port map(D => \OUT_CHANNEL_VOSG_c[4]\, PAD => 
        OUT_CHANNEL_VOSG(4));
    
    CLK40M_OSC_pad : INBUF
      port map(PAD => CLK40M_OSC, Y => CLK40M_OSC_c);
    
    \active_switch_constraints[2]\ : DFN1C0
      port map(D => \debounce.2.un11_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_0[2]\);
    
    \SW4_SLAVE_PAIRS_BAR_pad[1]\ : INBUF
      port map(PAD => SW4_SLAVE_PAIRS_BAR(1), Y => 
        \J11_DEBUG_c_c[0]\);
    
    \SW2_SW3_CHANNEL_ON_BAR_pad[1]\ : INBUF
      port map(PAD => SW2_SW3_CHANNEL_ON_BAR(1), Y => 
        \J11_DEBUG_c_c[6]\);
    
    \OUT_CHANNEL_MREG_pad[2]\ : OUTBUF
      port map(D => \OUT_CHANNEL_MREG_c[2]\, PAD => 
        OUT_CHANNEL_MREG(2));
    
    \OUT_CHANNEL_IAUX_pad[4]\ : OUTBUF
      port map(D => \OUT_CHANNEL_IAUX_c[4]\, PAD => 
        OUT_CHANNEL_IAUX(4));
    
    \channels_desired_on_tmr2[5]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIVP2FV[4]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr2[5]_net_1\);
    
    \channels_desired_on[5]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIVP2FV[4]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_on_0[5]\);
    
    \refcnt[0]\ : DFN1C0
      port map(D => \refcnt_i[0]\, CLK => CLK40M_OSC_c, CLR => 
        \master_rst_b\, Q => \refcnt_0[0]\);
    
    \dtycyc_cnt[1]\ : DFN1P0
      port map(D => dtycyc_cnt_37, CLK => \clk_5m_gl\, PRE => 
        \master_rst_b\, Q => \dtycyc_cnt_0[1]\);
    
    \channels_desired_on_maj[2]\ : MAJ3
      port map(A => \channels_desired_on_0[2]\, B => 
        \channels_desired_on_tmr2[2]_net_1\, C => 
        \channels_desired_on_tmr3[2]_net_1\, Y => 
        \channels_desired_on[2]_net_1\);
    
    \channels_desired_ready_maj[7]\ : MAJ3
      port map(A => \channels_desired_ready_0[7]\, B => 
        \channels_desired_ready_tmr2[7]_net_1\, C => 
        \channels_desired_ready_tmr3[7]_net_1\, Y => 
        \channels_desired_ready[7]_net_1\);
    
    \sw2_sw5_channel_on_a_maj[7]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_a_0[7]\, B => 
        \sw2_sw5_channel_on_a_tmr2[7]_net_1\, C => 
        \sw2_sw5_channel_on_a_tmr3[7]_net_1\, Y => 
        \sw2_sw5_channel_on_a[7]_net_1\);
    
    \sw2_sw5_channel_on_a[2]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_16, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_a_0[2]\);
    
    clk_5m_gl_maj_RNIOPBG1 : MX2B
      port map(A => clk_5m_gl_0, B => \clk_5m_gl\, S => 
        \gen_5m_clk.n_refcnt8\, Y => \clk_5m_gl_maj_RNIOPBG1\);
    
    \OUT_CHANNEL_MREG_pad[8]\ : OUTBUF
      port map(D => \OUT_CHANNEL_MREG_c[8]\, PAD => 
        OUT_CHANNEL_MREG(8));
    
    \gen_channel_seqs.4.channel_seq\ : main_sequencer_new_3_2
      port map(ch_iaux_en_0 => \ch_iaux_en[7]\, 
        channels_desired_on(8) => \channels_desired_on[8]_net_1\, 
        channels_desired_on(7) => \channels_desired_on[7]_net_1\, 
        ch_out1(2) => \gen_channel_seqs.4.channel_seq.ch_out1[2]\, 
        ch_out1(1) => \gen_channel_seqs.4.channel_seq.ch_out1[1]\, 
        ch_mreg_en_0 => \ch_mreg_en[7]\, OUT_CHANNEL_VOSG_c(8)
         => \OUT_CHANNEL_VOSG_c[8]\, OUT_CHANNEL_VOSG_c(7) => 
        \OUT_CHANNEL_VOSG_c[7]\, SW4_SLAVE_PAIRS_BAR_c_0 => 
        \SW4_SLAVE_PAIRS_BAR_c[4]\, channels_ready(8) => 
        \channels_ready[8]\, channels_ready(7) => 
        \channels_ready[7]\, master_rst_b => \master_rst_b\, 
        clk_5m_gl => \clk_5m_gl\, N_73 => N_73, dtycyc_en => 
        \dtycyc_en\, N_68 => N_68);
    
    \OUT_CHANNEL_VOSG_pad[8]\ : OUTBUF
      port map(D => \OUT_CHANNEL_VOSG_c[8]\, PAD => 
        OUT_CHANNEL_VOSG(8));
    
    \sw2_sw5_channel_on_a_tmr2[7]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_21, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr2[7]_net_1\);
    
    STATUS_LED_pad : OUTBUF
      port map(D => STATUS_LED_c, PAD => STATUS_LED);
    
    \refcnt_tmr2[0]\ : DFN1C0
      port map(D => \refcnt_i[0]\, CLK => CLK40M_OSC_c, CLR => 
        \master_rst_b\, Q => \refcnt_tmr2[0]_net_1\);
    
    \channels_desired_on_tmr3[5]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIVP2FV[4]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr3[5]_net_1\);
    
    master_rst_b_tmr3 : DFN1C0
      port map(D => \del0_dev_rst_b\, CLK => CLK40M_OSC_c, CLR
         => IN_POWERON_RST_B_c, Q => \master_rst_b_tmr3\);
    
    \active_switch_constraints[5]\ : DFN1C0
      port map(D => \debounce.5.un32_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_0[5]\);
    
    \sw2_sw5_channel_on_a_tmr3[2]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_16, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr3[2]_net_1\);
    
    un1_n_refcnt_1_SUM1 : XOR2
      port map(A => \refcnt[0]_net_1\, B => \refcnt[1]_net_1\, Y
         => SUM1);
    
    \sw2_sw5_channel_on_b_tmr2[8]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_30, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr2[8]_net_1\);
    
    \channels_desired_ready[2]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNILBCJV[9]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_ready_0[2]\);
    
    \sw2_sw5_channel_on_a_tmr3[8]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_22, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr3[8]_net_1\);
    
    \channels_desired_on_tmr3[8]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIRFN301[15]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr3[8]_net_1\);
    
    \sw2_sw5_channel_on_b[5]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_27, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_b_0[5]\);
    
    \channels_desired_ready_maj[1]\ : MAJ3
      port map(A => \channels_desired_ready_0[1]\, B => 
        \channels_desired_ready_tmr2[1]_net_1\, C => 
        \channels_desired_ready_tmr3[1]_net_1\, Y => 
        \channels_desired_ready[1]_net_1\);
    
    \sw2_sw5_channel_on_b_tmr2[3]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_25, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr2[3]_net_1\);
    
    \SW4_SLAVE_PAIRS_BAR_pad[4]\ : INBUF
      port map(PAD => SW4_SLAVE_PAIRS_BAR(4), Y => 
        \SW4_SLAVE_PAIRS_BAR_c[4]\);
    
    \channels_desired_ready_tmr2[3]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNI8J8TU[10]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr2[3]_net_1\);
    
    \channels_desired_on_maj[3]\ : MAJ3
      port map(A => \channels_desired_on_0[3]\, B => 
        \channels_desired_on_tmr2[3]_net_1\, C => 
        \channels_desired_on_tmr3[3]_net_1\, Y => 
        \channels_desired_on[3]_net_1\);
    
    \sw2_sw5_channel_on_b_tmr3[5]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_27, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr3[5]_net_1\);
    
    \active_switch_constraints_maj[7]\ : MAJ3
      port map(A => \active_switch_constraints_0[7]\, B => 
        \active_switch_constraints_tmr2[7]_net_1\, C => 
        \active_switch_constraints_tmr3[7]_net_1\, Y => 
        \active_switch_constraints[7]_net_1\);
    
    \SW4_SLAVE_PAIRS_BAR_pad[2]\ : INBUF
      port map(PAD => SW4_SLAVE_PAIRS_BAR(2), Y => 
        \J11_DEBUG_c_c[1]\);
    
    \sw2_sw5_channel_on_b_maj[7]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_b_0[7]\, B => 
        \sw2_sw5_channel_on_b_tmr2[7]_net_1\, C => 
        \sw2_sw5_channel_on_b_tmr3[7]_net_1\, Y => 
        \sw2_sw5_channel_on_b[7]_net_1\);
    
    \channels_desired_on_tmr3[7]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNI503FV[6]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr3[7]_net_1\);
    
    \channels_desired_on_maj[8]\ : MAJ3
      port map(A => \channels_desired_on_0[8]\, B => 
        \channels_desired_on_tmr2[8]_net_1\, C => 
        \channels_desired_on_tmr3[8]_net_1\, Y => 
        \channels_desired_on[8]_net_1\);
    
    \active_switch_constraints_maj[6]\ : MAJ3
      port map(A => \active_switch_constraints_0[6]\, B => 
        \active_switch_constraints_tmr2[6]_net_1\, C => 
        \active_switch_constraints_tmr3[6]_net_1\, Y => 
        \active_switch_constraints[6]_net_1\);
    
    \channels_desired_on_tmr2[3]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIPJ2FV[2]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr2[3]_net_1\);
    
    \sw2_sw5_channel_on_a_maj[2]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_a_0[2]\, B => 
        \sw2_sw5_channel_on_a_tmr2[2]_net_1\, C => 
        \sw2_sw5_channel_on_a_tmr3[2]_net_1\, Y => 
        \sw2_sw5_channel_on_a[2]_net_1\);
    
    \spi_rx_command_reg_maj[1]\ : MAJ3
      port map(A => \spi_rx_command_reg_0[1]\, B => 
        \spi_rx_command_reg_tmr2[1]_net_1\, C => 
        \spi_rx_command_reg_tmr3[1]_net_1\, Y => 
        \spi_rx_command_reg[1]_net_1\);
    
    \channels_desired_on[2]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIC7VH01[1]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_on_0[2]\);
    
    \refcnt_maj_RNI3RSS[1]\ : NOR2B
      port map(A => \refcnt[0]_net_1\, B => \refcnt[1]_net_1\, Y
         => \gen_5m_clk.n_refcnt8\);
    
    \channels_desired_ready[7]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIGR8TU[14]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_ready_0[7]\);
    
    \sw2_sw5_channel_on_a[5]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_19, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_a_0[5]\);
    
    \active_switch_constraints_tmr3[5]\ : DFN1C0
      port map(D => \debounce.5.un32_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr3[5]_net_1\);
    
    \active_switch_constraints_tmr3[1]\ : DFN1C0
      port map(D => \debounce.1.un4_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr3[1]_net_1\);
    
    \sw2_sw5_channel_on_a[3]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_17, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_a_0[3]\);
    
    \sw2_sw5_channel_on_a_tmr2[5]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_19, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr2[5]_net_1\);
    
    \channels_desired_on[6]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIG4N301[5]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_on_0[6]\);
    
    bad_crc_tmr2 : DFN0C0
      port map(D => bad_crc_1_sqmuxa, CLK => i_spi_rx_strb, CLR
         => \master_rst_b\, Q => \bad_crc_tmr2\);
    
    \active_switch_constraints_tmr2[4]\ : DFN1C0
      port map(D => \debounce.4.un25_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr2[4]_net_1\);
    
    \sw2_sw5_channel_on_a_maj[1]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_a_0[1]\, B => 
        \sw2_sw5_channel_on_a_tmr2[1]_net_1\, C => 
        \sw2_sw5_channel_on_a_tmr3[1]_net_1\, Y => 
        \sw2_sw5_channel_on_a[1]_net_1\);
    
    \spi_rx_command_reg_tmr3[1]\ : DFN0C0
      port map(D => \i_spi_rx_word_maj_RNIE3IV5[31]\, CLK => 
        i_spi_rx_strb, CLR => \master_rst_b\, Q => 
        \spi_rx_command_reg_tmr3[1]_net_1\);
    
    \sw2_sw5_channel_on_b_maj[8]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_b_0[8]\, B => 
        \sw2_sw5_channel_on_b_tmr2[8]_net_1\, C => 
        \sw2_sw5_channel_on_b_tmr3[8]_net_1\, Y => 
        \sw2_sw5_channel_on_b[8]_net_1\);
    
    \dtycyc_cnt_maj[4]\ : MAJ3
      port map(A => \dtycyc_cnt_0[4]\, B => 
        \dtycyc_cnt_tmr2[4]_net_1\, C => 
        \dtycyc_cnt_tmr3[4]_net_1\, Y => \dtycyc_cnt[4]_net_1\);
    
    SW5_DUTYCYCLE_MODE_BAR_pad : INBUF
      port map(PAD => SW5_DUTYCYCLE_MODE_BAR, Y => 
        \J11_DEBUG_c_c[4]\);
    
    \channels_desired_ready_tmr2[6]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIH045V[12]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr2[6]_net_1\);
    
    \sw2_sw5_channel_on_b_maj[6]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_b_0[6]\, B => 
        \sw2_sw5_channel_on_b_tmr2[6]_net_1\, C => 
        \sw2_sw5_channel_on_b_tmr3[6]_net_1\, Y => 
        \sw2_sw5_channel_on_b[6]_net_1\);
    
    spi_timeout_tmr3 : DFN0C0
      port map(D => spi_timeout_pulse_i_1, CLK => i_spi_rx_strb, 
        CLR => \master_rst_b\, Q => \spi_timeout_tmr3\);
    
    \dtycyc_cnt[3]\ : DFN1C0
      port map(D => dtycyc_cnt_35, CLK => \clk_5m_gl\, CLR => 
        \master_rst_b\, Q => \dtycyc_cnt_0[3]\);
    
    \channels_desired_ready[1]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNITRC4V[8]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_ready_0[1]\);
    
    \active_switch_constraints_maj[4]\ : MAJ3
      port map(A => \active_switch_constraints_0[4]\, B => 
        \active_switch_constraints_tmr2[4]_net_1\, C => 
        \active_switch_constraints_tmr3[4]_net_1\, Y => 
        \active_switch_constraints[4]_net_1\);
    
    \sw2_sw5_channel_on_b_maj[2]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_b_0[2]\, B => 
        \sw2_sw5_channel_on_b_tmr2[2]_net_1\, C => 
        \sw2_sw5_channel_on_b_tmr3[2]_net_1\, Y => 
        \sw2_sw5_channel_on_b[2]_net_1\);
    
    master_rst_b_maj : MAJ3
      port map(A => master_rst_b_1, B => \master_rst_b_tmr2\, C
         => \master_rst_b_tmr3\, Y => master_rst_b_0);
    
    \sw2_sw5_channel_on_a[7]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_21, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_a_0[7]\);
    
    \gen_channel_seqs.1.uvl_fuse\ : IIR_FILT_4
      port map(IN_INVOLTAGE_OK_c_0 => \IN_INVOLTAGE_OK_c[1]\, 
        channel_involtage_ok_0 => \channel_involtage_ok[1]\, 
        master_rst_b => \master_rst_b\, clk_5m_gl => \clk_5m_gl\);
    
    bad_crc_tmr3 : DFN0C0
      port map(D => bad_crc_1_sqmuxa, CLK => i_spi_rx_strb, CLR
         => \master_rst_b\, Q => \bad_crc_tmr3\);
    
    \OUT_CHANNEL_MREG_pad[5]\ : OUTBUF
      port map(D => \OUT_CHANNEL_MREG_c[5]\, PAD => 
        OUT_CHANNEL_MREG(5));
    
    \sw2_sw5_channel_on_a_tmr2[1]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_15, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr2[1]_net_1\);
    
    \sw2_sw5_channel_on_a_tmr3[1]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_15, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr3[1]_net_1\);
    
    \refcnt_maj_RNI1DEE[0]\ : INV
      port map(A => \refcnt[0]_net_1\, Y => \refcnt_i[0]\);
    
    \active_switch_constraints_tmr3[2]\ : DFN1C0
      port map(D => \debounce.2.un11_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr3[2]_net_1\);
    
    \active_switch_constraints_tmr3[8]\ : DFN1C0
      port map(D => \debounce.8.un53_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr3[8]_net_1\);
    
    master_rst_b : DFN1C0
      port map(D => \del0_dev_rst_b\, CLK => CLK40M_OSC_c, CLR
         => IN_POWERON_RST_B_c, Q => master_rst_b_1);
    
    \sw2_sw5_channel_on_a_tmr3[3]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_17, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr3[3]_net_1\);
    
    \J11_DEBUG_pad[6]\ : OUTBUF
      port map(D => \J11_DEBUG_c_c[6]\, PAD => J11_DEBUG(6));
    
    \sw2_sw5_channel_on_b_maj[1]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_b_0[1]\, B => 
        \sw2_sw5_channel_on_b_tmr2[1]_net_1\, C => 
        \sw2_sw5_channel_on_b_tmr3[1]_net_1\, Y => 
        \sw2_sw5_channel_on_b[1]_net_1\);
    
    \sw2_sw5_channel_on_a_tmr3[4]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_18, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr3[4]_net_1\);
    
    \spi_rx_command_reg_tmr2[1]\ : DFN0C0
      port map(D => \i_spi_rx_word_maj_RNIE3IV5[31]\, CLK => 
        i_spi_rx_strb, CLR => \master_rst_b\, Q => 
        \spi_rx_command_reg_tmr2[1]_net_1\);
    
    tx_prompt : SLOW_PULSE_EN_GEN
      port map(N_210_i => N_210_i, master_rst_b => \master_rst_b\, 
        clk_5m_gl => \clk_5m_gl\);
    
    \active_switch_constraints_tmr3[6]\ : DFN1C0
      port map(D => \debounce.6.un39_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr3[6]_net_1\);
    
    \channels_desired_on_maj[5]\ : MAJ3
      port map(A => \channels_desired_on_0[5]\, B => 
        \channels_desired_on_tmr2[5]_net_1\, C => 
        \channels_desired_on_tmr3[5]_net_1\, Y => 
        \channels_desired_on[5]_net_1\);
    
    \sw2_sw5_channel_on_b_tmr3[7]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_29, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr3[7]_net_1\);
    
    \sw2_sw5_channel_on_b_tmr3[6]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_28, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr3[6]_net_1\);
    
    dtycyc_en_tmr2 : DFN1C0
      port map(D => dtycyc_en_32, CLK => \clk_5m_gl\, CLR => 
        \master_rst_b\, Q => \dtycyc_en_tmr2\);
    
    \channels_desired_ready_tmr2[4]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIAP35V[11]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr2[4]_net_1\);
    
    \dtycyc_cnt_tmr3[0]\ : DFN1P0
      port map(D => dtycyc_cnt_38, CLK => \clk_5m_gl\, PRE => 
        \master_rst_b\, Q => \dtycyc_cnt_tmr3[0]_net_1\);
    
    \SW2_SW3_CHANNEL_ON_BAR_pad[8]\ : INBUF
      port map(PAD => SW2_SW3_CHANNEL_ON_BAR(8), Y => 
        \SW2_SW3_CHANNEL_ON_BAR_c[8]\);
    
    \channels_desired_ready[3]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNI8J8TU[10]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_ready_0[3]\);
    
    \active_switch_constraints_maj[3]\ : MAJ3
      port map(A => \active_switch_constraints_0[3]\, B => 
        \active_switch_constraints_tmr2[3]_net_1\, C => 
        \active_switch_constraints_tmr3[3]_net_1\, Y => 
        \active_switch_constraints[3]_net_1\);
    
    \sw2_sw5_channel_on_b[6]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_28, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_b_0[6]\);
    
    master_rst_b_tmr2 : DFN1C0
      port map(D => \del0_dev_rst_b\, CLK => CLK40M_OSC_c, CLR
         => IN_POWERON_RST_B_c, Q => \master_rst_b_tmr2\);
    
    \refcnt[1]\ : DFN1C0
      port map(D => SUM1, CLK => CLK40M_OSC_c, CLR => 
        \master_rst_b\, Q => \refcnt_0[1]\);
    
    \channels_desired_on_maj[1]\ : MAJ3
      port map(A => \channels_desired_on_0[1]\, B => 
        \channels_desired_on_tmr2[1]_net_1\, C => 
        \channels_desired_on_tmr3[1]_net_1\, Y => 
        \channels_desired_on[1]_net_1\);
    
    \channels_desired_on[8]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIRFN301[15]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_on_0[8]\);
    
    dtycyc_en : DFN1C0
      port map(D => dtycyc_en_32, CLK => \clk_5m_gl\, CLR => 
        \master_rst_b\, Q => dtycyc_en_0);
    
    \dtycyc_cnt_tmr3[2]\ : DFN1C0
      port map(D => dtycyc_cnt_36, CLK => \clk_5m_gl\, CLR => 
        \master_rst_b\, Q => \dtycyc_cnt_tmr3[2]_net_1\);
    
    \refcnt_tmr3[1]\ : DFN1C0
      port map(D => SUM1, CLK => CLK40M_OSC_c, CLR => 
        \master_rst_b\, Q => \refcnt_tmr3[1]_net_1\);
    
    \OUT_CHANNEL_MREG_pad[7]\ : OUTBUF
      port map(D => \OUT_CHANNEL_MREG_c[7]\, PAD => 
        OUT_CHANNEL_MREG(7));
    
    \OUT_CHANNEL_IAUX_pad[5]\ : OUTBUF
      port map(D => \OUT_CHANNEL_IAUX_c[5]\, PAD => 
        OUT_CHANNEL_IAUX(5));
    
    \IN_INVOLTAGE_OK_pad[3]\ : INBUF
      port map(PAD => IN_INVOLTAGE_OK(3), Y => 
        \IN_INVOLTAGE_OK_c[3]\);
    
    \channels_desired_ready_maj[8]\ : MAJ3
      port map(A => \channels_desired_ready_0[8]\, B => 
        \channels_desired_ready_tmr2[8]_net_1\, C => 
        \channels_desired_ready_tmr3[8]_net_1\, Y => 
        \channels_desired_ready[8]_net_1\);
    
    \active_switch_constraints_tmr3[4]\ : DFN1C0
      port map(D => \debounce.4.un25_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr3[4]_net_1\);
    
    \active_switch_constraints_maj[1]\ : MAJ3
      port map(A => \active_switch_constraints_0[1]\, B => 
        \active_switch_constraints_tmr2[1]_net_1\, C => 
        \active_switch_constraints_tmr3[1]_net_1\, Y => 
        \active_switch_constraints[1]_net_1\);
    
    \OUT_CHANNEL_MREG_pad[4]\ : OUTBUF
      port map(D => \OUT_CHANNEL_MREG_c[4]\, PAD => 
        OUT_CHANNEL_MREG(4));
    
    del0_dev_rst_b_tmr2 : DFN1C0
      port map(D => \VCC\, CLK => CLK40M_OSC_c, CLR => 
        IN_POWERON_RST_B_c, Q => \del0_dev_rst_b_tmr2\);
    
    \dtycyc_cnt_tmr3[3]\ : DFN1C0
      port map(D => dtycyc_cnt_35, CLK => \clk_5m_gl\, CLR => 
        \master_rst_b\, Q => \dtycyc_cnt_tmr3[3]_net_1\);
    
    \OUT_CHANNEL_IAUX_pad[6]\ : OUTBUF
      port map(D => \OUT_CHANNEL_IAUX_c[6]\, PAD => 
        OUT_CHANNEL_IAUX(6));
    
    \active_switch_constraints[8]\ : DFN1C0
      port map(D => \debounce.8.un53_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_0[8]\);
    
    bad_crc_maj : MAJ3
      port map(A => bad_crc_0, B => \bad_crc_tmr2\, C => 
        \bad_crc_tmr3\, Y => \bad_crc\);
    
    \dtycyc_cnt[0]\ : DFN1P0
      port map(D => dtycyc_cnt_38, CLK => \clk_5m_gl\, PRE => 
        \master_rst_b\, Q => \dtycyc_cnt_0[0]\);
    
    \active_switch_constraints[1]\ : DFN1C0
      port map(D => \debounce.1.un4_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_0[1]\);
    
    PWR_OK_LED_pad : OUTBUF
      port map(D => N_152_mux, PAD => PWR_OK_LED);
    
    \gen_channel_seqs.1.channel_seq\ : main_sequencer_new_3
      port map(OUT_CHANNEL_VOSG_c(2) => \OUT_CHANNEL_VOSG_c[2]\, 
        OUT_CHANNEL_VOSG_c(1) => \OUT_CHANNEL_VOSG_c[1]\, 
        channels_desired_on(2) => \channels_desired_on[2]_net_1\, 
        channels_desired_on(1) => \channels_desired_on[1]_net_1\, 
        total_channel_constraints_0 => 
        \total_channel_constraints[1]\, ch_out1(2) => 
        \gen_channel_seqs.1.channel_seq.ch_out1[2]\, ch_out1(1)
         => \gen_channel_seqs.1.channel_seq.ch_out1[1]\, 
        ch_mreg_en_0 => \ch_mreg_en[1]\, ch_iaux_en_0 => 
        \ch_iaux_en[1]\, J11_DEBUG_c_c_0 => \J11_DEBUG_c_c[0]\, 
        channels_ready(2) => \channels_ready[2]\, 
        channels_ready(1) => \channels_ready[1]\, master_rst_b
         => \master_rst_b\, clk_5m_gl => \clk_5m_gl\, dtycyc_en
         => \dtycyc_en\, N_7_0 => N_7_0);
    
    \channels_desired_ready[8]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIO745V[15]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_ready_0[8]\);
    
    clk_5m_gl_keep : CLKINT
      port map(A => clk_5m_gl_0, Y => \clk_5m_gl\);
    
    \sw2_sw5_channel_on_a_tmr2[8]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_22, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr2[8]_net_1\);
    
    spi_dutycycle_mode_maj : MAJ3
      port map(A => spi_dutycycle_mode_0, B => 
        \spi_dutycycle_mode_tmr2\, C => \spi_dutycycle_mode_tmr3\, 
        Y => \spi_dutycycle_mode\);
    
    \OUT_CHANNEL_VOSG_pad[7]\ : OUTBUF
      port map(D => \OUT_CHANNEL_VOSG_c[7]\, PAD => 
        OUT_CHANNEL_VOSG(7));
    
    \sw2_sw5_channel_on_a_tmr2[3]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_17, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr2[3]_net_1\);
    
    \channels_desired_ready_tmr3[6]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIH045V[12]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr3[6]_net_1\);
    
    \active_switch_constraints_tmr2[3]\ : DFN1C0
      port map(D => \debounce.3.un18_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr2[3]_net_1\);
    
    \sw2_sw5_channel_on_a[6]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_20, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_a_0[6]\);
    
    \channels_desired_on_tmr2[8]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIRFN301[15]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr2[8]_net_1\);
    
    \spi_rx_command_reg_maj[0]\ : MAJ3
      port map(A => \spi_rx_command_reg_0[0]\, B => 
        \spi_rx_command_reg_tmr2[0]_net_1\, C => 
        \spi_rx_command_reg_tmr3[0]_net_1\, Y => 
        \spi_rx_command_reg[0]_net_1\);
    
    \channels_desired_ready_maj[5]\ : MAJ3
      port map(A => \channels_desired_ready_0[5]\, B => 
        \channels_desired_ready_tmr2[5]_net_1\, C => 
        \channels_desired_ready_tmr3[5]_net_1\, Y => 
        \channels_desired_ready[5]_net_1\);
    
    sca_dat_in_pad : OUTBUF
      port map(D => sca_dat_in_c, PAD => sca_dat_in);
    
    \channels_desired_ready_tmr2[8]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIO745V[15]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr2[8]_net_1\);
    
    dtycyc_en_maj : MAJ3
      port map(A => dtycyc_en_0, B => \dtycyc_en_tmr2\, C => 
        \dtycyc_en_tmr3\, Y => \dtycyc_en\);
    
    master_rst_b_maj_RNISMD4 : CLKINT
      port map(A => master_rst_b_0, Y => \master_rst_b\);
    
    \OUT_CHANNEL_VOSG_pad[3]\ : OUTBUF
      port map(D => \OUT_CHANNEL_VOSG_c[3]\, PAD => 
        OUT_CHANNEL_VOSG(3));
    
    \sw2_sw5_channel_on_a_tmr3[5]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_a_19, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_a_tmr3[5]_net_1\);
    
    spi_dutycycle_mode : DFN0C0
      port map(D => \i_spi_rx_word_maj_RNI4PT0V[20]\, CLK => 
        i_spi_rx_strb, CLR => \master_rst_b\, Q => 
        spi_dutycycle_mode_0);
    
    \channels_desired_ready_tmr2[2]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNILBCJV[9]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr2[2]_net_1\);
    
    \channels_desired_on[7]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNI503FV[6]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_on_0[7]\);
    
    \sw2_sw5_channel_on_b_tmr2[2]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_24, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => 
        \sw2_sw5_channel_on_b_tmr2[2]_net_1\);
    
    \sw2_sw5_channel_on_b_maj[5]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_b_0[5]\, B => 
        \sw2_sw5_channel_on_b_tmr2[5]_net_1\, C => 
        \sw2_sw5_channel_on_b_tmr3[5]_net_1\, Y => 
        \sw2_sw5_channel_on_b[5]_net_1\);
    
    ovt_fs : IIR_FILT_4_3
      port map(spi_tx_word_0 => \spi_tx_word[8]\, 
        active_switch_constraints_0 => 
        \active_switch_constraints[1]_net_1\, 
        channel_involtage_ok_0 => \channel_involtage_ok[1]\, 
        channels_desired_ready_0 => 
        \channels_desired_ready[1]_net_1\, master_rst_b => 
        \master_rst_b\, clk_5m_gl => \clk_5m_gl\, IN_TEMP_OK_c
         => IN_TEMP_OK_c, N_63 => N_63, STATUS_LED_c => 
        STATUS_LED_c);
    
    \channels_desired_ready_tmr2[1]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNITRC4V[8]\, CLK => 
        i_spi_rx_strb, PRE => un1_master_rst_b_1_0, CLR => 
        un1_sw5_default_turnon_bar_1_0, Q => 
        \channels_desired_ready_tmr2[1]_net_1\);
    
    \active_switch_constraints_tmr3[3]\ : DFN1C0
      port map(D => \debounce.3.un18_sw2_sw3_channel_on_bar\, CLK
         => \clk_5m_gl\, CLR => \master_rst_b\, Q => 
        \active_switch_constraints_tmr3[3]_net_1\);
    
    rxcrc_pm : crc6_0
      port map(spi_rx_word_9 => \spi_rx_word[9]\, spi_rx_word_16
         => \spi_rx_word[16]\, spi_rx_word_11 => 
        \spi_rx_word[11]\, spi_rx_word_10 => \spi_rx_word[10]\, 
        spi_rx_word_12 => \spi_rx_word[12]\, spi_rx_word_18 => 
        \spi_rx_word[18]\, spi_rx_word_30 => \spi_rx_word[30]\, 
        spi_rx_word_0 => \spi_rx_word[0]\, spi_rx_word_5 => 
        \spi_rx_word[5]\, spi_rx_word_2 => \spi_rx_word[2]\, 
        spi_rx_word_4 => \spi_rx_word[4]\, spi_rx_word_7 => 
        \spi_rx_word[7]\, spi_rx_word_3 => \spi_rx_word[3]\, 
        spi_rx_word_6 => \spi_rx_word[6]\, spi_rx_word_15 => 
        \spi_rx_word[15]\, spi_rx_word_8 => \spi_rx_word[8]\, 
        N_34 => \rxcrc_pm.N_34\, N_33 => \rxcrc_pm.N_33\, N_32
         => \rxcrc_pm.N_32\, N_31 => \rxcrc_pm.N_31\, N_30 => 
        \rxcrc_pm.N_30\, N_29 => \rxcrc_pm.N_29\, N_26 => 
        \rxcrc_pm.N_26\);
    
    \channels_desired_ready[5]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNICN8TU[12]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_ready_0[5]\);
    
    \dtycyc_cnt_tmr2[0]\ : DFN1P0
      port map(D => dtycyc_cnt_38, CLK => \clk_5m_gl\, PRE => 
        \master_rst_b\, Q => \dtycyc_cnt_tmr2[0]_net_1\);
    
    IN_POWERON_RST_B_pad : INBUF
      port map(PAD => IN_POWERON_RST_B, Y => IN_POWERON_RST_B_c);
    
    \channels_desired_on_tmr2[1]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNICQ6MV[0]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr2[1]_net_1\);
    
    \J11_DEBUG_pad[4]\ : OUTBUF
      port map(D => \J11_DEBUG_c_c[4]\, PAD => J11_DEBUG(4));
    
    \dtycyc_cnt_tmr2[1]\ : DFN1P0
      port map(D => dtycyc_cnt_37, CLK => \clk_5m_gl\, PRE => 
        \master_rst_b\, Q => \dtycyc_cnt_tmr2[1]_net_1\);
    
    \sw2_sw5_channel_on_b[8]\ : DFN1C0
      port map(D => sw2_sw5_channel_on_b_30, CLK => \clk_5m_gl\, 
        CLR => \master_rst_b\, Q => \sw2_sw5_channel_on_b_0[8]\);
    
    \sw2_sw5_channel_on_a_maj[4]\ : MAJ3
      port map(A => \sw2_sw5_channel_on_a_0[4]\, B => 
        \sw2_sw5_channel_on_a_tmr2[4]_net_1\, C => 
        \sw2_sw5_channel_on_a_tmr3[4]_net_1\, Y => 
        \sw2_sw5_channel_on_a[4]_net_1\);
    
    \channels_desired_on_tmr3[2]\ : DFN0P1C1
      port map(D => \i_spi_rx_word_maj_RNIC7VH01[1]\, CLK => 
        i_spi_rx_strb, PRE => m32_0, CLR => m31, Q => 
        \channels_desired_on_tmr3[2]_net_1\);
    

end DEF_ARCH; 