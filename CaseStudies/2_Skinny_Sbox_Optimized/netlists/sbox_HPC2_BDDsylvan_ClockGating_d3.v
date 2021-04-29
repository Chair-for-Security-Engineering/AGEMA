/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* clock gating is added to the circuit, the latency increased 8 time(s)  */

module sbox_HPC2_BDDsylvan_ClockGating_d3 (X_s0, clk, X_s1, X_s2, X_s3, Fresh, rst, Y_s0, Y_s1, Y_s2, Y_s3, Synch);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input [3:0] X_s2 ;
    input [3:0] X_s3 ;
    input rst ;
    input [125:0] Fresh ;
    output [3:0] Y_s0 ;
    output [3:0] Y_s1 ;
    output [3:0] Y_s2 ;
    output [3:0] Y_s3 ;
    output Synch ;
    wire signal_33 ;
    wire signal_34 ;
    wire signal_35 ;
    wire signal_36 ;
    wire signal_37 ;
    wire signal_38 ;
    wire signal_39 ;
    wire signal_40 ;
    wire signal_41 ;
    wire signal_42 ;
    wire signal_43 ;
    wire signal_44 ;
    wire signal_45 ;
    wire signal_46 ;
    wire signal_47 ;
    wire signal_48 ;
    wire signal_49 ;
    wire signal_50 ;
    wire signal_51 ;
    wire signal_52 ;
    wire signal_53 ;
    wire signal_57 ;
    wire signal_58 ;
    wire signal_59 ;
    wire signal_63 ;
    wire signal_64 ;
    wire signal_65 ;
    wire signal_66 ;
    wire signal_67 ;
    wire signal_68 ;
    wire signal_69 ;
    wire signal_70 ;
    wire signal_71 ;
    wire signal_72 ;
    wire signal_73 ;
    wire signal_74 ;
    wire signal_75 ;
    wire signal_76 ;
    wire signal_77 ;
    wire signal_78 ;
    wire signal_79 ;
    wire signal_80 ;
    wire signal_81 ;
    wire signal_82 ;
    wire signal_83 ;
    wire signal_84 ;
    wire signal_85 ;
    wire signal_86 ;
    wire signal_87 ;
    wire signal_88 ;
    wire signal_89 ;
    wire signal_93 ;
    wire signal_94 ;
    wire signal_95 ;
    wire signal_96 ;
    wire signal_97 ;
    wire signal_98 ;
    wire signal_99 ;
    wire signal_100 ;
    wire signal_101 ;
    wire signal_102 ;
    wire signal_103 ;
    wire signal_104 ;
    wire signal_105 ;
    wire signal_106 ;
    wire signal_107 ;
    wire signal_108 ;
    wire signal_109 ;
    wire signal_110 ;
    wire signal_111 ;
    wire signal_112 ;
    wire signal_113 ;
    wire signal_117 ;
    wire signal_118 ;
    wire signal_119 ;
    wire signal_120 ;
    wire signal_121 ;
    wire signal_122 ;
    wire signal_123 ;
    wire signal_124 ;
    wire signal_125 ;
    wire signal_126 ;
    wire signal_127 ;
    wire signal_128 ;
    wire signal_268 ;

    /* cells in depth 0 */
    ClockGatingController #(9) cell_47 ( .clk (clk), .rst (rst), .GatedClk (signal_268), .Synch (Synch) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_26 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({1'b0, 1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .c ({signal_59, signal_58, signal_57, signal_37}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_27 ( .s ({X_s3[0], X_s2[0], X_s1[0], X_s0[0]}), .b ({1'b0, 1'b0, 1'b0, 1'b1}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[11], Fresh[10], Fresh[9], Fresh[8], Fresh[7], Fresh[6]}), .c ({signal_65, signal_64, signal_63, signal_38}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_28 ( .s ({X_s3[0], X_s2[0], X_s1[0], X_s0[0]}), .b ({1'b0, 1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[17], Fresh[16], Fresh[15], Fresh[14], Fresh[13], Fresh[12]}), .c ({signal_68, signal_67, signal_66, signal_39}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_29 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({1'b0, 1'b0, 1'b0, 1'b1}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[23], Fresh[22], Fresh[21], Fresh[20], Fresh[19], Fresh[18]}), .c ({signal_71, signal_70, signal_69, signal_40}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_30 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({signal_65, signal_64, signal_63, signal_38}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25], Fresh[24]}), .c ({signal_74, signal_73, signal_72, signal_41}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_31 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({signal_65, signal_64, signal_63, signal_38}), .a ({signal_68, signal_67, signal_66, signal_39}), .clk (clk), .r ({Fresh[35], Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30]}), .c ({signal_77, signal_76, signal_75, signal_42}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_32 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({1'b0, 1'b0, 1'b0, 1'b0}), .a ({signal_65, signal_64, signal_63, signal_38}), .clk (clk), .r ({Fresh[41], Fresh[40], Fresh[39], Fresh[38], Fresh[37], Fresh[36]}), .c ({signal_80, signal_79, signal_78, signal_43}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_33 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({signal_68, signal_67, signal_66, signal_39}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[47], Fresh[46], Fresh[45], Fresh[44], Fresh[43], Fresh[42]}), .c ({signal_83, signal_82, signal_81, signal_44}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_34 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({signal_65, signal_64, signal_63, signal_38}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[53], Fresh[52], Fresh[51], Fresh[50], Fresh[49], Fresh[48]}), .c ({signal_86, signal_85, signal_84, signal_45}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_35 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({signal_68, signal_67, signal_66, signal_39}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[59], Fresh[58], Fresh[57], Fresh[56], Fresh[55], Fresh[54]}), .c ({signal_89, signal_88, signal_87, signal_46}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_36 ( .s ({X_s3[2], X_s2[2], X_s1[2], X_s0[2]}), .b ({signal_59, signal_58, signal_57, signal_37}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[65], Fresh[64], Fresh[63], Fresh[62], Fresh[61], Fresh[60]}), .c ({signal_95, signal_94, signal_93, signal_47}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_37 ( .s ({X_s3[2], X_s2[2], X_s1[2], X_s0[2]}), .b ({signal_71, signal_70, signal_69, signal_40}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[71], Fresh[70], Fresh[69], Fresh[68], Fresh[67], Fresh[66]}), .c ({signal_98, signal_97, signal_96, signal_48}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_38 ( .s ({X_s3[2], X_s2[2], X_s1[2], X_s0[2]}), .b ({signal_65, signal_64, signal_63, signal_38}), .a ({signal_68, signal_67, signal_66, signal_39}), .clk (clk), .r ({Fresh[77], Fresh[76], Fresh[75], Fresh[74], Fresh[73], Fresh[72]}), .c ({signal_101, signal_100, signal_99, signal_49}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_39 ( .s ({X_s3[2], X_s2[2], X_s1[2], X_s0[2]}), .b ({signal_74, signal_73, signal_72, signal_41}), .a ({signal_59, signal_58, signal_57, signal_37}), .clk (clk), .r ({Fresh[83], Fresh[82], Fresh[81], Fresh[80], Fresh[79], Fresh[78]}), .c ({signal_104, signal_103, signal_102, signal_50}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_40 ( .s ({X_s3[2], X_s2[2], X_s1[2], X_s0[2]}), .b ({signal_80, signal_79, signal_78, signal_43}), .a ({signal_77, signal_76, signal_75, signal_42}), .clk (clk), .r ({Fresh[89], Fresh[88], Fresh[87], Fresh[86], Fresh[85], Fresh[84]}), .c ({signal_107, signal_106, signal_105, signal_51}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_41 ( .s ({X_s3[2], X_s2[2], X_s1[2], X_s0[2]}), .b ({signal_86, signal_85, signal_84, signal_45}), .a ({signal_83, signal_82, signal_81, signal_44}), .clk (clk), .r ({Fresh[95], Fresh[94], Fresh[93], Fresh[92], Fresh[91], Fresh[90]}), .c ({signal_110, signal_109, signal_108, signal_52}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_42 ( .s ({X_s3[2], X_s2[2], X_s1[2], X_s0[2]}), .b ({signal_89, signal_88, signal_87, signal_46}), .a ({signal_83, signal_82, signal_81, signal_44}), .clk (clk), .r ({Fresh[101], Fresh[100], Fresh[99], Fresh[98], Fresh[97], Fresh[96]}), .c ({signal_113, signal_112, signal_111, signal_53}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_43 ( .s ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .b ({signal_98, signal_97, signal_96, signal_48}), .a ({signal_95, signal_94, signal_93, signal_47}), .clk (clk), .r ({Fresh[107], Fresh[106], Fresh[105], Fresh[104], Fresh[103], Fresh[102]}), .c ({signal_119, signal_118, signal_117, signal_36}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_44 ( .s ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .b ({signal_101, signal_100, signal_99, signal_49}), .a ({signal_68, signal_67, signal_66, signal_39}), .clk (clk), .r ({Fresh[113], Fresh[112], Fresh[111], Fresh[110], Fresh[109], Fresh[108]}), .c ({signal_122, signal_121, signal_120, signal_35}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_45 ( .s ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .b ({signal_107, signal_106, signal_105, signal_51}), .a ({signal_104, signal_103, signal_102, signal_50}), .clk (clk), .r ({Fresh[119], Fresh[118], Fresh[117], Fresh[116], Fresh[115], Fresh[114]}), .c ({signal_125, signal_124, signal_123, signal_34}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_46 ( .s ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .b ({signal_113, signal_112, signal_111, signal_53}), .a ({signal_110, signal_109, signal_108, signal_52}), .clk (clk), .r ({Fresh[125], Fresh[124], Fresh[123], Fresh[122], Fresh[121], Fresh[120]}), .c ({signal_128, signal_127, signal_126, signal_33}) ) ;

    /* register cells */
    reg_masked #(.security_order(3), .pipeline(0)) cell_0 ( .clk (signal_268), .D ({signal_122, signal_121, signal_120, signal_35}), .Q ({Y_s3[3], Y_s2[3], Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.security_order(3), .pipeline(0)) cell_1 ( .clk (signal_268), .D ({signal_119, signal_118, signal_117, signal_36}), .Q ({Y_s3[2], Y_s2[2], Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.security_order(3), .pipeline(0)) cell_2 ( .clk (signal_268), .D ({signal_128, signal_127, signal_126, signal_33}), .Q ({Y_s3[1], Y_s2[1], Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.security_order(3), .pipeline(0)) cell_3 ( .clk (signal_268), .D ({signal_125, signal_124, signal_123, signal_34}), .Q ({Y_s3[0], Y_s2[0], Y_s1[0], Y_s0[0]}) ) ;
endmodule
