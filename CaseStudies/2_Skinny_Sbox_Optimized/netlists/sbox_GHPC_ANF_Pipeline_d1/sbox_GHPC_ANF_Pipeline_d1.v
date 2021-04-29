/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* 2 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 3 register stage(s) in total */

module sbox_GHPC_ANF_Pipeline_d1 (X_s0, clk, X_s1, Fresh, Y_s0, Y_s1);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input [3:0] Fresh ;
    output [3:0] Y_s0 ;
    output [3:0] Y_s1 ;
    wire signal_33 ;
    wire signal_34 ;
    wire signal_35 ;
    wire signal_36 ;
    wire signal_41 ;
    wire signal_42 ;
    wire signal_43 ;
    wire signal_44 ;

    /* cells in depth 0 */

    /* cells in depth 1 */

    /* cells in depth 2 */
    sbox_step2_ANF #(.low_latency(0), .pipeline(1)) cell_26 ( .in0 ({X_s0[0], X_s0[1], X_s0[2], X_s0[3]}), .in1 ({X_s1[0], X_s1[1], X_s1[2], X_s1[3]}), .clk (clk), .r ({Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .out0 ({signal_36, signal_35, signal_34, signal_33}), .out1 ({signal_44, signal_43, signal_42, signal_41}) ) ;

    /* register cells */
    reg_masked #(.low_latency(0), .pipeline(1)) cell_0 ( .clk (clk), .D ({signal_43, signal_35}), .Q ({Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(1)) cell_1 ( .clk (clk), .D ({signal_44, signal_36}), .Q ({Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(1)) cell_2 ( .clk (clk), .D ({signal_41, signal_33}), .Q ({Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(1)) cell_3 ( .clk (clk), .D ({signal_42, signal_34}), .Q ({Y_s1[0], Y_s0[0]}) ) ;
endmodule
