// assign in = { in_signal[263], in_signal[262], in_signal[261], in_signal[260], in_signal[259], in_signal[258], in_signal[257], in_signal[256], in_signal[255], in_signal[254], in_signal[253], in_signal[252], in_signal[251], in_signal[250], in_signal[249], in_signal[248], in_signal[247], in_signal[246], in_signal[245], in_signal[244], in_signal[243], in_signal[242], in_signal[241], in_signal[240], in_signal[239], in_signal[238], in_signal[237], in_signal[236], in_signal[235], in_signal[234], in_signal[233], in_signal[232], in_signal[231], in_signal[230], in_signal[229], in_signal[228], in_signal[227], in_signal[226], in_signal[225], in_signal[224], in_signal[223], in_signal[222], in_signal[221], in_signal[220], in_signal[219], in_signal[218], in_signal[217], in_signal[216], in_signal[215], in_signal[214], in_signal[213], in_signal[212], in_signal[211], in_signal[210], in_signal[209], in_signal[208], in_signal[207], in_signal[206], in_signal[205], in_signal[204], in_signal[203], in_signal[202], in_signal[201], in_signal[200] };
// assign  { out_signal[774], out_signal[773], out_signal[772], out_signal[771], out_signal[770], out_signal[769], out_signal[768], out_signal[767], out_signal[766], out_signal[765], out_signal[764], out_signal[763], out_signal[762], out_signal[761], out_signal[760], out_signal[759], out_signal[758], out_signal[757], out_signal[756], out_signal[755], out_signal[754], out_signal[753], out_signal[752], out_signal[751], out_signal[750], out_signal[749], out_signal[748], out_signal[747], out_signal[746], out_signal[745], out_signal[744], out_signal[743], out_signal[742], out_signal[741], out_signal[740], out_signal[739], out_signal[738], out_signal[737], out_signal[736], out_signal[735], out_signal[734], out_signal[733], out_signal[732], out_signal[731], out_signal[730], out_signal[729], out_signal[728], out_signal[727], out_signal[726], out_signal[725], out_signal[724], out_signal[723], out_signal[722], out_signal[721], out_signal[720], out_signal[719], out_signal[718], out_signal[717], out_signal[716], out_signal[715], out_signal[714], out_signal[713], out_signal[712], out_signal[711] } = out;
module CRAFT_step2_ANF #(low_latency = 1, pipeline = 0) (clk, r, in0, in1, out0, out1);
  input clk;
  input [63:0] in0, in1;
  output [63:0] out0, out1;
  input [1023:0] r;


  wire [3:0] g0_0, g0_1;
  GHPC_Gadget_0 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_0_inst(.in0({in0[3],in0[2],in0[1],in0[0]}), .in1({in1[3],in1[2],in1[1],in1[0]}), .r(r[63:0]), .clk(clk), .out0(g0_0), .out1(g0_1));
  wire [3:0] s0_0, s0_1;
  assign s0_0[0] = g0_0[0];
  assign s0_1[0] = g0_1[0];
  assign s0_0[1] = g0_0[1] ^ g0_0[3] ^ g0_0[2];
  assign s0_1[1] = g0_1[1] ^ g0_1[3] ^ g0_1[2];
  assign s0_0[2] = g0_0[3] ^ g0_0[2] ^ g0_0[0];
  assign s0_1[2] = g0_1[3] ^ g0_1[2] ^ g0_1[0];
  assign s0_0[3] = g0_0[3] ^ g0_0[0];
  assign s0_1[3] = g0_1[3] ^ g0_1[0];

  wire [3:0] g1_0, g1_1;
  GHPC_Gadget_1 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_1_inst(.in0({in0[15],in0[14],in0[13],in0[12]}), .in1({in1[15],in1[14],in1[13],in1[12]}), .r(r[127:64]), .clk(clk), .out0(g1_0), .out1(g1_1));
  wire [3:0] s1_0, s1_1;
  assign s1_0[0] = g1_0[0];
  assign s1_1[0] = g1_1[0];
  assign s1_0[1] = g1_0[1] ^ g1_0[3] ^ g1_0[2];
  assign s1_1[1] = g1_1[1] ^ g1_1[3] ^ g1_1[2];
  assign s1_0[2] = g1_0[3] ^ g1_0[2] ^ g1_0[0];
  assign s1_1[2] = g1_1[3] ^ g1_1[2] ^ g1_1[0];
  assign s1_0[3] = g1_0[3] ^ g1_0[0];
  assign s1_1[3] = g1_1[3] ^ g1_1[0];

  wire [3:0] g2_0, g2_1;
  GHPC_Gadget_2 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_2_inst(.in0({in0[11],in0[10],in0[9],in0[8]}), .in1({in1[11],in1[10],in1[9],in1[8]}), .r(r[191:128]), .clk(clk), .out0(g2_0), .out1(g2_1));
  wire [3:0] s2_0, s2_1;
  assign s2_0[0] = g2_0[0];
  assign s2_1[0] = g2_1[0];
  assign s2_0[1] = g2_0[1] ^ g2_0[3] ^ g2_0[2];
  assign s2_1[1] = g2_1[1] ^ g2_1[3] ^ g2_1[2];
  assign s2_0[2] = g2_0[3] ^ g2_0[2] ^ g2_0[0];
  assign s2_1[2] = g2_1[3] ^ g2_1[2] ^ g2_1[0];
  assign s2_0[3] = g2_0[3] ^ g2_0[0];
  assign s2_1[3] = g2_1[3] ^ g2_1[0];

  wire [3:0] g3_0, g3_1;
  GHPC_Gadget_3 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_3_inst(.in0({in0[7],in0[6],in0[5],in0[4]}), .in1({in1[7],in1[6],in1[5],in1[4]}), .r(r[255:192]), .clk(clk), .out0(g3_0), .out1(g3_1));
  wire [3:0] s3_0, s3_1;
  assign s3_0[0] = g3_0[0];
  assign s3_1[0] = g3_1[0];
  assign s3_0[1] = g3_0[1] ^ g3_0[3] ^ g3_0[2];
  assign s3_1[1] = g3_1[1] ^ g3_1[3] ^ g3_1[2];
  assign s3_0[2] = g3_0[3] ^ g3_0[2] ^ g3_0[0];
  assign s3_1[2] = g3_1[3] ^ g3_1[2] ^ g3_1[0];
  assign s3_0[3] = g3_0[3] ^ g3_0[0];
  assign s3_1[3] = g3_1[3] ^ g3_1[0];

  wire [3:0] g4_0, g4_1;
  GHPC_Gadget_4 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_4_inst(.in0({in0[31],in0[30],in0[29],in0[28]}), .in1({in1[31],in1[30],in1[29],in1[28]}), .r(r[319:256]), .clk(clk), .out0(g4_0), .out1(g4_1));
  wire [3:0] s4_0, s4_1;
  assign s4_0[0] = g4_0[0];
  assign s4_1[0] = g4_1[0];
  assign s4_0[1] = g4_0[1] ^ g4_0[3] ^ g4_0[2];
  assign s4_1[1] = g4_1[1] ^ g4_1[3] ^ g4_1[2];
  assign s4_0[2] = g4_0[3] ^ g4_0[2] ^ g4_0[0];
  assign s4_1[2] = g4_1[3] ^ g4_1[2] ^ g4_1[0];
  assign s4_0[3] = g4_0[3] ^ g4_0[0];
  assign s4_1[3] = g4_1[3] ^ g4_1[0];

  wire [3:0] g5_0, g5_1;
  GHPC_Gadget_5 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_5_inst(.in0({in0[19],in0[18],in0[17],in0[16]}), .in1({in1[19],in1[18],in1[17],in1[16]}), .r(r[383:320]), .clk(clk), .out0(g5_0), .out1(g5_1));
  wire [3:0] s5_0, s5_1;
  assign s5_0[0] = g5_0[0];
  assign s5_1[0] = g5_1[0];
  assign s5_0[1] = g5_0[1] ^ g5_0[3] ^ g5_0[2];
  assign s5_1[1] = g5_1[1] ^ g5_1[3] ^ g5_1[2];
  assign s5_0[2] = g5_0[3] ^ g5_0[2] ^ g5_0[0];
  assign s5_1[2] = g5_1[3] ^ g5_1[2] ^ g5_1[0];
  assign s5_0[3] = g5_0[3] ^ g5_0[0];
  assign s5_1[3] = g5_1[3] ^ g5_1[0];

  wire [3:0] g6_0, g6_1;
  GHPC_Gadget_6 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_6_inst(.in0({in0[23],in0[22],in0[21],in0[20]}), .in1({in1[23],in1[22],in1[21],in1[20]}), .r(r[447:384]), .clk(clk), .out0(g6_0), .out1(g6_1));
  wire [3:0] s6_0, s6_1;
  assign s6_0[0] = g6_0[0];
  assign s6_1[0] = g6_1[0];
  assign s6_0[1] = g6_0[1] ^ g6_0[3] ^ g6_0[2];
  assign s6_1[1] = g6_1[1] ^ g6_1[3] ^ g6_1[2];
  assign s6_0[2] = g6_0[3] ^ g6_0[2] ^ g6_0[0];
  assign s6_1[2] = g6_1[3] ^ g6_1[2] ^ g6_1[0];
  assign s6_0[3] = g6_0[3] ^ g6_0[0];
  assign s6_1[3] = g6_1[3] ^ g6_1[0];

  wire [3:0] g7_0, g7_1;
  GHPC_Gadget_7 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_7_inst(.in0({in0[27],in0[26],in0[25],in0[24]}), .in1({in1[27],in1[26],in1[25],in1[24]}), .r(r[511:448]), .clk(clk), .out0(g7_0), .out1(g7_1));
  wire [3:0] s7_0, s7_1;
  assign s7_0[0] = g7_0[0];
  assign s7_1[0] = g7_1[0];
  assign s7_0[1] = g7_0[1] ^ g7_0[3] ^ g7_0[2];
  assign s7_1[1] = g7_1[1] ^ g7_1[3] ^ g7_1[2];
  assign s7_0[2] = g7_0[3] ^ g7_0[2] ^ g7_0[0];
  assign s7_1[2] = g7_1[3] ^ g7_1[2] ^ g7_1[0];
  assign s7_0[3] = g7_0[3] ^ g7_0[0];
  assign s7_1[3] = g7_1[3] ^ g7_1[0];

  wire [3:0] g8_0, g8_1;
  GHPC_Gadget_8 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_8_inst(.in0({in0[47],in0[46],in0[45],in0[44]}), .in1({in1[47],in1[46],in1[45],in1[44]}), .r(r[575:512]), .clk(clk), .out0(g8_0), .out1(g8_1));
  wire [3:0] s8_0, s8_1;
  assign s8_0[0] = g8_0[0];
  assign s8_1[0] = g8_1[0];
  assign s8_0[1] = g8_0[1] ^ g8_0[3] ^ g8_0[2];
  assign s8_1[1] = g8_1[1] ^ g8_1[3] ^ g8_1[2];
  assign s8_0[2] = g8_0[3] ^ g8_0[2] ^ g8_0[0];
  assign s8_1[2] = g8_1[3] ^ g8_1[2] ^ g8_1[0];
  assign s8_0[3] = g8_0[3] ^ g8_0[0];
  assign s8_1[3] = g8_1[3] ^ g8_1[0];

  wire [3:0] g9_0, g9_1;
  GHPC_Gadget_9 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_9_inst(.in0({in0[35],in0[34],in0[33],in0[32]}), .in1({in1[35],in1[34],in1[33],in1[32]}), .r(r[639:576]), .clk(clk), .out0(g9_0), .out1(g9_1));
  wire [3:0] s9_0, s9_1;
  assign s9_0[0] = g9_0[0];
  assign s9_1[0] = g9_1[0];
  assign s9_0[1] = g9_0[1] ^ g9_0[3] ^ g9_0[2];
  assign s9_1[1] = g9_1[1] ^ g9_1[3] ^ g9_1[2];
  assign s9_0[2] = g9_0[3] ^ g9_0[2] ^ g9_0[0];
  assign s9_1[2] = g9_1[3] ^ g9_1[2] ^ g9_1[0];
  assign s9_0[3] = g9_0[3] ^ g9_0[0];
  assign s9_1[3] = g9_1[3] ^ g9_1[0];

  wire [3:0] g10_0, g10_1;
  GHPC_Gadget_10 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_10_inst(.in0({in0[39],in0[38],in0[37],in0[36]}), .in1({in1[39],in1[38],in1[37],in1[36]}), .r(r[703:640]), .clk(clk), .out0(g10_0), .out1(g10_1));
  wire [3:0] s10_0, s10_1;
  assign s10_0[0] = g10_0[0];
  assign s10_1[0] = g10_1[0];
  assign s10_0[1] = g10_0[1] ^ g10_0[3] ^ g10_0[2];
  assign s10_1[1] = g10_1[1] ^ g10_1[3] ^ g10_1[2];
  assign s10_0[2] = g10_0[3] ^ g10_0[2] ^ g10_0[0];
  assign s10_1[2] = g10_1[3] ^ g10_1[2] ^ g10_1[0];
  assign s10_0[3] = g10_0[3] ^ g10_0[0];
  assign s10_1[3] = g10_1[3] ^ g10_1[0];

  wire [3:0] g11_0, g11_1;
  GHPC_Gadget_11 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_11_inst(.in0({in0[43],in0[42],in0[41],in0[40]}), .in1({in1[43],in1[42],in1[41],in1[40]}), .r(r[767:704]), .clk(clk), .out0(g11_0), .out1(g11_1));
  wire [3:0] s11_0, s11_1;
  assign s11_0[0] = g11_0[0];
  assign s11_1[0] = g11_1[0];
  assign s11_0[1] = g11_0[1] ^ g11_0[3] ^ g11_0[2];
  assign s11_1[1] = g11_1[1] ^ g11_1[3] ^ g11_1[2];
  assign s11_0[2] = g11_0[3] ^ g11_0[2] ^ g11_0[0];
  assign s11_1[2] = g11_1[3] ^ g11_1[2] ^ g11_1[0];
  assign s11_0[3] = g11_0[3] ^ g11_0[0];
  assign s11_1[3] = g11_1[3] ^ g11_1[0];

  wire [3:0] g12_0, g12_1;
  GHPC_Gadget_12 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_12_inst(.in0({in0[59],in0[58],in0[57],in0[56]}), .in1({in1[59],in1[58],in1[57],in1[56]}), .r(r[831:768]), .clk(clk), .out0(g12_0), .out1(g12_1));
  wire [3:0] s12_0, s12_1;
  assign s12_0[0] = g12_0[0];
  assign s12_1[0] = g12_1[0];
  assign s12_0[1] = g12_0[1] ^ g12_0[3] ^ g12_0[2];
  assign s12_1[1] = g12_1[1] ^ g12_1[3] ^ g12_1[2];
  assign s12_0[2] = g12_0[3] ^ g12_0[2] ^ g12_0[0];
  assign s12_1[2] = g12_1[3] ^ g12_1[2] ^ g12_1[0];
  assign s12_0[3] = g12_0[3] ^ g12_0[0];
  assign s12_1[3] = g12_1[3] ^ g12_1[0];

  wire [3:0] g13_0, g13_1;
  GHPC_Gadget_13 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_13_inst(.in0({in0[55],in0[54],in0[53],in0[52]}), .in1({in1[55],in1[54],in1[53],in1[52]}), .r(r[895:832]), .clk(clk), .out0(g13_0), .out1(g13_1));
  wire [3:0] s13_0, s13_1;
  assign s13_0[0] = g13_0[0];
  assign s13_1[0] = g13_1[0];
  assign s13_0[1] = g13_0[1] ^ g13_0[3] ^ g13_0[2];
  assign s13_1[1] = g13_1[1] ^ g13_1[3] ^ g13_1[2];
  assign s13_0[2] = g13_0[3] ^ g13_0[2] ^ g13_0[0];
  assign s13_1[2] = g13_1[3] ^ g13_1[2] ^ g13_1[0];
  assign s13_0[3] = g13_0[3] ^ g13_0[0];
  assign s13_1[3] = g13_1[3] ^ g13_1[0];

  wire [3:0] g14_0, g14_1;
  GHPC_Gadget_14 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_14_inst(.in0({in0[51],in0[50],in0[49],in0[48]}), .in1({in1[51],in1[50],in1[49],in1[48]}), .r(r[959:896]), .clk(clk), .out0(g14_0), .out1(g14_1));
  wire [3:0] s14_0, s14_1;
  assign s14_0[0] = g14_0[0];
  assign s14_1[0] = g14_1[0];
  assign s14_0[1] = g14_0[1] ^ g14_0[3] ^ g14_0[2];
  assign s14_1[1] = g14_1[1] ^ g14_1[3] ^ g14_1[2];
  assign s14_0[2] = g14_0[3] ^ g14_0[2] ^ g14_0[0];
  assign s14_1[2] = g14_1[3] ^ g14_1[2] ^ g14_1[0];
  assign s14_0[3] = g14_0[3] ^ g14_0[0];
  assign s14_1[3] = g14_1[3] ^ g14_1[0];

  wire [3:0] g15_0, g15_1;
  GHPC_Gadget_15 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_15_inst(.in0({in0[63],in0[62],in0[61],in0[60]}), .in1({in1[63],in1[62],in1[61],in1[60]}), .r(r[1023:960]), .clk(clk), .out0(g15_0), .out1(g15_1));
  wire [3:0] s15_0, s15_1;
  assign s15_0[0] = g15_0[0];
  assign s15_1[0] = g15_1[0];
  assign s15_0[1] = g15_0[1] ^ g15_0[3] ^ g15_0[2];
  assign s15_1[1] = g15_1[1] ^ g15_1[3] ^ g15_1[2];
  assign s15_0[2] = g15_0[3] ^ g15_0[2] ^ g15_0[0];
  assign s15_1[2] = g15_1[3] ^ g15_1[2] ^ g15_1[0];
  assign s15_0[3] = g15_0[3] ^ g15_0[0];
  assign s15_1[3] = g15_1[3] ^ g15_1[0];

  assign out0[63] = 1'b0 ^ s0_0[1];
  assign out0[62] = 1'b0 ^ s0_0[0];
  assign out0[61] = 1'b1 ^ s0_0[2];
  assign out0[60] = 1'b1 ^ s0_0[3];
  assign out0[59] = 1'b0 ^ s1_0[1];
  assign out0[58] = 1'b0 ^ s1_0[0];
  assign out0[57] = 1'b1 ^ s1_0[2];
  assign out0[56] = 1'b1 ^ s1_0[3];
  assign out0[55] = 1'b0 ^ s2_0[1];
  assign out0[54] = 1'b0 ^ s2_0[0];
  assign out0[53] = 1'b1 ^ s2_0[2];
  assign out0[52] = 1'b1 ^ s2_0[3];
  assign out0[51] = 1'b0 ^ s3_0[1];
  assign out0[50] = 1'b0 ^ s3_0[0];
  assign out0[49] = 1'b1 ^ s3_0[2];
  assign out0[48] = 1'b1 ^ s3_0[3];
  assign out0[47] = 1'b0 ^ s4_0[1];
  assign out0[46] = 1'b0 ^ s4_0[0];
  assign out0[45] = 1'b1 ^ s4_0[2];
  assign out0[44] = 1'b1 ^ s4_0[3];
  assign out0[43] = 1'b0 ^ s5_0[1];
  assign out0[42] = 1'b0 ^ s5_0[0];
  assign out0[41] = 1'b1 ^ s5_0[2];
  assign out0[40] = 1'b1 ^ s5_0[3];
  assign out0[39] = 1'b0 ^ s6_0[1];
  assign out0[38] = 1'b0 ^ s6_0[0];
  assign out0[37] = 1'b1 ^ s6_0[2];
  assign out0[36] = 1'b1 ^ s6_0[3];
  assign out0[35] = 1'b0 ^ s7_0[1];
  assign out0[34] = 1'b0 ^ s7_0[0];
  assign out0[33] = 1'b1 ^ s7_0[2];
  assign out0[32] = 1'b1 ^ s7_0[3];
  assign out0[31] = 1'b0 ^ s8_0[1];
  assign out0[30] = 1'b0 ^ s8_0[0];
  assign out0[29] = 1'b1 ^ s8_0[2];
  assign out0[28] = 1'b1 ^ s8_0[3];
  assign out0[27] = 1'b0 ^ s9_0[1];
  assign out0[26] = 1'b0 ^ s9_0[0];
  assign out0[25] = 1'b1 ^ s9_0[2];
  assign out0[24] = 1'b1 ^ s9_0[3];
  assign out0[23] = 1'b0 ^ s10_0[1];
  assign out0[22] = 1'b0 ^ s10_0[0];
  assign out0[21] = 1'b1 ^ s10_0[2];
  assign out0[20] = 1'b1 ^ s10_0[3];
  assign out0[19] = 1'b0 ^ s11_0[1];
  assign out0[18] = 1'b0 ^ s11_0[0];
  assign out0[17] = 1'b1 ^ s11_0[2];
  assign out0[16] = 1'b1 ^ s11_0[3];
  assign out0[15] = 1'b0 ^ s12_0[1];
  assign out0[14] = 1'b0 ^ s12_0[0];
  assign out0[13] = 1'b1 ^ s12_0[2];
  assign out0[12] = 1'b1 ^ s12_0[3];
  assign out0[11] = 1'b0 ^ s13_0[1];
  assign out0[10] = 1'b0 ^ s13_0[0];
  assign out0[9] = 1'b1 ^ s13_0[2];
  assign out0[8] = 1'b1 ^ s13_0[3];
  assign out0[7] = 1'b0 ^ s14_0[1];
  assign out0[6] = 1'b0 ^ s14_0[0];
  assign out0[5] = 1'b1 ^ s14_0[2];
  assign out0[4] = 1'b1 ^ s14_0[3];
  assign out0[3] = 1'b0 ^ s15_0[1];
  assign out0[2] = 1'b0 ^ s15_0[0];
  assign out0[1] = 1'b1 ^ s15_0[2];
  assign out0[0] = 1'b1 ^ s15_0[3];
  assign out1[63] = 1'b0 ^ s0_1[1];
  assign out1[62] = 1'b0 ^ s0_1[0];
  assign out1[61] = 1'b0 ^ s0_1[2];
  assign out1[60] = 1'b0 ^ s0_1[3];
  assign out1[59] = 1'b0 ^ s1_1[1];
  assign out1[58] = 1'b0 ^ s1_1[0];
  assign out1[57] = 1'b0 ^ s1_1[2];
  assign out1[56] = 1'b0 ^ s1_1[3];
  assign out1[55] = 1'b0 ^ s2_1[1];
  assign out1[54] = 1'b0 ^ s2_1[0];
  assign out1[53] = 1'b0 ^ s2_1[2];
  assign out1[52] = 1'b0 ^ s2_1[3];
  assign out1[51] = 1'b0 ^ s3_1[1];
  assign out1[50] = 1'b0 ^ s3_1[0];
  assign out1[49] = 1'b0 ^ s3_1[2];
  assign out1[48] = 1'b0 ^ s3_1[3];
  assign out1[47] = 1'b0 ^ s4_1[1];
  assign out1[46] = 1'b0 ^ s4_1[0];
  assign out1[45] = 1'b0 ^ s4_1[2];
  assign out1[44] = 1'b0 ^ s4_1[3];
  assign out1[43] = 1'b0 ^ s5_1[1];
  assign out1[42] = 1'b0 ^ s5_1[0];
  assign out1[41] = 1'b0 ^ s5_1[2];
  assign out1[40] = 1'b0 ^ s5_1[3];
  assign out1[39] = 1'b0 ^ s6_1[1];
  assign out1[38] = 1'b0 ^ s6_1[0];
  assign out1[37] = 1'b0 ^ s6_1[2];
  assign out1[36] = 1'b0 ^ s6_1[3];
  assign out1[35] = 1'b0 ^ s7_1[1];
  assign out1[34] = 1'b0 ^ s7_1[0];
  assign out1[33] = 1'b0 ^ s7_1[2];
  assign out1[32] = 1'b0 ^ s7_1[3];
  assign out1[31] = 1'b0 ^ s8_1[1];
  assign out1[30] = 1'b0 ^ s8_1[0];
  assign out1[29] = 1'b0 ^ s8_1[2];
  assign out1[28] = 1'b0 ^ s8_1[3];
  assign out1[27] = 1'b0 ^ s9_1[1];
  assign out1[26] = 1'b0 ^ s9_1[0];
  assign out1[25] = 1'b0 ^ s9_1[2];
  assign out1[24] = 1'b0 ^ s9_1[3];
  assign out1[23] = 1'b0 ^ s10_1[1];
  assign out1[22] = 1'b0 ^ s10_1[0];
  assign out1[21] = 1'b0 ^ s10_1[2];
  assign out1[20] = 1'b0 ^ s10_1[3];
  assign out1[19] = 1'b0 ^ s11_1[1];
  assign out1[18] = 1'b0 ^ s11_1[0];
  assign out1[17] = 1'b0 ^ s11_1[2];
  assign out1[16] = 1'b0 ^ s11_1[3];
  assign out1[15] = 1'b0 ^ s12_1[1];
  assign out1[14] = 1'b0 ^ s12_1[0];
  assign out1[13] = 1'b0 ^ s12_1[2];
  assign out1[12] = 1'b0 ^ s12_1[3];
  assign out1[11] = 1'b0 ^ s13_1[1];
  assign out1[10] = 1'b0 ^ s13_1[0];
  assign out1[9] = 1'b0 ^ s13_1[2];
  assign out1[8] = 1'b0 ^ s13_1[3];
  assign out1[7] = 1'b0 ^ s14_1[1];
  assign out1[6] = 1'b0 ^ s14_1[0];
  assign out1[5] = 1'b0 ^ s14_1[2];
  assign out1[4] = 1'b0 ^ s14_1[3];
  assign out1[3] = 1'b0 ^ s15_1[1];
  assign out1[2] = 1'b0 ^ s15_1[0];
  assign out1[1] = 1'b0 ^ s15_1[2];
  assign out1[0] = 1'b0 ^ s15_1[3];
endmodule
