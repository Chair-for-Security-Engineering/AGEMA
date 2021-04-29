/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* clock gating is added to the circuit, the latency increased 1 time(s)  */

module sbox_GHPCLL_ANF_ClockGating_d1 (X_s0, clk, X_s1, Fresh, rst, Y_s0, Y_s1, Synch);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input rst ;
    input [63:0] Fresh ;
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
    wire signal_114 ;

    /* cells in depth 0 */
    ClockGatingController #(2) cell_27 ( .clk (clk), .rst (rst), .GatedClk (signal_114), .Synch (Synch) ) ;

    /* cells in depth 1 */
    sbox_step2_ANF #(.low_latency(1), .pipeline(0)) cell_26 ( .in0 ({X_s0[0], X_s0[1], X_s0[2], X_s0[3]}), .in1 ({X_s1[0], X_s1[1], X_s1[2], X_s1[3]}), .clk (clk), .r ({Fresh[63], Fresh[62], Fresh[61], Fresh[60], Fresh[59], Fresh[58], Fresh[57], Fresh[56], Fresh[55], Fresh[54], Fresh[53], Fresh[52], Fresh[51], Fresh[50], Fresh[49], Fresh[48], Fresh[47], Fresh[46], Fresh[45], Fresh[44], Fresh[43], Fresh[42], Fresh[41], Fresh[40], Fresh[39], Fresh[38], Fresh[37], Fresh[36], Fresh[35], Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30], Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25], Fresh[24], Fresh[23], Fresh[22], Fresh[21], Fresh[20], Fresh[19], Fresh[18], Fresh[17], Fresh[16], Fresh[15], Fresh[14], Fresh[13], Fresh[12], Fresh[11], Fresh[10], Fresh[9], Fresh[8], Fresh[7], Fresh[6], Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .out0 ({signal_36, signal_35, signal_34, signal_33}), .out1 ({signal_44, signal_43, signal_42, signal_41}) ) ;

    /* register cells */
    reg_masked #(.low_latency(1), .pipeline(0)) cell_0 ( .clk (signal_114), .D ({signal_43, signal_35}), .Q ({Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.low_latency(1), .pipeline(0)) cell_1 ( .clk (signal_114), .D ({signal_44, signal_36}), .Q ({Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.low_latency(1), .pipeline(0)) cell_2 ( .clk (signal_114), .D ({signal_41, signal_33}), .Q ({Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.low_latency(1), .pipeline(0)) cell_3 ( .clk (signal_114), .D ({signal_42, signal_34}), .Q ({Y_s1[0], Y_s0[0]}) ) ;
endmodule
