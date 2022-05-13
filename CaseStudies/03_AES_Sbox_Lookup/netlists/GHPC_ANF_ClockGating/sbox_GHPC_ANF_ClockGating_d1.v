/* modified netlist. Source: module sbox in file Designs/AESSbox/Canright/AGEMA/GHPC_ANF_ClockGating/sbox.v */
/* clock gating is added to the circuit, the latency increased 2 time(s)  */

module sbox_GHPC_ANF_ClockGating_d1 (X_s0, clk, X_s1, Fresh, rst, Y_s0, Y_s1, Synch);
    input [7:0] X_s0 ;
    input clk ;
    input [7:0] X_s1 ;
    input rst ;
    input [7:0] Fresh ;
    output [7:0] Y_s0 ;
    output [7:0] Y_s1 ;
    output Synch ;
    wire signal_160 ;
    wire signal_161 ;
    wire signal_162 ;
    wire signal_163 ;
    wire signal_164 ;
    wire signal_165 ;
    wire signal_166 ;
    wire signal_167 ;
    wire signal_200 ;
    wire signal_201 ;
    wire signal_202 ;
    wire signal_203 ;
    wire signal_204 ;
    wire signal_205 ;
    wire signal_206 ;
    wire signal_207 ;
    wire signal_225 ;

    /* cells in depth 0 */
    ClockGatingController #(3) cell_177 ( .clk (clk), .rst (rst), .GatedClk (signal_225), .Synch (Synch) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    sbox_step2_ANF #(.low_latency(0), .pipeline(0)) cell_176 ( .in0 ({X_s0[4], X_s0[5], X_s0[6], X_s0[7], 1'b1, X_s0[0], X_s0[1], X_s0[2], X_s0[3]}), .in1 ({X_s1[4], X_s1[5], X_s1[6], X_s1[7], 1'b0, X_s1[0], X_s1[1], X_s1[2], X_s1[3]}), .clk (clk), .r ({Fresh[7], Fresh[6], Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .out0 ({signal_167, signal_166, signal_165, signal_164, signal_163, signal_162, signal_161, signal_160}), .out1 ({signal_207, signal_206, signal_205, signal_204, signal_203, signal_202, signal_201, signal_200}) ) ;

    /* register cells */
    reg_masked #(.low_latency(0), .pipeline(0)) cell_0 ( .clk (signal_225), .D ({signal_200, signal_160}), .Q ({Y_s1[7], Y_s0[7]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_1 ( .clk (signal_225), .D ({signal_201, signal_161}), .Q ({Y_s1[6], Y_s0[6]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_2 ( .clk (signal_225), .D ({signal_202, signal_162}), .Q ({Y_s1[5], Y_s0[5]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_3 ( .clk (signal_225), .D ({signal_203, signal_163}), .Q ({Y_s1[4], Y_s0[4]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_4 ( .clk (signal_225), .D ({signal_204, signal_164}), .Q ({Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_5 ( .clk (signal_225), .D ({signal_205, signal_165}), .Q ({Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_6 ( .clk (signal_225), .D ({signal_206, signal_166}), .Q ({Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_7 ( .clk (signal_225), .D ({signal_207, signal_167}), .Q ({Y_s1[0], Y_s0[0]}) ) ;
endmodule
