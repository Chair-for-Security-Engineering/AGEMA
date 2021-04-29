/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* 2 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 3 register stage(s) in total */

module sbox_GHPCLL_Pipeline_d1 (X_s0, clk, X_s1, Fresh, Y_s0, Y_s1);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input [15:0] Fresh ;
    output [3:0] Y_s0 ;
    output [3:0] Y_s1 ;
    wire Q0 ;
    wire Q1 ;
    wire T0 ;
    wire Q2 ;
    wire T1 ;
    wire Q4 ;
    wire T2 ;
    wire L0 ;
    wire Q6 ;
    wire L1 ;
    wire Q7 ;
    wire T3 ;
    wire L2 ;
    wire L2_T1 ;
    wire L3 ;
    wire n2 ;
    wire [2:1] XX ;
    wire [3:0] YY ;
    wire new_AGEMA_signal_38 ;
    wire new_AGEMA_signal_40 ;
    wire new_AGEMA_signal_42 ;
    wire new_AGEMA_signal_44 ;
    wire new_AGEMA_signal_45 ;
    wire new_AGEMA_signal_46 ;
    wire new_AGEMA_signal_47 ;
    wire new_AGEMA_signal_48 ;
    wire new_AGEMA_signal_49 ;
    wire new_AGEMA_signal_50 ;
    wire new_AGEMA_signal_51 ;
    wire new_AGEMA_signal_52 ;
    wire new_AGEMA_signal_53 ;
    wire new_AGEMA_signal_54 ;
    wire new_AGEMA_signal_55 ;
    wire new_AGEMA_signal_56 ;
    wire new_AGEMA_signal_57 ;
    wire new_AGEMA_signal_58 ;
    wire new_AGEMA_signal_59 ;
    wire new_AGEMA_signal_60 ;
    wire new_AGEMA_signal_61 ;
    wire new_AGEMA_signal_62 ;
    wire new_AGEMA_signal_83 ;
    wire new_AGEMA_signal_84 ;
    wire new_AGEMA_signal_85 ;
    wire new_AGEMA_signal_86 ;
    wire new_AGEMA_signal_87 ;
    wire new_AGEMA_signal_88 ;
    wire new_AGEMA_signal_89 ;
    wire new_AGEMA_signal_90 ;
    wire new_AGEMA_signal_91 ;
    wire new_AGEMA_signal_92 ;
    wire new_AGEMA_signal_93 ;
    wire new_AGEMA_signal_94 ;
    wire new_AGEMA_signal_95 ;
    wire new_AGEMA_signal_96 ;
    wire new_AGEMA_signal_97 ;
    wire new_AGEMA_signal_98 ;
    wire new_AGEMA_signal_99 ;
    wire new_AGEMA_signal_100 ;
    wire new_AGEMA_signal_101 ;
    wire new_AGEMA_signal_102 ;
    wire new_AGEMA_signal_103 ;
    wire new_AGEMA_signal_104 ;
    wire new_AGEMA_signal_105 ;
    wire new_AGEMA_signal_106 ;

    /* cells in depth 0 */
    not_masked #(.low_latency(1), .pipeline(1)) U5 ( .a ({X_s1[2], X_s0[2]}), .b ({new_AGEMA_signal_38, n2}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) XOR_i1_U1 ( .a ({X_s1[2], X_s0[2]}), .b ({X_s1[3], X_s0[3]}), .c ({new_AGEMA_signal_40, XX[1]}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) XOR_i2_U1 ( .a ({X_s1[0], X_s0[0]}), .b ({X_s1[2], X_s0[2]}), .c ({new_AGEMA_signal_42, XX[2]}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) XOR0_U1 ( .a ({X_s1[1], X_s0[1]}), .b ({new_AGEMA_signal_42, XX[2]}), .c ({new_AGEMA_signal_44, Q0}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) XOR1_U1 ( .a ({X_s1[1], X_s0[1]}), .b ({new_AGEMA_signal_40, XX[1]}), .c ({new_AGEMA_signal_45, Q1}) ) ;
    xnor_GHPC #(.low_latency(1), .pipeline(1)) XOR3_U1 ( .a ({X_s1[1], X_s0[1]}), .b ({new_AGEMA_signal_38, n2}), .c ({new_AGEMA_signal_46, Q4}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) XOR5_U1 ( .a ({new_AGEMA_signal_42, XX[2]}), .b ({new_AGEMA_signal_38, n2}), .c ({new_AGEMA_signal_47, Q6}) ) ;
    xnor_GHPC #(.low_latency(1), .pipeline(1)) XOR6_U1 ( .a ({new_AGEMA_signal_45, Q1}), .b ({new_AGEMA_signal_47, Q6}), .c ({new_AGEMA_signal_51, L1}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) XOR8_U1 ( .a ({X_s1[1], X_s0[1]}), .b ({new_AGEMA_signal_38, n2}), .c ({new_AGEMA_signal_48, L2}) ) ;

    /* cells in depth 1 */
    and_GHPC #(.low_latency(1), .pipeline(1)) AND1_U1 ( .a ({new_AGEMA_signal_38, n2}), .b ({new_AGEMA_signal_45, Q1}), .clk (clk), .r ({Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .c ({new_AGEMA_signal_49, T0}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) XOR2_U1 ( .a ({new_AGEMA_signal_84, new_AGEMA_signal_83}), .b ({new_AGEMA_signal_49, T0}), .c ({new_AGEMA_signal_52, Q2}) ) ;
    and_GHPC #(.low_latency(1), .pipeline(1)) AND3_U1 ( .a ({new_AGEMA_signal_38, n2}), .b ({new_AGEMA_signal_46, Q4}), .clk (clk), .r ({Fresh[7], Fresh[6], Fresh[5], Fresh[4]}), .c ({new_AGEMA_signal_50, T2}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) XOR7_U1 ( .a ({new_AGEMA_signal_86, new_AGEMA_signal_85}), .b ({new_AGEMA_signal_50, T2}), .c ({new_AGEMA_signal_53, Q7}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) XOR11_U1 ( .a ({new_AGEMA_signal_88, new_AGEMA_signal_87}), .b ({new_AGEMA_signal_49, T0}), .c ({new_AGEMA_signal_54, L3}) ) ;
    xnor_GHPC #(.low_latency(1), .pipeline(1)) XOR12_U1 ( .a ({new_AGEMA_signal_54, L3}), .b ({new_AGEMA_signal_50, T2}), .c ({new_AGEMA_signal_58, YY[1]}) ) ;
    xnor_GHPC #(.low_latency(1), .pipeline(1)) XOR13_U1 ( .a ({new_AGEMA_signal_90, new_AGEMA_signal_89}), .b ({new_AGEMA_signal_50, T2}), .c ({new_AGEMA_signal_55, YY[0]}) ) ;
    buf_clk new_AGEMA_reg_buffer_26 ( .C (clk), .D (Q0), .Q (new_AGEMA_signal_83) ) ;
    buf_clk new_AGEMA_reg_buffer_27 ( .C (clk), .D (new_AGEMA_signal_44), .Q (new_AGEMA_signal_84) ) ;
    buf_clk new_AGEMA_reg_buffer_28 ( .C (clk), .D (L1), .Q (new_AGEMA_signal_85) ) ;
    buf_clk new_AGEMA_reg_buffer_29 ( .C (clk), .D (new_AGEMA_signal_51), .Q (new_AGEMA_signal_86) ) ;
    buf_clk new_AGEMA_reg_buffer_30 ( .C (clk), .D (XX[2]), .Q (new_AGEMA_signal_87) ) ;
    buf_clk new_AGEMA_reg_buffer_31 ( .C (clk), .D (new_AGEMA_signal_42), .Q (new_AGEMA_signal_88) ) ;
    buf_clk new_AGEMA_reg_buffer_32 ( .C (clk), .D (XX[1]), .Q (new_AGEMA_signal_89) ) ;
    buf_clk new_AGEMA_reg_buffer_33 ( .C (clk), .D (new_AGEMA_signal_40), .Q (new_AGEMA_signal_90) ) ;
    buf_clk new_AGEMA_reg_buffer_34 ( .C (clk), .D (X_s0[1]), .Q (new_AGEMA_signal_91) ) ;
    buf_clk new_AGEMA_reg_buffer_35 ( .C (clk), .D (X_s1[1]), .Q (new_AGEMA_signal_92) ) ;
    buf_clk new_AGEMA_reg_buffer_38 ( .C (clk), .D (Q6), .Q (new_AGEMA_signal_95) ) ;
    buf_clk new_AGEMA_reg_buffer_39 ( .C (clk), .D (new_AGEMA_signal_47), .Q (new_AGEMA_signal_96) ) ;
    buf_clk new_AGEMA_reg_buffer_40 ( .C (clk), .D (L2), .Q (new_AGEMA_signal_97) ) ;
    buf_clk new_AGEMA_reg_buffer_42 ( .C (clk), .D (new_AGEMA_signal_48), .Q (new_AGEMA_signal_99) ) ;

    /* cells in depth 2 */
    and_GHPC #(.low_latency(1), .pipeline(1)) AND2_U1 ( .a ({new_AGEMA_signal_92, new_AGEMA_signal_91}), .b ({new_AGEMA_signal_52, Q2}), .clk (clk), .r ({Fresh[11], Fresh[10], Fresh[9], Fresh[8]}), .c ({new_AGEMA_signal_56, T1}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) XOR4_U1 ( .a ({new_AGEMA_signal_56, T1}), .b ({new_AGEMA_signal_94, new_AGEMA_signal_93}), .c ({new_AGEMA_signal_59, L0}) ) ;
    and_GHPC #(.low_latency(1), .pipeline(1)) AND4_U1 ( .a ({new_AGEMA_signal_96, new_AGEMA_signal_95}), .b ({new_AGEMA_signal_53, Q7}), .clk (clk), .r ({Fresh[15], Fresh[14], Fresh[13], Fresh[12]}), .c ({new_AGEMA_signal_57, T3}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) XOR81_U1 ( .a ({new_AGEMA_signal_100, new_AGEMA_signal_98}), .b ({new_AGEMA_signal_56, T1}), .c ({new_AGEMA_signal_60, L2_T1}) ) ;
    xnor_GHPC #(.low_latency(1), .pipeline(1)) XOR9_U1 ( .a ({new_AGEMA_signal_60, L2_T1}), .b ({new_AGEMA_signal_102, new_AGEMA_signal_101}), .c ({new_AGEMA_signal_61, YY[3]}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) XOR10_U1 ( .a ({new_AGEMA_signal_59, L0}), .b ({new_AGEMA_signal_57, T3}), .c ({new_AGEMA_signal_62, YY[2]}) ) ;
    buf_clk new_AGEMA_reg_buffer_36 ( .C (clk), .D (T2), .Q (new_AGEMA_signal_93) ) ;
    buf_clk new_AGEMA_reg_buffer_37 ( .C (clk), .D (new_AGEMA_signal_50), .Q (new_AGEMA_signal_94) ) ;
    buf_clk new_AGEMA_reg_buffer_41 ( .C (clk), .D (new_AGEMA_signal_97), .Q (new_AGEMA_signal_98) ) ;
    buf_clk new_AGEMA_reg_buffer_43 ( .C (clk), .D (new_AGEMA_signal_99), .Q (new_AGEMA_signal_100) ) ;
    buf_clk new_AGEMA_reg_buffer_44 ( .C (clk), .D (L3), .Q (new_AGEMA_signal_101) ) ;
    buf_clk new_AGEMA_reg_buffer_45 ( .C (clk), .D (new_AGEMA_signal_54), .Q (new_AGEMA_signal_102) ) ;
    buf_clk new_AGEMA_reg_buffer_46 ( .C (clk), .D (YY[1]), .Q (new_AGEMA_signal_103) ) ;
    buf_clk new_AGEMA_reg_buffer_47 ( .C (clk), .D (new_AGEMA_signal_58), .Q (new_AGEMA_signal_104) ) ;
    buf_clk new_AGEMA_reg_buffer_48 ( .C (clk), .D (YY[0]), .Q (new_AGEMA_signal_105) ) ;
    buf_clk new_AGEMA_reg_buffer_49 ( .C (clk), .D (new_AGEMA_signal_55), .Q (new_AGEMA_signal_106) ) ;

    /* register cells */
    reg_masked #(.low_latency(1), .pipeline(1)) Y_reg_3_ ( .clk (clk), .D ({new_AGEMA_signal_104, new_AGEMA_signal_103}), .Q ({Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.low_latency(1), .pipeline(1)) Y_reg_2_ ( .clk (clk), .D ({new_AGEMA_signal_106, new_AGEMA_signal_105}), .Q ({Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.low_latency(1), .pipeline(1)) Y_reg_1_ ( .clk (clk), .D ({new_AGEMA_signal_61, YY[3]}), .Q ({Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.low_latency(1), .pipeline(1)) Y_reg_0_ ( .clk (clk), .D ({new_AGEMA_signal_62, YY[2]}), .Q ({Y_s1[0], Y_s0[0]}) ) ;
endmodule
