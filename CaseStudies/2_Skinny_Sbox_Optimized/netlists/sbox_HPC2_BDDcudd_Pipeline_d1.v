/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* 8 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 9 register stage(s) in total */

module sbox_HPC2_BDDcudd_Pipeline_d1 (X_s0, clk, X_s1, Fresh, Y_s0, Y_s1);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input [16:0] Fresh ;
    output [3:0] Y_s0 ;
    output [3:0] Y_s1 ;
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
    wire signal_51 ;
    wire signal_53 ;
    wire signal_54 ;
    wire signal_55 ;
    wire signal_56 ;
    wire signal_57 ;
    wire signal_58 ;
    wire signal_59 ;
    wire signal_60 ;
    wire signal_61 ;
    wire signal_63 ;
    wire signal_65 ;
    wire signal_66 ;
    wire signal_67 ;
    wire signal_68 ;
    wire signal_69 ;
    wire signal_70 ;
    wire signal_92 ;
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
    wire signal_114 ;
    wire signal_115 ;
    wire signal_116 ;
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
    wire signal_129 ;
    wire signal_130 ;
    wire signal_131 ;
    wire signal_132 ;
    wire signal_133 ;
    wire signal_134 ;
    wire signal_135 ;

    /* cells in depth 0 */

    /* cells in depth 1 */
    buf_clk cell_43 ( .C (clk), .D (X_s0[3]), .Q (signal_92) ) ;
    buf_clk cell_45 ( .C (clk), .D (X_s1[3]), .Q (signal_94) ) ;
    buf_clk cell_47 ( .C (clk), .D (X_s0[0]), .Q (signal_96) ) ;
    buf_clk cell_51 ( .C (clk), .D (X_s1[0]), .Q (signal_100) ) ;
    buf_clk cell_55 ( .C (clk), .D (X_s0[1]), .Q (signal_104) ) ;
    buf_clk cell_59 ( .C (clk), .D (X_s1[1]), .Q (signal_108) ) ;

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_26 ( .s ({X_s1[2], X_s0[2]}), .b ({1'b0, 1'b1}), .a ({1'b0, 1'b0}), .clk (clk), .r (Fresh[0]), .c ({signal_51, signal_37}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_27 ( .s ({X_s1[3], X_s0[3]}), .b ({1'b0, 1'b0}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[1]), .c ({signal_53, signal_38}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_28 ( .s ({X_s1[2], X_s0[2]}), .b ({1'b0, 1'b0}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[2]), .c ({signal_54, signal_39}) ) ;
    buf_clk cell_44 ( .C (clk), .D (signal_92), .Q (signal_93) ) ;
    buf_clk cell_46 ( .C (clk), .D (signal_94), .Q (signal_95) ) ;
    buf_clk cell_48 ( .C (clk), .D (signal_96), .Q (signal_97) ) ;
    buf_clk cell_52 ( .C (clk), .D (signal_100), .Q (signal_101) ) ;
    buf_clk cell_56 ( .C (clk), .D (signal_104), .Q (signal_105) ) ;
    buf_clk cell_60 ( .C (clk), .D (signal_108), .Q (signal_109) ) ;

    /* cells in depth 3 */
    buf_clk cell_49 ( .C (clk), .D (signal_97), .Q (signal_98) ) ;
    buf_clk cell_53 ( .C (clk), .D (signal_101), .Q (signal_102) ) ;
    buf_clk cell_57 ( .C (clk), .D (signal_105), .Q (signal_106) ) ;
    buf_clk cell_61 ( .C (clk), .D (signal_109), .Q (signal_110) ) ;
    buf_clk cell_63 ( .C (clk), .D (signal_38), .Q (signal_112) ) ;
    buf_clk cell_65 ( .C (clk), .D (signal_53), .Q (signal_114) ) ;
    buf_clk cell_71 ( .C (clk), .D (signal_39), .Q (signal_120) ) ;
    buf_clk cell_75 ( .C (clk), .D (signal_54), .Q (signal_124) ) ;

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_29 ( .s ({signal_95, signal_93}), .b ({1'b0, 1'b1}), .a ({signal_54, signal_39}), .clk (clk), .r (Fresh[3]), .c ({signal_55, signal_40}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_30 ( .s ({signal_95, signal_93}), .b ({signal_51, signal_37}), .a ({signal_54, signal_39}), .clk (clk), .r (Fresh[4]), .c ({signal_56, signal_41}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_31 ( .s ({signal_95, signal_93}), .b ({1'b0, 1'b0}), .a ({signal_51, signal_37}), .clk (clk), .r (Fresh[5]), .c ({signal_57, signal_42}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_32 ( .s ({signal_95, signal_93}), .b ({signal_51, signal_37}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[6]), .c ({signal_58, signal_43}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_33 ( .s ({signal_95, signal_93}), .b ({signal_54, signal_39}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[7]), .c ({signal_59, signal_44}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_34 ( .s ({signal_95, signal_93}), .b ({signal_54, signal_39}), .a ({signal_51, signal_37}), .clk (clk), .r (Fresh[8]), .c ({signal_60, signal_45}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_35 ( .s ({signal_95, signal_93}), .b ({signal_51, signal_37}), .a ({1'b0, 1'b0}), .clk (clk), .r (Fresh[9]), .c ({signal_61, signal_46}) ) ;
    buf_clk cell_50 ( .C (clk), .D (signal_98), .Q (signal_99) ) ;
    buf_clk cell_54 ( .C (clk), .D (signal_102), .Q (signal_103) ) ;
    buf_clk cell_58 ( .C (clk), .D (signal_106), .Q (signal_107) ) ;
    buf_clk cell_62 ( .C (clk), .D (signal_110), .Q (signal_111) ) ;
    buf_clk cell_64 ( .C (clk), .D (signal_112), .Q (signal_113) ) ;
    buf_clk cell_66 ( .C (clk), .D (signal_114), .Q (signal_115) ) ;
    buf_clk cell_72 ( .C (clk), .D (signal_120), .Q (signal_121) ) ;
    buf_clk cell_76 ( .C (clk), .D (signal_124), .Q (signal_125) ) ;

    /* cells in depth 5 */
    buf_clk cell_67 ( .C (clk), .D (signal_107), .Q (signal_116) ) ;
    buf_clk cell_69 ( .C (clk), .D (signal_111), .Q (signal_118) ) ;
    buf_clk cell_73 ( .C (clk), .D (signal_121), .Q (signal_122) ) ;
    buf_clk cell_77 ( .C (clk), .D (signal_125), .Q (signal_126) ) ;

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_36 ( .s ({signal_103, signal_99}), .b ({signal_57, signal_42}), .a ({signal_55, signal_40}), .clk (clk), .r (Fresh[10]), .c ({signal_63, signal_47}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_37 ( .s ({signal_111, signal_107}), .b ({signal_56, signal_41}), .a ({signal_115, signal_113}), .clk (clk), .r (Fresh[11]), .c ({signal_65, signal_36}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_38 ( .s ({signal_103, signal_99}), .b ({signal_60, signal_45}), .a ({1'b0, 1'b0}), .clk (clk), .r (Fresh[12]), .c ({signal_66, signal_48}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_39 ( .s ({signal_103, signal_99}), .b ({signal_61, signal_46}), .a ({signal_59, signal_44}), .clk (clk), .r (Fresh[13]), .c ({signal_67, signal_35}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_40 ( .s ({signal_103, signal_99}), .b ({signal_58, signal_43}), .a ({signal_59, signal_44}), .clk (clk), .r (Fresh[14]), .c ({signal_68, signal_49}) ) ;
    buf_clk cell_68 ( .C (clk), .D (signal_116), .Q (signal_117) ) ;
    buf_clk cell_70 ( .C (clk), .D (signal_118), .Q (signal_119) ) ;
    buf_clk cell_74 ( .C (clk), .D (signal_122), .Q (signal_123) ) ;
    buf_clk cell_78 ( .C (clk), .D (signal_126), .Q (signal_127) ) ;

    /* cells in depth 7 */
    buf_clk cell_79 ( .C (clk), .D (signal_35), .Q (signal_128) ) ;
    buf_clk cell_81 ( .C (clk), .D (signal_67), .Q (signal_130) ) ;
    buf_clk cell_83 ( .C (clk), .D (signal_36), .Q (signal_132) ) ;
    buf_clk cell_85 ( .C (clk), .D (signal_65), .Q (signal_134) ) ;

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_41 ( .s ({signal_119, signal_117}), .b ({signal_66, signal_48}), .a ({signal_68, signal_49}), .clk (clk), .r (Fresh[15]), .c ({signal_69, signal_34}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_42 ( .s ({signal_119, signal_117}), .b ({signal_63, signal_47}), .a ({signal_127, signal_123}), .clk (clk), .r (Fresh[16]), .c ({signal_70, signal_33}) ) ;
    buf_clk cell_80 ( .C (clk), .D (signal_128), .Q (signal_129) ) ;
    buf_clk cell_82 ( .C (clk), .D (signal_130), .Q (signal_131) ) ;
    buf_clk cell_84 ( .C (clk), .D (signal_132), .Q (signal_133) ) ;
    buf_clk cell_86 ( .C (clk), .D (signal_134), .Q (signal_135) ) ;

    /* register cells */
    reg_masked #(.security_order(1), .pipeline(1)) cell_0 ( .clk (clk), .D ({signal_131, signal_129}), .Q ({Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.security_order(1), .pipeline(1)) cell_1 ( .clk (clk), .D ({signal_135, signal_133}), .Q ({Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.security_order(1), .pipeline(1)) cell_2 ( .clk (clk), .D ({signal_70, signal_33}), .Q ({Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.security_order(1), .pipeline(1)) cell_3 ( .clk (clk), .D ({signal_69, signal_34}), .Q ({Y_s1[0], Y_s0[0]}) ) ;
endmodule
