/* modified netlist. Source: module sbox in file ../sbox_lookup/GHPCLL_ANF_Pipeline/sbox.v */
/* 1 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 2 register stage(s) in total */

module sbox_GHPCLL_ANF_Pipeline_d1 (SI_s0, clk, SI_s1, Fresh, SO_s0, SO_s1);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [63:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
    wire signal_15 ;
    wire signal_16 ;
    wire signal_17 ;
    wire signal_18 ;
    wire signal_38 ;
    wire signal_39 ;
    wire signal_40 ;
    wire signal_41 ;

    /* cells in depth 0 */

    /* cells in depth 1 */
    sbox_step2_ANF #(.low_latency(1), .pipeline(1)) cell_23 ( .in0 ({SI_s0[0], SI_s0[1], SI_s0[2], SI_s0[3]}), .in1 ({SI_s1[0], SI_s1[1], SI_s1[2], SI_s1[3]}), .clk (clk), .r ({Fresh[63], Fresh[62], Fresh[61], Fresh[60], Fresh[59], Fresh[58], Fresh[57], Fresh[56], Fresh[55], Fresh[54], Fresh[53], Fresh[52], Fresh[51], Fresh[50], Fresh[49], Fresh[48], Fresh[47], Fresh[46], Fresh[45], Fresh[44], Fresh[43], Fresh[42], Fresh[41], Fresh[40], Fresh[39], Fresh[38], Fresh[37], Fresh[36], Fresh[35], Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30], Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25], Fresh[24], Fresh[23], Fresh[22], Fresh[21], Fresh[20], Fresh[19], Fresh[18], Fresh[17], Fresh[16], Fresh[15], Fresh[14], Fresh[13], Fresh[12], Fresh[11], Fresh[10], Fresh[9], Fresh[8], Fresh[7], Fresh[6], Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .out0 ({signal_18, signal_17, signal_16, signal_15}), .out1 ({signal_41, signal_40, signal_39, signal_38}) ) ;

    /* register cells */
    reg_masked #(.low_latency(1), .pipeline(1)) cell_0 ( .clk (clk), .D ({signal_38, signal_15}), .Q ({SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.low_latency(1), .pipeline(1)) cell_1 ( .clk (clk), .D ({signal_39, signal_16}), .Q ({SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.low_latency(1), .pipeline(1)) cell_2 ( .clk (clk), .D ({signal_40, signal_17}), .Q ({SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.low_latency(1), .pipeline(1)) cell_3 ( .clk (clk), .D ({signal_41, signal_18}), .Q ({SO_s1[0], SO_s0[0]}) ) ;
endmodule
