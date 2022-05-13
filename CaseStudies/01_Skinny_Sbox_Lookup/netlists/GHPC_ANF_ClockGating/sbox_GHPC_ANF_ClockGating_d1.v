/* modified netlist. Source: module sbox in file ../sbox_lookup/GHPC_ANF_ClockGating/sbox.v */
/* clock gating is added to the circuit, the latency increased 2 time(s)  */

module sbox_GHPC_ANF_ClockGating_d1 (SI_s0, clk, SI_s1, Fresh, rst, SO_s0, SO_s1, Synch);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input rst ;
    input [3:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
    output Synch ;
    wire signal_15 ;
    wire signal_16 ;
    wire signal_17 ;
    wire signal_18 ;
    wire signal_38 ;
    wire signal_39 ;
    wire signal_40 ;
    wire signal_41 ;
    wire signal_51 ;

    /* cells in depth 0 */
    ClockGatingController #(3) cell_24 ( .clk (clk), .rst (rst), .GatedClk (signal_51), .Synch (Synch) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    sbox_step2_ANF #(.low_latency(0), .pipeline(0)) cell_23 ( .in0 ({SI_s0[0], SI_s0[1], SI_s0[2], SI_s0[3]}), .in1 ({SI_s1[0], SI_s1[1], SI_s1[2], SI_s1[3]}), .clk (clk), .r ({Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .out0 ({signal_18, signal_17, signal_16, signal_15}), .out1 ({signal_41, signal_40, signal_39, signal_38}) ) ;

    /* register cells */
    reg_masked #(.low_latency(0), .pipeline(0)) cell_0 ( .clk (signal_51), .D ({signal_38, signal_15}), .Q ({SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_1 ( .clk (signal_51), .D ({signal_39, signal_16}), .Q ({SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_2 ( .clk (signal_51), .D ({signal_40, signal_17}), .Q ({SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) cell_3 ( .clk (signal_51), .D ({signal_41, signal_18}), .Q ({SO_s1[0], SO_s0[0]}) ) ;
endmodule
