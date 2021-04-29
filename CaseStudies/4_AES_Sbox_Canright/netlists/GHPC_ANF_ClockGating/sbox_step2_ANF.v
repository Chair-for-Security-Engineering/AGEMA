// assign in = { in_signal[9], in_signal[8], in_signal[7], in_signal[6], in_signal[1], in_signal[13], in_signal[12], in_signal[11], in_signal[10] };
// assign  { out_signal[167], out_signal[166], out_signal[165], out_signal[164], out_signal[163], out_signal[162], out_signal[161], out_signal[160] } = out;
module sbox_step2_ANF #(low_latency = 0, pipeline = 0) (clk, r, in0, in1, out0, out1);
  input clk;
  input [8:0] in0, in1;
  output [7:0] out0, out1;
  input [7:0] r;


  wire [7:0] g0_0, g0_1;
  GHPC_Gadget_0 #(.in_size('d9), .out_size('d8), .low_latency(low_latency), .pipeline(pipeline)) GHPC_Gadget_0_inst(.in0({in0[5],in0[6],in0[7],in0[8],in0[0],in0[1],in0[2],in0[3],in0[4]}), .in1({in1[5],in1[6],in1[7],in1[8],in1[0],in1[1],in1[2],in1[3],in1[4]}), .r(r[7:0]), .clk(clk), .out0(g0_0), .out1(g0_1));
  wire [7:0] s0_0, s0_1;
  assign s0_0[0] = g0_0[2] ^ g0_0[1];
  assign s0_1[0] = g0_1[2] ^ g0_1[1];
  assign s0_0[1] = g0_0[4] ^ g0_0[5] ^ g0_0[2] ^ g0_0[0];
  assign s0_1[1] = g0_1[4] ^ g0_1[5] ^ g0_1[2] ^ g0_1[0];
  assign s0_0[2] = g0_0[7] ^ g0_0[6];
  assign s0_1[2] = g0_1[7] ^ g0_1[6];
  assign s0_0[3] = g0_0[6] ^ g0_0[5] ^ g0_0[2];
  assign s0_1[3] = g0_1[6] ^ g0_1[5] ^ g0_1[2];
  assign s0_0[4] = g0_0[4] ^ g0_0[3] ^ g0_0[6] ^ g0_0[5] ^ g0_0[2];
  assign s0_1[4] = g0_1[4] ^ g0_1[3] ^ g0_1[6] ^ g0_1[5] ^ g0_1[2];
  assign s0_0[5] = g0_0[3] ^ g0_0[6] ^ g0_0[5];
  assign s0_1[5] = g0_1[3] ^ g0_1[6] ^ g0_1[5];
  assign s0_0[6] = g0_0[5] ^ g0_0[7] ^ g0_0[1] ^ g0_0[6] ^ g0_0[2];
  assign s0_1[6] = g0_1[5] ^ g0_1[7] ^ g0_1[1] ^ g0_1[6] ^ g0_1[2];
  assign s0_0[7] = g0_0[0] ^ g0_0[6] ^ g0_0[1] ^ g0_0[2];
  assign s0_1[7] = g0_1[0] ^ g0_1[6] ^ g0_1[1] ^ g0_1[2];

  assign out0[7] = 1'b0 ^ s0_0[3];
  assign out0[6] = 1'b1 ^ s0_0[5];
  assign out0[5] = 1'b0 ^ s0_0[6];
  assign out0[4] = 1'b0 ^ s0_0[7];
  assign out0[3] = 1'b1 ^ s0_0[4];
  assign out0[2] = 1'b0 ^ s0_0[2];
  assign out0[1] = 1'b1 ^ s0_0[1];
  assign out0[0] = 1'b0 ^ s0_0[0];
  assign out1[7] = 1'b0 ^ s0_1[3];
  assign out1[6] = 1'b0 ^ s0_1[5];
  assign out1[5] = 1'b0 ^ s0_1[6];
  assign out1[4] = 1'b0 ^ s0_1[7];
  assign out1[3] = 1'b0 ^ s0_1[4];
  assign out1[2] = 1'b0 ^ s0_1[2];
  assign out1[1] = 1'b0 ^ s0_1[1];
  assign out1[0] = 1'b0 ^ s0_1[0];
endmodule
