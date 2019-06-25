-- Version: v11.9 SP2 11.9.2.1
-- File used only for Simulation

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

  component DFN1P0
    port( D   : in    std_logic := 'U';
          CLK : in    std_logic := 'U';
          PRE : in    std_logic := 'U';
          Q   : out   std_logic
        );
  end component;

  component AND2
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

  component OR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component IOPAD_TRI
    port( D   : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          PAD : out   std_logic
        );
  end component;

  component AX1C
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

  component XNOR3
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

  component OR2
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

  component XA1A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component IOPAD_IN
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component IOTRI_OB_EB
    port( D    : in    std_logic := 'U';
          E    : in    std_logic := 'U';
          DOUT : out   std_logic;
          EOUT : out   std_logic
        );
  end component;

  component XA1B
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

  component AX1D
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component IOIN_IB
    port( YIN : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component NOR2
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

  component OR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
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

  component OR2A
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

  component AO13
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

  component MX2A
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

  component AXO6
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

  component OAI1
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

  component MIN3X
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component INV
    port( A : in    std_logic := 'U';
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

  component CLKINT
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component CLKIO
    port( A : in    std_logic := 'U';
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

  component MX2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          S : in    std_logic := 'U';
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

  component OR2B
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

  component GND
    port(Y : out std_logic); 
  end component;

  component VCC
    port(Y : out std_logic); 
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
        MAN_EN_CH_8TO5_c, STDBY_OFFB_c, POR_OUT_TO_SCA_c, 
        PWR_OK_LED_c, BUF5M_J11_15_TCONN_c, 
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
        \REFCNT_i[0]\, STATUS_LED_c_0, \UVL_78FUSE/N_23_i\, 
        \UVL_78FUSE/FILT_OUT[6]_net_1\, 
        \UVL_78FUSE/FILT_OUT[7]_net_1\, \UVL_78FUSE/i10_mux\, 
        \UVL_78FUSE/i2_mux\, \UVL_78FUSE/FILT_OUT[2]_net_1\, 
        \UVL_78FUSE/FILT_OUT[0]_net_1\, 
        \UVL_78FUSE/FILT_OUT[1]_net_1\, \UVL_78FUSE/i4_mux\, 
        \UVL_78FUSE/FILT_OUT[3]_net_1\, \UVL_78FUSE/i6_mux\, 
        \UVL_78FUSE/FILT_OUT[4]_net_1\, \UVL_78FUSE/i8_mux\, 
        \UVL_78FUSE/FILT_OUT[5]_net_1\, 
        \UVL_78FUSE/FILT_OUT_maj_RNIL726C[7]_net_1\, 
        \UVL_78FUSE/i12_mux\, \UVL_78FUSE/N89\, 
        \UVL_78FUSE/FILT_OUT_maj_RNIL726C_0[7]_net_1\, 
        \UVL_78FUSE/SUM_IN_A[5]_net_1\, \UVL_78FUSE/N92\, 
        \UVL_78FUSE/n_sigout15lto7_2\, 
        \UVL_78FUSE/n_sigout15lto7_1\, 
        \UVL_78FUSE/n_sigout3lto6_1\, 
        \UVL_78FUSE/n_sigout3lto6_0\, \UVL_78FUSE/N_33_i\, 
        \UVL_78FUSE/N_31_i\, \UVL_78FUSE/N_29_i\, 
        \UVL_78FUSE/N_27_i\, 
        \UVL_78FUSE/SIGOUT_maj_RNI96K25_net_1\, \UVL_78FUSE/N_94\, 
        \UVL_78FUSE/N_93\, \UVL_78FUSE/n_sigout3\, 
        \UVL_78FUSE/THRESH_VAL[1]_net_1\, \UVL_78FUSE/N_95\, 
        \UVL_78FUSE/THRESH_VAL[0]_net_1\, \UVL_78FUSE/N_113\, 
        \UVL_78FUSE/THRESH_VAL_ns[0]\, 
        \UVL_78FUSE/THRESH_VAL_maj_RNICCI93[1]_net_1\, 
        \UVL_78FUSE/N_40\, \UVL_78FUSE/SUM_IN_A[4]_net_1\, 
        \UVL_78FUSE/un2_n_filt_out0[28]\, 
        \UVL_78FUSE/ADD_4x4_fast_I6_Y_3\, 
        \UVL_78FUSE/SIG_IN_DEL_maj_RNI48TK[0]_net_1\, 
        \UVL_78FUSE/SIG_IN_DEL[0]_net_1\, 
        \UVL_78FUSE/SIG_IN_DEL_maj_RNI48TK_0[0]_net_1\, 
        \UVL_78FUSE/FILT_OUT_0[7]\, 
        \UVL_78FUSE/FILT_OUT_tmr2[7]_net_1\, 
        \UVL_78FUSE/FILT_OUT_tmr3[7]_net_1\, 
        \UVL_78FUSE/FILT_OUT_0[6]\, 
        \UVL_78FUSE/FILT_OUT_tmr2[6]_net_1\, 
        \UVL_78FUSE/FILT_OUT_tmr3[6]_net_1\, 
        \UVL_78FUSE/FILT_OUT_0[5]\, 
        \UVL_78FUSE/FILT_OUT_tmr2[5]_net_1\, 
        \UVL_78FUSE/FILT_OUT_tmr3[5]_net_1\, 
        \UVL_78FUSE/FILT_OUT_0[4]\, 
        \UVL_78FUSE/FILT_OUT_tmr2[4]_net_1\, 
        \UVL_78FUSE/FILT_OUT_tmr3[4]_net_1\, 
        \UVL_78FUSE/FILT_OUT_0[3]\, 
        \UVL_78FUSE/FILT_OUT_tmr2[3]_net_1\, 
        \UVL_78FUSE/FILT_OUT_tmr3[3]_net_1\, 
        \UVL_78FUSE/FILT_OUT_0[2]\, 
        \UVL_78FUSE/FILT_OUT_tmr2[2]_net_1\, 
        \UVL_78FUSE/FILT_OUT_tmr3[2]_net_1\, 
        \UVL_78FUSE/FILT_OUT_0[1]\, 
        \UVL_78FUSE/FILT_OUT_tmr2[1]_net_1\, 
        \UVL_78FUSE/FILT_OUT_tmr3[1]_net_1\, 
        \UVL_78FUSE/FILT_OUT_0[0]\, 
        \UVL_78FUSE/FILT_OUT_tmr2[0]_net_1\, 
        \UVL_78FUSE/FILT_OUT_tmr3[0]_net_1\, 
        \UVL_78FUSE/SUM_IN_A_0[5]\, 
        \UVL_78FUSE/SUM_IN_A_tmr2[5]_net_1\, 
        \UVL_78FUSE/SUM_IN_A_tmr3[5]_net_1\, 
        \UVL_78FUSE/SUM_IN_A_0[4]\, 
        \UVL_78FUSE/SUM_IN_A_tmr2[4]_net_1\, 
        \UVL_78FUSE/SUM_IN_A_tmr3[4]_net_1\, 
        \UVL_78FUSE/THRESH_VAL_0[1]\, 
        \UVL_78FUSE/THRESH_VAL_tmr2[1]_net_1\, 
        \UVL_78FUSE/THRESH_VAL_tmr3[1]_net_1\, 
        \UVL_78FUSE/THRESH_VAL_0[0]\, 
        \UVL_78FUSE/THRESH_VAL_tmr2[0]_net_1\, 
        \UVL_78FUSE/THRESH_VAL_tmr3[0]_net_1\, 
        \UVL_78FUSE/SIGOUT_net_1\, \UVL_78FUSE/SIGOUT_tmr2_net_1\, 
        \UVL_78FUSE/SIGOUT_tmr3_net_1\, 
        \UVL_78FUSE/SIG_IN_DEL_0[0]\, 
        \UVL_78FUSE/SIG_IN_DEL_tmr2[0]_net_1\, 
        \UVL_78FUSE/SIG_IN_DEL_tmr3[0]_net_1\, 
        \UVL_56FUSE/N_23_i\, \UVL_56FUSE/FILT_OUT[6]_net_1\, 
        \UVL_56FUSE/FILT_OUT[7]_net_1\, \UVL_56FUSE/i10_mux\, 
        \UVL_56FUSE/i2_mux\, \UVL_56FUSE/FILT_OUT[2]_net_1\, 
        \UVL_56FUSE/FILT_OUT[0]_net_1\, 
        \UVL_56FUSE/FILT_OUT[1]_net_1\, \UVL_56FUSE/i4_mux\, 
        \UVL_56FUSE/FILT_OUT[3]_net_1\, \UVL_56FUSE/i6_mux\, 
        \UVL_56FUSE/FILT_OUT[4]_net_1\, \UVL_56FUSE/i8_mux\, 
        \UVL_56FUSE/FILT_OUT[5]_net_1\, 
        \UVL_56FUSE/FILT_OUT_maj_RNILIRQ5[7]_net_1\, 
        \UVL_56FUSE/i12_mux\, \UVL_56FUSE/N89\, 
        \UVL_56FUSE/FILT_OUT_maj_RNILIRQ5_0[7]_net_1\, 
        \UVL_56FUSE/SUM_IN_A[5]_net_1\, \UVL_56FUSE/N92\, 
        \UVL_56FUSE/n_sigout15lto7_2\, 
        \UVL_56FUSE/n_sigout15lto7_1\, 
        \UVL_56FUSE/n_sigout3lto6_1\, 
        \UVL_56FUSE/n_sigout3lto6_0\, \UVL_56FUSE/N_33_i\, 
        \UVL_56FUSE/N_31_i\, \UVL_56FUSE/N_29_i\, 
        \UVL_56FUSE/N_27_i\, \UVL_56FUSE/N_40\, 
        \UVL_56FUSE/SUM_IN_A[4]_net_1\, 
        \UVL_56FUSE/un2_n_filt_out0[28]\, \UVL_56FUSE/n_sigout3\, 
        \UVL_56FUSE/SIGOUT_maj_RNIBM6U2_net_1\, \UVL_56FUSE/N_93\, 
        \UVL_56FUSE/N_95\, \UVL_56FUSE/THRESH_VAL[1]_net_1\, 
        \UVL_56FUSE/THRESH_VAL[0]_net_1\, \UVL_56FUSE/N_113\, 
        \UVL_56FUSE/THRESH_VAL_ns[0]\, 
        \UVL_56FUSE/THRESH_VAL_maj_RNIS23U1[1]_net_1\, 
        \UVL_56FUSE/ADD_4x4_fast_I6_Y_2\, 
        \UVL_56FUSE/SIG_IN_DEL_maj_RNIS1J9[0]_net_1\, 
        \UVL_56FUSE/SIG_IN_DEL[0]_net_1\, 
        \UVL_56FUSE/SIG_IN_DEL_maj_RNIS1J9_0[0]_net_1\, 
        \UVL_56FUSE/FILT_OUT_0[7]\, 
        \UVL_56FUSE/FILT_OUT_tmr2_0[7]\, 
        \UVL_56FUSE/FILT_OUT_tmr3_0[7]\, 
        \UVL_56FUSE/FILT_OUT_0[6]\, 
        \UVL_56FUSE/FILT_OUT_tmr2_0[6]\, 
        \UVL_56FUSE/FILT_OUT_tmr3_0[6]\, 
        \UVL_56FUSE/FILT_OUT_0[5]\, 
        \UVL_56FUSE/FILT_OUT_tmr2_0[5]\, 
        \UVL_56FUSE/FILT_OUT_tmr3_0[5]\, 
        \UVL_56FUSE/FILT_OUT_0[4]\, 
        \UVL_56FUSE/FILT_OUT_tmr2_0[4]\, 
        \UVL_56FUSE/FILT_OUT_tmr3_0[4]\, 
        \UVL_56FUSE/FILT_OUT_0[3]\, 
        \UVL_56FUSE/FILT_OUT_tmr2_0[3]\, 
        \UVL_56FUSE/FILT_OUT_tmr3_0[3]\, 
        \UVL_56FUSE/FILT_OUT_0[2]\, 
        \UVL_56FUSE/FILT_OUT_tmr2_0[2]\, 
        \UVL_56FUSE/FILT_OUT_tmr3_0[2]\, 
        \UVL_56FUSE/FILT_OUT_0[1]\, 
        \UVL_56FUSE/FILT_OUT_tmr2_0[1]\, 
        \UVL_56FUSE/FILT_OUT_tmr3_0[1]\, 
        \UVL_56FUSE/FILT_OUT_0[0]\, 
        \UVL_56FUSE/FILT_OUT_tmr2_0[0]\, 
        \UVL_56FUSE/FILT_OUT_tmr3_0[0]\, 
        \UVL_56FUSE/SUM_IN_A_0[5]\, 
        \UVL_56FUSE/SUM_IN_A_tmr2_0[5]\, 
        \UVL_56FUSE/SUM_IN_A_tmr3_0[5]\, 
        \UVL_56FUSE/SUM_IN_A_0[4]\, 
        \UVL_56FUSE/SUM_IN_A_tmr2_0[4]\, 
        \UVL_56FUSE/SUM_IN_A_tmr3_0[4]\, 
        \UVL_56FUSE/THRESH_VAL_0[1]\, 
        \UVL_56FUSE/THRESH_VAL_tmr2_0[1]\, 
        \UVL_56FUSE/THRESH_VAL_tmr3_0[1]\, 
        \UVL_56FUSE/THRESH_VAL_0[0]\, 
        \UVL_56FUSE/THRESH_VAL_tmr2_0[0]\, 
        \UVL_56FUSE/THRESH_VAL_tmr3_0[0]\, \UVL_56FUSE/SIGOUT_0\, 
        \UVL_56FUSE/SIGOUT_tmr2_0\, \UVL_56FUSE/SIGOUT_tmr3_0\, 
        \UVL_56FUSE/SIG_IN_DEL_0[0]\, 
        \UVL_56FUSE/SIG_IN_DEL_tmr2_0[0]\, 
        \UVL_56FUSE/SIG_IN_DEL_tmr3_0[0]\, \CONTROL56/N_230_0\, 
        \CONTROL56/SEQUENCER_STATE[4]_net_1\, 
        \CONTROL56/SEQUENCER_STATE[3]_net_1\, \CONTROL56/N_304\, 
        \CONTROL56/RET_STATE[4]_net_1\, \CONTROL56/N_221\, 
        \CONTROL56/SEQUENCER_STATE_ns_i_1[2]\, \CONTROL56/N_246\, 
        \CONTROL56/SEQUENCER_STATE[9]_net_1\, 
        \CONTROL56/SEQUENCER_STATE_ns_i_0[2]_net_1\, 
        \CONTROL56/un8_del_cntr_11\, \CONTROL56/un8_del_cntr_2\, 
        \CONTROL56/un8_del_cntr_1\, \CONTROL56/un8_del_cntr_7\, 
        \CONTROL56/un8_del_cntr_10\, \CONTROL56/un8_del_cntr_6\, 
        \CONTROL56/DEL_CNTR[9]_net_1\, 
        \CONTROL56/DEL_CNTR[10]_net_1\, 
        \CONTROL56/un8_del_cntr_9\, \CONTROL56/un8_del_cntr_4\, 
        \CONTROL56/DEL_CNTR[6]_net_1\, 
        \CONTROL56/DEL_CNTR[5]_net_1\, 
        \CONTROL56/DEL_CNTR[1]_net_1\, 
        \CONTROL56/DEL_CNTR[14]_net_1\, 
        \CONTROL56/DEL_CNTR[13]_net_1\, 
        \CONTROL56/DEL_CNTR[12]_net_1\, 
        \CONTROL56/DEL_CNTR[11]_net_1\, 
        \CONTROL56/DEL_CNTR[8]_net_1\, 
        \CONTROL56/DEL_CNTR[7]_net_1\, 
        \CONTROL56/DEL_CNTR[3]_net_1\, 
        \CONTROL56/DEL_CNTR[4]_net_1\, 
        \CONTROL56/DEL_CNTR[2]_net_1\, 
        \CONTROL56/DEL_CNTR[0]_net_1\, 
        \CONTROL56/RET_STATE_0_a3_0[5]\, 
        \CONTROL56/RET_STATE[5]_net_1\, 
        \CONTROL56/SEQUENCER_STATE[7]_net_1\, 
        \CONTROL56/RET_STATE_0_a3_0[6]\, 
        \CONTROL56/RET_STATE[6]_net_1\, 
        \CONTROL56/SEQUENCER_STATE[6]_net_1\, 
        \CONTROL56/SEQUENCER_STATE_maj_RNIADHK7[9]_net_1\, 
        \CONTROL56/N_271\, \CONTROL56/N_313\, 
        \CONTROL56/RET_STATE[9]_net_1\, 
        \CONTROL56/RET_STATE_maj_RNI1MCD9[9]_net_1\, 
        \CONTROL56/N_315\, 
        \CONTROL56/SEQUENCER_STATE_maj_RNIJKUH2[8]_net_1\, 
        \CONTROL56/N_266\, \CONTROL56/un8_del_cntr\, 
        \CONTROL56/CH_ACTIVE_STAT_maj_RNI0KEN1_net_1\, 
        \CONTROL56/N_309\, \CONTROL56/N_275\, \CONTROL56/N_236\, 
        \CONTROL56/SEQUENCER_STATE[8]_net_1\, 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, 
        \CONTROL56/SEQUENCER_STATE_ns[5]\, \CONTROL56/N_302\, 
        \CONTROL56/N_290\, 
        \CONTROL56/CH_IAUX_EN_maj_RNI9T632[0]_net_1\, 
        \CONTROL56/N_CH_IAUX_EN_1_sqmuxa\, 
        \CONTROL56/CH_MREG_EN_maj_RNI7O3L2[0]_net_1\, 
        \CONTROL56/N_CH_MREG_EN_1_sqmuxa\, 
        \CONTROL56/CH_VOSG_EN_maj_RNIQG1A3[0]_net_1\, 
        \CONTROL56/N_CH_VOSG_EN[0]\, 
        \CONTROL56/CH_VOSG_EN_maj_RNI4G3C3[1]_net_1\, 
        \CONTROL56/N_CH_VOSG_EN[1]\, 
        \CONTROL56/N_CH_VOSG_EN_2_sqmuxa\, 
        \CONTROL56/RET_STATE_maj_RNIB49H1[9]_net_1\, 
        \CONTROL56/N_225\, \CONTROL56/N_312\, \CONTROL56/N_222\, 
        \CONTROL56/N_285\, \CONTROL56/N_298\, \CONTROL56/N_299\, 
        \CONTROL56/SEQUENCER_STATE_maj_RNI819H1[5]_net_1\, 
        \CONTROL56/SEQUENCER_STATE[5]_net_1\, 
        \CONTROL56/SEQUENCER_STATE_maj_RNI709H1[6]_net_1\, 
        \CONTROL56/SEQUENCER_STATE_maj_RNI6V8H1[5]_net_1\, 
        \CONTROL56/N_CH_VOSG_EN_7[1]\, 
        \CONTROL56/SEQUENCER_STATE_ns[4]\, 
        \CONTROL56/SEQUENCER_STATE_ns[3]\, 
        \CONTROL56/N_DEL_CNTR[14]\, \CONTROL56/I_58_1\, 
        \CONTROL56/N_DEL_CNTR[13]\, \CONTROL56/I_60_1\, 
        \CONTROL56/N_DEL_CNTR[12]\, \CONTROL56/I_50_1\, 
        \CONTROL56/N_DEL_CNTR[11]\, \CONTROL56/I_48_1\, 
        \CONTROL56/N_DEL_CNTR[10]\, \CONTROL56/I_54_1\, 
        \CONTROL56/N_DEL_CNTR[9]\, \CONTROL56/I_55_1\, 
        \CONTROL56/N_DEL_CNTR[8]\, \CONTROL56/I_57_1\, 
        \CONTROL56/N_DEL_CNTR[7]\, \CONTROL56/I_59_1\, 
        \CONTROL56/N_DEL_CNTR[6]\, \CONTROL56/I_49_1\, 
        \CONTROL56/N_DEL_CNTR[5]\, \CONTROL56/I_62_1\, 
        \CONTROL56/N_DEL_CNTR[4]\, \CONTROL56/I_53_1\, 
        \CONTROL56/N_DEL_CNTR[3]\, \CONTROL56/I_51_1\, 
        \CONTROL56/N_DEL_CNTR[2]\, \CONTROL56/I_52_1\, 
        \CONTROL56/N_DEL_CNTR[1]\, \CONTROL56/I_56_1\, 
        \CONTROL56/N_DEL_CNTR[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_partial_sum[0]\, 
        \CONTROL56/RET_STATE_0[4]\, 
        \CONTROL56/RET_STATE_tmr2_0[4]\, 
        \CONTROL56/RET_STATE_tmr3_0[4]\, 
        \CONTROL56/RET_STATE_0[5]\, 
        \CONTROL56/RET_STATE_tmr2_0[5]\, 
        \CONTROL56/RET_STATE_tmr3_0[5]\, 
        \CONTROL56/RET_STATE_0[6]\, 
        \CONTROL56/RET_STATE_tmr2_0[6]\, 
        \CONTROL56/RET_STATE_tmr3_0[6]\, 
        \CONTROL56/RET_STATE_0[9]\, 
        \CONTROL56/RET_STATE_tmr2_0[9]\, 
        \CONTROL56/RET_STATE_tmr3_0[9]\, 
        \CONTROL56/CH_VOSG_EN_0[1]\, 
        \CONTROL56/CH_VOSG_EN_tmr2_0[1]\, 
        \CONTROL56/CH_VOSG_EN_tmr3_0[1]\, 
        \CONTROL56/CH_VOSG_EN_0[0]\, 
        \CONTROL56/CH_VOSG_EN_tmr2_0[0]\, 
        \CONTROL56/CH_VOSG_EN_tmr3_0[0]\, 
        \CONTROL56/SEQUENCER_STATE_0[3]\, 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[3]\, 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[3]\, 
        \CONTROL56/SEQUENCER_STATE_0[4]\, 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[4]\, 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[4]\, 
        \CONTROL56/SEQUENCER_STATE_0[5]\, 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[5]\, 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[5]\, 
        \CONTROL56/SEQUENCER_STATE_0[6]\, 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[6]\, 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[6]\, 
        \CONTROL56/SEQUENCER_STATE_0[7]\, 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[7]\, 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[7]\, 
        \CONTROL56/SEQUENCER_STATE_0[8]\, 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[8]\, 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[8]\, 
        \CONTROL56/SEQUENCER_STATE_0[9]\, 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[9]\, 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[9]\, 
        \CONTROL56/CH_IAUX_EN_0[0]\, 
        \CONTROL56/CH_IAUX_EN_tmr2_0[0]\, 
        \CONTROL56/CH_IAUX_EN_tmr3_0[0]\, 
        \CONTROL56/CH_MREG_EN_0[0]\, 
        \CONTROL56/CH_MREG_EN_tmr2_0[0]\, 
        \CONTROL56/CH_MREG_EN_tmr3_0[0]\, 
        \CONTROL56/DEL_CNTR_0[14]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[14]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[14]\, 
        \CONTROL56/DEL_CNTR_0[13]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[13]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[13]\, 
        \CONTROL56/DEL_CNTR_0[12]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[12]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[12]\, 
        \CONTROL56/DEL_CNTR_0[11]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[11]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[11]\, 
        \CONTROL56/DEL_CNTR_0[10]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[10]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[10]\, 
        \CONTROL56/DEL_CNTR_0[9]\, \CONTROL56/DEL_CNTR_tmr2_0[9]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[9]\, \CONTROL56/DEL_CNTR_0[8]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[8]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[8]\, \CONTROL56/DEL_CNTR_0[7]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[7]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[7]\, \CONTROL56/DEL_CNTR_0[6]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[6]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[6]\, \CONTROL56/DEL_CNTR_0[5]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[5]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[5]\, \CONTROL56/DEL_CNTR_0[4]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[4]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[4]\, \CONTROL56/DEL_CNTR_0[3]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[3]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[3]\, \CONTROL56/DEL_CNTR_0[2]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[2]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[2]\, \CONTROL56/DEL_CNTR_0[1]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[1]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[1]\, \CONTROL56/DEL_CNTR_0[0]\, 
        \CONTROL56/DEL_CNTR_tmr2_0[0]\, 
        \CONTROL56/DEL_CNTR_tmr3_0[0]\, 
        \CONTROL56/CH_ACTIVE_STAT_0\, 
        \CONTROL56/CH_ACTIVE_STAT_tmr2_net_1\, 
        \CONTROL56/CH_ACTIVE_STAT_tmr3_net_1\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_1_5[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_12[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_1_4[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_10[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_8[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_2_1[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_2[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_1_2[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_6[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_1[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_2[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_4[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_3[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_2[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_2_1[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_2[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_4[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_5[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_10[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_2_2[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_4[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_5[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_3[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_11_1[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_1[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_11[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_2[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_6[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_3[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_8[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_6[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_12[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_13[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_7[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_2[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_1[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_4[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_10[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_11_2[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_11[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_3[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_5[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_TMP[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_1[0]\, 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_9[0]\, 
        \UVL_12FUSE/N_23_i\, \UVL_12FUSE/FILT_OUT[6]_net_1\, 
        \UVL_12FUSE/FILT_OUT[7]_net_1\, \UVL_12FUSE/i10_mux\, 
        \UVL_12FUSE/i2_mux\, \UVL_12FUSE/FILT_OUT[2]_net_1\, 
        \UVL_12FUSE/FILT_OUT[0]_net_1\, 
        \UVL_12FUSE/FILT_OUT[1]_net_1\, \UVL_12FUSE/i4_mux\, 
        \UVL_12FUSE/FILT_OUT[3]_net_1\, \UVL_12FUSE/i6_mux\, 
        \UVL_12FUSE/FILT_OUT[4]_net_1\, \UVL_12FUSE/i8_mux\, 
        \UVL_12FUSE/FILT_OUT[5]_net_1\, 
        \UVL_12FUSE/FILT_OUT_maj_RNIL8E4D[7]_net_1\, 
        \UVL_12FUSE/i12_mux\, \UVL_12FUSE/N89\, 
        \UVL_12FUSE/FILT_OUT_maj_RNIL8E4D_0[7]_net_1\, 
        \UVL_12FUSE/SUM_IN_A[5]_net_1\, \UVL_12FUSE/N92\, 
        \UVL_12FUSE/n_sigout15lto7_2\, 
        \UVL_12FUSE/n_sigout15lto7_1\, 
        \UVL_12FUSE/n_sigout3lto6_1\, 
        \UVL_12FUSE/n_sigout3lto6_0\, \UVL_12FUSE/PWR_OK_LED_0\, 
        \UVL_12FUSE/N_33_i\, \UVL_12FUSE/N_31_i\, 
        \UVL_12FUSE/N_29_i\, \UVL_12FUSE/N_27_i\, 
        \UVL_12FUSE/N_40\, \UVL_12FUSE/SUM_IN_A[4]_net_1\, 
        \UVL_12FUSE/un2_n_filt_out0[28]\, \UVL_12FUSE/n_sigout3\, 
        \UVL_12FUSE/SIGOUT_maj_RNIRH6C6_net_1\, \UVL_12FUSE/N_93\, 
        \UVL_12FUSE/N_95\, \UVL_12FUSE/THRESH_VAL[1]_net_1\, 
        \UVL_12FUSE/THRESH_VAL[0]_net_1\, \UVL_12FUSE/N_113\, 
        \UVL_12FUSE/THRESH_VAL_ns[0]\, 
        \UVL_12FUSE/THRESH_VAL_maj_RNISF474[1]_net_1\, 
        \UVL_12FUSE/ADD_4x4_fast_I6_Y_0\, 
        \UVL_12FUSE/SIG_IN_DEL_maj_RNICLUI[0]_net_1\, 
        \UVL_12FUSE/SIG_IN_DEL[0]_net_1\, 
        \UVL_12FUSE/SIG_IN_DEL_maj_RNICLUI_0[0]_net_1\, 
        \UVL_12FUSE/FILT_OUT_2[7]\, 
        \UVL_12FUSE/FILT_OUT_tmr2_2[7]\, 
        \UVL_12FUSE/FILT_OUT_tmr3_2[7]\, 
        \UVL_12FUSE/FILT_OUT_2[6]\, 
        \UVL_12FUSE/FILT_OUT_tmr2_2[6]\, 
        \UVL_12FUSE/FILT_OUT_tmr3_2[6]\, 
        \UVL_12FUSE/FILT_OUT_2[5]\, 
        \UVL_12FUSE/FILT_OUT_tmr2_2[5]\, 
        \UVL_12FUSE/FILT_OUT_tmr3_2[5]\, 
        \UVL_12FUSE/FILT_OUT_2[4]\, 
        \UVL_12FUSE/FILT_OUT_tmr2_2[4]\, 
        \UVL_12FUSE/FILT_OUT_tmr3_2[4]\, 
        \UVL_12FUSE/FILT_OUT_2[3]\, 
        \UVL_12FUSE/FILT_OUT_tmr2_2[3]\, 
        \UVL_12FUSE/FILT_OUT_tmr3_2[3]\, 
        \UVL_12FUSE/FILT_OUT_2[2]\, 
        \UVL_12FUSE/FILT_OUT_tmr2_2[2]\, 
        \UVL_12FUSE/FILT_OUT_tmr3_2[2]\, 
        \UVL_12FUSE/FILT_OUT_2[1]\, 
        \UVL_12FUSE/FILT_OUT_tmr2_2[1]\, 
        \UVL_12FUSE/FILT_OUT_tmr3_2[1]\, 
        \UVL_12FUSE/FILT_OUT_2[0]\, 
        \UVL_12FUSE/FILT_OUT_tmr2_2[0]\, 
        \UVL_12FUSE/FILT_OUT_tmr3_2[0]\, 
        \UVL_12FUSE/SUM_IN_A_2[5]\, 
        \UVL_12FUSE/SUM_IN_A_tmr2_2[5]\, 
        \UVL_12FUSE/SUM_IN_A_tmr3_2[5]\, 
        \UVL_12FUSE/SUM_IN_A_2[4]\, 
        \UVL_12FUSE/SUM_IN_A_tmr2_2[4]\, 
        \UVL_12FUSE/SUM_IN_A_tmr3_2[4]\, 
        \UVL_12FUSE/THRESH_VAL_2[1]\, 
        \UVL_12FUSE/THRESH_VAL_tmr2_2[1]\, 
        \UVL_12FUSE/THRESH_VAL_tmr3_2[1]\, 
        \UVL_12FUSE/THRESH_VAL_2[0]\, 
        \UVL_12FUSE/THRESH_VAL_tmr2_2[0]\, 
        \UVL_12FUSE/THRESH_VAL_tmr3_2[0]\, \UVL_12FUSE/SIGOUT_2\, 
        \UVL_12FUSE/SIGOUT_tmr2_2\, \UVL_12FUSE/SIGOUT_tmr3_2\, 
        \UVL_12FUSE/SIG_IN_DEL_2[0]\, 
        \UVL_12FUSE/SIG_IN_DEL_tmr2_2[0]\, 
        \UVL_12FUSE/SIG_IN_DEL_tmr3_2[0]\, \CONTROL34/N_230_0\, 
        \CONTROL34/SEQUENCER_STATE[4]_net_1\, 
        \CONTROL34/SEQUENCER_STATE[3]_net_1\, \CONTROL34/N_304\, 
        \CONTROL34/RET_STATE[4]_net_1\, \CONTROL34/N_221\, 
        \CONTROL34/SEQUENCER_STATE_ns_i_1[2]\, \CONTROL34/N_246\, 
        \CONTROL34/SEQUENCER_STATE[9]_net_1\, 
        \CONTROL34/SEQUENCER_STATE_ns_i_0[2]_net_1\, 
        \CONTROL34/un8_del_cntr_11\, \CONTROL34/un8_del_cntr_2\, 
        \CONTROL34/un8_del_cntr_1\, \CONTROL34/un8_del_cntr_7\, 
        \CONTROL34/un8_del_cntr_10\, \CONTROL34/un8_del_cntr_6\, 
        \CONTROL34/DEL_CNTR[9]_net_1\, 
        \CONTROL34/DEL_CNTR[10]_net_1\, 
        \CONTROL34/un8_del_cntr_9\, \CONTROL34/un8_del_cntr_4\, 
        \CONTROL34/DEL_CNTR[5]_net_1\, 
        \CONTROL34/DEL_CNTR[6]_net_1\, 
        \CONTROL34/DEL_CNTR[2]_net_1\, 
        \CONTROL34/DEL_CNTR[14]_net_1\, 
        \CONTROL34/DEL_CNTR[13]_net_1\, 
        \CONTROL34/DEL_CNTR[12]_net_1\, 
        \CONTROL34/DEL_CNTR[11]_net_1\, 
        \CONTROL34/DEL_CNTR[8]_net_1\, 
        \CONTROL34/DEL_CNTR[7]_net_1\, 
        \CONTROL34/DEL_CNTR[4]_net_1\, 
        \CONTROL34/DEL_CNTR[3]_net_1\, 
        \CONTROL34/DEL_CNTR[1]_net_1\, 
        \CONTROL34/DEL_CNTR[0]_net_1\, 
        \CONTROL34/RET_STATE_0_a3_0[6]\, 
        \CONTROL34/RET_STATE[6]_net_1\, 
        \CONTROL34/SEQUENCER_STATE[6]_net_1\, 
        \CONTROL34/RET_STATE_0_a3_0[5]\, 
        \CONTROL34/RET_STATE[5]_net_1\, 
        \CONTROL34/SEQUENCER_STATE[5]_net_1\, 
        \CONTROL34/SEQUENCER_STATE_maj_RNI12OH7[8]_net_1\, 
        \CONTROL34/N_315\, 
        \CONTROL34/SEQUENCER_STATE_maj_RNIA54A2[8]_net_1\, 
        \CONTROL34/N_266\, \CONTROL34/N_8\, 
        \CONTROL34/un1_mode_dcyc_normb_1\, 
        \CONTROL34/SEQUENCER_STATE_maj_RNIR2NF1[4]_net_1\, 
        \CONTROL34/N_309\, \CONTROL34/un8_del_cntr\, 
        \CONTROL34/RET_STATE[9]_net_1\, 
        \CONTROL34/SEQUENCER_STATE_maj_RNIQHEV5[9]_net_1\, 
        \CONTROL34/N_271\, \CONTROL34/N_313\, \CONTROL34/N_275\, 
        \CONTROL34/N_236\, \CONTROL34/SEQUENCER_STATE[8]_net_1\, 
        \CONTROL34/SEQUENCER_STATE_ns[3]\, \CONTROL34/N_302\, 
        \CONTROL34/N_299\, \CONTROL34/SEQUENCER_STATE_ns[4]\, 
        \CONTROL34/N_298\, 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, 
        \CONTROL34/N_225\, \CONTROL34/N_222\, 
        \CONTROL34/SEQUENCER_STATE[7]_net_1\, \CONTROL34/N_285\, 
        \CONTROL34/SEQUENCER_STATE_ns[5]\, 
        \CONTROL34/SEQUENCER_STATE_maj_RNIMULP[5]_net_1\, 
        \CONTROL34/SEQUENCER_STATE_maj_RNINVLP[6]_net_1\, 
        \CONTROL34/SEQUENCER_STATE_maj_RNIO0MP[5]_net_1\, 
        \CONTROL34/N_290\, 
        \CONTROL34/RET_STATE_maj_RNIR3MP[9]_net_1\, 
        \CONTROL34/N_DEL_CNTR[14]\, \CONTROL34/I_58_0\, 
        \CONTROL34/N_DEL_CNTR[13]\, \CONTROL34/I_60_0\, 
        \CONTROL34/N_DEL_CNTR[12]\, \CONTROL34/I_50_0\, 
        \CONTROL34/N_DEL_CNTR[11]\, \CONTROL34/I_48_0\, 
        \CONTROL34/N_DEL_CNTR[10]\, \CONTROL34/I_54_0\, 
        \CONTROL34/N_DEL_CNTR[9]\, \CONTROL34/I_55_0\, 
        \CONTROL34/N_DEL_CNTR[8]\, \CONTROL34/I_57_0\, 
        \CONTROL34/N_DEL_CNTR[7]\, \CONTROL34/I_59_0\, 
        \CONTROL34/N_DEL_CNTR[6]\, \CONTROL34/I_49_0\, 
        \CONTROL34/N_DEL_CNTR[5]\, \CONTROL34/I_62_0\, 
        \CONTROL34/N_DEL_CNTR[4]\, \CONTROL34/I_53_0\, 
        \CONTROL34/N_DEL_CNTR[3]\, \CONTROL34/I_51_0\, 
        \CONTROL34/N_DEL_CNTR[2]\, \CONTROL34/I_52_0\, 
        \CONTROL34/N_DEL_CNTR[1]\, \CONTROL34/I_56_0\, 
        \CONTROL34/N_DEL_CNTR[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_partial_sum[0]\, 
        \CONTROL34/N_CH_VOSG_EN_7[1]\, \CONTROL34/N_15\, 
        \CONTROL34/N_17_i\, \CONTROL34/N_16\, \CONTROL34/N_64\, 
        \CONTROL34/N_65\, \CONTROL34/N_4\, 
        \CONTROL34/N_DTYCYC_CNT_2_sqmuxa\, 
        \CONTROL34/N_CH_VOSG_EN[1]\, \CONTROL34/N_312\, 
        \CONTROL34/N_CH_VOSG_EN_2_sqmuxa\, 
        \CONTROL34/N_CH_VOSG_EN[0]\, 
        \CONTROL34/N_CH_IAUX_EN_1_sqmuxa\, 
        \CONTROL34/N_CH_MREG_EN_1_sqmuxa\, 
        \CONTROL34/CH_VOSG_EN_maj_RNIHBN23[1]_net_1\, 
        \CONTROL34/CH_VOSG_EN_maj_RNIB8TL2[0]_net_1\, 
        \CONTROL34/CH_MREG_EN_maj_RNISJUL1[0]_net_1\, 
        \CONTROL34/CH_IAUX_EN_maj_RNI2N6R1[0]_net_1\, 
        \CONTROL34/RET_STATE_1[4]\, 
        \CONTROL34/RET_STATE_tmr2_1[4]\, 
        \CONTROL34/RET_STATE_tmr3_1[4]\, 
        \CONTROL34/RET_STATE_1[5]\, 
        \CONTROL34/RET_STATE_tmr2_1[5]\, 
        \CONTROL34/RET_STATE_tmr3_1[5]\, 
        \CONTROL34/RET_STATE_1[6]\, 
        \CONTROL34/RET_STATE_tmr2_1[6]\, 
        \CONTROL34/RET_STATE_tmr3_1[6]\, 
        \CONTROL34/RET_STATE_1[9]\, 
        \CONTROL34/RET_STATE_tmr2_1[9]\, 
        \CONTROL34/RET_STATE_tmr3_1[9]\, 
        \CONTROL34/CH_VOSG_EN_1[1]\, 
        \CONTROL34/CH_VOSG_EN_tmr2_1[1]\, 
        \CONTROL34/CH_VOSG_EN_tmr3_1[1]\, 
        \CONTROL34/CH_VOSG_EN_1[0]\, 
        \CONTROL34/CH_VOSG_EN_tmr2_1[0]\, 
        \CONTROL34/CH_VOSG_EN_tmr3_1[0]\, 
        \CONTROL34/SEQUENCER_STATE_1[3]\, 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[3]\, 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[3]\, 
        \CONTROL34/SEQUENCER_STATE_1[4]\, 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[4]\, 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[4]\, 
        \CONTROL34/SEQUENCER_STATE_1[5]\, 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[5]\, 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[5]\, 
        \CONTROL34/SEQUENCER_STATE_1[6]\, 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[6]\, 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[6]\, 
        \CONTROL34/SEQUENCER_STATE_1[7]\, 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[7]\, 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[7]\, 
        \CONTROL34/SEQUENCER_STATE_1[8]\, 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[8]\, 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[8]\, 
        \CONTROL34/SEQUENCER_STATE_1[9]\, 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[9]\, 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[9]\, 
        \CONTROL34/CH_IAUX_EN_1[0]\, 
        \CONTROL34/CH_IAUX_EN_tmr2_1[0]\, 
        \CONTROL34/CH_IAUX_EN_tmr3_1[0]\, 
        \CONTROL34/CH_MREG_EN_1[0]\, 
        \CONTROL34/CH_MREG_EN_tmr2_1[0]\, 
        \CONTROL34/CH_MREG_EN_tmr3_1[0]\, 
        \CONTROL34/DEL_CNTR_1[14]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[14]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[14]\, 
        \CONTROL34/DEL_CNTR_1[13]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[13]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[13]\, 
        \CONTROL34/DEL_CNTR_1[12]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[12]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[12]\, 
        \CONTROL34/DEL_CNTR_1[11]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[11]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[11]\, 
        \CONTROL34/DEL_CNTR_1[10]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[10]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[10]\, 
        \CONTROL34/DEL_CNTR_1[9]\, \CONTROL34/DEL_CNTR_tmr2_1[9]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[9]\, \CONTROL34/DEL_CNTR_1[8]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[8]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[8]\, \CONTROL34/DEL_CNTR_1[7]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[7]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[7]\, \CONTROL34/DEL_CNTR_1[6]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[6]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[6]\, \CONTROL34/DEL_CNTR_1[5]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[5]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[5]\, \CONTROL34/DEL_CNTR_1[4]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[4]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[4]\, \CONTROL34/DEL_CNTR_1[3]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[3]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[3]\, \CONTROL34/DEL_CNTR_1[2]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[2]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[2]\, \CONTROL34/DEL_CNTR_1[1]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[1]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[1]\, \CONTROL34/DEL_CNTR_1[0]\, 
        \CONTROL34/DEL_CNTR_tmr2_1[0]\, 
        \CONTROL34/DEL_CNTR_tmr3_1[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_1_5[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_12[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_1_4[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_10[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_8[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_2_1[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_2[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_1_2[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_6[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_1[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_2[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_4[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_3[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_2[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_2_1[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_2[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_4[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_5[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_10[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_2_2[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_4[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_5[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_3[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_11_1[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_1[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_11[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_2[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_6[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_3[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_8[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_6[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_12[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_13[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_7[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_2[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_1[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_4[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_10[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_11_2[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_11[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_3[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_5[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_TMP[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_1[0]\, 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_9[0]\, 
        \TX_PROMPT/un9_cnt_vallto7_0\, 
        \TX_PROMPT/CNT_VAL[6]_net_1\, 
        \TX_PROMPT/CNT_VAL[7]_net_1\, 
        \TX_PROMPT/un9_cnt_vallto5_0\, 
        \TX_PROMPT/CNT_VAL[4]_net_1\, 
        \TX_PROMPT/CNT_VAL[5]_net_1\, \TX_PROMPT/CNT_m6_0_a2_5\, 
        \TX_PROMPT/CNT_m6_0_a2_3\, \TX_PROMPT/CNT_m6_0_a2_4\, 
        \TX_PROMPT/CNT_VAL[8]_net_1\, \TX_PROMPT/CNT_VAL_c1\, 
        \TX_PROMPT/CNT_VAL[3]_net_1\, 
        \TX_PROMPT/CNT_VAL[2]_net_1\, \TX_PROMPT/un9_cnt_vallt20\, 
        \TX_PROMPT/un9_cnt_vallt17\, 
        \TX_PROMPT/un9_cnt_vallto17_0\, 
        \TX_PROMPT/un9_cnt_vallto19_0\, 
        \TX_PROMPT/CNT_VAL[12]_net_1\, 
        \TX_PROMPT/un9_cnt_vallt12\, 
        \TX_PROMPT/un9_cnt_vallto15_1\, 
        \TX_PROMPT/CNT_VAL[9]_net_1\, \TX_PROMPT/un9_cnt_vallt9\, 
        \TX_PROMPT/un9_cnt_vallto11_0\, 
        \TX_PROMPT/un9_cnt_vallt7\, \TX_PROMPT/CNT_VAL_c2\, 
        \TX_PROMPT/CNT_VAL_n20\, \TX_PROMPT/CNT_VAL[20]_net_1\, 
        \TX_PROMPT/CNT_VAL_41_0\, \TX_PROMPT/CNT_VAL[19]_net_1\, 
        \TX_PROMPT/CNT_VAL_c18\, \TX_PROMPT/CNT_VAL_n19\, 
        \TX_PROMPT/un9_cnt_val\, \TX_PROMPT/CNT_VAL_n18\, 
        \TX_PROMPT/CNT_VAL[18]_net_1\, \TX_PROMPT/CNT_VAL_c17\, 
        \TX_PROMPT/CNT_VAL_n17\, \TX_PROMPT/CNT_VAL[17]_net_1\, 
        \TX_PROMPT/CNT_VAL_c16\, \TX_PROMPT/CNT_VAL_n16\, 
        \TX_PROMPT/CNT_VAL[16]_net_1\, \TX_PROMPT/CNT_VAL_c15\, 
        \TX_PROMPT/CNT_VAL_n15\, \TX_PROMPT/CNT_VAL_n15_tz\, 
        \TX_PROMPT/CNT_VAL_n14\, \TX_PROMPT/CNT_VAL_n13\, 
        \TX_PROMPT/CNT_VAL_n13_tz\, \TX_PROMPT/CNT_VAL_n12\, 
        \TX_PROMPT/CNT_VAL_n11\, \TX_PROMPT/CNT_VAL_n11_tz\, 
        \TX_PROMPT/CNT_VAL_n10\, \TX_PROMPT/CNT_VAL_n9\, 
        \TX_PROMPT/CNT_VAL_n9_tz\, \TX_PROMPT/CNT_VAL_n8\, 
        \TX_PROMPT/CNT_VAL_n8_tz\, \TX_PROMPT/CNT_VAL_n7\, 
        \TX_PROMPT/CNT_VAL_n6\, \TX_PROMPT/CNT_VAL_n6_tz\, 
        \TX_PROMPT/CNT_VAL_n5\, \TX_PROMPT/CNT_VAL_n4\, 
        \TX_PROMPT/CNT_VAL_n4_tz\, \TX_PROMPT/CNT_VAL_n3\, 
        \TX_PROMPT/CNT_VAL_n2\, \TX_PROMPT/CNT_VAL_n1\, 
        \TX_PROMPT/CNT_VAL[0]_net_1\, 
        \TX_PROMPT/CNT_VAL[1]_net_1\, \TX_PROMPT/CNT_VAL_n0\, 
        \TX_PROMPT/CNT_VAL[14]_net_1\, \TX_PROMPT/CNT_VAL_c13\, 
        \TX_PROMPT/CNT_VAL[15]_net_1\, \TX_PROMPT/CNT_VAL_c11\, 
        \TX_PROMPT/CNT_VAL[13]_net_1\, 
        \TX_PROMPT/CNT_VAL[10]_net_1\, \TX_PROMPT/CNT_VAL_c9\, 
        \TX_PROMPT/CNT_VAL[11]_net_1\, \TX_PROMPT/CNT_VAL_c6\, 
        \TX_PROMPT/CNT_VAL_c4\, \TX_PROMPT/CNT_VAL_0[20]\, 
        \TX_PROMPT/CNT_VAL_tmr2[20]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[20]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[19]\, 
        \TX_PROMPT/CNT_VAL_tmr2[19]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[19]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[18]\, 
        \TX_PROMPT/CNT_VAL_tmr2[18]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[18]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[17]\, 
        \TX_PROMPT/CNT_VAL_tmr2[17]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[17]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[16]\, 
        \TX_PROMPT/CNT_VAL_tmr2[16]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[16]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[15]\, 
        \TX_PROMPT/CNT_VAL_tmr2[15]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[15]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[14]\, 
        \TX_PROMPT/CNT_VAL_tmr2[14]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[14]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[13]\, 
        \TX_PROMPT/CNT_VAL_tmr2[13]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[13]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[12]\, 
        \TX_PROMPT/CNT_VAL_tmr2[12]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[12]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[11]\, 
        \TX_PROMPT/CNT_VAL_tmr2[11]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[11]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[10]\, 
        \TX_PROMPT/CNT_VAL_tmr2[10]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[10]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[9]\, 
        \TX_PROMPT/CNT_VAL_tmr2[9]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[9]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[8]\, 
        \TX_PROMPT/CNT_VAL_tmr2[8]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[8]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[7]\, 
        \TX_PROMPT/CNT_VAL_tmr2[7]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[7]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[6]\, 
        \TX_PROMPT/CNT_VAL_tmr2[6]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[6]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[5]\, 
        \TX_PROMPT/CNT_VAL_tmr2[5]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[5]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[4]\, 
        \TX_PROMPT/CNT_VAL_tmr2[4]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[4]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[3]\, 
        \TX_PROMPT/CNT_VAL_tmr2[3]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[3]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[2]\, 
        \TX_PROMPT/CNT_VAL_tmr2[2]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[2]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[1]\, 
        \TX_PROMPT/CNT_VAL_tmr2[1]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[1]_net_1\, 
        \TX_PROMPT/CNT_VAL_0[0]\, 
        \TX_PROMPT/CNT_VAL_tmr2[0]_net_1\, 
        \TX_PROMPT/CNT_VAL_tmr3[0]_net_1\, 
        \TX_PROMPT/MS250_CLK_EN_SIG_net_1\, 
        \TX_PROMPT/MS250_CLK_EN_SIG_tmr2_net_1\, 
        \TX_PROMPT/MS250_CLK_EN_SIG_tmr3_net_1\, 
        \CONTROL12/N_230_0\, \CONTROL12/SEQUENCER_STATE[4]_net_1\, 
        \CONTROL12/SEQUENCER_STATE[3]_net_1\, \CONTROL12/N_304\, 
        \CONTROL12/RET_STATE[4]_net_1\, \CONTROL12/N_221\, 
        \CONTROL12/SEQUENCER_STATE_ns_i_1[2]\, \CONTROL12/N_246\, 
        \CONTROL12/SEQUENCER_STATE[9]_net_1\, 
        \CONTROL12/SEQUENCER_STATE_ns_i_0[2]_net_1\, 
        \CONTROL12/un8_del_cntr_11\, \CONTROL12/un8_del_cntr_2\, 
        \CONTROL12/un8_del_cntr_1\, \CONTROL12/un8_del_cntr_7\, 
        \CONTROL12/un8_del_cntr_10\, \CONTROL12/un8_del_cntr_6\, 
        \CONTROL12/DEL_CNTR[9]_net_1\, 
        \CONTROL12/DEL_CNTR[10]_net_1\, 
        \CONTROL12/un8_del_cntr_9\, \CONTROL12/un8_del_cntr_4\, 
        \CONTROL12/DEL_CNTR[0]_net_1\, 
        \CONTROL12/DEL_CNTR[2]_net_1\, 
        \CONTROL12/DEL_CNTR[3]_net_1\, 
        \CONTROL12/DEL_CNTR[14]_net_1\, 
        \CONTROL12/DEL_CNTR[13]_net_1\, 
        \CONTROL12/DEL_CNTR[12]_net_1\, 
        \CONTROL12/DEL_CNTR[11]_net_1\, 
        \CONTROL12/DEL_CNTR[8]_net_1\, 
        \CONTROL12/DEL_CNTR[7]_net_1\, 
        \CONTROL12/DEL_CNTR[6]_net_1\, 
        \CONTROL12/DEL_CNTR[1]_net_1\, 
        \CONTROL12/DEL_CNTR[4]_net_1\, 
        \CONTROL12/DEL_CNTR[5]_net_1\, 
        \CONTROL12/RET_STATE_0_a3_0[5]\, 
        \CONTROL12/RET_STATE[5]_net_1\, 
        \CONTROL12/SEQUENCER_STATE[5]_net_1\, 
        \CONTROL12/RET_STATE_0_a3_0[6]\, 
        \CONTROL12/RET_STATE[6]_net_1\, 
        \CONTROL12/SEQUENCER_STATE[6]_net_1\, 
        \CONTROL12/CH_ACTIVE_STAT_maj_RNIF8952_net_1\, 
        \CONTROL12/N_309\, \CONTROL12/un8_del_cntr\, 
        \CONTROL12/RET_STATE[9]_net_1\, 
        \CONTROL12/RET_STATE_maj_RNIGJ2Q8[9]_net_1\, 
        \CONTROL12/N_315\, 
        \CONTROL12/SEQUENCER_STATE_maj_RNIIGAE2[8]_net_1\, 
        \CONTROL12/N_266\, 
        \CONTROL12/SEQUENCER_STATE_maj_RNIPRAE6[9]_net_1\, 
        \CONTROL12/N_271\, \CONTROL12/N_313\, \CONTROL12/N_275\, 
        \CONTROL12/N_236\, \CONTROL12/SEQUENCER_STATE[8]_net_1\, 
        \CONTROL12/SEQUENCER_STATE_ns[3]\, \CONTROL12/N_302\, 
        \CONTROL12/N_299\, \CONTROL12/SEQUENCER_STATE_ns[4]\, 
        \CONTROL12/N_298\, 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, 
        \CONTROL12/N_225\, \CONTROL12/N_222\, 
        \CONTROL12/SEQUENCER_STATE[7]_net_1\, 
        \CONTROL12/SEQUENCER_STATE_ns[5]\, 
        \CONTROL12/SEQUENCER_STATE_maj_RNI6U2I1[5]_net_1\, 
        \CONTROL12/SEQUENCER_STATE_maj_RNI7V2I1[6]_net_1\, 
        \CONTROL12/SEQUENCER_STATE_maj_RNI803I1[5]_net_1\, 
        \CONTROL12/N_290\, \CONTROL12/N_285\, 
        \CONTROL12/RET_STATE_maj_RNIB33I1[9]_net_1\, 
        \CONTROL12/N_DEL_CNTR[14]\, \CONTROL12/I_58\, 
        \CONTROL12/N_DEL_CNTR[13]\, \CONTROL12/I_60\, 
        \CONTROL12/N_DEL_CNTR[12]\, \CONTROL12/I_50\, 
        \CONTROL12/N_DEL_CNTR[11]\, \CONTROL12/I_48\, 
        \CONTROL12/N_DEL_CNTR[10]\, \CONTROL12/I_54\, 
        \CONTROL12/N_DEL_CNTR[9]\, \CONTROL12/I_55\, 
        \CONTROL12/N_DEL_CNTR[8]\, \CONTROL12/I_57\, 
        \CONTROL12/N_DEL_CNTR[7]\, \CONTROL12/I_59\, 
        \CONTROL12/N_DEL_CNTR[6]\, \CONTROL12/I_49\, 
        \CONTROL12/N_DEL_CNTR[5]\, \CONTROL12/I_62\, 
        \CONTROL12/N_DEL_CNTR[4]\, \CONTROL12/I_53\, 
        \CONTROL12/N_DEL_CNTR[3]\, \CONTROL12/I_51\, 
        \CONTROL12/N_DEL_CNTR[2]\, \CONTROL12/I_52\, 
        \CONTROL12/N_DEL_CNTR[1]\, \CONTROL12/I_56\, 
        \CONTROL12/N_DEL_CNTR[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_partial_sum[0]\, 
        \CONTROL12/N_CH_VOSG_EN_7[1]\, 
        \CONTROL12/N_CH_VOSG_EN[1]\, \CONTROL12/N_312\, 
        \CONTROL12/N_CH_VOSG_EN_2_sqmuxa\, 
        \CONTROL12/N_CH_VOSG_EN[0]\, 
        \CONTROL12/N_CH_IAUX_EN_1_sqmuxa\, 
        \CONTROL12/N_CH_MREG_EN_1_sqmuxa\, 
        \CONTROL12/CH_VOSG_EN_maj_RNIFR854[1]_net_1\, 
        \CONTROL12/CH_VOSG_EN_maj_RNIDKMT3[0]_net_1\, 
        \CONTROL12/CH_MREG_EN_maj_RNIUVMI3[0]_net_1\, 
        \CONTROL12/CH_IAUX_EN_maj_RNI814V2[0]_net_1\, 
        \CONTROL12/RET_STATE_2[4]\, 
        \CONTROL12/RET_STATE_tmr2_2[4]\, 
        \CONTROL12/RET_STATE_tmr3_2[4]\, 
        \CONTROL12/RET_STATE_2[5]\, 
        \CONTROL12/RET_STATE_tmr2_2[5]\, 
        \CONTROL12/RET_STATE_tmr3_2[5]\, 
        \CONTROL12/RET_STATE_2[6]\, 
        \CONTROL12/RET_STATE_tmr2_2[6]\, 
        \CONTROL12/RET_STATE_tmr3_2[6]\, 
        \CONTROL12/RET_STATE_2[9]\, 
        \CONTROL12/RET_STATE_tmr2_2[9]\, 
        \CONTROL12/RET_STATE_tmr3_2[9]\, 
        \CONTROL12/CH_VOSG_EN_2[1]\, 
        \CONTROL12/CH_VOSG_EN_tmr2_2[1]\, 
        \CONTROL12/CH_VOSG_EN_tmr3_2[1]\, 
        \CONTROL12/CH_VOSG_EN_2[0]\, 
        \CONTROL12/CH_VOSG_EN_tmr2_2[0]\, 
        \CONTROL12/CH_VOSG_EN_tmr3_2[0]\, 
        \CONTROL12/SEQUENCER_STATE_2[3]\, 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[3]\, 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[3]\, 
        \CONTROL12/SEQUENCER_STATE_2[4]\, 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[4]\, 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[4]\, 
        \CONTROL12/SEQUENCER_STATE_2[5]\, 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[5]\, 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[5]\, 
        \CONTROL12/SEQUENCER_STATE_2[6]\, 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[6]\, 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[6]\, 
        \CONTROL12/SEQUENCER_STATE_2[7]\, 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[7]\, 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[7]\, 
        \CONTROL12/SEQUENCER_STATE_2[8]\, 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[8]\, 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[8]\, 
        \CONTROL12/SEQUENCER_STATE_2[9]\, 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[9]\, 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[9]\, 
        \CONTROL12/CH_IAUX_EN_2[0]\, 
        \CONTROL12/CH_IAUX_EN_tmr2_2[0]\, 
        \CONTROL12/CH_IAUX_EN_tmr3_2[0]\, 
        \CONTROL12/CH_MREG_EN_2[0]\, 
        \CONTROL12/CH_MREG_EN_tmr2_2[0]\, 
        \CONTROL12/CH_MREG_EN_tmr3_2[0]\, 
        \CONTROL12/DEL_CNTR_2[14]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[14]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[14]\, 
        \CONTROL12/DEL_CNTR_2[13]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[13]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[13]\, 
        \CONTROL12/DEL_CNTR_2[12]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[12]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[12]\, 
        \CONTROL12/DEL_CNTR_2[11]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[11]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[11]\, 
        \CONTROL12/DEL_CNTR_2[10]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[10]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[10]\, 
        \CONTROL12/DEL_CNTR_2[9]\, \CONTROL12/DEL_CNTR_tmr2_2[9]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[9]\, \CONTROL12/DEL_CNTR_2[8]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[8]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[8]\, \CONTROL12/DEL_CNTR_2[7]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[7]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[7]\, \CONTROL12/DEL_CNTR_2[6]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[6]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[6]\, \CONTROL12/DEL_CNTR_2[5]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[5]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[5]\, \CONTROL12/DEL_CNTR_2[4]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[4]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[4]\, \CONTROL12/DEL_CNTR_2[3]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[3]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[3]\, \CONTROL12/DEL_CNTR_2[2]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[2]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[2]\, \CONTROL12/DEL_CNTR_2[1]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[1]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[1]\, \CONTROL12/DEL_CNTR_2[0]\, 
        \CONTROL12/DEL_CNTR_tmr2_2[0]\, 
        \CONTROL12/DEL_CNTR_tmr3_2[0]\, 
        \CONTROL12/CH_ACTIVE_STAT_0\, 
        \CONTROL12/CH_ACTIVE_STAT_tmr2_0\, 
        \CONTROL12/CH_ACTIVE_STAT_tmr3_0\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_1_5[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_12[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_1_4[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_10[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_8[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_2_1[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_2[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_1_2[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_6[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_1[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_2[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_4[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_3[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_2[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_2_1[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_2[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_4[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_5[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_10[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_2_2[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_4[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_5[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_3[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_11_1[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_1[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_11[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_2[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_6[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_3[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_8[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_6[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_12[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_13[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_7[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_2[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_1[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_4[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_10[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_11_2[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_11[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_3[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_5[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_TMP[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_1[0]\, 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_9[0]\, 
        \CONTROL78/N_230_0\, \CONTROL78/SEQUENCER_STATE[4]_net_1\, 
        \CONTROL78/SEQUENCER_STATE[3]_net_1\, \CONTROL78/N_304\, 
        \CONTROL78/RET_STATE[4]_net_1\, \CONTROL78/N_221\, 
        \CONTROL78/SEQUENCER_STATE_ns_i_1[2]\, \CONTROL78/N_246\, 
        \CONTROL78/SEQUENCER_STATE[9]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_ns_i_0[2]_net_1\, 
        \CONTROL78/un8_del_cntr_11\, \CONTROL78/un8_del_cntr_2\, 
        \CONTROL78/un8_del_cntr_1\, \CONTROL78/un8_del_cntr_7\, 
        \CONTROL78/un8_del_cntr_10\, \CONTROL78/un8_del_cntr_6\, 
        \CONTROL78/DEL_CNTR[9]_net_1\, 
        \CONTROL78/DEL_CNTR[10]_net_1\, 
        \CONTROL78/un8_del_cntr_9\, \CONTROL78/un8_del_cntr_4\, 
        \CONTROL78/DEL_CNTR[5]_net_1\, 
        \CONTROL78/DEL_CNTR[6]_net_1\, 
        \CONTROL78/DEL_CNTR[2]_net_1\, 
        \CONTROL78/DEL_CNTR[14]_net_1\, 
        \CONTROL78/DEL_CNTR[13]_net_1\, 
        \CONTROL78/DEL_CNTR[12]_net_1\, 
        \CONTROL78/DEL_CNTR[11]_net_1\, 
        \CONTROL78/DEL_CNTR[8]_net_1\, 
        \CONTROL78/DEL_CNTR[7]_net_1\, 
        \CONTROL78/DEL_CNTR[4]_net_1\, 
        \CONTROL78/DEL_CNTR[3]_net_1\, 
        \CONTROL78/DEL_CNTR[1]_net_1\, 
        \CONTROL78/DEL_CNTR[0]_net_1\, 
        \CONTROL78/RET_STATE_0_a3_0[6]\, 
        \CONTROL78/RET_STATE[6]_net_1\, 
        \CONTROL78/SEQUENCER_STATE[6]_net_1\, 
        \CONTROL78/RET_STATE_0_a3_0[5]\, 
        \CONTROL78/RET_STATE[5]_net_1\, 
        \CONTROL78/SEQUENCER_STATE[5]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_maj_RNI1A198[8]_net_1\, 
        \CONTROL78/N_315\, 
        \CONTROL78/SEQUENCER_STATE_maj_RNIQENH2[8]_net_1\, 
        \CONTROL78/N_266\, 
        \CONTROL78/SEQUENCER_STATE_maj_RNI9EJD7[9]_net_1\, 
        \CONTROL78/N_271\, \CONTROL78/N_313\, 
        \CONTROL78/SEQUENCER_STATE_maj_RNIRJR51[4]_net_1\, 
        \CONTROL78/N_309\, \CONTROL78/N_236\, 
        \CONTROL78/RET_STATE[9]_net_1\, \CONTROL78/un8_del_cntr\, 
        \CONTROL78/N_275\, \CONTROL78/SEQUENCER_STATE[8]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_ns[3]\, \CONTROL78/N_314\, 
        \CONTROL78/SEQUENCER_STATE_ns[4]\, 
        \CONTROL78/SEQUENCER_STATE_ns[5]\, \CONTROL78/N_302\, 
        \CONTROL78/SEQUENCER_STATE_maj_RNIMVRO[5]_net_1\, 
        \CONTROL78/N_222\, 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN0SO[6]_net_1\, 
        \CONTROL78/SEQUENCER_STATE[7]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_maj_RNIO1SO[5]_net_1\, 
        \CONTROL78/N_DEL_CNTR[14]\, \CONTROL78/N_225\, 
        \CONTROL78/I_58_2\, \CONTROL78/N_DEL_CNTR[13]\, 
        \CONTROL78/I_60_2\, \CONTROL78/N_DEL_CNTR[12]\, 
        \CONTROL78/I_50_2\, \CONTROL78/N_DEL_CNTR[11]\, 
        \CONTROL78/I_48_2\, \CONTROL78/N_DEL_CNTR[10]\, 
        \CONTROL78/I_54_2\, \CONTROL78/N_DEL_CNTR[9]\, 
        \CONTROL78/I_55_2\, \CONTROL78/N_DEL_CNTR[8]\, 
        \CONTROL78/I_57_2\, \CONTROL78/N_DEL_CNTR[7]\, 
        \CONTROL78/I_59_2\, \CONTROL78/N_DEL_CNTR[6]\, 
        \CONTROL78/I_49_2\, \CONTROL78/N_DEL_CNTR[5]\, 
        \CONTROL78/I_62_2\, \CONTROL78/N_DEL_CNTR[4]\, 
        \CONTROL78/I_53_2\, \CONTROL78/N_DEL_CNTR[3]\, 
        \CONTROL78/I_51_2\, \CONTROL78/N_DEL_CNTR[2]\, 
        \CONTROL78/I_52_2\, \CONTROL78/N_DEL_CNTR[1]\, 
        \CONTROL78/I_56_2\, \CONTROL78/N_DEL_CNTR[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_partial_sum[0]\, 
        \CONTROL78/N_CH_VOSG_EN_7[1]\, 
        \CONTROL78/N_CH_VOSG_EN[1]\, \CONTROL78/N_312\, 
        \CONTROL78/N_CH_VOSG_EN_2_sqmuxa\, 
        \CONTROL78/N_CH_VOSG_EN[0]\, 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, 
        \CONTROL78/N_285\, \CONTROL78/N_291\, \CONTROL78/N_290\, 
        \CONTROL78/N_CH_IAUX_EN_1_sqmuxa\, 
        \CONTROL78/N_CH_MREG_EN_1_sqmuxa\, 
        \CONTROL78/RET_STATE_maj_RNIR4SO[9]_net_1\, 
        \CONTROL78/CH_VOSG_EN_maj_RNIL5HT1[1]_net_1\, 
        \CONTROL78/CH_VOSG_EN_maj_RNI7A7M1[0]_net_1\, 
        \CONTROL78/CH_MREG_EN_maj_RNIKHAC1[0]_net_1\, 
        \CONTROL78/CH_IAUX_EN_maj_RNIIO831[0]_net_1\, 
        \CONTROL78/RET_STATE_0[4]\, 
        \CONTROL78/RET_STATE_tmr2[4]_net_1\, 
        \CONTROL78/RET_STATE_tmr3[4]_net_1\, 
        \CONTROL78/RET_STATE_0[5]\, 
        \CONTROL78/RET_STATE_tmr2[5]_net_1\, 
        \CONTROL78/RET_STATE_tmr3[5]_net_1\, 
        \CONTROL78/RET_STATE_0[6]\, 
        \CONTROL78/RET_STATE_tmr2[6]_net_1\, 
        \CONTROL78/RET_STATE_tmr3[6]_net_1\, 
        \CONTROL78/RET_STATE_0[9]\, 
        \CONTROL78/RET_STATE_tmr2[9]_net_1\, 
        \CONTROL78/RET_STATE_tmr3[9]_net_1\, 
        \CONTROL78/CH_VOSG_EN[1]_net_1\, 
        \CONTROL78/CH_VOSG_EN_tmr2[1]_net_1\, 
        \CONTROL78/CH_VOSG_EN_tmr3[1]_net_1\, 
        \CONTROL78/CH_VOSG_EN[0]_net_1\, 
        \CONTROL78/CH_VOSG_EN_tmr2[0]_net_1\, 
        \CONTROL78/CH_VOSG_EN_tmr3[0]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_0[3]\, 
        \CONTROL78/SEQUENCER_STATE_tmr2[3]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_tmr3[3]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_0[4]\, 
        \CONTROL78/SEQUENCER_STATE_tmr2[4]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_tmr3[4]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_0[5]\, 
        \CONTROL78/SEQUENCER_STATE_tmr2[5]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_tmr3[5]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_0[6]\, 
        \CONTROL78/SEQUENCER_STATE_tmr2[6]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_tmr3[6]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_0[7]\, 
        \CONTROL78/SEQUENCER_STATE_tmr2[7]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_tmr3[7]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_0[8]\, 
        \CONTROL78/SEQUENCER_STATE_tmr2[8]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_tmr3[8]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_0[9]\, 
        \CONTROL78/SEQUENCER_STATE_tmr2[9]_net_1\, 
        \CONTROL78/SEQUENCER_STATE_tmr3[9]_net_1\, 
        \CONTROL78/CH_IAUX_EN[0]_net_1\, 
        \CONTROL78/CH_IAUX_EN_tmr2[0]_net_1\, 
        \CONTROL78/CH_IAUX_EN_tmr3[0]_net_1\, 
        \CONTROL78/CH_MREG_EN[0]_net_1\, 
        \CONTROL78/CH_MREG_EN_tmr2[0]_net_1\, 
        \CONTROL78/CH_MREG_EN_tmr3[0]_net_1\, 
        \CONTROL78/DEL_CNTR_0[14]\, 
        \CONTROL78/DEL_CNTR_tmr2[14]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[14]_net_1\, 
        \CONTROL78/DEL_CNTR_0[13]\, 
        \CONTROL78/DEL_CNTR_tmr2[13]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[13]_net_1\, 
        \CONTROL78/DEL_CNTR_0[12]\, 
        \CONTROL78/DEL_CNTR_tmr2[12]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[12]_net_1\, 
        \CONTROL78/DEL_CNTR_0[11]\, 
        \CONTROL78/DEL_CNTR_tmr2[11]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[11]_net_1\, 
        \CONTROL78/DEL_CNTR_0[10]\, 
        \CONTROL78/DEL_CNTR_tmr2[10]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[10]_net_1\, 
        \CONTROL78/DEL_CNTR_0[9]\, 
        \CONTROL78/DEL_CNTR_tmr2[9]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[9]_net_1\, 
        \CONTROL78/DEL_CNTR_0[8]\, 
        \CONTROL78/DEL_CNTR_tmr2[8]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[8]_net_1\, 
        \CONTROL78/DEL_CNTR_0[7]\, 
        \CONTROL78/DEL_CNTR_tmr2[7]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[7]_net_1\, 
        \CONTROL78/DEL_CNTR_0[6]\, 
        \CONTROL78/DEL_CNTR_tmr2[6]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[6]_net_1\, 
        \CONTROL78/DEL_CNTR_0[5]\, 
        \CONTROL78/DEL_CNTR_tmr2[5]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[5]_net_1\, 
        \CONTROL78/DEL_CNTR_0[4]\, 
        \CONTROL78/DEL_CNTR_tmr2[4]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[4]_net_1\, 
        \CONTROL78/DEL_CNTR_0[3]\, 
        \CONTROL78/DEL_CNTR_tmr2[3]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[3]_net_1\, 
        \CONTROL78/DEL_CNTR_0[2]\, 
        \CONTROL78/DEL_CNTR_tmr2[2]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[2]_net_1\, 
        \CONTROL78/DEL_CNTR_0[1]\, 
        \CONTROL78/DEL_CNTR_tmr2[1]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[1]_net_1\, 
        \CONTROL78/DEL_CNTR_0[0]\, 
        \CONTROL78/DEL_CNTR_tmr2[0]_net_1\, 
        \CONTROL78/DEL_CNTR_tmr3[0]_net_1\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_1_5[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_12[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_1_4[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_10[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_8[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_2_1[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_2[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_1_2[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_6[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_1[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_2[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_4[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_3[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_2[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_2_1[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_2[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_4[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_5[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_10[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_2_2[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_4[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_5[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_3[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_11_1[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_1[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_11[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_2[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_6[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_3[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_8[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_6[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_12[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_13[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_7[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_2[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_1[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_4[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_10[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_11_2[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_11[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_3[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_5[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_TMP[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_1[0]\, 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_9[0]\, 
        \UVL_34FUSE/N_23_i\, \UVL_34FUSE/FILT_OUT[6]_net_1\, 
        \UVL_34FUSE/FILT_OUT[7]_net_1\, \UVL_34FUSE/i10_mux\, 
        \UVL_34FUSE/i2_mux\, \UVL_34FUSE/FILT_OUT[2]_net_1\, 
        \UVL_34FUSE/FILT_OUT[0]_net_1\, 
        \UVL_34FUSE/FILT_OUT[1]_net_1\, \UVL_34FUSE/i4_mux\, 
        \UVL_34FUSE/FILT_OUT[3]_net_1\, \UVL_34FUSE/i6_mux\, 
        \UVL_34FUSE/FILT_OUT[4]_net_1\, \UVL_34FUSE/i8_mux\, 
        \UVL_34FUSE/FILT_OUT[5]_net_1\, 
        \UVL_34FUSE/FILT_OUT_maj_RNILTKFJ[7]_net_1\, 
        \UVL_34FUSE/i12_mux\, \UVL_34FUSE/N89\, 
        \UVL_34FUSE/FILT_OUT_maj_RNILTKFJ_0[7]_net_1\, 
        \UVL_34FUSE/SUM_IN_A[5]_net_1\, \UVL_34FUSE/N92\, 
        \UVL_34FUSE/n_sigout15lto7_2\, 
        \UVL_34FUSE/n_sigout15lto7_1\, 
        \UVL_34FUSE/n_sigout3lto6_1\, 
        \UVL_34FUSE/n_sigout3lto6_0\, \UVL_34FUSE/N_33_i\, 
        \UVL_34FUSE/N_31_i\, \UVL_34FUSE/N_29_i\, 
        \UVL_34FUSE/N_27_i\, 
        \UVL_34FUSE/THRESH_VAL_maj_RNICPJI5[1]_net_1\, 
        \UVL_34FUSE/THRESH_VAL[1]_net_1\, \UVL_34FUSE/n_sigout3\, 
        \UVL_34FUSE/N_113\, \UVL_34FUSE/THRESH_VAL_ns[0]\, 
        \UVL_34FUSE/THRESH_VAL[0]_net_1\, \UVL_34FUSE/N_93\, 
        \UVL_34FUSE/N_95\, \UVL_34FUSE/N_94\, 
        \UVL_34FUSE/SIGOUT_maj_RNIHDUN8_net_1\, \UVL_34FUSE/N_40\, 
        \UVL_34FUSE/SUM_IN_A[4]_net_1\, 
        \UVL_34FUSE/un2_n_filt_out0[28]\, 
        \UVL_34FUSE/ADD_4x4_fast_I6_Y_1\, 
        \UVL_34FUSE/SIG_IN_DEL_maj_RNIKR8E[0]_net_1\, 
        \UVL_34FUSE/SIG_IN_DEL[0]_net_1\, 
        \UVL_34FUSE/SIG_IN_DEL_maj_RNIKR8E_0[0]_net_1\, 
        \UVL_34FUSE/FILT_OUT_1[7]\, 
        \UVL_34FUSE/FILT_OUT_tmr2_1[7]\, 
        \UVL_34FUSE/FILT_OUT_tmr3_1[7]\, 
        \UVL_34FUSE/FILT_OUT_1[6]\, 
        \UVL_34FUSE/FILT_OUT_tmr2_1[6]\, 
        \UVL_34FUSE/FILT_OUT_tmr3_1[6]\, 
        \UVL_34FUSE/FILT_OUT_1[5]\, 
        \UVL_34FUSE/FILT_OUT_tmr2_1[5]\, 
        \UVL_34FUSE/FILT_OUT_tmr3_1[5]\, 
        \UVL_34FUSE/FILT_OUT_1[4]\, 
        \UVL_34FUSE/FILT_OUT_tmr2_1[4]\, 
        \UVL_34FUSE/FILT_OUT_tmr3_1[4]\, 
        \UVL_34FUSE/FILT_OUT_1[3]\, 
        \UVL_34FUSE/FILT_OUT_tmr2_1[3]\, 
        \UVL_34FUSE/FILT_OUT_tmr3_1[3]\, 
        \UVL_34FUSE/FILT_OUT_1[2]\, 
        \UVL_34FUSE/FILT_OUT_tmr2_1[2]\, 
        \UVL_34FUSE/FILT_OUT_tmr3_1[2]\, 
        \UVL_34FUSE/FILT_OUT_1[1]\, 
        \UVL_34FUSE/FILT_OUT_tmr2_1[1]\, 
        \UVL_34FUSE/FILT_OUT_tmr3_1[1]\, 
        \UVL_34FUSE/FILT_OUT_1[0]\, 
        \UVL_34FUSE/FILT_OUT_tmr2_1[0]\, 
        \UVL_34FUSE/FILT_OUT_tmr3_1[0]\, 
        \UVL_34FUSE/SUM_IN_A_1[5]\, 
        \UVL_34FUSE/SUM_IN_A_tmr2_1[5]\, 
        \UVL_34FUSE/SUM_IN_A_tmr3_1[5]\, 
        \UVL_34FUSE/SUM_IN_A_1[4]\, 
        \UVL_34FUSE/SUM_IN_A_tmr2_1[4]\, 
        \UVL_34FUSE/SUM_IN_A_tmr3_1[4]\, 
        \UVL_34FUSE/THRESH_VAL_1[1]\, 
        \UVL_34FUSE/THRESH_VAL_tmr2_1[1]\, 
        \UVL_34FUSE/THRESH_VAL_tmr3_1[1]\, 
        \UVL_34FUSE/THRESH_VAL_1[0]\, 
        \UVL_34FUSE/THRESH_VAL_tmr2_1[0]\, 
        \UVL_34FUSE/THRESH_VAL_tmr3_1[0]\, \UVL_34FUSE/SIGOUT_1\, 
        \UVL_34FUSE/SIGOUT_tmr2_1\, \UVL_34FUSE/SIGOUT_tmr3_1\, 
        \UVL_34FUSE/SIG_IN_DEL_1[0]\, 
        \UVL_34FUSE/SIG_IN_DEL_tmr2_1[0]\, 
        \UVL_34FUSE/SIG_IN_DEL_tmr3_1[0]\, \OVT_FS/SIGOUT_3\, 
        \OVT_FS/SIGOUT_tmr2_3\, \OVT_FS/SIGOUT_tmr3_3\, 
        \OVT_FS/N_23_i\, \OVT_FS/FILT_OUT[6]_net_1\, 
        \OVT_FS/FILT_OUT[7]_net_1\, \OVT_FS/i10_mux\, 
        \OVT_FS/i2_mux\, \OVT_FS/FILT_OUT[2]_net_1\, 
        \OVT_FS/FILT_OUT[0]_net_1\, \OVT_FS/FILT_OUT[1]_net_1\, 
        \OVT_FS/i4_mux\, \OVT_FS/FILT_OUT[3]_net_1\, 
        \OVT_FS/i6_mux\, \OVT_FS/FILT_OUT[4]_net_1\, 
        \OVT_FS/i8_mux\, \OVT_FS/FILT_OUT[5]_net_1\, 
        \OVT_FS/FILT_OUT_maj_RNITEJH4[7]_net_1\, \OVT_FS/i12_mux\, 
        \OVT_FS/N89\, \OVT_FS/FILT_OUT_maj_RNITEJH4_0[7]_net_1\, 
        \OVT_FS/SUM_IN_A[5]_net_1\, \OVT_FS/N92\, 
        \OVT_FS/n_sigout15lto7_2\, \OVT_FS/n_sigout15lto7_1\, 
        \OVT_FS/n_sigout3lto6_1\, \OVT_FS/n_sigout3lto6_0\, 
        \OVT_FS/N_33_i\, \OVT_FS/N_31_i\, \OVT_FS/N_29_i\, 
        \OVT_FS/N_27_i\, \OVT_FS/N_40\, 
        \OVT_FS/SUM_IN_A[4]_net_1\, \OVT_FS/un2_n_filt_out0[28]\, 
        \OVT_FS/n_sigout3\, \OVT_FS/SIGOUT_maj_RNILN142_net_1\, 
        \OVT_FS/N_93\, \OVT_FS/N_95\, 
        \OVT_FS/THRESH_VAL[1]_net_1\, 
        \OVT_FS/THRESH_VAL[0]_net_1\, \OVT_FS/N_113\, 
        \OVT_FS/THRESH_VAL_ns[0]\, 
        \OVT_FS/THRESH_VAL_maj_RNIOLGD1[1]_net_1\, 
        \OVT_FS/ADD_4x4_fast_I6_Y\, 
        \OVT_FS/SIG_IN_DEL_maj_RNIMR1A[0]_net_1\, 
        \OVT_FS/SIG_IN_DEL[0]_net_1\, 
        \OVT_FS/SIG_IN_DEL_maj_RNIMR1A_0[0]_net_1\, 
        \OVT_FS/FILT_OUT_3[7]\, \OVT_FS/FILT_OUT_tmr2_3[7]\, 
        \OVT_FS/FILT_OUT_tmr3_3[7]\, \OVT_FS/FILT_OUT_3[6]\, 
        \OVT_FS/FILT_OUT_tmr2_3[6]\, \OVT_FS/FILT_OUT_tmr3_3[6]\, 
        \OVT_FS/FILT_OUT_3[5]\, \OVT_FS/FILT_OUT_tmr2_3[5]\, 
        \OVT_FS/FILT_OUT_tmr3_3[5]\, \OVT_FS/FILT_OUT_3[4]\, 
        \OVT_FS/FILT_OUT_tmr2_3[4]\, \OVT_FS/FILT_OUT_tmr3_3[4]\, 
        \OVT_FS/FILT_OUT_3[3]\, \OVT_FS/FILT_OUT_tmr2_3[3]\, 
        \OVT_FS/FILT_OUT_tmr3_3[3]\, \OVT_FS/FILT_OUT_3[2]\, 
        \OVT_FS/FILT_OUT_tmr2_3[2]\, \OVT_FS/FILT_OUT_tmr3_3[2]\, 
        \OVT_FS/FILT_OUT_3[1]\, \OVT_FS/FILT_OUT_tmr2_3[1]\, 
        \OVT_FS/FILT_OUT_tmr3_3[1]\, \OVT_FS/FILT_OUT_3[0]\, 
        \OVT_FS/FILT_OUT_tmr2_3[0]\, \OVT_FS/FILT_OUT_tmr3_3[0]\, 
        \OVT_FS/SUM_IN_A_3[5]\, \OVT_FS/SUM_IN_A_tmr2_3[5]\, 
        \OVT_FS/SUM_IN_A_tmr3_3[5]\, \OVT_FS/SUM_IN_A_3[4]\, 
        \OVT_FS/SUM_IN_A_tmr2_3[4]\, \OVT_FS/SUM_IN_A_tmr3_3[4]\, 
        \OVT_FS/THRESH_VAL_3[1]\, \OVT_FS/THRESH_VAL_tmr2_3[1]\, 
        \OVT_FS/THRESH_VAL_tmr3_3[1]\, \OVT_FS/THRESH_VAL_3[0]\, 
        \OVT_FS/THRESH_VAL_tmr2_3[0]\, 
        \OVT_FS/THRESH_VAL_tmr3_3[0]\, \OVT_FS/SIG_IN_DEL_3[0]\, 
        \OVT_FS/SIG_IN_DEL_tmr2_3[0]\, 
        \OVT_FS/SIG_IN_DEL_tmr3_3[0]\, 
        \P_CH_IAUX_EN_pad[5]/U0/NET1\, 
        \P_CH_IAUX_EN_pad[5]/U0/NET2\, 
        \P_CH_MREG_EN_pad[2]/U0/NET1\, 
        \P_CH_MREG_EN_pad[2]/U0/NET2\, 
        \P_CH_MREG_EN_pad[5]/U0/NET1\, 
        \P_CH_MREG_EN_pad[5]/U0/NET2\, \TEMP_OK_pad[0]/U0/NET1\, 
        \CH5_6_MS_CFG_EN_pad/U0/NET1\, 
        \POR_OUT_TO_SCA_pad/U0/NET1\, 
        \POR_OUT_TO_SCA_pad/U0/NET2\, 
        \P_CH_MREG_EN_pad[1]/U0/NET1\, 
        \P_CH_MREG_EN_pad[1]/U0/NET2\, 
        \P_CH_VOSG_EN_pad[7]/U0/NET1\, 
        \P_CH_VOSG_EN_pad[7]/U0/NET2\, \J11_19_TCONN_pad/U0/NET1\, 
        \J11_19_TCONN_pad/U0/NET2\, \P_CH_VOSG_EN_pad[4]/U0/NET1\, 
        \P_CH_VOSG_EN_pad[4]/U0/NET2\, 
        \P_CH_VOSG_EN_pad[3]/U0/NET1\, 
        \P_CH_VOSG_EN_pad[3]/U0/NET2\, 
        \MODE_DCYC_NORMB_pad/U0/NET1\, 
        \P_CH_IAUX_EN_pad[3]/U0/NET1\, 
        \P_CH_IAUX_EN_pad[3]/U0/NET2\, 
        \PRI_RX_EN_BAR_pad/U0/NET1\, \PRI_RX_EN_BAR_pad/U0/NET2\, 
        \P_CH_IAUX_EN_pad[0]/U0/NET1\, 
        \P_CH_IAUX_EN_pad[0]/U0/NET2\, \STDBY_OFFB_pad/U0/NET1\, 
        \FPGA_FUSE_7_8_OK_pad[0]/U0/NET1\, 
        \P_CH_MREG_EN_pad[7]/U0/NET1\, 
        \P_CH_MREG_EN_pad[7]/U0/NET2\, 
        \MAN_EN_CH_4TO1_pad/U0/NET1\, 
        \P_CH_IAUX_EN_pad[2]/U0/NET1\, 
        \P_CH_IAUX_EN_pad[2]/U0/NET2\, 
        \CH7_8_MS_CFG_EN_pad/U0/NET1\, 
        \CH1_2_MS_CFG_EN_pad/U0/NET1\, 
        \FPGA_FUSE_1_2_OK_pad[0]/U0/NET1\, 
        \MAN_EN_CH_8TO5_pad/U0/NET1\, 
        \FPGA_FUSE_5_6_OK_pad[0]/U0/NET1\, 
        \CH3_4_MS_CFG_EN_pad/U0/NET1\, \SCA_DAT_IN_pad/U0/NET1\, 
        \SCA_DAT_IN_pad/U0/NET2\, \J11_21_TCONN_pad/U0/NET1\, 
        \J11_21_TCONN_pad/U0/NET2\, \P_CH_IAUX_EN_pad[7]/U0/NET1\, 
        \P_CH_IAUX_EN_pad[7]/U0/NET2\, 
        \FPGA_FUSE_3_4_OK_pad[0]/U0/NET1\, 
        \P_CH_IAUX_EN_pad[4]/U0/NET1\, 
        \P_CH_IAUX_EN_pad[4]/U0/NET2\, \J11_17_TCONN_pad/U0/NET1\, 
        \J11_17_TCONN_pad/U0/NET2\, \J11_23_TCONN_pad/U0/NET1\, 
        \J11_23_TCONN_pad/U0/NET2\, \P_CH_VOSG_EN_pad[5]/U0/NET1\, 
        \P_CH_VOSG_EN_pad[5]/U0/NET2\, \PRI_TX_EN_pad/U0/NET1\, 
        \PRI_TX_EN_pad/U0/NET2\, \TX_FPGA_pad/U0/NET1\, 
        \TX_FPGA_pad/U0/NET2\, \P_CH_MREG_EN_pad[4]/U0/NET1\, 
        \P_CH_MREG_EN_pad[4]/U0/NET2\, 
        \P_CH_IAUX_EN_pad[6]/U0/NET1\, 
        \P_CH_IAUX_EN_pad[6]/U0/NET2\, 
        \P_CH_VOSG_EN_pad[1]/U0/NET1\, 
        \P_CH_VOSG_EN_pad[1]/U0/NET2\, 
        \P_CH_MREG_EN_pad[6]/U0/NET1\, 
        \P_CH_MREG_EN_pad[6]/U0/NET2\, 
        \P_CH_VOSG_EN_pad[0]/U0/NET1\, 
        \P_CH_VOSG_EN_pad[0]/U0/NET2\, 
        \P_CH_MREG_EN_pad[3]/U0/NET1\, 
        \P_CH_MREG_EN_pad[3]/U0/NET2\, 
        \P_CH_MREG_EN_pad[0]/U0/NET1\, 
        \P_CH_MREG_EN_pad[0]/U0/NET2\, \STATUS_LED_pad/U0/NET1\, 
        \STATUS_LED_pad/U0/NET2\, \P_CH_VOSG_EN_pad[6]/U0/NET1\, 
        \P_CH_VOSG_EN_pad[6]/U0/NET2\, 
        \BUF5M_J11_15_TCONN_pad/U0/NET1\, 
        \BUF5M_J11_15_TCONN_pad/U0/NET2\, 
        \P_CH_IAUX_EN_pad[1]/U0/NET1\, 
        \P_CH_IAUX_EN_pad[1]/U0/NET2\, \POR_FPGA_pad/U0/NET1\, 
        \CLK40M_OSC_pad/U0/NET1\, \PWR_OK_LED_pad/U0/NET1\, 
        \PWR_OK_LED_pad/U0/NET2\, \P_CH_VOSG_EN_pad[2]/U0/NET1\, 
        \P_CH_VOSG_EN_pad[2]/U0/NET2\, \VCC\, \GND\, AFLSDF_VCC, 
        AFLSDF_GND : std_logic;
    signal GND_power_net1 : std_logic;
    signal VCC_power_net1 : std_logic;

begin 

    AFLSDF_GND <= GND_power_net1;
    \GND\ <= GND_power_net1;
    \VCC\ <= VCC_power_net1;
    AFLSDF_VCC <= VCC_power_net1;

    \UVL_78FUSE/THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \UVL_78FUSE/THRESH_VAL_maj_RNICCI93[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_78FUSE/THRESH_VAL_tmr2[1]_net_1\);
    
    \OVT_FS/FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => \OVT_FS/N_27_i\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/FILT_OUT_tmr3_3[3]\);
    
    \CONTROL12/DEL_CNTR_tmr3[14]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[14]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[14]\);
    
    \CONTROL56/un1_DEL_CNTR_I_9\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[10]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_10[0]\);
    
    \UVL_34FUSE/FILT_OUT_maj[2]\ : MAJ3
      port map(A => \UVL_34FUSE/FILT_OUT_1[2]\, B => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[2]\, C => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[2]\, Y => 
        \UVL_34FUSE/FILT_OUT[2]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_27\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[11]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_10[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_76\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_2[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_11[0]\);
    
    \CONTROL56/DEL_CNTR_tmr2[7]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[7]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[7]\);
    
    \UVL_78FUSE/SIG_IN_DEL[0]\ : DFN1C0
      port map(D => \FPGA_FUSE_7_8_OK_c[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/SIG_IN_DEL_0[0]\);
    
    \UVL_34FUSE/SIG_IN_DEL_tmr2[0]\ : DFN1C0
      port map(D => \FPGA_FUSE_3_4_OK_c[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/SIG_IN_DEL_tmr2_1[0]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIU8GQ3[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_56_0\, Y => \CONTROL34/N_DEL_CNTR[1]\);
    
    \CONTROL34/DEL_CNTR_maj[13]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[13]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[13]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[13]\, Y => 
        \CONTROL34/DEL_CNTR[13]_net_1\);
    
    \POR_OUT_TO_SCA_pad/U0/U0\ : IOPAD_TRI
      port map(D => \POR_OUT_TO_SCA_pad/U0/NET1\, E => 
        \POR_OUT_TO_SCA_pad/U0/NET2\, PAD => POR_OUT_TO_SCA);
    
    \TX_PROMPT/CNT_VAL_maj_RNIIBM74_0[15]\ : AX1C
      port map(A => \TX_PROMPT/CNT_VAL[14]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c13\, C => 
        \TX_PROMPT/CNT_VAL[15]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL_n15_tz\);
    
    \CONTROL78/CH_VOSG_EN_maj_RNI7A7M1[0]\ : MX2
      port map(A => \CONTROL78/N_CH_VOSG_EN[0]\, B => 
        \P_CH_VOSG_EN_c[6]\, S => \CONTROL78/N_290\, Y => 
        \CONTROL78/CH_VOSG_EN_maj_RNI7A7M1[0]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNITA3LR[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_54_1\, Y => \CONTROL56/N_DEL_CNTR[10]\);
    
    \OVT_FS/FILT_OUT_maj[3]\ : MAJ3
      port map(A => \OVT_FS/FILT_OUT_3[3]\, B => 
        \OVT_FS/FILT_OUT_tmr2_3[3]\, C => 
        \OVT_FS/FILT_OUT_tmr3_3[3]\, Y => 
        \OVT_FS/FILT_OUT[3]_net_1\);
    
    \CONTROL34/DEL_CNTR_tmr3[6]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[6]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[6]\);
    
    \CONTROL34/CH_VOSG_EN_tmr2[1]\ : DFN1C0
      port map(D => \CONTROL34/CH_VOSG_EN_maj_RNIHBN23[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/CH_VOSG_EN_tmr2_1[1]\);
    
    \UVL_56FUSE/THRESH_VAL_maj_RNIS23U1[1]\ : OA1B
      port map(A => \UVL_56FUSE/n_sigout3\, B => 
        \UVL_56FUSE/THRESH_VAL[1]_net_1\, C => \UVL_56FUSE/N_113\, 
        Y => \UVL_56FUSE/THRESH_VAL_maj_RNIS23U1[1]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj[18]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[18]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[18]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[18]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[18]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI0PDS[8]\ : NOR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH5A6, C => 
        \CONTROL56/SEQUENCER_STATE[8]_net_1\, Y => 
        \CONTROL56/N_290\);
    
    \UVL_56FUSE/un1_tmp_sum_in_b_0_m26\ : XNOR3
      port map(A => \UVL_56FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_56FUSE/FILT_OUT[4]_net_1\, C => \UVL_56FUSE/i6_mux\, 
        Y => \UVL_56FUSE/N_27_i\);
    
    \BUF5M_J11_15_TCONN_pad/U0/U0\ : IOPAD_TRI
      port map(D => \BUF5M_J11_15_TCONN_pad/U0/NET1\, E => 
        \BUF5M_J11_15_TCONN_pad/U0/NET2\, PAD => 
        BUF5M_J11_15_TCONN);
    
    \CONTROL34/SEQUENCER_STATE_tmr2[5]\ : DFN1C0
      port map(D => \CONTROL34/SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[5]\);
    
    MAN_EN_CH_4TO1_B : DFN1C0
      port map(D => MAN_EN_CH_4TO1_B_17, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        MAN_EN_CH_4TO1_B_0);
    
    \CONTROL34/un1_DEL_CNTR_I_53\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[4]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_2[0]\, Y => 
        \CONTROL34/I_53_0\);
    
    \CONTROL56/DEL_CNTR[14]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[14]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[14]\);
    
    \UVL_12FUSE/FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => \UVL_12FUSE/N_29_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[2]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNI5FUBC[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_54_2\, Y => \CONTROL78/N_DEL_CNTR[10]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI6BQA1[5]\ : OR2
      port map(A => \CONTROL12/N_222\, B => 
        \CONTROL12/SEQUENCER_STATE[5]_net_1\, Y => 
        \CONTROL12/N_225\);
    
    \CONTROL56/RET_STATE_maj_RNIG88P4_0[4]\ : NOR3B
      port map(A => \CONTROL56/N_302\, B => \CONTROL56/N_298\, C
         => \CONTROL56/RET_STATE[4]_net_1\, Y => 
        \CONTROL56/SEQUENCER_STATE_ns[4]\);
    
    \UVL_12FUSE/un2_n_filt_out_0_ADD_4x4_fast_I0_CO1\ : XA1A
      port map(A => \UVL_12FUSE/i8_mux\, B => \UVL_12FUSE/N_40\, 
        C => \UVL_12FUSE/SUM_IN_A[4]_net_1\, Y => 
        \UVL_12FUSE/N92\);
    
    \MAN_EN_CH_4TO1_pad/U0/U0\ : IOPAD_IN
      port map(PAD => MAN_EN_CH_4TO1, Y => 
        \MAN_EN_CH_4TO1_pad/U0/NET1\);
    
    \CONTROL34/DEL_CNTR_maj[2]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[2]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[2]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[2]\, Y => 
        \CONTROL34/DEL_CNTR[2]_net_1\);
    
    \DTYCYC_CNT_tmr2[3]\ : DFN1C0
      port map(D => DTYCYC_CNT_22, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr2[3]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNICIQE[6]\ : NOR2A
      port map(A => \CONTROL34/RET_STATE[6]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE[6]_net_1\, Y => 
        \CONTROL34/RET_STATE_0_a3_0[6]\);
    
    \CONTROL12/un1_DEL_CNTR_I_58\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[14]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_11_2[0]\, Y => 
        \CONTROL12/I_58\);
    
    \TX_PROMPT/CNT_VAL_tmr3[16]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n16\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[16]_net_1\);
    
    \CONTROL12/SEQUENCER_STATE_tmr2[3]\ : DFN1C0
      port map(D => \CONTROL12/CH_ACTIVE_STAT_maj_RNIF8952_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/SEQUENCER_STATE_tmr2_2[3]\);
    
    \CONTROL12/DEL_CNTR_tmr3[11]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[11]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[11]\);
    
    \CONTROL12/CH_VOSG_EN_maj[1]\ : MAJ3
      port map(A => \CONTROL12/CH_VOSG_EN_2[1]\, B => 
        \CONTROL12/CH_VOSG_EN_tmr2_2[1]\, C => 
        \CONTROL12/CH_VOSG_EN_tmr3_2[1]\, Y => 
        \P_CH_VOSG_EN_c[1]\);
    
    \UVL_12FUSE/FILT_OUT_maj[3]\ : MAJ3
      port map(A => \UVL_12FUSE/FILT_OUT_2[3]\, B => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[3]\, C => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[3]\, Y => 
        \UVL_12FUSE/FILT_OUT[3]_net_1\);
    
    \UVL_34FUSE/THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \UVL_34FUSE/THRESH_VAL_1[0]\, B => 
        \UVL_34FUSE/THRESH_VAL_tmr2_1[0]\, C => 
        \UVL_34FUSE/THRESH_VAL_tmr3_1[0]\, Y => 
        \UVL_34FUSE/THRESH_VAL[0]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_22\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[9]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_8[0]\);
    
    \REGISTER_CH_CMD_CH[0]\ : DFN1C0
      port map(D => \VAL_MAN_EN_CH_4TO1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \REGISTER_CH_CMD_CH_0[0]\);
    
    \CONTROL56/DEL_CNTR_maj[9]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[9]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[9]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[9]\, Y => 
        \CONTROL56/DEL_CNTR[9]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_12\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[9]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_9[0]\);
    
    \P_CH_VOSG_EN_pad[3]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_VOSG_EN_c[3]\, E => \VCC\, DOUT => 
        \P_CH_VOSG_EN_pad[3]/U0/NET1\, EOUT => 
        \P_CH_VOSG_EN_pad[3]/U0/NET2\);
    
    \CONTROL56/un1_DEL_CNTR_I_86\ : AND2
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_2[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_1[0]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNILJIKA[16]\ : XA1B
      port map(A => \TX_PROMPT/CNT_VAL[16]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c15\, C => \TX_PROMPT/un9_cnt_val\, Y
         => \TX_PROMPT/CNT_VAL_n16\);
    
    \CONTROL12/DEL_CNTR[0]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[0]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIRIF69[12]\ : XA1B
      port map(A => \TX_PROMPT/CNT_VAL_c11\, B => 
        \TX_PROMPT/CNT_VAL[12]_net_1\, C => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n12\);
    
    \CONTROL78/DEL_CNTR_maj[9]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[9]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[9]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[9]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[9]_net_1\);
    
    \CONTROL56/DEL_CNTR_tmr3[11]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[11]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[11]\);
    
    \UVL_56FUSE/FILT_OUT_maj[0]\ : MAJ3
      port map(A => \UVL_56FUSE/FILT_OUT_0[0]\, B => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[0]\, C => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[0]\, Y => 
        \UVL_56FUSE/FILT_OUT[0]_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIFCJN4[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_52_2\, Y => \CONTROL78/N_DEL_CNTR[2]\);
    
    \P_CH_IAUX_EN_pad[1]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_IAUX_EN_pad[1]/U0/NET1\, E => 
        \P_CH_IAUX_EN_pad[1]/U0/NET2\, PAD => P_CH_IAUX_EN(1));
    
    \UVL_34FUSE/FILT_OUT[1]\ : DFN1C0
      port map(D => \UVL_34FUSE/N_31_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_1[1]\);
    
    \CONTROL12/DEL_CNTR_maj_RNI0I7D[14]\ : NOR3
      port map(A => \CONTROL12/DEL_CNTR[3]_net_1\, B => 
        \CONTROL12/DEL_CNTR[14]_net_1\, C => 
        \CONTROL12/DEL_CNTR[13]_net_1\, Y => 
        \CONTROL12/un8_del_cntr_7\);
    
    \UVL_78FUSE/un1_tmp_sum_in_b_0_m30\ : XNOR3
      port map(A => \UVL_78FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_78FUSE/FILT_OUT[2]_net_1\, C => \UVL_78FUSE/i2_mux\, 
        Y => \UVL_78FUSE/N_31_i\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIN6I22[9]\ : NOR3C
      port map(A => \TX_PROMPT/CNT_m6_0_a2_4\, B => 
        \TX_PROMPT/CNT_m6_0_a2_5\, C => 
        \TX_PROMPT/CNT_VAL[9]_net_1\, Y => \TX_PROMPT/CNT_VAL_c9\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI61HT9[14]\ : XA1B
      port map(A => \TX_PROMPT/CNT_VAL_c13\, B => 
        \TX_PROMPT/CNT_VAL[14]_net_1\, C => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n14\);
    
    \CONTROL34/DTYCYC_CNT_n2_0_x2\ : AX1D
      port map(A => \DTYCYC_CNT[0]_net_1\, B => 
        \DTYCYC_CNT[1]_net_1\, C => \DTYCYC_CNT[2]_net_1\, Y => 
        \CONTROL34/N_17_i\);
    
    \MAN_EN_CH_8TO5_pad/U0/U1\ : IOIN_IB
      port map(YIN => \MAN_EN_CH_8TO5_pad/U0/NET1\, Y => 
        MAN_EN_CH_8TO5_c);
    
    \CONTROL78/SEQUENCER_STATE_maj[7]\ : MAJ3
      port map(A => \CONTROL78/SEQUENCER_STATE_0[7]\, B => 
        \CONTROL78/SEQUENCER_STATE_tmr2[7]_net_1\, C => 
        \CONTROL78/SEQUENCER_STATE_tmr3[7]_net_1\, Y => 
        \CONTROL78/SEQUENCER_STATE[7]_net_1\);
    
    \UVL_34FUSE/FILT_OUT_maj[7]\ : MAJ3
      port map(A => \UVL_34FUSE/FILT_OUT_1[7]\, B => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[7]\, C => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[7]\, Y => 
        \UVL_34FUSE/FILT_OUT[7]_net_1\);
    
    \TEMP_OK_pad[0]/U0/U0\ : IOPAD_IN
      port map(PAD => TEMP_OK(0), Y => \TEMP_OK_pad[0]/U0/NET1\);
    
    \CONTROL56/un1_DEL_CNTR_I_71\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_2[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12[0]\);
    
    \UVL_56FUSE/SIGOUT_maj\ : MAJ3
      port map(A => \UVL_56FUSE/SIGOUT_0\, B => 
        \UVL_56FUSE/SIGOUT_tmr2_0\, C => 
        \UVL_56FUSE/SIGOUT_tmr3_0\, Y => UVL_OK_CH5A6);
    
    \TX_PROMPT/CNT_VAL_maj[1]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[1]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[1]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[1]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[1]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIKM3O[6]\ : NOR2A
      port map(A => \CONTROL56/RET_STATE[6]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE[6]_net_1\, Y => 
        \CONTROL56/RET_STATE_0_a3_0[6]\);
    
    \OVT_FS/FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => \OVT_FS/ADD_4x4_fast_I6_Y\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/FILT_OUT_tmr3_3[5]\);
    
    \UVL_78FUSE/SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \UVL_78FUSE/SIG_IN_DEL_maj_RNI48TK[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_78FUSE/SUM_IN_A_tmr3[4]_net_1\);
    
    \TX_PROMPT/CNT_VAL_tmr2[6]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n6\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[6]_net_1\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI5JHS[6]\ : OR2
      port map(A => \CONTROL12/SEQUENCER_STATE[6]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL12/N_222\);
    
    \UVL_78FUSE/FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => \UVL_78FUSE/FILT_OUT_maj_RNIL726C_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_78FUSE/FILT_OUT_tmr2[7]_net_1\);
    
    \CONTROL34/RET_STATE_maj_RNIUBV13[9]\ : NOR3B
      port map(A => \CONTROL34/N_290\, B => 
        \CONTROL34/un8_del_cntr\, C => 
        \CONTROL34/RET_STATE[9]_net_1\, Y => \CONTROL34/N_302\);
    
    \UVL_34FUSE/FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => \UVL_34FUSE/FILT_OUT_maj_RNILTKFJ[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_34FUSE/FILT_OUT_tmr3_1[6]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIPFNB[8]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH7A8, C => 
        \CONTROL78/SEQUENCER_STATE[8]_net_1\, Y => 
        \CONTROL78/N_290\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIIBM74[15]\ : NOR3C
      port map(A => \TX_PROMPT/CNT_VAL[14]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c13\, C => 
        \TX_PROMPT/CNT_VAL[15]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL_c15\);
    
    \CONTROL78/DEL_CNTR_maj[10]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[10]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[10]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[10]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[10]_net_1\);
    
    \STATUS_LED_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => STATUS_LED_c_0, E => \VCC\, DOUT => 
        \STATUS_LED_pad/U0/NET1\, EOUT => 
        \STATUS_LED_pad/U0/NET2\);
    
    \CONTROL34/un1_DEL_CNTR_I_12\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[9]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_9[0]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI6U2I1[5]\ : OA1B
      port map(A => \CONTROL12/RET_STATE[4]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE[5]_net_1\, C => 
        \CONTROL12/N_222\, Y => 
        \CONTROL12/SEQUENCER_STATE_maj_RNI6U2I1[5]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_57\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[8]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_3[0]\, Y => 
        \CONTROL56/I_57_1\);
    
    \CH3_4_MS_CFG_EN_pad/U0/U0\ : IOPAD_IN
      port map(PAD => CH3_4_MS_CFG_EN, Y => 
        \CH3_4_MS_CFG_EN_pad/U0/NET1\);
    
    \CONTROL34/CH_VOSG_EN[0]\ : DFN1C0
      port map(D => \CONTROL34/CH_VOSG_EN_maj_RNIB8TL2[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/CH_VOSG_EN_1[0]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIF55P[4]\ : NOR2
      port map(A => \CONTROL56/SEQUENCER_STATE[4]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE[3]_net_1\, Y => 
        \CONTROL56/N_230_0\);
    
    \CONTROL78/SEQUENCER_STATE_tmr2[4]\ : DFN1C0
      port map(D => \CONTROL78/SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr2[4]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_ns_i_a2_6[0]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH5A6, C => 
        \STDBY_OFFB_B\, Y => \CONTROL56/N_309\);
    
    \CONTROL12/DEL_CNTR_tmr3[9]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[9]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[9]\);
    
    \CONTROL12/CH_MREG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CONTROL12/CH_MREG_EN_maj_RNIUVMI3[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/CH_MREG_EN_tmr2_2[0]\);
    
    \UVL_12FUSE/un2_n_filt_out_0_ADD_4x4_fast_I6_Y\ : XOR3
      port map(A => \UVL_12FUSE/N_23_i\, B => 
        \UVL_12FUSE/SUM_IN_A[5]_net_1\, C => \UVL_12FUSE/N92\, Y
         => \UVL_12FUSE/ADD_4x4_fast_I6_Y_0\);
    
    \CONTROL34/SEQUENCER_STATE_maj[4]\ : MAJ3
      port map(A => \CONTROL34/SEQUENCER_STATE_1[4]\, B => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[4]\, C => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[4]\, Y => 
        \CONTROL34/SEQUENCER_STATE[4]_net_1\);
    
    \OVT_FS/SIG_IN_DEL_maj_RNIMR1A[0]\ : XOR2
      port map(A => \TEMP_OK_c[0]\, B => 
        \OVT_FS/SIG_IN_DEL[0]_net_1\, Y => 
        \OVT_FS/SIG_IN_DEL_maj_RNIMR1A[0]_net_1\);
    
    \CONTROL34/MAN_EN_CH_4TO1_A_14\ : MX2
      port map(A => \MAN_EN_CH_4TO1_A\, B => MAN_EN_CH_4TO1_c, S
         => N_23_i_c, Y => MAN_EN_CH_4TO1_A_14);
    
    \OVT_FS/SUM_IN_A[5]\ : DFN1C0
      port map(D => \OVT_FS/SIG_IN_DEL_maj_RNIMR1A_0[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \OVT_FS/SUM_IN_A_3[5]\);
    
    \UVL_12FUSE/THRESH_VAL_maj_RNIU7I32_0[1]\ : AOI1B
      port map(A => \UVL_12FUSE/n_sigout15lto7_2\, B => 
        \UVL_12FUSE/n_sigout15lto7_1\, C => 
        \UVL_12FUSE/THRESH_VAL[1]_net_1\, Y => \UVL_12FUSE/N_95\);
    
    \CONTROL12/un1_DEL_CNTR_I_56\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[1]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_TMP[0]\, Y => \CONTROL12/I_56\);
    
    VAL_MAN_EN_CH_4TO1 : DFN1C0
      port map(D => \DEBOUNCE.man_en_ch_4to1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        VAL_MAN_EN_CH_4TO1_0);
    
    \CONTROL78/RET_STATE_maj_RNIRDAR[5]\ : OR2
      port map(A => \CONTROL78/RET_STATE[5]_net_1\, B => 
        \CONTROL78/RET_STATE[6]_net_1\, Y => \CONTROL78/N_221\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNILRJQG[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_49_1\, Y => \CONTROL56/N_DEL_CNTR[6]\);
    
    \CONTROL34/DEL_CNTR[3]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[3]\);
    
    \CONTROL12/un1_DEL_CNTR_I_6\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[3]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_3[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_9\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[10]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_10[0]\);
    
    \CONTROL78/DEL_CNTR_tmr2[5]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[5]_net_1\);
    
    \CONTROL34/DTYCYC_CNT_24\ : MX2
      port map(A => \CONTROL34/N_8\, B => \DTYCYC_CNT[1]_net_1\, 
        S => \CONTROL34/N_DTYCYC_CNT_2_sqmuxa\, Y => 
        DTYCYC_CNT_24);
    
    \CONTROL78/un1_DEL_CNTR_I_66\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_2[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_0_2[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_3[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_1[0]\);
    
    \TX_PROMPT/CNT_VAL_tmr3[17]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n17\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[17]_net_1\);
    
    \CONTROL34/DEL_CNTR[9]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[9]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[9]\);
    
    \CONTROL34/RET_STATE_tmr2[9]\ : DFN1P0
      port map(D => \CONTROL34/RET_STATE_maj_RNIR3MP[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/RET_STATE_tmr2_1[9]\);
    
    \CONTROL34/DTYCYC_CNT_n4_i_o2_0\ : OR3
      port map(A => \DTYCYC_CNT[0]_net_1\, B => 
        \DTYCYC_CNT[1]_net_1\, C => \DTYCYC_CNT[2]_net_1\, Y => 
        \CONTROL34/N_15\);
    
    \CONTROL56/un1_DEL_CNTR_I_82\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_4[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_0_4[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_5[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_2[0]\);
    
    \UVL_56FUSE/THRESH_VAL_maj_RNIEH1V_0[1]\ : AOI1B
      port map(A => \UVL_56FUSE/n_sigout15lto7_2\, B => 
        \UVL_56FUSE/n_sigout15lto7_1\, C => 
        \UVL_56FUSE/THRESH_VAL[1]_net_1\, Y => \UVL_56FUSE/N_95\);
    
    \CONTROL56/SEQUENCER_STATE_tmr2[6]\ : DFN1C0
      port map(D => \CONTROL56/SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[6]\);
    
    \CONTROL56/DEL_CNTR_tmr3[8]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[8]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[8]\);
    
    \CONTROL34/DTYCYC_CNT_n3_0\ : XO1
      port map(A => \CONTROL34/N_15\, B => \DTYCYC_CNT[3]_net_1\, 
        C => \CONTROL34/un1_mode_dcyc_normb_1\, Y => 
        \CONTROL34/N_65\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI7TUQ8[11]\ : NOR2A
      port map(A => \TX_PROMPT/CNT_VAL_n11_tz\, B => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n11\);
    
    \CONTROL56/DEL_CNTR_maj[12]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[12]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[12]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[12]\, Y => 
        \CONTROL56/DEL_CNTR[12]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIT7A29[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_49_0\, Y => \CONTROL34/N_DEL_CNTR[6]\);
    
    \CONTROL12/un1_DEL_CNTR_I_59\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[7]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_2[0]\, Y => 
        \CONTROL12/I_59\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIF0TT7[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_52\, Y => \CONTROL12/N_DEL_CNTR[2]\);
    
    \CONTROL78/CH_VOSG_EN[1]\ : DFN1C0
      port map(D => \CONTROL78/CH_VOSG_EN_maj_RNIL5HT1[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/CH_VOSG_EN[1]_net_1\);
    
    \P_CH_VOSG_EN_pad[1]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_VOSG_EN_c[1]\, E => \VCC\, DOUT => 
        \P_CH_VOSG_EN_pad[1]/U0/NET1\, EOUT => 
        \P_CH_VOSG_EN_pad[1]/U0/NET2\);
    
    \UVL_78FUSE/un1_tmp_sum_in_b_0_m16\ : AO18
      port map(A => \UVL_78FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_78FUSE/i8_mux\, C => \UVL_78FUSE/FILT_OUT[6]_net_1\, 
        Y => \UVL_78FUSE/i10_mux\);
    
    \CONTROL78/RET_STATE_maj[9]\ : MAJ3
      port map(A => \CONTROL78/RET_STATE_0[9]\, B => 
        \CONTROL78/RET_STATE_tmr2[9]_net_1\, C => 
        \CONTROL78/RET_STATE_tmr3[9]_net_1\, Y => 
        \CONTROL78/RET_STATE[9]_net_1\);
    
    \UVL_12FUSE/FILT_OUT[0]\ : DFN1C0
      port map(D => \UVL_12FUSE/N_33_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_2[0]\);
    
    \CONTROL12/CH_ACTIVE_STAT_tmr2\ : DFN1C0
      port map(D => \REGISTER_CH_CMD_CH[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/CH_ACTIVE_STAT_tmr2_0\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI4Q5RE[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_62\, Y => \CONTROL12/N_DEL_CNTR[5]\);
    
    VAL_MAN_EN_CH_8TO5_tmr3 : DFN1C0
      port map(D => \DEBOUNCE.man_en_ch_8to5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \VAL_MAN_EN_CH_8TO5_tmr3\);
    
    \CONTROL78/RET_STATE_maj[6]\ : MAJ3
      port map(A => \CONTROL78/RET_STATE_0[6]\, B => 
        \CONTROL78/RET_STATE_tmr2[6]_net_1\, C => 
        \CONTROL78/RET_STATE_tmr3[6]_net_1\, Y => 
        \CONTROL78/RET_STATE[6]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_65\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_12[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_5[0]\);
    
    \UVL_56FUSE/THRESH_VAL_maj_RNIR13U1[0]\ : AO1A
      port map(A => \UVL_56FUSE/n_sigout3\, B => 
        \UVL_56FUSE/THRESH_VAL[0]_net_1\, C => \UVL_56FUSE/N_113\, 
        Y => \UVL_56FUSE/THRESH_VAL_ns[0]\);
    
    \CONTROL12/DEL_CNTR_maj[12]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[12]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[12]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[12]\, Y => 
        \CONTROL12/DEL_CNTR[12]_net_1\);
    
    \OVT_FS/THRESH_VAL[0]\ : DFN1C0
      port map(D => \OVT_FS/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/THRESH_VAL_3[0]\);
    
    \CONTROL78/RET_STATE_tmr2[5]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN0SO[6]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/RET_STATE_tmr2[5]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_8\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[8]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_8[0]\);
    
    \CONTROL34/CH_MREG_EN_maj_RNISJUL1[0]\ : MX2
      port map(A => \CONTROL34/N_CH_MREG_EN_1_sqmuxa\, B => 
        \P_CH_MREG_EN_c_c[2]\, S => \CONTROL34/N_290\, Y => 
        \CONTROL34/CH_MREG_EN_maj_RNISJUL1[0]_net_1\);
    
    \UVL_78FUSE/FILT_OUT_maj_RNIVRNJ_0[4]\ : NOR2
      port map(A => \UVL_78FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_78FUSE/FILT_OUT[4]_net_1\, Y => 
        \UVL_78FUSE/n_sigout15lto7_1\);
    
    \CONTROL78/CH_MREG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CONTROL78/CH_MREG_EN_maj_RNIKHAC1[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/CH_MREG_EN_tmr3[0]_net_1\);
    
    \CONTROL56/MAIN_SEQUENCER.N_CH_VOSG_EN_7[1]\ : OR2A
      port map(A => \CONTROL56.MAIN_SEQUENCER.un3_n_ch_vosg_en\, 
        B => CH5_6_MS_CFG_EN_c, Y => 
        \CONTROL56/N_CH_VOSG_EN_7[1]\);
    
    \P_CH_IAUX_EN_pad[0]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_IAUX_EN_pad[0]/U0/NET1\, E => 
        \P_CH_IAUX_EN_pad[0]/U0/NET2\, PAD => P_CH_IAUX_EN(0));
    
    \TX_PROMPT/CNT_VAL_tmr3[2]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n2\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[2]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_tmr3[3]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIR2NF1[4]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[3]\);
    
    \CONTROL34/DEL_CNTR_tmr2[5]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[5]\);
    
    \CONTROL56/DEL_CNTR_maj_RNIFG7V[9]\ : NOR3A
      port map(A => \CONTROL56/un8_del_cntr_6\, B => 
        \CONTROL56/DEL_CNTR[9]_net_1\, C => 
        \CONTROL56/DEL_CNTR[10]_net_1\, Y => 
        \CONTROL56/un8_del_cntr_10\);
    
    \CONTROL34/un1_DEL_CNTR_I_51\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[3]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12[0]\, Y => 
        \CONTROL34/I_51_0\);
    
    \CONTROL56/un1_DEL_CNTR_I_77\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_1[0]\, B
         => \CONTROL56/DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_1[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_2[0]\);
    
    \CONTROL56/DEL_CNTR_tmr2[11]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[11]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[11]\);
    
    \CONTROL34/CH_VOSG_EN_maj[1]\ : MAJ3
      port map(A => \CONTROL34/CH_VOSG_EN_1[1]\, B => 
        \CONTROL34/CH_VOSG_EN_tmr2_1[1]\, C => 
        \CONTROL34/CH_VOSG_EN_tmr3_1[1]\, Y => 
        \P_CH_VOSG_EN_c[3]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNITA151[7]\ : NOR2A
      port map(A => \CONTROL56/N_312\, B => 
        \CONTROL56/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL56/N_CH_IAUX_EN_1_sqmuxa\);
    
    \CONTROL12/un1_DEL_CNTR_I_48\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[11]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_4[0]\, Y => 
        \CONTROL12/I_48\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI5K0QH[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_49\, Y => \CONTROL12/N_DEL_CNTR[6]\);
    
    \UVL_12FUSE/un1_tmp_sum_in_b_0_m26\ : XNOR3
      port map(A => \UVL_12FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_12FUSE/FILT_OUT[4]_net_1\, C => \UVL_12FUSE/i6_mux\, 
        Y => \UVL_12FUSE/N_27_i\);
    
    \P_CH_MREG_EN_pad[6]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_MREG_EN_c_c[6]\, E => \VCC\, DOUT => 
        \P_CH_MREG_EN_pad[6]/U0/NET1\, EOUT => 
        \P_CH_MREG_EN_pad[6]/U0/NET2\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNII3US2[3]\ : MX2
      port map(A => \CONTROL12/N_312\, B => 
        \CONTROL12/N_CH_VOSG_EN_7[1]\, S => 
        \CONTROL12/N_CH_VOSG_EN_2_sqmuxa\, Y => 
        \CONTROL12/N_CH_VOSG_EN[1]\);
    
    \CONTROL12/RET_STATE_maj_RNI8N1R3_0[4]\ : NOR3B
      port map(A => \CONTROL12/N_302\, B => \CONTROL12/N_298\, C
         => \CONTROL12/RET_STATE[4]_net_1\, Y => 
        \CONTROL12/SEQUENCER_STATE_ns[4]\);
    
    \CONTROL34/RET_STATE_maj_RNIDQ5U3_0[4]\ : NOR3B
      port map(A => \CONTROL34/N_302\, B => \CONTROL34/N_298\, C
         => \CONTROL34/RET_STATE[4]_net_1\, Y => 
        \CONTROL34/SEQUENCER_STATE_ns[4]\);
    
    \OVT_FS/un2_n_filt_out_0_ADD_4x4_fast_I0_CO1\ : XA1A
      port map(A => \OVT_FS/i8_mux\, B => \OVT_FS/N_40\, C => 
        \OVT_FS/SUM_IN_A[4]_net_1\, Y => \OVT_FS/N92\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIO0MP[5]\ : AO1A
      port map(A => \CONTROL34/SEQUENCER_STATE[5]_net_1\, B => 
        \CONTROL34/RET_STATE_0_a3_0[6]\, C => 
        \CONTROL34/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIO0MP[5]_net_1\);
    
    \CONTROL78/DEL_CNTR[6]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[6]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[6]\);
    
    \UVL_34FUSE/FILT_OUT[3]\ : DFN1C0
      port map(D => \UVL_34FUSE/N_27_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_1[3]\);
    
    \UVL_56FUSE/FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => \UVL_56FUSE/FILT_OUT_maj_RNILIRQ5[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_56FUSE/FILT_OUT_tmr2_0[6]\);
    
    \CONTROL34/N_DTYCYC_CNT_2_sqmuxa_0_a2\ : NOR2A
      port map(A => MODE_DCYC_NORMB_c, B => N_23_i_c, Y => 
        \CONTROL34/N_DTYCYC_CNT_2_sqmuxa\);
    
    \CONTROL34/un1_DEL_CNTR_I_70\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_4[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    \CH5_6_MS_CFG_EN_pad/U0/U1\ : IOIN_IB
      port map(YIN => \CH5_6_MS_CFG_EN_pad/U0/NET1\, Y => 
        CH5_6_MS_CFG_EN_c);
    
    \PWR_OK_LED_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => PWR_OK_LED_c, E => \VCC\, DOUT => 
        \PWR_OK_LED_pad/U0/NET1\, EOUT => 
        \PWR_OK_LED_pad/U0/NET2\);
    
    \CONTROL78/un1_DEL_CNTR_I_20\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[10]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_9[0]\);
    
    \CONTROL78/RET_STATE_maj_RNIGV726[4]\ : AO1
      port map(A => \CONTROL78/N_304\, B => \CONTROL78/N_302\, C
         => \CONTROL78/N_275\, Y => 
        \CONTROL78/SEQUENCER_STATE_ns[5]\);
    
    \UVL_34FUSE/THRESH_VAL_maj_RNIBOJI5[0]\ : AO1A
      port map(A => \UVL_34FUSE/n_sigout3\, B => 
        \UVL_34FUSE/THRESH_VAL[0]_net_1\, C => \UVL_34FUSE/N_113\, 
        Y => \UVL_34FUSE/THRESH_VAL_ns[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_75\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_11[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_6[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_2[0]\);
    
    \P_CH_VOSG_EN_pad[6]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_VOSG_EN_c[6]\, E => \VCC\, DOUT => 
        \P_CH_VOSG_EN_pad[6]/U0/NET1\, EOUT => 
        \P_CH_VOSG_EN_pad[6]/U0/NET2\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIQI2V4[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/DWACT_ADD_CI_0_partial_sum[0]\, Y => 
        \CONTROL12/N_DEL_CNTR[0]\);
    
    \UVL_12FUSE/FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => \UVL_12FUSE/FILT_OUT_maj_RNIL8E4D_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_12FUSE/FILT_OUT_tmr2_2[7]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI2LT38[9]\ : NOR2A
      port map(A => \TX_PROMPT/CNT_VAL_n9_tz\, B => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n9\);
    
    STDBY_OFFB_B : DFN1C0
      port map(D => STDBY_OFFB_B_19, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => STDBY_OFFB_B_0);
    
    \CONTROL34/DEL_CNTR_tmr3[0]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[0]\);
    
    \CONTROL12/RET_STATE[9]\ : DFN1P0
      port map(D => \CONTROL12/RET_STATE_maj_RNIB33I1[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/RET_STATE_2[9]\);
    
    \CONTROL34/RET_STATE_maj_RNIBLPI_1[5]\ : NOR2A
      port map(A => \CONTROL34/RET_STATE[5]_net_1\, B => 
        \CONTROL34/RET_STATE[6]_net_1\, Y => \CONTROL34/N_298\);
    
    \CONTROL78/DEL_CNTR[1]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[1]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[1]\);
    
    \CONTROL12/DEL_CNTR[10]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[10]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[10]\);
    
    \TX_PROMPT/CNT_VAL[1]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[1]\);
    
    \CONTROL12/DEL_CNTR_maj_RNIT95A[11]\ : NOR2
      port map(A => \CONTROL12/DEL_CNTR[12]_net_1\, B => 
        \CONTROL12/DEL_CNTR[11]_net_1\, Y => 
        \CONTROL12/un8_del_cntr_6\);
    
    \UVL_78FUSE/FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => \UVL_78FUSE/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_tmr3[4]_net_1\);
    
    \REFCNT_maj[1]\ : MAJ3
      port map(A => \REFCNT_0[1]\, B => \REFCNT_tmr2[1]_net_1\, C
         => \REFCNT_tmr3[1]_net_1\, Y => \REFCNT[1]_net_1\);
    
    \CONTROL34/DEL_CNTR_tmr3[3]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[3]\);
    
    \REGISTER_CH_CMD_CH_tmr3[0]\ : DFN1C0
      port map(D => \VAL_MAN_EN_CH_4TO1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \REGISTER_CH_CMD_CH_tmr3[0]_net_1\);
    
    \CONTROL78/DEL_CNTR_tmr2[10]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[10]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[10]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_25\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[12]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_11[0]\);
    
    \CONTROL78/DEL_CNTR_tmr3[12]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[12]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[12]_net_1\);
    
    \CONTROL56/DEL_CNTR_tmr2[2]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[2]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[2]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIAGQE[5]\ : NOR2A
      port map(A => \CONTROL34/RET_STATE[5]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE[5]_net_1\, Y => 
        \CONTROL34/RET_STATE_0_a3_0[5]\);
    
    \CONTROL34/DEL_CNTR[2]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[2]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[2]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI3P9D[1]\ : NOR2B
      port map(A => \TX_PROMPT/CNT_VAL[0]_net_1\, B => 
        \TX_PROMPT/CNT_VAL[1]_net_1\, Y => \TX_PROMPT/CNT_VAL_c1\);
    
    \UVL_78FUSE/FILT_OUT_maj_RNIVRNJ[4]\ : NOR2B
      port map(A => \UVL_78FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_78FUSE/FILT_OUT[4]_net_1\, Y => 
        \UVL_78FUSE/n_sigout3lto6_1\);
    
    \CONTROL56/DEL_CNTR_tmr3[10]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[10]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[10]\);
    
    \UVL_56FUSE/SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \UVL_56FUSE/SUM_IN_A_0[4]\, B => 
        \UVL_56FUSE/SUM_IN_A_tmr2_0[4]\, C => 
        \UVL_56FUSE/SUM_IN_A_tmr3_0[4]\, Y => 
        \UVL_56FUSE/SUM_IN_A[4]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_57\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[8]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_3[0]\, Y => 
        \CONTROL34/I_57_0\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNII6ANO[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_57\, Y => \CONTROL12/N_DEL_CNTR[8]\);
    
    \REGISTER_CH_CMD_CH_tmr3[4]\ : DFN1C0
      port map(D => \VAL_MAN_EN_CH_8TO5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \REGISTER_CH_CMD_CH_tmr3[4]_net_1\);
    
    \TX_PROMPT/CNT_VAL_tmr3[20]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n20\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[20]_net_1\);
    
    \TX_PROMPT/CNT_VAL[5]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[5]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIA57J4[16]\ : NOR2B
      port map(A => \TX_PROMPT/CNT_VAL_c15\, B => 
        \TX_PROMPT/CNT_VAL[16]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL_c16\);
    
    \CONTROL56/un1_DEL_CNTR_I_66\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_2[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_0_2[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_3[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_1[0]\);
    
    \CONTROL78/CH_VOSG_EN_maj[0]\ : MAJ3
      port map(A => \CONTROL78/CH_VOSG_EN[0]_net_1\, B => 
        \CONTROL78/CH_VOSG_EN_tmr2[0]_net_1\, C => 
        \CONTROL78/CH_VOSG_EN_tmr3[0]_net_1\, Y => 
        \P_CH_VOSG_EN_c[6]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIIBM74[12]\ : OA1A
      port map(A => \TX_PROMPT/CNT_VAL[12]_net_1\, B => 
        \TX_PROMPT/un9_cnt_vallt12\, C => 
        \TX_PROMPT/un9_cnt_vallto15_1\, Y => 
        \TX_PROMPT/un9_cnt_vallt17\);
    
    \OVT_FS/SIGOUT_maj_RNILN142\ : MX2
      port map(A => \OVT_FS/n_sigout3\, B => STATUS_LED_c, S => 
        \OVT_FS/N_93\, Y => \OVT_FS/SIGOUT_maj_RNILN142_net_1\);
    
    MAN_EN_CH_8TO5_A_maj : MAJ3
      port map(A => MAN_EN_CH_8TO5_A_0, B => 
        \MAN_EN_CH_8TO5_A_tmr2\, C => \MAN_EN_CH_8TO5_A_tmr3\, Y
         => \MAN_EN_CH_8TO5_A\);
    
    \CONTROL34/SEQUENCER_STATE_tmr3[5]\ : DFN1C0
      port map(D => \CONTROL34/SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[5]\);
    
    \UVL_78FUSE/SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => 
        \UVL_78FUSE/SIG_IN_DEL_maj_RNI48TK_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/SUM_IN_A_tmr3[5]_net_1\);
    
    \CONTROL12/SEQUENCER_STATE_tmr2[7]\ : DFN1C0
      port map(D => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIPRAE6[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[7]\);
    
    \CONTROL56/DEL_CNTR[6]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[6]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[6]\);
    
    \CONTROL56/DEL_CNTR_maj_RNID2MI[11]\ : NOR2
      port map(A => \CONTROL56/DEL_CNTR[12]_net_1\, B => 
        \CONTROL56/DEL_CNTR[11]_net_1\, Y => 
        \CONTROL56/un8_del_cntr_6\);
    
    \CONTROL78/un1_DEL_CNTR_I_86\ : AND2
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_2[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_1[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_7\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[2]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_2[0]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI2CHL[5]\ : NOR2A
      port map(A => \CONTROL12/RET_STATE[5]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE[5]_net_1\, Y => 
        \CONTROL12/RET_STATE_0_a3_0[5]\);
    
    \CONTROL56/DEL_CNTR_tmr3[6]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[6]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[6]\);
    
    \UVL_12FUSE/FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => \UVL_12FUSE/N_31_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[1]\);
    
    \REFCNT_tmr2[0]\ : DFN1C0
      port map(D => \REFCNT_i[0]\, CLK => CLK40M_OSC_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \REFCNT_tmr2[0]_net_1\);
    
    \OVT_FS/un1_tmp_sum_in_b_0_m30\ : XNOR3
      port map(A => \OVT_FS/FILT_OUT[3]_net_1\, B => 
        \OVT_FS/FILT_OUT[2]_net_1\, C => \OVT_FS/i2_mux\, Y => 
        \OVT_FS/N_31_i\);
    
    \CONTROL78/CH_IAUX_EN_maj[0]\ : MAJ3
      port map(A => \CONTROL78/CH_IAUX_EN[0]_net_1\, B => 
        \CONTROL78/CH_IAUX_EN_tmr2[0]_net_1\, C => 
        \CONTROL78/CH_IAUX_EN_tmr3[0]_net_1\, Y => 
        \P_CH_IAUX_EN_c_c[6]\);
    
    \UVL_56FUSE/un2_n_filt_out_0_ADD_4x4_fast_I0_S\ : XNOR3
      port map(A => \UVL_56FUSE/i8_mux\, B => \UVL_56FUSE/N_40\, 
        C => \UVL_56FUSE/SUM_IN_A[4]_net_1\, Y => 
        \UVL_56FUSE/un2_n_filt_out0[28]\);
    
    \TX_PROMPT/CNT_VAL_tmr3[14]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n14\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[14]_net_1\);
    
    \CONTROL12/DEL_CNTR_maj_RNI1L8C[0]\ : NOR3A
      port map(A => \CONTROL12/un8_del_cntr_4\, B => 
        \CONTROL12/DEL_CNTR[0]_net_1\, C => 
        \CONTROL12/DEL_CNTR[2]_net_1\, Y => 
        \CONTROL12/un8_del_cntr_9\);
    
    \UVL_78FUSE/FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => \UVL_78FUSE/N_27_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_tmr3[3]_net_1\);
    
    \UVL_12FUSE/SIGOUT_tmr2\ : DFN1C0
      port map(D => \UVL_12FUSE/SIGOUT_maj_RNIRH6C6_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/SIGOUT_tmr2_2\);
    
    \TX_PROMPT/CNT_VAL_tmr3[3]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n3\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[3]_net_1\);
    
    \P_CH_MREG_EN_pad[0]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_MREG_EN_c_c[0]\, E => \VCC\, DOUT => 
        \P_CH_MREG_EN_pad[0]/U0/NET1\, EOUT => 
        \P_CH_MREG_EN_pad[0]/U0/NET2\);
    
    \CONTROL56/un1_DEL_CNTR_I_24\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[2]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_1[0]\);
    
    \CONTROL34/SEQUENCER_STATE_tmr3[4]\ : DFN1C0
      port map(D => \CONTROL34/SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[4]\);
    
    \TX_PROMPT/CNT_VAL[13]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n13\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[13]\);
    
    \CONTROL34/DEL_CNTR_maj[0]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[0]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[0]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[0]\, Y => 
        \CONTROL34/DEL_CNTR[0]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_88\ : AND2
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_pog_array_1_2[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_2[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_83\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_2[0]\, B
         => \CONTROL56/DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_2_1[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_3[0]\);
    
    \TX_PROMPT/CNT_VAL[7]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n7\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[7]\);
    
    \CONTROL56/un1_DEL_CNTR_I_11\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[6]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_6[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_49\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[6]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_11[0]\, Y => 
        \CONTROL12/I_49\);
    
    \CONTROL56/SEQUENCER_STATE_maj[9]\ : MAJ3
      port map(A => \CONTROL56/SEQUENCER_STATE_0[9]\, B => 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[9]\, C => 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[9]\, Y => 
        \CONTROL56/SEQUENCER_STATE[9]_net_1\);
    
    \TX_PROMPT/CNT_VAL_tmr3[4]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n4\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[4]_net_1\);
    
    \UVL_34FUSE/FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => \UVL_34FUSE/N_29_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[2]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIOARGJ[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_60_0\, Y => \CONTROL34/N_DEL_CNTR[13]\);
    
    \CONTROL34/DEL_CNTR_maj_RNI7D86[3]\ : NOR2
      port map(A => \CONTROL34/DEL_CNTR[4]_net_1\, B => 
        \CONTROL34/DEL_CNTR[3]_net_1\, Y => 
        \CONTROL34/un8_del_cntr_2\);
    
    \CONTROL34/un1_DEL_CNTR_I_8\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[8]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_8[0]\);
    
    \CONTROL12/DEL_CNTR[7]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[7]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[7]\);
    
    \UVL_56FUSE/FILT_OUT_maj_RNILIRQ5_0[7]\ : AO13
      port map(A => \UVL_56FUSE/N89\, B => 
        \UVL_56FUSE/FILT_OUT[7]_net_1\, C => \UVL_56FUSE/i12_mux\, 
        Y => \UVL_56FUSE/FILT_OUT_maj_RNILIRQ5_0[7]_net_1\);
    
    \CONTROL78/DEL_CNTR_maj_RNI4UVP2[5]\ : NOR3C
      port map(A => \CONTROL78/un8_del_cntr_10\, B => 
        \CONTROL78/un8_del_cntr_9\, C => 
        \CONTROL78/un8_del_cntr_11\, Y => 
        \CONTROL78/un8_del_cntr\);
    
    \UVL_56FUSE/FILT_OUT[6]\ : DFN1C0
      port map(D => \UVL_56FUSE/FILT_OUT_maj_RNILIRQ5[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_56FUSE/FILT_OUT_0[6]\);
    
    \UVL_12FUSE/SIG_IN_DEL[0]\ : DFN1C0
      port map(D => \FPGA_FUSE_1_2_OK_c[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/SIG_IN_DEL_2[0]\);
    
    \OVT_FS/FILT_OUT_maj[1]\ : MAJ3
      port map(A => \OVT_FS/FILT_OUT_3[1]\, B => 
        \OVT_FS/FILT_OUT_tmr2_3[1]\, C => 
        \OVT_FS/FILT_OUT_tmr3_3[1]\, Y => 
        \OVT_FS/FILT_OUT[1]_net_1\);
    
    \CONTROL78/DEL_CNTR_tmr3[6]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[6]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[6]_net_1\);
    
    \CONTROL78/DEL_CNTR_maj[5]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[5]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[5]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[5]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[5]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_75\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_11[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_6[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_2[0]\);
    
    \CONTROL12/DEL_CNTR[3]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[3]\);
    
    \CONTROL56/un1_DEL_CNTR_I_55\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[9]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_3[0]\, Y => 
        \CONTROL56/I_55_1\);
    
    \UVL_78FUSE/FILT_OUT_maj[5]\ : MAJ3
      port map(A => \UVL_78FUSE/FILT_OUT_0[5]\, B => 
        \UVL_78FUSE/FILT_OUT_tmr2[5]_net_1\, C => 
        \UVL_78FUSE/FILT_OUT_tmr3[5]_net_1\, Y => 
        \UVL_78FUSE/FILT_OUT[5]_net_1\);
    
    \UVL_56FUSE/un1_tmp_sum_in_b_0_m22\ : XNOR3
      port map(A => \UVL_56FUSE/FILT_OUT[6]_net_1\, B => 
        \UVL_56FUSE/FILT_OUT[7]_net_1\, C => \UVL_56FUSE/i10_mux\, 
        Y => \UVL_56FUSE/N_23_i\);
    
    \UVL_34FUSE/THRESH_VAL_maj_RNIBOJI5_0[0]\ : AO1A
      port map(A => \UVL_34FUSE/n_sigout3\, B => 
        \UVL_34FUSE/THRESH_VAL[0]_net_1\, C => \UVL_34FUSE/N_95\, 
        Y => \UVL_34FUSE/N_93\);
    
    MAN_EN_CH_4TO1_B_maj : MAJ3
      port map(A => MAN_EN_CH_4TO1_B_0, B => 
        \MAN_EN_CH_4TO1_B_tmr2\, C => \MAN_EN_CH_4TO1_B_tmr3\, Y
         => \MAN_EN_CH_4TO1_B\);
    
    \CONTROL56/SEQUENCER_STATE[6]\ : DFN1C0
      port map(D => \CONTROL56/SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_0[6]\);
    
    \CONTROL78/un1_DEL_CNTR_I_56\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[1]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_TMP[0]\, Y => 
        \CONTROL78/I_56_2\);
    
    \UVL_12FUSE/THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \UVL_12FUSE/THRESH_VAL_maj_RNISF474[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_12FUSE/THRESH_VAL_tmr3_2[1]\);
    
    \CONTROL12/DEL_CNTR_tmr2[14]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[14]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[14]\);
    
    STDBY_OFFB_A_tmr3 : DFN1C0
      port map(D => STDBY_OFFB_A_16, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \STDBY_OFFB_A_tmr3\);
    
    \CONTROL78/SEQUENCER_STATE[4]\ : DFN1C0
      port map(D => \CONTROL78/SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_0[4]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNICBH5E[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_62_1\, Y => \CONTROL56/N_DEL_CNTR[5]\);
    
    DTYCYC_EN_tmr3 : DFN1C0
      port map(D => DTYCYC_EN_20, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_EN_tmr3\);
    
    \CONTROL34/DEL_CNTR_tmr2[6]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[6]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[6]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIHTJQ[8]\ : NOR3C
      port map(A => \TX_PROMPT/CNT_VAL[4]_net_1\, B => 
        \TX_PROMPT/CNT_VAL[8]_net_1\, C => \TX_PROMPT/CNT_VAL_c1\, 
        Y => \TX_PROMPT/CNT_m6_0_a2_4\);
    
    \CONTROL56/un1_DEL_CNTR_I_62\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[5]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_1[0]\, Y => 
        \CONTROL56/I_62_1\);
    
    \CONTROL12/DEL_CNTR[12]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[12]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[12]\);
    
    \TX_PROMPT/CNT_VAL_tmr2[20]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n20\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[20]_net_1\);
    
    \TX_PROMPT/CNT_VAL[6]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n6\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[6]\);
    
    \CONTROL34/CH_IAUX_EN[0]\ : DFN1C0
      port map(D => \CONTROL34/CH_IAUX_EN_maj_RNI2N6R1[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/CH_IAUX_EN_1[0]\);
    
    \CONTROL12/DEL_CNTR_tmr2[9]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[9]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[9]\);
    
    \TX_PROMPT/MS250_CLK_EN_SIG\ : DFN1C0
      port map(D => \TX_PROMPT/un9_cnt_val\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/MS250_CLK_EN_SIG_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNISQCH[6]\ : NOR2A
      port map(A => \CONTROL78/RET_STATE[6]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE[6]_net_1\, Y => 
        \CONTROL78/RET_STATE_0_a3_0[6]\);
    
    \UVL_56FUSE/SIGOUT\ : DFN1C0
      port map(D => \UVL_56FUSE/SIGOUT_maj_RNIBM6U2_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/SIGOUT_0\);
    
    \UVL_12FUSE/un1_tmp_sum_in_b_0_m10\ : AO18
      port map(A => \UVL_12FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_12FUSE/i4_mux\, C => \UVL_12FUSE/FILT_OUT[4]_net_1\, 
        Y => \UVL_12FUSE/i6_mux\);
    
    \CONTROL34/un1_DEL_CNTR_I_56\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[1]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_TMP[0]\, Y => 
        \CONTROL34/I_56_0\);
    
    \TX_PROMPT/CNT_VAL[14]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n14\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[14]\);
    
    \UVL_34FUSE/FILT_OUT[6]\ : DFN1C0
      port map(D => \UVL_34FUSE/FILT_OUT_maj_RNILTKFJ[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_34FUSE/FILT_OUT_1[6]\);
    
    \UVL_34FUSE/SIG_IN_DEL[0]\ : DFN1C0
      port map(D => \FPGA_FUSE_3_4_OK_c[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/SIG_IN_DEL_1[0]\);
    
    \UVL_12FUSE/FILT_OUT_maj_RNI7F8L[4]\ : NOR2B
      port map(A => \UVL_12FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_12FUSE/FILT_OUT[4]_net_1\, Y => 
        \UVL_12FUSE/n_sigout3lto6_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_21\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[13]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_12[0]\);
    
    \CONTROL12/DEL_CNTR_maj_RNIG23O1[0]\ : NOR3C
      port map(A => \CONTROL12/un8_del_cntr_10\, B => 
        \CONTROL12/un8_del_cntr_9\, C => 
        \CONTROL12/un8_del_cntr_11\, Y => 
        \CONTROL12/un8_del_cntr\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIE7LE6[1]\ : XA1B
      port map(A => \TX_PROMPT/CNT_VAL[0]_net_1\, B => 
        \TX_PROMPT/CNT_VAL[1]_net_1\, C => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n1\);
    
    \CONTROL56/DEL_CNTR_tmr3[0]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_11\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[6]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_6[0]\);
    
    \DTYCYC_CNT_maj[1]\ : MAJ3
      port map(A => \DTYCYC_CNT_0[1]\, B => 
        \DTYCYC_CNT_tmr2[1]_net_1\, C => 
        \DTYCYC_CNT_tmr3[1]_net_1\, Y => \DTYCYC_CNT[1]_net_1\);
    
    \CONTROL56/DEL_CNTR_tmr2[10]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[10]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[10]\);
    
    \UVL_12FUSE/FILT_OUT_maj_RNIL8E4D_0[7]\ : AO13
      port map(A => \UVL_12FUSE/N89\, B => 
        \UVL_12FUSE/FILT_OUT[7]_net_1\, C => \UVL_12FUSE/i12_mux\, 
        Y => \UVL_12FUSE/FILT_OUT_maj_RNIL8E4D_0[7]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_6\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[3]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_3[0]\);
    
    \UVL_78FUSE/THRESH_VAL_maj_RNICCI93[1]\ : OA1B
      port map(A => \UVL_78FUSE/THRESH_VAL[1]_net_1\, B => 
        \UVL_78FUSE/n_sigout3\, C => \UVL_78FUSE/N_113\, Y => 
        \UVL_78FUSE/THRESH_VAL_maj_RNICCI93[1]_net_1\);
    
    \CONTROL34/DEL_CNTR_tmr2[3]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[3]\);
    
    \CONTROL12/DEL_CNTR_tmr2[11]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[11]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[11]\);
    
    \CONTROL34/un1_DEL_CNTR_I_63\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_8[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_0_8[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_9[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_4[0]\);
    
    \CONTROL34/SEQUENCER_STATE_tmr3[7]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIQHEV5[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[7]\);
    
    \CONTROL12/un1_DEL_CNTR_I_87\ : AND2
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_6[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_1_2[0]\);
    
    \DTYCYC_CNT_tmr2[4]\ : DFN1P0
      port map(D => DTYCYC_CNT_21, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr2[4]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_54\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[10]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_11_1[0]\, Y => 
        \CONTROL56/I_54_1\);
    
    \CONTROL34/DEL_CNTR[4]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[4]\);
    
    \CONTROL34/RET_STATE[5]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNINVLP[6]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/RET_STATE_1[5]\);
    
    \CONTROL78/un1_DEL_CNTR_I_23\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[5]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_4[0]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIEN424[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_56_2\, Y => \CONTROL78/N_DEL_CNTR[1]\);
    
    \CONTROL34/un1_DEL_CNTR_I_42\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[0]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_partial_sum[0]\);
    
    \CONTROL78/DEL_CNTR[7]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[7]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[7]\);
    
    MAN_EN_CH_8TO5_B_maj : MAJ3
      port map(A => MAN_EN_CH_8TO5_B_0, B => 
        \MAN_EN_CH_8TO5_B_tmr2\, C => \MAN_EN_CH_8TO5_B_tmr3\, Y
         => \MAN_EN_CH_8TO5_B\);
    
    \CONTROL78/un1_DEL_CNTR_I_65\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_12[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_5[0]\);
    
    \CONTROL78/SEQUENCER_STATE_tmr3[3]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIRJR51[4]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr3[3]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_92\ : AND2
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_12[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_1_5[0]\);
    
    \UVL_34FUSE/SUM_IN_A[5]\ : DFN1C0
      port map(D => 
        \UVL_34FUSE/SIG_IN_DEL_maj_RNIKR8E_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/SUM_IN_A_1[5]\);
    
    \CONTROL56/un1_DEL_CNTR_I_30\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[1]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0[0]\);
    
    \UVL_12FUSE/SIGOUT_maj_RNIRH6C6\ : MX2
      port map(A => \UVL_12FUSE/n_sigout3\, B => UVL_OK_CH1A2, S
         => \UVL_12FUSE/N_93\, Y => 
        \UVL_12FUSE/SIGOUT_maj_RNIRH6C6_net_1\);
    
    \OVT_FS/un1_tmp_sum_in_b_0_m16\ : AO18
      port map(A => \OVT_FS/FILT_OUT[5]_net_1\, B => 
        \OVT_FS/i8_mux\, C => \OVT_FS/FILT_OUT[6]_net_1\, Y => 
        \OVT_FS/i10_mux\);
    
    \CONTROL78/RET_STATE_tmr3[6]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIO1SO[5]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/RET_STATE_tmr3[6]_net_1\);
    
    \UVL_78FUSE/FILT_OUT_maj[2]\ : MAJ3
      port map(A => \UVL_78FUSE/FILT_OUT_0[2]\, B => 
        \UVL_78FUSE/FILT_OUT_tmr2[2]_net_1\, C => 
        \UVL_78FUSE/FILT_OUT_tmr3[2]_net_1\, Y => 
        \UVL_78FUSE/FILT_OUT[2]_net_1\);
    
    \UVL_34FUSE/FILT_OUT_maj[6]\ : MAJ3
      port map(A => \UVL_34FUSE/FILT_OUT_1[6]\, B => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[6]\, C => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[6]\, Y => 
        \UVL_34FUSE/FILT_OUT[6]_net_1\);
    
    \OVT_FS/SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \OVT_FS/SIG_IN_DEL_maj_RNIMR1A[0]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/SUM_IN_A_tmr2_3[4]\);
    
    \UVL_56FUSE/FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => \UVL_56FUSE/N_27_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[3]\);
    
    \CONTROL78/un1_DEL_CNTR_I_17\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[13]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_13[0]\);
    
    \CONTROL12/CH_IAUX_EN_tmr3[0]\ : DFN1C0
      port map(D => \CONTROL12/CH_IAUX_EN_maj_RNI814V2[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/CH_IAUX_EN_tmr3_2[0]\);
    
    \P_CH_IAUX_EN_pad[3]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_IAUX_EN_c_c[2]\, E => \VCC\, DOUT => 
        \P_CH_IAUX_EN_pad[3]/U0/NET1\, EOUT => 
        \P_CH_IAUX_EN_pad[3]/U0/NET2\);
    
    \CONTROL56/un1_DEL_CNTR_I_17\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[13]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_13[0]\);
    
    \CONTROL34/RET_STATE_maj_RNIBLPI_0[5]\ : NOR2A
      port map(A => \CONTROL34/RET_STATE[6]_net_1\, B => 
        \CONTROL34/RET_STATE[5]_net_1\, Y => \CONTROL34/N_299\);
    
    \CONTROL78/DEL_CNTR_maj[13]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[13]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[13]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[13]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[13]_net_1\);
    
    \P_CH_VOSG_EN_pad[5]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_VOSG_EN_pad[5]/U0/NET1\, E => 
        \P_CH_VOSG_EN_pad[5]/U0/NET2\, PAD => P_CH_VOSG_EN(5));
    
    \CONTROL78/RET_STATE[5]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN0SO[6]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/RET_STATE_0[5]\);
    
    \CONTROL56/un1_DEL_CNTR_I_75\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_11[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_6[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_2[0]\);
    
    \CONTROL78/un1_DEL_CNTR_I_42\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[0]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_partial_sum[0]\);
    
    \CONTROL34/SEQUENCER_STATE_tmr3[8]\ : DFN1C0
      port map(D => \CONTROL34/N_315\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[8]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNICA086[0]\ : NOR2
      port map(A => \TX_PROMPT/CNT_VAL[0]_net_1\, B => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n0\);
    
    \CONTROL12/DEL_CNTR[13]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[13]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[13]\);
    
    \CONTROL12/DEL_CNTR[9]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[9]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[9]\);
    
    \CONTROL12/un1_DEL_CNTR_I_62\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[5]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_1[0]\, Y => 
        \CONTROL12/I_62\);
    
    \TX_PROMPT/CNT_VAL_tmr3[9]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n9\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[9]_net_1\);
    
    \UVL_56FUSE/FILT_OUT_maj[2]\ : MAJ3
      port map(A => \UVL_56FUSE/FILT_OUT_0[2]\, B => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[2]\, C => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[2]\, Y => 
        \UVL_56FUSE/FILT_OUT[2]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI375NB[19]\ : XA1B
      port map(A => \TX_PROMPT/CNT_VAL[19]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c18\, C => \TX_PROMPT/un9_cnt_val\, Y
         => \TX_PROMPT/CNT_VAL_n19\);
    
    \CONTROL34/DEL_CNTR_tmr3[14]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[14]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[14]\);
    
    \UVL_78FUSE/FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => \UVL_78FUSE/N_29_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_tmr2[2]_net_1\);
    
    \CONTROL34/DEL_CNTR_maj_RNI1786[0]\ : NOR2
      port map(A => \CONTROL34/DEL_CNTR[1]_net_1\, B => 
        \CONTROL34/DEL_CNTR[0]_net_1\, Y => 
        \CONTROL34/un8_del_cntr_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_92\ : AND2
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_12[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_1_5[0]\);
    
    \OVT_FS/SUM_IN_A[4]\ : DFN1C0
      port map(D => \OVT_FS/SIG_IN_DEL_maj_RNIMR1A[0]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/SUM_IN_A_3[4]\);
    
    \UVL_34FUSE/FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => \UVL_34FUSE/N_33_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[0]\);
    
    \TX_PROMPT/MS250_CLK_EN_SIG_tmr2\ : DFN1C0
      port map(D => \TX_PROMPT/un9_cnt_val\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/MS250_CLK_EN_SIG_tmr2_net_1\);
    
    \UVL_56FUSE/FILT_OUT_maj_RNISTUN[7]\ : AO1
      port map(A => \UVL_56FUSE/n_sigout3lto6_1\, B => 
        \UVL_56FUSE/n_sigout3lto6_0\, C => 
        \UVL_56FUSE/FILT_OUT[7]_net_1\, Y => 
        \UVL_56FUSE/n_sigout3\);
    
    \TX_PROMPT/CNT_VAL_maj[2]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[2]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[2]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[2]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[2]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_6\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[3]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_3[0]\);
    
    \OVT_FS/THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \OVT_FS/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/THRESH_VAL_tmr2_3[0]\);
    
    \DTYCYC_CNT_tmr3[0]\ : DFN1P0
      port map(D => DTYCYC_CNT_25, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr3[0]_net_1\);
    
    STDBY_OFFB_A_tmr2 : DFN1C0
      port map(D => STDBY_OFFB_A_16, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \STDBY_OFFB_A_tmr2\);
    
    \CONTROL78/SEQUENCER_STATE_tmr2[8]\ : DFN1C0
      port map(D => \CONTROL78/N_315\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr2[8]_net_1\);
    
    \REFCNT_tmr3[1]\ : DFN1C0
      port map(D => SUM1, CLK => CLK40M_OSC_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \REFCNT_tmr3[1]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_21\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[13]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_12[0]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNI5AF13[8]\ : AOI1
      port map(A => \CONTROL78/un8_del_cntr\, B => 
        \CONTROL78/SEQUENCER_STATE[8]_net_1\, C => 
        \CONTROL78/SEQUENCER_STATE[9]_net_1\, Y => 
        \CONTROL78/N_313\);
    
    \CONTROL78/CH_VOSG_EN_maj[1]\ : MAJ3
      port map(A => \CONTROL78/CH_VOSG_EN[1]_net_1\, B => 
        \CONTROL78/CH_VOSG_EN_tmr2[1]_net_1\, C => 
        \CONTROL78/CH_VOSG_EN_tmr3[1]_net_1\, Y => 
        \P_CH_VOSG_EN_c[7]\);
    
    \CONTROL56/DEL_CNTR[13]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[13]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[13]\);
    
    \CONTROL34/DTYCYC_CNT_22\ : MX2A
      port map(A => \CONTROL34/N_65\, B => \DTYCYC_CNT[3]_net_1\, 
        S => \CONTROL34/N_DTYCYC_CNT_2_sqmuxa\, Y => 
        DTYCYC_CNT_22);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIOECO8[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_59_2\, Y => \CONTROL78/N_DEL_CNTR[7]\);
    
    \UVL_78FUSE/FILT_OUT_maj[7]\ : MAJ3
      port map(A => \UVL_78FUSE/FILT_OUT_0[7]\, B => 
        \UVL_78FUSE/FILT_OUT_tmr2[7]_net_1\, C => 
        \UVL_78FUSE/FILT_OUT_tmr3[7]_net_1\, Y => 
        \UVL_78FUSE/FILT_OUT[7]_net_1\);
    
    \UVL_78FUSE/FILT_OUT_maj[3]\ : MAJ3
      port map(A => \UVL_78FUSE/FILT_OUT_0[3]\, B => 
        \UVL_78FUSE/FILT_OUT_tmr2[3]_net_1\, C => 
        \UVL_78FUSE/FILT_OUT_tmr3[3]_net_1\, Y => 
        \UVL_78FUSE/FILT_OUT[3]_net_1\);
    
    \UVL_12FUSE/SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \UVL_12FUSE/SIG_IN_DEL_maj_RNICLUI[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_12FUSE/SUM_IN_A_tmr2_2[4]\);
    
    \CONTROL56/DEL_CNTR_maj_RNIACC6[0]\ : NOR2
      port map(A => \CONTROL56/DEL_CNTR[2]_net_1\, B => 
        \CONTROL56/DEL_CNTR[0]_net_1\, Y => 
        \CONTROL56/un8_del_cntr_1\);
    
    \UVL_34FUSE/un1_tmp_sum_in_b_0_m22\ : XNOR3
      port map(A => \UVL_34FUSE/FILT_OUT[6]_net_1\, B => 
        \UVL_34FUSE/FILT_OUT[7]_net_1\, C => \UVL_34FUSE/i10_mux\, 
        Y => \UVL_34FUSE/N_23_i\);
    
    \UVL_34FUSE/SIGOUT_maj_RNIHDUN8\ : MX2
      port map(A => \UVL_34FUSE/N_94\, B => UVL_OK_CH3A4, S => 
        \UVL_34FUSE/N_93\, Y => 
        \UVL_34FUSE/SIGOUT_maj_RNIHDUN8_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_74\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_8[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_3[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_28\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[8]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_7[0]\);
    
    \CONTROL12/RET_STATE_maj_RNI39HE_1[5]\ : NOR2A
      port map(A => \CONTROL12/RET_STATE[5]_net_1\, B => 
        \CONTROL12/RET_STATE[6]_net_1\, Y => \CONTROL12/N_298\);
    
    \CONTROL34/STDBY_OFFB_A_16\ : MX2
      port map(A => \STDBY_OFFB_A\, B => STDBY_OFFB_c, S => 
        N_23_i_c, Y => STDBY_OFFB_A_16);
    
    \TX_PROMPT/CNT_VAL_maj[16]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[16]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[16]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[16]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[16]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_42\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[0]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_partial_sum[0]\);
    
    \CONTROL78/DEL_CNTR_tmr3[13]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[13]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[13]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIC4LB51[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_60_1\, Y => \CONTROL56/N_DEL_CNTR[13]\);
    
    \CONTROL56/RET_STATE_tmr2[6]\ : DFN1C0
      port map(D => 
        \CONTROL56/SEQUENCER_STATE_maj_RNI819H1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/RET_STATE_tmr2_0[6]\);
    
    \UVL_34FUSE/FILT_OUT_maj[0]\ : MAJ3
      port map(A => \UVL_34FUSE/FILT_OUT_1[0]\, B => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[0]\, C => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[0]\, Y => 
        \UVL_34FUSE/FILT_OUT[0]_net_1\);
    
    \TX_PROMPT/CNT_VAL_tmr3[10]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n10\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[10]_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIR9IGG[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_50_2\, Y => \CONTROL78/N_DEL_CNTR[12]\);
    
    \CONTROL56/un1_DEL_CNTR_I_68\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_1_5[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_6[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_11_2[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_63\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_8[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_0_8[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_9[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_4[0]\);
    
    \CONTROL78/un1_DEL_CNTR_I_76\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_2[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_11[0]\);
    
    \CONTROL78/un1_DEL_CNTR_I_49\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[6]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_11[0]\, Y => 
        \CONTROL78/I_49_2\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIISTAA1[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_58\, Y => \CONTROL12/N_DEL_CNTR[14]\);
    
    \TX_PROMPT/CNT_VAL[0]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n0\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[0]\);
    
    \CONTROL56/CH_VOSG_EN_maj_RNIQG1A3[0]\ : MX2
      port map(A => \CONTROL56/N_CH_VOSG_EN[0]\, B => 
        \P_CH_VOSG_EN_c[4]\, S => \CONTROL56/N_290\, Y => 
        \CONTROL56/CH_VOSG_EN_maj_RNIQG1A3[0]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_24\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[2]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_1[0]\);
    
    \UVL_34FUSE/THRESH_VAL_maj_RNIMS9P2[1]\ : NOR3C
      port map(A => \UVL_34FUSE/n_sigout15lto7_1\, B => 
        \UVL_34FUSE/n_sigout15lto7_2\, C => 
        \UVL_34FUSE/THRESH_VAL[1]_net_1\, Y => \UVL_34FUSE/N_113\);
    
    \OVT_FS/FILT_OUT[5]\ : DFN1C0
      port map(D => \OVT_FS/ADD_4x4_fast_I6_Y\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/FILT_OUT_3[5]\);
    
    \CONTROL34/un1_DEL_CNTR_I_29\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[4]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_3[0]\);
    
    \CONTROL34/DEL_CNTR[12]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[12]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[12]\);
    
    \UVL_78FUSE/un1_tmp_sum_in_b_0_m13\ : AO18
      port map(A => \UVL_78FUSE/FILT_OUT[4]_net_1\, B => 
        \UVL_78FUSE/i6_mux\, C => \UVL_78FUSE/FILT_OUT[5]_net_1\, 
        Y => \UVL_78FUSE/i8_mux\);
    
    \P_CH_VOSG_EN_pad[0]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_VOSG_EN_pad[0]/U0/NET1\, E => 
        \P_CH_VOSG_EN_pad[0]/U0/NET2\, PAD => P_CH_VOSG_EN(0));
    
    \CONTROL78/un1_DEL_CNTR_I_62\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[5]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_1[0]\, Y => 
        \CONTROL78/I_62_2\);
    
    \CONTROL56/DEL_CNTR_tmr3[7]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[7]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[7]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIHTBL2[3]\ : MX2
      port map(A => \CONTROL12/N_312\, B => 
        \CONTROL34.MAIN_SEQUENCER.N_CH_VOSG_EN_7_1[1]\, S => 
        \CONTROL12/N_CH_VOSG_EN_2_sqmuxa\, Y => 
        \CONTROL12/N_CH_VOSG_EN[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_5\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[7]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_7[0]\);
    
    \CONTROL34/DEL_CNTR[0]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[0]\);
    
    \CONTROL34/DEBOUNCE.man_en_ch_8to5\ : NOR3C
      port map(A => \MAN_EN_CH_8TO5_B\, B => MAN_EN_CH_8TO5_c, C
         => \MAN_EN_CH_8TO5_A\, Y => \DEBOUNCE.man_en_ch_8to5\);
    
    \REGISTER_CH_CMD_CH_maj[0]\ : MAJ3
      port map(A => \REGISTER_CH_CMD_CH_0[0]\, B => 
        \REGISTER_CH_CMD_CH_tmr2[0]_net_1\, C => 
        \REGISTER_CH_CMD_CH_tmr3[0]_net_1\, Y => 
        \REGISTER_CH_CMD_CH[0]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_85\ : AND2
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_4[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_1_1[0]\);
    
    \TX_PROMPT/CNT_VAL[9]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n9\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[9]\);
    
    \UVL_78FUSE/SUM_IN_A_maj[5]\ : MAJ3
      port map(A => \UVL_78FUSE/SUM_IN_A_0[5]\, B => 
        \UVL_78FUSE/SUM_IN_A_tmr2[5]_net_1\, C => 
        \UVL_78FUSE/SUM_IN_A_tmr3[5]_net_1\, Y => 
        \UVL_78FUSE/SUM_IN_A[5]_net_1\);
    
    \UVL_34FUSE/FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => \UVL_34FUSE/N_31_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[1]\);
    
    \CONTROL12/SEQUENCER_STATE_maj[3]\ : MAJ3
      port map(A => \CONTROL12/SEQUENCER_STATE_2[3]\, B => 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[3]\, C => 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[3]\, Y => 
        \CONTROL12/SEQUENCER_STATE[3]_net_1\);
    
    \J11_17_TCONN_pad/U0/U0\ : IOPAD_TRI
      port map(D => \J11_17_TCONN_pad/U0/NET1\, E => 
        \J11_17_TCONN_pad/U0/NET2\, PAD => J11_17_TCONN);
    
    \TX_PROMPT/CNT_VAL_tmr2[15]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n15\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[15]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIK8EF8[10]\ : XA1B
      port map(A => \TX_PROMPT/CNT_VAL_c9\, B => 
        \TX_PROMPT/CNT_VAL[10]_net_1\, C => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n10\);
    
    \CONTROL78/DEL_CNTR_maj[11]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[11]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[11]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[11]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[11]_net_1\);
    
    \OVT_FS/FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => \OVT_FS/FILT_OUT_maj_RNITEJH4[7]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/FILT_OUT_tmr2_3[6]\);
    
    \CONTROL34/RET_STATE_tmr2[6]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIO0MP[5]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/RET_STATE_tmr2_1[6]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI8AKBB[18]\ : XA1B
      port map(A => \TX_PROMPT/CNT_VAL[18]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c17\, C => \TX_PROMPT/un9_cnt_val\, Y
         => \TX_PROMPT/CNT_VAL_n18\);
    
    \OVT_FS/SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \OVT_FS/SUM_IN_A_3[4]\, B => 
        \OVT_FS/SUM_IN_A_tmr2_3[4]\, C => 
        \OVT_FS/SUM_IN_A_tmr3_3[4]\, Y => 
        \OVT_FS/SUM_IN_A[4]_net_1\);
    
    \UVL_56FUSE/FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => \UVL_56FUSE/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[4]\);
    
    \CONTROL56/RET_STATE[6]\ : DFN1C0
      port map(D => 
        \CONTROL56/SEQUENCER_STATE_maj_RNI819H1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/RET_STATE_0[6]\);
    
    MASTER_RST_B_tmr2 : DFN1C0
      port map(D => \DEL0_DEV_RST_B\, CLK => CLK40M_OSC_c, CLR
         => POR_FPGA_c, Q => \MASTER_RST_B_tmr2\);
    
    \CONTROL34/un1_DEL_CNTR_I_50\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[12]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_10[0]\, Y => 
        \CONTROL34/I_50_0\);
    
    \CONTROL78/DEL_CNTR_tmr2[12]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[12]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[12]_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_ns_i_0[2]\ : OR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH7A8, C => 
        \STDBY_OFFB_B\, Y => 
        \CONTROL78/SEQUENCER_STATE_ns_i_0[2]_net_1\);
    
    \CONTROL78/RET_STATE_tmr3[5]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN0SO[6]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/RET_STATE_tmr3[5]_net_1\);
    
    \CONTROL78/RET_STATE_maj_RNIAQCP[9]\ : NOR2A
      port map(A => \CONTROL78/N_290\, B => 
        \CONTROL78/RET_STATE[9]_net_1\, Y => \CONTROL78/N_291\);
    
    \CONTROL56/DEL_CNTR_maj_RNINPC6[7]\ : NOR2
      port map(A => \CONTROL56/DEL_CNTR[8]_net_1\, B => 
        \CONTROL56/DEL_CNTR[7]_net_1\, Y => 
        \CONTROL56/un8_del_cntr_4\);
    
    \CONTROL34/un1_DEL_CNTR_I_55\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[9]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_3[0]\, Y => 
        \CONTROL34/I_55_0\);
    
    \UVL_56FUSE/FILT_OUT_maj_RNINNI9_0[4]\ : NOR2
      port map(A => \UVL_56FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_56FUSE/FILT_OUT[4]_net_1\, Y => 
        \UVL_56FUSE/n_sigout15lto7_1\);
    
    \CONTROL34/DTYCYC_CNT_25\ : AXO6
      port map(A => \CONTROL34/un1_mode_dcyc_normb_1\, B => 
        \CONTROL34/N_DTYCYC_CNT_2_sqmuxa\, C => 
        \DTYCYC_CNT[0]_net_1\, Y => DTYCYC_CNT_25);
    
    \CONTROL56/DEL_CNTR_maj[13]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[13]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[13]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[13]\, Y => 
        \CONTROL56/DEL_CNTR[13]_net_1\);
    
    \CONTROL56/CH_VOSG_EN_tmr3[1]\ : DFN1C0
      port map(D => \CONTROL56/CH_VOSG_EN_maj_RNI4G3C3[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/CH_VOSG_EN_tmr3_0[1]\);
    
    \CONTROL12/un1_DEL_CNTR_I_55\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[9]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_3[0]\, Y => 
        \CONTROL12/I_55\);
    
    \UVL_56FUSE/FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => \UVL_56FUSE/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[4]\);
    
    \UVL_34FUSE/THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \UVL_34FUSE/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/THRESH_VAL_tmr3_1[0]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI5RKG3[13]\ : NOR3C
      port map(A => \TX_PROMPT/CNT_VAL[12]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c11\, C => 
        \TX_PROMPT/CNT_VAL[13]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL_c13\);
    
    \UVL_12FUSE/SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \UVL_12FUSE/SUM_IN_A_2[4]\, B => 
        \UVL_12FUSE/SUM_IN_A_tmr2_2[4]\, C => 
        \UVL_12FUSE/SUM_IN_A_tmr3_2[4]\, Y => 
        \UVL_12FUSE/SUM_IN_A[4]_net_1\);
    
    \STDBY_OFFB_pad/U0/U0\ : IOPAD_IN
      port map(PAD => STDBY_OFFB, Y => \STDBY_OFFB_pad/U0/NET1\);
    
    \DTYCYC_CNT_tmr2[2]\ : DFN1C0
      port map(D => DTYCYC_CNT_23, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr2[2]_net_1\);
    
    \CONTROL12/RET_STATE_tmr2[6]\ : DFN1C0
      port map(D => 
        \CONTROL12/SEQUENCER_STATE_maj_RNI803I1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/RET_STATE_tmr2_2[6]\);
    
    \UVL_12FUSE/FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => \UVL_12FUSE/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[4]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIHGJQ[7]\ : NOR2A
      port map(A => \CONTROL34/N_312\, B => 
        \CONTROL34/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL34/N_CH_IAUX_EN_1_sqmuxa\);
    
    \OVT_FS/FILT_OUT[7]\ : DFN1C0
      port map(D => \OVT_FS/FILT_OUT_maj_RNITEJH4_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \OVT_FS/FILT_OUT_3[7]\);
    
    \CONTROL56/CH_ACTIVE_STAT_tmr3\ : DFN1C0
      port map(D => \REGISTER_CH_CMD_CH[4]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/CH_ACTIVE_STAT_tmr3_net_1\);
    
    \UVL_56FUSE/un1_tmp_sum_in_b_0_m32\ : AX1
      port map(A => \UVL_56FUSE/FILT_OUT[0]_net_1\, B => 
        \UVL_56FUSE/FILT_OUT[1]_net_1\, C => 
        \UVL_56FUSE/FILT_OUT[2]_net_1\, Y => \UVL_56FUSE/N_33_i\);
    
    \UVL_56FUSE/FILT_OUT_maj[6]\ : MAJ3
      port map(A => \UVL_56FUSE/FILT_OUT_0[6]\, B => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[6]\, C => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[6]\, Y => 
        \UVL_56FUSE/FILT_OUT[6]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_69\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_11_1[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_10[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_4[0]\);
    
    \CONTROL56/DEL_CNTR_tmr2[4]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[4]\);
    
    \CONTROL34/SEQUENCER_STATE[7]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIQHEV5[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_1[7]\);
    
    \CONTROL12/un1_DEL_CNTR_I_72\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_6[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_0_6[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_7[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_3[0]\);
    
    \CONTROL12/DEL_CNTR_tmr3[7]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[7]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[7]\);
    
    \P_CH_VOSG_EN_pad[4]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_VOSG_EN_pad[4]/U0/NET1\, E => 
        \P_CH_VOSG_EN_pad[4]/U0/NET2\, PAD => P_CH_VOSG_EN(4));
    
    \CONTROL78/un1_DEL_CNTR_I_55\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[9]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_3[0]\, Y => 
        \CONTROL78/I_55_2\);
    
    \CONTROL78/RET_STATE_maj_RNI7JV81_0[4]\ : NOR2A
      port map(A => \CONTROL78/RET_STATE[4]_net_1\, B => 
        \CONTROL78/N_221\, Y => \CONTROL78/N_304\);
    
    \CONTROL56/RET_STATE_tmr3[6]\ : DFN1C0
      port map(D => 
        \CONTROL56/SEQUENCER_STATE_maj_RNI819H1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/RET_STATE_tmr3_0[6]\);
    
    \CONTROL78/un1_DEL_CNTR_I_8\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[8]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_8[0]\);
    
    \UVL_12FUSE/un1_tmp_sum_in_b_0_m15\ : XOR2
      port map(A => \UVL_12FUSE/FILT_OUT[6]_net_1\, B => 
        \UVL_12FUSE/FILT_OUT[5]_net_1\, Y => \UVL_12FUSE/N_40\);
    
    \STATUS_LED_pad/U0/U0\ : IOPAD_TRI
      port map(D => \STATUS_LED_pad/U0/NET1\, E => 
        \STATUS_LED_pad/U0/NET2\, PAD => STATUS_LED);
    
    MAN_EN_CH_8TO5_A_tmr3 : DFN1C0
      port map(D => MAN_EN_CH_8TO5_A_15, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_8TO5_A_tmr3\);
    
    \CONTROL56/SEQUENCER_STATE_tmr3[8]\ : DFN1C0
      port map(D => \CONTROL56/N_315\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[8]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIG0S51[8]\ : NOR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH1A2, C => 
        \CONTROL12/SEQUENCER_STATE[8]_net_1\, Y => 
        \CONTROL12/N_290\);
    
    \CONTROL34/un1_DEL_CNTR_I_67\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_10[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_0_10[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_11[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_5[0]\);
    
    \CONTROL34/DEL_CNTR_tmr2[14]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[14]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[14]\);
    
    \CONTROL78/CH_VOSG_EN_maj_RNIL5HT1[1]\ : MX2
      port map(A => \CONTROL78/N_CH_VOSG_EN[1]\, B => 
        \P_CH_VOSG_EN_c[7]\, S => \CONTROL78/N_290\, Y => 
        \CONTROL78/CH_VOSG_EN_maj_RNIL5HT1[1]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIF81V7[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_52_1\, Y => \CONTROL56/N_DEL_CNTR[2]\);
    
    MAN_EN_CH_8TO5_B : DFN1C0
      port map(D => MAN_EN_CH_8TO5_B_18, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        MAN_EN_CH_8TO5_B_0);
    
    \CONTROL12/SEQUENCER_STATE_tmr3[7]\ : DFN1C0
      port map(D => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIPRAE6[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[7]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIADHK7[9]\ : NOR3
      port map(A => \CONTROL56/N_271\, B => 
        \CONTROL56/SEQUENCER_STATE_ns_i_1[2]\, C => 
        \CONTROL56/N_313\, Y => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIADHK7[9]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE[4]\ : DFN1C0
      port map(D => \CONTROL34/SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_1[4]\);
    
    \CONTROL56/SEQUENCER_STATE[9]\ : DFN1P0
      port map(D => \CONTROL56/RET_STATE_maj_RNI1MCD9[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/SEQUENCER_STATE_0[9]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI27I21[13]\ : NOR3
      port map(A => \TX_PROMPT/CNT_VAL[14]_net_1\, B => 
        \TX_PROMPT/CNT_VAL[13]_net_1\, C => 
        \TX_PROMPT/CNT_VAL[15]_net_1\, Y => 
        \TX_PROMPT/un9_cnt_vallto15_1\);
    
    \UVL_56FUSE/un1_tmp_sum_in_b_0_m7\ : AO18
      port map(A => \UVL_56FUSE/FILT_OUT[2]_net_1\, B => 
        \UVL_56FUSE/i2_mux\, C => \UVL_56FUSE/FILT_OUT[3]_net_1\, 
        Y => \UVL_56FUSE/i4_mux\);
    
    \OVT_FS/SIG_IN_DEL_maj[0]\ : MAJ3
      port map(A => \OVT_FS/SIG_IN_DEL_3[0]\, B => 
        \OVT_FS/SIG_IN_DEL_tmr2_3[0]\, C => 
        \OVT_FS/SIG_IN_DEL_tmr3_3[0]\, Y => 
        \OVT_FS/SIG_IN_DEL[0]_net_1\);
    
    \UVL_56FUSE/FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => \UVL_56FUSE/ADD_4x4_fast_I6_Y_2\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[5]\);
    
    \UVL_12FUSE/FILT_OUT_maj[6]\ : MAJ3
      port map(A => \UVL_12FUSE/FILT_OUT_2[6]\, B => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[6]\, C => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[6]\, Y => 
        \UVL_12FUSE/FILT_OUT[6]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_88\ : AND2
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_pog_array_1_2[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_2[0]\);
    
    \CONTROL34/SEQUENCER_STATE[9]\ : DFN1P0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI12OH7[8]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_1[9]\);
    
    \UVL_78FUSE/FILT_OUT_maj_RNIGOBH1[7]\ : AO1
      port map(A => \UVL_78FUSE/n_sigout3lto6_1\, B => 
        \UVL_78FUSE/n_sigout3lto6_0\, C => 
        \UVL_78FUSE/FILT_OUT[7]_net_1\, Y => 
        \UVL_78FUSE/n_sigout3\);
    
    \CONTROL56/un1_DEL_CNTR_I_26\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[6]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_5[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_18\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[1]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_1[0]\);
    
    \FPGA_FUSE_3_4_OK_pad[0]/U0/U0\ : IOPAD_IN
      port map(PAD => FPGA_FUSE_3_4_OK(0), Y => 
        \FPGA_FUSE_3_4_OK_pad[0]/U0/NET1\);
    
    \UVL_56FUSE/FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => \UVL_56FUSE/FILT_OUT_maj_RNILIRQ5[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_56FUSE/FILT_OUT_tmr3_0[6]\);
    
    \CONTROL78/un1_DEL_CNTR_I_28\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[8]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_7[0]\);
    
    \CONTROL34/DEL_CNTR[7]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[7]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[7]\);
    
    \UVL_78FUSE/un2_n_filt_out_0_ADD_4x4_fast_I0_CO1\ : XA1A
      port map(A => \UVL_78FUSE/i8_mux\, B => \UVL_78FUSE/N_40\, 
        C => \UVL_78FUSE/SUM_IN_A[4]_net_1\, Y => 
        \UVL_78FUSE/N92\);
    
    \UVL_12FUSE/SIG_IN_DEL_tmr3[0]\ : DFN1C0
      port map(D => \FPGA_FUSE_1_2_OK_c[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/SIG_IN_DEL_tmr3_2[0]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIA54A2[8]\ : OA1A
      port map(A => \CONTROL34/SEQUENCER_STATE[8]_net_1\, B => 
        \CONTROL34/N_246\, C => \CONTROL34/N_309\, Y => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIA54A2[8]_net_1\);
    
    \TX_PROMPT/CNT_VAL_tmr2[16]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n16\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[16]_net_1\);
    
    \UVL_78FUSE/SIGOUT_maj_RNI96K25\ : MX2
      port map(A => \UVL_78FUSE/N_94\, B => UVL_OK_CH7A8, S => 
        \UVL_78FUSE/N_93\, Y => 
        \UVL_78FUSE/SIGOUT_maj_RNI96K25_net_1\);
    
    \P_CH_MREG_EN_pad[7]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_MREG_EN_pad[7]/U0/NET1\, E => 
        \P_CH_MREG_EN_pad[7]/U0/NET2\, PAD => P_CH_MREG_EN(7));
    
    \CONTROL56/un1_DEL_CNTR_I_48\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[11]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_4[0]\, Y => 
        \CONTROL56/I_48_1\);
    
    \CONTROL12/DEL_CNTR_maj[2]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[2]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[2]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[2]\, Y => 
        \CONTROL12/DEL_CNTR[2]_net_1\);
    
    \UVL_56FUSE/FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => \UVL_56FUSE/N_29_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[2]\);
    
    \CONTROL78/un1_DEL_CNTR_I_10\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[4]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_4[0]\);
    
    \UVL_12FUSE/FILT_OUT_maj[2]\ : MAJ3
      port map(A => \UVL_12FUSE/FILT_OUT_2[2]\, B => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[2]\, C => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[2]\, Y => 
        \UVL_12FUSE/FILT_OUT[2]_net_1\);
    
    \CONTROL12/DEL_CNTR_tmr2[3]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[3]\);
    
    \FPGA_FUSE_3_4_OK_pad[0]/U0/U1\ : IOIN_IB
      port map(YIN => \FPGA_FUSE_3_4_OK_pad[0]/U0/NET1\, Y => 
        \FPGA_FUSE_3_4_OK_c[0]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIP88D6[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_53_2\, Y => \CONTROL78/N_DEL_CNTR[4]\);
    
    \CONTROL78/DEL_CNTR[9]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[9]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[9]\);
    
    \UVL_56FUSE/un1_tmp_sum_in_b_0_m4\ : OAI1
      port map(A => \UVL_56FUSE/FILT_OUT[2]_net_1\, B => 
        \UVL_56FUSE/FILT_OUT[0]_net_1\, C => 
        \UVL_56FUSE/FILT_OUT[1]_net_1\, Y => \UVL_56FUSE/i2_mux\);
    
    \CONTROL78/CH_VOSG_EN_tmr3[1]\ : DFN1C0
      port map(D => \CONTROL78/CH_VOSG_EN_maj_RNIL5HT1[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/CH_VOSG_EN_tmr3[1]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_5\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[7]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_7[0]\);
    
    \CONTROL78/DEL_CNTR_maj[7]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[7]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[7]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[7]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[7]_net_1\);
    
    \UVL_34FUSE/THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \UVL_34FUSE/THRESH_VAL_1[1]\, B => 
        \UVL_34FUSE/THRESH_VAL_tmr2_1[1]\, C => 
        \UVL_34FUSE/THRESH_VAL_tmr3_1[1]\, Y => 
        \UVL_34FUSE/THRESH_VAL[1]_net_1\);
    
    \UVL_12FUSE/un1_tmp_sum_in_b_0_m32\ : AX1
      port map(A => \UVL_12FUSE/FILT_OUT[0]_net_1\, B => 
        \UVL_12FUSE/FILT_OUT[1]_net_1\, C => 
        \UVL_12FUSE/FILT_OUT[2]_net_1\, Y => \UVL_12FUSE/N_33_i\);
    
    \CONTROL56/DEL_CNTR_maj[3]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[3]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[3]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[3]\, Y => 
        \CONTROL56/DEL_CNTR[3]_net_1\);
    
    \TX_PROMPT/CNT_VAL_tmr3[13]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n13\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[13]_net_1\);
    
    \CONTROL56/DEL_CNTR_maj[7]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[7]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[7]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[7]\, Y => 
        \CONTROL56/DEL_CNTR[7]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_7\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[2]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_2[0]\);
    
    \CONTROL12/RET_STATE_maj_RNIGJ2Q8[9]\ : NOR3
      port map(A => \CONTROL12/N_315\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIIGAE2[8]_net_1\, C => 
        \CONTROL12/N_266\, Y => 
        \CONTROL12/RET_STATE_maj_RNIGJ2Q8[9]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_24\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[2]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_1[0]\);
    
    \CONTROL56/DEL_CNTR_maj[4]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[4]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[4]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[4]\, Y => 
        \CONTROL56/DEL_CNTR[4]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_14\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[5]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_5[0]\);
    
    \UVL_34FUSE/SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \UVL_34FUSE/SIG_IN_DEL_maj_RNIKR8E[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_34FUSE/SUM_IN_A_tmr3_1[4]\);
    
    \CONTROL78/un1_DEL_CNTR_I_82\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_4[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_0_4[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_5[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_2[0]\);
    
    \UVL_12FUSE/FILT_OUT_maj_RNIL8E4D[7]\ : XNOR3
      port map(A => \UVL_12FUSE/FILT_OUT[7]_net_1\, B => 
        \UVL_12FUSE/i12_mux\, C => \UVL_12FUSE/N89\, Y => 
        \UVL_12FUSE/FILT_OUT_maj_RNIL8E4D[7]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_19\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[7]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_6[0]\);
    
    \TX_PROMPT/CNT_VAL_tmr2[0]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n0\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[0]_net_1\);
    
    \UVL_12FUSE/SIGOUT_tmr3\ : DFN1C0
      port map(D => \UVL_12FUSE/SIGOUT_maj_RNIRH6C6_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/SIGOUT_tmr3_2\);
    
    \CONTROL56/DEL_CNTR_maj_RNIFHC6[3]\ : NOR2
      port map(A => \CONTROL56/DEL_CNTR[3]_net_1\, B => 
        \CONTROL56/DEL_CNTR[4]_net_1\, Y => 
        \CONTROL56/un8_del_cntr_2\);
    
    \CONTROL78/SEQUENCER_STATE[9]\ : DFN1P0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNI1A198[8]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_0[9]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI2U5J81[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_58_1\, Y => \CONTROL56/N_DEL_CNTR[14]\);
    
    \UVL_12FUSE/FILT_OUT[1]\ : DFN1C0
      port map(D => \UVL_12FUSE/N_31_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_2[1]\);
    
    \CONTROL78/DEL_CNTR_maj[6]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[6]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[6]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[6]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[6]_net_1\);
    
    \CONTROL78/DEL_CNTR_maj_RNIQN1D[5]\ : NOR3A
      port map(A => \CONTROL78/un8_del_cntr_4\, B => 
        \CONTROL78/DEL_CNTR[5]_net_1\, C => 
        \CONTROL78/DEL_CNTR[6]_net_1\, Y => 
        \CONTROL78/un8_del_cntr_9\);
    
    \TX_PROMPT/CNT_VAL_maj[14]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[14]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[14]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[14]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[14]_net_1\);
    
    \CONTROL34/CH_VOSG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CONTROL34/CH_VOSG_EN_maj_RNIB8TL2[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/CH_VOSG_EN_tmr2_1[0]\);
    
    \OVT_FS/un2_n_filt_out_1_ADD_4x4_fast_I4_Y_0\ : MAJ3
      port map(A => \OVT_FS/N_23_i\, B => 
        \OVT_FS/SUM_IN_A[5]_net_1\, C => \OVT_FS/N92\, Y => 
        \OVT_FS/N89\);
    
    \UVL_12FUSE/un2_n_filt_out_0_PWR_OK_LED\ : OR3
      port map(A => UVL_OK_CH5A6, B => UVL_OK_CH7A8, C => 
        \UVL_12FUSE/PWR_OK_LED_0\, Y => PWR_OK_LED_c);
    
    \CONTROL34/DEL_CNTR[5]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[5]\);
    
    \CONTROL12/SEQUENCER_STATE[9]\ : DFN1P0
      port map(D => \CONTROL12/RET_STATE_maj_RNIGJ2Q8[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/SEQUENCER_STATE_2[9]\);
    
    \DTYCYC_CNT_maj[4]\ : MAJ3
      port map(A => \DTYCYC_CNT_0[4]\, B => 
        \DTYCYC_CNT_tmr2[4]_net_1\, C => 
        \DTYCYC_CNT_tmr3[4]_net_1\, Y => \DTYCYC_CNT[4]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_86\ : AND2
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_2[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_1[0]\);
    
    \CONTROL12/DEL_CNTR_maj_RNIF7AI[9]\ : NOR3A
      port map(A => \CONTROL12/un8_del_cntr_6\, B => 
        \CONTROL12/DEL_CNTR[9]_net_1\, C => 
        \CONTROL12/DEL_CNTR[10]_net_1\, Y => 
        \CONTROL12/un8_del_cntr_10\);
    
    \CONTROL12/DEL_CNTR_tmr2[4]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[4]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNII4V95[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/DWACT_ADD_CI_0_partial_sum[0]\, Y => 
        \CONTROL56/N_DEL_CNTR[0]\);
    
    \CONTROL78/DEL_CNTR_maj[0]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[0]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[0]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[0]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[0]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_14\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[5]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_5[0]\);
    
    \CONTROL56/CH_MREG_EN_maj_RNI7O3L2[0]\ : MX2
      port map(A => \CONTROL56/N_CH_MREG_EN_1_sqmuxa\, B => 
        \P_CH_MREG_EN_c_c[4]\, S => \CONTROL56/N_290\, Y => 
        \CONTROL56/CH_MREG_EN_maj_RNI7O3L2[0]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNI1HCS6[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_53_0\, Y => \CONTROL34/N_DEL_CNTR[4]\);
    
    \CONTROL12/RET_STATE_tmr2[9]\ : DFN1P0
      port map(D => \CONTROL12/RET_STATE_maj_RNIB33I1[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/RET_STATE_tmr2_2[9]\);
    
    \POR_FPGA_pad/U0/U1\ : IOIN_IB
      port map(YIN => \POR_FPGA_pad/U0/NET1\, Y => POR_FPGA_c);
    
    \UVL_34FUSE/SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => 
        \UVL_34FUSE/SIG_IN_DEL_maj_RNIKR8E_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/SUM_IN_A_tmr2_1[5]\);
    
    \CONTROL34/un1_DEL_CNTR_I_66\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_2[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_0_2[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_3[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_1[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_22\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[9]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_8[0]\);
    
    \CONTROL12/RET_STATE_maj[4]\ : MAJ3
      port map(A => \CONTROL12/RET_STATE_2[4]\, B => 
        \CONTROL12/RET_STATE_tmr2_2[4]\, C => 
        \CONTROL12/RET_STATE_tmr3_2[4]\, Y => 
        \CONTROL12/RET_STATE[4]_net_1\);
    
    \DTYCYC_CNT_maj[3]\ : MAJ3
      port map(A => \DTYCYC_CNT_0[3]\, B => 
        \DTYCYC_CNT_tmr2[3]_net_1\, C => 
        \DTYCYC_CNT_tmr3[3]_net_1\, Y => \DTYCYC_CNT[3]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_52\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[2]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1[0]\, Y => 
        \CONTROL78/I_52_2\);
    
    \CONTROL12/un1_DEL_CNTR_I_20\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[10]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_9[0]\);
    
    \CONTROL56/CH_ACTIVE_STAT_tmr2\ : DFN1C0
      port map(D => \REGISTER_CH_CMD_CH[4]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/CH_ACTIVE_STAT_tmr2_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_56\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[1]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_TMP[0]\, Y => 
        \CONTROL56/I_56_1\);
    
    \CONTROL56/SEQUENCER_STATE[7]\ : DFN1C0
      port map(D => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIADHK7[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_0[7]\);
    
    \CONTROL12/un1_DEL_CNTR_I_10\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[4]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_4[0]\);
    
    \CONTROL12/DEL_CNTR_maj_RNIV846[1]\ : NOR2
      port map(A => \CONTROL12/DEL_CNTR[6]_net_1\, B => 
        \CONTROL12/DEL_CNTR[1]_net_1\, Y => 
        \CONTROL12/un8_del_cntr_2\);
    
    \CONTROL34/DEL_CNTR_tmr2[7]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[7]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[7]\);
    
    \CONTROL12/DEL_CNTR_maj[7]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[7]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[7]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[7]\, Y => 
        \CONTROL12/DEL_CNTR[7]_net_1\);
    
    \UVL_56FUSE/FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => \UVL_56FUSE/FILT_OUT_maj_RNILIRQ5_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_56FUSE/FILT_OUT_tmr3_0[7]\);
    
    \CONTROL12/DEL_CNTR_maj[8]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[8]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[8]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[8]\, Y => 
        \CONTROL12/DEL_CNTR[8]_net_1\);
    
    \J11_19_TCONN_pad/U0/U0\ : IOPAD_TRI
      port map(D => \J11_19_TCONN_pad/U0/NET1\, E => 
        \J11_19_TCONN_pad/U0/NET2\, PAD => J11_19_TCONN);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNI0UEMH[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_60_2\, Y => \CONTROL78/N_DEL_CNTR[13]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNI79RA[4]\ : NOR2
      port map(A => \CONTROL34/SEQUENCER_STATE[4]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE[3]_net_1\, Y => 
        \CONTROL34/N_230_0\);
    
    \UVL_56FUSE/THRESH_VAL_maj_RNIEH1V[1]\ : NOR3C
      port map(A => \UVL_56FUSE/n_sigout15lto7_1\, B => 
        \UVL_56FUSE/n_sigout15lto7_2\, C => 
        \UVL_56FUSE/THRESH_VAL[1]_net_1\, Y => \UVL_56FUSE/N_113\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIKLUH2[9]\ : AO1D
      port map(A => \CONTROL56/N_246\, B => 
        \CONTROL56/SEQUENCER_STATE[9]_net_1\, C => 
        \CONTROL56/SEQUENCER_STATE_ns_i_0[2]_net_1\, Y => 
        \CONTROL56/SEQUENCER_STATE_ns_i_1[2]\);
    
    \TX_PROMPT/CNT_VAL_tmr2[17]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n17\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[17]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_89\ : AND2
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_pog_array_1_4[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_2_1[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_89\ : AND2
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_pog_array_1_4[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_2_1[0]\);
    
    \UVL_12FUSE/SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => 
        \UVL_12FUSE/SIG_IN_DEL_maj_RNICLUI_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/SUM_IN_A_tmr3_2[5]\);
    
    \CONTROL56/un1_DEL_CNTR_I_31\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[3]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_2[0]\);
    
    \CONTROL34/SEQUENCER_STATE_tmr2[6]\ : DFN1C0
      port map(D => \CONTROL34/SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[6]\);
    
    \UVL_78FUSE/SIG_IN_DEL_tmr3[0]\ : DFN1C0
      port map(D => \FPGA_FUSE_7_8_OK_c[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/SIG_IN_DEL_tmr3[0]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI6NUJ_0[2]\ : NOR2B
      port map(A => \TX_PROMPT/CNT_VAL_c1\, B => 
        \TX_PROMPT/CNT_VAL[2]_net_1\, Y => \TX_PROMPT/CNT_VAL_c2\);
    
    \UVL_34FUSE/SIGOUT\ : DFN1C0
      port map(D => \UVL_34FUSE/SIGOUT_maj_RNIHDUN8_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/SIGOUT_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNITP19A[15]\ : NOR2A
      port map(A => \TX_PROMPT/CNT_VAL_n15_tz\, B => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n15\);
    
    \CONTROL34/RET_STATE_maj_RNIFE6S[5]\ : MIN3X
      port map(A => \CONTROL34/RET_STATE[6]_net_1\, B => 
        \CONTROL34/RET_STATE[5]_net_1\, C => 
        \CONTROL34/RET_STATE[4]_net_1\, Y => \CONTROL34/N_236\);
    
    \MAN_EN_CH_4TO1_pad/U0/U1\ : IOIN_IB
      port map(YIN => \MAN_EN_CH_4TO1_pad/U0/NET1\, Y => 
        MAN_EN_CH_4TO1_c);
    
    \OVT_FS/THRESH_VAL[1]\ : DFN1C0
      port map(D => \OVT_FS/THRESH_VAL_maj_RNIOLGD1[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \OVT_FS/THRESH_VAL_3[1]\);
    
    \OVT_FS/FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => \OVT_FS/N_31_i\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/FILT_OUT_tmr2_3[1]\);
    
    \UVL_34FUSE/un1_tmp_sum_in_b_0_m26\ : XNOR3
      port map(A => \UVL_34FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_34FUSE/FILT_OUT[4]_net_1\, C => \UVL_34FUSE/i6_mux\, 
        Y => \UVL_34FUSE/N_27_i\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI6M3QT[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_48_1\, Y => \CONTROL56/N_DEL_CNTR[11]\);
    
    \P_CH_MREG_EN_pad[4]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_MREG_EN_pad[4]/U0/NET1\, E => 
        \P_CH_MREG_EN_pad[4]/U0/NET2\, PAD => P_CH_MREG_EN(4));
    
    \CONTROL12/un1_DEL_CNTR_I_91\ : AND2
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_10[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_1_4[0]\);
    
    \UVL_12FUSE/FILT_OUT[3]\ : DFN1C0
      port map(D => \UVL_12FUSE/N_27_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_2[3]\);
    
    \CONTROL12/CH_IAUX_EN_maj_RNI814V2[0]\ : MX2
      port map(A => \CONTROL12/N_CH_IAUX_EN_1_sqmuxa\, B => 
        \P_CH_IAUX_EN_c_c[0]\, S => \CONTROL12/N_290\, Y => 
        \CONTROL12/CH_IAUX_EN_maj_RNI814V2[0]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_75\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_11[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_6[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_2[0]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNII32D5[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_51_2\, Y => \CONTROL78/N_DEL_CNTR[3]\);
    
    \CONTROL34/DEL_CNTR_maj[9]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[9]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[9]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[9]\, Y => 
        \CONTROL34/DEL_CNTR[9]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_23\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[5]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_4[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_13\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[12]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_12[0]\);
    
    \OVT_FS/FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => \OVT_FS/ADD_4x4_fast_I6_Y\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/FILT_OUT_tmr2_3[5]\);
    
    \OVT_FS/FILT_OUT_maj[4]\ : MAJ3
      port map(A => \OVT_FS/FILT_OUT_3[4]\, B => 
        \OVT_FS/FILT_OUT_tmr2_3[4]\, C => 
        \OVT_FS/FILT_OUT_tmr3_3[4]\, Y => 
        \OVT_FS/FILT_OUT[4]_net_1\);
    
    \CONTROL56/RET_STATE_tmr2[5]\ : DFN1C0
      port map(D => 
        \CONTROL56/SEQUENCER_STATE_maj_RNI709H1[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/RET_STATE_tmr2_0[5]\);
    
    \CONTROL78/un1_DEL_CNTR_I_9\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[10]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_10[0]\);
    
    \CONTROL56/RET_STATE_maj_RNIJ12N_0[5]\ : NOR2A
      port map(A => \CONTROL56/RET_STATE[6]_net_1\, B => 
        \CONTROL56/RET_STATE[5]_net_1\, Y => \CONTROL56/N_299\);
    
    \CONTROL34/DEL_CNTR[1]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[1]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[1]\);
    
    \UVL_56FUSE/FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => \UVL_56FUSE/N_33_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[0]\);
    
    \UVL_56FUSE/un2_n_filt_out_0_ADD_4x4_fast_I6_Y\ : XOR3
      port map(A => \UVL_56FUSE/N_23_i\, B => 
        \UVL_56FUSE/SUM_IN_A[5]_net_1\, C => \UVL_56FUSE/N92\, Y
         => \UVL_56FUSE/ADD_4x4_fast_I6_Y_2\);
    
    \CONTROL34/SEQUENCER_STATE_ns_i_0[2]\ : OR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH3A4, C => 
        \STDBY_OFFB_B\, Y => 
        \CONTROL34/SEQUENCER_STATE_ns_i_0[2]_net_1\);
    
    \UVL_78FUSE/SIGOUT_maj\ : MAJ3
      port map(A => \UVL_78FUSE/SIGOUT_net_1\, B => 
        \UVL_78FUSE/SIGOUT_tmr2_net_1\, C => 
        \UVL_78FUSE/SIGOUT_tmr3_net_1\, Y => UVL_OK_CH7A8);
    
    \CONTROL34/DEL_CNTR_tmr3[10]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[10]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[10]\);
    
    \UVL_56FUSE/SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => 
        \UVL_56FUSE/SIG_IN_DEL_maj_RNIS1J9_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/SUM_IN_A_tmr2_0[5]\);
    
    \CONTROL78/un1_DEL_CNTR_I_59\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[7]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_2[0]\, Y => 
        \CONTROL78/I_59_2\);
    
    \CONTROL34/CH_MREG_EN[0]\ : DFN1C0
      port map(D => \CONTROL34/CH_MREG_EN_maj_RNISJUL1[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/CH_MREG_EN_1[0]\);
    
    \TX_PROMPT/CNT_VAL[15]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n15\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[15]\);
    
    \CONTROL78/DEL_CNTR_maj[4]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[4]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[4]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[4]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[4]_net_1\);
    
    \CONTROL56/CH_VOSG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CONTROL56/CH_VOSG_EN_maj_RNIQG1A3[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/CH_VOSG_EN_tmr3_0[0]\);
    
    \TX_PROMPT/CNT_VAL[2]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n2\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[2]\);
    
    \P_CH_IAUX_EN_pad[7]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_IAUX_EN_c_c[6]\, E => \VCC\, DOUT => 
        \P_CH_IAUX_EN_pad[7]/U0/NET1\, EOUT => 
        \P_CH_IAUX_EN_pad[7]/U0/NET2\);
    
    \CONTROL56/un1_DEL_CNTR_I_52\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[2]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1[0]\, Y => 
        \CONTROL56/I_52_1\);
    
    \UVL_12FUSE/FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => \UVL_12FUSE/ADD_4x4_fast_I6_Y_0\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[5]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI5LURC[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_53\, Y => \CONTROL12/N_DEL_CNTR[4]\);
    
    \UVL_78FUSE/SUM_IN_A[4]\ : DFN1C0
      port map(D => \UVL_78FUSE/SIG_IN_DEL_maj_RNI48TK[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_78FUSE/SUM_IN_A_0[4]\);
    
    \CONTROL56/un1_DEL_CNTR_I_76\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_2[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_11[0]\);
    
    \CONTROL78/un1_DEL_CNTR_I_13\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[12]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_12[0]\);
    
    \CONTROL78/DEL_CNTR_tmr2[13]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[13]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[13]_net_1\);
    
    \CONTROL56/DEL_CNTR[2]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[2]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[2]\);
    
    \UVL_56FUSE/SIG_IN_DEL_maj[0]\ : MAJ3
      port map(A => \UVL_56FUSE/SIG_IN_DEL_0[0]\, B => 
        \UVL_56FUSE/SIG_IN_DEL_tmr2_0[0]\, C => 
        \UVL_56FUSE/SIG_IN_DEL_tmr3_0[0]\, Y => 
        \UVL_56FUSE/SIG_IN_DEL[0]_net_1\);
    
    \OVT_FS/un2_n_filt_out_0_ADD_4x4_fast_I0_S\ : XNOR3
      port map(A => \OVT_FS/i8_mux\, B => \OVT_FS/N_40\, C => 
        \OVT_FS/SUM_IN_A[4]_net_1\, Y => 
        \OVT_FS/un2_n_filt_out0[28]\);
    
    \CONTROL78/un1_DEL_CNTR_I_7\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[2]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_2[0]\);
    
    \CONTROL34/CH_IAUX_EN_tmr3[0]\ : DFN1C0
      port map(D => \CONTROL34/CH_IAUX_EN_maj_RNI2N6R1[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/CH_IAUX_EN_tmr3_1[0]\);
    
    \CONTROL56/RET_STATE_tmr2[4]\ : DFN1C0
      port map(D => 
        \CONTROL56/SEQUENCER_STATE_maj_RNI6V8H1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/RET_STATE_tmr2_0[4]\);
    
    \UVL_34FUSE/FILT_OUT[7]\ : DFN1C0
      port map(D => \UVL_34FUSE/FILT_OUT_maj_RNILTKFJ_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_34FUSE/FILT_OUT_1[7]\);
    
    \CONTROL34/un1_DEL_CNTR_I_82\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_4[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_0_4[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_5[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_2[0]\);
    
    \UVL_78FUSE/FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => \UVL_78FUSE/N_29_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_tmr3[2]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_tmr3[9]\ : DFN1P0
      port map(D => \CONTROL56/RET_STATE_maj_RNI1MCD9[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/SEQUENCER_STATE_tmr3_0[9]\);
    
    \UVL_78FUSE/un1_tmp_sum_in_b_0_m15\ : XOR2
      port map(A => \UVL_78FUSE/FILT_OUT[6]_net_1\, B => 
        \UVL_78FUSE/FILT_OUT[5]_net_1\, Y => \UVL_78FUSE/N_40\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNI95FF[7]\ : NOR2A
      port map(A => \CONTROL78/N_312\, B => 
        \CONTROL78/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL78/N_CH_IAUX_EN_1_sqmuxa\);
    
    \CONTROL56/CH_VOSG_EN[0]\ : DFN1C0
      port map(D => \CONTROL56/CH_VOSG_EN_maj_RNIQG1A3[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/CH_VOSG_EN_0[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_5\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[7]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_7[0]\);
    
    \CONTROL56/CH_IAUX_EN[0]\ : DFN1C0
      port map(D => \CONTROL56/CH_IAUX_EN_maj_RNI9T632[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/CH_IAUX_EN_0[0]\);
    
    \TX_PROMPT/CNT_VAL_maj[3]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[3]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[3]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[3]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[3]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_92\ : AND2
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_12[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_1_5[0]\);
    
    \CONTROL12/RET_STATE[5]\ : DFN1C0
      port map(D => 
        \CONTROL12/SEQUENCER_STATE_maj_RNI7V2I1[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/RET_STATE_2[5]\);
    
    \UVL_34FUSE/FILT_OUT[5]\ : DFN1C0
      port map(D => \UVL_34FUSE/ADD_4x4_fast_I6_Y_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_1[5]\);
    
    \CONTROL12/un1_DEL_CNTR_I_52\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[2]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1[0]\, Y => 
        \CONTROL12/I_52\);
    
    \CONTROL78/CH_IAUX_EN_tmr3[0]\ : DFN1C0
      port map(D => \CONTROL78/CH_IAUX_EN_maj_RNIIO831[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/CH_IAUX_EN_tmr3[0]_net_1\);
    
    \CONTROL34/DEL_CNTR_tmr3[7]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[7]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[7]\);
    
    \FPGA_FUSE_7_8_OK_pad[0]/U0/U0\ : IOPAD_IN
      port map(PAD => FPGA_FUSE_7_8_OK(0), Y => 
        \FPGA_FUSE_7_8_OK_pad[0]/U0/NET1\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIT7F7[6]\ : OR2
      port map(A => \CONTROL78/SEQUENCER_STATE[6]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL78/N_222\);
    
    \UVL_12FUSE/FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => \UVL_12FUSE/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[4]\);
    
    \CONTROL56/SEQUENCER_STATE_tmr2[9]\ : DFN1P0
      port map(D => \CONTROL56/RET_STATE_maj_RNI1MCD9[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/SEQUENCER_STATE_tmr2_0[9]\);
    
    \CONTROL34/RET_STATE_maj[5]\ : MAJ3
      port map(A => \CONTROL34/RET_STATE_1[5]\, B => 
        \CONTROL34/RET_STATE_tmr2_1[5]\, C => 
        \CONTROL34/RET_STATE_tmr3_1[5]\, Y => 
        \CONTROL34/RET_STATE[5]_net_1\);
    
    \CONTROL78/DEL_CNTR_maj_RNIVTG6[7]\ : NOR2
      port map(A => \CONTROL78/DEL_CNTR[8]_net_1\, B => 
        \CONTROL78/DEL_CNTR[7]_net_1\, Y => 
        \CONTROL78/un8_del_cntr_4\);
    
    \UVL_12FUSE/FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => \UVL_12FUSE/FILT_OUT_maj_RNIL8E4D_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_12FUSE/FILT_OUT_tmr3_2[7]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]\ : NOR2
      port map(A => \CONTROL56/SEQUENCER_STATE[4]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE[3]_net_1\, Y => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\);
    
    \CONTROL12/SEQUENCER_STATE[8]\ : DFN1C0
      port map(D => \CONTROL12/N_315\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_2[8]\);
    
    \CONTROL12/SEQUENCER_STATE[5]\ : DFN1C0
      port map(D => \CONTROL12/SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_2[5]\);
    
    \CONTROL34/DEL_CNTR_maj_RNIFL86[7]\ : NOR2
      port map(A => \CONTROL34/DEL_CNTR[8]_net_1\, B => 
        \CONTROL34/DEL_CNTR[7]_net_1\, Y => 
        \CONTROL34/un8_del_cntr_4\);
    
    \REGISTER_CH_CMD_CH_tmr2[0]\ : DFN1C0
      port map(D => \VAL_MAN_EN_CH_4TO1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \REGISTER_CH_CMD_CH_tmr2[0]_net_1\);
    
    \DTYCYC_CNT[2]\ : DFN1C0
      port map(D => DTYCYC_CNT_23, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_0[2]\);
    
    STDBY_OFFB_A_maj : MAJ3
      port map(A => STDBY_OFFB_A_0, B => \STDBY_OFFB_A_tmr2\, C
         => \STDBY_OFFB_A_tmr3\, Y => \STDBY_OFFB_A\);
    
    \CONTROL56/un1_DEL_CNTR_I_28\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[8]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_7[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_23\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[5]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_4[0]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI8UAJI[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_59_1\, Y => \CONTROL56/N_DEL_CNTR[7]\);
    
    \CONTROL12/SEQUENCER_STATE_tmr2[8]\ : DFN1C0
      port map(D => \CONTROL12/N_315\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[8]\);
    
    \CONTROL12/CH_MREG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CONTROL12/CH_MREG_EN_maj_RNIUVMI3[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/CH_MREG_EN_tmr3_2[0]\);
    
    \UVL_78FUSE/FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => \UVL_78FUSE/N_27_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_tmr2[3]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj[8]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[8]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[8]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[8]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[8]_net_1\);
    
    \OVT_FS/FILT_OUT_maj_RNIHNG7_0[4]\ : NOR2
      port map(A => \OVT_FS/FILT_OUT[5]_net_1\, B => 
        \OVT_FS/FILT_OUT[4]_net_1\, Y => 
        \OVT_FS/n_sigout15lto7_1\);
    
    \OVT_FS/THRESH_VAL_maj_RNISAOM_0[1]\ : AOI1B
      port map(A => \OVT_FS/n_sigout15lto7_2\, B => 
        \OVT_FS/n_sigout15lto7_1\, C => 
        \OVT_FS/THRESH_VAL[1]_net_1\, Y => \OVT_FS/N_95\);
    
    \UVL_34FUSE/FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => \UVL_34FUSE/ADD_4x4_fast_I6_Y_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[5]\);
    
    \CONTROL56/SEQUENCER_STATE_tmr2[3]\ : DFN1C0
      port map(D => \CONTROL56/CH_ACTIVE_STAT_maj_RNI0KEN1_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/SEQUENCER_STATE_tmr2_0[3]\);
    
    \OVT_FS/FILT_OUT[0]\ : DFN1C0
      port map(D => \OVT_FS/N_33_i\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/FILT_OUT_3[0]\);
    
    \UVL_78FUSE/THRESH_VAL_maj_RNI66PK1[1]\ : NOR3C
      port map(A => \UVL_78FUSE/n_sigout15lto7_1\, B => 
        \UVL_78FUSE/n_sigout15lto7_2\, C => 
        \UVL_78FUSE/THRESH_VAL[1]_net_1\, Y => \UVL_78FUSE/N_113\);
    
    \CONTROL12/DEL_CNTR[6]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[6]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[6]\);
    
    \CONTROL78/un1_DEL_CNTR_I_72\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_6[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_0_6[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_7[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_3[0]\);
    
    \CONTROL78/SEQUENCER_STATE_maj[8]\ : MAJ3
      port map(A => \CONTROL78/SEQUENCER_STATE_0[8]\, B => 
        \CONTROL78/SEQUENCER_STATE_tmr2[8]_net_1\, C => 
        \CONTROL78/SEQUENCER_STATE_tmr3[8]_net_1\, Y => 
        \CONTROL78/SEQUENCER_STATE[8]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI06997[5]\ : XA1B
      port map(A => \TX_PROMPT/CNT_VAL_c4\, B => 
        \TX_PROMPT/CNT_VAL[5]_net_1\, C => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n5\);
    
    \TX_PROMPT/CNT_VAL_tmr2[14]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n14\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[14]_net_1\);
    
    DEL0_DEV_RST_B_tmr2 : DFN1C0
      port map(D => \VCC\, CLK => CLK40M_OSC_c, CLR => POR_FPGA_c, 
        Q => \DEL0_DEV_RST_B_tmr2\);
    
    \CONTROL78/DEL_CNTR_tmr3[11]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[11]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[11]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNID1TR1_0[8]\ : AX1C
      port map(A => \TX_PROMPT/CNT_VAL[7]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c6\, C => \TX_PROMPT/CNT_VAL[8]_net_1\, 
        Y => \TX_PROMPT/CNT_VAL_n8_tz\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIAQ6B[5]\ : OR2
      port map(A => \CONTROL78/N_222\, B => 
        \CONTROL78/SEQUENCER_STATE[5]_net_1\, Y => 
        \CONTROL78/N_225\);
    
    \CONTROL78/CH_IAUX_EN_tmr2[0]\ : DFN1C0
      port map(D => \CONTROL78/CH_IAUX_EN_maj_RNIIO831[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/CH_IAUX_EN_tmr2[0]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE[8]\ : DFN1C0
      port map(D => \CONTROL56/N_315\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_0[8]\);
    
    \CONTROL34/RET_STATE[6]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIO0MP[5]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/RET_STATE_1[6]\);
    
    \UVL_78FUSE/FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => \UVL_78FUSE/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_tmr2[4]_net_1\);
    
    \UVL_12FUSE/un1_tmp_sum_in_b_0_m30\ : XNOR3
      port map(A => \UVL_12FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_12FUSE/FILT_OUT[2]_net_1\, C => \UVL_12FUSE/i2_mux\, 
        Y => \UVL_12FUSE/N_31_i\);
    
    \TX_PROMPT/CNT_VAL_tmr2[8]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n8\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[8]_net_1\);
    
    \CONTROL34/DEL_CNTR_tmr3[12]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[12]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[12]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS[4]\ : NOR2
      port map(A => \CONTROL12/SEQUENCER_STATE[4]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE[3]_net_1\, Y => 
        \CONTROL12/N_230_0\);
    
    \CONTROL78/SEQUENCER_STATE[5]\ : DFN1C0
      port map(D => \CONTROL78/SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_0[5]\);
    
    \CONTROL78/un1_DEL_CNTR_I_11\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[6]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_6[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_72\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_6[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_0_6[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_7[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_3[0]\);
    
    \CONTROL56/DEL_CNTR_maj[6]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[6]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[6]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[6]\, Y => 
        \CONTROL56/DEL_CNTR[6]_net_1\);
    
    \CONTROL12/DEL_CNTR[5]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[5]\);
    
    \CONTROL56/SEQUENCER_STATE_tmr3[4]\ : DFN1C0
      port map(D => \CONTROL56/SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[4]\);
    
    \J11_17_TCONN_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => \GND\, E => \VCC\, DOUT => 
        \J11_17_TCONN_pad/U0/NET1\, EOUT => 
        \J11_17_TCONN_pad/U0/NET2\);
    
    \CONTROL34/un1_DEL_CNTR_I_23\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[5]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_4[0]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIKR4K1[7]\ : NOR2A
      port map(A => \CONTROL12/N_312\, B => 
        \CONTROL12/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL12/N_CH_IAUX_EN_1_sqmuxa\);
    
    \CONTROL12/RET_STATE_tmr3[5]\ : DFN1C0
      port map(D => 
        \CONTROL12/SEQUENCER_STATE_maj_RNI7V2I1[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/RET_STATE_tmr3_2[5]\);
    
    MAN_EN_CH_4TO1_A_tmr3 : DFN1C0
      port map(D => MAN_EN_CH_4TO1_A_14, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_4TO1_A_tmr3\);
    
    \CONTROL12/un1_DEL_CNTR_I_71\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_2[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12[0]\);
    
    \CONTROL12/CH_VOSG_EN[0]\ : DFN1C0
      port map(D => \CONTROL12/CH_VOSG_EN_maj_RNIDKMT3[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/CH_VOSG_EN_2[0]\);
    
    \CONTROL78/DEL_CNTR[3]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[3]\);
    
    \UVL_56FUSE/SUM_IN_A[4]\ : DFN1C0
      port map(D => \UVL_56FUSE/SIG_IN_DEL_maj_RNIS1J9[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_56FUSE/SUM_IN_A_0[4]\);
    
    \CONTROL34/DEL_CNTR_maj[6]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[6]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[6]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[6]\, Y => 
        \CONTROL34/DEL_CNTR[6]_net_1\);
    
    \UVL_78FUSE/un2_n_filt_out_1_ADD_4x4_fast_I4_Y_0\ : MAJ3
      port map(A => \UVL_78FUSE/N_23_i\, B => 
        \UVL_78FUSE/SUM_IN_A[5]_net_1\, C => \UVL_78FUSE/N92\, Y
         => \UVL_78FUSE/N89\);
    
    \UVL_78FUSE/FILT_OUT[5]\ : DFN1C0
      port map(D => \UVL_78FUSE/ADD_4x4_fast_I6_Y_3\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_0[5]\);
    
    \CONTROL34/un1_DEL_CNTR_I_60\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[13]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_5[0]\, Y => 
        \CONTROL34/I_60_0\);
    
    \CONTROL12/DEL_CNTR_tmr3[2]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[2]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[2]\);
    
    \CONTROL34/RET_STATE_tmr3[9]\ : DFN1P0
      port map(D => \CONTROL34/RET_STATE_maj_RNIR3MP[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/RET_STATE_tmr3_1[9]\);
    
    \CONTROL34/un1_DEL_CNTR_I_48\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[11]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_4[0]\, Y => 
        \CONTROL34/I_48_0\);
    
    \OVT_FS/SUM_IN_A_maj[5]\ : MAJ3
      port map(A => \OVT_FS/SUM_IN_A_3[5]\, B => 
        \OVT_FS/SUM_IN_A_tmr2_3[5]\, C => 
        \OVT_FS/SUM_IN_A_tmr3_3[5]\, Y => 
        \OVT_FS/SUM_IN_A[5]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_65\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_12[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_5[0]\);
    
    \UVL_34FUSE/FILT_OUT[0]\ : DFN1C0
      port map(D => \UVL_34FUSE/N_33_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_1[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_7\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[2]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_2[0]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIIKEO[9]\ : NOR3B
      port map(A => STATUS_LED_c, B => UVL_OK_CH5A6, C => 
        \CONTROL56/SEQUENCER_STATE[9]_net_1\, Y => 
        \CONTROL56/N_312\);
    
    \CONTROL12/DEL_CNTR[4]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[4]\);
    
    \UVL_34FUSE/FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => \UVL_34FUSE/FILT_OUT_maj_RNILTKFJ_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_34FUSE/FILT_OUT_tmr3_1[7]\);
    
    \CONTROL12/un1_DEL_CNTR_I_24\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[2]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_1[0]\);
    
    \CONTROL56/RET_STATE_maj_RNIJ12N_1[5]\ : NOR2A
      port map(A => \CONTROL56/RET_STATE[5]_net_1\, B => 
        \CONTROL56/RET_STATE[6]_net_1\, Y => \CONTROL56/N_298\);
    
    \TX_PROMPT/CNT_VAL_maj_RNILO1N[18]\ : NOR2
      port map(A => \TX_PROMPT/CNT_VAL[18]_net_1\, B => 
        \TX_PROMPT/CNT_VAL[19]_net_1\, Y => 
        \TX_PROMPT/un9_cnt_vallto19_0\);
    
    \CONTROL78/DEL_CNTR_tmr3[1]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[1]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[1]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_14\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[5]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_5[0]\);
    
    \CONTROL78/DEL_CNTR_maj_RNIHFG6[0]\ : NOR2
      port map(A => \CONTROL78/DEL_CNTR[1]_net_1\, B => 
        \CONTROL78/DEL_CNTR[0]_net_1\, Y => 
        \CONTROL78/un8_del_cntr_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIFM811_0[4]\ : AX1C
      port map(A => \TX_PROMPT/CNT_VAL[3]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c2\, C => \TX_PROMPT/CNT_VAL[4]_net_1\, 
        Y => \TX_PROMPT/CNT_VAL_n4_tz\);
    
    \CONTROL56/DEL_CNTR_tmr2[3]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[3]\);
    
    \TX_PROMPT/CNT_VAL_maj[4]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[4]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[4]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[4]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[4]_net_1\);
    
    \CONTROL34/DEL_CNTR_tmr2[10]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[10]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[10]\);
    
    \CONTROL56/DEL_CNTR_tmr2[9]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[9]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[9]\);
    
    \CONTROL34/CH_VOSG_EN[1]\ : DFN1C0
      port map(D => \CONTROL34/CH_VOSG_EN_maj_RNIHBN23[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/CH_VOSG_EN_1[1]\);
    
    \CONTROL56/DEL_CNTR[11]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[11]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[11]\);
    
    \CONTROL78/un1_DEL_CNTR_I_79\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_1_2[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_1_2[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_3[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_2_1[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_58\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[14]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_11_2[0]\, Y => 
        \CONTROL56/I_58_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_53\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[4]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_2[0]\, Y => 
        \CONTROL56/I_53_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_49\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[6]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_11[0]\, Y => 
        \CONTROL34/I_49_0\);
    
    MAN_EN_CH_4TO1_A_maj : MAJ3
      port map(A => MAN_EN_CH_4TO1_A_0, B => 
        \MAN_EN_CH_4TO1_A_tmr2\, C => \MAN_EN_CH_4TO1_A_tmr3\, Y
         => \MAN_EN_CH_4TO1_A\);
    
    \CONTROL78/SEQUENCER_STATE_maj[3]\ : MAJ3
      port map(A => \CONTROL78/SEQUENCER_STATE_0[3]\, B => 
        \CONTROL78/SEQUENCER_STATE_tmr2[3]_net_1\, C => 
        \CONTROL78/SEQUENCER_STATE_tmr3[3]_net_1\, Y => 
        \CONTROL78/SEQUENCER_STATE[3]_net_1\);
    
    \UVL_12FUSE/un2_n_filt_out_0_ADD_4x4_fast_I0_S\ : XNOR3
      port map(A => \UVL_12FUSE/i8_mux\, B => \UVL_12FUSE/N_40\, 
        C => \UVL_12FUSE/SUM_IN_A[4]_net_1\, Y => 
        \UVL_12FUSE/un2_n_filt_out0[28]\);
    
    \CONTROL56/DEL_CNTR_tmr3[4]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[4]\);
    
    \CONTROL34/RET_STATE_maj_RNIR3MP[9]\ : NOR2A
      port map(A => \CONTROL34/RET_STATE[9]_net_1\, B => 
        \CONTROL34/N_225\, Y => 
        \CONTROL34/RET_STATE_maj_RNIR3MP[9]_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNI1A198[8]\ : NOR3
      port map(A => \CONTROL78/N_315\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIQENH2[8]_net_1\, C => 
        \CONTROL78/N_266\, Y => 
        \CONTROL78/SEQUENCER_STATE_maj_RNI1A198[8]_net_1\);
    
    VAL_MAN_EN_CH_4TO1_maj : MAJ3
      port map(A => VAL_MAN_EN_CH_4TO1_0, B => 
        \VAL_MAN_EN_CH_4TO1_tmr2\, C => \VAL_MAN_EN_CH_4TO1_tmr3\, 
        Y => \VAL_MAN_EN_CH_4TO1\);
    
    \CONTROL34/un1_mode_dcyc_normb_1_0_0\ : OAI1
      port map(A => \CONTROL34/N_16\, B => \DTYCYC_CNT[4]_net_1\, 
        C => MODE_DCYC_NORMB_c, Y => 
        \CONTROL34/un1_mode_dcyc_normb_1\);
    
    \UVL_56FUSE/FILT_OUT_maj[3]\ : MAJ3
      port map(A => \UVL_56FUSE/FILT_OUT_0[3]\, B => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[3]\, C => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[3]\, Y => 
        \UVL_56FUSE/FILT_OUT[3]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNISEJP2[11]\ : NOR3C
      port map(A => \TX_PROMPT/CNT_VAL[10]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c9\, C => 
        \TX_PROMPT/CNT_VAL[11]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL_c11\);
    
    \CONTROL56/SEQUENCER_STATE_tmr3[7]\ : DFN1C0
      port map(D => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIADHK7[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[7]\);
    
    \CONTROL12/SEQUENCER_STATE_tmr3[3]\ : DFN1C0
      port map(D => \CONTROL12/CH_ACTIVE_STAT_maj_RNIF8952_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/SEQUENCER_STATE_tmr3_2[3]\);
    
    \REFCNT_maj_RNI17L1[0]\ : INV
      port map(A => \REFCNT[0]_net_1\, Y => \REFCNT_i[0]\);
    
    \CONTROL12/DEL_CNTR_maj_RNI7H46[7]\ : NOR2
      port map(A => \CONTROL12/DEL_CNTR[8]_net_1\, B => 
        \CONTROL12/DEL_CNTR[7]_net_1\, Y => 
        \CONTROL12/un8_del_cntr_4\);
    
    \CONTROL12/CH_VOSG_EN_maj[0]\ : MAJ3
      port map(A => \CONTROL12/CH_VOSG_EN_2[0]\, B => 
        \CONTROL12/CH_VOSG_EN_tmr2_2[0]\, C => 
        \CONTROL12/CH_VOSG_EN_tmr3_2[0]\, Y => 
        \P_CH_VOSG_EN_c[0]\);
    
    CLK_5M_GL_maj : MAJ3
      port map(A => CLK_5M_GL_0, B => \CLK_5M_GL_tmr2\, C => 
        \CLK_5M_GL_tmr3\, Y => \CLK_5M_GL\);
    
    \CONTROL34/CH_IAUX_EN_tmr2[0]\ : DFN1C0
      port map(D => \CONTROL34/CH_IAUX_EN_maj_RNI2N6R1[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/CH_IAUX_EN_tmr2_1[0]\);
    
    \TX_PROMPT/CNT_VAL_tmr3[7]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n7\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[7]_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIEDDN3[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/DWACT_ADD_CI_0_partial_sum[0]\, Y => 
        \CONTROL78/N_DEL_CNTR[0]\);
    
    \DTYCYC_CNT_tmr3[3]\ : DFN1C0
      port map(D => DTYCYC_CNT_22, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr3[3]_net_1\);
    
    \P_CH_IAUX_EN_pad[3]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_IAUX_EN_pad[3]/U0/NET1\, E => 
        \P_CH_IAUX_EN_pad[3]/U0/NET2\, PAD => P_CH_IAUX_EN(3));
    
    \CONTROL56/SEQUENCER_STATE[4]\ : DFN1C0
      port map(D => \CONTROL56/SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_0[4]\);
    
    \CONTROL56/DEL_CNTR_maj[0]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[0]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[0]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[0]\, Y => 
        \CONTROL56/DEL_CNTR[0]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_42\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[0]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_partial_sum[0]\);
    
    \CONTROL56/DEL_CNTR_tmr2[5]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[5]\);
    
    \UVL_78FUSE/un2_n_filt_out_0_ADD_4x4_fast_I0_S\ : XNOR3
      port map(A => \UVL_78FUSE/i8_mux\, B => \UVL_78FUSE/N_40\, 
        C => \UVL_78FUSE/SUM_IN_A[4]_net_1\, Y => 
        \UVL_78FUSE/un2_n_filt_out0[28]\);
    
    \CONTROL34/DEL_CNTR_maj[10]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[10]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[10]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[10]\, Y => 
        \CONTROL34/DEL_CNTR[10]_net_1\);
    
    \CONTROL34/DEL_CNTR_tmr3[13]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[13]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[13]\);
    
    \CONTROL12/DEL_CNTR_maj_RNI06GP[1]\ : NOR3C
      port map(A => \CONTROL12/un8_del_cntr_2\, B => 
        \CONTROL12/un8_del_cntr_1\, C => 
        \CONTROL12/un8_del_cntr_7\, Y => 
        \CONTROL12/un8_del_cntr_11\);
    
    \CONTROL34/un1_DEL_CNTR_I_5\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[7]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_7[0]\);
    
    \CONTROL56/DEL_CNTR_tmr2[1]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[1]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[1]\);
    
    \CONTROL56/CH_MREG_EN_maj[0]\ : MAJ3
      port map(A => \CONTROL56/CH_MREG_EN_0[0]\, B => 
        \CONTROL56/CH_MREG_EN_tmr2_0[0]\, C => 
        \CONTROL56/CH_MREG_EN_tmr3_0[0]\, Y => 
        \P_CH_MREG_EN_c_c[4]\);
    
    \CONTROL56/DEL_CNTR_tmr3[2]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[2]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[2]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNID1TR1[8]\ : OA1B
      port map(A => \TX_PROMPT/un9_cnt_vallt7\, B => 
        \TX_PROMPT/un9_cnt_vallto7_0\, C => 
        \TX_PROMPT/CNT_VAL[8]_net_1\, Y => 
        \TX_PROMPT/un9_cnt_vallt9\);
    
    \UVL_78FUSE/THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \UVL_78FUSE/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/THRESH_VAL_tmr3[0]_net_1\);
    
    \UVL_56FUSE/SUM_IN_A_maj[5]\ : MAJ3
      port map(A => \UVL_56FUSE/SUM_IN_A_0[5]\, B => 
        \UVL_56FUSE/SUM_IN_A_tmr2_0[5]\, C => 
        \UVL_56FUSE/SUM_IN_A_tmr3_0[5]\, Y => 
        \UVL_56FUSE/SUM_IN_A[5]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIBEB16[20]\ : NOR2A
      port map(A => \TX_PROMPT/CNT_VAL[20]_net_1\, B => 
        \TX_PROMPT/un9_cnt_vallt20\, Y => \TX_PROMPT/un9_cnt_val\);
    
    \CONTROL78/DEL_CNTR[13]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[13]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[13]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIRJR51[4]\ : NOR3B
      port map(A => \CONTROL56.CH_ACTIVE_STAT\, B => 
        \CONTROL78/N_309\, C => \CONTROL78/N_230_0\, Y => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIRJR51[4]_net_1\);
    
    \P_CH_VOSG_EN_pad[5]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_VOSG_EN_c[5]\, E => \VCC\, DOUT => 
        \P_CH_VOSG_EN_pad[5]/U0/NET1\, EOUT => 
        \P_CH_VOSG_EN_pad[5]/U0/NET2\);
    
    \UVL_12FUSE/un1_tmp_sum_in_b_0_m22\ : XNOR3
      port map(A => \UVL_12FUSE/FILT_OUT[6]_net_1\, B => 
        \UVL_12FUSE/FILT_OUT[7]_net_1\, C => \UVL_12FUSE/i10_mux\, 
        Y => \UVL_12FUSE/N_23_i\);
    
    \OVT_FS/FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => \OVT_FS/N_33_i\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/FILT_OUT_tmr2_3[0]\);
    
    \CONTROL78/SEQUENCER_STATE_tmr2[9]\ : DFN1P0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNI1A198[8]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr2[9]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNITR8A5[18]\ : NOR2B
      port map(A => \TX_PROMPT/CNT_VAL_c17\, B => 
        \TX_PROMPT/CNT_VAL[18]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL_c18\);
    
    \CONTROL56/un1_DEL_CNTR_I_16\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[11]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_11[0]\);
    
    \UVL_56FUSE/SIG_IN_DEL[0]\ : DFN1C0
      port map(D => \FPGA_FUSE_5_6_OK_c[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/SIG_IN_DEL_0[0]\);
    
    \OVT_FS/FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => \OVT_FS/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/FILT_OUT_tmr3_3[4]\);
    
    \CONTROL78/DEL_CNTR[11]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[11]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[11]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIQENH2[8]\ : OA1A
      port map(A => \CONTROL78/SEQUENCER_STATE[8]_net_1\, B => 
        \CONTROL78/N_246\, C => \CONTROL78/N_309\, Y => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIQENH2[8]_net_1\);
    
    \CONTROL78/RET_STATE_maj_RNIEOCJ3[9]\ : NOR2B
      port map(A => \CONTROL78/N_291\, B => 
        \CONTROL78/un8_del_cntr\, Y => \CONTROL78/N_302\);
    
    \TX_PROMPT/CNT_VAL_tmr3[18]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n18\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[18]_net_1\);
    
    \CONTROL78/DEL_CNTR_tmr2[1]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[1]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[1]_net_1\);
    
    \CONTROL56/DEL_CNTR_maj_RNIFAL21[0]\ : NOR3C
      port map(A => \CONTROL56/un8_del_cntr_2\, B => 
        \CONTROL56/un8_del_cntr_1\, C => 
        \CONTROL56/un8_del_cntr_7\, Y => 
        \CONTROL56/un8_del_cntr_11\);
    
    \CONTROL56/DEL_CNTR[4]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[4]\);
    
    \CONTROL12/RET_STATE[6]\ : DFN1C0
      port map(D => 
        \CONTROL12/SEQUENCER_STATE_maj_RNI803I1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/RET_STATE_2[6]\);
    
    \CONTROL56/DEL_CNTR_tmr3[14]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[14]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[14]\);
    
    \CONTROL34/SEQUENCER_STATE_tmr2[7]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIQHEV5[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[7]\);
    
    \UVL_12FUSE/un1_tmp_sum_in_b_0_m7\ : AO18
      port map(A => \UVL_12FUSE/FILT_OUT[2]_net_1\, B => 
        \UVL_12FUSE/i2_mux\, C => \UVL_12FUSE/FILT_OUT[3]_net_1\, 
        Y => \UVL_12FUSE/i4_mux\);
    
    \CONTROL56/un1_DEL_CNTR_I_78\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_4[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_11_1[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_73\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_12[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_0_12[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_13[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_6[0]\);
    
    \UVL_12FUSE/FILT_OUT_maj[4]\ : MAJ3
      port map(A => \UVL_12FUSE/FILT_OUT_2[4]\, B => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[4]\, C => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[4]\, Y => 
        \UVL_12FUSE/FILT_OUT[4]_net_1\);
    
    \CONTROL34/DEL_CNTR_tmr2[12]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[12]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[12]\);
    
    \CONTROL56/MAIN_SEQUENCER.un3_n_ch_vosg_en\ : NOR2B
      port map(A => \REGISTER_CH_CMD_CH[4]_net_1\, B => 
        \DTYCYC_EN\, Y => 
        \CONTROL56.MAIN_SEQUENCER.un3_n_ch_vosg_en\);
    
    \CONTROL34/un1_DEL_CNTR_I_13\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[12]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_12[0]\);
    
    \OVT_FS/FILT_OUT_maj[7]\ : MAJ3
      port map(A => \OVT_FS/FILT_OUT_3[7]\, B => 
        \OVT_FS/FILT_OUT_tmr2_3[7]\, C => 
        \OVT_FS/FILT_OUT_tmr3_3[7]\, Y => 
        \OVT_FS/FILT_OUT[7]_net_1\);
    
    \CONTROL12/SEQUENCER_STATE_ns_i_0[2]\ : OR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH1A2, C => 
        \STDBY_OFFB_B\, Y => 
        \CONTROL12/SEQUENCER_STATE_ns_i_0[2]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_18\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[1]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_1[0]\);
    
    \UVL_78FUSE/FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => \UVL_78FUSE/FILT_OUT_maj_RNIL726C[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_78FUSE/FILT_OUT_tmr3[6]_net_1\);
    
    \UVL_56FUSE/FILT_OUT[2]\ : DFN1C0
      port map(D => \UVL_56FUSE/N_29_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_0[2]\);
    
    \P_CH_MREG_EN_pad[7]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_MREG_EN_c_c[6]\, E => \VCC\, DOUT => 
        \P_CH_MREG_EN_pad[7]/U0/NET1\, EOUT => 
        \P_CH_MREG_EN_pad[7]/U0/NET2\);
    
    \CONTROL56/CH_ACTIVE_STAT\ : DFN1C0
      port map(D => \REGISTER_CH_CMD_CH[4]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/CH_ACTIVE_STAT_0\);
    
    \UVL_78FUSE/THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \UVL_78FUSE/THRESH_VAL_0[0]\, B => 
        \UVL_78FUSE/THRESH_VAL_tmr2[0]_net_1\, C => 
        \UVL_78FUSE/THRESH_VAL_tmr3[0]_net_1\, Y => 
        \UVL_78FUSE/THRESH_VAL[0]_net_1\);
    
    \UVL_78FUSE/FILT_OUT[0]\ : DFN1C0
      port map(D => \UVL_78FUSE/N_33_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_0[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_21\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[13]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_12[0]\);
    
    \CONTROL34/DEL_CNTR_tmr2[0]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[0]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIUVN51[5]\ : OR2
      port map(A => \CONTROL56/N_222\, B => 
        \CONTROL56/SEQUENCER_STATE[5]_net_1\, Y => 
        \CONTROL56/N_225\);
    
    \UVL_56FUSE/SUM_IN_A[5]\ : DFN1C0
      port map(D => 
        \UVL_56FUSE/SIG_IN_DEL_maj_RNIS1J9_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/SUM_IN_A_0[5]\);
    
    \CONTROL34/DEL_CNTR_tmr2[8]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[8]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[8]\);
    
    \CONTROL78/un1_DEL_CNTR_I_14\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[5]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_5[0]\);
    
    \CONTROL78/DEL_CNTR[0]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[0]\);
    
    \CONTROL12/DEL_CNTR_tmr3[4]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[4]\);
    
    \UVL_34FUSE/SUM_IN_A[4]\ : DFN1C0
      port map(D => \UVL_34FUSE/SIG_IN_DEL_maj_RNIKR8E[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_34FUSE/SUM_IN_A_1[4]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIQOCH[5]\ : NOR2A
      port map(A => \CONTROL78/RET_STATE[5]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE[5]_net_1\, Y => 
        \CONTROL78/RET_STATE_0_a3_0[5]\);
    
    \UVL_12FUSE/FILT_OUT_maj_RNI7F8L[3]\ : NOR2B
      port map(A => \UVL_12FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_12FUSE/FILT_OUT[6]_net_1\, Y => 
        \UVL_12FUSE/n_sigout3lto6_0\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNI171B1[9]\ : NOR3A
      port map(A => \CONTROL34/N_236\, B => 
        \CONTROL34/RET_STATE[9]_net_1\, C => 
        \CONTROL34/SEQUENCER_STATE[9]_net_1\, Y => 
        \CONTROL34/N_271\);
    
    \TX_PROMPT/CNT_VAL_tmr2[10]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n10\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[10]_net_1\);
    
    \CONTROL12/DEL_CNTR_maj[0]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[0]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[0]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[0]\, Y => 
        \CONTROL12/DEL_CNTR[0]_net_1\);
    
    \PRI_TX_EN_pad/U0/U0\ : IOPAD_TRI
      port map(D => \PRI_TX_EN_pad/U0/NET1\, E => 
        \PRI_TX_EN_pad/U0/NET2\, PAD => PRI_TX_EN);
    
    \UVL_34FUSE/THRESH_VAL[1]\ : DFN1C0
      port map(D => \UVL_34FUSE/THRESH_VAL_maj_RNICPJI5[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_34FUSE/THRESH_VAL_1[1]\);
    
    \CONTROL12/un1_DEL_CNTR_I_60\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[13]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_5[0]\, Y => 
        \CONTROL12/I_60\);
    
    \CONTROL56/RET_STATE_maj[9]\ : MAJ3
      port map(A => \CONTROL56/RET_STATE_0[9]\, B => 
        \CONTROL56/RET_STATE_tmr2_0[9]\, C => 
        \CONTROL56/RET_STATE_tmr3_0[9]\, Y => 
        \CONTROL56/RET_STATE[9]_net_1\);
    
    \CONTROL34/CH_IAUX_EN_maj_RNI2N6R1[0]\ : MX2
      port map(A => \CONTROL34/N_CH_IAUX_EN_1_sqmuxa\, B => 
        \P_CH_IAUX_EN_c_c[2]\, S => \CONTROL34/N_290\, Y => 
        \CONTROL34/CH_IAUX_EN_maj_RNI2N6R1[0]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNISEJP2[9]\ : OA1A
      port map(A => \TX_PROMPT/CNT_VAL[9]_net_1\, B => 
        \TX_PROMPT/un9_cnt_vallt9\, C => 
        \TX_PROMPT/un9_cnt_vallto11_0\, Y => 
        \TX_PROMPT/un9_cnt_vallt12\);
    
    \CONTROL78/DEL_CNTR[2]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[2]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[2]\);
    
    \CONTROL34/CH_IAUX_EN_maj[0]\ : MAJ3
      port map(A => \CONTROL34/CH_IAUX_EN_1[0]\, B => 
        \CONTROL34/CH_IAUX_EN_tmr2_1[0]\, C => 
        \CONTROL34/CH_IAUX_EN_tmr3_1[0]\, Y => 
        \P_CH_IAUX_EN_c_c[2]\);
    
    \CONTROL34/DEL_CNTR_maj[5]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[5]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[5]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[5]\, Y => 
        \CONTROL34/DEL_CNTR[5]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_90\ : AND2
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_8[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_1_3[0]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIH5AL6[2]\ : XA1B
      port map(A => \TX_PROMPT/CNT_VAL_c1\, B => 
        \TX_PROMPT/CNT_VAL[2]_net_1\, C => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n2\);
    
    \OVT_FS/FILT_OUT_maj_RNIHNG7[4]\ : NOR2B
      port map(A => \OVT_FS/FILT_OUT[5]_net_1\, B => 
        \OVT_FS/FILT_OUT[4]_net_1\, Y => \OVT_FS/n_sigout3lto6_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_8\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[8]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_8[0]\);
    
    \CONTROL56/SEQUENCER_STATE_tmr2[5]\ : DFN1C0
      port map(D => \CONTROL56/SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[5]\);
    
    \CONTROL34/DEL_CNTR_tmr2[9]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[9]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[9]\);
    
    \UVL_12FUSE/THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \UVL_12FUSE/THRESH_VAL_2[1]\, B => 
        \UVL_12FUSE/THRESH_VAL_tmr2_2[1]\, C => 
        \UVL_12FUSE/THRESH_VAL_tmr3_2[1]\, Y => 
        \UVL_12FUSE/THRESH_VAL[1]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_12\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[9]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_9[0]\);
    
    \CONTROL56/DEL_CNTR_tmr3[1]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[1]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[1]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNINO6J[6]\ : NOR2A
      port map(A => \CONTROL78/N_312\, B => \CONTROL78/N_222\, Y
         => \CONTROL78/N_CH_MREG_EN_1_sqmuxa\);
    
    \CONTROL34/SEQUENCER_STATE_maj[3]\ : MAJ3
      port map(A => \CONTROL34/SEQUENCER_STATE_1[3]\, B => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[3]\, C => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[3]\, Y => 
        \CONTROL34/SEQUENCER_STATE[3]_net_1\);
    
    \CONTROL12/SEQUENCER_STATE_maj[8]\ : MAJ3
      port map(A => \CONTROL12/SEQUENCER_STATE_2[8]\, B => 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[8]\, C => 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[8]\, Y => 
        \CONTROL12/SEQUENCER_STATE[8]_net_1\);
    
    \OVT_FS/FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => \OVT_FS/FILT_OUT_maj_RNITEJH4_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \OVT_FS/FILT_OUT_tmr3_3[7]\);
    
    \CONTROL34/un1_DEL_CNTR_I_27\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[11]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_10[0]\);
    
    \UVL_34FUSE/un1_tmp_sum_in_b_0_m19\ : AO18
      port map(A => \UVL_34FUSE/FILT_OUT[6]_net_1\, B => 
        \UVL_34FUSE/i10_mux\, C => \UVL_34FUSE/FILT_OUT[7]_net_1\, 
        Y => \UVL_34FUSE/i12_mux\);
    
    \P_CH_VOSG_EN_pad[0]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_VOSG_EN_c[0]\, E => \VCC\, DOUT => 
        \P_CH_VOSG_EN_pad[0]/U0/NET1\, EOUT => 
        \P_CH_VOSG_EN_pad[0]/U0/NET2\);
    
    \CONTROL34/DTYCYC_CNT_n1_i\ : XO1A
      port map(A => \DTYCYC_CNT[0]_net_1\, B => 
        \DTYCYC_CNT[1]_net_1\, C => 
        \CONTROL34/un1_mode_dcyc_normb_1\, Y => \CONTROL34/N_8\);
    
    \CONTROL34/DEL_CNTR_tmr2[1]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[1]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[1]\);
    
    \UVL_34FUSE/FILT_OUT_maj[5]\ : MAJ3
      port map(A => \UVL_34FUSE/FILT_OUT_1[5]\, B => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[5]\, C => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[5]\, Y => 
        \UVL_34FUSE/FILT_OUT[5]_net_1\);
    
    \UVL_12FUSE/SIG_IN_DEL_maj_RNICLUI[0]\ : XOR2
      port map(A => \FPGA_FUSE_1_2_OK_c[0]\, B => 
        \UVL_12FUSE/SIG_IN_DEL[0]_net_1\, Y => 
        \UVL_12FUSE/SIG_IN_DEL_maj_RNICLUI[0]_net_1\);
    
    \J11_21_TCONN_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => \GND\, E => \VCC\, DOUT => 
        \J11_21_TCONN_pad/U0/NET1\, EOUT => 
        \J11_21_TCONN_pad/U0/NET2\);
    
    \CONTROL78/SEQUENCER_STATE_maj[9]\ : MAJ3
      port map(A => \CONTROL78/SEQUENCER_STATE_0[9]\, B => 
        \CONTROL78/SEQUENCER_STATE_tmr2[9]_net_1\, C => 
        \CONTROL78/SEQUENCER_STATE_tmr3[9]_net_1\, Y => 
        \CONTROL78/SEQUENCER_STATE[9]_net_1\);
    
    \UVL_78FUSE/SIG_IN_DEL_tmr2[0]\ : DFN1C0
      port map(D => \FPGA_FUSE_7_8_OK_c[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/SIG_IN_DEL_tmr2[0]_net_1\);
    
    \CONTROL78/DEL_CNTR_maj[1]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[1]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[1]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[1]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[1]_net_1\);
    
    \CONTROL12/CH_MREG_EN_maj_RNIUVMI3[0]\ : MX2
      port map(A => \CONTROL12/N_CH_MREG_EN_1_sqmuxa\, B => 
        \P_CH_MREG_EN_c_c[0]\, S => \CONTROL12/N_290\, Y => 
        \CONTROL12/CH_MREG_EN_maj_RNIUVMI3[0]_net_1\);
    
    \UVL_78FUSE/FILT_OUT_maj_RNIL726C_0[7]\ : AO13
      port map(A => \UVL_78FUSE/N89\, B => 
        \UVL_78FUSE/FILT_OUT[7]_net_1\, C => \UVL_78FUSE/i12_mux\, 
        Y => \UVL_78FUSE/FILT_OUT_maj_RNIL726C_0[7]_net_1\);
    
    \CONTROL78/CH_MREG_EN_maj[0]\ : MAJ3
      port map(A => \CONTROL78/CH_MREG_EN[0]_net_1\, B => 
        \CONTROL78/CH_MREG_EN_tmr2[0]_net_1\, C => 
        \CONTROL78/CH_MREG_EN_tmr3[0]_net_1\, Y => 
        \P_CH_MREG_EN_c_c[6]\);
    
    \UVL_78FUSE/FILT_OUT_maj_RNIL726C[7]\ : XNOR3
      port map(A => \UVL_78FUSE/FILT_OUT[7]_net_1\, B => 
        \UVL_78FUSE/i12_mux\, C => \UVL_78FUSE/N89\, Y => 
        \UVL_78FUSE/FILT_OUT_maj_RNIL726C[7]_net_1\);
    
    \UVL_34FUSE/FILT_OUT_maj_RNIFJDV_0[4]\ : NOR2
      port map(A => \UVL_34FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_34FUSE/FILT_OUT[4]_net_1\, Y => 
        \UVL_34FUSE/n_sigout15lto7_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_63\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_8[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_0_8[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_9[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_4[0]\);
    
    MAN_EN_CH_4TO1_A : DFN1C0
      port map(D => MAN_EN_CH_4TO1_A_14, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        MAN_EN_CH_4TO1_A_0);
    
    \UVL_78FUSE/FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => \UVL_78FUSE/N_33_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_tmr3[0]_net_1\);
    
    \DTYCYC_CNT_maj[2]\ : MAJ3
      port map(A => \DTYCYC_CNT_0[2]\, B => 
        \DTYCYC_CNT_tmr2[2]_net_1\, C => 
        \DTYCYC_CNT_tmr3[2]_net_1\, Y => \DTYCYC_CNT[2]_net_1\);
    
    \CONTROL12/DEL_CNTR_maj[10]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[10]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[10]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[10]\, Y => 
        \CONTROL12/DEL_CNTR[10]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_1\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[0]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_TMP[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_51\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[3]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12[0]\, Y => 
        \CONTROL12/I_51\);
    
    \CONTROL12/un1_DEL_CNTR_I_85\ : AND2
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_4[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_1_1[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_72\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_6[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_0_6[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_7[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_3[0]\);
    
    \CONTROL12/CH_VOSG_EN_tmr3[1]\ : DFN1C0
      port map(D => \CONTROL12/CH_VOSG_EN_maj_RNIFR854[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/CH_VOSG_EN_tmr3_2[1]\);
    
    BUF5M_J11_15_TCONN_inferred_clock : CLKINT
      port map(A => \CLK_5M_GL\, Y => BUF5M_J11_15_TCONN_c);
    
    \UVL_34FUSE/un2_n_filt_out_0_ADD_4x4_fast_I0_CO1\ : XA1A
      port map(A => \UVL_34FUSE/i8_mux\, B => \UVL_34FUSE/N_40\, 
        C => \UVL_34FUSE/SUM_IN_A[4]_net_1\, Y => 
        \UVL_34FUSE/N92\);
    
    \CONTROL12/CH_VOSG_EN_tmr2[1]\ : DFN1C0
      port map(D => \CONTROL12/CH_VOSG_EN_maj_RNIFR854[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/CH_VOSG_EN_tmr2_2[1]\);
    
    \CONTROL78/DEL_CNTR_tmr3[9]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[9]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[9]_net_1\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIJHAE2[9]\ : AO1D
      port map(A => \CONTROL12/N_246\, B => 
        \CONTROL12/SEQUENCER_STATE[9]_net_1\, C => 
        \CONTROL12/SEQUENCER_STATE_ns_i_0[2]_net_1\, Y => 
        \CONTROL12/SEQUENCER_STATE_ns_i_1[2]\);
    
    \TX_PROMPT/CNT_VAL[4]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n4\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[4]\);
    
    \CONTROL34/CH_VOSG_EN_maj[0]\ : MAJ3
      port map(A => \CONTROL34/CH_VOSG_EN_1[0]\, B => 
        \CONTROL34/CH_VOSG_EN_tmr2_1[0]\, C => 
        \CONTROL34/CH_VOSG_EN_tmr3_1[0]\, Y => 
        \P_CH_VOSG_EN_c[2]\);
    
    \UVL_34FUSE/FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => \UVL_34FUSE/N_27_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[3]\);
    
    \CONTROL78/un1_DEL_CNTR_I_26\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[6]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_5[0]\);
    
    \CONTROL78/RET_STATE_maj[4]\ : MAJ3
      port map(A => \CONTROL78/RET_STATE_0[4]\, B => 
        \CONTROL78/RET_STATE_tmr2[4]_net_1\, C => 
        \CONTROL78/RET_STATE_tmr3[4]_net_1\, Y => 
        \CONTROL78/RET_STATE[4]_net_1\);
    
    \CONTROL34/DEL_CNTR_tmr3[5]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[5]\);
    
    \CONTROL34/DEL_CNTR_tmr2[13]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[13]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[13]\);
    
    \CONTROL56/RET_STATE_maj_RNIR0J21[5]\ : MIN3X
      port map(A => \CONTROL56/RET_STATE[5]_net_1\, B => 
        \CONTROL56/RET_STATE[6]_net_1\, C => 
        \CONTROL56/RET_STATE[4]_net_1\, Y => \CONTROL56/N_236\);
    
    \UVL_56FUSE/SIG_IN_DEL_maj_RNIS1J9_0[0]\ : NOR2B
      port map(A => \UVL_56FUSE/SIG_IN_DEL[0]_net_1\, B => 
        \FPGA_FUSE_5_6_OK_c[0]\, Y => 
        \UVL_56FUSE/SIG_IN_DEL_maj_RNIS1J9_0[0]_net_1\);
    
    \CONTROL56/DEL_CNTR_tmr2[14]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[14]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[14]\);
    
    \P_CH_MREG_EN_pad[4]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_MREG_EN_c_c[4]\, E => \VCC\, DOUT => 
        \P_CH_MREG_EN_pad[4]/U0/NET1\, EOUT => 
        \P_CH_MREG_EN_pad[4]/U0/NET2\);
    
    \TX_PROMPT/CNT_VAL[10]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n10\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[10]\);
    
    \P_CH_VOSG_EN_pad[2]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_VOSG_EN_pad[2]/U0/NET1\, E => 
        \P_CH_VOSG_EN_pad[2]/U0/NET2\, PAD => P_CH_VOSG_EN(2));
    
    \CONTROL12/SEQUENCER_STATE_maj[6]\ : MAJ3
      port map(A => \CONTROL12/SEQUENCER_STATE_2[6]\, B => 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[6]\, C => 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[6]\, Y => 
        \CONTROL12/SEQUENCER_STATE[6]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIG90I9[13]\ : NOR2A
      port map(A => \TX_PROMPT/CNT_VAL_n13_tz\, B => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n13\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIQU9FJ[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_58_2\, Y => \CONTROL78/N_DEL_CNTR[14]\);
    
    \UVL_56FUSE/FILT_OUT_maj[5]\ : MAJ3
      port map(A => \UVL_56FUSE/FILT_OUT_0[5]\, B => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[5]\, C => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[5]\, Y => 
        \UVL_56FUSE/FILT_OUT[5]_net_1\);
    
    \UVL_34FUSE/un1_tmp_sum_in_b_0_m7\ : AO18
      port map(A => \UVL_34FUSE/FILT_OUT[2]_net_1\, B => 
        \UVL_34FUSE/i2_mux\, C => \UVL_34FUSE/FILT_OUT[3]_net_1\, 
        Y => \UVL_34FUSE/i4_mux\);
    
    \CONTROL78/SEQUENCER_STATE_maj[5]\ : MAJ3
      port map(A => \CONTROL78/SEQUENCER_STATE_0[5]\, B => 
        \CONTROL78/SEQUENCER_STATE_tmr2[5]_net_1\, C => 
        \CONTROL78/SEQUENCER_STATE_tmr3[5]_net_1\, Y => 
        \CONTROL78/SEQUENCER_STATE[5]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE[5]\ : DFN1C0
      port map(D => \CONTROL34/SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_1[5]\);
    
    MAN_EN_CH_8TO5_A : DFN1C0
      port map(D => MAN_EN_CH_8TO5_A_15, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        MAN_EN_CH_8TO5_A_0);
    
    \UVL_12FUSE/THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \UVL_12FUSE/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/THRESH_VAL_tmr3_2[0]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI4EHL[6]\ : NOR2A
      port map(A => \CONTROL12/RET_STATE[6]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE[6]_net_1\, Y => 
        \CONTROL12/RET_STATE_0_a3_0[6]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI6GA66[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_56_1\, Y => \CONTROL56/N_DEL_CNTR[1]\);
    
    \CLK40M_OSC_pad/U0/U1\ : CLKIO
      port map(A => \CLK40M_OSC_pad/U0/NET1\, Y => CLK40M_OSC_c);
    
    \OVT_FS/FILT_OUT[6]\ : DFN1C0
      port map(D => \OVT_FS/FILT_OUT_maj_RNITEJH4[7]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/FILT_OUT_3[6]\);
    
    \CONTROL78/RET_STATE_maj_RNILBCS4_0[5]\ : NOR3B
      port map(A => \CONTROL78/RET_STATE[5]_net_1\, B => 
        \CONTROL78/N_314\, C => \CONTROL78/RET_STATE[6]_net_1\, Y
         => \CONTROL78/SEQUENCER_STATE_ns[4]\);
    
    \OVT_FS/FILT_OUT_maj[2]\ : MAJ3
      port map(A => \OVT_FS/FILT_OUT_3[2]\, B => 
        \OVT_FS/FILT_OUT_tmr2_3[2]\, C => 
        \OVT_FS/FILT_OUT_tmr3_3[2]\, Y => 
        \OVT_FS/FILT_OUT[2]_net_1\);
    
    \UVL_12FUSE/FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => \UVL_12FUSE/N_33_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[0]\);
    
    \CONTROL78/DEL_CNTR_maj[14]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[14]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[14]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[14]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[14]_net_1\);
    
    \CONTROL12/RET_STATE_maj_RNI3SPL[5]\ : MIN3X
      port map(A => \CONTROL12/RET_STATE[6]_net_1\, B => 
        \CONTROL12/RET_STATE[5]_net_1\, C => 
        \CONTROL12/RET_STATE[4]_net_1\, Y => \CONTROL12/N_236\);
    
    \CONTROL56/DEL_CNTR[9]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[9]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[9]\);
    
    \CONTROL34/CH_VOSG_EN_maj_RNIB8TL2[0]\ : MX2
      port map(A => \CONTROL34/N_CH_VOSG_EN[0]\, B => 
        \P_CH_VOSG_EN_c[2]\, S => \CONTROL34/N_290\, Y => 
        \CONTROL34/CH_VOSG_EN_maj_RNIB8TL2[0]_net_1\);
    
    \P_CH_VOSG_EN_pad[4]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_VOSG_EN_c[4]\, E => \VCC\, DOUT => 
        \P_CH_VOSG_EN_pad[4]/U0/NET1\, EOUT => 
        \P_CH_VOSG_EN_pad[4]/U0/NET2\);
    
    \FPGA_FUSE_5_6_OK_pad[0]/U0/U1\ : IOIN_IB
      port map(YIN => \FPGA_FUSE_5_6_OK_pad[0]/U0/NET1\, Y => 
        \FPGA_FUSE_5_6_OK_c[0]\);
    
    \CONTROL78/DEL_CNTR_maj_RNINLG6[3]\ : NOR2
      port map(A => \CONTROL78/DEL_CNTR[4]_net_1\, B => 
        \CONTROL78/DEL_CNTR[3]_net_1\, Y => 
        \CONTROL78/un8_del_cntr_2\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNINIO42[3]\ : MX2
      port map(A => \CONTROL34/N_312\, B => 
        \CONTROL34/N_CH_VOSG_EN_7[1]\, S => 
        \CONTROL34/N_CH_VOSG_EN_2_sqmuxa\, Y => 
        \CONTROL34/N_CH_VOSG_EN[1]\);
    
    \CONTROL78/DEL_CNTR_tmr2[11]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[11]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[11]_net_1\);
    
    \UVL_34FUSE/THRESH_VAL_maj_RNICPJI5[1]\ : OA1B
      port map(A => \UVL_34FUSE/THRESH_VAL[1]_net_1\, B => 
        \UVL_34FUSE/n_sigout3\, C => \UVL_34FUSE/N_113\, Y => 
        \UVL_34FUSE/THRESH_VAL_maj_RNICPJI5[1]_net_1\);
    
    \CONTROL78/DEL_CNTR[10]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[10]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[10]\);
    
    \CONTROL56/CH_IAUX_EN_tmr2[0]\ : DFN1C0
      port map(D => \CONTROL56/CH_IAUX_EN_maj_RNI9T632[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/CH_IAUX_EN_tmr2_0[0]\);
    
    \CONTROL12/DEL_CNTR_tmr3[13]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[13]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[13]\);
    
    STDBY_OFFB_B_maj : MAJ3
      port map(A => STDBY_OFFB_B_0, B => \STDBY_OFFB_B_tmr2\, C
         => \STDBY_OFFB_B_tmr3\, Y => \STDBY_OFFB_B\);
    
    \CONTROL56/SEQUENCER_STATE_tmr3[6]\ : DFN1C0
      port map(D => \CONTROL56/SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[6]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNI30NCI[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_50_0\, Y => \CONTROL34/N_DEL_CNTR[12]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI709H1[6]\ : AO1A
      port map(A => \CONTROL56/SEQUENCER_STATE[5]_net_1\, B => 
        \CONTROL56/RET_STATE_0_a3_0[5]\, C => 
        \CONTROL56/SEQUENCER_STATE[6]_net_1\, Y => 
        \CONTROL56/SEQUENCER_STATE_maj_RNI709H1[6]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_11\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[6]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_6[0]\);
    
    \CONTROL34/DEL_CNTR_maj[1]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[1]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[1]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[1]\, Y => 
        \CONTROL34/DEL_CNTR[1]_net_1\);
    
    \UVL_34FUSE/FILT_OUT_maj[3]\ : MAJ3
      port map(A => \UVL_34FUSE/FILT_OUT_1[3]\, B => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[3]\, C => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[3]\, Y => 
        \UVL_34FUSE/FILT_OUT[3]_net_1\);
    
    \UVL_12FUSE/SUM_IN_A[5]\ : DFN1C0
      port map(D => 
        \UVL_12FUSE/SIG_IN_DEL_maj_RNICLUI_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/SUM_IN_A_2[5]\);
    
    \OVT_FS/THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \OVT_FS/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/THRESH_VAL_tmr3_3[0]\);
    
    \OVT_FS/SIGOUT_tmr2\ : DFN1C0
      port map(D => \OVT_FS/SIGOUT_maj_RNILN142_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/SIGOUT_tmr2_3\);
    
    DEL0_DEV_RST_B_maj : MAJ3
      port map(A => DEL0_DEV_RST_B_0, B => \DEL0_DEV_RST_B_tmr2\, 
        C => \DEL0_DEV_RST_B_tmr3\, Y => \DEL0_DEV_RST_B\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI64LQV[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_48\, Y => \CONTROL12/N_DEL_CNTR[11]\);
    
    \UVL_56FUSE/FILT_OUT[7]\ : DFN1C0
      port map(D => \UVL_56FUSE/FILT_OUT_maj_RNILIRQ5_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_56FUSE/FILT_OUT_0[7]\);
    
    \CONTROL12/SEQUENCER_STATE_tmr2[6]\ : DFN1C0
      port map(D => \CONTROL12/SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[6]\);
    
    \CONTROL12/RET_STATE_tmr2[5]\ : DFN1C0
      port map(D => 
        \CONTROL12/SEQUENCER_STATE_maj_RNI7V2I1[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/RET_STATE_tmr2_2[5]\);
    
    \TX_PROMPT/CNT_VAL[11]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n11\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[11]\);
    
    \CONTROL34/un1_DEL_CNTR_I_26\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[6]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_5[0]\);
    
    \CONTROL78/DEL_CNTR_tmr3[8]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[8]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[8]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIQ2ON9[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_51_1\, Y => \CONTROL56/N_DEL_CNTR[3]\);
    
    \TX_PROMPT/CNT_VAL[18]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n18\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[18]\);
    
    \CONTROL12/CH_IAUX_EN[0]\ : DFN1C0
      port map(D => \CONTROL12/CH_IAUX_EN_maj_RNI814V2[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/CH_IAUX_EN_2[0]\);
    
    \UVL_12FUSE/un2_n_filt_out_0_PWR_OK_LED_0\ : OR2
      port map(A => UVL_OK_CH1A2, B => UVL_OK_CH3A4, Y => 
        \UVL_12FUSE/PWR_OK_LED_0\);
    
    \PWR_OK_LED_pad/U0/U0\ : IOPAD_TRI
      port map(D => \PWR_OK_LED_pad/U0/NET1\, E => 
        \PWR_OK_LED_pad/U0/NET2\, PAD => PWR_OK_LED);
    
    \CONTROL78/DEL_CNTR_maj[3]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[3]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[3]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[3]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[3]_net_1\);
    
    STDBY_OFFB_A : DFN1C0
      port map(D => STDBY_OFFB_A_16, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => STDBY_OFFB_A_0);
    
    \CONTROL12/SEQUENCER_STATE_tmr2[5]\ : DFN1C0
      port map(D => \CONTROL12/SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[5]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIFM811[4]\ : NOR3C
      port map(A => \TX_PROMPT/CNT_VAL[3]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c2\, C => \TX_PROMPT/CNT_VAL[4]_net_1\, 
        Y => \TX_PROMPT/CNT_VAL_c4\);
    
    \CONTROL34/RET_STATE_maj_RNIOCJ51[9]\ : OR3A
      port map(A => \CONTROL34/RET_STATE[9]_net_1\, B => 
        \CONTROL34/RET_STATE[4]_net_1\, C => \CONTROL34/N_221\, Y
         => \CONTROL34/N_246\);
    
    \TX_PROMPT/CNT_VAL_tmr2[13]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n13\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[13]_net_1\);
    
    \P_CH_MREG_EN_pad[3]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_MREG_EN_pad[3]/U0/NET1\, E => 
        \P_CH_MREG_EN_pad[3]/U0/NET2\, PAD => P_CH_MREG_EN(3));
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIF4FM4[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_52_0\, Y => \CONTROL34/N_DEL_CNTR[2]\);
    
    \CONTROL78/SEQUENCER_STATE_tmr3[9]\ : DFN1P0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNI1A198[8]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr3[9]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_70\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_4[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    \UVL_12FUSE/THRESH_VAL[1]\ : DFN1C0
      port map(D => \UVL_12FUSE/THRESH_VAL_maj_RNISF474[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_12FUSE/THRESH_VAL_2[1]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIKM3O[7]\ : NOR2A
      port map(A => \CONTROL56/RET_STATE[5]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL56/RET_STATE_0_a3_0[5]\);
    
    \CONTROL56/un1_DEL_CNTR_I_89\ : AND2
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_pog_array_1_4[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_2_1[0]\);
    
    \UVL_78FUSE/SIGOUT_tmr2\ : DFN1C0
      port map(D => \UVL_78FUSE/SIGOUT_maj_RNI96K25_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/SIGOUT_tmr2_net_1\);
    
    \UVL_34FUSE/SIG_IN_DEL_maj_RNIKR8E[0]\ : XOR2
      port map(A => \FPGA_FUSE_3_4_OK_c[0]\, B => 
        \UVL_34FUSE/SIG_IN_DEL[0]_net_1\, Y => 
        \UVL_34FUSE/SIG_IN_DEL_maj_RNIKR8E[0]_net_1\);
    
    \CONTROL78/DEL_CNTR_maj_RNILEUM[11]\ : NOR2
      port map(A => \CONTROL78/DEL_CNTR[12]_net_1\, B => 
        \CONTROL78/DEL_CNTR[11]_net_1\, Y => 
        \CONTROL78/un8_del_cntr_6\);
    
    \UVL_12FUSE/FILT_OUT_maj_RNIK85L1[7]\ : AO1
      port map(A => \UVL_12FUSE/n_sigout3lto6_1\, B => 
        \UVL_12FUSE/n_sigout3lto6_0\, C => 
        \UVL_12FUSE/FILT_OUT[7]_net_1\, Y => 
        \UVL_12FUSE/n_sigout3\);
    
    \CONTROL56/un1_DEL_CNTR_I_90\ : AND2
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_8[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_1_3[0]\);
    
    \UVL_78FUSE/FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => \UVL_78FUSE/N_31_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_tmr3[1]_net_1\);
    
    \CONTROL56/RET_STATE_maj_RNIR0J21[4]\ : NOR2A
      port map(A => \CONTROL56/RET_STATE[4]_net_1\, B => 
        \CONTROL56/N_221\, Y => \CONTROL56/N_304\);
    
    \OVT_FS/THRESH_VAL_maj_RNIOLGD1[1]\ : OA1B
      port map(A => \OVT_FS/n_sigout3\, B => 
        \OVT_FS/THRESH_VAL[1]_net_1\, C => \OVT_FS/N_113\, Y => 
        \OVT_FS/THRESH_VAL_maj_RNIOLGD1[1]_net_1\);
    
    \UVL_34FUSE/THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \UVL_34FUSE/THRESH_VAL_maj_RNICPJI5[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_34FUSE/THRESH_VAL_tmr3_1[1]\);
    
    \TX_PROMPT/CNT_VAL_maj[6]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[6]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[6]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[6]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[6]_net_1\);
    
    \CONTROL56/DEL_CNTR_tmr2[0]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[0]\);
    
    \UVL_78FUSE/un1_tmp_sum_in_b_0_m28\ : XNOR3
      port map(A => \UVL_78FUSE/FILT_OUT[4]_net_1\, B => 
        \UVL_78FUSE/FILT_OUT[3]_net_1\, C => \UVL_78FUSE/i4_mux\, 
        Y => \UVL_78FUSE/N_29_i\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIQGNB[9]\ : NOR3B
      port map(A => STATUS_LED_c, B => UVL_OK_CH7A8, C => 
        \CONTROL78/SEQUENCER_STATE[9]_net_1\, Y => 
        \CONTROL78/N_312\);
    
    \CONTROL56/DEL_CNTR_maj[11]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[11]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[11]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[11]\, Y => 
        \CONTROL56/DEL_CNTR[11]_net_1\);
    
    \CONTROL56/DEL_CNTR_tmr3[3]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[3]\);
    
    \CONTROL12/DEL_CNTR_maj[14]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[14]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[14]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[14]\, Y => 
        \CONTROL12/DEL_CNTR[14]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj[17]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[17]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[17]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[17]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[17]_net_1\);
    
    \CONTROL78/CH_VOSG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CONTROL78/CH_VOSG_EN_maj_RNI7A7M1[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/CH_VOSG_EN_tmr2[0]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_18\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[1]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_1[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_13\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[12]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_12[0]\);
    
    \CONTROL12/DEL_CNTR_tmr3[10]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[10]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[10]\);
    
    \CONTROL34/un1_DEL_CNTR_I_17\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[13]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_13[0]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI375NB[20]\ : AXOI5
      port map(A => \TX_PROMPT/un9_cnt_vallt20\, B => 
        \TX_PROMPT/CNT_VAL[20]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_41_0\, Y => \TX_PROMPT/CNT_VAL_n20\);
    
    \OVT_FS/un1_tmp_sum_in_b_0_m19\ : AO18
      port map(A => \OVT_FS/FILT_OUT[6]_net_1\, B => 
        \OVT_FS/i10_mux\, C => \OVT_FS/FILT_OUT[7]_net_1\, Y => 
        \OVT_FS/i12_mux\);
    
    \CONTROL34/RET_STATE[4]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIMULP[5]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/RET_STATE_1[4]\);
    
    \UVL_78FUSE/THRESH_VAL_maj_RNIBBI93[0]\ : AO1A
      port map(A => \UVL_78FUSE/n_sigout3\, B => 
        \UVL_78FUSE/THRESH_VAL[0]_net_1\, C => \UVL_78FUSE/N_113\, 
        Y => \UVL_78FUSE/THRESH_VAL_ns[0]\);
    
    MASTER_RST_B_maj_RNISC93 : CLKINT
      port map(A => \MASTER_RST_B\, Y => POR_OUT_TO_SCA_c);
    
    \CONTROL56/DEL_CNTR[3]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[3]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI1URPO[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_55_1\, Y => \CONTROL56/N_DEL_CNTR[9]\);
    
    \P_CH_IAUX_EN_pad[2]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_IAUX_EN_c_c[2]\, E => \VCC\, DOUT => 
        \P_CH_IAUX_EN_pad[2]/U0/NET1\, EOUT => 
        \P_CH_IAUX_EN_pad[2]/U0/NET2\);
    
    \CONTROL12/DEL_CNTR_tmr3[8]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[8]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[8]\);
    
    \CONTROL12/un1_DEL_CNTR_I_73\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_12[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_0_12[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_13[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_6[0]\);
    
    \UVL_78FUSE/un1_tmp_sum_in_b_0_m7\ : AO18
      port map(A => \UVL_78FUSE/FILT_OUT[2]_net_1\, B => 
        \UVL_78FUSE/i2_mux\, C => \UVL_78FUSE/FILT_OUT[3]_net_1\, 
        Y => \UVL_78FUSE/i4_mux\);
    
    \UVL_56FUSE/SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \UVL_56FUSE/SIG_IN_DEL_maj_RNIS1J9[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_56FUSE/SUM_IN_A_tmr2_0[4]\);
    
    \UVL_12FUSE/FILT_OUT_maj[1]\ : MAJ3
      port map(A => \UVL_12FUSE/FILT_OUT_2[1]\, B => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[1]\, C => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[1]\, Y => 
        \UVL_12FUSE/FILT_OUT[1]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIAO5L[9]\ : NOR3B
      port map(A => STATUS_LED_c, B => UVL_OK_CH3A4, C => 
        \CONTROL34/SEQUENCER_STATE[9]_net_1\, Y => 
        \CONTROL34/N_312\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]\ : NOR2
      port map(A => \CONTROL34/SEQUENCER_STATE[4]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE[3]_net_1\, Y => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\);
    
    \UVL_12FUSE/THRESH_VAL_maj_RNIU7I32[1]\ : NOR3C
      port map(A => \UVL_12FUSE/n_sigout15lto7_1\, B => 
        \UVL_12FUSE/n_sigout15lto7_2\, C => 
        \UVL_12FUSE/THRESH_VAL[1]_net_1\, Y => \UVL_12FUSE/N_113\);
    
    \UVL_34FUSE/FILT_OUT_maj_RNILTKFJ[7]\ : XNOR3
      port map(A => \UVL_34FUSE/FILT_OUT[7]_net_1\, B => 
        \UVL_34FUSE/i12_mux\, C => \UVL_34FUSE/N89\, Y => 
        \UVL_34FUSE/FILT_OUT_maj_RNILTKFJ[7]_net_1\);
    
    \UVL_34FUSE/SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => 
        \UVL_34FUSE/SIG_IN_DEL_maj_RNIKR8E_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/SUM_IN_A_tmr3_1[5]\);
    
    \CONTROL12/un1_DEL_CNTR_I_64\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0[0]\, B
         => \CONTROL12/DWACT_ADD_CI_0_TMP[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_1[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1[0]\);
    
    \TX_PROMPT/CNT_VAL_maj[9]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[9]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[9]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[9]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[9]_net_1\);
    
    \OVT_FS/FILT_OUT[1]\ : DFN1C0
      port map(D => \OVT_FS/N_31_i\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/FILT_OUT_3[1]\);
    
    \UVL_78FUSE/FILT_OUT_maj_RNIVRNJ[3]\ : NOR2B
      port map(A => \UVL_78FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_78FUSE/FILT_OUT[6]_net_1\, Y => 
        \UVL_78FUSE/n_sigout3lto6_0\);
    
    MAN_EN_CH_4TO1_B_tmr2 : DFN1C0
      port map(D => MAN_EN_CH_4TO1_B_17, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_4TO1_B_tmr2\);
    
    \CONTROL12/RET_STATE_maj_RNI5R753[9]\ : NOR3B
      port map(A => \CONTROL12/N_290\, B => 
        \CONTROL12/un8_del_cntr\, C => 
        \CONTROL12/RET_STATE[9]_net_1\, Y => \CONTROL12/N_302\);
    
    \CONTROL34/SEQUENCER_STATE_maj[6]\ : MAJ3
      port map(A => \CONTROL34/SEQUENCER_STATE_1[6]\, B => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[6]\, C => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[6]\, Y => 
        \CONTROL34/SEQUENCER_STATE[6]_net_1\);
    
    \CONTROL56/DEL_CNTR_maj[10]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[10]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[10]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[10]\, Y => 
        \CONTROL56/DEL_CNTR[10]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNINVLP[6]\ : AO1A
      port map(A => \CONTROL34/SEQUENCER_STATE[7]_net_1\, B => 
        \CONTROL34/RET_STATE_0_a3_0[5]\, C => 
        \CONTROL34/SEQUENCER_STATE[6]_net_1\, Y => 
        \CONTROL34/SEQUENCER_STATE_maj_RNINVLP[6]_net_1\);
    
    \CONTROL56/DEL_CNTR_tmr3[5]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[5]\);
    
    \CONTROL12/RET_STATE_tmr2[4]\ : DFN1C0
      port map(D => 
        \CONTROL12/SEQUENCER_STATE_maj_RNI6U2I1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/RET_STATE_tmr2_2[4]\);
    
    \CH7_8_MS_CFG_EN_pad/U0/U1\ : IOIN_IB
      port map(YIN => \CH7_8_MS_CFG_EN_pad/U0/NET1\, Y => 
        CH7_8_MS_CFG_EN_c);
    
    \CONTROL56/SEQUENCER_STATE[5]\ : DFN1C0
      port map(D => \CONTROL56/SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_0[5]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNITO60D[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_55_0\, Y => \CONTROL34/N_DEL_CNTR[9]\);
    
    \CONTROL56/CH_MREG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CONTROL56/CH_MREG_EN_maj_RNI7O3L2[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/CH_MREG_EN_tmr3_0[0]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIOD9U9[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_59_0\, Y => \CONTROL34/N_DEL_CNTR[7]\);
    
    \UVL_12FUSE/un1_tmp_sum_in_b_0_m4\ : OAI1
      port map(A => \UVL_12FUSE/FILT_OUT[2]_net_1\, B => 
        \UVL_12FUSE/FILT_OUT[0]_net_1\, C => 
        \UVL_12FUSE/FILT_OUT[1]_net_1\, Y => \UVL_12FUSE/i2_mux\);
    
    \UVL_34FUSE/FILT_OUT_tmr3[4]\ : DFN1C0
      port map(D => \UVL_34FUSE/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[4]\);
    
    \UVL_34FUSE/FILT_OUT_maj[4]\ : MAJ3
      port map(A => \UVL_34FUSE/FILT_OUT_1[4]\, B => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[4]\, C => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[4]\, Y => 
        \UVL_34FUSE/FILT_OUT[4]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI1QR73[8]\ : AOI1
      port map(A => \CONTROL56/un8_del_cntr\, B => 
        \CONTROL56/SEQUENCER_STATE[8]_net_1\, C => 
        \CONTROL56/SEQUENCER_STATE[9]_net_1\, Y => 
        \CONTROL56/N_313\);
    
    \P_CH_IAUX_EN_pad[6]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_IAUX_EN_c_c[6]\, E => \VCC\, DOUT => 
        \P_CH_IAUX_EN_pad[6]/U0/NET1\, EOUT => 
        \P_CH_IAUX_EN_pad[6]/U0/NET2\);
    
    \CONTROL34/un1_DEL_CNTR_I_88\ : AND2
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_pog_array_1_2[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_2[0]\);
    
    \UVL_34FUSE/un2_n_filt_out_1_ADD_4x4_fast_I4_Y_0\ : MAJ3
      port map(A => \UVL_34FUSE/N_23_i\, B => 
        \UVL_34FUSE/SUM_IN_A[5]_net_1\, C => \UVL_34FUSE/N92\, Y
         => \UVL_34FUSE/N89\);
    
    \CONTROL78/DEL_CNTR[5]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[5]\);
    
    \CONTROL34/SEQUENCER_STATE_ns_i_a2_6[0]\ : NOR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH3A4, C => 
        \STDBY_OFFB_B\, Y => \CONTROL34/N_309\);
    
    \CONTROL78/DEL_CNTR[12]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[12]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[12]\);
    
    DTYCYC_EN_maj : MAJ3
      port map(A => DTYCYC_EN_0, B => \DTYCYC_EN_tmr2\, C => 
        \DTYCYC_EN_tmr3\, Y => \DTYCYC_EN\);
    
    \CONTROL34/un1_DEL_CNTR_I_6\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[3]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_3[0]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI30OU4[17]\ : NOR2B
      port map(A => \TX_PROMPT/CNT_VAL_c16\, B => 
        \TX_PROMPT/CNT_VAL[17]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL_c17\);
    
    MAN_EN_CH_8TO5_B_tmr3 : DFN1C0
      port map(D => MAN_EN_CH_8TO5_B_18, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_8TO5_B_tmr3\);
    
    \TX_PROMPT/CNT_VAL_tmr2[2]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n2\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[2]_net_1\);
    
    \P_CH_IAUX_EN_pad[5]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_IAUX_EN_c_c[4]\, E => \VCC\, DOUT => 
        \P_CH_IAUX_EN_pad[5]/U0/NET1\, EOUT => 
        \P_CH_IAUX_EN_pad[5]/U0/NET2\);
    
    \CONTROL34/DEL_CNTR_tmr3[9]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[9]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[9]\);
    
    \CONTROL12/CH_ACTIVE_STAT_maj\ : MAJ3
      port map(A => \CONTROL12/CH_ACTIVE_STAT_0\, B => 
        \CONTROL12/CH_ACTIVE_STAT_tmr2_0\, C => 
        \CONTROL12/CH_ACTIVE_STAT_tmr3_0\, Y => 
        \CONTROL12.CH_ACTIVE_STAT\);
    
    \UVL_12FUSE/SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \UVL_12FUSE/SIG_IN_DEL_maj_RNICLUI[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_12FUSE/SUM_IN_A_tmr3_2[4]\);
    
    \UVL_12FUSE/SUM_IN_A_maj[5]\ : MAJ3
      port map(A => \UVL_12FUSE/SUM_IN_A_2[5]\, B => 
        \UVL_12FUSE/SUM_IN_A_tmr2_2[5]\, C => 
        \UVL_12FUSE/SUM_IN_A_tmr3_2[5]\, Y => 
        \UVL_12FUSE/SUM_IN_A[5]_net_1\);
    
    \OVT_FS/un1_tmp_sum_in_b_0_m10\ : AO18
      port map(A => \OVT_FS/FILT_OUT[3]_net_1\, B => 
        \OVT_FS/i4_mux\, C => \OVT_FS/FILT_OUT[4]_net_1\, Y => 
        \OVT_FS/i6_mux\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIIGAE2[8]\ : OA1A
      port map(A => \CONTROL12/SEQUENCER_STATE[8]_net_1\, B => 
        \CONTROL12/N_246\, C => \CONTROL12/N_309\, Y => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIIGAE2[8]_net_1\);
    
    \CONTROL12/DEL_CNTR_maj[1]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[1]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[1]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[1]\, Y => 
        \CONTROL12/DEL_CNTR[1]_net_1\);
    
    \UVL_56FUSE/SIGOUT_tmr3\ : DFN1C0
      port map(D => \UVL_56FUSE/SIGOUT_maj_RNIBM6U2_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/SIGOUT_tmr3_0\);
    
    \CONTROL12/SEQUENCER_STATE_tmr2[9]\ : DFN1P0
      port map(D => \CONTROL12/RET_STATE_maj_RNIGJ2Q8[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/SEQUENCER_STATE_tmr2_2[9]\);
    
    \UVL_12FUSE/SIG_IN_DEL_maj[0]\ : MAJ3
      port map(A => \UVL_12FUSE/SIG_IN_DEL_2[0]\, B => 
        \UVL_12FUSE/SIG_IN_DEL_tmr2_2[0]\, C => 
        \UVL_12FUSE/SIG_IN_DEL_tmr3_2[0]\, Y => 
        \UVL_12FUSE/SIG_IN_DEL[0]_net_1\);
    
    \P_CH_MREG_EN_pad[2]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_MREG_EN_pad[2]/U0/NET1\, E => 
        \P_CH_MREG_EN_pad[2]/U0/NET2\, PAD => P_CH_MREG_EN(2));
    
    \P_CH_MREG_EN_pad[5]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_MREG_EN_pad[5]/U0/NET1\, E => 
        \P_CH_MREG_EN_pad[5]/U0/NET2\, PAD => P_CH_MREG_EN(5));
    
    \CONTROL78/SEQUENCER_STATE_tmr2[6]\ : DFN1C0
      port map(D => \CONTROL78/SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr2[6]_net_1\);
    
    \CONTROL78/RET_STATE_maj_RNIQT114[4]\ : NOR2A
      port map(A => \CONTROL78/N_302\, B => 
        \CONTROL78/RET_STATE[4]_net_1\, Y => \CONTROL78/N_314\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNITCQCC[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_53_1\, Y => \CONTROL56/N_DEL_CNTR[4]\);
    
    \CONTROL34/CH_MREG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CONTROL34/CH_MREG_EN_maj_RNISJUL1[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/CH_MREG_EN_tmr2_1[0]\);
    
    \UVL_12FUSE/FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => \UVL_12FUSE/N_27_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[3]\);
    
    \P_CH_IAUX_EN_pad[7]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_IAUX_EN_pad[7]/U0/NET1\, E => 
        \P_CH_IAUX_EN_pad[7]/U0/NET2\, PAD => P_CH_IAUX_EN(7));
    
    \OVT_FS/SIGOUT_maj\ : MAJ3
      port map(A => \OVT_FS/SIGOUT_3\, B => 
        \OVT_FS/SIGOUT_tmr2_3\, C => \OVT_FS/SIGOUT_tmr3_3\, Y
         => STATUS_LED_c);
    
    \CONTROL78/DEL_CNTR_maj[8]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[8]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[8]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[8]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[8]_net_1\);
    
    \CONTROL56/CH_VOSG_EN_tmr2[1]\ : DFN1C0
      port map(D => \CONTROL56/CH_VOSG_EN_maj_RNI4G3C3[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/CH_VOSG_EN_tmr2_0[1]\);
    
    \CONTROL34/un1_DEL_CNTR_I_16\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[11]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_11[0]\);
    
    \UVL_78FUSE/THRESH_VAL[0]\ : DFN1C0
      port map(D => \UVL_78FUSE/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/THRESH_VAL_0[0]\);
    
    MAN_EN_CH_8TO5_A_tmr2 : DFN1C0
      port map(D => MAN_EN_CH_8TO5_A_15, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_8TO5_A_tmr2\);
    
    \CONTROL12/RET_STATE_maj_RNI39HE[5]\ : OR2
      port map(A => \CONTROL12/RET_STATE[5]_net_1\, B => 
        \CONTROL12/RET_STATE[6]_net_1\, Y => \CONTROL12/N_221\);
    
    \UVL_56FUSE/SIGOUT_maj_RNIBM6U2\ : MX2
      port map(A => \UVL_56FUSE/n_sigout3\, B => UVL_OK_CH5A6, S
         => \UVL_56FUSE/N_93\, Y => 
        \UVL_56FUSE/SIGOUT_maj_RNIBM6U2_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_89\ : AND2
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_pog_array_1_4[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_2_1[0]\);
    
    \CONTROL78/un1_DEL_CNTR_I_67\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_10[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_0_10[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_11[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_5[0]\);
    
    \UVL_34FUSE/FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => \UVL_34FUSE/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[4]\);
    
    \UVL_12FUSE/un1_tmp_sum_in_b_0_m19\ : AO18
      port map(A => \UVL_12FUSE/FILT_OUT[6]_net_1\, B => 
        \UVL_12FUSE/i10_mux\, C => \UVL_12FUSE/FILT_OUT[7]_net_1\, 
        Y => \UVL_12FUSE/i12_mux\);
    
    \CONTROL56/CH_VOSG_EN_maj_RNI4G3C3[1]\ : MX2
      port map(A => \CONTROL56/N_CH_VOSG_EN[1]\, B => 
        \P_CH_VOSG_EN_c[5]\, S => \CONTROL56/N_290\, Y => 
        \CONTROL56/CH_VOSG_EN_maj_RNI4G3C3[1]_net_1\);
    
    \J11_19_TCONN_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => \GND\, E => \VCC\, DOUT => 
        \J11_19_TCONN_pad/U0/NET1\, EOUT => 
        \J11_19_TCONN_pad/U0/NET2\);
    
    \MAN_EN_CH_8TO5_pad/U0/U0\ : IOPAD_IN
      port map(PAD => MAN_EN_CH_8TO5, Y => 
        \MAN_EN_CH_8TO5_pad/U0/NET1\);
    
    \CONTROL78/SEQUENCER_STATE[7]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNI9EJD7[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_0[7]\);
    
    \CONTROL12/un1_DEL_CNTR_I_31\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[3]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_2[0]\);
    
    \UVL_34FUSE/SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \UVL_34FUSE/SIG_IN_DEL_maj_RNIKR8E[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_34FUSE/SUM_IN_A_tmr2_1[4]\);
    
    \OVT_FS/SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \OVT_FS/SIG_IN_DEL_maj_RNIMR1A[0]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/SUM_IN_A_tmr3_3[4]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI6DGU1[3]\ : MX2B
      port map(A => \CONTROL56/N_312\, B => 
        \CONTROL56.MAIN_SEQUENCER.un3_n_ch_vosg_en\, S => 
        \CONTROL56/N_CH_VOSG_EN_2_sqmuxa\, Y => 
        \CONTROL56/N_CH_VOSG_EN[0]\);
    
    \UVL_78FUSE/FILT_OUT_tmr3[5]\ : DFN1C0
      port map(D => \UVL_78FUSE/ADD_4x4_fast_I6_Y_3\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_tmr3[5]_net_1\);
    
    \UVL_34FUSE/THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \UVL_34FUSE/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/THRESH_VAL_tmr2_1[0]\);
    
    \CONTROL78/RET_STATE_tmr2[9]\ : DFN1P0
      port map(D => \CONTROL78/RET_STATE_maj_RNIR4SO[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/RET_STATE_tmr2[9]_net_1\);
    
    \UVL_12FUSE/FILT_OUT_maj_RNI7F8L_0[4]\ : NOR2
      port map(A => \UVL_12FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_12FUSE/FILT_OUT[4]_net_1\, Y => 
        \UVL_12FUSE/n_sigout15lto7_1\);
    
    \CONTROL34/DEL_CNTR_maj[3]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[3]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[3]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[3]\, Y => 
        \CONTROL34/DEL_CNTR[3]_net_1\);
    
    \CONTROL56/DEL_CNTR[5]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[5]\);
    
    \CH3_4_MS_CFG_EN_pad/U0/U1\ : IOIN_IB
      port map(YIN => \CH3_4_MS_CFG_EN_pad/U0/NET1\, Y => 
        CH3_4_MS_CFG_EN_c);
    
    \UVL_34FUSE/FILT_OUT_maj_RNIFJDV[4]\ : NOR2B
      port map(A => \UVL_34FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_34FUSE/FILT_OUT[4]_net_1\, Y => 
        \UVL_34FUSE/n_sigout3lto6_1\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIT98E2[8]\ : AOI1
      port map(A => \CONTROL34/un8_del_cntr\, B => 
        \CONTROL34/SEQUENCER_STATE[8]_net_1\, C => 
        \CONTROL34/SEQUENCER_STATE[9]_net_1\, Y => 
        \CONTROL34/N_313\);
    
    \CONTROL12/un1_DEL_CNTR_I_82\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_4[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_0_4[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_5[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_2[0]\);
    
    \CONTROL56/DEL_CNTR[10]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[10]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[10]\);
    
    \CONTROL34/RET_STATE_tmr2[5]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNINVLP[6]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/RET_STATE_tmr2_1[5]\);
    
    \CONTROL12/CH_IAUX_EN_tmr2[0]\ : DFN1C0
      port map(D => \CONTROL12/CH_IAUX_EN_maj_RNI814V2[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/CH_IAUX_EN_tmr2_2[0]\);
    
    \CONTROL78/un1_DEL_CNTR_I_25\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[12]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_11[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_80\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_1_4[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_1_4[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_5[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_2_2[0]\);
    
    \OVT_FS/FILT_OUT_tmr2[4]\ : DFN1C0
      port map(D => \OVT_FS/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/FILT_OUT_tmr2_3[4]\);
    
    \CONTROL34/un1_DEL_CNTR_I_20\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[10]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_9[0]\);
    
    \CONTROL78/SEQUENCER_STATE_maj[4]\ : MAJ3
      port map(A => \CONTROL78/SEQUENCER_STATE_0[4]\, B => 
        \CONTROL78/SEQUENCER_STATE_tmr2[4]_net_1\, C => 
        \CONTROL78/SEQUENCER_STATE_tmr3[4]_net_1\, Y => 
        \CONTROL78/SEQUENCER_STATE[4]_net_1\);
    
    \UVL_78FUSE/THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \UVL_78FUSE/THRESH_VAL_maj_RNICCI93[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_78FUSE/THRESH_VAL_tmr3[1]_net_1\);
    
    \CONTROL56/DEL_CNTR_maj_RNI8AME2[5]\ : NOR3C
      port map(A => \CONTROL56/un8_del_cntr_10\, B => 
        \CONTROL56/un8_del_cntr_9\, C => 
        \CONTROL56/un8_del_cntr_11\, Y => 
        \CONTROL56/un8_del_cntr\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIL68EE[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_54_0\, Y => \CONTROL34/N_DEL_CNTR[10]\);
    
    \CONTROL78/DEL_CNTR_tmr2[7]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[7]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[7]_net_1\);
    
    \OVT_FS/un1_tmp_sum_in_b_0_m26\ : XNOR3
      port map(A => \OVT_FS/FILT_OUT[5]_net_1\, B => 
        \OVT_FS/FILT_OUT[4]_net_1\, C => \OVT_FS/i6_mux\, Y => 
        \OVT_FS/N_27_i\);
    
    \CONTROL34/un1_DEL_CNTR_I_25\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[12]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_11[0]\);
    
    \CONTROL12/RET_STATE_maj_RNIOKU22[9]\ : NOR3B
      port map(A => \CONTROL12/N_290\, B => \CONTROL12/N_236\, C
         => \CONTROL12/RET_STATE[9]_net_1\, Y => 
        \CONTROL12/N_266\);
    
    \UVL_34FUSE/THRESH_VAL_maj_RNIMS9P2_1[1]\ : NOR2A
      port map(A => \UVL_34FUSE/n_sigout3\, B => 
        \UVL_34FUSE/THRESH_VAL[1]_net_1\, Y => \UVL_34FUSE/N_94\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI5RKG3_0[13]\ : AX1C
      port map(A => \TX_PROMPT/CNT_VAL[12]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c11\, C => 
        \TX_PROMPT/CNT_VAL[13]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL_n13_tz\);
    
    \CONTROL56/RET_STATE_tmr3[5]\ : DFN1C0
      port map(D => 
        \CONTROL56/SEQUENCER_STATE_maj_RNI709H1[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/RET_STATE_tmr3_0[5]\);
    
    \CONTROL56/CH_MREG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CONTROL56/CH_MREG_EN_maj_RNI7O3L2[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/CH_MREG_EN_tmr2_0[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_27\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[11]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_10[0]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIUE74C[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_57_0\, Y => \CONTROL34/N_DEL_CNTR[8]\);
    
    \CONTROL56/un1_DEL_CNTR_I_69\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_11_1[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_10[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_4[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_17\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[13]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_13[0]\);
    
    \CONTROL78/DEL_CNTR[14]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[14]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[14]\);
    
    \UVL_56FUSE/THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \UVL_56FUSE/THRESH_VAL_0[1]\, B => 
        \UVL_56FUSE/THRESH_VAL_tmr2_0[1]\, C => 
        \UVL_56FUSE/THRESH_VAL_tmr3_0[1]\, Y => 
        \UVL_56FUSE/THRESH_VAL[1]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIQ4K27[4]\ : NOR2A
      port map(A => \TX_PROMPT/CNT_VAL_n4_tz\, B => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n4\);
    
    \CONTROL56/CH_VOSG_EN[1]\ : DFN1C0
      port map(D => \CONTROL56/CH_VOSG_EN_maj_RNI4G3C3[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/CH_VOSG_EN_0[1]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIDGBB1[9]\ : NOR3A
      port map(A => \CONTROL12/N_236\, B => 
        \CONTROL12/RET_STATE[9]_net_1\, C => 
        \CONTROL12/SEQUENCER_STATE[9]_net_1\, Y => 
        \CONTROL12/N_271\);
    
    \REFCNT_maj_RNI76JC[1]\ : AX1C
      port map(A => \REFCNT[1]_net_1\, B => \REFCNT[0]_net_1\, C
         => \CLK_5M_GL\, Y => \REFCNT_maj_RNI76JC[1]_net_1\);
    
    \DTYCYC_CNT[3]\ : DFN1C0
      port map(D => DTYCYC_CNT_22, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_0[3]\);
    
    \UVL_56FUSE/FILT_OUT[5]\ : DFN1C0
      port map(D => \UVL_56FUSE/ADD_4x4_fast_I6_Y_2\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_0[5]\);
    
    \CONTROL34/DEL_CNTR_tmr2[4]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[4]\);
    
    \TX_PROMPT/CNT_VAL_tmr3[12]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n12\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[12]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_tmr2[4]\ : DFN1C0
      port map(D => \CONTROL56/SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[4]\);
    
    \CONTROL34/DEL_CNTR_maj[8]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[8]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[8]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[8]\, Y => 
        \CONTROL34/DEL_CNTR[8]_net_1\);
    
    CLK_5M_GL_tmr2 : DFN1C0
      port map(D => \REFCNT_maj_RNI76JC[1]_net_1\, CLK => 
        CLK40M_OSC_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CLK_5M_GL_tmr2\);
    
    \CONTROL78/DEL_CNTR_maj_RNI3S6Q[14]\ : NOR3
      port map(A => \CONTROL78/DEL_CNTR[2]_net_1\, B => 
        \CONTROL78/DEL_CNTR[14]_net_1\, C => 
        \CONTROL78/DEL_CNTR[13]_net_1\, Y => 
        \CONTROL78/un8_del_cntr_7\);
    
    \CONTROL12/un1_DEL_CNTR_I_74\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_8[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_3[0]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIPRAE6[9]\ : NOR3
      port map(A => \CONTROL12/N_271\, B => 
        \CONTROL12/SEQUENCER_STATE_ns_i_1[2]\, C => 
        \CONTROL12/N_313\, Y => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIPRAE6[9]_net_1\);
    
    \CONTROL12/CH_VOSG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CONTROL12/CH_VOSG_EN_maj_RNIDKMT3[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/CH_VOSG_EN_tmr3_2[0]\);
    
    \CONTROL12/DEL_CNTR_tmr2[1]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[1]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[1]\);
    
    \UVL_56FUSE/FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => \UVL_56FUSE/ADD_4x4_fast_I6_Y_2\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[5]\);
    
    \CONTROL12/RET_STATE_maj[9]\ : MAJ3
      port map(A => \CONTROL12/RET_STATE_2[9]\, B => 
        \CONTROL12/RET_STATE_tmr2_2[9]\, C => 
        \CONTROL12/RET_STATE_tmr3_2[9]\, Y => 
        \CONTROL12/RET_STATE[9]_net_1\);
    
    \OVT_FS/FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => \OVT_FS/N_29_i\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/FILT_OUT_tmr2_3[2]\);
    
    \CONTROL34/DEL_CNTR_tmr3[2]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[2]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[2]\);
    
    \CONTROL34/DEL_CNTR[6]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[6]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[6]\);
    
    \CONTROL56/RET_STATE_maj_RNIJ12N[5]\ : OR2
      port map(A => \CONTROL56/RET_STATE[6]_net_1\, B => 
        \CONTROL56/RET_STATE[5]_net_1\, Y => \CONTROL56/N_221\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNII59G[5]\ : OR2
      port map(A => \CONTROL34/N_222\, B => 
        \CONTROL34/SEQUENCER_STATE[5]_net_1\, Y => 
        \CONTROL34/N_225\);
    
    \TEMP_OK_pad[0]/U0/U1\ : IOIN_IB
      port map(YIN => \TEMP_OK_pad[0]/U0/NET1\, Y => 
        \TEMP_OK_c[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_31\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[3]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_2[0]\);
    
    \CONTROL12/CH_ACTIVE_STAT_maj_RNIF8952\ : NOR3B
      port map(A => \CONTROL12.CH_ACTIVE_STAT\, B => 
        \CONTROL12/N_309\, C => \CONTROL12/N_230_0\, Y => 
        \CONTROL12/CH_ACTIVE_STAT_maj_RNIF8952_net_1\);
    
    \CONTROL56/RET_STATE[9]\ : DFN1P0
      port map(D => \CONTROL56/RET_STATE_maj_RNIB49H1[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/RET_STATE_0[9]\);
    
    \CONTROL12/CH_IAUX_EN_maj[0]\ : MAJ3
      port map(A => \CONTROL12/CH_IAUX_EN_2[0]\, B => 
        \CONTROL12/CH_IAUX_EN_tmr2_2[0]\, C => 
        \CONTROL12/CH_IAUX_EN_tmr3_2[0]\, Y => 
        \P_CH_IAUX_EN_c_c[0]\);
    
    \UVL_56FUSE/FILT_OUT_maj[4]\ : MAJ3
      port map(A => \UVL_56FUSE/FILT_OUT_0[4]\, B => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[4]\, C => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[4]\, Y => 
        \UVL_56FUSE/FILT_OUT[4]_net_1\);
    
    \CONTROL12/CH_ACTIVE_STAT_maj_RNINVA06\ : AO1
      port map(A => \CONTROL12/N_304\, B => \CONTROL12/N_302\, C
         => \CONTROL12/N_275\, Y => 
        \CONTROL12/SEQUENCER_STATE_ns[5]\);
    
    \UVL_78FUSE/un2_n_filt_out_0_ADD_4x4_fast_I6_Y\ : XOR3
      port map(A => \UVL_78FUSE/N_23_i\, B => 
        \UVL_78FUSE/SUM_IN_A[5]_net_1\, C => \UVL_78FUSE/N92\, Y
         => \UVL_78FUSE/ADD_4x4_fast_I6_Y_3\);
    
    \UVL_78FUSE/SIG_IN_DEL_maj_RNI48TK[0]\ : XOR2
      port map(A => \FPGA_FUSE_7_8_OK_c[0]\, B => 
        \UVL_78FUSE/SIG_IN_DEL[0]_net_1\, Y => 
        \UVL_78FUSE/SIG_IN_DEL_maj_RNI48TK[0]_net_1\);
    
    \OVT_FS/un1_tmp_sum_in_b_0_m15\ : XOR2
      port map(A => \OVT_FS/FILT_OUT[6]_net_1\, B => 
        \OVT_FS/FILT_OUT[5]_net_1\, Y => \OVT_FS/N_40\);
    
    \CONTROL78/SEQUENCER_STATE_tmr3[4]\ : DFN1C0
      port map(D => \CONTROL78/SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr3[4]_net_1\);
    
    VAL_MAN_EN_CH_4TO1_tmr3 : DFN1C0
      port map(D => \DEBOUNCE.man_en_ch_4to1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \VAL_MAN_EN_CH_4TO1_tmr3\);
    
    \CONTROL34/SEQUENCER_STATE[3]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIR2NF1[4]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_1[3]\);
    
    \TX_PROMPT/CNT_VAL[16]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n16\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[16]\);
    
    \CONTROL34/DEL_CNTR[13]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[13]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[13]\);
    
    \CONTROL78/CH_MREG_EN_maj_RNIKHAC1[0]\ : MX2
      port map(A => \CONTROL78/N_CH_MREG_EN_1_sqmuxa\, B => 
        \P_CH_MREG_EN_c_c[6]\, S => \CONTROL78/N_290\, Y => 
        \CONTROL78/CH_MREG_EN_maj_RNIKHAC1[0]_net_1\);
    
    \UVL_78FUSE/FILT_OUT_maj[1]\ : MAJ3
      port map(A => \UVL_78FUSE/FILT_OUT_0[1]\, B => 
        \UVL_78FUSE/FILT_OUT_tmr2[1]_net_1\, C => 
        \UVL_78FUSE/FILT_OUT_tmr3[1]_net_1\, Y => 
        \UVL_78FUSE/FILT_OUT[1]_net_1\);
    
    \OVT_FS/SIG_IN_DEL_tmr2[0]\ : DFN1C0
      port map(D => \TEMP_OK_c[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/SIG_IN_DEL_tmr2_3[0]\);
    
    \CONTROL34/RET_STATE_maj[4]\ : MAJ3
      port map(A => \CONTROL34/RET_STATE_1[4]\, B => 
        \CONTROL34/RET_STATE_tmr2_1[4]\, C => 
        \CONTROL34/RET_STATE_tmr3_1[4]\, Y => 
        \CONTROL34/RET_STATE[4]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_50\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[12]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_10[0]\, Y => 
        \CONTROL12/I_50\);
    
    \CONTROL12/SEQUENCER_STATE_tmr3[5]\ : DFN1C0
      port map(D => \CONTROL12/SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[5]\);
    
    \CONTROL56/CH_MREG_EN[0]\ : DFN1C0
      port map(D => \CONTROL56/CH_MREG_EN_maj_RNI7O3L2[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/CH_MREG_EN_0[0]\);
    
    \TX_PROMPT/CNT_VAL_maj[13]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[13]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[13]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[13]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[13]_net_1\);
    
    \CONTROL56/DEL_CNTR_tmr3[9]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[9]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[9]\);
    
    \CONTROL12/DEL_CNTR_tmr3[12]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[12]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[12]\);
    
    \UVL_78FUSE/un1_tmp_sum_in_b_0_m26\ : XNOR3
      port map(A => \UVL_78FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_78FUSE/FILT_OUT[4]_net_1\, C => \UVL_78FUSE/i6_mux\, 
        Y => \UVL_78FUSE/N_27_i\);
    
    \CONTROL34/un1_DEL_CNTR_I_52\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[2]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1[0]\, Y => 
        \CONTROL34/I_52_0\);
    
    \CONTROL34/SEQUENCER_STATE_tmr2[9]\ : DFN1P0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI12OH7[8]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[9]\);
    
    \UVL_56FUSE/THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \UVL_56FUSE/THRESH_VAL_maj_RNIS23U1[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_56FUSE/THRESH_VAL_tmr3_0[1]\);
    
    \TX_PROMPT/CNT_VAL_tmr2[7]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n7\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[7]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_91\ : AND2
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_10[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_1_4[0]\);
    
    \CONTROL78/SEQUENCER_STATE_tmr3[5]\ : DFN1C0
      port map(D => \CONTROL78/SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr3[5]_net_1\);
    
    \CONTROL12/SEQUENCER_STATE_tmr3[4]\ : DFN1C0
      port map(D => \CONTROL12/SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[4]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIOOPL5[12]\ : OA1
      port map(A => \TX_PROMPT/un9_cnt_vallt17\, B => 
        \TX_PROMPT/un9_cnt_vallto17_0\, C => 
        \TX_PROMPT/un9_cnt_vallto19_0\, Y => 
        \TX_PROMPT/un9_cnt_vallt20\);
    
    \UVL_34FUSE/FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => \UVL_34FUSE/ADD_4x4_fast_I6_Y_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[5]\);
    
    \CONTROL78/CH_MREG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CONTROL78/CH_MREG_EN_maj_RNIKHAC1[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/CH_MREG_EN_tmr2[0]_net_1\);
    
    \CONTROL12/SEQUENCER_STATE_tmr3[6]\ : DFN1C0
      port map(D => \CONTROL12/SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[6]\);
    
    \UVL_78FUSE/un1_tmp_sum_in_b_0_m32\ : AX1
      port map(A => \UVL_78FUSE/FILT_OUT[0]_net_1\, B => 
        \UVL_78FUSE/FILT_OUT[1]_net_1\, C => 
        \UVL_78FUSE/FILT_OUT[2]_net_1\, Y => \UVL_78FUSE/N_33_i\);
    
    \CONTROL34/SEQUENCER_STATE_tmr2[3]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIR2NF1[4]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[3]\);
    
    \UVL_56FUSE/un1_tmp_sum_in_b_0_m28\ : XNOR3
      port map(A => \UVL_56FUSE/FILT_OUT[4]_net_1\, B => 
        \UVL_56FUSE/FILT_OUT[3]_net_1\, C => \UVL_56FUSE/i4_mux\, 
        Y => \UVL_56FUSE/N_29_i\);
    
    MASTER_RST_B : DFN1C0
      port map(D => \DEL0_DEV_RST_B\, CLK => CLK40M_OSC_c, CLR
         => POR_FPGA_c, Q => MASTER_RST_B_0);
    
    \CONTROL78/un1_DEL_CNTR_I_87\ : AND2
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_6[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_1_2[0]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNISLS11[3]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH1A2, C => 
        \CONTROL12/SEQUENCER_STATE[3]_net_1\, Y => 
        \CONTROL12/N_CH_VOSG_EN_2_sqmuxa\);
    
    \UVL_56FUSE/THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \UVL_56FUSE/THRESH_VAL_0[0]\, B => 
        \UVL_56FUSE/THRESH_VAL_tmr2_0[0]\, C => 
        \UVL_56FUSE/THRESH_VAL_tmr3_0[0]\, Y => 
        \UVL_56FUSE/THRESH_VAL[0]_net_1\);
    
    \CONTROL78/CH_IAUX_EN[0]\ : DFN1C0
      port map(D => \CONTROL78/CH_IAUX_EN_maj_RNIIO831[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/CH_IAUX_EN[0]_net_1\);
    
    \CONTROL56/DEL_CNTR_maj[8]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[8]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[8]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[8]\, Y => 
        \CONTROL56/DEL_CNTR[8]_net_1\);
    
    \P_CH_IAUX_EN_pad[4]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_IAUX_EN_c_c[4]\, E => \VCC\, DOUT => 
        \P_CH_IAUX_EN_pad[4]/U0/NET1\, EOUT => 
        \P_CH_IAUX_EN_pad[4]/U0/NET2\);
    
    \TX_FPGA_pad/U0/U0\ : IOPAD_TRI
      port map(D => \TX_FPGA_pad/U0/NET1\, E => 
        \TX_FPGA_pad/U0/NET2\, PAD => TX_FPGA);
    
    \CONTROL12/CH_MREG_EN[0]\ : DFN1C0
      port map(D => \CONTROL12/CH_MREG_EN_maj_RNIUVMI3[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/CH_MREG_EN_2[0]\);
    
    \CH1_2_MS_CFG_EN_pad/U0/U0\ : IOPAD_IN
      port map(PAD => CH1_2_MS_CFG_EN, Y => 
        \CH1_2_MS_CFG_EN_pad/U0/NET1\);
    
    \UVL_78FUSE/SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => 
        \UVL_78FUSE/SIG_IN_DEL_maj_RNI48TK_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/SUM_IN_A_tmr2[5]_net_1\);
    
    \CONTROL12/DEL_CNTR_tmr2[5]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[5]\);
    
    \TX_PROMPT/CNT_VAL_maj[12]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[12]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[12]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[12]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[12]_net_1\);
    
    \CONTROL12/DEL_CNTR_tmr2[13]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[13]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[13]\);
    
    \CONTROL12/CH_VOSG_EN_maj_RNIDKMT3[0]\ : MX2
      port map(A => \CONTROL12/N_CH_VOSG_EN[0]\, B => 
        \P_CH_VOSG_EN_c[0]\, S => \CONTROL12/N_290\, Y => 
        \CONTROL12/CH_VOSG_EN_maj_RNIDKMT3[0]_net_1\);
    
    \REGISTER_CH_CMD_CH[4]\ : DFN1C0
      port map(D => \VAL_MAN_EN_CH_8TO5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \REGISTER_CH_CMD_CH_0[4]\);
    
    \CONTROL78/un1_DEL_CNTR_I_22\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[9]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_8[0]\);
    
    \CONTROL12/SEQUENCER_STATE_tmr3[8]\ : DFN1C0
      port map(D => \CONTROL12/N_315\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[8]\);
    
    \CONTROL12/un1_DEL_CNTR_I_53\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[4]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_2[0]\, Y => 
        \CONTROL12/I_53\);
    
    \CONTROL56/RET_STATE_maj_RNI8UHA2[9]\ : NOR3B
      port map(A => \CONTROL56/N_290\, B => \CONTROL56/N_236\, C
         => \CONTROL56/RET_STATE[9]_net_1\, Y => 
        \CONTROL56/N_266\);
    
    \UVL_78FUSE/FILT_OUT[3]\ : DFN1C0
      port map(D => \UVL_78FUSE/N_27_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_0[3]\);
    
    \CONTROL34/RET_STATE[9]\ : DFN1P0
      port map(D => \CONTROL34/RET_STATE_maj_RNIR3MP[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/RET_STATE_1[9]\);
    
    \MODE_DCYC_NORMB_pad/U0/U0\ : IOPAD_IN
      port map(PAD => MODE_DCYC_NORMB, Y => 
        \MODE_DCYC_NORMB_pad/U0/NET1\);
    
    \CONTROL78/DEL_CNTR_tmr3[14]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[14]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[14]_net_1\);
    
    MASTER_RST_B_maj : MAJ3
      port map(A => MASTER_RST_B_0, B => \MASTER_RST_B_tmr2\, C
         => \MASTER_RST_B_tmr3\, Y => \MASTER_RST_B\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNID2DNT[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_54\, Y => \CONTROL12/N_DEL_CNTR[10]\);
    
    \CONTROL34/DEL_CNTR_tmr3[1]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[1]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[1]\);
    
    \CONTROL34/STDBY_OFFB_B_19\ : MX2
      port map(A => \STDBY_OFFB_B\, B => \STDBY_OFFB_A\, S => 
        N_23_i_c, Y => STDBY_OFFB_B_19);
    
    \CONTROL78/CH_VOSG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CONTROL78/CH_VOSG_EN_maj_RNI7A7M1[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/CH_VOSG_EN_tmr3[0]_net_1\);
    
    \UVL_78FUSE/SIG_IN_DEL_maj_RNI48TK_0[0]\ : NOR2B
      port map(A => \UVL_78FUSE/SIG_IN_DEL[0]_net_1\, B => 
        \FPGA_FUSE_7_8_OK_c[0]\, Y => 
        \UVL_78FUSE/SIG_IN_DEL_maj_RNI48TK_0[0]_net_1\);
    
    \TX_PROMPT/CNT_VAL_tmr3[11]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n11\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[11]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE[8]\ : DFN1C0
      port map(D => \CONTROL34/N_315\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_1[8]\);
    
    \UVL_34FUSE/FILT_OUT[4]\ : DFN1C0
      port map(D => \UVL_34FUSE/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_1[4]\);
    
    \CONTROL78/RET_STATE_tmr2[6]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIO1SO[5]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/RET_STATE_tmr2[6]_net_1\);
    
    \UVL_56FUSE/un1_tmp_sum_in_b_0_m10\ : AO18
      port map(A => \UVL_56FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_56FUSE/i4_mux\, C => \UVL_56FUSE/FILT_OUT[4]_net_1\, 
        Y => \UVL_56FUSE/i6_mux\);
    
    \UVL_34FUSE/THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \UVL_34FUSE/THRESH_VAL_maj_RNICPJI5[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_34FUSE/THRESH_VAL_tmr2_1[1]\);
    
    STDBY_OFFB_B_tmr3 : DFN1C0
      port map(D => STDBY_OFFB_B_19, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \STDBY_OFFB_B_tmr3\);
    
    \CONTROL56/DEL_CNTR_tmr2[6]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[6]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[6]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIO1SO[5]\ : AO1A
      port map(A => \CONTROL78/SEQUENCER_STATE[5]_net_1\, B => 
        \CONTROL78/RET_STATE_0_a3_0[6]\, C => 
        \CONTROL78/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIO1SO[5]_net_1\);
    
    \CONTROL12/DEL_CNTR_tmr3[0]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[0]\);
    
    \UVL_56FUSE/FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => \UVL_56FUSE/N_27_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[3]\);
    
    \TX_PROMPT/CNT_VAL_tmr3[8]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n8\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[8]_net_1\);
    
    \CONTROL56/DEL_CNTR_maj[1]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[1]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[1]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[1]\, Y => 
        \CONTROL56/DEL_CNTR[1]_net_1\);
    
    \CONTROL78/DEL_CNTR_maj_RNIB1871[0]\ : NOR3C
      port map(A => \CONTROL78/un8_del_cntr_2\, B => 
        \CONTROL78/un8_del_cntr_1\, C => 
        \CONTROL78/un8_del_cntr_7\, Y => 
        \CONTROL78/un8_del_cntr_11\);
    
    \CONTROL34/un1_DEL_CNTR_I_10\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[4]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_4[0]\);
    
    \CONTROL78/un1_DEL_CNTR_I_57\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[8]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_3[0]\, Y => 
        \CONTROL78/I_57_2\);
    
    \CONTROL78/un1_DEL_CNTR_I_16\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[11]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_11[0]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIMRGC3[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/DWACT_ADD_CI_0_partial_sum[0]\, Y => 
        \CONTROL34/N_DEL_CNTR[0]\);
    
    \CONTROL34/RET_STATE_maj[9]\ : MAJ3
      port map(A => \CONTROL34/RET_STATE_1[9]\, B => 
        \CONTROL34/RET_STATE_tmr2_1[9]\, C => 
        \CONTROL34/RET_STATE_tmr3_1[9]\, Y => 
        \CONTROL34/RET_STATE[9]_net_1\);
    
    \UVL_56FUSE/SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => 
        \UVL_56FUSE/SIG_IN_DEL_maj_RNIS1J9_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/SUM_IN_A_tmr3_0[5]\);
    
    \CONTROL56/un1_DEL_CNTR_I_49\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[6]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_11[0]\, Y => 
        \CONTROL56/I_49_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIB1AD[4]\ : NOR2
      port map(A => \TX_PROMPT/CNT_VAL[4]_net_1\, B => 
        \TX_PROMPT/CNT_VAL[5]_net_1\, Y => 
        \TX_PROMPT/un9_cnt_vallto5_0\);
    
    \OVT_FS/un1_tmp_sum_in_b_0_m4\ : OAI1
      port map(A => \OVT_FS/FILT_OUT[2]_net_1\, B => 
        \OVT_FS/FILT_OUT[0]_net_1\, C => 
        \OVT_FS/FILT_OUT[1]_net_1\, Y => \OVT_FS/i2_mux\);
    
    \CONTROL56/un1_DEL_CNTR_I_91\ : AND2
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_10[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_1_4[0]\);
    
    \CONTROL34/DEL_CNTR[11]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[11]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[11]\);
    
    \UVL_56FUSE/un2_n_filt_out_1_ADD_4x4_fast_I4_Y_0\ : MAJ3
      port map(A => \UVL_56FUSE/N_23_i\, B => 
        \UVL_56FUSE/SUM_IN_A[5]_net_1\, C => \UVL_56FUSE/N92\, Y
         => \UVL_56FUSE/N89\);
    
    \CONTROL12/DEL_CNTR_maj[6]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[6]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[6]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[6]\, Y => 
        \CONTROL12/DEL_CNTR[6]_net_1\);
    
    \TX_PROMPT/MS250_CLK_EN_SIG_maj\ : MAJ3
      port map(A => \TX_PROMPT/MS250_CLK_EN_SIG_net_1\, B => 
        \TX_PROMPT/MS250_CLK_EN_SIG_tmr2_net_1\, C => 
        \TX_PROMPT/MS250_CLK_EN_SIG_tmr3_net_1\, Y => N_23_i_c);
    
    \CONTROL78/RET_STATE_maj_RNILBCS4[5]\ : NOR3B
      port map(A => \CONTROL78/RET_STATE[6]_net_1\, B => 
        \CONTROL78/N_314\, C => \CONTROL78/RET_STATE[5]_net_1\, Y
         => \CONTROL78/SEQUENCER_STATE_ns[3]\);
    
    \CONTROL34/MAIN_SEQUENCER.N_CH_VOSG_EN_7_1[1]\ : OR2B
      port map(A => \REGISTER_CH_CMD_CH[0]_net_1\, B => 
        \DTYCYC_EN\, Y => 
        \CONTROL34.MAIN_SEQUENCER.N_CH_VOSG_EN_7_1[1]\);
    
    \CONTROL12/SEQUENCER_STATE_maj[9]\ : MAJ3
      port map(A => \CONTROL12/SEQUENCER_STATE_2[9]\, B => 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[9]\, C => 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[9]\, Y => 
        \CONTROL12/SEQUENCER_STATE[9]_net_1\);
    
    \CONTROL12/DEL_CNTR_tmr2[10]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[10]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[10]\);
    
    \OVT_FS/FILT_OUT[4]\ : DFN1C0
      port map(D => \OVT_FS/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/FILT_OUT_3[4]\);
    
    \REFCNT_tmr3[0]\ : DFN1C0
      port map(D => \REFCNT_i[0]\, CLK => CLK40M_OSC_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \REFCNT_tmr3[0]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj[7]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[7]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[7]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[7]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[7]_net_1\);
    
    \CONTROL12/RET_STATE[4]\ : DFN1C0
      port map(D => 
        \CONTROL12/SEQUENCER_STATE_maj_RNI6U2I1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/RET_STATE_2[4]\);
    
    \CONTROL34/RET_STATE_tmr3[6]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIO0MP[5]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/RET_STATE_tmr3_1[6]\);
    
    \CONTROL78/un1_DEL_CNTR_I_60\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[13]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_5[0]\, Y => 
        \CONTROL78/I_60_2\);
    
    \CONTROL78/un1_DEL_CNTR_I_29\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[4]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_3[0]\);
    
    \CONTROL34/SEQUENCER_STATE_tmr2[4]\ : DFN1C0
      port map(D => \CONTROL34/SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[4]\);
    
    \CONTROL12/DEL_CNTR_tmr3[1]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[1]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[1]\);
    
    \CONTROL56/un1_DEL_CNTR_I_60\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[13]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_5[0]\, Y => 
        \CONTROL56/I_60_1\);
    
    \CONTROL56/CH_IAUX_EN_maj_RNI9T632[0]\ : MX2
      port map(A => \CONTROL56/N_CH_IAUX_EN_1_sqmuxa\, B => 
        \P_CH_IAUX_EN_c_c[4]\, S => \CONTROL56/N_290\, Y => 
        \CONTROL56/CH_IAUX_EN_maj_RNI9T632[0]_net_1\);
    
    \CONTROL12/DEL_CNTR_maj[9]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[9]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[9]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[9]\, Y => 
        \CONTROL12/DEL_CNTR[9]_net_1\);
    
    \UVL_56FUSE/FILT_OUT_maj_RNINNI9[4]\ : NOR2B
      port map(A => \UVL_56FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_56FUSE/FILT_OUT[4]_net_1\, Y => 
        \UVL_56FUSE/n_sigout3lto6_1\);
    
    \OVT_FS/THRESH_VAL_maj_RNINKGD1[0]\ : AO1A
      port map(A => \OVT_FS/n_sigout3\, B => 
        \OVT_FS/THRESH_VAL[0]_net_1\, C => \OVT_FS/N_113\, Y => 
        \OVT_FS/THRESH_VAL_ns[0]\);
    
    \CONTROL56/RET_STATE_tmr2[9]\ : DFN1P0
      port map(D => \CONTROL56/RET_STATE_maj_RNIB49H1[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/RET_STATE_tmr2_0[9]\);
    
    \UVL_34FUSE/un1_tmp_sum_in_b_0_m4\ : OAI1
      port map(A => \UVL_34FUSE/FILT_OUT[2]_net_1\, B => 
        \UVL_34FUSE/FILT_OUT[0]_net_1\, C => 
        \UVL_34FUSE/FILT_OUT[1]_net_1\, Y => \UVL_34FUSE/i2_mux\);
    
    \TX_PROMPT/CNT_VAL_tmr2[18]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n18\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[18]_net_1\);
    
    \CONTROL56/CH_ACTIVE_STAT_maj_RNI0KEN1_0\ : NOR3A
      port map(A => \CONTROL56/N_309\, B => \CONTROL56/N_230_0\, 
        C => \CONTROL56.CH_ACTIVE_STAT\, Y => \CONTROL56/N_275\);
    
    \CONTROL56/CH_ACTIVE_STAT_maj_RNI0KEN1\ : NOR3B
      port map(A => \CONTROL56.CH_ACTIVE_STAT\, B => 
        \CONTROL56/N_309\, C => \CONTROL56/N_230_0\, Y => 
        \CONTROL56/CH_ACTIVE_STAT_maj_RNI0KEN1_net_1\);
    
    \UVL_34FUSE/THRESH_VAL[0]\ : DFN1C0
      port map(D => \UVL_34FUSE/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/THRESH_VAL_1[0]\);
    
    \UVL_56FUSE/un1_tmp_sum_in_b_0_m19\ : AO18
      port map(A => \UVL_56FUSE/FILT_OUT[6]_net_1\, B => 
        \UVL_56FUSE/i10_mux\, C => \UVL_56FUSE/FILT_OUT[7]_net_1\, 
        Y => \UVL_56FUSE/i12_mux\);
    
    \CONTROL78/RET_STATE_maj_RNIOTKM1[9]\ : OR3A
      port map(A => \CONTROL78/RET_STATE[9]_net_1\, B => 
        \CONTROL78/RET_STATE[4]_net_1\, C => \CONTROL78/N_221\, Y
         => \CONTROL78/N_246\);
    
    \CONTROL12/RET_STATE_maj_RNI3SPL[4]\ : NOR2A
      port map(A => \CONTROL12/RET_STATE[4]_net_1\, B => 
        \CONTROL12/N_221\, Y => \CONTROL12/N_304\);
    
    \CONTROL34/RET_STATE_tmr3[5]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNINVLP[6]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/RET_STATE_tmr3_1[5]\);
    
    \UVL_34FUSE/FILT_OUT[2]\ : DFN1C0
      port map(D => \UVL_34FUSE/N_29_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_1[2]\);
    
    \CLK40M_OSC_pad/U0/U0\ : IOPAD_IN
      port map(PAD => CLK40M_OSC, Y => \CLK40M_OSC_pad/U0/NET1\);
    
    \TX_PROMPT/CNT_VAL_maj[20]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[20]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[20]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[20]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[20]_net_1\);
    
    \REFCNT[1]\ : DFN1C0
      port map(D => SUM1, CLK => CLK40M_OSC_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \REFCNT_0[1]\);
    
    \CONTROL56/DEL_CNTR_maj[5]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[5]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[5]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[5]\, Y => 
        \CONTROL56/DEL_CNTR[5]_net_1\);
    
    \CONTROL12/DEL_CNTR[11]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[11]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[11]\);
    
    \CONTROL34/DEL_CNTR[14]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[14]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[14]\);
    
    \P_CH_MREG_EN_pad[3]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_MREG_EN_c_c[2]\, E => \VCC\, DOUT => 
        \P_CH_MREG_EN_pad[3]/U0/NET1\, EOUT => 
        \P_CH_MREG_EN_pad[3]/U0/NET2\);
    
    \OVT_FS/THRESH_VAL_maj_RNISAOM[1]\ : NOR3C
      port map(A => \OVT_FS/n_sigout15lto7_1\, B => 
        \OVT_FS/n_sigout15lto7_2\, C => 
        \OVT_FS/THRESH_VAL[1]_net_1\, Y => \OVT_FS/N_113\);
    
    \CONTROL78/DEL_CNTR_tmr2[3]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[3]_net_1\);
    
    \CONTROL34/DEL_CNTR_maj_RNIVROO[9]\ : NOR3A
      port map(A => \CONTROL34/un8_del_cntr_6\, B => 
        \CONTROL34/DEL_CNTR[9]_net_1\, C => 
        \CONTROL34/DEL_CNTR[10]_net_1\, Y => 
        \CONTROL34/un8_del_cntr_10\);
    
    \CONTROL12/SEQUENCER_STATE_tmr3[9]\ : DFN1P0
      port map(D => \CONTROL12/RET_STATE_maj_RNIGJ2Q8[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/SEQUENCER_STATE_tmr3_2[9]\);
    
    \UVL_78FUSE/FILT_OUT_maj[0]\ : MAJ3
      port map(A => \UVL_78FUSE/FILT_OUT_0[0]\, B => 
        \UVL_78FUSE/FILT_OUT_tmr2[0]_net_1\, C => 
        \UVL_78FUSE/FILT_OUT_tmr3[0]_net_1\, Y => 
        \UVL_78FUSE/FILT_OUT[0]_net_1\);
    
    \UVL_34FUSE/un1_tmp_sum_in_b_0_m15\ : XOR2
      port map(A => \UVL_34FUSE/FILT_OUT[6]_net_1\, B => 
        \UVL_34FUSE/FILT_OUT[5]_net_1\, Y => \UVL_34FUSE/N_40\);
    
    \CH7_8_MS_CFG_EN_pad/U0/U0\ : IOPAD_IN
      port map(PAD => CH7_8_MS_CFG_EN, Y => 
        \CH7_8_MS_CFG_EN_pad/U0/NET1\);
    
    \CONTROL78/SEQUENCER_STATE_tmr2[5]\ : DFN1C0
      port map(D => \CONTROL78/SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr2[5]_net_1\);
    
    \UVL_34FUSE/FILT_OUT_maj_RNI83IE2[7]\ : AO1
      port map(A => \UVL_34FUSE/n_sigout3lto6_1\, B => 
        \UVL_34FUSE/n_sigout3lto6_0\, C => 
        \UVL_34FUSE/FILT_OUT[7]_net_1\, Y => 
        \UVL_34FUSE/n_sigout3\);
    
    \OVT_FS/SIG_IN_DEL[0]\ : DFN1C0
      port map(D => \TEMP_OK_c[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/SIG_IN_DEL_3[0]\);
    
    \UVL_12FUSE/THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \UVL_12FUSE/THRESH_VAL_maj_RNISF474[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_12FUSE/THRESH_VAL_tmr2_2[1]\);
    
    \TX_PROMPT/CNT_VAL[17]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n17\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[17]\);
    
    \CONTROL56/SEQUENCER_STATE[3]\ : DFN1C0
      port map(D => \CONTROL56/CH_ACTIVE_STAT_maj_RNI0KEN1_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/SEQUENCER_STATE_0[3]\);
    
    \CONTROL56/RET_STATE[4]\ : DFN1C0
      port map(D => 
        \CONTROL56/SEQUENCER_STATE_maj_RNI6V8H1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/RET_STATE_0[4]\);
    
    \CONTROL34/un1_DEL_CNTR_I_78\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_4[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_11_1[0]\);
    
    \CONTROL56/RET_STATE_maj_RNI854E1[9]\ : OR3A
      port map(A => \CONTROL56/RET_STATE[9]_net_1\, B => 
        \CONTROL56/RET_STATE[4]_net_1\, C => \CONTROL56/N_221\, Y
         => \CONTROL56/N_246\);
    
    \CONTROL12/un1_DEL_CNTR_I_28\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[8]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_7[0]\);
    
    \CONTROL12/DEL_CNTR_tmr3[6]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[6]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[6]\);
    
    \UVL_12FUSE/FILT_OUT_maj[0]\ : MAJ3
      port map(A => \UVL_12FUSE/FILT_OUT_2[0]\, B => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[0]\, C => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[0]\, Y => 
        \UVL_12FUSE/FILT_OUT[0]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_18\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[1]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_1[0]\);
    
    \CONTROL12/RET_STATE_maj_RNI8N1R3[4]\ : NOR3B
      port map(A => \CONTROL12/N_302\, B => \CONTROL12/N_299\, C
         => \CONTROL12/RET_STATE[4]_net_1\, Y => 
        \CONTROL12/SEQUENCER_STATE_ns[3]\);
    
    \CONTROL34/CH_VOSG_EN_tmr3[1]\ : DFN1C0
      port map(D => \CONTROL34/CH_VOSG_EN_maj_RNIHBN23[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/CH_VOSG_EN_tmr3_1[1]\);
    
    STDBY_OFFB_B_tmr2 : DFN1C0
      port map(D => STDBY_OFFB_B_19, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \STDBY_OFFB_B_tmr2\);
    
    \CONTROL34/MAN_EN_CH_4TO1_B_17\ : MX2
      port map(A => \MAN_EN_CH_4TO1_B\, B => \MAN_EN_CH_4TO1_A\, 
        S => N_23_i_c, Y => MAN_EN_CH_4TO1_B_17);
    
    \CONTROL12/MAIN_SEQUENCER.N_CH_VOSG_EN_7[1]\ : OR2
      port map(A => CH1_2_MS_CFG_EN_c, B => 
        \CONTROL34.MAIN_SEQUENCER.N_CH_VOSG_EN_7_1[1]\, Y => 
        \CONTROL12/N_CH_VOSG_EN_7[1]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIA14T9[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_51\, Y => \CONTROL12/N_DEL_CNTR[3]\);
    
    \UVL_56FUSE/THRESH_VAL_tmr3[0]\ : DFN1C0
      port map(D => \UVL_56FUSE/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/THRESH_VAL_tmr3_0[0]\);
    
    \TX_PROMPT/CNT_VAL[8]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n8\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[8]\);
    
    \CONTROL34/DEL_CNTR_maj[14]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[14]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[14]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[14]\, Y => 
        \CONTROL34/DEL_CNTR[14]_net_1\);
    
    \CONTROL34/DEL_CNTR[8]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[8]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[8]\);
    
    \CONTROL34/un1_DEL_CNTR_I_74\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_8[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_3[0]\);
    
    \FPGA_FUSE_7_8_OK_pad[0]/U0/U1\ : IOIN_IB
      port map(YIN => \FPGA_FUSE_7_8_OK_pad[0]/U0/NET1\, Y => 
        \FPGA_FUSE_7_8_OK_c[0]\);
    
    \OVT_FS/FILT_OUT_tmr3[2]\ : DFN1C0
      port map(D => \OVT_FS/N_29_i\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/FILT_OUT_tmr3_3[2]\);
    
    \CONTROL12/un1_DEL_CNTR_I_54\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[10]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_11_1[0]\, Y => 
        \CONTROL12/I_54\);
    
    \CONTROL12/DEL_CNTR_maj[4]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[4]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[4]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[4]\, Y => 
        \CONTROL12/DEL_CNTR[4]_net_1\);
    
    \CONTROL78/RET_STATE_tmr3[9]\ : DFN1P0
      port map(D => \CONTROL78/RET_STATE_maj_RNIR4SO[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/RET_STATE_tmr3[9]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_79\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_1_2[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_1_2[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_3[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_2_1[0]\);
    
    \UVL_12FUSE/un1_tmp_sum_in_b_0_m16\ : AO18
      port map(A => \UVL_12FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_12FUSE/i8_mux\, C => \UVL_12FUSE/FILT_OUT[6]_net_1\, 
        Y => \UVL_12FUSE/i10_mux\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIH1S51[9]\ : NOR3B
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH1A2, C => 
        \CONTROL12/SEQUENCER_STATE[9]_net_1\, Y => 
        \CONTROL12/N_312\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI6EP84[8]\ : NOR3B
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH1A2, C => 
        \CONTROL12/N_285\, Y => \CONTROL12/N_315\);
    
    \J11_21_TCONN_pad/U0/U0\ : IOPAD_TRI
      port map(D => \J11_21_TCONN_pad/U0/NET1\, E => 
        \J11_21_TCONN_pad/U0/NET2\, PAD => J11_21_TCONN);
    
    \UVL_56FUSE/FILT_OUT[4]\ : DFN1C0
      port map(D => \UVL_56FUSE/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_0[4]\);
    
    \CONTROL56/CH_ACTIVE_STAT_maj_RNIGSMG6\ : AO1
      port map(A => \CONTROL56/N_304\, B => \CONTROL56/N_302\, C
         => \CONTROL56/N_275\, Y => 
        \CONTROL56/SEQUENCER_STATE_ns[5]\);
    
    \UVL_12FUSE/THRESH_VAL_maj_RNIRE474[0]\ : AO1A
      port map(A => \UVL_12FUSE/n_sigout3\, B => 
        \UVL_12FUSE/THRESH_VAL[0]_net_1\, C => \UVL_12FUSE/N_113\, 
        Y => \UVL_12FUSE/THRESH_VAL_ns[0]\);
    
    \OVT_FS/un1_tmp_sum_in_b_0_m13\ : AO18
      port map(A => \OVT_FS/FILT_OUT[4]_net_1\, B => 
        \OVT_FS/i6_mux\, C => \OVT_FS/FILT_OUT[5]_net_1\, Y => 
        \OVT_FS/i8_mux\);
    
    \CONTROL56/CH_VOSG_EN_maj[1]\ : MAJ3
      port map(A => \CONTROL56/CH_VOSG_EN_0[1]\, B => 
        \CONTROL56/CH_VOSG_EN_tmr2_0[1]\, C => 
        \CONTROL56/CH_VOSG_EN_tmr3_0[1]\, Y => 
        \P_CH_VOSG_EN_c[5]\);
    
    \CONTROL12/DEL_CNTR[14]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[14]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[14]\);
    
    \UVL_56FUSE/FILT_OUT_maj_RNI56CE[3]\ : NOR3
      port map(A => \UVL_56FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_56FUSE/FILT_OUT[7]_net_1\, C => 
        \UVL_56FUSE/FILT_OUT[6]_net_1\, Y => 
        \UVL_56FUSE/n_sigout15lto7_2\);
    
    \CONTROL12/un1_DEL_CNTR_I_81\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_2_1[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_2_2[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_10[0]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIMULP[5]\ : OA1B
      port map(A => \CONTROL34/RET_STATE[4]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE[5]_net_1\, C => 
        \CONTROL34/N_222\, Y => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIMULP[5]_net_1\);
    
    \P_CH_VOSG_EN_pad[7]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_VOSG_EN_pad[7]/U0/NET1\, E => 
        \P_CH_VOSG_EN_pad[7]/U0/NET2\, PAD => P_CH_VOSG_EN(7));
    
    \CONTROL78/DEL_CNTR_tmr2[2]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[2]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[2]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj[11]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[11]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[11]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[11]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[11]_net_1\);
    
    \POR_OUT_TO_SCA_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => POR_OUT_TO_SCA_c, E => \VCC\, DOUT => 
        \POR_OUT_TO_SCA_pad/U0/NET1\, EOUT => 
        \POR_OUT_TO_SCA_pad/U0/NET2\);
    
    \CONTROL34/SEQUENCER_STATE_maj[7]\ : MAJ3
      port map(A => \CONTROL34/SEQUENCER_STATE_1[7]\, B => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[7]\, C => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[7]\, Y => 
        \CONTROL34/SEQUENCER_STATE[7]_net_1\);
    
    \UVL_12FUSE/un2_n_filt_out_1_ADD_4x4_fast_I4_Y_0\ : MAJ3
      port map(A => \UVL_12FUSE/N_23_i\, B => 
        \UVL_12FUSE/SUM_IN_A[5]_net_1\, C => \UVL_12FUSE/N92\, Y
         => \UVL_12FUSE/N89\);
    
    \TX_PROMPT/CNT_VAL_tmr3[19]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n19\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[19]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNI6L3P2[8]\ : OA1C
      port map(A => \CONTROL34/SEQUENCER_STATE[8]_net_1\, B => 
        \CONTROL34/un8_del_cntr\, C => \CONTROL34/N_225\, Y => 
        \CONTROL34/N_285\);
    
    \CONTROL12/un1_DEL_CNTR_I_30\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[1]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0[0]\);
    
    \UVL_78FUSE/SUM_IN_A_tmr2[4]\ : DFN1C0
      port map(D => \UVL_78FUSE/SIG_IN_DEL_maj_RNI48TK[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_78FUSE/SUM_IN_A_tmr2[4]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj[19]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[19]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[19]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[19]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[19]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_77\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_1[0]\, B
         => \CONTROL78/DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_1[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_2[0]\);
    
    \CONTROL56/DEL_CNTR_maj_RNIAFPC[5]\ : NOR3A
      port map(A => \CONTROL56/un8_del_cntr_4\, B => 
        \CONTROL56/DEL_CNTR[6]_net_1\, C => 
        \CONTROL56/DEL_CNTR[5]_net_1\, Y => 
        \CONTROL56/un8_del_cntr_9\);
    
    \OVT_FS/FILT_OUT_maj[5]\ : MAJ3
      port map(A => \OVT_FS/FILT_OUT_3[5]\, B => 
        \OVT_FS/FILT_OUT_tmr2_3[5]\, C => 
        \OVT_FS/FILT_OUT_tmr3_3[5]\, Y => 
        \OVT_FS/FILT_OUT[5]_net_1\);
    
    \CONTROL34/RET_STATE_maj[6]\ : MAJ3
      port map(A => \CONTROL34/RET_STATE_1[6]\, B => 
        \CONTROL34/RET_STATE_tmr2_1[6]\, C => 
        \CONTROL34/RET_STATE_tmr3_1[6]\, Y => 
        \CONTROL34/RET_STATE[6]_net_1\);
    
    \CONTROL12/DEL_CNTR_maj[13]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[13]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[13]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[13]\, Y => 
        \CONTROL12/DEL_CNTR[13]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_80\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_1_4[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_1_4[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_5[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_2_2[0]\);
    
    \UVL_34FUSE/FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => \UVL_34FUSE/FILT_OUT_maj_RNILTKFJ[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_34FUSE/FILT_OUT_tmr2_1[6]\);
    
    \TX_PROMPT/CNT_VAL_tmr2[5]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[5]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_26\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[6]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_5[0]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIM1MU5[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_56\, Y => \CONTROL12/N_DEL_CNTR[1]\);
    
    \CONTROL56/SEQUENCER_STATE_maj[5]\ : MAJ3
      port map(A => \CONTROL56/SEQUENCER_STATE_0[5]\, B => 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[5]\, C => 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[5]\, Y => 
        \CONTROL56/SEQUENCER_STATE[5]_net_1\);
    
    \DTYCYC_CNT_tmr3[2]\ : DFN1C0
      port map(D => DTYCYC_CNT_23, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr3[2]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIAN41N[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_57_1\, Y => \CONTROL56/N_DEL_CNTR[8]\);
    
    \CONTROL12/un1_DEL_CNTR_I_16\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[11]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_11[0]\);
    
    \UVL_56FUSE/THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \UVL_56FUSE/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/THRESH_VAL_tmr2_0[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_81\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_2_1[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_2_2[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_10[0]\);
    
    \CONTROL34/SEQUENCER_STATE[6]\ : DFN1C0
      port map(D => \CONTROL34/SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_1[6]\);
    
    \CONTROL34/DEL_CNTR_maj[7]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[7]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[7]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[7]\, Y => 
        \CONTROL34/DEL_CNTR[7]_net_1\);
    
    \UVL_34FUSE/un1_tmp_sum_in_b_0_m32\ : AX1
      port map(A => \UVL_34FUSE/FILT_OUT[0]_net_1\, B => 
        \UVL_34FUSE/FILT_OUT[1]_net_1\, C => 
        \UVL_34FUSE/FILT_OUT[2]_net_1\, Y => \UVL_34FUSE/N_33_i\);
    
    \CONTROL34/RET_STATE_maj_RNIDQ5U3[4]\ : NOR3B
      port map(A => \CONTROL34/N_302\, B => \CONTROL34/N_299\, C
         => \CONTROL34/RET_STATE[4]_net_1\, Y => 
        \CONTROL34/SEQUENCER_STATE_ns[3]\);
    
    \CONTROL34/CH_MREG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CONTROL34/CH_MREG_EN_maj_RNISJUL1[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/CH_MREG_EN_tmr3_1[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_83\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_2[0]\, B
         => \CONTROL34/DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_2_1[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_3[0]\);
    
    \OVT_FS/un2_n_filt_out_0_ADD_4x4_fast_I6_Y\ : XOR3
      port map(A => \OVT_FS/N_23_i\, B => 
        \OVT_FS/SUM_IN_A[5]_net_1\, C => \OVT_FS/N92\, Y => 
        \OVT_FS/ADD_4x4_fast_I6_Y\);
    
    \TX_PROMPT/CNT_VAL_tmr3[0]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n0\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[0]_net_1\);
    
    \DTYCYC_CNT_tmr3[1]\ : DFN1P0
      port map(D => DTYCYC_CNT_24, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr3[1]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIR2NF1[4]\ : NOR3B
      port map(A => \CONTROL12.CH_ACTIVE_STAT\, B => 
        \CONTROL34/N_309\, C => \CONTROL34/N_230_0\, Y => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIR2NF1[4]_net_1\);
    
    \UVL_34FUSE/SUM_IN_A_maj[5]\ : MAJ3
      port map(A => \UVL_34FUSE/SUM_IN_A_1[5]\, B => 
        \UVL_34FUSE/SUM_IN_A_tmr2_1[5]\, C => 
        \UVL_34FUSE/SUM_IN_A_tmr3_1[5]\, Y => 
        \UVL_34FUSE/SUM_IN_A[5]_net_1\);
    
    \CONTROL34/DTYCYC_CNT_n4_i_o2\ : OR2
      port map(A => \CONTROL34/N_15\, B => \DTYCYC_CNT[3]_net_1\, 
        Y => \CONTROL34/N_16\);
    
    \P_CH_VOSG_EN_pad[2]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_VOSG_EN_c[2]\, E => \VCC\, DOUT => 
        \P_CH_VOSG_EN_pad[2]/U0/NET1\, EOUT => 
        \P_CH_VOSG_EN_pad[2]/U0/NET2\);
    
    \CONTROL12/SEQUENCER_STATE[4]\ : DFN1C0
      port map(D => \CONTROL12/SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_2[4]\);
    
    \CONTROL78/DEL_CNTR_tmr2[8]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[8]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[8]_net_1\);
    
    \OVT_FS/FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => \OVT_FS/FILT_OUT_maj_RNITEJH4_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \OVT_FS/FILT_OUT_tmr2_3[7]\);
    
    MASTER_RST_B_tmr3 : DFN1C0
      port map(D => \DEL0_DEV_RST_B\, CLK => CLK40M_OSC_c, CLR
         => POR_FPGA_c, Q => \MASTER_RST_B_tmr3\);
    
    \CONTROL34/RET_STATE_tmr2[4]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIMULP[5]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/RET_STATE_tmr2_1[4]\);
    
    \PRI_RX_EN_BAR_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => \GND\, E => \VCC\, DOUT => 
        \PRI_RX_EN_BAR_pad/U0/NET1\, EOUT => 
        \PRI_RX_EN_BAR_pad/U0/NET2\);
    
    \CONTROL78/un1_DEL_CNTR_I_63\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_8[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_0_8[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_9[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_4[0]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNI9N5L[8]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH3A4, C => 
        \CONTROL34/SEQUENCER_STATE[8]_net_1\, Y => 
        \CONTROL34/N_290\);
    
    \P_CH_MREG_EN_pad[2]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_MREG_EN_c_c[2]\, E => \VCC\, DOUT => 
        \P_CH_MREG_EN_pad[2]/U0/NET1\, EOUT => 
        \P_CH_MREG_EN_pad[2]/U0/NET2\);
    
    \UVL_12FUSE/THRESH_VAL_maj_RNISF474[1]\ : OA1B
      port map(A => \UVL_12FUSE/n_sigout3\, B => 
        \UVL_12FUSE/THRESH_VAL[1]_net_1\, C => \UVL_12FUSE/N_113\, 
        Y => \UVL_12FUSE/THRESH_VAL_maj_RNISF474[1]_net_1\);
    
    \P_CH_MREG_EN_pad[5]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_MREG_EN_c_c[4]\, E => \VCC\, DOUT => 
        \P_CH_MREG_EN_pad[5]/U0/NET1\, EOUT => 
        \P_CH_MREG_EN_pad[5]/U0/NET2\);
    
    \CONTROL34/DEL_CNTR_maj_RNI5MDE[11]\ : NOR2
      port map(A => \CONTROL34/DEL_CNTR[12]_net_1\, B => 
        \CONTROL34/DEL_CNTR[11]_net_1\, Y => 
        \CONTROL34/un8_del_cntr_6\);
    
    \SCA_DAT_IN_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => N_23_i_c, E => \VCC\, DOUT => 
        \SCA_DAT_IN_pad/U0/NET1\, EOUT => 
        \SCA_DAT_IN_pad/U0/NET2\);
    
    \UVL_78FUSE/FILT_OUT_maj_RNIHSJT[3]\ : NOR3
      port map(A => \UVL_78FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_78FUSE/FILT_OUT[7]_net_1\, C => 
        \UVL_78FUSE/FILT_OUT[6]_net_1\, Y => 
        \UVL_78FUSE/n_sigout15lto7_2\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIS0562[9]\ : AO1D
      port map(A => \CONTROL34/N_246\, B => 
        \CONTROL34/SEQUENCER_STATE[9]_net_1\, C => 
        \CONTROL34/SEQUENCER_STATE_ns_i_0[2]_net_1\, Y => 
        \CONTROL34/SEQUENCER_STATE_ns_i_1[2]\);
    
    \CONTROL78/SEQUENCER_STATE_tmr3[8]\ : DFN1C0
      port map(D => \CONTROL78/N_315\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr3[8]_net_1\);
    
    \CONTROL56/RET_STATE_maj_RNIB49H1[9]\ : NOR2A
      port map(A => \CONTROL56/RET_STATE[9]_net_1\, B => 
        \CONTROL56/N_225\, Y => 
        \CONTROL56/RET_STATE_maj_RNIB49H1[9]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_29\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[4]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_3[0]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIOF8T7[8]\ : NOR2A
      port map(A => \TX_PROMPT/CNT_VAL_n8_tz\, B => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n8\);
    
    \CONTROL12/un1_DEL_CNTR_I_19\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[7]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_6[0]\);
    
    \UVL_12FUSE/THRESH_VAL_maj_RNIRE474_0[0]\ : AO1A
      port map(A => \UVL_12FUSE/n_sigout3\, B => 
        \UVL_12FUSE/THRESH_VAL[0]_net_1\, C => \UVL_12FUSE/N_95\, 
        Y => \UVL_12FUSE/N_93\);
    
    \CONTROL78/DEL_CNTR_tmr2[0]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[0]_net_1\);
    
    \UVL_56FUSE/FILT_OUT_maj_RNINNI9[3]\ : NOR2B
      port map(A => \UVL_56FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_56FUSE/FILT_OUT[6]_net_1\, Y => 
        \UVL_56FUSE/n_sigout3lto6_0\);
    
    \CONTROL56/DEL_CNTR[12]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[12]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[12]\);
    
    \CONTROL78/DEL_CNTR_tmr3[5]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[5]_net_1\);
    
    \CONTROL78/DEL_CNTR_tmr3[3]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[3]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_50\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[12]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_10[0]\, Y => 
        \CONTROL78/I_50_2\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI63SG4[8]\ : NOR3B
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH5A6, C => 
        \CONTROL56/N_285\, Y => \CONTROL56/N_315\);
    
    \CONTROL56/un1_DEL_CNTR_I_29\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[4]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_3[0]\);
    
    \UVL_78FUSE/THRESH_VAL[1]\ : DFN1C0
      port map(D => \UVL_78FUSE/THRESH_VAL_maj_RNICCI93[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_78FUSE/THRESH_VAL_0[1]\);
    
    \CONTROL34/DEL_CNTR_tmr2[2]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[2]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[2]\);
    
    \OVT_FS/SIG_IN_DEL_tmr3[0]\ : DFN1C0
      port map(D => \TEMP_OK_c[0]\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/SIG_IN_DEL_tmr3_3[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_67\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_10[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_0_10[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_11[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_5[0]\);
    
    \P_CH_MREG_EN_pad[1]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_MREG_EN_pad[1]/U0/NET1\, E => 
        \P_CH_MREG_EN_pad[1]/U0/NET2\, PAD => P_CH_MREG_EN(1));
    
    \CONTROL12/DEL_CNTR_tmr2[12]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[12]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[12]\);
    
    \CONTROL78/DEL_CNTR_maj[2]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[2]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[2]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[2]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[2]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIL4VR6[3]\ : XA1B
      port map(A => \TX_PROMPT/CNT_VAL_c2\, B => 
        \TX_PROMPT/CNT_VAL[3]_net_1\, C => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n3\);
    
    \TX_PROMPT/CNT_VAL[19]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n19\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[19]\);
    
    \OVT_FS/SUM_IN_A_tmr3[5]\ : DFN1C0
      port map(D => \OVT_FS/SIG_IN_DEL_maj_RNIMR1A_0[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \OVT_FS/SUM_IN_A_tmr3_3[5]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIOIBO7[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_62_0\, Y => \CONTROL34/N_DEL_CNTR[5]\);
    
    DEL0_DEV_RST_B : DFN1C0
      port map(D => \VCC\, CLK => CLK40M_OSC_c, CLR => POR_FPGA_c, 
        Q => DEL0_DEV_RST_B_0);
    
    \CONTROL34/DEL_CNTR_tmr3[4]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[4]\);
    
    \OVT_FS/FILT_OUT_tmr3[0]\ : DFN1C0
      port map(D => \OVT_FS/N_33_i\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/FILT_OUT_tmr3_3[0]\);
    
    \CONTROL56/RET_STATE_tmr3[9]\ : DFN1P0
      port map(D => \CONTROL56/RET_STATE_maj_RNIB49H1[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/RET_STATE_tmr3_0[9]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIR2NF1_0[4]\ : NOR3A
      port map(A => \CONTROL34/N_309\, B => \CONTROL34/N_230_0\, 
        C => \CONTROL12.CH_ACTIVE_STAT\, Y => \CONTROL34/N_275\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI6V8H1[5]\ : OA1B
      port map(A => \CONTROL56/RET_STATE[4]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE[5]_net_1\, C => 
        \CONTROL56/N_222\, Y => 
        \CONTROL56/SEQUENCER_STATE_maj_RNI6V8H1[5]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_62\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[5]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_1[0]\, Y => 
        \CONTROL34/I_62_0\);
    
    \CONTROL12/CH_MREG_EN_maj[0]\ : MAJ3
      port map(A => \CONTROL12/CH_MREG_EN_2[0]\, B => 
        \CONTROL12/CH_MREG_EN_tmr2_2[0]\, C => 
        \CONTROL12/CH_MREG_EN_tmr3_2[0]\, Y => 
        \P_CH_MREG_EN_c_c[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_30\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[1]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0[0]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI7V2I1[6]\ : AO1A
      port map(A => \CONTROL12/SEQUENCER_STATE[7]_net_1\, B => 
        \CONTROL12/RET_STATE_0_a3_0[5]\, C => 
        \CONTROL12/SEQUENCER_STATE[6]_net_1\, Y => 
        \CONTROL12/SEQUENCER_STATE_maj_RNI7V2I1[6]_net_1\);
    
    \OVT_FS/FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => \OVT_FS/FILT_OUT_maj_RNITEJH4[7]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/FILT_OUT_tmr3_3[6]\);
    
    \UVL_78FUSE/THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \UVL_78FUSE/THRESH_VAL_0[1]\, B => 
        \UVL_78FUSE/THRESH_VAL_tmr2[1]_net_1\, C => 
        \UVL_78FUSE/THRESH_VAL_tmr3[1]_net_1\, Y => 
        \UVL_78FUSE/THRESH_VAL[1]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj[8]\ : MAJ3
      port map(A => \CONTROL56/SEQUENCER_STATE_0[8]\, B => 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[8]\, C => 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[8]\, Y => 
        \CONTROL56/SEQUENCER_STATE[8]_net_1\);
    
    \CONTROL34/CH_MREG_EN_maj[0]\ : MAJ3
      port map(A => \CONTROL34/CH_MREG_EN_1[0]\, B => 
        \CONTROL34/CH_MREG_EN_tmr2_1[0]\, C => 
        \CONTROL34/CH_MREG_EN_tmr3_1[0]\, Y => 
        \P_CH_MREG_EN_c_c[2]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNISPIE1[6]\ : NOR3C
      port map(A => \TX_PROMPT/CNT_VAL[5]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c4\, C => \TX_PROMPT/CNT_VAL[6]_net_1\, 
        Y => \TX_PROMPT/CNT_VAL_c6\);
    
    \OVT_FS/THRESH_VAL_tmr3[1]\ : DFN1C0
      port map(D => \OVT_FS/THRESH_VAL_maj_RNIOLGD1[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \OVT_FS/THRESH_VAL_tmr3_3[1]\);
    
    \OVT_FS/SIGOUT_maj_0\ : MAJ3
      port map(A => \OVT_FS/SIGOUT_3\, B => 
        \OVT_FS/SIGOUT_tmr2_3\, C => \OVT_FS/SIGOUT_tmr3_3\, Y
         => STATUS_LED_c_0);
    
    \CONTROL78/MAIN_SEQUENCER.N_CH_VOSG_EN_7[1]\ : OR2A
      port map(A => \CONTROL56.MAIN_SEQUENCER.un3_n_ch_vosg_en\, 
        B => CH7_8_MS_CFG_EN_c, Y => 
        \CONTROL78/N_CH_VOSG_EN_7[1]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIAT17L[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_58_0\, Y => \CONTROL34/N_DEL_CNTR[14]\);
    
    \P_CH_IAUX_EN_pad[2]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_IAUX_EN_pad[2]/U0/NET1\, E => 
        \P_CH_IAUX_EN_pad[2]/U0/NET2\, PAD => P_CH_IAUX_EN(2));
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIRJR51_0[4]\ : NOR3A
      port map(A => \CONTROL78/N_309\, B => \CONTROL78/N_230_0\, 
        C => \CONTROL56.CH_ACTIVE_STAT\, Y => \CONTROL78/N_275\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNI30CC1[3]\ : MX2
      port map(A => \CONTROL78/N_312\, B => 
        \CONTROL78/N_CH_VOSG_EN_7[1]\, S => 
        \CONTROL78/N_CH_VOSG_EN_2_sqmuxa\, Y => 
        \CONTROL78/N_CH_VOSG_EN[1]\);
    
    \CONTROL34/RET_STATE_maj_RNIBLPI[5]\ : OR2
      port map(A => \CONTROL34/RET_STATE[5]_net_1\, B => 
        \CONTROL34/RET_STATE[6]_net_1\, Y => \CONTROL34/N_221\);
    
    \BUF5M_J11_15_TCONN_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => BUF5M_J11_15_TCONN_c, E => \VCC\, DOUT => 
        \BUF5M_J11_15_TCONN_pad/U0/NET1\, EOUT => 
        \BUF5M_J11_15_TCONN_pad/U0/NET2\);
    
    \CONTROL34/MAIN_SEQUENCER.N_CH_VOSG_EN_7[1]\ : OR2
      port map(A => CH3_4_MS_CFG_EN_c, B => 
        \CONTROL34.MAIN_SEQUENCER.N_CH_VOSG_EN_7_1[1]\, Y => 
        \CONTROL34/N_CH_VOSG_EN_7[1]\);
    
    \CONTROL12/DEL_CNTR_tmr2[7]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[7]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[7]\);
    
    \CONTROL78/CH_IAUX_EN_maj_RNIIO831[0]\ : MX2
      port map(A => \CONTROL78/N_CH_IAUX_EN_1_sqmuxa\, B => 
        \P_CH_IAUX_EN_c_c[6]\, S => \CONTROL78/N_290\, Y => 
        \CONTROL78/CH_IAUX_EN_maj_RNIIO831[0]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_87\ : AND2
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_6[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_1_2[0]\);
    
    \CONTROL78/DEL_CNTR_tmr2[14]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[14]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[14]_net_1\);
    
    \CONTROL12/RET_STATE_tmr3[9]\ : DFN1P0
      port map(D => \CONTROL12/RET_STATE_maj_RNIB33I1[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/RET_STATE_tmr3_2[9]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIOOPL5[19]\ : NOR2B
      port map(A => \TX_PROMPT/CNT_VAL[19]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c18\, Y => \TX_PROMPT/CNT_VAL_41_0\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIEE30B[17]\ : XA1B
      port map(A => \TX_PROMPT/CNT_VAL[17]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c16\, C => \TX_PROMPT/un9_cnt_val\, Y
         => \TX_PROMPT/CNT_VAL_n17\);
    
    \UVL_56FUSE/FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => \UVL_56FUSE/N_31_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[1]\);
    
    \CONTROL34/DTYCYC_CNT_23\ : MX2A
      port map(A => \CONTROL34/N_64\, B => \DTYCYC_CNT[2]_net_1\, 
        S => \CONTROL34/N_DTYCYC_CNT_2_sqmuxa\, Y => 
        DTYCYC_CNT_23);
    
    \CONTROL34/un1_DEL_CNTR_I_90\ : AND2
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_8[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_1_3[0]\);
    
    \REFCNT_tmr2[1]\ : DFN1C0
      port map(D => SUM1, CLK => CLK40M_OSC_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \REFCNT_tmr2[1]_net_1\);
    
    \P_CH_VOSG_EN_pad[3]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_VOSG_EN_pad[3]/U0/NET1\, E => 
        \P_CH_VOSG_EN_pad[3]/U0/NET2\, PAD => P_CH_VOSG_EN(3));
    
    \UVL_34FUSE/SIG_IN_DEL_maj_RNIKR8E_0[0]\ : NOR2B
      port map(A => \UVL_34FUSE/SIG_IN_DEL[0]_net_1\, B => 
        \FPGA_FUSE_3_4_OK_c[0]\, Y => 
        \UVL_34FUSE/SIG_IN_DEL_maj_RNIKR8E_0[0]_net_1\);
    
    \UVL_34FUSE/un2_n_filt_out_0_ADD_4x4_fast_I0_S\ : XNOR3
      port map(A => \UVL_34FUSE/i8_mux\, B => \UVL_34FUSE/N_40\, 
        C => \UVL_34FUSE/SUM_IN_A[4]_net_1\, Y => 
        \UVL_34FUSE/un2_n_filt_out0[28]\);
    
    \POR_FPGA_pad/U0/U0\ : IOPAD_IN
      port map(PAD => POR_FPGA, Y => \POR_FPGA_pad/U0/NET1\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIPJHMQ[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_55\, Y => \CONTROL12/N_DEL_CNTR[9]\);
    
    \CONTROL78/DEL_CNTR_tmr2[6]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[6]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[6]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIQHEV5[9]\ : NOR3
      port map(A => \CONTROL34/N_271\, B => 
        \CONTROL34/SEQUENCER_STATE_ns_i_1[2]\, C => 
        \CONTROL34/N_313\, Y => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIQHEV5[9]_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIDFT28[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_49_2\, Y => \CONTROL78/N_DEL_CNTR[6]\);
    
    \UVL_34FUSE/SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \UVL_34FUSE/SUM_IN_A_1[4]\, B => 
        \UVL_34FUSE/SUM_IN_A_tmr2_1[4]\, C => 
        \UVL_34FUSE/SUM_IN_A_tmr3_1[4]\, Y => 
        \UVL_34FUSE/SUM_IN_A[4]_net_1\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI7BP251[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_50\, Y => \CONTROL12/N_DEL_CNTR[12]\);
    
    VAL_MAN_EN_CH_4TO1_tmr2 : DFN1C0
      port map(D => \DEBOUNCE.man_en_ch_4to1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \VAL_MAN_EN_CH_4TO1_tmr2\);
    
    \UVL_56FUSE/FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => \UVL_56FUSE/N_31_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[1]\);
    
    \DTYCYC_CNT_tmr2[1]\ : DFN1P0
      port map(D => DTYCYC_CNT_24, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr2[1]_net_1\);
    
    \UVL_34FUSE/un2_n_filt_out_0_ADD_4x4_fast_I6_Y\ : XOR3
      port map(A => \UVL_34FUSE/N_23_i\, B => 
        \UVL_34FUSE/SUM_IN_A[5]_net_1\, C => \UVL_34FUSE/N92\, Y
         => \UVL_34FUSE/ADD_4x4_fast_I6_Y_1\);
    
    \CONTROL34/DEL_CNTR_maj[12]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[12]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[12]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[12]\, Y => 
        \CONTROL34/DEL_CNTR[12]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_30\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[1]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0[0]\);
    
    \CONTROL78/SEQUENCER_STATE_ns_i_a2_6[0]\ : NOR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH7A8, C => 
        \STDBY_OFFB_B\, Y => \CONTROL78/N_309\);
    
    \FPGA_FUSE_1_2_OK_pad[0]/U0/U0\ : IOPAD_IN
      port map(PAD => FPGA_FUSE_1_2_OK(0), Y => 
        \FPGA_FUSE_1_2_OK_pad[0]/U0/NET1\);
    
    \CONTROL78/un1_DEL_CNTR_I_1\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[0]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_TMP[0]\);
    
    \CONTROL12/DEL_CNTR_maj[5]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[5]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[5]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[5]\, Y => 
        \CONTROL12/DEL_CNTR[5]_net_1\);
    
    \UVL_78FUSE/un1_tmp_sum_in_b_0_m4\ : OAI1
      port map(A => \UVL_78FUSE/FILT_OUT[2]_net_1\, B => 
        \UVL_78FUSE/FILT_OUT[0]_net_1\, C => 
        \UVL_78FUSE/FILT_OUT[1]_net_1\, Y => \UVL_78FUSE/i2_mux\);
    
    \SCA_DAT_IN_pad/U0/U0\ : IOPAD_TRI
      port map(D => \SCA_DAT_IN_pad/U0/NET1\, E => 
        \SCA_DAT_IN_pad/U0/NET2\, PAD => SCA_DAT_IN);
    
    \DTYCYC_CNT[1]\ : DFN1P0
      port map(D => DTYCYC_CNT_24, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_0[1]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIRFNH2[9]\ : AO1D
      port map(A => \CONTROL78/N_246\, B => 
        \CONTROL78/SEQUENCER_STATE[9]_net_1\, C => 
        \CONTROL78/SEQUENCER_STATE_ns_i_0[2]_net_1\, Y => 
        \CONTROL78/SEQUENCER_STATE_ns_i_1[2]\);
    
    \CONTROL56/un1_DEL_CNTR_I_59\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[7]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_2[0]\, Y => 
        \CONTROL56/I_59_1\);
    
    \CONTROL56/RET_STATE_maj_RNIL7LM3[9]\ : NOR3B
      port map(A => \CONTROL56/N_290\, B => 
        \CONTROL56/un8_del_cntr\, C => 
        \CONTROL56/RET_STATE[9]_net_1\, Y => \CONTROL56/N_302\);
    
    \TX_PROMPT/CNT_VAL_maj[0]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[0]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[0]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[0]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[0]_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIMV1EA[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_57_2\, Y => \CONTROL78/N_DEL_CNTR[8]\);
    
    \CONTROL34/DTYCYC_CNT_n4_i\ : XO1A
      port map(A => \DTYCYC_CNT[4]_net_1\, B => \CONTROL34/N_16\, 
        C => \CONTROL34/un1_mode_dcyc_normb_1\, Y => 
        \CONTROL34/N_4\);
    
    \TX_FPGA_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => \DTYCYC_EN\, E => \VCC\, DOUT => 
        \TX_FPGA_pad/U0/NET1\, EOUT => \TX_FPGA_pad/U0/NET2\);
    
    \UVL_78FUSE/un1_tmp_sum_in_b_0_m10\ : AO18
      port map(A => \UVL_78FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_78FUSE/i4_mux\, C => \UVL_78FUSE/FILT_OUT[4]_net_1\, 
        Y => \UVL_78FUSE/i6_mux\);
    
    \TX_PROMPT/CNT_VAL[12]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n12\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[12]\);
    
    \TX_PROMPT/CNT_VAL[20]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n20\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[20]\);
    
    \P_CH_IAUX_EN_pad[6]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_IAUX_EN_pad[6]/U0/NET1\, E => 
        \P_CH_IAUX_EN_pad[6]/U0/NET2\, PAD => P_CH_IAUX_EN(6));
    
    \OVT_FS/un1_tmp_sum_in_b_0_m22\ : XNOR3
      port map(A => \OVT_FS/FILT_OUT[6]_net_1\, B => 
        \OVT_FS/FILT_OUT[7]_net_1\, C => \OVT_FS/i10_mux\, Y => 
        \OVT_FS/N_23_i\);
    
    \CONTROL78/DEL_CNTR_tmr2[4]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[4]_net_1\);
    
    \CONTROL56/DEL_CNTR_maj[2]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[2]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[2]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[2]\, Y => 
        \CONTROL56/DEL_CNTR[2]_net_1\);
    
    \P_CH_IAUX_EN_pad[1]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_IAUX_EN_c_c[0]\, E => \VCC\, DOUT => 
        \P_CH_IAUX_EN_pad[1]/U0/NET1\, EOUT => 
        \P_CH_IAUX_EN_pad[1]/U0/NET2\);
    
    \UVL_34FUSE/FILT_OUT_maj[1]\ : MAJ3
      port map(A => \UVL_34FUSE/FILT_OUT_1[1]\, B => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[1]\, C => 
        \UVL_34FUSE/FILT_OUT_tmr3_1[1]\, Y => 
        \UVL_34FUSE/FILT_OUT[1]_net_1\);
    
    \OVT_FS/SIGOUT\ : DFN1C0
      port map(D => \OVT_FS/SIGOUT_maj_RNILN142_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/SIGOUT_3\);
    
    \OVT_FS/FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => \OVT_FS/N_31_i\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/FILT_OUT_tmr3_3[1]\);
    
    \UVL_78FUSE/FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => \UVL_78FUSE/N_31_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_tmr2[1]_net_1\);
    
    \UVL_12FUSE/un1_tmp_sum_in_b_0_m13\ : AO18
      port map(A => \UVL_12FUSE/FILT_OUT[4]_net_1\, B => 
        \UVL_12FUSE/i6_mux\, C => \UVL_12FUSE/FILT_OUT[5]_net_1\, 
        Y => \UVL_12FUSE/i8_mux\);
    
    \UVL_56FUSE/SIG_IN_DEL_tmr2[0]\ : DFN1C0
      port map(D => \FPGA_FUSE_5_6_OK_c[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/SIG_IN_DEL_tmr2_0[0]\);
    
    \REGISTER_CH_CMD_CH_maj[4]\ : MAJ3
      port map(A => \REGISTER_CH_CMD_CH_0[4]\, B => 
        \REGISTER_CH_CMD_CH_tmr2[4]_net_1\, C => 
        \REGISTER_CH_CMD_CH_tmr3[4]_net_1\, Y => 
        \REGISTER_CH_CMD_CH[4]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_83\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_2[0]\, B
         => \CONTROL78/DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_2_1[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_3[0]\);
    
    \CONTROL12/RET_STATE_maj[5]\ : MAJ3
      port map(A => \CONTROL12/RET_STATE_2[5]\, B => 
        \CONTROL12/RET_STATE_tmr2_2[5]\, C => 
        \CONTROL12/RET_STATE_tmr3_2[5]\, Y => 
        \CONTROL12/RET_STATE[5]_net_1\);
    
    \P_CH_IAUX_EN_pad[5]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_IAUX_EN_pad[5]/U0/NET1\, E => 
        \P_CH_IAUX_EN_pad[5]/U0/NET2\, PAD => P_CH_IAUX_EN(5));
    
    \OVT_FS/FILT_OUT[3]\ : DFN1C0
      port map(D => \OVT_FS/N_27_i\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/FILT_OUT_3[3]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIIGUN1[3]\ : MX2
      port map(A => \CONTROL34/N_312\, B => 
        \CONTROL34.MAIN_SEQUENCER.N_CH_VOSG_EN_7_1[1]\, S => 
        \CONTROL34/N_CH_VOSG_EN_2_sqmuxa\, Y => 
        \CONTROL34/N_CH_VOSG_EN[0]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIDFRA[6]\ : OR2
      port map(A => \CONTROL34/SEQUENCER_STATE[6]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL34/N_222\);
    
    \UVL_56FUSE/SIGOUT_tmr2\ : DFN1C0
      port map(D => \UVL_56FUSE/SIGOUT_maj_RNIBM6U2_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/SIGOUT_tmr2_0\);
    
    \CONTROL34/un1_DEL_CNTR_I_81\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_2_1[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_2_2[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_10[0]\);
    
    \UVL_78FUSE/FILT_OUT[4]\ : DFN1C0
      port map(D => \UVL_78FUSE/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_0[4]\);
    
    \CONTROL56/DEL_CNTR[7]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[7]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[7]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIN7101[6]\ : NOR2A
      port map(A => \CONTROL34/N_312\, B => \CONTROL34/N_222\, Y
         => \CONTROL34/N_CH_MREG_EN_1_sqmuxa\);
    
    \CONTROL78/un1_DEL_CNTR_I_90\ : AND2
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_8[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_1_3[0]\);
    
    \CONTROL56/DEL_CNTR_maj_RNIMCSL[14]\ : NOR3
      port map(A => \CONTROL56/DEL_CNTR[1]_net_1\, B => 
        \CONTROL56/DEL_CNTR[14]_net_1\, C => 
        \CONTROL56/DEL_CNTR[13]_net_1\, Y => 
        \CONTROL56/un8_del_cntr_7\);
    
    \OVT_FS/FILT_OUT_maj_RNITEJH4[7]\ : XNOR3
      port map(A => \OVT_FS/FILT_OUT[7]_net_1\, B => 
        \OVT_FS/i12_mux\, C => \OVT_FS/N89\, Y => 
        \OVT_FS/FILT_OUT_maj_RNITEJH4[7]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_48\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[11]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_4[0]\, Y => 
        \CONTROL78/I_48_2\);
    
    \CONTROL56/RET_STATE_maj_RNIG88P4[4]\ : NOR3B
      port map(A => \CONTROL56/N_302\, B => \CONTROL56/N_299\, C
         => \CONTROL56/RET_STATE[4]_net_1\, Y => 
        \CONTROL56/SEQUENCER_STATE_ns[3]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI4H1671[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_60\, Y => \CONTROL12/N_DEL_CNTR[13]\);
    
    \FPGA_FUSE_5_6_OK_pad[0]/U0/U0\ : IOPAD_IN
      port map(PAD => FPGA_FUSE_5_6_OK(0), Y => 
        \FPGA_FUSE_5_6_OK_pad[0]/U0/NET1\);
    
    \CONTROL56/SEQUENCER_STATE_tmr2[8]\ : DFN1C0
      port map(D => \CONTROL56/N_315\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[8]\);
    
    \OVT_FS/FILT_OUT_maj_RNITEJH4_0[7]\ : AO13
      port map(A => \OVT_FS/N89\, B => \OVT_FS/FILT_OUT[7]_net_1\, 
        C => \OVT_FS/i12_mux\, Y => 
        \OVT_FS/FILT_OUT_maj_RNITEJH4_0[7]_net_1\);
    
    \CONTROL12/SEQUENCER_STATE[3]\ : DFN1C0
      port map(D => \CONTROL12/CH_ACTIVE_STAT_maj_RNIF8952_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/SEQUENCER_STATE_2[3]\);
    
    \CONTROL12/DEL_CNTR[2]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[2]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[2]\);
    
    \CONTROL78/SEQUENCER_STATE[6]\ : DFN1C0
      port map(D => \CONTROL78/SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_0[6]\);
    
    \CONTROL34/RET_STATE_maj_RNI14PQ1[9]\ : NOR3B
      port map(A => \CONTROL34/N_290\, B => \CONTROL34/N_236\, C
         => \CONTROL34/RET_STATE[9]_net_1\, Y => 
        \CONTROL34/N_266\);
    
    \UVL_78FUSE/THRESH_VAL_maj_RNI66PK1_1[1]\ : NOR2A
      port map(A => \UVL_78FUSE/n_sigout3\, B => 
        \UVL_78FUSE/THRESH_VAL[1]_net_1\, Y => \UVL_78FUSE/N_94\);
    
    \TX_PROMPT/MS250_CLK_EN_SIG_tmr3\ : DFN1C0
      port map(D => \TX_PROMPT/un9_cnt_val\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/MS250_CLK_EN_SIG_tmr3_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI819H1[5]\ : AO1A
      port map(A => \CONTROL56/SEQUENCER_STATE[5]_net_1\, B => 
        \CONTROL56/RET_STATE_0_a3_0[6]\, C => 
        \CONTROL56/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL56/SEQUENCER_STATE_maj_RNI819H1[5]_net_1\);
    
    \CONTROL78/CH_VOSG_EN_tmr2[1]\ : DFN1C0
      port map(D => \CONTROL78/CH_VOSG_EN_maj_RNIL5HT1[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/CH_VOSG_EN_tmr2[1]_net_1\);
    
    \UVL_34FUSE/FILT_OUT_tmr2[1]\ : DFN1C0
      port map(D => \UVL_34FUSE/N_31_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[1]\);
    
    \UVL_12FUSE/FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => \UVL_12FUSE/ADD_4x4_fast_I6_Y_0\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[5]\);
    
    \CONTROL78/un1_DEL_CNTR_I_12\ : AND2
      port map(A => \CONTROL78/DEL_CNTR[9]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_9[0]\);
    
    \UVL_56FUSE/FILT_OUT_maj[7]\ : MAJ3
      port map(A => \UVL_56FUSE/FILT_OUT_0[7]\, B => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[7]\, C => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[7]\, Y => 
        \UVL_56FUSE/FILT_OUT[7]_net_1\);
    
    \UVL_12FUSE/THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \UVL_12FUSE/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/THRESH_VAL_tmr2_2[0]\);
    
    \CONTROL56/SEQUENCER_STATE_maj[3]\ : MAJ3
      port map(A => \CONTROL56/SEQUENCER_STATE_0[3]\, B => 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[3]\, C => 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[3]\, Y => 
        \CONTROL56/SEQUENCER_STATE[3]_net_1\);
    
    \CONTROL34/DEL_CNTR_maj_RNIBVHH[14]\ : NOR3
      port map(A => \CONTROL34/DEL_CNTR[2]_net_1\, B => 
        \CONTROL34/DEL_CNTR[14]_net_1\, C => 
        \CONTROL34/DEL_CNTR[13]_net_1\, Y => 
        \CONTROL34/un8_del_cntr_7\);
    
    \CONTROL34/CH_VOSG_EN_tmr3[0]\ : DFN1C0
      port map(D => \CONTROL34/CH_VOSG_EN_maj_RNIB8TL2[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL34/CH_VOSG_EN_tmr3_1[0]\);
    
    \CONTROL78/SEQUENCER_STATE[3]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIRJR51[4]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_0[3]\);
    
    \CONTROL78/RET_STATE_maj_RNIHDC22[4]\ : NOR2B
      port map(A => \CONTROL78/N_291\, B => \CONTROL78/N_236\, Y
         => \CONTROL78/N_266\);
    
    \UVL_12FUSE/SIG_IN_DEL_maj_RNICLUI_0[0]\ : NOR2B
      port map(A => \UVL_12FUSE/SIG_IN_DEL[0]_net_1\, B => 
        \FPGA_FUSE_1_2_OK_c[0]\, Y => 
        \UVL_12FUSE/SIG_IN_DEL_maj_RNICLUI_0[0]_net_1\);
    
    \CONTROL34/DEL_CNTR_maj_RNIJJ2U[0]\ : NOR3C
      port map(A => \CONTROL34/un8_del_cntr_2\, B => 
        \CONTROL34/un8_del_cntr_1\, C => 
        \CONTROL34/un8_del_cntr_7\, Y => 
        \CONTROL34/un8_del_cntr_11\);
    
    \CONTROL78/un1_DEL_CNTR_I_70\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_4[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    \CONTROL78/RET_STATE_tmr3[4]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIMVRO[5]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/RET_STATE_tmr3[4]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj[4]\ : MAJ3
      port map(A => \CONTROL56/SEQUENCER_STATE_0[4]\, B => 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[4]\, C => 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[4]\, Y => 
        \CONTROL56/SEQUENCER_STATE[4]_net_1\);
    
    \TX_PROMPT/CNT_VAL_tmr2[3]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n3\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[3]_net_1\);
    
    \P_CH_VOSG_EN_pad[1]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_VOSG_EN_pad[1]/U0/NET1\, E => 
        \P_CH_VOSG_EN_pad[1]/U0/NET2\, PAD => P_CH_VOSG_EN(1));
    
    \CONTROL12/un1_DEL_CNTR_I_77\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_1[0]\, B
         => \CONTROL12/DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_1[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_2[0]\);
    
    \OVT_FS/FILT_OUT_maj[6]\ : MAJ3
      port map(A => \OVT_FS/FILT_OUT_3[6]\, B => 
        \OVT_FS/FILT_OUT_tmr2_3[6]\, C => 
        \OVT_FS/FILT_OUT_tmr3_3[6]\, Y => 
        \OVT_FS/FILT_OUT[6]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_53\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[4]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_2[0]\, Y => 
        \CONTROL78/I_53_2\);
    
    \CONTROL12/DEL_CNTR[1]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[1]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[1]\);
    
    \UVL_56FUSE/FILT_OUT_maj[1]\ : MAJ3
      port map(A => \UVL_56FUSE/FILT_OUT_0[1]\, B => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[1]\, C => 
        \UVL_56FUSE/FILT_OUT_tmr3_0[1]\, Y => 
        \UVL_56FUSE/FILT_OUT[1]_net_1\);
    
    CLK_5M_GL_tmr3 : DFN1C0
      port map(D => \REFCNT_maj_RNI76JC[1]_net_1\, CLK => 
        CLK40M_OSC_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CLK_5M_GL_tmr3\);
    
    \CONTROL56/un1_DEL_CNTR_I_20\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[10]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_9[0]\);
    
    \UVL_78FUSE/FILT_OUT[7]\ : DFN1C0
      port map(D => \UVL_78FUSE/FILT_OUT_maj_RNIL726C_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_78FUSE/FILT_OUT_0[7]\);
    
    \CONTROL34/un1_DEL_CNTR_I_87\ : AND2
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_5[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_6[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_1_2[0]\);
    
    \DTYCYC_CNT_maj[0]\ : MAJ3
      port map(A => \DTYCYC_CNT_0[0]\, B => 
        \DTYCYC_CNT_tmr2[0]_net_1\, C => 
        \DTYCYC_CNT_tmr3[0]_net_1\, Y => \DTYCYC_CNT[0]_net_1\);
    
    \CONTROL12/SEQUENCER_STATE_maj[4]\ : MAJ3
      port map(A => \CONTROL12/SEQUENCER_STATE_2[4]\, B => 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[4]\, C => 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[4]\, Y => 
        \CONTROL12/SEQUENCER_STATE[4]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_79\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_1_2[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_1_2[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_3[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_2_1[0]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIHK1N[16]\ : OR2B
      port map(A => \TX_PROMPT/CNT_VAL[16]_net_1\, B => 
        \TX_PROMPT/CNT_VAL[17]_net_1\, Y => 
        \TX_PROMPT/un9_cnt_vallto17_0\);
    
    \OVT_FS/FILT_OUT[2]\ : DFN1C0
      port map(D => \OVT_FS/N_29_i\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/FILT_OUT_3[2]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIN0SO[6]\ : AO1A
      port map(A => \CONTROL78/SEQUENCER_STATE[7]_net_1\, B => 
        \CONTROL78/RET_STATE_0_a3_0[5]\, C => 
        \CONTROL78/SEQUENCER_STATE[6]_net_1\, Y => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN0SO[6]_net_1\);
    
    \CONTROL56/RET_STATE_maj[6]\ : MAJ3
      port map(A => \CONTROL56/RET_STATE_0[6]\, B => 
        \CONTROL56/RET_STATE_tmr2_0[6]\, C => 
        \CONTROL56/RET_STATE_tmr3_0[6]\, Y => 
        \CONTROL56/RET_STATE[6]_net_1\);
    
    \UVL_78FUSE/FILT_OUT_maj[6]\ : MAJ3
      port map(A => \UVL_78FUSE/FILT_OUT_0[6]\, B => 
        \UVL_78FUSE/FILT_OUT_tmr2[6]_net_1\, C => 
        \UVL_78FUSE/FILT_OUT_tmr3[6]_net_1\, Y => 
        \UVL_78FUSE/FILT_OUT[6]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_81\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_2_1[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_2_2[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_10[0]\);
    
    \CONTROL12/SEQUENCER_STATE[6]\ : DFN1C0
      port map(D => \CONTROL12/SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_2[6]\);
    
    \CONTROL34/RET_STATE_tmr3[4]\ : DFN1C0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIMULP[5]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/RET_STATE_tmr3_1[4]\);
    
    \CONTROL12/RET_STATE_maj_RNI39HE_0[5]\ : NOR2A
      port map(A => \CONTROL12/RET_STATE[6]_net_1\, B => 
        \CONTROL12/RET_STATE[5]_net_1\, Y => \CONTROL12/N_299\);
    
    \UVL_78FUSE/FILT_OUT[2]\ : DFN1C0
      port map(D => \UVL_78FUSE/N_29_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_0[2]\);
    
    \CONTROL34/un1_DEL_CNTR_I_1\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[0]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_TMP[0]\);
    
    \FPGA_FUSE_1_2_OK_pad[0]/U0/U1\ : IOIN_IB
      port map(YIN => \FPGA_FUSE_1_2_OK_pad[0]/U0/NET1\, Y => 
        \FPGA_FUSE_1_2_OK_c[0]\);
    
    \CONTROL78/un1_DEL_CNTR_I_68\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_1_5[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_6[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_11_2[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_58\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[14]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_11_2[0]\, Y => 
        \CONTROL34/I_58_0\);
    
    \CH5_6_MS_CFG_EN_pad/U0/U0\ : IOPAD_IN
      port map(PAD => CH5_6_MS_CFG_EN, Y => 
        \CH5_6_MS_CFG_EN_pad/U0/NET1\);
    
    \UVL_56FUSE/FILT_OUT[1]\ : DFN1C0
      port map(D => \UVL_56FUSE/N_31_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_0[1]\);
    
    \UVL_12FUSE/FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => \UVL_12FUSE/FILT_OUT_maj_RNIL8E4D[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_12FUSE/FILT_OUT_tmr2_2[6]\);
    
    \OVT_FS/SIG_IN_DEL_maj_RNIMR1A_0[0]\ : NOR2B
      port map(A => \OVT_FS/SIG_IN_DEL[0]_net_1\, B => 
        \TEMP_OK_c[0]\, Y => 
        \OVT_FS/SIG_IN_DEL_maj_RNIMR1A_0[0]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNII1114[8]\ : OA1C
      port map(A => \CONTROL56/SEQUENCER_STATE[8]_net_1\, B => 
        \CONTROL56/un8_del_cntr\, C => \CONTROL56/N_225\, Y => 
        \CONTROL56/N_285\);
    
    \UVL_12FUSE/SUM_IN_A[4]\ : DFN1C0
      port map(D => \UVL_12FUSE/SIG_IN_DEL_maj_RNICLUI[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_12FUSE/SUM_IN_A_2[4]\);
    
    \P_CH_IAUX_EN_pad[0]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_IAUX_EN_c_c[0]\, E => \VCC\, DOUT => 
        \P_CH_IAUX_EN_pad[0]/U0/NET1\, EOUT => 
        \P_CH_IAUX_EN_pad[0]/U0/NET2\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI8T7PJ[8]\ : OR3A
      port map(A => \CONTROL12/N_313\, B => \CONTROL12/N_225\, C
         => \CONTROL12/I_59\, Y => \CONTROL12/N_DEL_CNTR[7]\);
    
    \P_CH_VOSG_EN_pad[6]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_VOSG_EN_pad[6]/U0/NET1\, E => 
        \P_CH_VOSG_EN_pad[6]/U0/NET2\, PAD => P_CH_VOSG_EN(6));
    
    \CONTROL78/un1_DEL_CNTR_I_19\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[7]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_6[0]\);
    
    \CONTROL34/SEQUENCER_STATE_tmr3[6]\ : DFN1C0
      port map(D => \CONTROL34/SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[6]\);
    
    \UVL_12FUSE/FILT_OUT_tmr3[1]\ : DFN1C0
      port map(D => \UVL_12FUSE/N_31_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[1]\);
    
    \UVL_56FUSE/THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \UVL_56FUSE/THRESH_VAL_maj_RNIS23U1[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_56FUSE/THRESH_VAL_tmr2_0[1]\);
    
    \UVL_56FUSE/THRESH_VAL[0]\ : DFN1C0
      port map(D => \UVL_56FUSE/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/THRESH_VAL_0[0]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIM5251[3]\ : MX2B
      port map(A => \CONTROL78/N_312\, B => 
        \CONTROL56.MAIN_SEQUENCER.un3_n_ch_vosg_en\, S => 
        \CONTROL78/N_CH_VOSG_EN_2_sqmuxa\, Y => 
        \CONTROL78/N_CH_VOSG_EN[0]\);
    
    \CONTROL56/CH_IAUX_EN_maj[0]\ : MAJ3
      port map(A => \CONTROL56/CH_IAUX_EN_0[0]\, B => 
        \CONTROL56/CH_IAUX_EN_tmr2_0[0]\, C => 
        \CONTROL56/CH_IAUX_EN_tmr3_0[0]\, Y => 
        \P_CH_IAUX_EN_c_c[4]\);
    
    \CONTROL12/CH_ACTIVE_STAT_tmr3\ : DFN1C0
      port map(D => \REGISTER_CH_CMD_CH[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/CH_ACTIVE_STAT_tmr3_0\);
    
    \UVL_12FUSE/FILT_OUT[6]\ : DFN1C0
      port map(D => \UVL_12FUSE/FILT_OUT_maj_RNIL8E4D[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_12FUSE/FILT_OUT_2[6]\);
    
    \CONTROL56/DEL_CNTR_tmr3[13]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[13]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[13]\);
    
    \CONTROL12/CH_VOSG_EN[1]\ : DFN1C0
      port map(D => \CONTROL12/CH_VOSG_EN_maj_RNIFR854[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/CH_VOSG_EN_2[1]\);
    
    \UVL_12FUSE/un1_tmp_sum_in_b_0_m28\ : XNOR3
      port map(A => \UVL_12FUSE/FILT_OUT[4]_net_1\, B => 
        \UVL_12FUSE/FILT_OUT[3]_net_1\, C => \UVL_12FUSE/i4_mux\, 
        Y => \UVL_12FUSE/N_29_i\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNILTMQ1[9]\ : NOR3A
      port map(A => \CONTROL56/N_236\, B => 
        \CONTROL56/RET_STATE[9]_net_1\, C => 
        \CONTROL56/SEQUENCER_STATE[9]_net_1\, Y => 
        \CONTROL56/N_271\);
    
    \OVT_FS/FILT_OUT_maj[0]\ : MAJ3
      port map(A => \OVT_FS/FILT_OUT_3[0]\, B => 
        \OVT_FS/FILT_OUT_tmr2_3[0]\, C => 
        \OVT_FS/FILT_OUT_tmr3_3[0]\, Y => 
        \OVT_FS/FILT_OUT[0]_net_1\);
    
    \TX_PROMPT/CNT_VAL_tmr2[12]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n12\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[12]_net_1\);
    
    DTYCYC_EN : DFN1C0
      port map(D => DTYCYC_EN_20, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => DTYCYC_EN_0);
    
    \CONTROL78/un1_DEL_CNTR_I_64\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0[0]\, B
         => \CONTROL78/DWACT_ADD_CI_0_TMP[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_1[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1[0]\);
    
    \OVT_FS/un1_tmp_sum_in_b_0_m28\ : XNOR3
      port map(A => \OVT_FS/FILT_OUT[4]_net_1\, B => 
        \OVT_FS/FILT_OUT[3]_net_1\, C => \OVT_FS/i4_mux\, Y => 
        \OVT_FS/N_29_i\);
    
    \CONTROL34/DEL_CNTR_tmr3[8]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[8]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[8]\);
    
    \UVL_56FUSE/SUM_IN_A_tmr3[4]\ : DFN1C0
      port map(D => \UVL_56FUSE/SIG_IN_DEL_maj_RNIS1J9[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_56FUSE/SUM_IN_A_tmr3_0[4]\);
    
    \CONTROL34/un1_DEL_CNTR_I_54\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[10]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_11_1[0]\, Y => 
        \CONTROL34/I_54_0\);
    
    \UVL_34FUSE/SIGOUT_tmr2\ : DFN1C0
      port map(D => \UVL_34FUSE/SIGOUT_maj_RNIHDUN8_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/SIGOUT_tmr2_1\);
    
    \TX_PROMPT/CNT_VAL_tmr2[4]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n4\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[4]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_51\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[3]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12[0]\, Y => 
        \CONTROL78/I_51_2\);
    
    \OVT_FS/THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \OVT_FS/THRESH_VAL_3[0]\, B => 
        \OVT_FS/THRESH_VAL_tmr2_3[0]\, C => 
        \OVT_FS/THRESH_VAL_tmr3_3[0]\, Y => 
        \OVT_FS/THRESH_VAL[0]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_68\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_1_5[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_6[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_11_2[0]\);
    
    \CONTROL12/SEQUENCER_STATE_maj[5]\ : MAJ3
      port map(A => \CONTROL12/SEQUENCER_STATE_2[5]\, B => 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[5]\, C => 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[5]\, Y => 
        \CONTROL12/SEQUENCER_STATE[5]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_67\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_10[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_0_10[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_11[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1_5[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_59\ : XOR3
      port map(A => \CONTROL34/DEL_CNTR[7]_net_1\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI79RA_0[4]_net_1\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_2[0]\, Y => 
        \CONTROL34/I_59_0\);
    
    \CONTROL56/CH_ACTIVE_STAT_maj\ : MAJ3
      port map(A => \CONTROL56/CH_ACTIVE_STAT_0\, B => 
        \CONTROL56/CH_ACTIVE_STAT_tmr2_net_1\, C => 
        \CONTROL56/CH_ACTIVE_STAT_tmr3_net_1\, Y => 
        \CONTROL56.CH_ACTIVE_STAT\);
    
    \CONTROL56/SEQUENCER_STATE_tmr3[3]\ : DFN1C0
      port map(D => \CONTROL56/CH_ACTIVE_STAT_maj_RNI0KEN1_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/SEQUENCER_STATE_tmr3_0[3]\);
    
    \UVL_34FUSE/FILT_OUT_maj_RNILTKFJ_0[7]\ : AO13
      port map(A => \UVL_34FUSE/N89\, B => 
        \UVL_34FUSE/FILT_OUT[7]_net_1\, C => \UVL_34FUSE/i12_mux\, 
        Y => \UVL_34FUSE/FILT_OUT_maj_RNILTKFJ_0[7]_net_1\);
    
    \CONTROL12/RET_STATE_maj_RNI8K2T[9]\ : OR3A
      port map(A => \CONTROL12/RET_STATE[9]_net_1\, B => 
        \CONTROL12/RET_STATE[4]_net_1\, C => \CONTROL12/N_221\, Y
         => \CONTROL12/N_246\);
    
    CLK_5M_GL : DFN1C0
      port map(D => \REFCNT_maj_RNI76JC[1]_net_1\, CLK => 
        CLK40M_OSC_c, CLR => POR_OUT_TO_SCA_c, Q => CLK_5M_GL_0);
    
    \CONTROL12/un1_DEL_CNTR_I_80\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_1_4[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_1_4[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_5[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_2_2[0]\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIPPKK2[8]\ : AOI1
      port map(A => \CONTROL12/un8_del_cntr\, B => 
        \CONTROL12/SEQUENCER_STATE[8]_net_1\, C => 
        \CONTROL12/SEQUENCER_STATE[9]_net_1\, Y => 
        \CONTROL12/N_313\);
    
    \UVL_34FUSE/THRESH_VAL_maj_RNIMS9P2_0[1]\ : AOI1B
      port map(A => \UVL_34FUSE/n_sigout15lto7_2\, B => 
        \UVL_34FUSE/n_sigout15lto7_1\, C => 
        \UVL_34FUSE/THRESH_VAL[1]_net_1\, Y => \UVL_34FUSE/N_95\);
    
    \CONTROL56/un1_DEL_CNTR_I_50\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[12]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_10[0]\, Y => 
        \CONTROL56/I_50_1\);
    
    \CONTROL34/DEL_CNTR_maj[4]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[4]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[4]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[4]\, Y => 
        \CONTROL34/DEL_CNTR[4]_net_1\);
    
    \PRI_RX_EN_BAR_pad/U0/U0\ : IOPAD_TRI
      port map(D => \PRI_RX_EN_BAR_pad/U0/NET1\, E => 
        \PRI_RX_EN_BAR_pad/U0/NET2\, PAD => PRI_RX_EN_BAR);
    
    \CONTROL34/DEL_CNTR_maj_RNIQ6HC[5]\ : NOR3A
      port map(A => \CONTROL34/un8_del_cntr_4\, B => 
        \CONTROL34/DEL_CNTR[5]_net_1\, C => 
        \CONTROL34/DEL_CNTR[6]_net_1\, Y => 
        \CONTROL34/un8_del_cntr_9\);
    
    \CONTROL12/RET_STATE_tmr3[4]\ : DFN1C0
      port map(D => 
        \CONTROL12/SEQUENCER_STATE_maj_RNI6U2I1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/RET_STATE_tmr3_2[4]\);
    
    \CONTROL56/DEL_CNTR_maj[14]\ : MAJ3
      port map(A => \CONTROL56/DEL_CNTR_0[14]\, B => 
        \CONTROL56/DEL_CNTR_tmr2_0[14]\, C => 
        \CONTROL56/DEL_CNTR_tmr3_0[14]\, Y => 
        \CONTROL56/DEL_CNTR[14]_net_1\);
    
    \UVL_12FUSE/FILT_OUT_tmr3[6]\ : DFN1C0
      port map(D => \UVL_12FUSE/FILT_OUT_maj_RNIL8E4D[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_12FUSE/FILT_OUT_tmr3_2[6]\);
    
    \CONTROL78/SEQUENCER_STATE_maj[6]\ : MAJ3
      port map(A => \CONTROL78/SEQUENCER_STATE_0[6]\, B => 
        \CONTROL78/SEQUENCER_STATE_tmr2[6]_net_1\, C => 
        \CONTROL78/SEQUENCER_STATE_tmr3[6]_net_1\, Y => 
        \CONTROL78/SEQUENCER_STATE[6]_net_1\);
    
    \CONTROL56/RET_STATE_tmr3[4]\ : DFN1C0
      port map(D => 
        \CONTROL56/SEQUENCER_STATE_maj_RNI6V8H1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/RET_STATE_tmr3_0[4]\);
    
    \CONTROL78/SEQUENCER_STATE_tmr2[7]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNI9EJD7[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr2[7]_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7[4]\ : NOR2
      port map(A => \CONTROL78/SEQUENCER_STATE[4]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE[3]_net_1\, Y => 
        \CONTROL78/N_230_0\);
    
    \UVL_12FUSE/FILT_OUT[4]\ : DFN1C0
      port map(D => \UVL_12FUSE/un2_n_filt_out0[28]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_2[4]\);
    
    \UVL_78FUSE/FILT_OUT_tmr2[5]\ : DFN1C0
      port map(D => \UVL_78FUSE/ADD_4x4_fast_I6_Y_3\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_tmr2[5]_net_1\);
    
    \CONTROL78/RET_STATE[9]\ : DFN1P0
      port map(D => \CONTROL78/RET_STATE_maj_RNIR4SO[9]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/RET_STATE_0[9]\);
    
    \TX_PROMPT/CNT_VAL_tmr2[1]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[1]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_86\ : AND2
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_2[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_1[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_85\ : AND2
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_4[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_1_1[0]\);
    
    \UVL_78FUSE/THRESH_VAL_maj_RNIBBI93_0[0]\ : AO1A
      port map(A => \UVL_78FUSE/n_sigout3\, B => 
        \UVL_78FUSE/THRESH_VAL[0]_net_1\, C => \UVL_78FUSE/N_95\, 
        Y => \UVL_78FUSE/N_93\);
    
    \CONTROL34/un1_DEL_CNTR_I_73\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_12[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_0_12[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_13[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_6[0]\);
    
    \CONTROL12/SEQUENCER_STATE_ns_i_a2_6[0]\ : NOR3C
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH1A2, C => 
        \STDBY_OFFB_B\, Y => \CONTROL12/N_309\);
    
    \UVL_78FUSE/FILT_OUT[1]\ : DFN1C0
      port map(D => \UVL_78FUSE/N_31_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_0[1]\);
    
    \UVL_34FUSE/un1_tmp_sum_in_b_0_m13\ : AO18
      port map(A => \UVL_34FUSE/FILT_OUT[4]_net_1\, B => 
        \UVL_34FUSE/i6_mux\, C => \UVL_34FUSE/FILT_OUT[5]_net_1\, 
        Y => \UVL_34FUSE/i8_mux\);
    
    \P_CH_IAUX_EN_pad[4]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_IAUX_EN_pad[4]/U0/NET1\, E => 
        \P_CH_IAUX_EN_pad[4]/U0/NET2\, PAD => P_CH_IAUX_EN(4));
    
    \TX_PROMPT/CNT_VAL_tmr3[5]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[5]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNI4I5L[3]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH3A4, C => 
        \CONTROL34/SEQUENCER_STATE[3]_net_1\, Y => 
        \CONTROL34/N_CH_VOSG_EN_2_sqmuxa\);
    
    \CONTROL34/DEBOUNCE.man_en_ch_4to1\ : NOR3C
      port map(A => \MAN_EN_CH_4TO1_B\, B => MAN_EN_CH_4TO1_c, C
         => \MAN_EN_CH_4TO1_A\, Y => \DEBOUNCE.man_en_ch_4to1\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]\ : NOR2
      port map(A => \CONTROL12/SEQUENCER_STATE[4]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE[3]_net_1\, Y => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\);
    
    \UVL_12FUSE/THRESH_VAL[0]\ : DFN1C0
      port map(D => \UVL_12FUSE/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/THRESH_VAL_2[0]\);
    
    \UVL_78FUSE/SIGOUT\ : DFN1C0
      port map(D => \UVL_78FUSE/SIGOUT_maj_RNI96K25_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/SIGOUT_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_tmr2[3]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIRJR51[4]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr2[3]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_tmr2[8]\ : DFN1C0
      port map(D => \CONTROL34/N_315\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[8]\);
    
    \UVL_34FUSE/SIGOUT_tmr3\ : DFN1C0
      port map(D => \UVL_34FUSE/SIGOUT_maj_RNIHDUN8_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/SIGOUT_tmr3_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_83\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_2[0]\, B
         => \CONTROL12/DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_2_1[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_3[0]\);
    
    \CONTROL56/SEQUENCER_STATE_tmr3[5]\ : DFN1C0
      port map(D => \CONTROL56/SEQUENCER_STATE_ns[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[5]\);
    
    \CONTROL56/SEQUENCER_STATE_ns_i_0[2]\ : OR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH5A6, C => 
        \STDBY_OFFB_B\, Y => 
        \CONTROL56/SEQUENCER_STATE_ns_i_0[2]_net_1\);
    
    VAL_MAN_EN_CH_8TO5 : DFN1C0
      port map(D => \DEBOUNCE.man_en_ch_8to5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        VAL_MAN_EN_CH_8TO5_0);
    
    \UVL_56FUSE/un1_tmp_sum_in_b_0_m16\ : AO18
      port map(A => \UVL_56FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_56FUSE/i8_mux\, C => \UVL_56FUSE/FILT_OUT[6]_net_1\, 
        Y => \UVL_56FUSE/i10_mux\);
    
    \UVL_56FUSE/FILT_OUT_maj_RNILIRQ5[7]\ : XNOR3
      port map(A => \UVL_56FUSE/FILT_OUT[7]_net_1\, B => 
        \UVL_56FUSE/i12_mux\, C => \UVL_56FUSE/N89\, Y => 
        \UVL_56FUSE/FILT_OUT_maj_RNILIRQ5[7]_net_1\);
    
    \UVL_56FUSE/FILT_OUT[0]\ : DFN1C0
      port map(D => \UVL_56FUSE/N_33_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_0[0]\);
    
    \UVL_34FUSE/SIG_IN_DEL_maj[0]\ : MAJ3
      port map(A => \UVL_34FUSE/SIG_IN_DEL_1[0]\, B => 
        \UVL_34FUSE/SIG_IN_DEL_tmr2_1[0]\, C => 
        \UVL_34FUSE/SIG_IN_DEL_tmr3_1[0]\, Y => 
        \UVL_34FUSE/SIG_IN_DEL[0]_net_1\);
    
    \CONTROL34/CH_VOSG_EN_maj_RNIHBN23[1]\ : MX2
      port map(A => \CONTROL34/N_CH_VOSG_EN[1]\, B => 
        \P_CH_VOSG_EN_c[3]\, S => \CONTROL34/N_290\, Y => 
        \CONTROL34/CH_VOSG_EN_maj_RNIHBN23[1]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIF0VJ[2]\ : NOR3C
      port map(A => \TX_PROMPT/CNT_VAL[3]_net_1\, B => 
        \TX_PROMPT/CNT_VAL[2]_net_1\, C => 
        \TX_PROMPT/CNT_VAL[7]_net_1\, Y => 
        \TX_PROMPT/CNT_m6_0_a2_3\);
    
    \OVT_FS/THRESH_VAL_maj_RNINKGD1_0[0]\ : AO1A
      port map(A => \OVT_FS/n_sigout3\, B => 
        \OVT_FS/THRESH_VAL[0]_net_1\, C => \OVT_FS/N_95\, Y => 
        \OVT_FS/N_93\);
    
    \DTYCYC_CNT[4]\ : DFN1P0
      port map(D => DTYCYC_CNT_21, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_0[4]\);
    
    \CONTROL78/RET_STATE[4]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIMVRO[5]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/RET_STATE_0[4]\);
    
    MAN_EN_CH_8TO5_B_tmr2 : DFN1C0
      port map(D => MAN_EN_CH_8TO5_B_18, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_8TO5_B_tmr2\);
    
    \CONTROL12/RET_STATE_tmr3[6]\ : DFN1C0
      port map(D => 
        \CONTROL12/SEQUENCER_STATE_maj_RNI803I1[5]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/RET_STATE_tmr3_2[6]\);
    
    \UVL_34FUSE/FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => \UVL_34FUSE/N_33_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_66\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_2[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_0_2[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_3[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_1[0]\);
    
    \CONTROL78/SEQUENCER_STATE[8]\ : DFN1C0
      port map(D => \CONTROL78/N_315\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_0[8]\);
    
    \CONTROL56/RET_STATE[5]\ : DFN1C0
      port map(D => 
        \CONTROL56/SEQUENCER_STATE_maj_RNI709H1[6]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/RET_STATE_0[5]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNI6DCIF[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_48_0\, Y => \CONTROL34/N_DEL_CNTR[11]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNI53H3B[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_55_2\, Y => \CONTROL78/N_DEL_CNTR[9]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIVKK631[8]\ : OR3A
      port map(A => \CONTROL56/N_313\, B => \CONTROL56/N_225\, C
         => \CONTROL56/I_50_1\, Y => \CONTROL56/N_DEL_CNTR[12]\);
    
    \UVL_12FUSE/SIGOUT\ : DFN1C0
      port map(D => \UVL_12FUSE/SIGOUT_maj_RNIRH6C6_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/SIGOUT_2\);
    
    \CONTROL78/un1_DEL_CNTR_I_73\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_12[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_0_12[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_13[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_6[0]\);
    
    \CONTROL78/RET_STATE_tmr2[4]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIMVRO[5]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/RET_STATE_tmr2[4]_net_1\);
    
    \UVL_78FUSE/FILT_OUT_tmr2[6]\ : DFN1C0
      port map(D => \UVL_78FUSE/FILT_OUT_maj_RNIL726C[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_78FUSE/FILT_OUT_tmr2[6]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_31\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[3]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_2[0]\);
    
    \CH1_2_MS_CFG_EN_pad/U0/U1\ : IOIN_IB
      port map(YIN => \CH1_2_MS_CFG_EN_pad/U0/NET1\, Y => 
        CH1_2_MS_CFG_EN_c);
    
    \DTYCYC_CNT_tmr3[4]\ : DFN1P0
      port map(D => DTYCYC_CNT_21, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr3[4]_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIMVRO[5]\ : OA1B
      port map(A => \CONTROL78/RET_STATE[4]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE[5]_net_1\, C => 
        \CONTROL78/N_222\, Y => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIMVRO[5]_net_1\);
    
    \CONTROL12/DEL_CNTR_maj[3]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[3]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[3]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[3]\, Y => 
        \CONTROL12/DEL_CNTR[3]_net_1\);
    
    \UVL_56FUSE/un1_tmp_sum_in_b_0_m30\ : XNOR3
      port map(A => \UVL_56FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_56FUSE/FILT_OUT[2]_net_1\, C => \UVL_56FUSE/i2_mux\, 
        Y => \UVL_56FUSE/N_31_i\);
    
    DTYCYC_EN_tmr2 : DFN1C0
      port map(D => DTYCYC_EN_20, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \DTYCYC_EN_tmr2\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI78UF7[6]\ : NOR2A
      port map(A => \TX_PROMPT/CNT_VAL_n6_tz\, B => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n6\);
    
    \OVT_FS/FILT_OUT_maj_RNIHNG7[3]\ : NOR2B
      port map(A => \OVT_FS/FILT_OUT[3]_net_1\, B => 
        \OVT_FS/FILT_OUT[6]_net_1\, Y => \OVT_FS/n_sigout3lto6_0\);
    
    \UVL_12FUSE/FILT_OUT_maj[7]\ : MAJ3
      port map(A => \UVL_12FUSE/FILT_OUT_2[7]\, B => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[7]\, C => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[7]\, Y => 
        \UVL_12FUSE/FILT_OUT[7]_net_1\);
    
    \TX_PROMPT/CNT_VAL_tmr2[11]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n11\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[11]_net_1\);
    
    \CONTROL78/DEL_CNTR_tmr3[7]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[7]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[7]_net_1\);
    
    \CONTROL34/MAN_EN_CH_8TO5_A_15\ : MX2
      port map(A => \MAN_EN_CH_8TO5_A\, B => MAN_EN_CH_8TO5_c, S
         => N_23_i_c, Y => MAN_EN_CH_8TO5_A_15);
    
    \CONTROL12/CH_ACTIVE_STAT_maj_RNIF8952_0\ : NOR3A
      port map(A => \CONTROL12/N_309\, B => \CONTROL12/N_230_0\, 
        C => \CONTROL12.CH_ACTIVE_STAT\, Y => \CONTROL12/N_275\);
    
    \UVL_34FUSE/FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => \UVL_34FUSE/N_27_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[3]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNISPIE1_0[6]\ : AX1C
      port map(A => \TX_PROMPT/CNT_VAL[5]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c4\, C => \TX_PROMPT/CNT_VAL[6]_net_1\, 
        Y => \TX_PROMPT/CNT_VAL_n6_tz\);
    
    \UVL_56FUSE/THRESH_VAL_maj_RNIR13U1_0[0]\ : AO1A
      port map(A => \UVL_56FUSE/n_sigout3\, B => 
        \UVL_56FUSE/THRESH_VAL[0]_net_1\, C => \UVL_56FUSE/N_95\, 
        Y => \UVL_56FUSE/N_93\);
    
    \CONTROL56/CH_IAUX_EN_tmr3[0]\ : DFN1C0
      port map(D => \CONTROL56/CH_IAUX_EN_maj_RNI9T632[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/CH_IAUX_EN_tmr3_0[0]\);
    
    \UVL_34FUSE/un1_tmp_sum_in_b_0_m16\ : AO18
      port map(A => \UVL_34FUSE/FILT_OUT[5]_net_1\, B => 
        \UVL_34FUSE/i8_mux\, C => \UVL_34FUSE/FILT_OUT[6]_net_1\, 
        Y => \UVL_34FUSE/i10_mux\);
    
    \UVL_78FUSE/SUM_IN_A_maj[4]\ : MAJ3
      port map(A => \UVL_78FUSE/SUM_IN_A_0[4]\, B => 
        \UVL_78FUSE/SUM_IN_A_tmr2[4]_net_1\, C => 
        \UVL_78FUSE/SUM_IN_A_tmr3[4]_net_1\, Y => 
        \UVL_78FUSE/SUM_IN_A[4]_net_1\);
    
    \CONTROL56/DEL_CNTR_tmr2[13]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[13]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[13]\);
    
    \UVL_78FUSE/FILT_OUT[6]\ : DFN1C0
      port map(D => \UVL_78FUSE/FILT_OUT_maj_RNIL726C[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_78FUSE/FILT_OUT_0[6]\);
    
    \CONTROL78/un1_DEL_CNTR_I_88\ : AND2
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_pog_array_1_2[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_2[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_70\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_4[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_1[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_1\ : AND2
      port map(A => \CONTROL12/DEL_CNTR[0]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_TMP[0]\);
    
    \UVL_12FUSE/FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => \UVL_12FUSE/N_33_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[0]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIF5AD[6]\ : OR2B
      port map(A => \TX_PROMPT/CNT_VAL[6]_net_1\, B => 
        \TX_PROMPT/CNT_VAL[7]_net_1\, Y => 
        \TX_PROMPT/un9_cnt_vallto7_0\);
    
    \CONTROL34/RET_STATE_maj_RNIFE6S[4]\ : NOR2A
      port map(A => \CONTROL34/RET_STATE[4]_net_1\, B => 
        \CONTROL34/N_221\, Y => \CONTROL34/N_304\);
    
    VAL_MAN_EN_CH_8TO5_tmr2 : DFN1C0
      port map(D => \DEBOUNCE.man_en_ch_8to5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \VAL_MAN_EN_CH_8TO5_tmr2\);
    
    \CONTROL34/DEL_CNTR_tmr3[11]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[11]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr3_1[11]\);
    
    \CONTROL12/un1_DEL_CNTR_I_69\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_11_1[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_0_10[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_12_4[0]\);
    
    \CONTROL12/SEQUENCER_STATE_tmr2[4]\ : DFN1C0
      port map(D => \CONTROL12/SEQUENCER_STATE_ns[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[4]\);
    
    \UVL_78FUSE/THRESH_VAL_tmr2[0]\ : DFN1C0
      port map(D => \UVL_78FUSE/THRESH_VAL_ns[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/THRESH_VAL_tmr2[0]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_91\ : AND2
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_10[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_1_4[0]\);
    
    \CONTROL12/SEQUENCER_STATE[7]\ : DFN1C0
      port map(D => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIPRAE6[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/SEQUENCER_STATE_2[7]\);
    
    \REGISTER_CH_CMD_CH_tmr2[4]\ : DFN1C0
      port map(D => \VAL_MAN_EN_CH_8TO5\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \REGISTER_CH_CMD_CH_tmr2[4]_net_1\);
    
    \J11_23_TCONN_pad/U0/U0\ : IOPAD_TRI
      port map(D => \J11_23_TCONN_pad/U0/NET1\, E => 
        \J11_23_TCONN_pad/U0/NET2\, PAD => J11_23_TCONN);
    
    \CONTROL56/DEL_CNTR_tmr3[12]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[12]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr3_0[12]\);
    
    \UVL_12FUSE/FILT_OUT[7]\ : DFN1C0
      port map(D => \UVL_12FUSE/FILT_OUT_maj_RNIL8E4D_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_12FUSE/FILT_OUT_2[7]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNI22EI5[8]\ : OR3A
      port map(A => \CONTROL34/N_313\, B => \CONTROL34/N_225\, C
         => \CONTROL34/I_51_0\, Y => \CONTROL34/N_DEL_CNTR[3]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIFBJM7[7]\ : XA1B
      port map(A => \TX_PROMPT/CNT_VAL_c6\, B => 
        \TX_PROMPT/CNT_VAL[7]_net_1\, C => 
        \TX_PROMPT/un9_cnt_val\, Y => \TX_PROMPT/CNT_VAL_n7\);
    
    \OVT_FS/FILT_OUT_maj_RNIDTPI[7]\ : AO1
      port map(A => \OVT_FS/n_sigout3lto6_1\, B => 
        \OVT_FS/n_sigout3lto6_0\, C => \OVT_FS/FILT_OUT[7]_net_1\, 
        Y => \OVT_FS/n_sigout3\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIKANB[3]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH7A8, C => 
        \CONTROL78/SEQUENCER_STATE[3]_net_1\, Y => 
        \CONTROL78/N_CH_VOSG_EN_2_sqmuxa\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNICEEO[3]\ : NOR3C
      port map(A => STATUS_LED_c, B => UVL_OK_CH5A6, C => 
        \CONTROL56/SEQUENCER_STATE[3]_net_1\, Y => 
        \CONTROL56/N_CH_VOSG_EN_2_sqmuxa\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIQ86H3[8]\ : OA1C
      port map(A => \CONTROL12/SEQUENCER_STATE[8]_net_1\, B => 
        \CONTROL12/un8_del_cntr\, C => \CONTROL12/N_225\, Y => 
        \CONTROL12/N_285\);
    
    \UVL_56FUSE/SIG_IN_DEL_maj_RNIS1J9[0]\ : XOR2
      port map(A => \FPGA_FUSE_5_6_OK_c[0]\, B => 
        \UVL_56FUSE/SIG_IN_DEL[0]_net_1\, Y => 
        \UVL_56FUSE/SIG_IN_DEL_maj_RNIS1J9[0]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_maj[9]\ : MAJ3
      port map(A => \CONTROL34/SEQUENCER_STATE_1[9]\, B => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[9]\, C => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[9]\, Y => 
        \CONTROL34/SEQUENCER_STATE[9]_net_1\);
    
    \P_CH_MREG_EN_pad[6]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_MREG_EN_pad[6]/U0/NET1\, E => 
        \P_CH_MREG_EN_pad[6]/U0/NET2\, PAD => P_CH_MREG_EN(6));
    
    \CONTROL56/DEL_CNTR[8]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[8]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[8]\);
    
    \CONTROL12/CH_ACTIVE_STAT\ : DFN1C0
      port map(D => \REGISTER_CH_CMD_CH[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/CH_ACTIVE_STAT_0\);
    
    \UVL_56FUSE/FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => \UVL_56FUSE/N_29_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[2]\);
    
    \CONTROL78/DEL_CNTR[8]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[8]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[8]\);
    
    \UVL_56FUSE/un2_n_filt_out_0_ADD_4x4_fast_I0_CO1\ : XA1A
      port map(A => \UVL_56FUSE/i8_mux\, B => \UVL_56FUSE/N_40\, 
        C => \UVL_56FUSE/SUM_IN_A[4]_net_1\, Y => 
        \UVL_56FUSE/N92\);
    
    \UVL_12FUSE/SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => 
        \UVL_12FUSE/SIG_IN_DEL_maj_RNICLUI_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/SUM_IN_A_tmr2_2[5]\);
    
    \UVL_12FUSE/FILT_OUT_tmr3[3]\ : DFN1C0
      port map(D => \UVL_12FUSE/N_27_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[3]\);
    
    \CONTROL34/DTYCYC_CNT_21\ : MX2
      port map(A => \CONTROL34/N_4\, B => \DTYCYC_CNT[4]_net_1\, 
        S => \CONTROL34/N_DTYCYC_CNT_2_sqmuxa\, Y => 
        DTYCYC_CNT_21);
    
    \CONTROL12/un1_DEL_CNTR_I_25\ : XOR2
      port map(A => \CONTROL12/DEL_CNTR[12]_net_1\, B => 
        \CONTROL12/N_230_0\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_pog_array_0_11[0]\);
    
    \CONTROL12/RET_STATE_maj[6]\ : MAJ3
      port map(A => \CONTROL12/RET_STATE_2[6]\, B => 
        \CONTROL12/RET_STATE_tmr2_2[6]\, C => 
        \CONTROL12/RET_STATE_tmr3_2[6]\, Y => 
        \CONTROL12/RET_STATE[6]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNISEJP2_0[11]\ : AX1C
      port map(A => \TX_PROMPT/CNT_VAL[10]_net_1\, B => 
        \TX_PROMPT/CNT_VAL_c9\, C => 
        \TX_PROMPT/CNT_VAL[11]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL_n11_tz\);
    
    \CONTROL56/DEL_CNTR[0]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[0]\);
    
    \CONTROL12/un1_DEL_CNTR_I_78\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_4[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_11_1[0]\);
    
    \UVL_56FUSE/THRESH_VAL[1]\ : DFN1C0
      port map(D => \UVL_56FUSE/THRESH_VAL_maj_RNIS23U1[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_56FUSE/THRESH_VAL_0[1]\);
    
    \CONTROL56/un1_DEL_CNTR_I_19\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[7]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_6[0]\);
    
    \CONTROL78/DEL_CNTR_tmr3[2]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[2]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[2]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_71\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_2[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12[0]\);
    
    \CONTROL78/un1_DEL_CNTR_I_58\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[14]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_11_2[0]\, Y => 
        \CONTROL78/I_58_2\);
    
    \CONTROL12/DEL_CNTR_tmr3[5]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[5]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[5]\);
    
    \CONTROL12/DEL_CNTR_maj_RNI1B46[4]\ : NOR2
      port map(A => \CONTROL12/DEL_CNTR[4]_net_1\, B => 
        \CONTROL12/DEL_CNTR[5]_net_1\, Y => 
        \CONTROL12/un8_del_cntr_1\);
    
    \CONTROL12/DEL_CNTR_maj[11]\ : MAJ3
      port map(A => \CONTROL12/DEL_CNTR_2[11]\, B => 
        \CONTROL12/DEL_CNTR_tmr2_2[11]\, C => 
        \CONTROL12/DEL_CNTR_tmr3_2[11]\, Y => 
        \CONTROL12/DEL_CNTR[11]_net_1\);
    
    \OVT_FS/un1_tmp_sum_in_b_0_m32\ : AX1
      port map(A => \OVT_FS/FILT_OUT[0]_net_1\, B => 
        \OVT_FS/FILT_OUT[1]_net_1\, C => 
        \OVT_FS/FILT_OUT[2]_net_1\, Y => \OVT_FS/N_33_i\);
    
    \CONTROL56/SEQUENCER_STATE_maj[7]\ : MAJ3
      port map(A => \CONTROL56/SEQUENCER_STATE_0[7]\, B => 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[7]\, C => 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[7]\, Y => 
        \CONTROL56/SEQUENCER_STATE[7]_net_1\);
    
    \CONTROL12/un1_DEL_CNTR_I_57\ : XOR3
      port map(A => \CONTROL12/DEL_CNTR[8]_net_1\, B => 
        \CONTROL12/SEQUENCER_STATE_maj_RNIVCHS_0[4]_net_1\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_3[0]\, Y => 
        \CONTROL12/I_57\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNI803I1[5]\ : AO1A
      port map(A => \CONTROL12/SEQUENCER_STATE[5]_net_1\, B => 
        \CONTROL12/RET_STATE_0_a3_0[6]\, C => 
        \CONTROL12/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL12/SEQUENCER_STATE_maj_RNI803I1[5]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj[15]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[15]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[15]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[15]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[15]_net_1\);
    
    \CONTROL78/DEL_CNTR_maj[12]\ : MAJ3
      port map(A => \CONTROL78/DEL_CNTR_0[12]\, B => 
        \CONTROL78/DEL_CNTR_tmr2[12]_net_1\, C => 
        \CONTROL78/DEL_CNTR_tmr3[12]_net_1\, Y => 
        \CONTROL78/DEL_CNTR[12]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIFBI02[3]\ : MX2
      port map(A => \CONTROL56/N_312\, B => 
        \CONTROL56/N_CH_VOSG_EN_7[1]\, S => 
        \CONTROL56/N_CH_VOSG_EN_2_sqmuxa\, Y => 
        \CONTROL56/N_CH_VOSG_EN[1]\);
    
    \CONTROL12/CH_VOSG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CONTROL12/CH_VOSG_EN_maj_RNIDKMT3[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL12/CH_VOSG_EN_tmr2_2[0]\);
    
    \OVT_FS/THRESH_VAL_maj[1]\ : MAJ3
      port map(A => \OVT_FS/THRESH_VAL_3[1]\, B => 
        \OVT_FS/THRESH_VAL_tmr2_3[1]\, C => 
        \OVT_FS/THRESH_VAL_tmr3_3[1]\, Y => 
        \OVT_FS/THRESH_VAL[1]_net_1\);
    
    \OVT_FS/SIGOUT_tmr3\ : DFN1C0
      port map(D => \OVT_FS/SIGOUT_maj_RNILN142_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \OVT_FS/SIGOUT_tmr3_3\);
    
    \STDBY_OFFB_pad/U0/U1\ : IOIN_IB
      port map(YIN => \STDBY_OFFB_pad/U0/NET1\, Y => STDBY_OFFB_c);
    
    \CONTROL12/DEL_CNTR_tmr2[0]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[0]\);
    
    \UVL_12FUSE/THRESH_VAL_maj[0]\ : MAJ3
      port map(A => \UVL_12FUSE/THRESH_VAL_2[0]\, B => 
        \UVL_12FUSE/THRESH_VAL_tmr2_2[0]\, C => 
        \UVL_12FUSE/THRESH_VAL_tmr3_2[0]\, Y => 
        \UVL_12FUSE/THRESH_VAL[0]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_tmr2[7]\ : DFN1C0
      port map(D => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIADHK7[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[7]\);
    
    \CONTROL56/DEL_CNTR[1]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[1]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_0[1]\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNIMOQC3[8]\ : NOR3B
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH3A4, C => 
        \CONTROL34/N_285\, Y => \CONTROL34/N_315\);
    
    \TX_PROMPT/CNT_VAL_maj_RNILNT71[3]\ : AOI1B
      port map(A => \TX_PROMPT/CNT_VAL_c2\, B => 
        \TX_PROMPT/CNT_VAL[3]_net_1\, C => 
        \TX_PROMPT/un9_cnt_vallto5_0\, Y => 
        \TX_PROMPT/un9_cnt_vallt7\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNI04N27[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_62_2\, Y => \CONTROL78/N_DEL_CNTR[5]\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNI6VQHD[8]\ : OR3A
      port map(A => \CONTROL78/N_313\, B => \CONTROL78/N_225\, C
         => \CONTROL78/I_48_2\, Y => \CONTROL78/N_DEL_CNTR[11]\);
    
    \UVL_34FUSE/un1_tmp_sum_in_b_0_m30\ : XNOR3
      port map(A => \UVL_34FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_34FUSE/FILT_OUT[2]_net_1\, C => \UVL_34FUSE/i2_mux\, 
        Y => \UVL_34FUSE/N_31_i\);
    
    \P_CH_MREG_EN_pad[1]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_MREG_EN_c_c[0]\, E => \VCC\, DOUT => 
        \P_CH_MREG_EN_pad[1]/U0/NET1\, EOUT => 
        \P_CH_MREG_EN_pad[1]/U0/NET2\);
    
    \CONTROL34/SEQUENCER_STATE_maj[5]\ : MAJ3
      port map(A => \CONTROL34/SEQUENCER_STATE_1[5]\, B => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[5]\, C => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[5]\, Y => 
        \CONTROL34/SEQUENCER_STATE[5]_net_1\);
    
    \CONTROL78/un1_DEL_CNTR_I_54\ : XOR3
      port map(A => \CONTROL78/DEL_CNTR[10]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_11_1[0]\, Y => 
        \CONTROL78/I_54_2\);
    
    \UVL_34FUSE/SIGOUT_maj\ : MAJ3
      port map(A => \UVL_34FUSE/SIGOUT_1\, B => 
        \UVL_34FUSE/SIGOUT_tmr2_1\, C => 
        \UVL_34FUSE/SIGOUT_tmr3_1\, Y => UVL_OK_CH3A4);
    
    \REFCNT[0]\ : DFN1C0
      port map(D => \REFCNT_i[0]\, CLK => CLK40M_OSC_c, CLR => 
        POR_OUT_TO_SCA_c, Q => \REFCNT_0[0]\);
    
    \UVL_78FUSE/FILT_OUT_maj[4]\ : MAJ3
      port map(A => \UVL_78FUSE/FILT_OUT_0[4]\, B => 
        \UVL_78FUSE/FILT_OUT_tmr2[4]_net_1\, C => 
        \UVL_78FUSE/FILT_OUT_tmr3[4]_net_1\, Y => 
        \UVL_78FUSE/FILT_OUT[4]_net_1\);
    
    \TX_PROMPT/CNT_VAL_maj_RNI581N[11]\ : NOR2
      port map(A => \TX_PROMPT/CNT_VAL[10]_net_1\, B => 
        \TX_PROMPT/CNT_VAL[11]_net_1\, Y => 
        \TX_PROMPT/un9_cnt_vallto11_0\);
    
    \CONTROL34/DEL_CNTR[10]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[10]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_1[10]\);
    
    \TX_PROMPT/CNT_VAL_tmr2[9]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n9\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[9]_net_1\);
    
    \DTYCYC_CNT[0]\ : DFN1P0
      port map(D => DTYCYC_CNT_25, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_0[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_71\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_1[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_2[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12[0]\);
    
    \CONTROL56/SEQUENCER_STATE_maj[6]\ : MAJ3
      port map(A => \CONTROL56/SEQUENCER_STATE_0[6]\, B => 
        \CONTROL56/SEQUENCER_STATE_tmr2_0[6]\, C => 
        \CONTROL56/SEQUENCER_STATE_tmr3_0[6]\, Y => 
        \CONTROL56/SEQUENCER_STATE[6]_net_1\);
    
    \CONTROL34/DEL_CNTR_maj_RNICMC32[5]\ : NOR3C
      port map(A => \CONTROL34/un8_del_cntr_10\, B => 
        \CONTROL34/un8_del_cntr_9\, C => 
        \CONTROL34/un8_del_cntr_11\, Y => 
        \CONTROL34/un8_del_cntr\);
    
    \OVT_FS/FILT_OUT_tmr2[3]\ : DFN1C0
      port map(D => \OVT_FS/N_27_i\, CLK => BUF5M_J11_15_TCONN_c, 
        CLR => POR_OUT_TO_SCA_c, Q => \OVT_FS/FILT_OUT_tmr2_3[3]\);
    
    \CONTROL56/DEL_CNTR_tmr2[8]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[8]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[8]\);
    
    \CONTROL78/DEL_CNTR[4]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_0[4]\);
    
    \UVL_34FUSE/SIG_IN_DEL_tmr3[0]\ : DFN1C0
      port map(D => \FPGA_FUSE_3_4_OK_c[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/SIG_IN_DEL_tmr3_1[0]\);
    
    \UVL_56FUSE/un1_tmp_sum_in_b_0_m15\ : XOR2
      port map(A => \UVL_56FUSE/FILT_OUT[6]_net_1\, B => 
        \UVL_56FUSE/FILT_OUT[5]_net_1\, Y => \UVL_56FUSE/N_40\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIS3911[6]\ : NOR3C
      port map(A => \TX_PROMPT/CNT_VAL[6]_net_1\, B => 
        \TX_PROMPT/CNT_VAL[5]_net_1\, C => 
        \TX_PROMPT/CNT_m6_0_a2_3\, Y => \TX_PROMPT/CNT_m6_0_a2_5\);
    
    \CONTROL12/SEQUENCER_STATE_maj_RNIMKD22[6]\ : NOR2A
      port map(A => \CONTROL12/N_312\, B => \CONTROL12/N_222\, Y
         => \CONTROL12/N_CH_MREG_EN_1_sqmuxa\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNI9EJD7[9]\ : NOR3
      port map(A => \CONTROL78/N_271\, B => 
        \CONTROL78/SEQUENCER_STATE_ns_i_1[2]\, C => 
        \CONTROL78/N_313\, Y => 
        \CONTROL78/SEQUENCER_STATE_maj_RNI9EJD7[9]_net_1\);
    
    \CONTROL78/RET_STATE_maj_RNI7JV81[4]\ : MIN3X
      port map(A => \CONTROL78/RET_STATE[6]_net_1\, B => 
        \CONTROL78/RET_STATE[5]_net_1\, C => 
        \CONTROL78/RET_STATE[4]_net_1\, Y => \CONTROL78/N_236\);
    
    \UVL_78FUSE/un1_tmp_sum_in_b_0_m22\ : XNOR3
      port map(A => \UVL_78FUSE/FILT_OUT[6]_net_1\, B => 
        \UVL_78FUSE/FILT_OUT[7]_net_1\, C => \UVL_78FUSE/i10_mux\, 
        Y => \UVL_78FUSE/N_23_i\);
    
    \DTYCYC_CNT_tmr2[0]\ : DFN1P0
      port map(D => DTYCYC_CNT_25, CLK => BUF5M_J11_15_TCONN_c, 
        PRE => POR_OUT_TO_SCA_c, Q => \DTYCYC_CNT_tmr2[0]_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]\ : NOR2
      port map(A => \CONTROL78/SEQUENCER_STATE[4]_net_1\, B => 
        \CONTROL78/SEQUENCER_STATE[3]_net_1\, Y => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIN1F7_0[4]_net_1\);
    
    VAL_MAN_EN_CH_8TO5_maj : MAJ3
      port map(A => VAL_MAN_EN_CH_8TO5_0, B => 
        \VAL_MAN_EN_CH_8TO5_tmr2\, C => \VAL_MAN_EN_CH_8TO5_tmr3\, 
        Y => \VAL_MAN_EN_CH_8TO5\);
    
    \CONTROL34/SEQUENCER_STATE_maj_RNI12OH7[8]\ : NOR3
      port map(A => \CONTROL34/N_315\, B => 
        \CONTROL34/SEQUENCER_STATE_maj_RNIA54A2[8]_net_1\, C => 
        \CONTROL34/N_266\, Y => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI12OH7[8]_net_1\);
    
    \UVL_12FUSE/FILT_OUT_maj_RNIDPSV[3]\ : NOR3
      port map(A => \UVL_12FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_12FUSE/FILT_OUT[7]_net_1\, C => 
        \UVL_12FUSE/FILT_OUT[6]_net_1\, Y => 
        \UVL_12FUSE/n_sigout15lto7_2\);
    
    \UVL_56FUSE/FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => \UVL_56FUSE/FILT_OUT_maj_RNILIRQ5_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_56FUSE/FILT_OUT_tmr2_0[7]\);
    
    \CONTROL12/un1_DEL_CNTR_I_76\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_1_1[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_2[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_2[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_11[0]\);
    
    \UVL_12FUSE/FILT_OUT_maj[5]\ : MAJ3
      port map(A => \UVL_12FUSE/FILT_OUT_2[5]\, B => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[5]\, C => 
        \UVL_12FUSE/FILT_OUT_tmr3_2[5]\, Y => 
        \UVL_12FUSE/FILT_OUT[5]_net_1\);
    
    \UVL_78FUSE/un1_tmp_sum_in_b_0_m19\ : AO18
      port map(A => \UVL_78FUSE/FILT_OUT[6]_net_1\, B => 
        \UVL_78FUSE/i10_mux\, C => \UVL_78FUSE/FILT_OUT[7]_net_1\, 
        Y => \UVL_78FUSE/i12_mux\);
    
    \P_CH_MREG_EN_pad[0]/U0/U0\ : IOPAD_TRI
      port map(D => \P_CH_MREG_EN_pad[0]/U0/NET1\, E => 
        \P_CH_MREG_EN_pad[0]/U0/NET2\, PAD => P_CH_MREG_EN(0));
    
    \CONTROL56/un1_DEL_CNTR_I_65\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_12[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12_5[0]\);
    
    \PRI_TX_EN_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => \VCC\, E => \VCC\, DOUT => 
        \PRI_TX_EN_pad/U0/NET1\, EOUT => \PRI_TX_EN_pad/U0/NET2\);
    
    \UVL_56FUSE/un1_tmp_sum_in_b_0_m13\ : AO18
      port map(A => \UVL_56FUSE/FILT_OUT[4]_net_1\, B => 
        \UVL_56FUSE/i6_mux\, C => \UVL_56FUSE/FILT_OUT[5]_net_1\, 
        Y => \UVL_56FUSE/i8_mux\);
    
    \CONTROL34/un1_DEL_CNTR_I_80\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_1_4[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_1_4[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_5[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_2_2[0]\);
    
    \UVL_78FUSE/FILT_OUT_tmr3[7]\ : DFN1C0
      port map(D => \UVL_78FUSE/FILT_OUT_maj_RNIL726C_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_78FUSE/FILT_OUT_tmr3[7]_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_tmr3[6]\ : DFN1C0
      port map(D => \CONTROL78/SEQUENCER_STATE_ns[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr3[6]_net_1\);
    
    \CONTROL56/CH_VOSG_EN_tmr2[0]\ : DFN1C0
      port map(D => \CONTROL56/CH_VOSG_EN_maj_RNIQG1A3[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL56/CH_VOSG_EN_tmr2_0[0]\);
    
    \UVL_34FUSE/FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => \UVL_34FUSE/N_29_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_34FUSE/FILT_OUT_tmr2_1[2]\);
    
    \CONTROL78/CH_VOSG_EN[0]\ : DFN1C0
      port map(D => \CONTROL78/CH_VOSG_EN_maj_RNI7A7M1[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/CH_VOSG_EN[0]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_85\ : AND2
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_3[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_4[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_1_1[0]\);
    
    \TX_PROMPT/CNT_VAL_maj[5]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[5]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[5]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[5]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[5]_net_1\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNIJKUH2[8]\ : OA1A
      port map(A => \CONTROL56/SEQUENCER_STATE[8]_net_1\, B => 
        \CONTROL56/N_246\, C => \CONTROL56/N_309\, Y => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIJKUH2[8]_net_1\);
    
    \CONTROL56/DEL_CNTR_tmr2[12]\ : DFN1P0
      port map(D => \CONTROL56/N_DEL_CNTR[12]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL56/DEL_CNTR_tmr2_0[12]\);
    
    \TX_PROMPT/CNT_VAL_maj[10]\ : MAJ3
      port map(A => \TX_PROMPT/CNT_VAL_0[10]\, B => 
        \TX_PROMPT/CNT_VAL_tmr2[10]_net_1\, C => 
        \TX_PROMPT/CNT_VAL_tmr3[10]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL[10]_net_1\);
    
    \UVL_78FUSE/FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => \UVL_78FUSE/N_33_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/FILT_OUT_tmr2[0]_net_1\);
    
    MAN_EN_CH_4TO1_A_tmr2 : DFN1C0
      port map(D => MAN_EN_CH_4TO1_A_14, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_4TO1_A_tmr2\);
    
    \CONTROL12/DEL_CNTR_tmr2[6]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[6]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[6]\);
    
    \CONTROL34/un1_DEL_CNTR_I_9\ : AND2
      port map(A => \CONTROL34/DEL_CNTR[10]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_10[0]\);
    
    \UVL_78FUSE/SIGOUT_tmr3\ : DFN1C0
      port map(D => \UVL_78FUSE/SIGOUT_maj_RNI96K25_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/SIGOUT_tmr3_net_1\);
    
    \UVL_12FUSE/SIG_IN_DEL_tmr2[0]\ : DFN1C0
      port map(D => \FPGA_FUSE_1_2_OK_c[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/SIG_IN_DEL_tmr2_2[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_21\ : XOR2
      port map(A => \CONTROL56/DEL_CNTR[13]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_0_12[0]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNI70KH1[6]\ : NOR2A
      port map(A => \CONTROL56/N_312\, B => \CONTROL56/N_222\, Y
         => \CONTROL56/N_CH_MREG_EN_1_sqmuxa\);
    
    \CONTROL34/un1_DEL_CNTR_I_77\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_1[0]\, B
         => \CONTROL34/DWACT_ADD_CI_0_g_array_1[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_1[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_2[0]\);
    
    \UVL_12FUSE/FILT_OUT_tmr2[2]\ : DFN1C0
      port map(D => \UVL_12FUSE/N_29_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_tmr2_2[2]\);
    
    \CONTROL34/DEL_CNTR_maj[11]\ : MAJ3
      port map(A => \CONTROL34/DEL_CNTR_1[11]\, B => 
        \CONTROL34/DEL_CNTR_tmr2_1[11]\, C => 
        \CONTROL34/DEL_CNTR_tmr3_1[11]\, Y => 
        \CONTROL34/DEL_CNTR[11]_net_1\);
    
    \MODE_DCYC_NORMB_pad/U0/U1\ : IOIN_IB
      port map(YIN => \MODE_DCYC_NORMB_pad/U0/NET1\, Y => 
        MODE_DCYC_NORMB_c);
    
    \CONTROL12/CH_VOSG_EN_maj_RNIFR854[1]\ : MX2
      port map(A => \CONTROL12/N_CH_VOSG_EN[1]\, B => 
        \P_CH_VOSG_EN_c[1]\, S => \CONTROL12/N_290\, Y => 
        \CONTROL12/CH_VOSG_EN_maj_RNIFR854[1]_net_1\);
    
    MAN_EN_CH_4TO1_B_tmr3 : DFN1C0
      port map(D => MAN_EN_CH_4TO1_B_17, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \MAN_EN_CH_4TO1_B_tmr3\);
    
    \CONTROL34/SEQUENCER_STATE_tmr3[9]\ : DFN1P0
      port map(D => 
        \CONTROL34/SEQUENCER_STATE_maj_RNI12OH7[8]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[9]\);
    
    \CONTROL12/un1_DEL_CNTR_I_79\ : AO1
      port map(A => \CONTROL12/DWACT_ADD_CI_0_pog_array_1_2[0]\, 
        B => \CONTROL12/DWACT_ADD_CI_0_g_array_1_2[0]\, C => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_1_3[0]\, Y => 
        \CONTROL12/DWACT_ADD_CI_0_g_array_2_1[0]\);
    
    \TX_PROMPT/CNT_VAL_tmr3[1]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[1]_net_1\);
    
    \CONTROL78/RET_STATE_maj[5]\ : MAJ3
      port map(A => \CONTROL78/RET_STATE_0[5]\, B => 
        \CONTROL78/RET_STATE_tmr2[5]_net_1\, C => 
        \CONTROL78/RET_STATE_tmr3[5]_net_1\, Y => 
        \CONTROL78/RET_STATE[5]_net_1\);
    
    \TX_PROMPT/CNT_VAL_tmr2[19]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n19\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr2[19]_net_1\);
    
    \CONTROL78/DEL_CNTR_tmr2[9]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[9]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr2[9]_net_1\);
    
    \CONTROL34/DEL_CNTR_tmr2[11]\ : DFN1P0
      port map(D => \CONTROL34/N_DEL_CNTR[11]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL34/DEL_CNTR_tmr2_1[11]\);
    
    \UVL_56FUSE/FILT_OUT_tmr2[0]\ : DFN1C0
      port map(D => \UVL_56FUSE/N_33_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_tmr2_0[0]\);
    
    \P_CH_VOSG_EN_pad[7]/U0/U1\ : IOTRI_OB_EB
      port map(D => \P_CH_VOSG_EN_c[7]\, E => \VCC\, DOUT => 
        \P_CH_VOSG_EN_pad[7]/U0/NET1\, EOUT => 
        \P_CH_VOSG_EN_pad[7]/U0/NET2\);
    
    DEL0_DEV_RST_B_tmr3 : DFN1C0
      port map(D => \VCC\, CLK => CLK40M_OSC_c, CLR => POR_FPGA_c, 
        Q => \DEL0_DEV_RST_B_tmr3\);
    
    \CONTROL78/RET_STATE[6]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNIO1SO[5]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/RET_STATE_0[6]\);
    
    \CONTROL12/RET_STATE_maj_RNIB33I1[9]\ : NOR2A
      port map(A => \CONTROL12/RET_STATE[9]_net_1\, B => 
        \CONTROL12/N_225\, Y => 
        \CONTROL12/RET_STATE_maj_RNIB33I1[9]_net_1\);
    
    \TX_PROMPT/CNT_VAL_tmr3[6]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n6\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[6]_net_1\);
    
    \CONTROL78/DEL_CNTR_tmr3[10]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[10]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[10]_net_1\);
    
    \UVL_78FUSE/SIG_IN_DEL_maj[0]\ : MAJ3
      port map(A => \UVL_78FUSE/SIG_IN_DEL_0[0]\, B => 
        \UVL_78FUSE/SIG_IN_DEL_tmr2[0]_net_1\, C => 
        \UVL_78FUSE/SIG_IN_DEL_tmr3[0]_net_1\, Y => 
        \UVL_78FUSE/SIG_IN_DEL[0]_net_1\);
    
    \UVL_34FUSE/un1_tmp_sum_in_b_0_m28\ : XNOR3
      port map(A => \UVL_34FUSE/FILT_OUT[4]_net_1\, B => 
        \UVL_34FUSE/FILT_OUT[3]_net_1\, C => \UVL_34FUSE/i4_mux\, 
        Y => \UVL_34FUSE/N_29_i\);
    
    \CONTROL34/DTYCYC_CNT_n2_0\ : OR2
      port map(A => \CONTROL34/N_17_i\, B => 
        \CONTROL34/un1_mode_dcyc_normb_1\, Y => \CONTROL34/N_64\);
    
    \CONTROL34/DTYCYC_EN_20\ : MX2
      port map(A => \CONTROL34/un1_mode_dcyc_normb_1\, B => 
        \DTYCYC_EN\, S => \CONTROL34/N_DTYCYC_CNT_2_sqmuxa\, Y
         => DTYCYC_EN_20);
    
    \CONTROL12/SEQUENCER_STATE_maj[7]\ : MAJ3
      port map(A => \CONTROL12/SEQUENCER_STATE_2[7]\, B => 
        \CONTROL12/SEQUENCER_STATE_tmr2_2[7]\, C => 
        \CONTROL12/SEQUENCER_STATE_tmr3_2[7]\, Y => 
        \CONTROL12/SEQUENCER_STATE[7]_net_1\);
    
    \CONTROL56/un1_DEL_CNTR_I_64\ : AO1
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0[0]\, B
         => \CONTROL56/DWACT_ADD_CI_0_TMP[0]\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_1[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_1[0]\);
    
    \CONTROL56/SEQUENCER_STATE_maj_RNILB5P[6]\ : OR2
      port map(A => \CONTROL56/SEQUENCER_STATE[6]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE[7]_net_1\, Y => 
        \CONTROL56/N_222\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNI9KCQ1[9]\ : NOR3A
      port map(A => \CONTROL78/N_236\, B => 
        \CONTROL78/RET_STATE[9]_net_1\, C => 
        \CONTROL78/SEQUENCER_STATE[9]_net_1\, Y => 
        \CONTROL78/N_271\);
    
    \CONTROL78/DEL_CNTR_tmr3[0]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[0]_net_1\);
    
    \CONTROL34/SEQUENCER_STATE_maj[8]\ : MAJ3
      port map(A => \CONTROL34/SEQUENCER_STATE_1[8]\, B => 
        \CONTROL34/SEQUENCER_STATE_tmr2_1[8]\, C => 
        \CONTROL34/SEQUENCER_STATE_tmr3_1[8]\, Y => 
        \CONTROL34/SEQUENCER_STATE[8]_net_1\);
    
    \CONTROL56/RET_STATE_maj_RNI1MCD9[9]\ : NOR3
      port map(A => \CONTROL56/N_315\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIJKUH2[8]_net_1\, C => 
        \CONTROL56/N_266\, Y => 
        \CONTROL56/RET_STATE_maj_RNI1MCD9[9]_net_1\);
    
    \CONTROL56/CH_VOSG_EN_maj[0]\ : MAJ3
      port map(A => \CONTROL56/CH_VOSG_EN_0[0]\, B => 
        \CONTROL56/CH_VOSG_EN_tmr2_0[0]\, C => 
        \CONTROL56/CH_VOSG_EN_tmr3_0[0]\, Y => 
        \P_CH_VOSG_EN_c[4]\);
    
    \CONTROL78/DEL_CNTR_maj_RNIV4M51[9]\ : NOR3A
      port map(A => \CONTROL78/un8_del_cntr_6\, B => 
        \CONTROL78/DEL_CNTR[9]_net_1\, C => 
        \CONTROL78/DEL_CNTR[10]_net_1\, Y => 
        \CONTROL78/un8_del_cntr_10\);
    
    \CONTROL12/DEL_CNTR_tmr2[2]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[2]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[2]\);
    
    \UVL_56FUSE/FILT_OUT[3]\ : DFN1C0
      port map(D => \UVL_56FUSE/N_27_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/FILT_OUT_0[3]\);
    
    \UVL_34FUSE/un1_tmp_sum_in_b_0_m10\ : AO18
      port map(A => \UVL_34FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_34FUSE/i4_mux\, C => \UVL_34FUSE/FILT_OUT[4]_net_1\, 
        Y => \UVL_34FUSE/i6_mux\);
    
    \J11_23_TCONN_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => \GND\, E => \VCC\, DOUT => 
        \J11_23_TCONN_pad/U0/NET1\, EOUT => 
        \J11_23_TCONN_pad/U0/NET2\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIUDU83[8]\ : OA1C
      port map(A => \CONTROL78/SEQUENCER_STATE[8]_net_1\, B => 
        \CONTROL78/un8_del_cntr\, C => \CONTROL78/N_225\, Y => 
        \CONTROL78/N_285\);
    
    \CONTROL78/SEQUENCER_STATE_maj_RNIMDTK3[8]\ : NOR3B
      port map(A => STATUS_LED_c_0, B => UVL_OK_CH7A8, C => 
        \CONTROL78/N_285\, Y => \CONTROL78/N_315\);
    
    \CONTROL34/un1_DEL_CNTR_I_22\ : XOR2
      port map(A => \CONTROL34/DEL_CNTR[9]_net_1\, B => 
        \CONTROL34/N_230_0\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_pog_array_0_8[0]\);
    
    \CONTROL78/CH_MREG_EN[0]\ : DFN1C0
      port map(D => \CONTROL78/CH_MREG_EN_maj_RNIKHAC1[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \CONTROL78/CH_MREG_EN[0]_net_1\);
    
    \CONTROL78/RET_STATE_maj_RNIR4SO[9]\ : NOR2A
      port map(A => \CONTROL78/RET_STATE[9]_net_1\, B => 
        \CONTROL78/N_225\, Y => 
        \CONTROL78/RET_STATE_maj_RNIR4SO[9]_net_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_68\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_1_5[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_10[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1_6[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_11_2[0]\);
    
    \OVT_FS/SUM_IN_A_tmr2[5]\ : DFN1C0
      port map(D => \OVT_FS/SIG_IN_DEL_maj_RNIMR1A_0[0]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \OVT_FS/SUM_IN_A_tmr2_3[5]\);
    
    \TX_PROMPT/CNT_VAL_tmr3[15]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n15\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_tmr3[15]_net_1\);
    
    \CONTROL56/RET_STATE_maj[5]\ : MAJ3
      port map(A => \CONTROL56/RET_STATE_0[5]\, B => 
        \CONTROL56/RET_STATE_tmr2_0[5]\, C => 
        \CONTROL56/RET_STATE_tmr3_0[5]\, Y => 
        \CONTROL56/RET_STATE[5]_net_1\);
    
    \CONTROL12/DEL_CNTR[8]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[8]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_2[8]\);
    
    \TX_PROMPT/CNT_VAL_maj_RNIN6I22_0[9]\ : AX1C
      port map(A => \TX_PROMPT/CNT_m6_0_a2_4\, B => 
        \TX_PROMPT/CNT_m6_0_a2_5\, C => 
        \TX_PROMPT/CNT_VAL[9]_net_1\, Y => 
        \TX_PROMPT/CNT_VAL_n9_tz\);
    
    \CONTROL34/RET_STATE_maj_RNI8TSD5[4]\ : AO1
      port map(A => \CONTROL34/N_304\, B => \CONTROL34/N_302\, C
         => \CONTROL34/N_275\, Y => 
        \CONTROL34/SEQUENCER_STATE_ns[5]\);
    
    \OVT_FS/FILT_OUT_maj_RNIS59B[3]\ : NOR3
      port map(A => \OVT_FS/FILT_OUT[3]_net_1\, B => 
        \OVT_FS/FILT_OUT[7]_net_1\, C => 
        \OVT_FS/FILT_OUT[6]_net_1\, Y => 
        \OVT_FS/n_sigout15lto7_2\);
    
    \UVL_12FUSE/FILT_OUT[2]\ : DFN1C0
      port map(D => \UVL_12FUSE/N_29_i\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_2[2]\);
    
    \UVL_34FUSE/FILT_OUT_maj_RNIFJDV[3]\ : NOR2B
      port map(A => \UVL_34FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_34FUSE/FILT_OUT[6]_net_1\, Y => 
        \UVL_34FUSE/n_sigout3lto6_0\);
    
    \UVL_34FUSE/FILT_OUT_tmr2[7]\ : DFN1C0
      port map(D => \UVL_34FUSE/FILT_OUT_maj_RNILTKFJ_0[7]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \UVL_34FUSE/FILT_OUT_tmr2_1[7]\);
    
    \CONTROL78/un1_DEL_CNTR_I_78\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_1_3[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_1_4[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_11_1[0]\);
    
    \OVT_FS/THRESH_VAL_tmr2[1]\ : DFN1C0
      port map(D => \OVT_FS/THRESH_VAL_maj_RNIOLGD1[1]_net_1\, 
        CLK => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q
         => \OVT_FS/THRESH_VAL_tmr2_3[1]\);
    
    \CONTROL56/un1_DEL_CNTR_I_10\ : AND2
      port map(A => \CONTROL56/DEL_CNTR[4]_net_1\, B => 
        \CONTROL56/N_230_0\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_0_4[0]\);
    
    \UVL_78FUSE/THRESH_VAL_maj_RNI66PK1_0[1]\ : AOI1B
      port map(A => \UVL_78FUSE/n_sigout15lto7_2\, B => 
        \UVL_78FUSE/n_sigout15lto7_1\, C => 
        \UVL_78FUSE/THRESH_VAL[1]_net_1\, Y => \UVL_78FUSE/N_95\);
    
    \UVL_56FUSE/SIG_IN_DEL_tmr3[0]\ : DFN1C0
      port map(D => \FPGA_FUSE_5_6_OK_c[0]\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_56FUSE/SIG_IN_DEL_tmr3_0[0]\);
    
    un2_n_refcnt_1_SUM1 : XOR2
      port map(A => \REFCNT[0]_net_1\, B => \REFCNT[1]_net_1\, Y
         => SUM1);
    
    \UVL_34FUSE/FILT_OUT_maj_RNIPF4F1[3]\ : NOR3
      port map(A => \UVL_34FUSE/FILT_OUT[3]_net_1\, B => 
        \UVL_34FUSE/FILT_OUT[7]_net_1\, C => 
        \UVL_34FUSE/FILT_OUT[6]_net_1\, Y => 
        \UVL_34FUSE/n_sigout15lto7_2\);
    
    \CONTROL56/un1_DEL_CNTR_I_92\ : AND2
      port map(A => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_11[0]\, 
        B => \CONTROL56/DWACT_ADD_CI_0_pog_array_0_12[0]\, Y => 
        \CONTROL56/DWACT_ADD_CI_0_pog_array_1_5[0]\);
    
    \CONTROL34/un1_DEL_CNTR_I_64\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0[0]\, B
         => \CONTROL34/DWACT_ADD_CI_0_TMP[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_1[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_1[0]\);
    
    \TX_PROMPT/CNT_VAL[3]\ : DFN1C0
      port map(D => \TX_PROMPT/CNT_VAL_n3\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \TX_PROMPT/CNT_VAL_0[3]\);
    
    \CONTROL56/RET_STATE_maj[4]\ : MAJ3
      port map(A => \CONTROL56/RET_STATE_0[4]\, B => 
        \CONTROL56/RET_STATE_tmr2_0[4]\, C => 
        \CONTROL56/RET_STATE_tmr3_0[4]\, Y => 
        \CONTROL56/RET_STATE[4]_net_1\);
    
    \CONTROL78/SEQUENCER_STATE_tmr3[7]\ : DFN1C0
      port map(D => 
        \CONTROL78/SEQUENCER_STATE_maj_RNI9EJD7[9]_net_1\, CLK
         => BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/SEQUENCER_STATE_tmr3[7]_net_1\);
    
    \CONTROL12/DEL_CNTR_tmr3[3]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[3]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr3_2[3]\);
    
    \UVL_78FUSE/SUM_IN_A[5]\ : DFN1C0
      port map(D => 
        \UVL_78FUSE/SIG_IN_DEL_maj_RNI48TK_0[0]_net_1\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_78FUSE/SUM_IN_A_0[5]\);
    
    \CONTROL78/un1_DEL_CNTR_I_27\ : XOR2
      port map(A => \CONTROL78/DEL_CNTR[11]_net_1\, B => 
        \CONTROL78/N_230_0\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_pog_array_0_10[0]\);
    
    \CONTROL12/DEL_CNTR_tmr2[8]\ : DFN1P0
      port map(D => \CONTROL12/N_DEL_CNTR[8]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL12/DEL_CNTR_tmr2_2[8]\);
    
    \UVL_12FUSE/SIGOUT_maj\ : MAJ3
      port map(A => \UVL_12FUSE/SIGOUT_2\, B => 
        \UVL_12FUSE/SIGOUT_tmr2_2\, C => 
        \UVL_12FUSE/SIGOUT_tmr3_2\, Y => UVL_OK_CH1A2);
    
    \CONTROL78/un1_DEL_CNTR_I_74\ : AO1
      port map(A => \CONTROL78/DWACT_ADD_CI_0_pog_array_0_7[0]\, 
        B => \CONTROL78/DWACT_ADD_CI_0_g_array_3[0]\, C => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_0_8[0]\, Y => 
        \CONTROL78/DWACT_ADD_CI_0_g_array_12_3[0]\);
    
    \CONTROL56/un1_DEL_CNTR_I_51\ : XOR3
      port map(A => \CONTROL56/DEL_CNTR[3]_net_1\, B => 
        \CONTROL56/SEQUENCER_STATE_maj_RNIF55P_0[4]_net_1\, C => 
        \CONTROL56/DWACT_ADD_CI_0_g_array_12[0]\, Y => 
        \CONTROL56/I_51_1\);
    
    \CONTROL34/un1_DEL_CNTR_I_69\ : AO1
      port map(A => \CONTROL34/DWACT_ADD_CI_0_pog_array_0_9[0]\, 
        B => \CONTROL34/DWACT_ADD_CI_0_g_array_11_1[0]\, C => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_0_10[0]\, Y => 
        \CONTROL34/DWACT_ADD_CI_0_g_array_12_4[0]\);
    
    \OVT_FS/un1_tmp_sum_in_b_0_m7\ : AO18
      port map(A => \OVT_FS/FILT_OUT[2]_net_1\, B => 
        \OVT_FS/i2_mux\, C => \OVT_FS/FILT_OUT[3]_net_1\, Y => 
        \OVT_FS/i4_mux\);
    
    \CONTROL34/MAN_EN_CH_8TO5_B_18\ : MX2
      port map(A => \MAN_EN_CH_8TO5_B\, B => \MAN_EN_CH_8TO5_A\, 
        S => N_23_i_c, Y => MAN_EN_CH_8TO5_B_18);
    
    \CONTROL78/DEL_CNTR_tmr3[4]\ : DFN1P0
      port map(D => \CONTROL78/N_DEL_CNTR[4]\, CLK => 
        BUF5M_J11_15_TCONN_c, PRE => POR_OUT_TO_SCA_c, Q => 
        \CONTROL78/DEL_CNTR_tmr3[4]_net_1\);
    
    \UVL_12FUSE/FILT_OUT[5]\ : DFN1C0
      port map(D => \UVL_12FUSE/ADD_4x4_fast_I6_Y_0\, CLK => 
        BUF5M_J11_15_TCONN_c, CLR => POR_OUT_TO_SCA_c, Q => 
        \UVL_12FUSE/FILT_OUT_2[5]\);
    
    \REFCNT_maj[0]\ : MAJ3
      port map(A => \REFCNT_0[0]\, B => \REFCNT_tmr2[0]_net_1\, C
         => \REFCNT_tmr3[0]_net_1\, Y => \REFCNT[0]_net_1\);
    
    GND_power_inst1 : GND
      port map( Y => GND_power_net1);

    VCC_power_inst1 : VCC
      port map( Y => VCC_power_net1);


end DEF_ARCH; 
