
module sbox ( SI, clk, SO );
  (* AGEMA = "secure" *) input [3:0] SI;
  (* AGEMA = "clock" *)  input clk;

  output [3:0] SO;
  
  wire   N9, N12, N19, N27, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54;

  DFF_X1 SO_reg_3_ ( .D(N9), .CK(clk), .Q(SO[3]), .QN() );
  DFF_X1 SO_reg_2_ ( .D(N12), .CK(clk), .Q(SO[2]), .QN() );
  DFF_X1 SO_reg_1_ ( .D(N19), .CK(clk), .Q(SO[1]), .QN() );
  DFF_X1 SO_reg_0_ ( .D(N27), .CK(clk), .Q(SO[0]), .QN() );
  INV_X1 U50 ( .A(SI[0]), .ZN(n53) );
  NOR2_X1 U51 ( .A1(SI[1]), .A2(SI[2]), .ZN(n40) );
  XOR2_X1 U52 ( .A(n40), .B(SI[3]), .Z(N12) );
  INV_X1 U53 ( .A(SI[3]), .ZN(n52) );
  NOR2_X1 U54 ( .A1(SI[2]), .A2(n52), .ZN(n41) );
  XNOR2_X1 U55 ( .A(n53), .B(n41), .ZN(n42) );
  MUX2_X1 U56 ( .A(n42), .B(SI[2]), .S(SI[1]), .Z(N19) );
  NOR2_X1 U57 ( .A1(SI[0]), .A2(SI[3]), .ZN(n43) );
  NAND2_X1 U58 ( .A1(n43), .A2(SI[2]), .ZN(n47) );
  INV_X1 U59 ( .A(SI[2]), .ZN(n51) );
  NOR2_X1 U60 ( .A1(n51), .A2(n53), .ZN(n45) );
  NOR2_X1 U61 ( .A1(SI[2]), .A2(SI[0]), .ZN(n48) );
  OR2_X1 U62 ( .A1(SI[3]), .A2(n48), .ZN(n44) );
  NOR2_X1 U63 ( .A1(n45), .A2(n44), .ZN(n46) );
  MUX2_X1 U64 ( .A(n47), .B(n46), .S(SI[1]), .Z(n50) );
  NAND2_X1 U65 ( .A1(SI[3]), .A2(n48), .ZN(n49) );
  NAND2_X1 U66 ( .A1(n50), .A2(n49), .ZN(N27) );
  NAND2_X1 U67 ( .A1(n52), .A2(n51), .ZN(n54) );
  XOR2_X1 U68 ( .A(n54), .B(n53), .Z(N9) );
endmodule

