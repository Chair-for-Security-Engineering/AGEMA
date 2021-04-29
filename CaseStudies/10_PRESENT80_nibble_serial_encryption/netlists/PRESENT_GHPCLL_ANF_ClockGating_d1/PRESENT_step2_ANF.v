// assign in = { in_signal[481], in_signal[480], in_signal[479], in_signal[478] };
// assign  { out_signal[470], out_signal[469], out_signal[468], out_signal[443] } = out;
module PRESENT_step2_ANF #(low_latency = 1, pipeline = 0) (clk, r, in0, in1, out0, out1);
  input clk;
  input [3:0] in0, in1;
  output [3:0] out0, out1;
  input [63:0] r;


  wire [3:0] g0_0, g0_1;
  GHPC_Gadget_0 #(.in_size('d4), .out_size('d4), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_0_inst(.in0({in0[3],in0[2],in0[1],in0[0]}), .in1({in1[3],in1[2],in1[1],in1[0]}), .r(r[63:0]), .clk(clk), .out0(g0_0), .out1(g0_1));
  wire [3:0] s0_0, s0_1;
  assign s0_0[0] = g0_0[0];
  assign s0_1[0] = g0_1[0];
  assign s0_0[1] = g0_0[1] ^ g0_0[3];
  assign s0_1[1] = g0_1[1] ^ g0_1[3];
  assign s0_0[2] = g0_0[2] ^ g0_0[0];
  assign s0_1[2] = g0_1[2] ^ g0_1[0];
  assign s0_0[3] = g0_0[0] ^ g0_0[3];
  assign s0_1[3] = g0_1[0] ^ g0_1[3];

  assign out0[3] = 1'b0 ^ s0_0[0];
  assign out0[2] = 1'b0 ^ s0_0[3];
  assign out0[1] = 1'b1 ^ s0_0[2];
  assign out0[0] = 1'b1 ^ s0_0[1];
  assign out1[3] = 1'b0 ^ s0_1[0];
  assign out1[2] = 1'b0 ^ s0_1[3];
  assign out1[1] = 1'b0 ^ s0_1[2];
  assign out1[0] = 1'b0 ^ s0_1[1];
endmodule
