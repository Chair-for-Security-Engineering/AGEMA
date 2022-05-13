/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* clock gating is added to the circuit, the latency increased 4 time(s)  */

module sbox_HPC1_ClockGating_d3 (X_s0, clk, X_s1, X_s2, X_s3, Fresh, rst, Y_s0, Y_s1, Y_s2, Y_s3, Synch);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input [3:0] X_s2 ;
    input [3:0] X_s3 ;
    input rst ;
    input [39:0] Fresh ;
    output [3:0] Y_s0 ;
    output [3:0] Y_s1 ;
    output [3:0] Y_s2 ;
    output [3:0] Y_s3 ;
    output Synch ;
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
    wire new_AGEMA_signal_40 ;
    wire new_AGEMA_signal_41 ;
    wire new_AGEMA_signal_42 ;
    wire new_AGEMA_signal_46 ;
    wire new_AGEMA_signal_47 ;
    wire new_AGEMA_signal_48 ;
    wire new_AGEMA_signal_52 ;
    wire new_AGEMA_signal_53 ;
    wire new_AGEMA_signal_54 ;
    wire new_AGEMA_signal_58 ;
    wire new_AGEMA_signal_59 ;
    wire new_AGEMA_signal_60 ;
    wire new_AGEMA_signal_61 ;
    wire new_AGEMA_signal_62 ;
    wire new_AGEMA_signal_63 ;
    wire new_AGEMA_signal_64 ;
    wire new_AGEMA_signal_65 ;
    wire new_AGEMA_signal_66 ;
    wire new_AGEMA_signal_67 ;
    wire new_AGEMA_signal_68 ;
    wire new_AGEMA_signal_69 ;
    wire new_AGEMA_signal_70 ;
    wire new_AGEMA_signal_71 ;
    wire new_AGEMA_signal_72 ;
    wire new_AGEMA_signal_73 ;
    wire new_AGEMA_signal_74 ;
    wire new_AGEMA_signal_75 ;
    wire new_AGEMA_signal_76 ;
    wire new_AGEMA_signal_77 ;
    wire new_AGEMA_signal_78 ;
    wire new_AGEMA_signal_79 ;
    wire new_AGEMA_signal_80 ;
    wire new_AGEMA_signal_81 ;
    wire new_AGEMA_signal_82 ;
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
    wire new_AGEMA_signal_107 ;
    wire new_AGEMA_signal_108 ;
    wire new_AGEMA_signal_109 ;
    wire new_AGEMA_signal_110 ;
    wire new_AGEMA_signal_111 ;
    wire new_AGEMA_signal_112 ;
    wire new_AGEMA_signal_113 ;
    wire new_AGEMA_signal_114 ;
    wire clk_gated ;

    /* cells in depth 0 */
    not_masked #(.security_order(3), .pipeline(0)) U5 ( .a ({X_s3[2], X_s2[2], X_s1[2], X_s0[2]}), .b ({new_AGEMA_signal_42, new_AGEMA_signal_41, new_AGEMA_signal_40, n2}) ) ;
    xor_HPC1 #(.security_order(3), .pipeline(0)) XOR_i1_U1 ( .a ({X_s3[2], X_s2[2], X_s1[2], X_s0[2]}), .b ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .c ({new_AGEMA_signal_48, new_AGEMA_signal_47, new_AGEMA_signal_46, XX[1]}) ) ;
    xor_HPC1 #(.security_order(3), .pipeline(0)) XOR_i2_U1 ( .a ({X_s3[0], X_s2[0], X_s1[0], X_s0[0]}), .b ({X_s3[2], X_s2[2], X_s1[2], X_s0[2]}), .c ({new_AGEMA_signal_54, new_AGEMA_signal_53, new_AGEMA_signal_52, XX[2]}) ) ;
    xor_HPC1 #(.security_order(3), .pipeline(0)) XOR0_U1 ( .a ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({new_AGEMA_signal_54, new_AGEMA_signal_53, new_AGEMA_signal_52, XX[2]}), .c ({new_AGEMA_signal_60, new_AGEMA_signal_59, new_AGEMA_signal_58, Q0}) ) ;
    xor_HPC1 #(.security_order(3), .pipeline(0)) XOR1_U1 ( .a ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({new_AGEMA_signal_48, new_AGEMA_signal_47, new_AGEMA_signal_46, XX[1]}), .c ({new_AGEMA_signal_63, new_AGEMA_signal_62, new_AGEMA_signal_61, Q1}) ) ;
    xnor_HPC1 #(.security_order(3), .pipeline(0)) XOR3_U1 ( .a ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({new_AGEMA_signal_42, new_AGEMA_signal_41, new_AGEMA_signal_40, n2}), .c ({new_AGEMA_signal_66, new_AGEMA_signal_65, new_AGEMA_signal_64, Q4}) ) ;
    xor_HPC1 #(.security_order(3), .pipeline(0)) XOR5_U1 ( .a ({new_AGEMA_signal_54, new_AGEMA_signal_53, new_AGEMA_signal_52, XX[2]}), .b ({new_AGEMA_signal_42, new_AGEMA_signal_41, new_AGEMA_signal_40, n2}), .c ({new_AGEMA_signal_69, new_AGEMA_signal_68, new_AGEMA_signal_67, Q6}) ) ;
    xnor_HPC1 #(.security_order(3), .pipeline(0)) XOR6_U1 ( .a ({new_AGEMA_signal_63, new_AGEMA_signal_62, new_AGEMA_signal_61, Q1}), .b ({new_AGEMA_signal_69, new_AGEMA_signal_68, new_AGEMA_signal_67, Q6}), .c ({new_AGEMA_signal_81, new_AGEMA_signal_80, new_AGEMA_signal_79, L1}) ) ;
    xor_HPC1 #(.security_order(3), .pipeline(0)) XOR8_U1 ( .a ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({new_AGEMA_signal_42, new_AGEMA_signal_41, new_AGEMA_signal_40, n2}), .c ({new_AGEMA_signal_72, new_AGEMA_signal_71, new_AGEMA_signal_70, L2}) ) ;
    ClockGatingController #(5) ClockGatingInst ( .clk (clk), .rst (rst), .GatedClk (clk_gated), .Synch (Synch) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    and_HPC1 #(.security_order(3), .pipeline(0)) AND1_U1 ( .ina ({new_AGEMA_signal_42, new_AGEMA_signal_41, new_AGEMA_signal_40, n2}), .inb ({new_AGEMA_signal_63, new_AGEMA_signal_62, new_AGEMA_signal_61, Q1}), .clk (clk), .rnd ({Fresh[9], Fresh[8], Fresh[7], Fresh[6], Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .outt ({new_AGEMA_signal_75, new_AGEMA_signal_74, new_AGEMA_signal_73, T0}) ) ;
    xor_HPC1 #(.security_order(3), .pipeline(0)) XOR2_U1 ( .a ({new_AGEMA_signal_60, new_AGEMA_signal_59, new_AGEMA_signal_58, Q0}), .b ({new_AGEMA_signal_75, new_AGEMA_signal_74, new_AGEMA_signal_73, T0}), .c ({new_AGEMA_signal_84, new_AGEMA_signal_83, new_AGEMA_signal_82, Q2}) ) ;
    and_HPC1 #(.security_order(3), .pipeline(0)) AND3_U1 ( .ina ({new_AGEMA_signal_42, new_AGEMA_signal_41, new_AGEMA_signal_40, n2}), .inb ({new_AGEMA_signal_66, new_AGEMA_signal_65, new_AGEMA_signal_64, Q4}), .clk (clk), .rnd ({Fresh[19], Fresh[18], Fresh[17], Fresh[16], Fresh[15], Fresh[14], Fresh[13], Fresh[12], Fresh[11], Fresh[10]}), .outt ({new_AGEMA_signal_78, new_AGEMA_signal_77, new_AGEMA_signal_76, T2}) ) ;
    xor_HPC1 #(.security_order(3), .pipeline(0)) XOR7_U1 ( .a ({new_AGEMA_signal_81, new_AGEMA_signal_80, new_AGEMA_signal_79, L1}), .b ({new_AGEMA_signal_78, new_AGEMA_signal_77, new_AGEMA_signal_76, T2}), .c ({new_AGEMA_signal_87, new_AGEMA_signal_86, new_AGEMA_signal_85, Q7}) ) ;
    xor_HPC1 #(.security_order(3), .pipeline(0)) XOR11_U1 ( .a ({new_AGEMA_signal_54, new_AGEMA_signal_53, new_AGEMA_signal_52, XX[2]}), .b ({new_AGEMA_signal_75, new_AGEMA_signal_74, new_AGEMA_signal_73, T0}), .c ({new_AGEMA_signal_90, new_AGEMA_signal_89, new_AGEMA_signal_88, L3}) ) ;
    xnor_HPC1 #(.security_order(3), .pipeline(0)) XOR12_U1 ( .a ({new_AGEMA_signal_90, new_AGEMA_signal_89, new_AGEMA_signal_88, L3}), .b ({new_AGEMA_signal_78, new_AGEMA_signal_77, new_AGEMA_signal_76, T2}), .c ({new_AGEMA_signal_102, new_AGEMA_signal_101, new_AGEMA_signal_100, YY[1]}) ) ;
    xnor_HPC1 #(.security_order(3), .pipeline(0)) XOR13_U1 ( .a ({new_AGEMA_signal_48, new_AGEMA_signal_47, new_AGEMA_signal_46, XX[1]}), .b ({new_AGEMA_signal_78, new_AGEMA_signal_77, new_AGEMA_signal_76, T2}), .c ({new_AGEMA_signal_93, new_AGEMA_signal_92, new_AGEMA_signal_91, YY[0]}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    and_HPC1 #(.security_order(3), .pipeline(0)) AND2_U1 ( .ina ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .inb ({new_AGEMA_signal_84, new_AGEMA_signal_83, new_AGEMA_signal_82, Q2}), .clk (clk), .rnd ({Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25], Fresh[24], Fresh[23], Fresh[22], Fresh[21], Fresh[20]}), .outt ({new_AGEMA_signal_96, new_AGEMA_signal_95, new_AGEMA_signal_94, T1}) ) ;
    xor_HPC1 #(.security_order(3), .pipeline(0)) XOR4_U1 ( .a ({new_AGEMA_signal_96, new_AGEMA_signal_95, new_AGEMA_signal_94, T1}), .b ({new_AGEMA_signal_78, new_AGEMA_signal_77, new_AGEMA_signal_76, T2}), .c ({new_AGEMA_signal_105, new_AGEMA_signal_104, new_AGEMA_signal_103, L0}) ) ;
    and_HPC1 #(.security_order(3), .pipeline(0)) AND4_U1 ( .ina ({new_AGEMA_signal_69, new_AGEMA_signal_68, new_AGEMA_signal_67, Q6}), .inb ({new_AGEMA_signal_87, new_AGEMA_signal_86, new_AGEMA_signal_85, Q7}), .clk (clk), .rnd ({Fresh[39], Fresh[38], Fresh[37], Fresh[36], Fresh[35], Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30]}), .outt ({new_AGEMA_signal_99, new_AGEMA_signal_98, new_AGEMA_signal_97, T3}) ) ;
    xor_HPC1 #(.security_order(3), .pipeline(0)) XOR81_U1 ( .a ({new_AGEMA_signal_72, new_AGEMA_signal_71, new_AGEMA_signal_70, L2}), .b ({new_AGEMA_signal_96, new_AGEMA_signal_95, new_AGEMA_signal_94, T1}), .c ({new_AGEMA_signal_108, new_AGEMA_signal_107, new_AGEMA_signal_106, L2_T1}) ) ;
    xnor_HPC1 #(.security_order(3), .pipeline(0)) XOR9_U1 ( .a ({new_AGEMA_signal_108, new_AGEMA_signal_107, new_AGEMA_signal_106, L2_T1}), .b ({new_AGEMA_signal_90, new_AGEMA_signal_89, new_AGEMA_signal_88, L3}), .c ({new_AGEMA_signal_111, new_AGEMA_signal_110, new_AGEMA_signal_109, YY[3]}) ) ;
    xor_HPC1 #(.security_order(3), .pipeline(0)) XOR10_U1 ( .a ({new_AGEMA_signal_105, new_AGEMA_signal_104, new_AGEMA_signal_103, L0}), .b ({new_AGEMA_signal_99, new_AGEMA_signal_98, new_AGEMA_signal_97, T3}), .c ({new_AGEMA_signal_114, new_AGEMA_signal_113, new_AGEMA_signal_112, YY[2]}) ) ;

    /* register cells */
    reg_masked #(.security_order(3), .pipeline(0)) Y_reg_3_ ( .clk (clk_gated), .D ({new_AGEMA_signal_102, new_AGEMA_signal_101, new_AGEMA_signal_100, YY[1]}), .Q ({Y_s3[3], Y_s2[3], Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.security_order(3), .pipeline(0)) Y_reg_2_ ( .clk (clk_gated), .D ({new_AGEMA_signal_93, new_AGEMA_signal_92, new_AGEMA_signal_91, YY[0]}), .Q ({Y_s3[2], Y_s2[2], Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.security_order(3), .pipeline(0)) Y_reg_1_ ( .clk (clk_gated), .D ({new_AGEMA_signal_111, new_AGEMA_signal_110, new_AGEMA_signal_109, YY[3]}), .Q ({Y_s3[1], Y_s2[1], Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.security_order(3), .pipeline(0)) Y_reg_0_ ( .clk (clk_gated), .D ({new_AGEMA_signal_114, new_AGEMA_signal_113, new_AGEMA_signal_112, YY[2]}), .Q ({Y_s3[0], Y_s2[0], Y_s1[0], Y_s0[0]}) ) ;
endmodule
