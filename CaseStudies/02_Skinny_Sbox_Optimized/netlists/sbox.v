
module sbox ( X, clk, Y );
  (* AGEMA = "secure" *) input [3:0] X;
  (* AGEMA = "clock" *)  input clk;

  output [3:0] Y;
  
  wire   Q0, Q1, T0, Q2, T1, Q4, T2, L0, Q6, L1, Q7, T3, L2, L2_T1, L3, n2;
  wire   [2:1] XX;
  wire   [3:0] YY;

  DFF_X1 Y_reg_3_ ( .D(YY[1]), .CK(clk), .Q(Y[3]), .QN() );
  DFF_X1 Y_reg_2_ ( .D(YY[0]), .CK(clk), .Q(Y[2]), .QN() );
  DFF_X1 Y_reg_1_ ( .D(YY[3]), .CK(clk), .Q(Y[1]), .QN() );
  DFF_X1 Y_reg_0_ ( .D(YY[2]), .CK(clk), .Q(Y[0]), .QN() );
  INV_X1 U5 ( .A(X[2]), .ZN(n2) );
  XOR2_X1 XOR_i1_U1 ( .A(X[2]), .B(X[3]), .Z(XX[1]) );
  XOR2_X1 XOR_i2_U1 ( .A(X[0]), .B(X[2]), .Z(XX[2]) );
  XOR2_X1 XOR0_U1 ( .A(X[1]), .B(XX[2]), .Z(Q0) );
  XOR2_X1 XOR1_U1 ( .A(X[1]), .B(XX[1]), .Z(Q1) );
  AND2_X1 AND1_U1 ( .A1(n2), .A2(Q1), .ZN(T0) );
  XOR2_X1 XOR2_U1 ( .A(Q0), .B(T0), .Z(Q2) );
  AND2_X1 AND2_U1 ( .A1(X[1]), .A2(Q2), .ZN(T1) );
  XNOR2_X1 XOR3_U1 ( .A(X[1]), .B(n2), .ZN(Q4) );
  AND2_X1 AND3_U1 ( .A1(n2), .A2(Q4), .ZN(T2) );
  XOR2_X1 XOR4_U1 ( .A(T1), .B(T2), .Z(L0) );
  XOR2_X1 XOR5_U1 ( .A(XX[2]), .B(n2), .Z(Q6) );
  XNOR2_X1 XOR6_U1 ( .A(Q1), .B(Q6), .ZN(L1) );
  XOR2_X1 XOR7_U1 ( .A(L1), .B(T2), .Z(Q7) );
  AND2_X1 AND4_U1 ( .A1(Q6), .A2(Q7), .ZN(T3) );
  XOR2_X1 XOR8_U1 ( .A(X[1]), .B(n2), .Z(L2) );
  XOR2_X1 XOR81_U1 ( .A(L2), .B(T1), .Z(L2_T1) );
  XNOR2_X1 XOR9_U1 ( .A(L2_T1), .B(L3), .ZN(YY[3]) );
  XOR2_X1 XOR10_U1 ( .A(L0), .B(T3), .Z(YY[2]) );
  XOR2_X1 XOR11_U1 ( .A(XX[2]), .B(T0), .Z(L3) );
  XNOR2_X1 XOR12_U1 ( .A(L3), .B(T2), .ZN(YY[1]) );
  XNOR2_X1 XOR13_U1 ( .A(XX[1]), .B(T2), .ZN(YY[0]) );
endmodule

