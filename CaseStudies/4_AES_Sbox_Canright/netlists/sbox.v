
module sbox ( X, clk, Y );
  (* AGEMA = "secure" *) input [7:0] X;
  (* AGEMA = "clock" *)  input clk;

  output [7:0] Y;

  wire   sbe_n10, sbe_n9, sbe_n8, sbe_n7, sbe_n6, sbe_n5, sbe_n4, sbe_n3,
         sbe_n12, sbe_n11, sbe_n2, sbe_n1, sbe_n25, sbe_n24, sbe_n23, sbe_n22,
         sbe_n21, sbe_n20, sbe_n19, sbe_n18, sbe_n17, sbe_n16, sbe_n15,
         sbe_n14, sbe_D_0_, sbe_D_2_, sbe_D_3_, sbe_D_5_, sbe_D_6_, sbe_C_0_,
         sbe_C_1_, sbe_C_2_, sbe_C_3_, sbe_C_4_, sbe_C_5_, sbe_C_6_, sbe_C_7_,
         sbe_Y_0_, sbe_Y_1_, sbe_Y_2_, sbe_Y_4_, sbe_Y_5_, sbe_Y_6_, sbe_B_3_,
         sbe_B_6_, sbe_sel_in_m7_n8, sbe_sel_in_m6_n8, sbe_sel_in_m5_n8,
         sbe_sel_in_m4_n8, sbe_sel_in_m3_n8, sbe_sel_in_m2_n8,
         sbe_sel_in_m1_n8, sbe_sel_in_m0_n8, sbe_inv_n21, sbe_inv_n20,
         sbe_inv_n19, sbe_inv_n18, sbe_inv_n17, sbe_inv_n16, sbe_inv_n15,
         sbe_inv_n14, sbe_inv_n13, sbe_inv_n12, sbe_inv_n11, sbe_inv_n10,
         sbe_inv_n9, sbe_inv_n8, sbe_inv_n7, sbe_inv_n6, sbe_inv_n5,
         sbe_inv_n4, sbe_inv_n3, sbe_inv_n2, sbe_inv_dd, sbe_inv_dh,
         sbe_inv_dl, sbe_inv_sd_0_, sbe_inv_sd_1_, sbe_inv_d_0_, sbe_inv_d_1_,
         sbe_inv_d_2_, sbe_inv_d_3_, sbe_inv_bb, sbe_inv_bh, sbe_inv_bl,
         sbe_inv_aa, sbe_inv_ah, sbe_inv_al, sbe_inv_sb_0_, sbe_inv_sb_1_,
         sbe_inv_sa_0_, sbe_inv_sa_1_, sbe_inv_dinv_n4, sbe_inv_dinv_n3,
         sbe_inv_dinv_n2, sbe_inv_dinv_n1, sbe_inv_dinv_sd, sbe_inv_dinv_d_0_,
         sbe_inv_dinv_d_1_, sbe_inv_dinv_sb, sbe_inv_dinv_sa,
         sbe_inv_dinv_pmul_n9, sbe_inv_dinv_pmul_n8, sbe_inv_dinv_pmul_n7,
         sbe_inv_dinv_qmul_n9, sbe_inv_dinv_qmul_n8, sbe_inv_dinv_qmul_n7,
         sbe_inv_pmul_p_0_, sbe_inv_pmul_p_1_, sbe_inv_pmul_himul_n9,
         sbe_inv_pmul_himul_n8, sbe_inv_pmul_himul_n7, sbe_inv_pmul_lomul_n9,
         sbe_inv_pmul_lomul_n8, sbe_inv_pmul_lomul_n7, sbe_inv_pmul_summul_n9,
         sbe_inv_pmul_summul_n8, sbe_inv_pmul_summul_n7, sbe_inv_qmul_p_0_,
         sbe_inv_qmul_p_1_, sbe_inv_qmul_himul_n9, sbe_inv_qmul_himul_n8,
         sbe_inv_qmul_himul_n7, sbe_inv_qmul_lomul_n9, sbe_inv_qmul_lomul_n8,
         sbe_inv_qmul_lomul_n7, sbe_inv_qmul_summul_n9, sbe_inv_qmul_summul_n8,
         sbe_inv_qmul_summul_n7, sbe_sel_out_m7_n8, sbe_sel_out_m6_n8,
         sbe_sel_out_m5_n8, sbe_sel_out_m4_n8, sbe_sel_out_m3_n8,
         sbe_sel_out_m2_n8, sbe_sel_out_m1_n8, sbe_sel_out_m0_n8;
  wire   [7:0] O;
  wire   [6:3] sbe_X;
  wire   [7:0] sbe_Z;
  wire   [3:0] sbe_inv_c;
  wire   [1:0] sbe_inv_pmul_pl;
  wire   [1:0] sbe_inv_pmul_ph;
  wire   [1:0] sbe_inv_qmul_pl;
  wire   [1:0] sbe_inv_qmul_ph;

  DFF_X1 Y_reg_7_ ( .D(O[7]), .CK(clk), .Q(Y[7]), .QN() );
  DFF_X1 Y_reg_6_ ( .D(O[6]), .CK(clk), .Q(Y[6]), .QN() );
  DFF_X1 Y_reg_5_ ( .D(O[5]), .CK(clk), .Q(Y[5]), .QN() );
  DFF_X1 Y_reg_4_ ( .D(O[4]), .CK(clk), .Q(Y[4]), .QN() );
  DFF_X1 Y_reg_3_ ( .D(O[3]), .CK(clk), .Q(Y[3]), .QN() );
  DFF_X1 Y_reg_2_ ( .D(O[2]), .CK(clk), .Q(Y[2]), .QN() );
  DFF_X1 Y_reg_1_ ( .D(O[1]), .CK(clk), .Q(Y[1]), .QN() );
  DFF_X1 Y_reg_0_ ( .D(O[0]), .CK(clk), .Q(Y[0]), .QN() );
  INV_X1 sbe_U40 ( .A(sbe_C_2_), .ZN(sbe_n1) );
  XOR2_X1 sbe_U39 ( .A(X[1]), .B(sbe_n25), .Z(sbe_n12) );
  XNOR2_X1 sbe_U38 ( .A(X[2]), .B(sbe_Y_4_), .ZN(sbe_n24) );
  XOR2_X1 sbe_U37 ( .A(sbe_Y_2_), .B(sbe_n10), .Z(sbe_n23) );
  XOR2_X1 sbe_U36 ( .A(sbe_n9), .B(sbe_n8), .Z(sbe_n22) );
  XNOR2_X1 sbe_U35 ( .A(X[6]), .B(sbe_n11), .ZN(sbe_n21) );
  XNOR2_X1 sbe_U34 ( .A(sbe_C_7_), .B(sbe_n17), .ZN(sbe_n16) );
  XNOR2_X1 sbe_U33 ( .A(sbe_C_4_), .B(sbe_n18), .ZN(sbe_n17) );
  XNOR2_X1 sbe_U32 ( .A(sbe_C_5_), .B(sbe_C_1_), .ZN(sbe_n18) );
  XNOR2_X1 sbe_U31 ( .A(sbe_C_1_), .B(sbe_C_4_), .ZN(sbe_n15) );
  XNOR2_X1 sbe_U30 ( .A(sbe_C_6_), .B(sbe_C_1_), .ZN(sbe_n14) );
  XNOR2_X1 sbe_U29 ( .A(X[4]), .B(sbe_n10), .ZN(sbe_Y_6_) );
  XOR2_X1 sbe_U28 ( .A(X[6]), .B(X[4]), .Z(sbe_Y_5_) );
  XNOR2_X1 sbe_U27 ( .A(X[3]), .B(sbe_n10), .ZN(sbe_Y_4_) );
  XNOR2_X1 sbe_U26 ( .A(X[1]), .B(sbe_n9), .ZN(sbe_n10) );
  XNOR2_X1 sbe_U25 ( .A(X[2]), .B(sbe_n8), .ZN(sbe_Y_2_) );
  XNOR2_X1 sbe_U24 ( .A(X[5]), .B(X[7]), .ZN(sbe_n8) );
  XOR2_X1 sbe_U23 ( .A(X[4]), .B(sbe_n7), .Z(sbe_Y_1_) );
  XOR2_X1 sbe_U22 ( .A(X[1]), .B(sbe_B_6_), .Z(sbe_Y_0_) );
  XNOR2_X1 sbe_U21 ( .A(sbe_n6), .B(sbe_C_1_), .ZN(sbe_X[6]) );
  XNOR2_X1 sbe_U20 ( .A(sbe_C_2_), .B(sbe_n6), .ZN(sbe_X[5]) );
  XNOR2_X1 sbe_U19 ( .A(sbe_D_5_), .B(sbe_n20), .ZN(sbe_n6) );
  XNOR2_X1 sbe_U18 ( .A(sbe_n5), .B(sbe_D_0_), .ZN(sbe_X[3]) );
  XNOR2_X1 sbe_U17 ( .A(sbe_n20), .B(sbe_n4), .ZN(sbe_D_3_) );
  XNOR2_X1 sbe_U16 ( .A(sbe_C_5_), .B(sbe_D_6_), .ZN(sbe_n20) );
  XOR2_X1 sbe_U15 ( .A(sbe_C_7_), .B(sbe_C_3_), .Z(sbe_D_6_) );
  XNOR2_X1 sbe_U14 ( .A(sbe_D_5_), .B(sbe_n5), .ZN(sbe_D_2_) );
  XNOR2_X1 sbe_U13 ( .A(sbe_C_2_), .B(sbe_n19), .ZN(sbe_n5) );
  XNOR2_X1 sbe_U12 ( .A(sbe_C_5_), .B(sbe_C_3_), .ZN(sbe_n19) );
  XOR2_X1 sbe_U11 ( .A(sbe_C_6_), .B(sbe_C_0_), .Z(sbe_D_5_) );
  XNOR2_X1 sbe_U10 ( .A(sbe_C_1_), .B(sbe_n4), .ZN(sbe_D_0_) );
  XNOR2_X1 sbe_U9 ( .A(sbe_C_6_), .B(sbe_C_4_), .ZN(sbe_n4) );
  XOR2_X1 sbe_U8 ( .A(X[4]), .B(sbe_n25), .Z(sbe_B_6_) );
  XNOR2_X1 sbe_U7 ( .A(X[5]), .B(sbe_n9), .ZN(sbe_n25) );
  XNOR2_X1 sbe_U6 ( .A(X[6]), .B(sbe_n2), .ZN(sbe_n9) );
  XNOR2_X1 sbe_U5 ( .A(sbe_n3), .B(sbe_n11), .ZN(sbe_B_3_) );
  XNOR2_X1 sbe_U4 ( .A(X[1]), .B(sbe_n7), .ZN(sbe_n3) );
  XNOR2_X1 sbe_U3 ( .A(X[3]), .B(sbe_n2), .ZN(sbe_n7) );
  XNOR2_X1 sbe_U2 ( .A(X[4]), .B(X[7]), .ZN(sbe_n11) );
  INV_X1 sbe_U1 ( .A(X[0]), .ZN(sbe_n2) );
  INV_X1 sbe_sel_in_m7_U2 ( .A(sbe_sel_in_m7_n8), .ZN(sbe_Z[7]) );
  MUX2_X1 sbe_sel_in_m7_U1 ( .A(sbe_n11), .B(sbe_n23), .S(1'b1), .Z(
        sbe_sel_in_m7_n8) );
  INV_X1 sbe_sel_in_m6_U2 ( .A(sbe_sel_in_m6_n8), .ZN(sbe_Z[6]) );
  MUX2_X1 sbe_sel_in_m6_U1 ( .A(sbe_Y_6_), .B(sbe_B_6_), .S(1'b1), .Z(
        sbe_sel_in_m6_n8) );
  INV_X1 sbe_sel_in_m5_U2 ( .A(sbe_sel_in_m5_n8), .ZN(sbe_Z[5]) );
  MUX2_X1 sbe_sel_in_m5_U1 ( .A(sbe_Y_5_), .B(sbe_n12), .S(1'b1), .Z(
        sbe_sel_in_m5_n8) );
  INV_X1 sbe_sel_in_m4_U2 ( .A(sbe_sel_in_m4_n8), .ZN(sbe_Z[4]) );
  MUX2_X1 sbe_sel_in_m4_U1 ( .A(sbe_Y_4_), .B(sbe_n22), .S(1'b1), .Z(
        sbe_sel_in_m4_n8) );
  INV_X1 sbe_sel_in_m3_U2 ( .A(sbe_sel_in_m3_n8), .ZN(sbe_Z[3]) );
  MUX2_X1 sbe_sel_in_m3_U1 ( .A(sbe_n21), .B(sbe_B_3_), .S(1'b1), .Z(
        sbe_sel_in_m3_n8) );
  INV_X1 sbe_sel_in_m2_U2 ( .A(sbe_sel_in_m2_n8), .ZN(sbe_Z[2]) );
  MUX2_X1 sbe_sel_in_m2_U1 ( .A(sbe_Y_2_), .B(sbe_n2), .S(1'b1), .Z(
        sbe_sel_in_m2_n8) );
  INV_X1 sbe_sel_in_m1_U2 ( .A(sbe_sel_in_m1_n8), .ZN(sbe_Z[1]) );
  MUX2_X1 sbe_sel_in_m1_U1 ( .A(sbe_Y_1_), .B(sbe_n25), .S(1'b1), .Z(
        sbe_sel_in_m1_n8) );
  INV_X1 sbe_sel_in_m0_U2 ( .A(sbe_sel_in_m0_n8), .ZN(sbe_Z[0]) );
  MUX2_X1 sbe_sel_in_m0_U1 ( .A(sbe_Y_0_), .B(sbe_n24), .S(1'b1), .Z(
        sbe_sel_in_m0_n8) );
  XOR2_X1 sbe_inv_U39 ( .A(sbe_inv_d_0_), .B(sbe_inv_d_1_), .Z(sbe_inv_dl) );
  XOR2_X1 sbe_inv_U38 ( .A(sbe_inv_d_2_), .B(sbe_inv_d_3_), .Z(sbe_inv_dh) );
  XOR2_X1 sbe_inv_U37 ( .A(sbe_inv_sd_0_), .B(sbe_inv_sd_1_), .Z(sbe_inv_dd)
         );
  XOR2_X1 sbe_inv_U36 ( .A(sbe_inv_d_0_), .B(sbe_inv_d_2_), .Z(sbe_inv_sd_0_)
         );
  XOR2_X1 sbe_inv_U35 ( .A(sbe_inv_d_1_), .B(sbe_inv_d_3_), .Z(sbe_inv_sd_1_)
         );
  XNOR2_X1 sbe_inv_U34 ( .A(sbe_inv_n21), .B(sbe_inv_n20), .ZN(sbe_inv_c[3])
         );
  XOR2_X1 sbe_inv_U33 ( .A(sbe_inv_n19), .B(sbe_inv_n18), .Z(sbe_inv_n20) );
  NAND2_X1 sbe_inv_U32 ( .A1(sbe_Z[7]), .A2(sbe_Z[3]), .ZN(sbe_inv_n18) );
  NOR2_X1 sbe_inv_U31 ( .A1(sbe_inv_sa_0_), .A2(sbe_inv_sb_0_), .ZN(
        sbe_inv_n19) );
  XNOR2_X1 sbe_inv_U30 ( .A(sbe_inv_n17), .B(sbe_inv_n16), .ZN(sbe_inv_n21) );
  XNOR2_X1 sbe_inv_U29 ( .A(sbe_inv_n15), .B(sbe_inv_n14), .ZN(sbe_inv_c[2])
         );
  XOR2_X1 sbe_inv_U28 ( .A(sbe_inv_n13), .B(sbe_inv_n12), .Z(sbe_inv_n14) );
  NAND2_X1 sbe_inv_U27 ( .A1(sbe_Z[6]), .A2(sbe_Z[2]), .ZN(sbe_inv_n12) );
  NOR2_X1 sbe_inv_U26 ( .A1(sbe_inv_sa_1_), .A2(sbe_inv_sb_1_), .ZN(
        sbe_inv_n13) );
  XNOR2_X1 sbe_inv_U25 ( .A(sbe_inv_n11), .B(sbe_inv_n16), .ZN(sbe_inv_n15) );
  NAND2_X1 sbe_inv_U24 ( .A1(sbe_inv_ah), .A2(sbe_inv_bh), .ZN(sbe_inv_n16) );
  XNOR2_X1 sbe_inv_U23 ( .A(sbe_inv_n10), .B(sbe_inv_n9), .ZN(sbe_inv_c[1]) );
  XOR2_X1 sbe_inv_U22 ( .A(sbe_inv_n8), .B(sbe_inv_n7), .Z(sbe_inv_n9) );
  NAND2_X1 sbe_inv_U21 ( .A1(sbe_Z[1]), .A2(sbe_Z[5]), .ZN(sbe_inv_n7) );
  NOR2_X1 sbe_inv_U20 ( .A1(sbe_inv_al), .A2(sbe_inv_bl), .ZN(sbe_inv_n8) );
  XNOR2_X1 sbe_inv_U19 ( .A(sbe_inv_n17), .B(sbe_inv_n11), .ZN(sbe_inv_n10) );
  NAND2_X1 sbe_inv_U18 ( .A1(sbe_inv_aa), .A2(sbe_inv_bb), .ZN(sbe_inv_n17) );
  XNOR2_X1 sbe_inv_U17 ( .A(sbe_inv_n11), .B(sbe_inv_n6), .ZN(sbe_inv_c[0]) );
  XNOR2_X1 sbe_inv_U16 ( .A(sbe_inv_n5), .B(sbe_inv_n4), .ZN(sbe_inv_n6) );
  XOR2_X1 sbe_inv_U15 ( .A(sbe_inv_n3), .B(sbe_inv_n2), .Z(sbe_inv_n4) );
  NAND2_X1 sbe_inv_U14 ( .A1(sbe_inv_al), .A2(sbe_inv_bl), .ZN(sbe_inv_n2) );
  NOR2_X1 sbe_inv_U13 ( .A1(sbe_Z[4]), .A2(sbe_Z[0]), .ZN(sbe_inv_n3) );
  NAND2_X1 sbe_inv_U12 ( .A1(sbe_inv_sb_1_), .A2(sbe_inv_sa_1_), .ZN(
        sbe_inv_n5) );
  NAND2_X1 sbe_inv_U11 ( .A1(sbe_inv_sa_0_), .A2(sbe_inv_sb_0_), .ZN(
        sbe_inv_n11) );
  XOR2_X1 sbe_inv_U10 ( .A(sbe_Z[0]), .B(sbe_Z[1]), .Z(sbe_inv_bl) );
  XOR2_X1 sbe_inv_U9 ( .A(sbe_Z[2]), .B(sbe_Z[3]), .Z(sbe_inv_bh) );
  XOR2_X1 sbe_inv_U8 ( .A(sbe_inv_sb_0_), .B(sbe_inv_sb_1_), .Z(sbe_inv_bb) );
  XOR2_X1 sbe_inv_U7 ( .A(sbe_Z[0]), .B(sbe_Z[2]), .Z(sbe_inv_sb_0_) );
  XOR2_X1 sbe_inv_U6 ( .A(sbe_Z[3]), .B(sbe_Z[1]), .Z(sbe_inv_sb_1_) );
  XOR2_X1 sbe_inv_U5 ( .A(sbe_Z[4]), .B(sbe_Z[5]), .Z(sbe_inv_al) );
  XOR2_X1 sbe_inv_U4 ( .A(sbe_Z[6]), .B(sbe_Z[7]), .Z(sbe_inv_ah) );
  XOR2_X1 sbe_inv_U3 ( .A(sbe_inv_sa_0_), .B(sbe_inv_sa_1_), .Z(sbe_inv_aa) );
  XOR2_X1 sbe_inv_U2 ( .A(sbe_Z[4]), .B(sbe_Z[6]), .Z(sbe_inv_sa_0_) );
  XOR2_X1 sbe_inv_U1 ( .A(sbe_Z[7]), .B(sbe_Z[5]), .Z(sbe_inv_sa_1_) );
  XOR2_X1 sbe_inv_dinv_U9 ( .A(sbe_inv_dinv_d_0_), .B(sbe_inv_dinv_d_1_), .Z(
        sbe_inv_dinv_sd) );
  XOR2_X1 sbe_inv_dinv_U8 ( .A(sbe_inv_dinv_n4), .B(sbe_inv_dinv_n3), .Z(
        sbe_inv_dinv_d_0_) );
  NAND2_X1 sbe_inv_dinv_U7 ( .A1(sbe_inv_dinv_sb), .A2(sbe_inv_dinv_sa), .ZN(
        sbe_inv_dinv_n3) );
  NOR2_X1 sbe_inv_dinv_U6 ( .A1(sbe_inv_c[1]), .A2(sbe_inv_c[3]), .ZN(
        sbe_inv_dinv_n4) );
  XOR2_X1 sbe_inv_dinv_U5 ( .A(sbe_inv_dinv_n2), .B(sbe_inv_dinv_n1), .Z(
        sbe_inv_dinv_d_1_) );
  NAND2_X1 sbe_inv_dinv_U4 ( .A1(sbe_inv_c[0]), .A2(sbe_inv_c[2]), .ZN(
        sbe_inv_dinv_n1) );
  NOR2_X1 sbe_inv_dinv_U3 ( .A1(sbe_inv_dinv_sb), .A2(sbe_inv_dinv_sa), .ZN(
        sbe_inv_dinv_n2) );
  XOR2_X1 sbe_inv_dinv_U2 ( .A(sbe_inv_c[2]), .B(sbe_inv_c[3]), .Z(
        sbe_inv_dinv_sa) );
  XOR2_X1 sbe_inv_dinv_U1 ( .A(sbe_inv_c[0]), .B(sbe_inv_c[1]), .Z(
        sbe_inv_dinv_sb) );
  XOR2_X1 sbe_inv_dinv_pmul_U5 ( .A(sbe_inv_dinv_pmul_n9), .B(
        sbe_inv_dinv_pmul_n8), .Z(sbe_inv_d_3_) );
  NAND2_X1 sbe_inv_dinv_pmul_U4 ( .A1(sbe_inv_dinv_d_1_), .A2(sbe_inv_c[1]), 
        .ZN(sbe_inv_dinv_pmul_n8) );
  XOR2_X1 sbe_inv_dinv_pmul_U3 ( .A(sbe_inv_dinv_pmul_n9), .B(
        sbe_inv_dinv_pmul_n7), .Z(sbe_inv_d_2_) );
  NAND2_X1 sbe_inv_dinv_pmul_U2 ( .A1(sbe_inv_dinv_d_0_), .A2(sbe_inv_c[0]), 
        .ZN(sbe_inv_dinv_pmul_n7) );
  NAND2_X1 sbe_inv_dinv_pmul_U1 ( .A1(sbe_inv_dinv_sd), .A2(sbe_inv_dinv_sb), 
        .ZN(sbe_inv_dinv_pmul_n9) );
  XOR2_X1 sbe_inv_dinv_qmul_U5 ( .A(sbe_inv_dinv_qmul_n9), .B(
        sbe_inv_dinv_qmul_n8), .Z(sbe_inv_d_1_) );
  NAND2_X1 sbe_inv_dinv_qmul_U4 ( .A1(sbe_inv_dinv_d_1_), .A2(sbe_inv_c[3]), 
        .ZN(sbe_inv_dinv_qmul_n8) );
  XOR2_X1 sbe_inv_dinv_qmul_U3 ( .A(sbe_inv_dinv_qmul_n9), .B(
        sbe_inv_dinv_qmul_n7), .Z(sbe_inv_d_0_) );
  NAND2_X1 sbe_inv_dinv_qmul_U2 ( .A1(sbe_inv_dinv_d_0_), .A2(sbe_inv_c[2]), 
        .ZN(sbe_inv_dinv_qmul_n7) );
  NAND2_X1 sbe_inv_dinv_qmul_U1 ( .A1(sbe_inv_dinv_sd), .A2(sbe_inv_dinv_sa), 
        .ZN(sbe_inv_dinv_qmul_n9) );
  XOR2_X1 sbe_inv_pmul_U4 ( .A(sbe_inv_pmul_p_1_), .B(sbe_inv_pmul_ph[1]), .Z(
        sbe_C_7_) );
  XOR2_X1 sbe_inv_pmul_U3 ( .A(sbe_inv_pmul_p_0_), .B(sbe_inv_pmul_ph[0]), .Z(
        sbe_C_6_) );
  XOR2_X1 sbe_inv_pmul_U2 ( .A(sbe_inv_pmul_p_1_), .B(sbe_inv_pmul_pl[1]), .Z(
        sbe_C_5_) );
  XOR2_X1 sbe_inv_pmul_U1 ( .A(sbe_inv_pmul_p_0_), .B(sbe_inv_pmul_pl[0]), .Z(
        sbe_C_4_) );
  XOR2_X1 sbe_inv_pmul_himul_U5 ( .A(sbe_inv_pmul_himul_n9), .B(
        sbe_inv_pmul_himul_n8), .Z(sbe_inv_pmul_ph[1]) );
  NAND2_X1 sbe_inv_pmul_himul_U4 ( .A1(sbe_inv_d_3_), .A2(sbe_Z[3]), .ZN(
        sbe_inv_pmul_himul_n8) );
  XOR2_X1 sbe_inv_pmul_himul_U3 ( .A(sbe_inv_pmul_himul_n9), .B(
        sbe_inv_pmul_himul_n7), .Z(sbe_inv_pmul_ph[0]) );
  NAND2_X1 sbe_inv_pmul_himul_U2 ( .A1(sbe_inv_d_2_), .A2(sbe_Z[2]), .ZN(
        sbe_inv_pmul_himul_n7) );
  NAND2_X1 sbe_inv_pmul_himul_U1 ( .A1(sbe_inv_dh), .A2(sbe_inv_bh), .ZN(
        sbe_inv_pmul_himul_n9) );
  XOR2_X1 sbe_inv_pmul_lomul_U5 ( .A(sbe_inv_pmul_lomul_n9), .B(
        sbe_inv_pmul_lomul_n8), .Z(sbe_inv_pmul_pl[1]) );
  NAND2_X1 sbe_inv_pmul_lomul_U4 ( .A1(sbe_inv_d_1_), .A2(sbe_Z[1]), .ZN(
        sbe_inv_pmul_lomul_n8) );
  XOR2_X1 sbe_inv_pmul_lomul_U3 ( .A(sbe_inv_pmul_lomul_n9), .B(
        sbe_inv_pmul_lomul_n7), .Z(sbe_inv_pmul_pl[0]) );
  NAND2_X1 sbe_inv_pmul_lomul_U2 ( .A1(sbe_inv_d_0_), .A2(sbe_Z[0]), .ZN(
        sbe_inv_pmul_lomul_n7) );
  NAND2_X1 sbe_inv_pmul_lomul_U1 ( .A1(sbe_inv_dl), .A2(sbe_inv_bl), .ZN(
        sbe_inv_pmul_lomul_n9) );
  XOR2_X1 sbe_inv_pmul_summul_U5 ( .A(sbe_inv_pmul_summul_n9), .B(
        sbe_inv_pmul_summul_n8), .Z(sbe_inv_pmul_p_1_) );
  NAND2_X1 sbe_inv_pmul_summul_U4 ( .A1(sbe_inv_dd), .A2(sbe_inv_bb), .ZN(
        sbe_inv_pmul_summul_n8) );
  XOR2_X1 sbe_inv_pmul_summul_U3 ( .A(sbe_inv_pmul_summul_n9), .B(
        sbe_inv_pmul_summul_n7), .Z(sbe_inv_pmul_p_0_) );
  NAND2_X1 sbe_inv_pmul_summul_U2 ( .A1(sbe_inv_sd_1_), .A2(sbe_inv_sb_1_), 
        .ZN(sbe_inv_pmul_summul_n7) );
  NAND2_X1 sbe_inv_pmul_summul_U1 ( .A1(sbe_inv_sd_0_), .A2(sbe_inv_sb_0_), 
        .ZN(sbe_inv_pmul_summul_n9) );
  XOR2_X1 sbe_inv_qmul_U4 ( .A(sbe_inv_qmul_p_1_), .B(sbe_inv_qmul_ph[1]), .Z(
        sbe_C_3_) );
  XOR2_X1 sbe_inv_qmul_U3 ( .A(sbe_inv_qmul_p_0_), .B(sbe_inv_qmul_ph[0]), .Z(
        sbe_C_2_) );
  XOR2_X1 sbe_inv_qmul_U2 ( .A(sbe_inv_qmul_p_1_), .B(sbe_inv_qmul_pl[1]), .Z(
        sbe_C_1_) );
  XOR2_X1 sbe_inv_qmul_U1 ( .A(sbe_inv_qmul_p_0_), .B(sbe_inv_qmul_pl[0]), .Z(
        sbe_C_0_) );
  XOR2_X1 sbe_inv_qmul_himul_U5 ( .A(sbe_inv_qmul_himul_n9), .B(
        sbe_inv_qmul_himul_n8), .Z(sbe_inv_qmul_ph[1]) );
  NAND2_X1 sbe_inv_qmul_himul_U4 ( .A1(sbe_inv_d_3_), .A2(sbe_Z[7]), .ZN(
        sbe_inv_qmul_himul_n8) );
  XOR2_X1 sbe_inv_qmul_himul_U3 ( .A(sbe_inv_qmul_himul_n9), .B(
        sbe_inv_qmul_himul_n7), .Z(sbe_inv_qmul_ph[0]) );
  NAND2_X1 sbe_inv_qmul_himul_U2 ( .A1(sbe_inv_d_2_), .A2(sbe_Z[6]), .ZN(
        sbe_inv_qmul_himul_n7) );
  NAND2_X1 sbe_inv_qmul_himul_U1 ( .A1(sbe_inv_dh), .A2(sbe_inv_ah), .ZN(
        sbe_inv_qmul_himul_n9) );
  XOR2_X1 sbe_inv_qmul_lomul_U5 ( .A(sbe_inv_qmul_lomul_n9), .B(
        sbe_inv_qmul_lomul_n8), .Z(sbe_inv_qmul_pl[1]) );
  NAND2_X1 sbe_inv_qmul_lomul_U4 ( .A1(sbe_inv_d_1_), .A2(sbe_Z[5]), .ZN(
        sbe_inv_qmul_lomul_n8) );
  XOR2_X1 sbe_inv_qmul_lomul_U3 ( .A(sbe_inv_qmul_lomul_n9), .B(
        sbe_inv_qmul_lomul_n7), .Z(sbe_inv_qmul_pl[0]) );
  NAND2_X1 sbe_inv_qmul_lomul_U2 ( .A1(sbe_inv_d_0_), .A2(sbe_Z[4]), .ZN(
        sbe_inv_qmul_lomul_n7) );
  NAND2_X1 sbe_inv_qmul_lomul_U1 ( .A1(sbe_inv_dl), .A2(sbe_inv_al), .ZN(
        sbe_inv_qmul_lomul_n9) );
  XOR2_X1 sbe_inv_qmul_summul_U5 ( .A(sbe_inv_qmul_summul_n9), .B(
        sbe_inv_qmul_summul_n8), .Z(sbe_inv_qmul_p_1_) );
  NAND2_X1 sbe_inv_qmul_summul_U4 ( .A1(sbe_inv_dd), .A2(sbe_inv_aa), .ZN(
        sbe_inv_qmul_summul_n8) );
  XOR2_X1 sbe_inv_qmul_summul_U3 ( .A(sbe_inv_qmul_summul_n9), .B(
        sbe_inv_qmul_summul_n7), .Z(sbe_inv_qmul_p_0_) );
  NAND2_X1 sbe_inv_qmul_summul_U2 ( .A1(sbe_inv_sd_1_), .A2(sbe_inv_sa_1_), 
        .ZN(sbe_inv_qmul_summul_n7) );
  NAND2_X1 sbe_inv_qmul_summul_U1 ( .A1(sbe_inv_sd_0_), .A2(sbe_inv_sa_0_), 
        .ZN(sbe_inv_qmul_summul_n9) );
  INV_X1 sbe_sel_out_m7_U2 ( .A(sbe_sel_out_m7_n8), .ZN(O[7]) );
  MUX2_X1 sbe_sel_out_m7_U1 ( .A(sbe_n15), .B(sbe_n19), .S(1'b1), .Z(
        sbe_sel_out_m7_n8) );
  INV_X1 sbe_sel_out_m6_U2 ( .A(sbe_sel_out_m6_n8), .ZN(O[6]) );
  MUX2_X1 sbe_sel_out_m6_U1 ( .A(sbe_X[6]), .B(sbe_D_6_), .S(1'b1), .Z(
        sbe_sel_out_m6_n8) );
  INV_X1 sbe_sel_out_m5_U2 ( .A(sbe_sel_out_m5_n8), .ZN(O[5]) );
  MUX2_X1 sbe_sel_out_m5_U1 ( .A(sbe_X[5]), .B(sbe_D_5_), .S(1'b1), .Z(
        sbe_sel_out_m5_n8) );
  INV_X1 sbe_sel_out_m4_U2 ( .A(sbe_sel_out_m4_n8), .ZN(O[4]) );
  MUX2_X1 sbe_sel_out_m4_U1 ( .A(sbe_n14), .B(sbe_n20), .S(1'b1), .Z(
        sbe_sel_out_m4_n8) );
  INV_X1 sbe_sel_out_m3_U2 ( .A(sbe_sel_out_m3_n8), .ZN(O[3]) );
  MUX2_X1 sbe_sel_out_m3_U1 ( .A(sbe_X[3]), .B(sbe_D_3_), .S(1'b1), .Z(
        sbe_sel_out_m3_n8) );
  INV_X1 sbe_sel_out_m2_U2 ( .A(sbe_sel_out_m2_n8), .ZN(O[2]) );
  MUX2_X1 sbe_sel_out_m2_U1 ( .A(sbe_n16), .B(sbe_D_2_), .S(1'b1), .Z(
        sbe_sel_out_m2_n8) );
  INV_X1 sbe_sel_out_m1_U2 ( .A(sbe_sel_out_m1_n8), .ZN(O[1]) );
  MUX2_X1 sbe_sel_out_m1_U1 ( .A(sbe_n18), .B(sbe_n17), .S(1'b1), .Z(
        sbe_sel_out_m1_n8) );
  INV_X1 sbe_sel_out_m0_U2 ( .A(sbe_sel_out_m0_n8), .ZN(O[0]) );
  MUX2_X1 sbe_sel_out_m0_U1 ( .A(sbe_n1), .B(sbe_D_0_), .S(1'b1), .Z(
        sbe_sel_out_m0_n8) );
endmodule

