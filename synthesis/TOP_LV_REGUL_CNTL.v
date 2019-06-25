`timescale 1 ns/100 ps
// Version: v11.7 SP3 11.7.3.8


module TOP_LV_REGUL_CNTL(
       CLK40MHZ,
       DEV_RST_B,
       P_MASTER_RST_B,
       P_CLK_5M_GL,
       SIG_IN,
       P_FILT_OUT
    );
input  CLK40MHZ;
input  DEV_RST_B;
output P_MASTER_RST_B;
output P_CLK_5M_GL;
input  [0:0] SIG_IN;
output [7:0] P_FILT_OUT;

    wire I_15, I_18, I_16, VCC, GND, \REFCNT_maj_RNI76JC[1]_net_1 , 
        SUM1, \un2_n_filt_out.DWACT_ADD_CI_0_TMP[0] , 
        \un2_n_filt_out.DWACT_ADD_CI_0_partial_sum[0] , 
        \un2_n_filt_out.DWACT_ADD_CI_0_g_array_12[0] , 
        \un2_n_filt_out.DWACT_ADD_CI_0_g_array_1[0] , m17, m16, m15, 
        ADD_8x8_fast_I47_Y, \un1_tmp_sum_in_b_0.i1_mux , 
        \un1_tmp_sum_in_b_0.i3_mux , \un1_tmp_sum_in_b_0.i5_mux , 
        \un1_tmp_sum_in_b_0.i7_mux , \un1_tmp_sum_in_b_0.N_15 , 
        \un1_tmp_sum_in_b_0.N_20 , \un1_tmp_sum_in_b_0.N_22 , 
        \un1_tmp_sum_in_b_0.N_24 , \un1_tmp_sum_in_b_0.N_26 , 
        \un1_tmp_sum_in_b.U1.DWACT_FINC_E[0] , \un1_tmp_sum_in_b.N_2 , 
        CLK40MHZ_c, DEV_RST_B_c, P_MASTER_RST_B_c, P_CLK_5M_GL_c, 
        \SIG_IN_c[0] , \SUM_IN_B[7]_net_1 , \SUM_IN_B[6]_net_1 , 
        \SUM_IN_B[5]_net_1 , \SUM_IN_B[4]_net_1 , \SUM_IN_B[3]_net_1 , 
        \SUM_IN_B[2]_net_1 , \SUM_IN_B[1]_net_1 , \SUM_IN_B[0]_net_1 , 
        \FILT_OUT[7]_net_1 , \FILT_OUT[6]_net_1 , \FILT_OUT[5]_net_1 , 
        \FILT_OUT[4]_net_1 , \FILT_OUT[3]_net_1 , \FILT_OUT[2]_net_1 , 
        \FILT_OUT[1]_net_1 , \FILT_OUT[0]_net_1 , \REFCNT[1]_net_1 , 
        \REFCNT[0]_net_1 , CLK_5M_GL_net_1, \SUM_IN_A[4]_net_1 , 
        DEL0_DEV_RST_B_net_1, \SIG0_IN[0]_net_1 , \FILT_IN[0]_net_1 , 
        MASTER_RST_B_net_1, MASTER_RST_B_0, MASTER_RST_B_tmr2_net_1, 
        MASTER_RST_B_tmr3_net_1, \FILT_IN_0[0] , 
        \FILT_IN_tmr2[0]_net_1 , \FILT_IN_tmr3[0]_net_1 , 
        \SIG0_IN_0[0] , \SIG0_IN_tmr2[0]_net_1 , 
        \SIG0_IN_tmr3[0]_net_1 , DEL0_DEV_RST_B_0, 
        DEL0_DEV_RST_B_tmr2_net_1, DEL0_DEV_RST_B_tmr3_net_1, 
        \SUM_IN_A_0[4] , \SUM_IN_A_tmr2[4]_net_1 , 
        \SUM_IN_A_tmr3[4]_net_1 , CLK_5M_GL_0, CLK_5M_GL_tmr2_net_1, 
        CLK_5M_GL_tmr3_net_1, \REFCNT_0[0] , \REFCNT_tmr2[0]_net_1 , 
        \REFCNT_tmr3[0]_net_1 , \REFCNT_0[1] , \REFCNT_tmr2[1]_net_1 , 
        \REFCNT_tmr3[1]_net_1 , \FILT_OUT_0[0] , 
        \FILT_OUT_tmr2[0]_net_1 , \FILT_OUT_tmr3[0]_net_1 , 
        \FILT_OUT_0[1] , \FILT_OUT_tmr2[1]_net_1 , 
        \FILT_OUT_tmr3[1]_net_1 , \FILT_OUT_0[2] , 
        \FILT_OUT_tmr2[2]_net_1 , \FILT_OUT_tmr3[2]_net_1 , 
        \FILT_OUT_0[3] , \FILT_OUT_tmr2[3]_net_1 , 
        \FILT_OUT_tmr3[3]_net_1 , \FILT_OUT_0[4] , 
        \FILT_OUT_tmr2[4]_net_1 , \FILT_OUT_tmr3[4]_net_1 , 
        \FILT_OUT_0[5] , \FILT_OUT_tmr2[5]_net_1 , 
        \FILT_OUT_tmr3[5]_net_1 , \FILT_OUT_0[6] , 
        \FILT_OUT_tmr2[6]_net_1 , \FILT_OUT_tmr3[6]_net_1 , 
        \FILT_OUT_0[7] , \FILT_OUT_tmr2[7]_net_1 , 
        \FILT_OUT_tmr3[7]_net_1 , \SUM_IN_B_0[0] , 
        \SUM_IN_B_tmr2[0]_net_1 , \SUM_IN_B_tmr3[0]_net_1 , 
        \SUM_IN_B_0[1] , \SUM_IN_B_tmr2[1]_net_1 , 
        \SUM_IN_B_tmr3[1]_net_1 , \SUM_IN_B_0[2] , 
        \SUM_IN_B_tmr2[2]_net_1 , \SUM_IN_B_tmr3[2]_net_1 , 
        \SUM_IN_B_0[3] , \SUM_IN_B_tmr2[3]_net_1 , 
        \SUM_IN_B_tmr3[3]_net_1 , \SUM_IN_B_0[4] , 
        \SUM_IN_B_tmr2[4]_net_1 , \SUM_IN_B_tmr3[4]_net_1 , 
        \SUM_IN_B_0[5] , \SUM_IN_B_tmr2[5]_net_1 , 
        \SUM_IN_B_tmr3[5]_net_1 , \SUM_IN_B_0[6] , 
        \SUM_IN_B_tmr2[6]_net_1 , \SUM_IN_B_tmr3[6]_net_1 , 
        \SUM_IN_B_0[7] , \SUM_IN_B_tmr2[7]_net_1 , 
        \SUM_IN_B_tmr3[7]_net_1 , \REFCNT_i[0] ;
    
    DFN1C0 \REFCNT_tmr2[1]  (.D(SUM1), .CLK(CLK40MHZ_c), .CLR(
        P_MASTER_RST_B_c), .Q(\REFCNT_tmr2[1]_net_1 ));
    DFN1C0 \SUM_IN_B_tmr3[7]  (.D(ADD_8x8_fast_I47_Y), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \SUM_IN_B_tmr3[7]_net_1 ));
    MAJ3 \REFCNT_maj[1]  (.A(\REFCNT_0[1] ), .B(\REFCNT_tmr2[1]_net_1 )
        , .C(\REFCNT_tmr3[1]_net_1 ), .Y(\REFCNT[1]_net_1 ));
    NOR3 un1_tmp_sum_in_b_I_10 (.A(\FILT_OUT[1]_net_1 ), .B(
        \FILT_OUT[0]_net_1 ), .C(\FILT_OUT[2]_net_1 ), .Y(
        \un1_tmp_sum_in_b.U1.DWACT_FINC_E[0] ));
    MAJ3 \SIG0_IN_maj[0]  (.A(\SIG0_IN_0[0] ), .B(
        \SIG0_IN_tmr2[0]_net_1 ), .C(\SIG0_IN_tmr3[0]_net_1 ), .Y(
        \SIG0_IN[0]_net_1 ));
    DFN1C0 DEL0_DEV_RST_B (.D(VCC), .CLK(CLK40MHZ_c), .CLR(DEV_RST_B_c)
        , .Q(DEL0_DEV_RST_B_0));
    AO13 un1_tmp_sum_in_b_0_m6 (.A(\FILT_OUT[5]_net_1 ), .B(
        \un1_tmp_sum_in_b_0.i1_mux ), .C(\FILT_OUT[1]_net_1 ), .Y(
        \un1_tmp_sum_in_b_0.i3_mux ));
    DFN1C0 DEL0_DEV_RST_B_tmr3 (.D(VCC), .CLK(CLK40MHZ_c), .CLR(
        DEV_RST_B_c), .Q(DEL0_DEV_RST_B_tmr3_net_1));
    DFN1C0 CLK_5M_GL_tmr3 (.D(\REFCNT_maj_RNI76JC[1]_net_1 ), .CLK(
        CLK40MHZ_c), .CLR(P_MASTER_RST_B_c), .Q(CLK_5M_GL_tmr3_net_1));
    MAJ3 \FILT_OUT_maj[6]  (.A(\FILT_OUT_0[6] ), .B(
        \FILT_OUT_tmr2[6]_net_1 ), .C(\FILT_OUT_tmr3[6]_net_1 ), .Y(
        \FILT_OUT[6]_net_1 ));
    AO13 un1_tmp_sum_in_b_0_m9 (.A(\FILT_OUT[6]_net_1 ), .B(
        \un1_tmp_sum_in_b_0.i3_mux ), .C(\FILT_OUT[2]_net_1 ), .Y(
        \un1_tmp_sum_in_b_0.i5_mux ));
    MAJ3 \SUM_IN_A_maj[4]  (.A(\SUM_IN_A_0[4] ), .B(
        \SUM_IN_A_tmr2[4]_net_1 ), .C(\SUM_IN_A_tmr3[4]_net_1 ), .Y(
        \SUM_IN_A[4]_net_1 ));
    DFN1C0 \SUM_IN_B_tmr2[7]  (.D(ADD_8x8_fast_I47_Y), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \SUM_IN_B_tmr2[7]_net_1 ));
    DFN1C0 \FILT_OUT[7]  (.D(I_16), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\FILT_OUT_0[7] ));
    DFN1C0 \FILT_OUT_tmr2[3]  (.D(\SUM_IN_B[3]_net_1 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \FILT_OUT_tmr2[3]_net_1 ));
    MAJ3 \FILT_OUT_maj[0]  (.A(\FILT_OUT_0[0] ), .B(
        \FILT_OUT_tmr2[0]_net_1 ), .C(\FILT_OUT_tmr3[0]_net_1 ), .Y(
        \FILT_OUT[0]_net_1 ));
    INBUF \SIG_IN_pad[0]  (.PAD(SIG_IN[0]), .Y(\SIG_IN_c[0] ));
    OUTBUF \P_FILT_OUT_pad[3]  (.D(\FILT_OUT[3]_net_1 ), .PAD(
        P_FILT_OUT[3]));
    DFN1C0 \SUM_IN_B[1]  (.D(\un1_tmp_sum_in_b_0.N_24 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(\SUM_IN_B_0[1] ));
    DFN1C0 \SUM_IN_B_tmr2[6]  (.D(m15), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\SUM_IN_B_tmr2[6]_net_1 ));
    MAJ3 \FILT_IN_maj[0]  (.A(\FILT_IN_0[0] ), .B(
        \FILT_IN_tmr2[0]_net_1 ), .C(\FILT_IN_tmr3[0]_net_1 ), .Y(
        \FILT_IN[0]_net_1 ));
    DFN1C0 \FILT_OUT_tmr3[5]  (.D(I_15), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\FILT_OUT_tmr3[5]_net_1 ));
    DFN1C0 \SUM_IN_B_tmr3[2]  (.D(\un1_tmp_sum_in_b_0.N_22 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \SUM_IN_B_tmr3[2]_net_1 ));
    DFN1C0 \FILT_OUT[6]  (.D(I_18), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\FILT_OUT_0[6] ));
    DFN1C0 \FILT_OUT_tmr2[6]  (.D(I_18), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\FILT_OUT_tmr2[6]_net_1 ));
    XOR2 un2_n_filt_out_I_18 (.A(\SUM_IN_B[6]_net_1 ), .B(
        \un2_n_filt_out.DWACT_ADD_CI_0_g_array_1[0] ), .Y(I_18));
    OUTBUF \P_FILT_OUT_pad[1]  (.D(\FILT_OUT[1]_net_1 ), .PAD(
        P_FILT_OUT[1]));
    CLKINT MASTER_RST_B_maj_RNISC93 (.A(MASTER_RST_B_net_1), .Y(
        P_MASTER_RST_B_c));
    XOR3 un1_tmp_sum_in_b_0_m23 (.A(\FILT_OUT[5]_net_1 ), .B(
        \FILT_OUT[1]_net_1 ), .C(\un1_tmp_sum_in_b_0.i1_mux ), .Y(
        \un1_tmp_sum_in_b_0.N_24 ));
    AO13 un1_tmp_sum_in_b_0_m12 (.A(\FILT_OUT[7]_net_1 ), .B(
        \un1_tmp_sum_in_b_0.i5_mux ), .C(\FILT_OUT[3]_net_1 ), .Y(
        \un1_tmp_sum_in_b_0.i7_mux ));
    DFN1C0 \SUM_IN_B_tmr3[6]  (.D(m15), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\SUM_IN_B_tmr3[6]_net_1 ));
    OUTBUF \P_FILT_OUT_pad[6]  (.D(\FILT_OUT[6]_net_1 ), .PAD(
        P_FILT_OUT[6]));
    MAJ3 DEL0_DEV_RST_B_maj (.A(DEL0_DEV_RST_B_0), .B(
        DEL0_DEV_RST_B_tmr2_net_1), .C(DEL0_DEV_RST_B_tmr3_net_1), .Y(
        DEL0_DEV_RST_B_net_1));
    XOR2 un2_n_filt_out_I_15 (.A(\SUM_IN_B[5]_net_1 ), .B(
        \un2_n_filt_out.DWACT_ADD_CI_0_TMP[0] ), .Y(I_15));
    DFN1C0 \SUM_IN_B_tmr3[4]  (.D(m17), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\SUM_IN_B_tmr3[4]_net_1 ));
    MAJ3 CLK_5M_GL_maj (.A(CLK_5M_GL_0), .B(CLK_5M_GL_tmr2_net_1), .C(
        CLK_5M_GL_tmr3_net_1), .Y(CLK_5M_GL_net_1));
    DFN1C0 \FILT_OUT_tmr2[1]  (.D(\SUM_IN_B[1]_net_1 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \FILT_OUT_tmr2[1]_net_1 ));
    MAJ3 \SUM_IN_B_maj[1]  (.A(\SUM_IN_B_0[1] ), .B(
        \SUM_IN_B_tmr2[1]_net_1 ), .C(\SUM_IN_B_tmr3[1]_net_1 ), .Y(
        \SUM_IN_B[1]_net_1 ));
    GND GND_i (.Y(GND));
    DFN1C0 \FILT_OUT_tmr2[0]  (.D(\SUM_IN_B[0]_net_1 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \FILT_OUT_tmr2[0]_net_1 ));
    DFN1C0 \SUM_IN_B_tmr3[0]  (.D(\un1_tmp_sum_in_b_0.N_26 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \SUM_IN_B_tmr3[0]_net_1 ));
    XOR2 un1_tmp_sum_in_b_0_m17 (.A(\FILT_OUT[4]_net_1 ), .B(
        \un1_tmp_sum_in_b_0.i7_mux ), .Y(m17));
    DFN1C0 \SUM_IN_B[3]  (.D(\un1_tmp_sum_in_b_0.N_20 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(\SUM_IN_B_0[3] ));
    XOR3 un1_tmp_sum_in_b_0_m21 (.A(\FILT_OUT[6]_net_1 ), .B(
        \FILT_OUT[2]_net_1 ), .C(\un1_tmp_sum_in_b_0.i3_mux ), .Y(
        \un1_tmp_sum_in_b_0.N_22 ));
    OUTBUF \P_FILT_OUT_pad[5]  (.D(\FILT_OUT[5]_net_1 ), .PAD(
        P_FILT_OUT[5]));
    DFN1C0 CLK_5M_GL (.D(\REFCNT_maj_RNI76JC[1]_net_1 ), .CLK(
        CLK40MHZ_c), .CLR(P_MASTER_RST_B_c), .Q(CLK_5M_GL_0));
    DFN1C0 \FILT_OUT_tmr3[1]  (.D(\SUM_IN_B[1]_net_1 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \FILT_OUT_tmr3[1]_net_1 ));
    DFN1C0 CLK_5M_GL_tmr2 (.D(\REFCNT_maj_RNI76JC[1]_net_1 ), .CLK(
        CLK40MHZ_c), .CLR(P_MASTER_RST_B_c), .Q(CLK_5M_GL_tmr2_net_1));
    NOR2B un2_n_filt_out_I_22 (.A(
        \un2_n_filt_out.DWACT_ADD_CI_0_g_array_1[0] ), .B(
        \SUM_IN_B[6]_net_1 ), .Y(
        \un2_n_filt_out.DWACT_ADD_CI_0_g_array_12[0] ));
    VCC VCC_i (.Y(VCC));
    DFN1C0 \SUM_IN_B_tmr2[4]  (.D(m17), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\SUM_IN_B_tmr2[4]_net_1 ));
    DFN1C0 \FILT_OUT_tmr3[4]  (.D(
        \un2_n_filt_out.DWACT_ADD_CI_0_partial_sum[0] ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \FILT_OUT_tmr3[4]_net_1 ));
    DFN1C0 \FILT_IN_tmr3[0]  (.D(\SIG0_IN[0]_net_1 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \FILT_IN_tmr3[0]_net_1 ));
    MAJ3 \SUM_IN_B_maj[0]  (.A(\SUM_IN_B_0[0] ), .B(
        \SUM_IN_B_tmr2[0]_net_1 ), .C(\SUM_IN_B_tmr3[0]_net_1 ), .Y(
        \SUM_IN_B[0]_net_1 ));
    OUTBUF P_CLK_5M_GL_pad (.D(P_CLK_5M_GL_c), .PAD(P_CLK_5M_GL));
    MAJ3 \REFCNT_maj[0]  (.A(\REFCNT_0[0] ), .B(\REFCNT_tmr2[0]_net_1 )
        , .C(\REFCNT_tmr3[0]_net_1 ), .Y(\REFCNT[0]_net_1 ));
    MAJ3 \FILT_OUT_maj[3]  (.A(\FILT_OUT_0[3] ), .B(
        \FILT_OUT_tmr2[3]_net_1 ), .C(\FILT_OUT_tmr3[3]_net_1 ), .Y(
        \FILT_OUT[3]_net_1 ));
    AO18 un1_tmp_sum_in_b_0_m3 (.A(\FILT_OUT[0]_net_1 ), .B(
        \FILT_OUT[4]_net_1 ), .C(\un1_tmp_sum_in_b.N_2 ), .Y(
        \un1_tmp_sum_in_b_0.i1_mux ));
    DFN1C0 \SUM_IN_B_tmr2[3]  (.D(\un1_tmp_sum_in_b_0.N_20 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \SUM_IN_B_tmr2[3]_net_1 ));
    DFN1C0 \SUM_IN_B_tmr2[0]  (.D(\un1_tmp_sum_in_b_0.N_26 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \SUM_IN_B_tmr2[0]_net_1 ));
    OUTBUF \P_FILT_OUT_pad[4]  (.D(\FILT_OUT[4]_net_1 ), .PAD(
        P_FILT_OUT[4]));
    DFN1C0 \FILT_OUT_tmr3[3]  (.D(\SUM_IN_B[3]_net_1 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \FILT_OUT_tmr3[3]_net_1 ));
    XOR2 un2_n_refcnt_1_SUM1 (.A(\REFCNT[0]_net_1 ), .B(
        \REFCNT[1]_net_1 ), .Y(SUM1));
    DFN1C0 \SUM_IN_B_tmr2[5]  (.D(m16), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\SUM_IN_B_tmr2[5]_net_1 ));
    DFN1C0 \FILT_OUT[2]  (.D(\SUM_IN_B[2]_net_1 ), .CLK(P_CLK_5M_GL_c), 
        .CLR(P_MASTER_RST_B_c), .Q(\FILT_OUT_0[2] ));
    NOR3A un1_tmp_sum_in_b_0_m14 (.A(\un1_tmp_sum_in_b_0.i7_mux ), .B(
        \FILT_OUT[4]_net_1 ), .C(\FILT_OUT[5]_net_1 ), .Y(
        \un1_tmp_sum_in_b_0.N_15 ));
    DFN1C0 \SUM_IN_B[4]  (.D(m17), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\SUM_IN_B_0[4] ));
    DFN1C0 \FILT_OUT_tmr2[7]  (.D(I_16), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\FILT_OUT_tmr2[7]_net_1 ));
    DFN1C0 \SUM_IN_B[6]  (.D(m15), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\SUM_IN_B_0[6] ));
    DFN1C0 \SUM_IN_B_tmr2[2]  (.D(\un1_tmp_sum_in_b_0.N_22 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \SUM_IN_B_tmr2[2]_net_1 ));
    MAJ3 \SUM_IN_B_maj[2]  (.A(\SUM_IN_B_0[2] ), .B(
        \SUM_IN_B_tmr2[2]_net_1 ), .C(\SUM_IN_B_tmr3[2]_net_1 ), .Y(
        \SUM_IN_B[2]_net_1 ));
    DFN1C0 \REFCNT_tmr3[0]  (.D(\REFCNT_i[0] ), .CLK(CLK40MHZ_c), .CLR(
        P_MASTER_RST_B_c), .Q(\REFCNT_tmr3[0]_net_1 ));
    DFN1C0 \SUM_IN_A[4]  (.D(\FILT_IN[0]_net_1 ), .CLK(P_CLK_5M_GL_c), 
        .CLR(P_MASTER_RST_B_c), .Q(\SUM_IN_A_0[4] ));
    DFN1C0 \SIG0_IN_tmr3[0]  (.D(\SIG_IN_c[0] ), .CLK(P_CLK_5M_GL_c), 
        .CLR(P_MASTER_RST_B_c), .Q(\SIG0_IN_tmr3[0]_net_1 ));
    DFN1C0 \REFCNT[0]  (.D(\REFCNT_i[0] ), .CLK(CLK40MHZ_c), .CLR(
        P_MASTER_RST_B_c), .Q(\REFCNT_0[0] ));
    DFN1C0 \REFCNT_tmr2[0]  (.D(\REFCNT_i[0] ), .CLK(CLK40MHZ_c), .CLR(
        P_MASTER_RST_B_c), .Q(\REFCNT_tmr2[0]_net_1 ));
    DFN1C0 MASTER_RST_B_tmr3 (.D(DEL0_DEV_RST_B_net_1), .CLK(
        CLK40MHZ_c), .CLR(DEV_RST_B_c), .Q(MASTER_RST_B_tmr3_net_1));
    DFN1C0 \SUM_IN_B_tmr2[1]  (.D(\un1_tmp_sum_in_b_0.N_24 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \SUM_IN_B_tmr2[1]_net_1 ));
    DFN1C0 \FILT_OUT[3]  (.D(\SUM_IN_B[3]_net_1 ), .CLK(P_CLK_5M_GL_c), 
        .CLR(P_MASTER_RST_B_c), .Q(\FILT_OUT_0[3] ));
    CLKINT P_CLK_5M_GL_inferred_clock (.A(CLK_5M_GL_net_1), .Y(
        P_CLK_5M_GL_c));
    MAJ3 \FILT_OUT_maj[7]  (.A(\FILT_OUT_0[7] ), .B(
        \FILT_OUT_tmr2[7]_net_1 ), .C(\FILT_OUT_tmr3[7]_net_1 ), .Y(
        \FILT_OUT[7]_net_1 ));
    OUTBUF \P_FILT_OUT_pad[2]  (.D(\FILT_OUT[2]_net_1 ), .PAD(
        P_FILT_OUT[2]));
    DFN1C0 \SUM_IN_B[5]  (.D(m16), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\SUM_IN_B_0[5] ));
    MAJ3 \FILT_OUT_maj[4]  (.A(\FILT_OUT_0[4] ), .B(
        \FILT_OUT_tmr2[4]_net_1 ), .C(\FILT_OUT_tmr3[4]_net_1 ), .Y(
        \FILT_OUT[4]_net_1 ));
    DFN1C0 \FILT_OUT_tmr3[6]  (.D(I_18), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\FILT_OUT_tmr3[6]_net_1 ));
    DFN1C0 \SIG0_IN_tmr2[0]  (.D(\SIG_IN_c[0] ), .CLK(P_CLK_5M_GL_c), 
        .CLR(P_MASTER_RST_B_c), .Q(\SIG0_IN_tmr2[0]_net_1 ));
    DFN1C0 \FILT_OUT_tmr3[0]  (.D(\SUM_IN_B[0]_net_1 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \FILT_OUT_tmr3[0]_net_1 ));
    DFN1C0 \FILT_OUT[4]  (.D(
        \un2_n_filt_out.DWACT_ADD_CI_0_partial_sum[0] ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(\FILT_OUT_0[4] ));
    OUTBUF \P_FILT_OUT_pad[7]  (.D(\FILT_OUT[7]_net_1 ), .PAD(
        P_FILT_OUT[7]));
    DFN1C0 \FILT_IN_tmr2[0]  (.D(\SIG0_IN[0]_net_1 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \FILT_IN_tmr2[0]_net_1 ));
    XOR3 un1_tmp_sum_in_b_0_m19 (.A(\FILT_OUT[7]_net_1 ), .B(
        \FILT_OUT[3]_net_1 ), .C(\un1_tmp_sum_in_b_0.i5_mux ), .Y(
        \un1_tmp_sum_in_b_0.N_20 ));
    DFN1C0 \SUM_IN_B[7]  (.D(ADD_8x8_fast_I47_Y), .CLK(P_CLK_5M_GL_c), 
        .CLR(P_MASTER_RST_B_c), .Q(\SUM_IN_B_0[7] ));
    XOR2 un2_n_filt_out_I_13 (.A(\SUM_IN_B[4]_net_1 ), .B(
        \SUM_IN_A[4]_net_1 ), .Y(
        \un2_n_filt_out.DWACT_ADD_CI_0_partial_sum[0] ));
    OUTBUF P_MASTER_RST_B_pad (.D(P_MASTER_RST_B_c), .PAD(
        P_MASTER_RST_B));
    DFN1C0 \FILT_OUT[1]  (.D(\SUM_IN_B[1]_net_1 ), .CLK(P_CLK_5M_GL_c), 
        .CLR(P_MASTER_RST_B_c), .Q(\FILT_OUT_0[1] ));
    DFN1C0 \FILT_OUT_tmr3[7]  (.D(I_16), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\FILT_OUT_tmr3[7]_net_1 ));
    XOR2 un2_n_filt_out_I_16 (.A(\SUM_IN_B[7]_net_1 ), .B(
        \un2_n_filt_out.DWACT_ADD_CI_0_g_array_12[0] ), .Y(I_16));
    MAJ3 MASTER_RST_B_maj (.A(MASTER_RST_B_0), .B(
        MASTER_RST_B_tmr2_net_1), .C(MASTER_RST_B_tmr3_net_1), .Y(
        MASTER_RST_B_net_1));
    DFN1C0 \SUM_IN_B[0]  (.D(\un1_tmp_sum_in_b_0.N_26 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(\SUM_IN_B_0[0] ));
    XOR2 un1_tmp_sum_in_b_0_m15 (.A(\FILT_OUT[6]_net_1 ), .B(
        \un1_tmp_sum_in_b_0.N_15 ), .Y(m15));
    MAJ3 \FILT_OUT_maj[5]  (.A(\FILT_OUT_0[5] ), .B(
        \FILT_OUT_tmr2[5]_net_1 ), .C(\FILT_OUT_tmr3[5]_net_1 ), .Y(
        \FILT_OUT[5]_net_1 ));
    AND2 un2_n_filt_out_I_1 (.A(\SUM_IN_B[4]_net_1 ), .B(
        \SUM_IN_A[4]_net_1 ), .Y(
        \un2_n_filt_out.DWACT_ADD_CI_0_TMP[0] ));
    CLKBUF CLK40MHZ_pad (.PAD(CLK40MHZ), .Y(CLK40MHZ_c));
    AX1C \REFCNT_maj_RNI76JC[1]  (.A(\REFCNT[1]_net_1 ), .B(
        \REFCNT[0]_net_1 ), .C(CLK_5M_GL_net_1), .Y(
        \REFCNT_maj_RNI76JC[1]_net_1 ));
    DFN1C0 \FILT_OUT_tmr2[4]  (.D(
        \un2_n_filt_out.DWACT_ADD_CI_0_partial_sum[0] ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \FILT_OUT_tmr2[4]_net_1 ));
    DFN1C0 \FILT_OUT[5]  (.D(I_15), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\FILT_OUT_0[5] ));
    DFN1C0 \FILT_OUT_tmr2[2]  (.D(\SUM_IN_B[2]_net_1 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \FILT_OUT_tmr2[2]_net_1 ));
    DFN1C0 \FILT_OUT[0]  (.D(\SUM_IN_B[0]_net_1 ), .CLK(P_CLK_5M_GL_c), 
        .CLR(P_MASTER_RST_B_c), .Q(\FILT_OUT_0[0] ));
    DFN1C0 MASTER_RST_B (.D(DEL0_DEV_RST_B_net_1), .CLK(CLK40MHZ_c), 
        .CLR(DEV_RST_B_c), .Q(MASTER_RST_B_0));
    DFN1C0 \SUM_IN_B_tmr3[5]  (.D(m16), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\SUM_IN_B_tmr3[5]_net_1 ));
    DFN1C0 \FILT_OUT_tmr2[5]  (.D(I_15), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\FILT_OUT_tmr2[5]_net_1 ));
    DFN1C0 \FILT_IN[0]  (.D(\SIG0_IN[0]_net_1 ), .CLK(P_CLK_5M_GL_c), 
        .CLR(P_MASTER_RST_B_c), .Q(\FILT_IN_0[0] ));
    DFN1C0 \SUM_IN_A_tmr3[4]  (.D(\FILT_IN[0]_net_1 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \SUM_IN_A_tmr3[4]_net_1 ));
    DFN1C0 MASTER_RST_B_tmr2 (.D(DEL0_DEV_RST_B_net_1), .CLK(
        CLK40MHZ_c), .CLR(DEV_RST_B_c), .Q(MASTER_RST_B_tmr2_net_1));
    DFN1C0 \SUM_IN_B_tmr3[3]  (.D(\un1_tmp_sum_in_b_0.N_20 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \SUM_IN_B_tmr3[3]_net_1 ));
    MAJ3 \SUM_IN_B_maj[7]  (.A(\SUM_IN_B_0[7] ), .B(
        \SUM_IN_B_tmr2[7]_net_1 ), .C(\SUM_IN_B_tmr3[7]_net_1 ), .Y(
        \SUM_IN_B[7]_net_1 ));
    DFN1C0 \REFCNT[1]  (.D(SUM1), .CLK(CLK40MHZ_c), .CLR(
        P_MASTER_RST_B_c), .Q(\REFCNT_0[1] ));
    AX1 un1_tmp_sum_in_b_0_m16 (.A(\FILT_OUT[4]_net_1 ), .B(
        \un1_tmp_sum_in_b_0.i7_mux ), .C(\FILT_OUT[5]_net_1 ), .Y(m16));
    DFN1C0 \SIG0_IN[0]  (.D(\SIG_IN_c[0] ), .CLK(P_CLK_5M_GL_c), .CLR(
        P_MASTER_RST_B_c), .Q(\SIG0_IN_0[0] ));
    DFN1C0 \REFCNT_tmr3[1]  (.D(SUM1), .CLK(CLK40MHZ_c), .CLR(
        P_MASTER_RST_B_c), .Q(\REFCNT_tmr3[1]_net_1 ));
    OUTBUF \P_FILT_OUT_pad[0]  (.D(\FILT_OUT[0]_net_1 ), .PAD(
        P_FILT_OUT[0]));
    MAJ3 \SUM_IN_B_maj[5]  (.A(\SUM_IN_B_0[5] ), .B(
        \SUM_IN_B_tmr2[5]_net_1 ), .C(\SUM_IN_B_tmr3[5]_net_1 ), .Y(
        \SUM_IN_B[5]_net_1 ));
    DFN1C0 \FILT_OUT_tmr3[2]  (.D(\SUM_IN_B[2]_net_1 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \FILT_OUT_tmr3[2]_net_1 ));
    DFN1C0 \SUM_IN_B[2]  (.D(\un1_tmp_sum_in_b_0.N_22 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(\SUM_IN_B_0[2] ));
    DFN1C0 DEL0_DEV_RST_B_tmr2 (.D(VCC), .CLK(CLK40MHZ_c), .CLR(
        DEV_RST_B_c), .Q(DEL0_DEV_RST_B_tmr2_net_1));
    MAJ3 \FILT_OUT_maj[1]  (.A(\FILT_OUT_0[1] ), .B(
        \FILT_OUT_tmr2[1]_net_1 ), .C(\FILT_OUT_tmr3[1]_net_1 ), .Y(
        \FILT_OUT[1]_net_1 ));
    MAJ3 \SUM_IN_B_maj[4]  (.A(\SUM_IN_B_0[4] ), .B(
        \SUM_IN_B_tmr2[4]_net_1 ), .C(\SUM_IN_B_tmr3[4]_net_1 ), .Y(
        \SUM_IN_B[4]_net_1 ));
    MAJ3 \SUM_IN_B_maj[3]  (.A(\SUM_IN_B_0[3] ), .B(
        \SUM_IN_B_tmr2[3]_net_1 ), .C(\SUM_IN_B_tmr3[3]_net_1 ), .Y(
        \SUM_IN_B[3]_net_1 ));
    MAJ3 \SUM_IN_B_maj[6]  (.A(\SUM_IN_B_0[6] ), .B(
        \SUM_IN_B_tmr2[6]_net_1 ), .C(\SUM_IN_B_tmr3[6]_net_1 ), .Y(
        \SUM_IN_B[6]_net_1 ));
    MAJ3 \FILT_OUT_maj[2]  (.A(\FILT_OUT_0[2] ), .B(
        \FILT_OUT_tmr2[2]_net_1 ), .C(\FILT_OUT_tmr3[2]_net_1 ), .Y(
        \FILT_OUT[2]_net_1 ));
    AX1 un1_tmp_sum_in_b_0_ADD_8x8_fast_I47_Y (.A(\FILT_OUT[6]_net_1 ), 
        .B(\un1_tmp_sum_in_b_0.N_15 ), .C(\FILT_OUT[7]_net_1 ), .Y(
        ADD_8x8_fast_I47_Y));
    NOR2B un2_n_filt_out_I_20 (.A(
        \un2_n_filt_out.DWACT_ADD_CI_0_TMP[0] ), .B(
        \SUM_IN_B[5]_net_1 ), .Y(
        \un2_n_filt_out.DWACT_ADD_CI_0_g_array_1[0] ));
    XNOR3 un1_tmp_sum_in_b_0_m25 (.A(\FILT_OUT[4]_net_1 ), .B(
        \FILT_OUT[0]_net_1 ), .C(\un1_tmp_sum_in_b.N_2 ), .Y(
        \un1_tmp_sum_in_b_0.N_26 ));
    DFN1C0 \SUM_IN_A_tmr2[4]  (.D(\FILT_IN[0]_net_1 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \SUM_IN_A_tmr2[4]_net_1 ));
    NOR2A un1_tmp_sum_in_b_I_11 (.A(
        \un1_tmp_sum_in_b.U1.DWACT_FINC_E[0] ), .B(\FILT_OUT[3]_net_1 )
        , .Y(\un1_tmp_sum_in_b.N_2 ));
    INBUF DEV_RST_B_pad (.PAD(DEV_RST_B), .Y(DEV_RST_B_c));
    DFN1C0 \SUM_IN_B_tmr3[1]  (.D(\un1_tmp_sum_in_b_0.N_24 ), .CLK(
        P_CLK_5M_GL_c), .CLR(P_MASTER_RST_B_c), .Q(
        \SUM_IN_B_tmr3[1]_net_1 ));
    INV \REFCNT_maj_RNI17L1[0]  (.A(\REFCNT[0]_net_1 ), .Y(
        \REFCNT_i[0] ));
    
endmodule
