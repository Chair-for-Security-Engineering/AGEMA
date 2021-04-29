// assign in = { in_signal[1375], in_signal[1374], in_signal[1373], in_signal[1372], in_signal[1371], in_signal[1370], in_signal[1369], in_signal[1368], in_signal[1367], in_signal[1366], in_signal[1365], in_signal[1364], in_signal[1363], in_signal[1362], in_signal[1361], in_signal[1360], in_signal[1359], in_signal[1358], in_signal[1357], in_signal[1356], in_signal[1355], in_signal[1354], in_signal[1353], in_signal[1352], in_signal[1351], in_signal[1350], in_signal[1349], in_signal[1348], in_signal[1347], in_signal[1346], in_signal[1345], in_signal[1344], in_signal[1343], in_signal[1342], in_signal[1341], in_signal[1340], in_signal[1339], in_signal[1338], in_signal[1337], in_signal[1336], in_signal[1335], in_signal[1334], in_signal[1333], in_signal[1332], in_signal[1331], in_signal[1330], in_signal[1329], in_signal[1328], in_signal[1327], in_signal[1326], in_signal[1325], in_signal[1324], in_signal[1323], in_signal[1322], in_signal[1321], in_signal[1320], in_signal[1319], in_signal[1318], in_signal[1317], in_signal[1316], in_signal[1315], in_signal[1314], in_signal[1313], in_signal[1312] };
// assign  { out_signal[1311], out_signal[1310], out_signal[1309], out_signal[1308], out_signal[1307], out_signal[1306], out_signal[1305], out_signal[1304], out_signal[1303], out_signal[1302], out_signal[1301], out_signal[1300], out_signal[1299], out_signal[1298], out_signal[1297], out_signal[1296], out_signal[1295], out_signal[1294], out_signal[1293], out_signal[1292], out_signal[1291], out_signal[1290], out_signal[1289], out_signal[1288], out_signal[1287], out_signal[1286], out_signal[1285], out_signal[1284], out_signal[1283], out_signal[1282], out_signal[1281], out_signal[1280], out_signal[1279], out_signal[1278], out_signal[1277], out_signal[1276], out_signal[1275], out_signal[1274], out_signal[1273], out_signal[1272], out_signal[1271], out_signal[1270], out_signal[1269], out_signal[1268], out_signal[1267], out_signal[1266], out_signal[1265], out_signal[1264], out_signal[1263], out_signal[1262], out_signal[1261], out_signal[1260], out_signal[1259], out_signal[1258], out_signal[1257], out_signal[1256], out_signal[1255], out_signal[1254], out_signal[1253], out_signal[1252], out_signal[1251], out_signal[1250], out_signal[1249], out_signal[1248] } = out;
module Midori64_step2_ANF #(low_latency = 0, pipeline = 0) (clk, r, in0, in1, out0, out1);
  input clk;
  input [63:0] in0, in1;
  output [63:0] out0, out1;
  input [63:0] r;


  wire [3:0] g0_0, g0_1;
  GHPC_Gadget_0 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_0_inst(.in0({in0[52],in0[53],in0[54],in0[55]}), .in1({in1[52],in1[53],in1[54],in1[55]}), .r(r[3:0]), .clk(clk), .out0(g0_0), .out1(g0_1));
  wire [3:0] s0_0, s0_1;
  assign s0_0[0] = g0_0[2] ^ g0_0[1];
  assign s0_1[0] = g0_1[2] ^ g0_1[1];
  assign s0_0[1] = g0_0[0] ^ g0_0[2] ^ g0_0[3] ^ g0_0[1];
  assign s0_1[1] = g0_1[0] ^ g0_1[2] ^ g0_1[3] ^ g0_1[1];
  assign s0_0[2] = g0_0[1];
  assign s0_1[2] = g0_1[1];
  assign s0_0[3] = g0_0[3];
  assign s0_1[3] = g0_1[3];

  wire [3:0] g1_0, g1_1;
  GHPC_Gadget_1 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_1_inst(.in0({in0[56],in0[57],in0[58],in0[59]}), .in1({in1[56],in1[57],in1[58],in1[59]}), .r(r[7:4]), .clk(clk), .out0(g1_0), .out1(g1_1));
  wire [3:0] s1_0, s1_1;
  assign s1_0[0] = g1_0[2] ^ g1_0[1];
  assign s1_1[0] = g1_1[2] ^ g1_1[1];
  assign s1_0[1] = g1_0[0] ^ g1_0[2] ^ g1_0[3] ^ g1_0[1];
  assign s1_1[1] = g1_1[0] ^ g1_1[2] ^ g1_1[3] ^ g1_1[1];
  assign s1_0[2] = g1_0[1];
  assign s1_1[2] = g1_1[1];
  assign s1_0[3] = g1_0[3];
  assign s1_1[3] = g1_1[3];

  wire [3:0] g2_0, g2_1;
  GHPC_Gadget_2 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_2_inst(.in0({in0[0],in0[1],in0[2],in0[3]}), .in1({in1[0],in1[1],in1[2],in1[3]}), .r(r[11:8]), .clk(clk), .out0(g2_0), .out1(g2_1));
  wire [3:0] s2_0, s2_1;
  assign s2_0[0] = g2_0[2] ^ g2_0[1];
  assign s2_1[0] = g2_1[2] ^ g2_1[1];
  assign s2_0[1] = g2_0[0] ^ g2_0[2] ^ g2_0[3] ^ g2_0[1];
  assign s2_1[1] = g2_1[0] ^ g2_1[2] ^ g2_1[3] ^ g2_1[1];
  assign s2_0[2] = g2_0[1];
  assign s2_1[2] = g2_1[1];
  assign s2_0[3] = g2_0[3];
  assign s2_1[3] = g2_1[3];

  wire [3:0] g3_0, g3_1;
  GHPC_Gadget_3 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_3_inst(.in0({in0[4],in0[5],in0[6],in0[7]}), .in1({in1[4],in1[5],in1[6],in1[7]}), .r(r[15:12]), .clk(clk), .out0(g3_0), .out1(g3_1));
  wire [3:0] s3_0, s3_1;
  assign s3_0[0] = g3_0[2] ^ g3_0[1];
  assign s3_1[0] = g3_1[2] ^ g3_1[1];
  assign s3_0[1] = g3_0[0] ^ g3_0[2] ^ g3_0[3] ^ g3_0[1];
  assign s3_1[1] = g3_1[0] ^ g3_1[2] ^ g3_1[3] ^ g3_1[1];
  assign s3_0[2] = g3_0[1];
  assign s3_1[2] = g3_1[1];
  assign s3_0[3] = g3_0[3];
  assign s3_1[3] = g3_1[3];

  wire [3:0] g4_0, g4_1;
  GHPC_Gadget_4 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_4_inst(.in0({in0[8],in0[9],in0[10],in0[11]}), .in1({in1[8],in1[9],in1[10],in1[11]}), .r(r[19:16]), .clk(clk), .out0(g4_0), .out1(g4_1));
  wire [3:0] s4_0, s4_1;
  assign s4_0[0] = g4_0[2] ^ g4_0[1];
  assign s4_1[0] = g4_1[2] ^ g4_1[1];
  assign s4_0[1] = g4_0[0] ^ g4_0[2] ^ g4_0[3] ^ g4_0[1];
  assign s4_1[1] = g4_1[0] ^ g4_1[2] ^ g4_1[3] ^ g4_1[1];
  assign s4_0[2] = g4_0[1];
  assign s4_1[2] = g4_1[1];
  assign s4_0[3] = g4_0[3];
  assign s4_1[3] = g4_1[3];

  wire [3:0] g5_0, g5_1;
  GHPC_Gadget_5 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_5_inst(.in0({in0[12],in0[13],in0[14],in0[15]}), .in1({in1[12],in1[13],in1[14],in1[15]}), .r(r[23:20]), .clk(clk), .out0(g5_0), .out1(g5_1));
  wire [3:0] s5_0, s5_1;
  assign s5_0[0] = g5_0[2] ^ g5_0[1];
  assign s5_1[0] = g5_1[2] ^ g5_1[1];
  assign s5_0[1] = g5_0[0] ^ g5_0[2] ^ g5_0[3] ^ g5_0[1];
  assign s5_1[1] = g5_1[0] ^ g5_1[2] ^ g5_1[3] ^ g5_1[1];
  assign s5_0[2] = g5_0[1];
  assign s5_1[2] = g5_1[1];
  assign s5_0[3] = g5_0[3];
  assign s5_1[3] = g5_1[3];

  wire [3:0] g6_0, g6_1;
  GHPC_Gadget_6 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_6_inst(.in0({in0[16],in0[17],in0[18],in0[19]}), .in1({in1[16],in1[17],in1[18],in1[19]}), .r(r[27:24]), .clk(clk), .out0(g6_0), .out1(g6_1));
  wire [3:0] s6_0, s6_1;
  assign s6_0[0] = g6_0[2] ^ g6_0[1];
  assign s6_1[0] = g6_1[2] ^ g6_1[1];
  assign s6_0[1] = g6_0[0] ^ g6_0[2] ^ g6_0[3] ^ g6_0[1];
  assign s6_1[1] = g6_1[0] ^ g6_1[2] ^ g6_1[3] ^ g6_1[1];
  assign s6_0[2] = g6_0[1];
  assign s6_1[2] = g6_1[1];
  assign s6_0[3] = g6_0[3];
  assign s6_1[3] = g6_1[3];

  wire [3:0] g7_0, g7_1;
  GHPC_Gadget_7 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_7_inst(.in0({in0[20],in0[21],in0[22],in0[23]}), .in1({in1[20],in1[21],in1[22],in1[23]}), .r(r[31:28]), .clk(clk), .out0(g7_0), .out1(g7_1));
  wire [3:0] s7_0, s7_1;
  assign s7_0[0] = g7_0[2] ^ g7_0[1];
  assign s7_1[0] = g7_1[2] ^ g7_1[1];
  assign s7_0[1] = g7_0[0] ^ g7_0[2] ^ g7_0[3] ^ g7_0[1];
  assign s7_1[1] = g7_1[0] ^ g7_1[2] ^ g7_1[3] ^ g7_1[1];
  assign s7_0[2] = g7_0[1];
  assign s7_1[2] = g7_1[1];
  assign s7_0[3] = g7_0[3];
  assign s7_1[3] = g7_1[3];

  wire [3:0] g8_0, g8_1;
  GHPC_Gadget_8 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_8_inst(.in0({in0[60],in0[61],in0[62],in0[63]}), .in1({in1[60],in1[61],in1[62],in1[63]}), .r(r[35:32]), .clk(clk), .out0(g8_0), .out1(g8_1));
  wire [3:0] s8_0, s8_1;
  assign s8_0[0] = g8_0[2] ^ g8_0[1];
  assign s8_1[0] = g8_1[2] ^ g8_1[1];
  assign s8_0[1] = g8_0[0] ^ g8_0[2] ^ g8_0[3] ^ g8_0[1];
  assign s8_1[1] = g8_1[0] ^ g8_1[2] ^ g8_1[3] ^ g8_1[1];
  assign s8_0[2] = g8_0[1];
  assign s8_1[2] = g8_1[1];
  assign s8_0[3] = g8_0[3];
  assign s8_1[3] = g8_1[3];

  wire [3:0] g9_0, g9_1;
  GHPC_Gadget_9 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_9_inst(.in0({in0[24],in0[25],in0[26],in0[27]}), .in1({in1[24],in1[25],in1[26],in1[27]}), .r(r[39:36]), .clk(clk), .out0(g9_0), .out1(g9_1));
  wire [3:0] s9_0, s9_1;
  assign s9_0[0] = g9_0[2] ^ g9_0[1];
  assign s9_1[0] = g9_1[2] ^ g9_1[1];
  assign s9_0[1] = g9_0[0] ^ g9_0[2] ^ g9_0[3] ^ g9_0[1];
  assign s9_1[1] = g9_1[0] ^ g9_1[2] ^ g9_1[3] ^ g9_1[1];
  assign s9_0[2] = g9_0[1];
  assign s9_1[2] = g9_1[1];
  assign s9_0[3] = g9_0[3];
  assign s9_1[3] = g9_1[3];

  wire [3:0] g10_0, g10_1;
  GHPC_Gadget_10 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_10_inst(.in0({in0[28],in0[29],in0[30],in0[31]}), .in1({in1[28],in1[29],in1[30],in1[31]}), .r(r[43:40]), .clk(clk), .out0(g10_0), .out1(g10_1));
  wire [3:0] s10_0, s10_1;
  assign s10_0[0] = g10_0[2] ^ g10_0[1];
  assign s10_1[0] = g10_1[2] ^ g10_1[1];
  assign s10_0[1] = g10_0[0] ^ g10_0[2] ^ g10_0[3] ^ g10_0[1];
  assign s10_1[1] = g10_1[0] ^ g10_1[2] ^ g10_1[3] ^ g10_1[1];
  assign s10_0[2] = g10_0[1];
  assign s10_1[2] = g10_1[1];
  assign s10_0[3] = g10_0[3];
  assign s10_1[3] = g10_1[3];

  wire [3:0] g11_0, g11_1;
  GHPC_Gadget_11 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_11_inst(.in0({in0[32],in0[33],in0[34],in0[35]}), .in1({in1[32],in1[33],in1[34],in1[35]}), .r(r[47:44]), .clk(clk), .out0(g11_0), .out1(g11_1));
  wire [3:0] s11_0, s11_1;
  assign s11_0[0] = g11_0[2] ^ g11_0[1];
  assign s11_1[0] = g11_1[2] ^ g11_1[1];
  assign s11_0[1] = g11_0[0] ^ g11_0[2] ^ g11_0[3] ^ g11_0[1];
  assign s11_1[1] = g11_1[0] ^ g11_1[2] ^ g11_1[3] ^ g11_1[1];
  assign s11_0[2] = g11_0[1];
  assign s11_1[2] = g11_1[1];
  assign s11_0[3] = g11_0[3];
  assign s11_1[3] = g11_1[3];

  wire [3:0] g12_0, g12_1;
  GHPC_Gadget_12 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_12_inst(.in0({in0[36],in0[37],in0[38],in0[39]}), .in1({in1[36],in1[37],in1[38],in1[39]}), .r(r[51:48]), .clk(clk), .out0(g12_0), .out1(g12_1));
  wire [3:0] s12_0, s12_1;
  assign s12_0[0] = g12_0[2] ^ g12_0[1];
  assign s12_1[0] = g12_1[2] ^ g12_1[1];
  assign s12_0[1] = g12_0[0] ^ g12_0[2] ^ g12_0[3] ^ g12_0[1];
  assign s12_1[1] = g12_1[0] ^ g12_1[2] ^ g12_1[3] ^ g12_1[1];
  assign s12_0[2] = g12_0[1];
  assign s12_1[2] = g12_1[1];
  assign s12_0[3] = g12_0[3];
  assign s12_1[3] = g12_1[3];

  wire [3:0] g13_0, g13_1;
  GHPC_Gadget_13 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_13_inst(.in0({in0[40],in0[41],in0[42],in0[43]}), .in1({in1[40],in1[41],in1[42],in1[43]}), .r(r[55:52]), .clk(clk), .out0(g13_0), .out1(g13_1));
  wire [3:0] s13_0, s13_1;
  assign s13_0[0] = g13_0[2] ^ g13_0[1];
  assign s13_1[0] = g13_1[2] ^ g13_1[1];
  assign s13_0[1] = g13_0[0] ^ g13_0[2] ^ g13_0[3] ^ g13_0[1];
  assign s13_1[1] = g13_1[0] ^ g13_1[2] ^ g13_1[3] ^ g13_1[1];
  assign s13_0[2] = g13_0[1];
  assign s13_1[2] = g13_1[1];
  assign s13_0[3] = g13_0[3];
  assign s13_1[3] = g13_1[3];

  wire [3:0] g14_0, g14_1;
  GHPC_Gadget_14 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_14_inst(.in0({in0[44],in0[45],in0[46],in0[47]}), .in1({in1[44],in1[45],in1[46],in1[47]}), .r(r[59:56]), .clk(clk), .out0(g14_0), .out1(g14_1));
  wire [3:0] s14_0, s14_1;
  assign s14_0[0] = g14_0[2] ^ g14_0[1];
  assign s14_1[0] = g14_1[2] ^ g14_1[1];
  assign s14_0[1] = g14_0[0] ^ g14_0[2] ^ g14_0[3] ^ g14_0[1];
  assign s14_1[1] = g14_1[0] ^ g14_1[2] ^ g14_1[3] ^ g14_1[1];
  assign s14_0[2] = g14_0[1];
  assign s14_1[2] = g14_1[1];
  assign s14_0[3] = g14_0[3];
  assign s14_1[3] = g14_1[3];

  wire [3:0] g15_0, g15_1;
  GHPC_Gadget_15 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_15_inst(.in0({in0[48],in0[49],in0[50],in0[51]}), .in1({in1[48],in1[49],in1[50],in1[51]}), .r(r[63:60]), .clk(clk), .out0(g15_0), .out1(g15_1));
  wire [3:0] s15_0, s15_1;
  assign s15_0[0] = g15_0[2] ^ g15_0[1];
  assign s15_1[0] = g15_1[2] ^ g15_1[1];
  assign s15_0[1] = g15_0[0] ^ g15_0[2] ^ g15_0[3] ^ g15_0[1];
  assign s15_1[1] = g15_1[0] ^ g15_1[2] ^ g15_1[3] ^ g15_1[1];
  assign s15_0[2] = g15_0[1];
  assign s15_1[2] = g15_1[1];
  assign s15_0[3] = g15_0[3];
  assign s15_1[3] = g15_1[3];

  assign out0[54] = 1'b0 ^ s0_0[0];
  assign out0[55] = 1'b0 ^ s0_0[3];
  assign out0[16] = 1'b1 ^ s1_0[1];
  assign out0[17] = 1'b1 ^ s1_0[2];
  assign out0[0] = 1'b1 ^ s2_0[1];
  assign out0[1] = 1'b1 ^ s2_0[2];
  assign out0[2] = 1'b0 ^ s2_0[0];
  assign out0[3] = 1'b0 ^ s2_0[3];
  assign out0[18] = 1'b0 ^ s1_0[0];
  assign out0[28] = 1'b1 ^ s3_0[1];
  assign out0[29] = 1'b1 ^ s3_0[2];
  assign out0[30] = 1'b0 ^ s3_0[0];
  assign out0[31] = 1'b0 ^ s3_0[3];
  assign out0[56] = 1'b1 ^ s4_0[1];
  assign out0[57] = 1'b1 ^ s4_0[2];
  assign out0[58] = 1'b0 ^ s4_0[0];
  assign out0[59] = 1'b0 ^ s4_0[3];
  assign out0[36] = 1'b1 ^ s5_0[1];
  assign out0[37] = 1'b1 ^ s5_0[2];
  assign out0[19] = 1'b0 ^ s1_0[3];
  assign out0[38] = 1'b0 ^ s5_0[0];
  assign out0[39] = 1'b0 ^ s5_0[3];
  assign out0[20] = 1'b1 ^ s6_0[1];
  assign out0[21] = 1'b1 ^ s6_0[2];
  assign out0[22] = 1'b0 ^ s6_0[0];
  assign out0[23] = 1'b0 ^ s6_0[3];
  assign out0[8] = 1'b1 ^ s7_0[1];
  assign out0[9] = 1'b1 ^ s7_0[2];
  assign out0[10] = 1'b0 ^ s7_0[0];
  assign out0[11] = 1'b0 ^ s7_0[3];
  assign out0[12] = 1'b1 ^ s8_0[1];
  assign out0[44] = 1'b1 ^ s9_0[1];
  assign out0[45] = 1'b1 ^ s9_0[2];
  assign out0[46] = 1'b0 ^ s9_0[0];
  assign out0[47] = 1'b0 ^ s9_0[3];
  assign out0[48] = 1'b1 ^ s10_0[1];
  assign out0[49] = 1'b1 ^ s10_0[2];
  assign out0[50] = 1'b0 ^ s10_0[0];
  assign out0[51] = 1'b0 ^ s10_0[3];
  assign out0[60] = 1'b1 ^ s11_0[1];
  assign out0[61] = 1'b1 ^ s11_0[2];
  assign out0[13] = 1'b1 ^ s8_0[2];
  assign out0[62] = 1'b0 ^ s11_0[0];
  assign out0[63] = 1'b0 ^ s11_0[3];
  assign out0[32] = 1'b1 ^ s12_0[1];
  assign out0[33] = 1'b1 ^ s12_0[2];
  assign out0[34] = 1'b0 ^ s12_0[0];
  assign out0[35] = 1'b0 ^ s12_0[3];
  assign out0[4] = 1'b1 ^ s13_0[1];
  assign out0[5] = 1'b1 ^ s13_0[2];
  assign out0[6] = 1'b0 ^ s13_0[0];
  assign out0[7] = 1'b0 ^ s13_0[3];
  assign out0[14] = 1'b0 ^ s8_0[0];
  assign out0[24] = 1'b1 ^ s14_0[1];
  assign out0[25] = 1'b1 ^ s14_0[2];
  assign out0[26] = 1'b0 ^ s14_0[0];
  assign out0[27] = 1'b0 ^ s14_0[3];
  assign out0[40] = 1'b1 ^ s15_0[1];
  assign out0[41] = 1'b1 ^ s15_0[2];
  assign out0[42] = 1'b0 ^ s15_0[0];
  assign out0[43] = 1'b0 ^ s15_0[3];
  assign out0[52] = 1'b1 ^ s0_0[1];
  assign out0[53] = 1'b1 ^ s0_0[2];
  assign out0[15] = 1'b0 ^ s8_0[3];
  assign out1[54] = 1'b0 ^ s0_1[0];
  assign out1[55] = 1'b0 ^ s0_1[3];
  assign out1[16] = 1'b0 ^ s1_1[1];
  assign out1[17] = 1'b0 ^ s1_1[2];
  assign out1[0] = 1'b0 ^ s2_1[1];
  assign out1[1] = 1'b0 ^ s2_1[2];
  assign out1[2] = 1'b0 ^ s2_1[0];
  assign out1[3] = 1'b0 ^ s2_1[3];
  assign out1[18] = 1'b0 ^ s1_1[0];
  assign out1[28] = 1'b0 ^ s3_1[1];
  assign out1[29] = 1'b0 ^ s3_1[2];
  assign out1[30] = 1'b0 ^ s3_1[0];
  assign out1[31] = 1'b0 ^ s3_1[3];
  assign out1[56] = 1'b0 ^ s4_1[1];
  assign out1[57] = 1'b0 ^ s4_1[2];
  assign out1[58] = 1'b0 ^ s4_1[0];
  assign out1[59] = 1'b0 ^ s4_1[3];
  assign out1[36] = 1'b0 ^ s5_1[1];
  assign out1[37] = 1'b0 ^ s5_1[2];
  assign out1[19] = 1'b0 ^ s1_1[3];
  assign out1[38] = 1'b0 ^ s5_1[0];
  assign out1[39] = 1'b0 ^ s5_1[3];
  assign out1[20] = 1'b0 ^ s6_1[1];
  assign out1[21] = 1'b0 ^ s6_1[2];
  assign out1[22] = 1'b0 ^ s6_1[0];
  assign out1[23] = 1'b0 ^ s6_1[3];
  assign out1[8] = 1'b0 ^ s7_1[1];
  assign out1[9] = 1'b0 ^ s7_1[2];
  assign out1[10] = 1'b0 ^ s7_1[0];
  assign out1[11] = 1'b0 ^ s7_1[3];
  assign out1[12] = 1'b0 ^ s8_1[1];
  assign out1[44] = 1'b0 ^ s9_1[1];
  assign out1[45] = 1'b0 ^ s9_1[2];
  assign out1[46] = 1'b0 ^ s9_1[0];
  assign out1[47] = 1'b0 ^ s9_1[3];
  assign out1[48] = 1'b0 ^ s10_1[1];
  assign out1[49] = 1'b0 ^ s10_1[2];
  assign out1[50] = 1'b0 ^ s10_1[0];
  assign out1[51] = 1'b0 ^ s10_1[3];
  assign out1[60] = 1'b0 ^ s11_1[1];
  assign out1[61] = 1'b0 ^ s11_1[2];
  assign out1[13] = 1'b0 ^ s8_1[2];
  assign out1[62] = 1'b0 ^ s11_1[0];
  assign out1[63] = 1'b0 ^ s11_1[3];
  assign out1[32] = 1'b0 ^ s12_1[1];
  assign out1[33] = 1'b0 ^ s12_1[2];
  assign out1[34] = 1'b0 ^ s12_1[0];
  assign out1[35] = 1'b0 ^ s12_1[3];
  assign out1[4] = 1'b0 ^ s13_1[1];
  assign out1[5] = 1'b0 ^ s13_1[2];
  assign out1[6] = 1'b0 ^ s13_1[0];
  assign out1[7] = 1'b0 ^ s13_1[3];
  assign out1[14] = 1'b0 ^ s8_1[0];
  assign out1[24] = 1'b0 ^ s14_1[1];
  assign out1[25] = 1'b0 ^ s14_1[2];
  assign out1[26] = 1'b0 ^ s14_1[0];
  assign out1[27] = 1'b0 ^ s14_1[3];
  assign out1[40] = 1'b0 ^ s15_1[1];
  assign out1[41] = 1'b0 ^ s15_1[2];
  assign out1[42] = 1'b0 ^ s15_1[0];
  assign out1[43] = 1'b0 ^ s15_1[3];
  assign out1[52] = 1'b0 ^ s0_1[1];
  assign out1[53] = 1'b0 ^ s0_1[2];
  assign out1[15] = 1'b0 ^ s8_1[3];
endmodule
