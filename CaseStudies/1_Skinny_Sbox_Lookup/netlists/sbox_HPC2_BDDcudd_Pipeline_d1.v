/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* 8 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 9 register stage(s) in total */

module sbox_HPC2_BDDcudd_Pipeline_d1 (SI_s0, clk, SI_s1, Fresh, SO_s0, SO_s1);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [16:0] Fresh ;
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
    wire signal_48 ;
    wire signal_49 ;
    wire signal_51 ;
    wire signal_52 ;
    wire signal_53 ;
    wire signal_54 ;
    wire signal_55 ;
    wire signal_56 ;
    wire signal_57 ;
    wire signal_58 ;
    wire signal_60 ;
    wire signal_61 ;
    wire signal_62 ;
    wire signal_64 ;
    wire signal_65 ;
    wire signal_66 ;
    wire signal_67 ;
    wire signal_89 ;
    wire signal_90 ;
    wire signal_91 ;
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

    /* cells in depth 0 */

    /* cells in depth 1 */
    buf_clk cell_40 ( .C ( clk ), .D ( SI_s0[2] ), .Q ( signal_89 ) ) ;
    buf_clk cell_42 ( .C ( clk ), .D ( SI_s1[2] ), .Q ( signal_91 ) ) ;
    buf_clk cell_44 ( .C ( clk ), .D ( SI_s0[0] ), .Q ( signal_93 ) ) ;
    buf_clk cell_48 ( .C ( clk ), .D ( SI_s1[0] ), .Q ( signal_97 ) ) ;
    buf_clk cell_52 ( .C ( clk ), .D ( SI_s0[1] ), .Q ( signal_101 ) ) ;
    buf_clk cell_56 ( .C ( clk ), .D ( SI_s1[1] ), .Q ( signal_105 ) ) ;

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_23 ( .s ({SI_s1[3], SI_s0[3]}), .b ({1'b0, 1'b1}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[0] ), .c ({signal_48, signal_34}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_24 ( .s ({SI_s1[3], SI_s0[3]}), .b ({1'b0, 1'b0}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[1] ), .c ({signal_49, signal_35}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_25 ( .s ({SI_s1[2], SI_s0[2]}), .b ({1'b0, 1'b0}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[2] ), .c ({signal_51, signal_36}) ) ;
    buf_clk cell_41 ( .C ( clk ), .D ( signal_89 ), .Q ( signal_90 ) ) ;
    buf_clk cell_43 ( .C ( clk ), .D ( signal_91 ), .Q ( signal_92 ) ) ;
    buf_clk cell_45 ( .C ( clk ), .D ( signal_93 ), .Q ( signal_94 ) ) ;
    buf_clk cell_49 ( .C ( clk ), .D ( signal_97 ), .Q ( signal_98 ) ) ;
    buf_clk cell_53 ( .C ( clk ), .D ( signal_101 ), .Q ( signal_102 ) ) ;
    buf_clk cell_57 ( .C ( clk ), .D ( signal_105 ), .Q ( signal_106 ) ) ;

    /* cells in depth 3 */
    buf_clk cell_46 ( .C ( clk ), .D ( signal_94 ), .Q ( signal_95 ) ) ;
    buf_clk cell_50 ( .C ( clk ), .D ( signal_98 ), .Q ( signal_99 ) ) ;
    buf_clk cell_54 ( .C ( clk ), .D ( signal_102 ), .Q ( signal_103 ) ) ;
    buf_clk cell_58 ( .C ( clk ), .D ( signal_106 ), .Q ( signal_107 ) ) ;
    buf_clk cell_60 ( .C ( clk ), .D ( signal_35 ), .Q ( signal_109 ) ) ;
    buf_clk cell_62 ( .C ( clk ), .D ( signal_49 ), .Q ( signal_111 ) ) ;
    buf_clk cell_68 ( .C ( clk ), .D ( signal_36 ), .Q ( signal_117 ) ) ;
    buf_clk cell_72 ( .C ( clk ), .D ( signal_51 ), .Q ( signal_121 ) ) ;

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_26 ( .s ({signal_92, signal_90}), .b ({signal_48, signal_34}), .a ({signal_49, signal_35}), .clk ( clk ), .r ( Fresh[3] ), .c ({signal_52, signal_37}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_27 ( .s ({signal_92, signal_90}), .b ({1'b0, 1'b1}), .a ({signal_49, signal_35}), .clk ( clk ), .r ( Fresh[4] ), .c ({signal_53, signal_38}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_28 ( .s ({signal_92, signal_90}), .b ({signal_48, signal_34}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[5] ), .c ({signal_54, signal_39}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_29 ( .s ({signal_92, signal_90}), .b ({signal_49, signal_35}), .a ({signal_48, signal_34}), .clk ( clk ), .r ( Fresh[6] ), .c ({signal_55, signal_40}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_30 ( .s ({signal_92, signal_90}), .b ({signal_49, signal_35}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[7] ), .c ({signal_56, signal_41}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_31 ( .s ({signal_92, signal_90}), .b ({signal_49, signal_35}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[8] ), .c ({signal_57, signal_42}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_32 ( .s ({signal_92, signal_90}), .b ({signal_48, signal_34}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[9] ), .c ({signal_58, signal_43}) ) ;
    buf_clk cell_47 ( .C ( clk ), .D ( signal_95 ), .Q ( signal_96 ) ) ;
    buf_clk cell_51 ( .C ( clk ), .D ( signal_99 ), .Q ( signal_100 ) ) ;
    buf_clk cell_55 ( .C ( clk ), .D ( signal_103 ), .Q ( signal_104 ) ) ;
    buf_clk cell_59 ( .C ( clk ), .D ( signal_107 ), .Q ( signal_108 ) ) ;
    buf_clk cell_61 ( .C ( clk ), .D ( signal_109 ), .Q ( signal_110 ) ) ;
    buf_clk cell_63 ( .C ( clk ), .D ( signal_111 ), .Q ( signal_112 ) ) ;
    buf_clk cell_69 ( .C ( clk ), .D ( signal_117 ), .Q ( signal_118 ) ) ;
    buf_clk cell_73 ( .C ( clk ), .D ( signal_121 ), .Q ( signal_122 ) ) ;

    /* cells in depth 5 */
    buf_clk cell_64 ( .C ( clk ), .D ( signal_104 ), .Q ( signal_113 ) ) ;
    buf_clk cell_66 ( .C ( clk ), .D ( signal_108 ), .Q ( signal_115 ) ) ;
    buf_clk cell_70 ( .C ( clk ), .D ( signal_118 ), .Q ( signal_119 ) ) ;
    buf_clk cell_74 ( .C ( clk ), .D ( signal_122 ), .Q ( signal_123 ) ) ;

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_33 ( .s ({signal_100, signal_96}), .b ({signal_55, signal_40}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[10] ), .c ({signal_60, signal_44}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_34 ( .s ({signal_100, signal_96}), .b ({signal_53, signal_38}), .a ({signal_56, signal_41}), .clk ( clk ), .r ( Fresh[11] ), .c ({signal_61, signal_45}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_35 ( .s ({signal_100, signal_96}), .b ({signal_57, signal_42}), .a ({signal_54, signal_39}), .clk ( clk ), .r ( Fresh[12] ), .c ({signal_62, signal_46}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_36 ( .s ({signal_108, signal_104}), .b ({signal_52, signal_37}), .a ({signal_112, signal_110}), .clk ( clk ), .r ( Fresh[13] ), .c ({signal_64, signal_16}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_37 ( .s ({signal_100, signal_96}), .b ({signal_58, signal_43}), .a ({signal_56, signal_41}), .clk ( clk ), .r ( Fresh[14] ), .c ({signal_65, signal_15}) ) ;
    buf_clk cell_65 ( .C ( clk ), .D ( signal_113 ), .Q ( signal_114 ) ) ;
    buf_clk cell_67 ( .C ( clk ), .D ( signal_115 ), .Q ( signal_116 ) ) ;
    buf_clk cell_71 ( .C ( clk ), .D ( signal_119 ), .Q ( signal_120 ) ) ;
    buf_clk cell_75 ( .C ( clk ), .D ( signal_123 ), .Q ( signal_124 ) ) ;

    /* cells in depth 7 */
    buf_clk cell_76 ( .C ( clk ), .D ( signal_15 ), .Q ( signal_125 ) ) ;
    buf_clk cell_78 ( .C ( clk ), .D ( signal_65 ), .Q ( signal_127 ) ) ;
    buf_clk cell_80 ( .C ( clk ), .D ( signal_16 ), .Q ( signal_129 ) ) ;
    buf_clk cell_82 ( .C ( clk ), .D ( signal_64 ), .Q ( signal_131 ) ) ;

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_38 ( .s ({signal_116, signal_114}), .b ({signal_60, signal_44}), .a ({signal_61, signal_45}), .clk ( clk ), .r ( Fresh[15] ), .c ({signal_66, signal_18}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(1)) cell_39 ( .s ({signal_116, signal_114}), .b ({signal_62, signal_46}), .a ({signal_124, signal_120}), .clk ( clk ), .r ( Fresh[16] ), .c ({signal_67, signal_17}) ) ;
    buf_clk cell_77 ( .C ( clk ), .D ( signal_125 ), .Q ( signal_126 ) ) ;
    buf_clk cell_79 ( .C ( clk ), .D ( signal_127 ), .Q ( signal_128 ) ) ;
    buf_clk cell_81 ( .C ( clk ), .D ( signal_129 ), .Q ( signal_130 ) ) ;
    buf_clk cell_83 ( .C ( clk ), .D ( signal_131 ), .Q ( signal_132 ) ) ;

    /* register cells */
    reg_masked #(.security_order(1), .pipeline(1)) cell_0 ( .clk ( clk ), .D ({signal_128, signal_126}), .Q ({SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(1), .pipeline(1)) cell_1 ( .clk ( clk ), .D ({signal_132, signal_130}), .Q ({SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(1), .pipeline(1)) cell_2 ( .clk ( clk ), .D ({signal_67, signal_17}), .Q ({SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(1), .pipeline(1)) cell_3 ( .clk ( clk ), .D ({signal_66, signal_18}), .Q ({SO_s1[0], SO_s0[0]}) ) ;
endmodule
