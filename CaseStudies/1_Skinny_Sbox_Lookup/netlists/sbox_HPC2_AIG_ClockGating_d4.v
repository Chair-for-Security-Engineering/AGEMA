/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* clock gating is added to the circuit, the latency increased 12 time(s)  */

module sbox_HPC2_AIG_ClockGating_d4 (SI_s0, clk, SI_s1, SI_s2, SI_s3, SI_s4, Fresh, rst, SO_s0, SO_s1, SO_s2, SO_s3, SO_s4, Synch);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [3:0] SI_s2 ;
    input [3:0] SI_s3 ;
    input [3:0] SI_s4 ;
    input rst ;
    input [169:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
    output [3:0] SO_s2 ;
    output [3:0] SO_s3 ;
    output [3:0] SO_s4 ;
    output Synch ;
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
    wire signal_51 ;
    wire signal_52 ;
    wire signal_53 ;
    wire signal_54 ;
    wire signal_55 ;
    wire signal_56 ;
    wire signal_57 ;
    wire signal_58 ;
    wire signal_59 ;
    wire signal_60 ;
    wire signal_61 ;
    wire signal_62 ;
    wire signal_63 ;
    wire signal_64 ;
    wire signal_69 ;
    wire signal_70 ;
    wire signal_71 ;
    wire signal_72 ;
    wire signal_77 ;
    wire signal_78 ;
    wire signal_79 ;
    wire signal_80 ;
    wire signal_85 ;
    wire signal_86 ;
    wire signal_87 ;
    wire signal_88 ;
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
    wire signal_136 ;
    wire signal_137 ;
    wire signal_138 ;
    wire signal_139 ;
    wire signal_140 ;
    wire signal_141 ;
    wire signal_142 ;
    wire signal_143 ;
    wire signal_144 ;
    wire signal_145 ;
    wire signal_146 ;
    wire signal_147 ;
    wire signal_148 ;
    wire signal_149 ;
    wire signal_150 ;
    wire signal_151 ;
    wire signal_152 ;
    wire signal_153 ;
    wire signal_154 ;
    wire signal_155 ;
    wire signal_156 ;
    wire signal_157 ;
    wire signal_158 ;
    wire signal_159 ;
    wire signal_160 ;
    wire signal_161 ;
    wire signal_162 ;
    wire signal_163 ;
    wire signal_164 ;
    wire signal_165 ;
    wire signal_166 ;
    wire signal_167 ;
    wire signal_168 ;
    wire signal_169 ;
    wire signal_170 ;
    wire signal_171 ;
    wire signal_172 ;
    wire signal_173 ;
    wire signal_174 ;
    wire signal_175 ;
    wire signal_176 ;
    wire signal_177 ;
    wire signal_178 ;
    wire signal_179 ;
    wire signal_180 ;
    wire signal_181 ;
    wire signal_182 ;
    wire signal_183 ;
    wire signal_184 ;
    wire signal_185 ;
    wire signal_186 ;
    wire signal_187 ;
    wire signal_188 ;
    wire signal_189 ;
    wire signal_190 ;
    wire signal_191 ;
    wire signal_192 ;
    wire signal_193 ;
    wire signal_194 ;
    wire signal_195 ;
    wire signal_196 ;
    wire signal_197 ;
    wire signal_198 ;
    wire signal_199 ;
    wire signal_200 ;
    wire signal_201 ;
    wire signal_202 ;
    wire signal_203 ;
    wire signal_204 ;
    wire signal_205 ;
    wire signal_206 ;
    wire signal_207 ;
    wire signal_208 ;
    wire signal_209 ;
    wire signal_210 ;
    wire signal_211 ;
    wire signal_212 ;
    wire signal_213 ;
    wire signal_214 ;
    wire signal_215 ;
    wire signal_216 ;
    wire signal_217 ;
    wire signal_218 ;
    wire signal_219 ;
    wire signal_220 ;
    wire signal_408 ;

    /* cells in depth 0 */
    not_masked #(.security_order(4), .pipeline(0)) cell_23 ( .a ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_72, signal_71, signal_70, signal_69, signal_34}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_24 ( .a ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_80, signal_79, signal_78, signal_77, signal_35}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_25 ( .a ({SI_s4[1], SI_s3[1], SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_88, signal_87, signal_86, signal_85, signal_36}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_26 ( .a ({SI_s4[0], SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_96, signal_95, signal_94, signal_93, signal_37}) ) ;
    ClockGatingController #(13) cell_58 ( .clk ( clk ), .rst ( rst ), .GatedClk ( signal_408 ), .Synch ( Synch ) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_27 ( .a ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({SI_s4[0], SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .clk ( clk ), .r ({Fresh[9], Fresh[8], Fresh[7], Fresh[6], Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .c ({signal_100, signal_99, signal_98, signal_97, signal_38}) ) ;
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_28 ( .a ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({SI_s4[1], SI_s3[1], SI_s2[1], SI_s1[1], SI_s0[1]}), .clk ( clk ), .r ({Fresh[19], Fresh[18], Fresh[17], Fresh[16], Fresh[15], Fresh[14], Fresh[13], Fresh[12], Fresh[11], Fresh[10]}), .c ({signal_104, signal_103, signal_102, signal_101, signal_39}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_29 ( .a ({signal_100, signal_99, signal_98, signal_97, signal_38}), .b ({signal_108, signal_107, signal_106, signal_105, signal_40}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_30 ( .a ({signal_104, signal_103, signal_102, signal_101, signal_39}), .b ({signal_112, signal_111, signal_110, signal_109, signal_41}) ) ;
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_31 ( .a ({signal_80, signal_79, signal_78, signal_77, signal_35}), .b ({signal_88, signal_87, signal_86, signal_85, signal_36}), .clk ( clk ), .r ({Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25], Fresh[24], Fresh[23], Fresh[22], Fresh[21], Fresh[20]}), .c ({signal_116, signal_115, signal_114, signal_113, signal_42}) ) ;
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_32 ( .a ({signal_72, signal_71, signal_70, signal_69, signal_34}), .b ({signal_96, signal_95, signal_94, signal_93, signal_37}), .clk ( clk ), .r ({Fresh[39], Fresh[38], Fresh[37], Fresh[36], Fresh[35], Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30]}), .c ({signal_120, signal_119, signal_118, signal_117, signal_43}) ) ;
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_33 ( .a ({signal_80, signal_79, signal_78, signal_77, signal_35}), .b ({signal_96, signal_95, signal_94, signal_93, signal_37}), .clk ( clk ), .r ({Fresh[49], Fresh[48], Fresh[47], Fresh[46], Fresh[45], Fresh[44], Fresh[43], Fresh[42], Fresh[41], Fresh[40]}), .c ({signal_124, signal_123, signal_122, signal_121, signal_44}) ) ;
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_34 ( .a ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_80, signal_79, signal_78, signal_77, signal_35}), .clk ( clk ), .r ({Fresh[59], Fresh[58], Fresh[57], Fresh[56], Fresh[55], Fresh[54], Fresh[53], Fresh[52], Fresh[51], Fresh[50]}), .c ({signal_128, signal_127, signal_126, signal_125, signal_45}) ) ;
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_35 ( .a ({signal_72, signal_71, signal_70, signal_69, signal_34}), .b ({signal_80, signal_79, signal_78, signal_77, signal_35}), .clk ( clk ), .r ({Fresh[69], Fresh[68], Fresh[67], Fresh[66], Fresh[65], Fresh[64], Fresh[63], Fresh[62], Fresh[61], Fresh[60]}), .c ({signal_132, signal_131, signal_130, signal_129, signal_46}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_36 ( .a ({signal_124, signal_123, signal_122, signal_121, signal_44}), .b ({signal_136, signal_135, signal_134, signal_133, signal_47}) ) ;
    xor_HPC2 #(.security_order(4), .pipeline(0)) cell_39 ( .a ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_116, signal_115, signal_114, signal_113, signal_42}), .c ({signal_148, signal_147, signal_146, signal_145, signal_16}) ) ;
    xor_HPC2 #(.security_order(4), .pipeline(0)) cell_40 ( .a ({SI_s4[0], SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_128, signal_127, signal_126, signal_125, signal_45}), .c ({signal_152, signal_151, signal_150, signal_149, signal_50}) ) ;
    xor_HPC2 #(.security_order(4), .pipeline(0)) cell_41 ( .a ({SI_s4[0], SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_132, signal_131, signal_130, signal_129, signal_46}), .c ({signal_156, signal_155, signal_154, signal_153, signal_15}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_37 ( .a ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_120, signal_119, signal_118, signal_117, signal_43}), .clk ( clk ), .r ({Fresh[79], Fresh[78], Fresh[77], Fresh[76], Fresh[75], Fresh[74], Fresh[73], Fresh[72], Fresh[71], Fresh[70]}), .c ({signal_140, signal_139, signal_138, signal_137, signal_48}) ) ;
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_38 ( .a ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_124, signal_123, signal_122, signal_121, signal_44}), .clk ( clk ), .r ({Fresh[89], Fresh[88], Fresh[87], Fresh[86], Fresh[85], Fresh[84], Fresh[83], Fresh[82], Fresh[81], Fresh[80]}), .c ({signal_144, signal_143, signal_142, signal_141, signal_49}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_42 ( .a ({signal_140, signal_139, signal_138, signal_137, signal_48}), .b ({signal_160, signal_159, signal_158, signal_157, signal_51}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_43 ( .a ({signal_144, signal_143, signal_142, signal_141, signal_49}), .b ({signal_164, signal_163, signal_162, signal_161, signal_52}) ) ;
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_44 ( .a ({signal_72, signal_71, signal_70, signal_69, signal_34}), .b ({signal_136, signal_135, signal_134, signal_133, signal_47}), .clk ( clk ), .r ({Fresh[99], Fresh[98], Fresh[97], Fresh[96], Fresh[95], Fresh[94], Fresh[93], Fresh[92], Fresh[91], Fresh[90]}), .c ({signal_168, signal_167, signal_166, signal_165, signal_53}) ) ;
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_45 ( .a ({signal_88, signal_87, signal_86, signal_85, signal_36}), .b ({signal_152, signal_151, signal_150, signal_149, signal_50}), .clk ( clk ), .r ({Fresh[109], Fresh[108], Fresh[107], Fresh[106], Fresh[105], Fresh[104], Fresh[103], Fresh[102], Fresh[101], Fresh[100]}), .c ({signal_172, signal_171, signal_170, signal_169, signal_54}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_46 ( .a ({signal_172, signal_171, signal_170, signal_169, signal_54}), .b ({signal_176, signal_175, signal_174, signal_173, signal_55}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_47 ( .a ({signal_108, signal_107, signal_106, signal_105, signal_40}), .b ({signal_168, signal_167, signal_166, signal_165, signal_53}), .clk ( clk ), .r ({Fresh[119], Fresh[118], Fresh[117], Fresh[116], Fresh[115], Fresh[114], Fresh[113], Fresh[112], Fresh[111], Fresh[110]}), .c ({signal_180, signal_179, signal_178, signal_177, signal_56}) ) ;
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_48 ( .a ({signal_88, signal_87, signal_86, signal_85, signal_36}), .b ({signal_160, signal_159, signal_158, signal_157, signal_51}), .clk ( clk ), .r ({Fresh[129], Fresh[128], Fresh[127], Fresh[126], Fresh[125], Fresh[124], Fresh[123], Fresh[122], Fresh[121], Fresh[120]}), .c ({signal_184, signal_183, signal_182, signal_181, signal_57}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_49 ( .a ({signal_184, signal_183, signal_182, signal_181, signal_57}), .b ({signal_188, signal_187, signal_186, signal_185, signal_58}) ) ;
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_50 ( .a ({signal_176, signal_175, signal_174, signal_173, signal_55}), .b ({signal_112, signal_111, signal_110, signal_109, signal_41}), .clk ( clk ), .r ({Fresh[139], Fresh[138], Fresh[137], Fresh[136], Fresh[135], Fresh[134], Fresh[133], Fresh[132], Fresh[131], Fresh[130]}), .c ({signal_192, signal_191, signal_190, signal_189, signal_59}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_52 ( .a ({signal_192, signal_191, signal_190, signal_189, signal_59}), .b ({signal_200, signal_199, signal_198, signal_197, signal_17}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_51 ( .a ({SI_s4[1], SI_s3[1], SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_180, signal_179, signal_178, signal_177, signal_56}), .clk ( clk ), .r ({Fresh[149], Fresh[148], Fresh[147], Fresh[146], Fresh[145], Fresh[144], Fresh[143], Fresh[142], Fresh[141], Fresh[140]}), .c ({signal_196, signal_195, signal_194, signal_193, signal_60}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_53 ( .a ({signal_196, signal_195, signal_194, signal_193, signal_60}), .b ({signal_204, signal_203, signal_202, signal_201, signal_61}) ) ;

    /* cells in depth 9 */

    /* cells in depth 10 */
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_54 ( .a ({signal_188, signal_187, signal_186, signal_185, signal_58}), .b ({signal_204, signal_203, signal_202, signal_201, signal_61}), .clk ( clk ), .r ({Fresh[159], Fresh[158], Fresh[157], Fresh[156], Fresh[155], Fresh[154], Fresh[153], Fresh[152], Fresh[151], Fresh[150]}), .c ({signal_208, signal_207, signal_206, signal_205, signal_62}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_55 ( .a ({signal_208, signal_207, signal_206, signal_205, signal_62}), .b ({signal_212, signal_211, signal_210, signal_209, signal_63}) ) ;

    /* cells in depth 11 */

    /* cells in depth 12 */
    and_HPC2 #(.security_order(4), .pipeline(0)) cell_56 ( .a ({signal_164, signal_163, signal_162, signal_161, signal_52}), .b ({signal_212, signal_211, signal_210, signal_209, signal_63}), .clk ( clk ), .r ({Fresh[169], Fresh[168], Fresh[167], Fresh[166], Fresh[165], Fresh[164], Fresh[163], Fresh[162], Fresh[161], Fresh[160]}), .c ({signal_216, signal_215, signal_214, signal_213, signal_64}) ) ;
    not_masked #(.security_order(4), .pipeline(0)) cell_57 ( .a ({signal_216, signal_215, signal_214, signal_213, signal_64}), .b ({signal_220, signal_219, signal_218, signal_217, signal_18}) ) ;

    /* register cells */
    reg_masked #(.security_order(4), .pipeline(0)) cell_0 ( .clk ( signal_408 ), .D ({signal_156, signal_155, signal_154, signal_153, signal_15}), .Q ({SO_s4[3], SO_s3[3], SO_s2[3], SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(4), .pipeline(0)) cell_1 ( .clk ( signal_408 ), .D ({signal_148, signal_147, signal_146, signal_145, signal_16}), .Q ({SO_s4[2], SO_s3[2], SO_s2[2], SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(4), .pipeline(0)) cell_2 ( .clk ( signal_408 ), .D ({signal_200, signal_199, signal_198, signal_197, signal_17}), .Q ({SO_s4[1], SO_s3[1], SO_s2[1], SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(4), .pipeline(0)) cell_3 ( .clk ( signal_408 ), .D ({signal_220, signal_219, signal_218, signal_217, signal_18}), .Q ({SO_s4[0], SO_s3[0], SO_s2[0], SO_s1[0], SO_s0[0]}) ) ;
endmodule
