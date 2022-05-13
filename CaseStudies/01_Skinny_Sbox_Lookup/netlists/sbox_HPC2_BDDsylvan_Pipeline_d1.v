/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* 8 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 9 register stage(s) in total */

module sbox_HPC2_BDDsylvan_Pipeline_d1 (SI_s0, clk, SI_s1, Fresh, SO_s0, SO_s1);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [20:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
    wire signal_15 ;
    wire signal_16 ;
    wire signal_17 ;
    wire signal_18 ;
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
    wire signal_52 ;
    wire signal_54 ;
    wire signal_55 ;
    wire signal_56 ;
    wire signal_57 ;
    wire signal_58 ;
    wire signal_59 ;
    wire signal_60 ;
    wire signal_61 ;
    wire signal_62 ;
    wire signal_64 ;
    wire signal_65 ;
    wire signal_66 ;
    wire signal_67 ;
    wire signal_68 ;
    wire signal_69 ;
    wire signal_70 ;
    wire signal_72 ;
    wire signal_73 ;
    wire signal_74 ;
    wire signal_75 ;
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
    wire signal_136 ;
    wire signal_137 ;
    wire signal_138 ;
    wire signal_139 ;
    wire signal_140 ;

    /* cells in depth 0 */

    /* cells in depth 1 */
    buf_clk cell_44 ( .C ( clk ), .D ( SI_s0[1] ), .Q ( signal_101 ) ) ;
    buf_clk cell_46 ( .C ( clk ), .D ( SI_s1[1] ), .Q ( signal_103 ) ) ;
    buf_clk cell_48 ( .C ( clk ), .D ( SI_s0[2] ), .Q ( signal_105 ) ) ;
    buf_clk cell_50 ( .C ( clk ), .D ( SI_s1[2] ), .Q ( signal_107 ) ) ;
    buf_clk cell_60 ( .C ( clk ), .D ( SI_s0[3] ), .Q ( signal_117 ) ) ;
    buf_clk cell_64 ( .C ( clk ), .D ( SI_s1[3] ), .Q ( signal_121 ) ) ;

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_23 ( .s ({SI_s1[1], SI_s0[1]}), .b ({1'b0, 1'b0}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[0] ), .c ({signal_52, signal_34}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_24 ( .s ({SI_s1[0], SI_s0[0]}), .b ({1'b0, 1'b1}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[1] ), .c ({signal_54, signal_35}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_25 ( .s ({SI_s1[0], SI_s0[0]}), .b ({1'b0, 1'b0}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[2] ), .c ({signal_55, signal_36}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_26 ( .s ({SI_s1[1], SI_s0[1]}), .b ({1'b0, 1'b1}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[3] ), .c ({signal_56, signal_37}) ) ;
    buf_clk cell_45 ( .C ( clk ), .D ( signal_101 ), .Q ( signal_102 ) ) ;
    buf_clk cell_47 ( .C ( clk ), .D ( signal_103 ), .Q ( signal_104 ) ) ;
    buf_clk cell_49 ( .C ( clk ), .D ( signal_105 ), .Q ( signal_106 ) ) ;
    buf_clk cell_51 ( .C ( clk ), .D ( signal_107 ), .Q ( signal_108 ) ) ;
    buf_clk cell_61 ( .C ( clk ), .D ( signal_117 ), .Q ( signal_118 ) ) ;
    buf_clk cell_65 ( .C ( clk ), .D ( signal_121 ), .Q ( signal_122 ) ) ;

    /* cells in depth 3 */
    buf_clk cell_52 ( .C ( clk ), .D ( signal_106 ), .Q ( signal_109 ) ) ;
    buf_clk cell_54 ( .C ( clk ), .D ( signal_108 ), .Q ( signal_111 ) ) ;
    buf_clk cell_56 ( .C ( clk ), .D ( signal_34 ), .Q ( signal_113 ) ) ;
    buf_clk cell_58 ( .C ( clk ), .D ( signal_52 ), .Q ( signal_115 ) ) ;
    buf_clk cell_62 ( .C ( clk ), .D ( signal_118 ), .Q ( signal_119 ) ) ;
    buf_clk cell_66 ( .C ( clk ), .D ( signal_122 ), .Q ( signal_123 ) ) ;
    buf_clk cell_68 ( .C ( clk ), .D ( signal_36 ), .Q ( signal_125 ) ) ;
    buf_clk cell_70 ( .C ( clk ), .D ( signal_55 ), .Q ( signal_127 ) ) ;

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_27 ( .s ({signal_104, signal_102}), .b ({signal_54, signal_35}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[4] ), .c ({signal_57, signal_38}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_28 ( .s ({signal_104, signal_102}), .b ({signal_54, signal_35}), .a ({signal_55, signal_36}), .clk ( clk ), .r ( Fresh[5] ), .c ({signal_58, signal_39}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_29 ( .s ({signal_104, signal_102}), .b ({1'b0, 1'b0}), .a ({signal_54, signal_35}), .clk ( clk ), .r ( Fresh[6] ), .c ({signal_59, signal_40}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_30 ( .s ({signal_104, signal_102}), .b ({signal_55, signal_36}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[7] ), .c ({signal_60, signal_41}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_31 ( .s ({signal_104, signal_102}), .b ({signal_54, signal_35}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[8] ), .c ({signal_61, signal_42}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_32 ( .s ({signal_104, signal_102}), .b ({signal_55, signal_36}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[9] ), .c ({signal_62, signal_43}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_33 ( .s ({signal_108, signal_106}), .b ({signal_52, signal_34}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[10] ), .c ({signal_64, signal_44}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_34 ( .s ({signal_108, signal_106}), .b ({signal_56, signal_37}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[11] ), .c ({signal_65, signal_45}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_35 ( .s ({signal_108, signal_106}), .b ({signal_54, signal_35}), .a ({signal_55, signal_36}), .clk ( clk ), .r ( Fresh[12] ), .c ({signal_66, signal_46}) ) ;
    buf_clk cell_53 ( .C ( clk ), .D ( signal_109 ), .Q ( signal_110 ) ) ;
    buf_clk cell_55 ( .C ( clk ), .D ( signal_111 ), .Q ( signal_112 ) ) ;
    buf_clk cell_57 ( .C ( clk ), .D ( signal_113 ), .Q ( signal_114 ) ) ;
    buf_clk cell_59 ( .C ( clk ), .D ( signal_115 ), .Q ( signal_116 ) ) ;
    buf_clk cell_63 ( .C ( clk ), .D ( signal_119 ), .Q ( signal_120 ) ) ;
    buf_clk cell_67 ( .C ( clk ), .D ( signal_123 ), .Q ( signal_124 ) ) ;
    buf_clk cell_69 ( .C ( clk ), .D ( signal_125 ), .Q ( signal_126 ) ) ;
    buf_clk cell_71 ( .C ( clk ), .D ( signal_127 ), .Q ( signal_128 ) ) ;

    /* cells in depth 5 */
    buf_clk cell_72 ( .C ( clk ), .D ( signal_120 ), .Q ( signal_129 ) ) ;
    buf_clk cell_74 ( .C ( clk ), .D ( signal_124 ), .Q ( signal_131 ) ) ;

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_36 ( .s ({signal_112, signal_110}), .b ({signal_57, signal_38}), .a ({signal_116, signal_114}), .clk ( clk ), .r ( Fresh[13] ), .c ({signal_67, signal_47}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_37 ( .s ({signal_112, signal_110}), .b ({signal_59, signal_40}), .a ({signal_58, signal_39}), .clk ( clk ), .r ( Fresh[14] ), .c ({signal_68, signal_48}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_38 ( .s ({signal_112, signal_110}), .b ({signal_61, signal_42}), .a ({signal_60, signal_41}), .clk ( clk ), .r ( Fresh[15] ), .c ({signal_69, signal_49}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_39 ( .s ({signal_112, signal_110}), .b ({signal_62, signal_43}), .a ({signal_60, signal_41}), .clk ( clk ), .r ( Fresh[16] ), .c ({signal_70, signal_50}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_40 ( .s ({signal_124, signal_120}), .b ({signal_65, signal_45}), .a ({signal_64, signal_44}), .clk ( clk ), .r ( Fresh[17] ), .c ({signal_72, signal_16}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_41 ( .s ({signal_124, signal_120}), .b ({signal_66, signal_46}), .a ({signal_128, signal_126}), .clk ( clk ), .r ( Fresh[18] ), .c ({signal_73, signal_15}) ) ;
    buf_clk cell_73 ( .C ( clk ), .D ( signal_129 ), .Q ( signal_130 ) ) ;
    buf_clk cell_75 ( .C ( clk ), .D ( signal_131 ), .Q ( signal_132 ) ) ;

    /* cells in depth 7 */
    buf_clk cell_76 ( .C ( clk ), .D ( signal_15 ), .Q ( signal_133 ) ) ;
    buf_clk cell_78 ( .C ( clk ), .D ( signal_73 ), .Q ( signal_135 ) ) ;
    buf_clk cell_80 ( .C ( clk ), .D ( signal_16 ), .Q ( signal_137 ) ) ;
    buf_clk cell_82 ( .C ( clk ), .D ( signal_72 ), .Q ( signal_139 ) ) ;

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_42 ( .s ({signal_132, signal_130}), .b ({signal_68, signal_48}), .a ({signal_67, signal_47}), .clk ( clk ), .r ( Fresh[19] ), .c ({signal_74, signal_18}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_43 ( .s ({signal_132, signal_130}), .b ({signal_70, signal_50}), .a ({signal_69, signal_49}), .clk ( clk ), .r ( Fresh[20] ), .c ({signal_75, signal_17}) ) ;
    buf_clk cell_77 ( .C ( clk ), .D ( signal_133 ), .Q ( signal_134 ) ) ;
    buf_clk cell_79 ( .C ( clk ), .D ( signal_135 ), .Q ( signal_136 ) ) ;
    buf_clk cell_81 ( .C ( clk ), .D ( signal_137 ), .Q ( signal_138 ) ) ;
    buf_clk cell_83 ( .C ( clk ), .D ( signal_139 ), .Q ( signal_140 ) ) ;

    /* register cells */
    reg_masked #(.security_order(1), .pipeline(1)) cell_0 ( .clk ( clk ), .D ({signal_136, signal_134}), .Q ({SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(1), .pipeline(1)) cell_1 ( .clk ( clk ), .D ({signal_140, signal_138}), .Q ({SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(1), .pipeline(1)) cell_2 ( .clk ( clk ), .D ({signal_75, signal_17}), .Q ({SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(1), .pipeline(1)) cell_3 ( .clk ( clk ), .D ({signal_74, signal_18}), .Q ({SO_s1[0], SO_s0[0]}) ) ;
endmodule
