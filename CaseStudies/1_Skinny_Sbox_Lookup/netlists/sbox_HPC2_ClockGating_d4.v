/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* clock gating is added to the circuit, the latency increased 10 time(s)  */

module sbox_HPC2_ClockGating_d4 (SI_s0, clk, SI_s1, SI_s2, SI_s3, SI_s4, Fresh, rst, SO_s0, SO_s1, SO_s2, SO_s3, SO_s4, Synch);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [3:0] SI_s2 ;
    input [3:0] SI_s3 ;
    input [3:0] SI_s4 ;
    input rst ;
    input [129:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
    output [3:0] SO_s2 ;
    output [3:0] SO_s3 ;
    output [3:0] SO_s4 ;
    output Synch ;
    wire N9 ;
    wire N12 ;
    wire N19 ;
    wire N27 ;
    wire n40 ;
    wire n41 ;
    wire n42 ;
    wire n43 ;
    wire n44 ;
    wire n45 ;
    wire n46 ;
    wire n47 ;
    wire n48 ;
    wire n49 ;
    wire n50 ;
    wire n51 ;
    wire n52 ;
    wire n53 ;
    wire n54 ;
    wire new_AGEMA_signal_38 ;
    wire new_AGEMA_signal_39 ;
    wire new_AGEMA_signal_40 ;
    wire new_AGEMA_signal_41 ;
    wire new_AGEMA_signal_50 ;
    wire new_AGEMA_signal_51 ;
    wire new_AGEMA_signal_52 ;
    wire new_AGEMA_signal_53 ;
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
    wire new_AGEMA_signal_115 ;
    wire new_AGEMA_signal_116 ;
    wire new_AGEMA_signal_117 ;
    wire new_AGEMA_signal_118 ;
    wire new_AGEMA_signal_119 ;
    wire new_AGEMA_signal_120 ;
    wire new_AGEMA_signal_121 ;
    wire new_AGEMA_signal_122 ;
    wire new_AGEMA_signal_123 ;
    wire new_AGEMA_signal_124 ;
    wire new_AGEMA_signal_125 ;
    wire clk_gated ;

    /* cells in depth 0 */
    not_masked #(.security_order(4), .pipeline(0)) U50 ( .a ({SI_s4[0], SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({new_AGEMA_signal_41, new_AGEMA_signal_40, new_AGEMA_signal_39, new_AGEMA_signal_38, n53}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) U53 ( .a ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({new_AGEMA_signal_61, new_AGEMA_signal_60, new_AGEMA_signal_59, new_AGEMA_signal_58, n52}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) U59 ( .a ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({new_AGEMA_signal_69, new_AGEMA_signal_68, new_AGEMA_signal_67, new_AGEMA_signal_66, n51}) ) ;
    ClockGatingController #(11) ClockGatingInst ( .clk ( clk ), .rst ( rst ), .GatedClk ( clk_gated ), .Synch ( Synch ) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    nor_HPC2 #(.security_order(4), .pipeline(0)) U51 ( .a ({SI_s4[1], SI_s3[1], SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .clk ( clk ), .r ({Fresh[9], Fresh[8], Fresh[7], Fresh[6], Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .c ({new_AGEMA_signal_53, new_AGEMA_signal_52, new_AGEMA_signal_51, new_AGEMA_signal_50, n40}) ) ;
    xor_HPC2 #(.security_order(4), .pipeline(0)) U52 ( .a ({new_AGEMA_signal_53, new_AGEMA_signal_52, new_AGEMA_signal_51, new_AGEMA_signal_50, n40}), .b ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .c ({new_AGEMA_signal_77, new_AGEMA_signal_76, new_AGEMA_signal_75, new_AGEMA_signal_74, N12}) ) ;
    nor_HPC2 #(.security_order(4), .pipeline(0)) U54 ( .a ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({new_AGEMA_signal_61, new_AGEMA_signal_60, new_AGEMA_signal_59, new_AGEMA_signal_58, n52}), .clk ( clk ), .r ({Fresh[19], Fresh[18], Fresh[17], Fresh[16], Fresh[15], Fresh[14], Fresh[13], Fresh[12], Fresh[11], Fresh[10]}), .c ({new_AGEMA_signal_81, new_AGEMA_signal_80, new_AGEMA_signal_79, new_AGEMA_signal_78, n41}) ) ;
    xnor_HPC2 #(.security_order(4), .pipeline(0)) U55 ( .a ({new_AGEMA_signal_41, new_AGEMA_signal_40, new_AGEMA_signal_39, new_AGEMA_signal_38, n53}), .b ({new_AGEMA_signal_81, new_AGEMA_signal_80, new_AGEMA_signal_79, new_AGEMA_signal_78, n41}), .c ({new_AGEMA_signal_105, new_AGEMA_signal_104, new_AGEMA_signal_103, new_AGEMA_signal_102, n42}) ) ;
    nor_HPC2 #(.security_order(4), .pipeline(0)) U57 ( .a ({SI_s4[0], SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .clk ( clk ), .r ({Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25], Fresh[24], Fresh[23], Fresh[22], Fresh[21], Fresh[20]}), .c ({new_AGEMA_signal_65, new_AGEMA_signal_64, new_AGEMA_signal_63, new_AGEMA_signal_62, n43}) ) ;
    nor_HPC2 #(.security_order(4), .pipeline(0)) U60 ( .a ({new_AGEMA_signal_69, new_AGEMA_signal_68, new_AGEMA_signal_67, new_AGEMA_signal_66, n51}), .b ({new_AGEMA_signal_41, new_AGEMA_signal_40, new_AGEMA_signal_39, new_AGEMA_signal_38, n53}), .clk ( clk ), .r ({Fresh[39], Fresh[38], Fresh[37], Fresh[36], Fresh[35], Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30]}), .c ({new_AGEMA_signal_89, new_AGEMA_signal_88, new_AGEMA_signal_87, new_AGEMA_signal_86, n45}) ) ;
    nor_HPC2 #(.security_order(4), .pipeline(0)) U61 ( .a ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({SI_s4[0], SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .clk ( clk ), .r ({Fresh[49], Fresh[48], Fresh[47], Fresh[46], Fresh[45], Fresh[44], Fresh[43], Fresh[42], Fresh[41], Fresh[40]}), .c ({new_AGEMA_signal_73, new_AGEMA_signal_72, new_AGEMA_signal_71, new_AGEMA_signal_70, n48}) ) ;
    nand_HPC2 #(.security_order(4), .pipeline(0)) U67 ( .a ({new_AGEMA_signal_61, new_AGEMA_signal_60, new_AGEMA_signal_59, new_AGEMA_signal_58, n52}), .b ({new_AGEMA_signal_69, new_AGEMA_signal_68, new_AGEMA_signal_67, new_AGEMA_signal_66, n51}), .clk ( clk ), .r ({Fresh[59], Fresh[58], Fresh[57], Fresh[56], Fresh[55], Fresh[54], Fresh[53], Fresh[52], Fresh[51], Fresh[50]}), .c ({new_AGEMA_signal_101, new_AGEMA_signal_100, new_AGEMA_signal_99, new_AGEMA_signal_98, n54}) ) ;
    xor_HPC2 #(.security_order(4), .pipeline(0)) U68 ( .a ({new_AGEMA_signal_101, new_AGEMA_signal_100, new_AGEMA_signal_99, new_AGEMA_signal_98, n54}), .b ({new_AGEMA_signal_41, new_AGEMA_signal_40, new_AGEMA_signal_39, new_AGEMA_signal_38, n53}), .c ({new_AGEMA_signal_113, new_AGEMA_signal_112, new_AGEMA_signal_111, new_AGEMA_signal_110, N9}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(4), .pipeline(0)) U56 ( .s ({SI_s4[1], SI_s3[1], SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({new_AGEMA_signal_105, new_AGEMA_signal_104, new_AGEMA_signal_103, new_AGEMA_signal_102, n42}), .a ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .clk ( clk ), .r ({Fresh[69], Fresh[68], Fresh[67], Fresh[66], Fresh[65], Fresh[64], Fresh[63], Fresh[62], Fresh[61], Fresh[60]}), .c ({new_AGEMA_signal_117, new_AGEMA_signal_116, new_AGEMA_signal_115, new_AGEMA_signal_114, N19}) ) ;
    nand_HPC2 #(.security_order(4), .pipeline(0)) U58 ( .a ({new_AGEMA_signal_65, new_AGEMA_signal_64, new_AGEMA_signal_63, new_AGEMA_signal_62, n43}), .b ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .clk ( clk ), .r ({Fresh[79], Fresh[78], Fresh[77], Fresh[76], Fresh[75], Fresh[74], Fresh[73], Fresh[72], Fresh[71], Fresh[70]}), .c ({new_AGEMA_signal_85, new_AGEMA_signal_84, new_AGEMA_signal_83, new_AGEMA_signal_82, n47}) ) ;
    or_HPC2 #(.security_order(4), .pipeline(0)) U62 ( .a ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({new_AGEMA_signal_73, new_AGEMA_signal_72, new_AGEMA_signal_71, new_AGEMA_signal_70, n48}), .clk ( clk ), .r ({Fresh[89], Fresh[88], Fresh[87], Fresh[86], Fresh[85], Fresh[84], Fresh[83], Fresh[82], Fresh[81], Fresh[80]}), .c ({new_AGEMA_signal_93, new_AGEMA_signal_92, new_AGEMA_signal_91, new_AGEMA_signal_90, n44}) ) ;
    nand_HPC2 #(.security_order(4), .pipeline(0)) U65 ( .a ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({new_AGEMA_signal_73, new_AGEMA_signal_72, new_AGEMA_signal_71, new_AGEMA_signal_70, n48}), .clk ( clk ), .r ({Fresh[99], Fresh[98], Fresh[97], Fresh[96], Fresh[95], Fresh[94], Fresh[93], Fresh[92], Fresh[91], Fresh[90]}), .c ({new_AGEMA_signal_97, new_AGEMA_signal_96, new_AGEMA_signal_95, new_AGEMA_signal_94, n49}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    nor_HPC2 #(.security_order(4), .pipeline(0)) U63 ( .a ({new_AGEMA_signal_89, new_AGEMA_signal_88, new_AGEMA_signal_87, new_AGEMA_signal_86, n45}), .b ({new_AGEMA_signal_93, new_AGEMA_signal_92, new_AGEMA_signal_91, new_AGEMA_signal_90, n44}), .clk ( clk ), .r ({Fresh[109], Fresh[108], Fresh[107], Fresh[106], Fresh[105], Fresh[104], Fresh[103], Fresh[102], Fresh[101], Fresh[100]}), .c ({new_AGEMA_signal_109, new_AGEMA_signal_108, new_AGEMA_signal_107, new_AGEMA_signal_106, n46}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(4), .pipeline(0)) U64 ( .s ({SI_s4[1], SI_s3[1], SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({new_AGEMA_signal_85, new_AGEMA_signal_84, new_AGEMA_signal_83, new_AGEMA_signal_82, n47}), .a ({new_AGEMA_signal_109, new_AGEMA_signal_108, new_AGEMA_signal_107, new_AGEMA_signal_106, n46}), .clk ( clk ), .r ({Fresh[119], Fresh[118], Fresh[117], Fresh[116], Fresh[115], Fresh[114], Fresh[113], Fresh[112], Fresh[111], Fresh[110]}), .c ({new_AGEMA_signal_121, new_AGEMA_signal_120, new_AGEMA_signal_119, new_AGEMA_signal_118, n50}) ) ;

    /* cells in depth 9 */

    /* cells in depth 10 */
    nand_HPC2 #(.security_order(4), .pipeline(0)) U66 ( .a ({new_AGEMA_signal_121, new_AGEMA_signal_120, new_AGEMA_signal_119, new_AGEMA_signal_118, n50}), .b ({new_AGEMA_signal_97, new_AGEMA_signal_96, new_AGEMA_signal_95, new_AGEMA_signal_94, n49}), .clk ( clk ), .r ({Fresh[129], Fresh[128], Fresh[127], Fresh[126], Fresh[125], Fresh[124], Fresh[123], Fresh[122], Fresh[121], Fresh[120]}), .c ({new_AGEMA_signal_125, new_AGEMA_signal_124, new_AGEMA_signal_123, new_AGEMA_signal_122, N27}) ) ;

    /* register cells */
    reg_masked #(.security_order(4), .pipeline(0)) SO_reg_3_ ( .clk ( clk_gated ), .D ({new_AGEMA_signal_113, new_AGEMA_signal_112, new_AGEMA_signal_111, new_AGEMA_signal_110, N9}), .Q ({SO_s4[3], SO_s3[3], SO_s2[3], SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(4), .pipeline(0)) SO_reg_2_ ( .clk ( clk_gated ), .D ({new_AGEMA_signal_77, new_AGEMA_signal_76, new_AGEMA_signal_75, new_AGEMA_signal_74, N12}), .Q ({SO_s4[2], SO_s3[2], SO_s2[2], SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(4), .pipeline(0)) SO_reg_1_ ( .clk ( clk_gated ), .D ({new_AGEMA_signal_117, new_AGEMA_signal_116, new_AGEMA_signal_115, new_AGEMA_signal_114, N19}), .Q ({SO_s4[1], SO_s3[1], SO_s2[1], SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(4), .pipeline(0)) SO_reg_0_ ( .clk ( clk_gated ), .D ({new_AGEMA_signal_125, new_AGEMA_signal_124, new_AGEMA_signal_123, new_AGEMA_signal_122, N27}), .Q ({SO_s4[0], SO_s3[0], SO_s2[0], SO_s1[0], SO_s0[0]}) ) ;
endmodule
