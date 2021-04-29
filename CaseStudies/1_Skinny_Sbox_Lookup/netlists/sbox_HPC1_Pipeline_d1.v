/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* 10 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 11 register stage(s) in total */

module sbox_HPC1_Pipeline_d1 (SI_s0, clk, SI_s1, Fresh, SO_s0, SO_s1);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [25:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
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
    wire new_AGEMA_signal_35 ;
    wire new_AGEMA_signal_38 ;
    wire new_AGEMA_signal_40 ;
    wire new_AGEMA_signal_41 ;
    wire new_AGEMA_signal_42 ;
    wire new_AGEMA_signal_43 ;
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
    wire new_AGEMA_signal_126 ;
    wire new_AGEMA_signal_127 ;
    wire new_AGEMA_signal_128 ;
    wire new_AGEMA_signal_129 ;
    wire new_AGEMA_signal_130 ;
    wire new_AGEMA_signal_131 ;
    wire new_AGEMA_signal_132 ;
    wire new_AGEMA_signal_133 ;
    wire new_AGEMA_signal_134 ;
    wire new_AGEMA_signal_135 ;
    wire new_AGEMA_signal_136 ;
    wire new_AGEMA_signal_137 ;
    wire new_AGEMA_signal_138 ;
    wire new_AGEMA_signal_139 ;
    wire new_AGEMA_signal_140 ;
    wire new_AGEMA_signal_141 ;
    wire new_AGEMA_signal_142 ;
    wire new_AGEMA_signal_143 ;
    wire new_AGEMA_signal_144 ;
    wire new_AGEMA_signal_145 ;
    wire new_AGEMA_signal_146 ;
    wire new_AGEMA_signal_147 ;
    wire new_AGEMA_signal_148 ;
    wire new_AGEMA_signal_149 ;
    wire new_AGEMA_signal_150 ;
    wire new_AGEMA_signal_151 ;
    wire new_AGEMA_signal_152 ;
    wire new_AGEMA_signal_153 ;
    wire new_AGEMA_signal_154 ;
    wire new_AGEMA_signal_155 ;
    wire new_AGEMA_signal_156 ;
    wire new_AGEMA_signal_157 ;
    wire new_AGEMA_signal_158 ;
    wire new_AGEMA_signal_159 ;
    wire new_AGEMA_signal_160 ;
    wire new_AGEMA_signal_161 ;
    wire new_AGEMA_signal_162 ;
    wire new_AGEMA_signal_163 ;
    wire new_AGEMA_signal_164 ;
    wire new_AGEMA_signal_165 ;
    wire new_AGEMA_signal_166 ;
    wire new_AGEMA_signal_167 ;
    wire new_AGEMA_signal_168 ;
    wire new_AGEMA_signal_169 ;
    wire new_AGEMA_signal_170 ;

    /* cells in depth 0 */
    not_masked #(.security_order(1), .pipeline(1)) U50 ( .a ({SI_s1[0], SI_s0[0]}), .b ({new_AGEMA_signal_35, n53}) ) ;
    not_masked #(.security_order(1), .pipeline(1)) U53 ( .a ({SI_s1[3], SI_s0[3]}), .b ({new_AGEMA_signal_40, n52}) ) ;
    not_masked #(.security_order(1), .pipeline(1)) U59 ( .a ({SI_s1[2], SI_s0[2]}), .b ({new_AGEMA_signal_42, n51}) ) ;

    /* cells in depth 1 */
    buf_clk new_AGEMA_reg_buffer_23 ( .C ( clk ), .D ( SI_s0[3] ), .Q ( new_AGEMA_signal_87 ) ) ;
    buf_clk new_AGEMA_reg_buffer_25 ( .C ( clk ), .D ( SI_s1[3] ), .Q ( new_AGEMA_signal_89 ) ) ;
    buf_clk new_AGEMA_reg_buffer_27 ( .C ( clk ), .D ( n53 ), .Q ( new_AGEMA_signal_91 ) ) ;
    buf_clk new_AGEMA_reg_buffer_29 ( .C ( clk ), .D ( new_AGEMA_signal_35 ), .Q ( new_AGEMA_signal_93 ) ) ;
    buf_clk new_AGEMA_reg_buffer_31 ( .C ( clk ), .D ( SI_s0[1] ), .Q ( new_AGEMA_signal_95 ) ) ;
    buf_clk new_AGEMA_reg_buffer_33 ( .C ( clk ), .D ( SI_s1[1] ), .Q ( new_AGEMA_signal_97 ) ) ;
    buf_clk new_AGEMA_reg_buffer_35 ( .C ( clk ), .D ( SI_s0[2] ), .Q ( new_AGEMA_signal_99 ) ) ;
    buf_clk new_AGEMA_reg_buffer_37 ( .C ( clk ), .D ( SI_s1[2] ), .Q ( new_AGEMA_signal_101 ) ) ;

    /* cells in depth 2 */
    nor_HPC1 #(.security_order(1), .pipeline(1)) U51 ( .ina ({SI_s1[1], SI_s0[1]}), .inb ({SI_s1[2], SI_s0[2]}), .clk ( clk ), .rnd ({Fresh[1], Fresh[0]}), .outt ({new_AGEMA_signal_38, n40}) ) ;
    xor_HPC1 #(.security_order(1), .pipeline(1)) U52 ( .a ({new_AGEMA_signal_38, n40}), .b ({new_AGEMA_signal_90, new_AGEMA_signal_88}), .c ({new_AGEMA_signal_44, N12}) ) ;
    nor_HPC1 #(.security_order(1), .pipeline(1)) U54 ( .ina ({SI_s1[2], SI_s0[2]}), .inb ({new_AGEMA_signal_40, n52}), .clk ( clk ), .rnd ({Fresh[3], Fresh[2]}), .outt ({new_AGEMA_signal_45, n41}) ) ;
    xnor_HPC1 #(.security_order(1), .pipeline(1)) U55 ( .a ({new_AGEMA_signal_94, new_AGEMA_signal_92}), .b ({new_AGEMA_signal_45, n41}), .c ({new_AGEMA_signal_51, n42}) ) ;
    nor_HPC1 #(.security_order(1), .pipeline(1)) U57 ( .ina ({SI_s1[0], SI_s0[0]}), .inb ({SI_s1[3], SI_s0[3]}), .clk ( clk ), .rnd ({Fresh[5], Fresh[4]}), .outt ({new_AGEMA_signal_41, n43}) ) ;
    nor_HPC1 #(.security_order(1), .pipeline(1)) U60 ( .ina ({new_AGEMA_signal_42, n51}), .inb ({new_AGEMA_signal_35, n53}), .clk ( clk ), .rnd ({Fresh[7], Fresh[6]}), .outt ({new_AGEMA_signal_47, n45}) ) ;
    nor_HPC1 #(.security_order(1), .pipeline(1)) U61 ( .ina ({SI_s1[2], SI_s0[2]}), .inb ({SI_s1[0], SI_s0[0]}), .clk ( clk ), .rnd ({Fresh[9], Fresh[8]}), .outt ({new_AGEMA_signal_43, n48}) ) ;
    nand_HPC1 #(.security_order(1), .pipeline(1)) U67 ( .ina ({new_AGEMA_signal_40, n52}), .inb ({new_AGEMA_signal_42, n51}), .clk ( clk ), .rnd ({Fresh[11], Fresh[10]}), .outt ({new_AGEMA_signal_50, n54}) ) ;
    xor_HPC1 #(.security_order(1), .pipeline(1)) U68 ( .a ({new_AGEMA_signal_50, n54}), .b ({new_AGEMA_signal_94, new_AGEMA_signal_92}), .c ({new_AGEMA_signal_53, N9}) ) ;
    buf_clk new_AGEMA_reg_buffer_24 ( .C ( clk ), .D ( new_AGEMA_signal_87 ), .Q ( new_AGEMA_signal_88 ) ) ;
    buf_clk new_AGEMA_reg_buffer_26 ( .C ( clk ), .D ( new_AGEMA_signal_89 ), .Q ( new_AGEMA_signal_90 ) ) ;
    buf_clk new_AGEMA_reg_buffer_28 ( .C ( clk ), .D ( new_AGEMA_signal_91 ), .Q ( new_AGEMA_signal_92 ) ) ;
    buf_clk new_AGEMA_reg_buffer_30 ( .C ( clk ), .D ( new_AGEMA_signal_93 ), .Q ( new_AGEMA_signal_94 ) ) ;
    buf_clk new_AGEMA_reg_buffer_32 ( .C ( clk ), .D ( new_AGEMA_signal_95 ), .Q ( new_AGEMA_signal_96 ) ) ;
    buf_clk new_AGEMA_reg_buffer_34 ( .C ( clk ), .D ( new_AGEMA_signal_97 ), .Q ( new_AGEMA_signal_98 ) ) ;
    buf_clk new_AGEMA_reg_buffer_36 ( .C ( clk ), .D ( new_AGEMA_signal_99 ), .Q ( new_AGEMA_signal_100 ) ) ;
    buf_clk new_AGEMA_reg_buffer_38 ( .C ( clk ), .D ( new_AGEMA_signal_101 ), .Q ( new_AGEMA_signal_102 ) ) ;

    /* cells in depth 3 */
    buf_clk new_AGEMA_reg_buffer_39 ( .C ( clk ), .D ( n45 ), .Q ( new_AGEMA_signal_103 ) ) ;
    buf_clk new_AGEMA_reg_buffer_41 ( .C ( clk ), .D ( new_AGEMA_signal_47 ), .Q ( new_AGEMA_signal_105 ) ) ;
    buf_clk new_AGEMA_reg_buffer_43 ( .C ( clk ), .D ( new_AGEMA_signal_96 ), .Q ( new_AGEMA_signal_107 ) ) ;
    buf_clk new_AGEMA_reg_buffer_47 ( .C ( clk ), .D ( new_AGEMA_signal_98 ), .Q ( new_AGEMA_signal_111 ) ) ;
    buf_clk new_AGEMA_reg_buffer_63 ( .C ( clk ), .D ( N9 ), .Q ( new_AGEMA_signal_127 ) ) ;
    buf_clk new_AGEMA_reg_buffer_71 ( .C ( clk ), .D ( new_AGEMA_signal_53 ), .Q ( new_AGEMA_signal_135 ) ) ;
    buf_clk new_AGEMA_reg_buffer_79 ( .C ( clk ), .D ( N12 ), .Q ( new_AGEMA_signal_143 ) ) ;
    buf_clk new_AGEMA_reg_buffer_87 ( .C ( clk ), .D ( new_AGEMA_signal_44 ), .Q ( new_AGEMA_signal_151 ) ) ;

    /* cells in depth 4 */
    mux2_HPC1 #(.security_order(1), .pipeline(1)) U56 ( .ins ({new_AGEMA_signal_98, new_AGEMA_signal_96}), .inb ({new_AGEMA_signal_51, n42}), .ina ({new_AGEMA_signal_102, new_AGEMA_signal_100}), .clk ( clk ), .rnd ({Fresh[13], Fresh[12]}), .outt ({new_AGEMA_signal_54, N19}) ) ;
    nand_HPC1 #(.security_order(1), .pipeline(1)) U58 ( .ina ({new_AGEMA_signal_41, n43}), .inb ({new_AGEMA_signal_102, new_AGEMA_signal_100}), .clk ( clk ), .rnd ({Fresh[15], Fresh[14]}), .outt ({new_AGEMA_signal_46, n47}) ) ;
    or_HPC1 #(.security_order(1), .pipeline(1)) U62 ( .ina ({new_AGEMA_signal_90, new_AGEMA_signal_88}), .inb ({new_AGEMA_signal_43, n48}), .clk ( clk ), .rnd ({Fresh[17], Fresh[16]}), .outt ({new_AGEMA_signal_48, n44}) ) ;
    nand_HPC1 #(.security_order(1), .pipeline(1)) U65 ( .ina ({new_AGEMA_signal_90, new_AGEMA_signal_88}), .inb ({new_AGEMA_signal_43, n48}), .clk ( clk ), .rnd ({Fresh[19], Fresh[18]}), .outt ({new_AGEMA_signal_49, n49}) ) ;
    buf_clk new_AGEMA_reg_buffer_40 ( .C ( clk ), .D ( new_AGEMA_signal_103 ), .Q ( new_AGEMA_signal_104 ) ) ;
    buf_clk new_AGEMA_reg_buffer_42 ( .C ( clk ), .D ( new_AGEMA_signal_105 ), .Q ( new_AGEMA_signal_106 ) ) ;
    buf_clk new_AGEMA_reg_buffer_44 ( .C ( clk ), .D ( new_AGEMA_signal_107 ), .Q ( new_AGEMA_signal_108 ) ) ;
    buf_clk new_AGEMA_reg_buffer_48 ( .C ( clk ), .D ( new_AGEMA_signal_111 ), .Q ( new_AGEMA_signal_112 ) ) ;
    buf_clk new_AGEMA_reg_buffer_64 ( .C ( clk ), .D ( new_AGEMA_signal_127 ), .Q ( new_AGEMA_signal_128 ) ) ;
    buf_clk new_AGEMA_reg_buffer_72 ( .C ( clk ), .D ( new_AGEMA_signal_135 ), .Q ( new_AGEMA_signal_136 ) ) ;
    buf_clk new_AGEMA_reg_buffer_80 ( .C ( clk ), .D ( new_AGEMA_signal_143 ), .Q ( new_AGEMA_signal_144 ) ) ;
    buf_clk new_AGEMA_reg_buffer_88 ( .C ( clk ), .D ( new_AGEMA_signal_151 ), .Q ( new_AGEMA_signal_152 ) ) ;

    /* cells in depth 5 */
    buf_clk new_AGEMA_reg_buffer_45 ( .C ( clk ), .D ( new_AGEMA_signal_108 ), .Q ( new_AGEMA_signal_109 ) ) ;
    buf_clk new_AGEMA_reg_buffer_49 ( .C ( clk ), .D ( new_AGEMA_signal_112 ), .Q ( new_AGEMA_signal_113 ) ) ;
    buf_clk new_AGEMA_reg_buffer_51 ( .C ( clk ), .D ( n47 ), .Q ( new_AGEMA_signal_115 ) ) ;
    buf_clk new_AGEMA_reg_buffer_53 ( .C ( clk ), .D ( new_AGEMA_signal_46 ), .Q ( new_AGEMA_signal_117 ) ) ;
    buf_clk new_AGEMA_reg_buffer_55 ( .C ( clk ), .D ( n49 ), .Q ( new_AGEMA_signal_119 ) ) ;
    buf_clk new_AGEMA_reg_buffer_59 ( .C ( clk ), .D ( new_AGEMA_signal_49 ), .Q ( new_AGEMA_signal_123 ) ) ;
    buf_clk new_AGEMA_reg_buffer_65 ( .C ( clk ), .D ( new_AGEMA_signal_128 ), .Q ( new_AGEMA_signal_129 ) ) ;
    buf_clk new_AGEMA_reg_buffer_73 ( .C ( clk ), .D ( new_AGEMA_signal_136 ), .Q ( new_AGEMA_signal_137 ) ) ;
    buf_clk new_AGEMA_reg_buffer_81 ( .C ( clk ), .D ( new_AGEMA_signal_144 ), .Q ( new_AGEMA_signal_145 ) ) ;
    buf_clk new_AGEMA_reg_buffer_89 ( .C ( clk ), .D ( new_AGEMA_signal_152 ), .Q ( new_AGEMA_signal_153 ) ) ;
    buf_clk new_AGEMA_reg_buffer_95 ( .C ( clk ), .D ( N19 ), .Q ( new_AGEMA_signal_159 ) ) ;
    buf_clk new_AGEMA_reg_buffer_101 ( .C ( clk ), .D ( new_AGEMA_signal_54 ), .Q ( new_AGEMA_signal_165 ) ) ;

    /* cells in depth 6 */
    nor_HPC1 #(.security_order(1), .pipeline(1)) U63 ( .ina ({new_AGEMA_signal_106, new_AGEMA_signal_104}), .inb ({new_AGEMA_signal_48, n44}), .clk ( clk ), .rnd ({Fresh[21], Fresh[20]}), .outt ({new_AGEMA_signal_52, n46}) ) ;
    buf_clk new_AGEMA_reg_buffer_46 ( .C ( clk ), .D ( new_AGEMA_signal_109 ), .Q ( new_AGEMA_signal_110 ) ) ;
    buf_clk new_AGEMA_reg_buffer_50 ( .C ( clk ), .D ( new_AGEMA_signal_113 ), .Q ( new_AGEMA_signal_114 ) ) ;
    buf_clk new_AGEMA_reg_buffer_52 ( .C ( clk ), .D ( new_AGEMA_signal_115 ), .Q ( new_AGEMA_signal_116 ) ) ;
    buf_clk new_AGEMA_reg_buffer_54 ( .C ( clk ), .D ( new_AGEMA_signal_117 ), .Q ( new_AGEMA_signal_118 ) ) ;
    buf_clk new_AGEMA_reg_buffer_56 ( .C ( clk ), .D ( new_AGEMA_signal_119 ), .Q ( new_AGEMA_signal_120 ) ) ;
    buf_clk new_AGEMA_reg_buffer_60 ( .C ( clk ), .D ( new_AGEMA_signal_123 ), .Q ( new_AGEMA_signal_124 ) ) ;
    buf_clk new_AGEMA_reg_buffer_66 ( .C ( clk ), .D ( new_AGEMA_signal_129 ), .Q ( new_AGEMA_signal_130 ) ) ;
    buf_clk new_AGEMA_reg_buffer_74 ( .C ( clk ), .D ( new_AGEMA_signal_137 ), .Q ( new_AGEMA_signal_138 ) ) ;
    buf_clk new_AGEMA_reg_buffer_82 ( .C ( clk ), .D ( new_AGEMA_signal_145 ), .Q ( new_AGEMA_signal_146 ) ) ;
    buf_clk new_AGEMA_reg_buffer_90 ( .C ( clk ), .D ( new_AGEMA_signal_153 ), .Q ( new_AGEMA_signal_154 ) ) ;
    buf_clk new_AGEMA_reg_buffer_96 ( .C ( clk ), .D ( new_AGEMA_signal_159 ), .Q ( new_AGEMA_signal_160 ) ) ;
    buf_clk new_AGEMA_reg_buffer_102 ( .C ( clk ), .D ( new_AGEMA_signal_165 ), .Q ( new_AGEMA_signal_166 ) ) ;

    /* cells in depth 7 */
    buf_clk new_AGEMA_reg_buffer_57 ( .C ( clk ), .D ( new_AGEMA_signal_120 ), .Q ( new_AGEMA_signal_121 ) ) ;
    buf_clk new_AGEMA_reg_buffer_61 ( .C ( clk ), .D ( new_AGEMA_signal_124 ), .Q ( new_AGEMA_signal_125 ) ) ;
    buf_clk new_AGEMA_reg_buffer_67 ( .C ( clk ), .D ( new_AGEMA_signal_130 ), .Q ( new_AGEMA_signal_131 ) ) ;
    buf_clk new_AGEMA_reg_buffer_75 ( .C ( clk ), .D ( new_AGEMA_signal_138 ), .Q ( new_AGEMA_signal_139 ) ) ;
    buf_clk new_AGEMA_reg_buffer_83 ( .C ( clk ), .D ( new_AGEMA_signal_146 ), .Q ( new_AGEMA_signal_147 ) ) ;
    buf_clk new_AGEMA_reg_buffer_91 ( .C ( clk ), .D ( new_AGEMA_signal_154 ), .Q ( new_AGEMA_signal_155 ) ) ;
    buf_clk new_AGEMA_reg_buffer_97 ( .C ( clk ), .D ( new_AGEMA_signal_160 ), .Q ( new_AGEMA_signal_161 ) ) ;
    buf_clk new_AGEMA_reg_buffer_103 ( .C ( clk ), .D ( new_AGEMA_signal_166 ), .Q ( new_AGEMA_signal_167 ) ) ;

    /* cells in depth 8 */
    mux2_HPC1 #(.security_order(1), .pipeline(1)) U64 ( .ins ({new_AGEMA_signal_114, new_AGEMA_signal_110}), .inb ({new_AGEMA_signal_118, new_AGEMA_signal_116}), .ina ({new_AGEMA_signal_52, n46}), .clk ( clk ), .rnd ({Fresh[23], Fresh[22]}), .outt ({new_AGEMA_signal_55, n50}) ) ;
    buf_clk new_AGEMA_reg_buffer_58 ( .C ( clk ), .D ( new_AGEMA_signal_121 ), .Q ( new_AGEMA_signal_122 ) ) ;
    buf_clk new_AGEMA_reg_buffer_62 ( .C ( clk ), .D ( new_AGEMA_signal_125 ), .Q ( new_AGEMA_signal_126 ) ) ;
    buf_clk new_AGEMA_reg_buffer_68 ( .C ( clk ), .D ( new_AGEMA_signal_131 ), .Q ( new_AGEMA_signal_132 ) ) ;
    buf_clk new_AGEMA_reg_buffer_76 ( .C ( clk ), .D ( new_AGEMA_signal_139 ), .Q ( new_AGEMA_signal_140 ) ) ;
    buf_clk new_AGEMA_reg_buffer_84 ( .C ( clk ), .D ( new_AGEMA_signal_147 ), .Q ( new_AGEMA_signal_148 ) ) ;
    buf_clk new_AGEMA_reg_buffer_92 ( .C ( clk ), .D ( new_AGEMA_signal_155 ), .Q ( new_AGEMA_signal_156 ) ) ;
    buf_clk new_AGEMA_reg_buffer_98 ( .C ( clk ), .D ( new_AGEMA_signal_161 ), .Q ( new_AGEMA_signal_162 ) ) ;
    buf_clk new_AGEMA_reg_buffer_104 ( .C ( clk ), .D ( new_AGEMA_signal_167 ), .Q ( new_AGEMA_signal_168 ) ) ;

    /* cells in depth 9 */
    buf_clk new_AGEMA_reg_buffer_69 ( .C ( clk ), .D ( new_AGEMA_signal_132 ), .Q ( new_AGEMA_signal_133 ) ) ;
    buf_clk new_AGEMA_reg_buffer_77 ( .C ( clk ), .D ( new_AGEMA_signal_140 ), .Q ( new_AGEMA_signal_141 ) ) ;
    buf_clk new_AGEMA_reg_buffer_85 ( .C ( clk ), .D ( new_AGEMA_signal_148 ), .Q ( new_AGEMA_signal_149 ) ) ;
    buf_clk new_AGEMA_reg_buffer_93 ( .C ( clk ), .D ( new_AGEMA_signal_156 ), .Q ( new_AGEMA_signal_157 ) ) ;
    buf_clk new_AGEMA_reg_buffer_99 ( .C ( clk ), .D ( new_AGEMA_signal_162 ), .Q ( new_AGEMA_signal_163 ) ) ;
    buf_clk new_AGEMA_reg_buffer_105 ( .C ( clk ), .D ( new_AGEMA_signal_168 ), .Q ( new_AGEMA_signal_169 ) ) ;

    /* cells in depth 10 */
    nand_HPC1 #(.security_order(1), .pipeline(1)) U66 ( .ina ({new_AGEMA_signal_55, n50}), .inb ({new_AGEMA_signal_126, new_AGEMA_signal_122}), .clk ( clk ), .rnd ({Fresh[25], Fresh[24]}), .outt ({new_AGEMA_signal_56, N27}) ) ;
    buf_clk new_AGEMA_reg_buffer_70 ( .C ( clk ), .D ( new_AGEMA_signal_133 ), .Q ( new_AGEMA_signal_134 ) ) ;
    buf_clk new_AGEMA_reg_buffer_78 ( .C ( clk ), .D ( new_AGEMA_signal_141 ), .Q ( new_AGEMA_signal_142 ) ) ;
    buf_clk new_AGEMA_reg_buffer_86 ( .C ( clk ), .D ( new_AGEMA_signal_149 ), .Q ( new_AGEMA_signal_150 ) ) ;
    buf_clk new_AGEMA_reg_buffer_94 ( .C ( clk ), .D ( new_AGEMA_signal_157 ), .Q ( new_AGEMA_signal_158 ) ) ;
    buf_clk new_AGEMA_reg_buffer_100 ( .C ( clk ), .D ( new_AGEMA_signal_163 ), .Q ( new_AGEMA_signal_164 ) ) ;
    buf_clk new_AGEMA_reg_buffer_106 ( .C ( clk ), .D ( new_AGEMA_signal_169 ), .Q ( new_AGEMA_signal_170 ) ) ;

    /* register cells */
    reg_masked #(.security_order(1), .pipeline(1)) SO_reg_3_ ( .clk ( clk ), .D ({new_AGEMA_signal_142, new_AGEMA_signal_134}), .Q ({SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(1), .pipeline(1)) SO_reg_2_ ( .clk ( clk ), .D ({new_AGEMA_signal_158, new_AGEMA_signal_150}), .Q ({SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(1), .pipeline(1)) SO_reg_1_ ( .clk ( clk ), .D ({new_AGEMA_signal_170, new_AGEMA_signal_164}), .Q ({SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(1), .pipeline(1)) SO_reg_0_ ( .clk ( clk ), .D ({new_AGEMA_signal_56, N27}), .Q ({SO_s1[0], SO_s0[0]}) ) ;
endmodule
