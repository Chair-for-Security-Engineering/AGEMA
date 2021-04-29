/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* clock gating is added to the circuit, the latency increased 2 time(s)  */

module sbox_GHPC_ANF_ClockGating_d1 (X_s0, clk, X_s1, Fresh, rst, Y_s0, Y_s1, Synch);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input rst ;
    input [3:0] Fresh ;
    output [3:0] Y_s0 ;
    output [3:0] Y_s1 ;
    output Synch ;
    wire signal_33 ;
    wire signal_34 ;
    wire signal_35 ;
    wire signal_36 ;
    wire signal_41 ;
    wire signal_42 ;
    wire signal_43 ;
    wire signal_44 ;
    wire signal_54 ;

    /* cells in depth 0 */
    ClockGatingController #(3) cell_27 ( .clk (clk), .rst (rst), .GatedClk (signal_54), .Synch (Synch) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    sbox_step2_ANF #(.low_latency(0), .pipeline(0)) cell_26 ( .in0 ({X_s0[0], X_s0[1], X_s0[2], X_s0[3]}), .in1 ({X_s1[0], X_s1[1], X_s1[2], X_s1[3]}), .clk (clk), .r ({Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .out0 ({signal_36, signal_35, signal_34, signal_33}), .out1 ({signal_44, signal_43, signal_42, signal_41}) ) ;

    /* register cells */
    reg_masked #(.low_latency(0), .pipeline(0)) cell_0 ( .clk (signal_54), .D ({signal_43, signal_35}), .Q ({Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_1 ( .clk (signal_54), .D ({signal_44, signal_36}), .Q ({Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_2 ( .clk (signal_54), .D ({signal_41, signal_33}), .Q ({Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_3 ( .clk (signal_54), .D ({signal_42, signal_34}), .Q ({Y_s1[0], Y_s0[0]}) ) ;
endmodule
