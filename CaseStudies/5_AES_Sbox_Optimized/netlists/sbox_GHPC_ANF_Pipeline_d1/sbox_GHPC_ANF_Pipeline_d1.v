/* modified netlist. Source: module sbox in file Designs/AESSbox/optBP2/AGEMA/sbox.v */
/* 2 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 3 register stage(s) in total */

module sbox_GHPC_ANF_Pipeline_d1 (X_s0, clk, X_s1, Fresh, Y_s0, Y_s1);
    input [7:0] X_s0 ;
    input clk ;
    input [7:0] X_s1 ;
    input [7:0] Fresh ;
    output [7:0] Y_s0 ;
    output [7:0] Y_s1 ;
    wire signal_143 ;
    wire signal_144 ;
    wire signal_145 ;
    wire signal_146 ;
    wire signal_147 ;
    wire signal_148 ;
    wire signal_149 ;
    wire signal_150 ;
    wire signal_159 ;
    wire signal_160 ;
    wire signal_161 ;
    wire signal_162 ;
    wire signal_163 ;
    wire signal_164 ;
    wire signal_165 ;
    wire signal_166 ;

    /* cells in depth 0 */

    /* cells in depth 1 */

    /* cells in depth 2 */
    sbox_step2_ANF #(.low_latency(0), .pipeline(1)) cell_136 ( .in0 ({X_s0[4], X_s0[5], X_s0[6], X_s0[7], X_s0[0], X_s0[1], X_s0[2], X_s0[3]}), .in1 ({X_s1[4], X_s1[5], X_s1[6], X_s1[7], X_s1[0], X_s1[1], X_s1[2], X_s1[3]}), .clk (clk), .r ({Fresh[7], Fresh[6], Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .out0 ({signal_150, signal_149, signal_148, signal_147, signal_146, signal_145, signal_144, signal_143}), .out1 ({signal_166, signal_165, signal_164, signal_163, signal_162, signal_161, signal_160, signal_159}) ) ;

    /* register cells */
    reg_masked #(.low_latency(0), .pipeline(1)) cell_0 ( .clk (clk), .D ({signal_159, signal_143}), .Q ({Y_s1[7], Y_s0[7]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(1)) cell_1 ( .clk (clk), .D ({signal_160, signal_144}), .Q ({Y_s1[6], Y_s0[6]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(1)) cell_2 ( .clk (clk), .D ({signal_161, signal_145}), .Q ({Y_s1[5], Y_s0[5]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(1)) cell_3 ( .clk (clk), .D ({signal_162, signal_146}), .Q ({Y_s1[4], Y_s0[4]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(1)) cell_4 ( .clk (clk), .D ({signal_163, signal_147}), .Q ({Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(1)) cell_5 ( .clk (clk), .D ({signal_164, signal_148}), .Q ({Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(1)) cell_6 ( .clk (clk), .D ({signal_165, signal_149}), .Q ({Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(1)) cell_7 ( .clk (clk), .D ({signal_166, signal_150}), .Q ({Y_s1[0], Y_s0[0]}) ) ;
endmodule
