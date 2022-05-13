/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* 8 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 9 register stage(s) in total */

module sbox_HPC2_BDDcudd_Pipeline_d2 (SI_s0, clk, SI_s1, SI_s2, Fresh, SO_s0, SO_s1, SO_s2);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [3:0] SI_s2 ;
    input [50:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
    output [3:0] SO_s2 ;
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
    wire signal_49 ;
    wire signal_50 ;
    wire signal_51 ;
    wire signal_52 ;
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
    wire signal_65 ;
    wire signal_66 ;
    wire signal_67 ;
    wire signal_68 ;
    wire signal_69 ;
    wire signal_70 ;
    wire signal_73 ;
    wire signal_74 ;
    wire signal_75 ;
    wire signal_76 ;
    wire signal_77 ;
    wire signal_78 ;
    wire signal_81 ;
    wire signal_82 ;
    wire signal_83 ;
    wire signal_84 ;
    wire signal_85 ;
    wire signal_86 ;
    wire signal_87 ;
    wire signal_88 ;
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

    /* cells in depth 0 */

    /* cells in depth 1 */
    buf_clk cell_40 ( .C ( clk ), .D ( SI_s0[2] ), .Q ( signal_148 ) ) ;
    buf_clk cell_42 ( .C ( clk ), .D ( SI_s1[2] ), .Q ( signal_150 ) ) ;
    buf_clk cell_44 ( .C ( clk ), .D ( SI_s2[2] ), .Q ( signal_152 ) ) ;
    buf_clk cell_46 ( .C ( clk ), .D ( SI_s0[0] ), .Q ( signal_154 ) ) ;
    buf_clk cell_50 ( .C ( clk ), .D ( SI_s1[0] ), .Q ( signal_158 ) ) ;
    buf_clk cell_54 ( .C ( clk ), .D ( SI_s2[0] ), .Q ( signal_162 ) ) ;
    buf_clk cell_58 ( .C ( clk ), .D ( SI_s0[1] ), .Q ( signal_166 ) ) ;
    buf_clk cell_62 ( .C ( clk ), .D ( SI_s1[1] ), .Q ( signal_170 ) ) ;
    buf_clk cell_66 ( .C ( clk ), .D ( SI_s2[1] ), .Q ( signal_174 ) ) ;

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_23 ( .s ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({1'b0, 1'b0, 1'b1}), .a ({1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[2], Fresh[1], Fresh[0]}), .c ({signal_50, signal_49, signal_34}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_24 ( .s ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[5], Fresh[4], Fresh[3]}), .c ({signal_52, signal_51, signal_35}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_25 ( .s ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[8], Fresh[7], Fresh[6]}), .c ({signal_56, signal_55, signal_36}) ) ;
    buf_clk cell_41 ( .C ( clk ), .D ( signal_148 ), .Q ( signal_149 ) ) ;
    buf_clk cell_43 ( .C ( clk ), .D ( signal_150 ), .Q ( signal_151 ) ) ;
    buf_clk cell_45 ( .C ( clk ), .D ( signal_152 ), .Q ( signal_153 ) ) ;
    buf_clk cell_47 ( .C ( clk ), .D ( signal_154 ), .Q ( signal_155 ) ) ;
    buf_clk cell_51 ( .C ( clk ), .D ( signal_158 ), .Q ( signal_159 ) ) ;
    buf_clk cell_55 ( .C ( clk ), .D ( signal_162 ), .Q ( signal_163 ) ) ;
    buf_clk cell_59 ( .C ( clk ), .D ( signal_166 ), .Q ( signal_167 ) ) ;
    buf_clk cell_63 ( .C ( clk ), .D ( signal_170 ), .Q ( signal_171 ) ) ;
    buf_clk cell_67 ( .C ( clk ), .D ( signal_174 ), .Q ( signal_175 ) ) ;

    /* cells in depth 3 */
    buf_clk cell_48 ( .C ( clk ), .D ( signal_155 ), .Q ( signal_156 ) ) ;
    buf_clk cell_52 ( .C ( clk ), .D ( signal_159 ), .Q ( signal_160 ) ) ;
    buf_clk cell_56 ( .C ( clk ), .D ( signal_163 ), .Q ( signal_164 ) ) ;
    buf_clk cell_60 ( .C ( clk ), .D ( signal_167 ), .Q ( signal_168 ) ) ;
    buf_clk cell_64 ( .C ( clk ), .D ( signal_171 ), .Q ( signal_172 ) ) ;
    buf_clk cell_68 ( .C ( clk ), .D ( signal_175 ), .Q ( signal_176 ) ) ;
    buf_clk cell_70 ( .C ( clk ), .D ( signal_35 ), .Q ( signal_178 ) ) ;
    buf_clk cell_72 ( .C ( clk ), .D ( signal_51 ), .Q ( signal_180 ) ) ;
    buf_clk cell_74 ( .C ( clk ), .D ( signal_52 ), .Q ( signal_182 ) ) ;
    buf_clk cell_82 ( .C ( clk ), .D ( signal_36 ), .Q ( signal_190 ) ) ;
    buf_clk cell_86 ( .C ( clk ), .D ( signal_55 ), .Q ( signal_194 ) ) ;
    buf_clk cell_90 ( .C ( clk ), .D ( signal_56 ), .Q ( signal_198 ) ) ;

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_26 ( .s ({signal_153, signal_151, signal_149}), .b ({signal_50, signal_49, signal_34}), .a ({signal_52, signal_51, signal_35}), .clk ( clk ), .r ({Fresh[11], Fresh[10], Fresh[9]}), .c ({signal_58, signal_57, signal_37}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_27 ( .s ({signal_153, signal_151, signal_149}), .b ({1'b0, 1'b0, 1'b1}), .a ({signal_52, signal_51, signal_35}), .clk ( clk ), .r ({Fresh[14], Fresh[13], Fresh[12]}), .c ({signal_60, signal_59, signal_38}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_28 ( .s ({signal_153, signal_151, signal_149}), .b ({signal_50, signal_49, signal_34}), .a ({1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[17], Fresh[16], Fresh[15]}), .c ({signal_62, signal_61, signal_39}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_29 ( .s ({signal_153, signal_151, signal_149}), .b ({signal_52, signal_51, signal_35}), .a ({signal_50, signal_49, signal_34}), .clk ( clk ), .r ({Fresh[20], Fresh[19], Fresh[18]}), .c ({signal_64, signal_63, signal_40}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_30 ( .s ({signal_153, signal_151, signal_149}), .b ({signal_52, signal_51, signal_35}), .a ({1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[23], Fresh[22], Fresh[21]}), .c ({signal_66, signal_65, signal_41}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_31 ( .s ({signal_153, signal_151, signal_149}), .b ({signal_52, signal_51, signal_35}), .a ({1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[26], Fresh[25], Fresh[24]}), .c ({signal_68, signal_67, signal_42}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_32 ( .s ({signal_153, signal_151, signal_149}), .b ({signal_50, signal_49, signal_34}), .a ({1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[29], Fresh[28], Fresh[27]}), .c ({signal_70, signal_69, signal_43}) ) ;
    buf_clk cell_49 ( .C ( clk ), .D ( signal_156 ), .Q ( signal_157 ) ) ;
    buf_clk cell_53 ( .C ( clk ), .D ( signal_160 ), .Q ( signal_161 ) ) ;
    buf_clk cell_57 ( .C ( clk ), .D ( signal_164 ), .Q ( signal_165 ) ) ;
    buf_clk cell_61 ( .C ( clk ), .D ( signal_168 ), .Q ( signal_169 ) ) ;
    buf_clk cell_65 ( .C ( clk ), .D ( signal_172 ), .Q ( signal_173 ) ) ;
    buf_clk cell_69 ( .C ( clk ), .D ( signal_176 ), .Q ( signal_177 ) ) ;
    buf_clk cell_71 ( .C ( clk ), .D ( signal_178 ), .Q ( signal_179 ) ) ;
    buf_clk cell_73 ( .C ( clk ), .D ( signal_180 ), .Q ( signal_181 ) ) ;
    buf_clk cell_75 ( .C ( clk ), .D ( signal_182 ), .Q ( signal_183 ) ) ;
    buf_clk cell_83 ( .C ( clk ), .D ( signal_190 ), .Q ( signal_191 ) ) ;
    buf_clk cell_87 ( .C ( clk ), .D ( signal_194 ), .Q ( signal_195 ) ) ;
    buf_clk cell_91 ( .C ( clk ), .D ( signal_198 ), .Q ( signal_199 ) ) ;

    /* cells in depth 5 */
    buf_clk cell_76 ( .C ( clk ), .D ( signal_169 ), .Q ( signal_184 ) ) ;
    buf_clk cell_78 ( .C ( clk ), .D ( signal_173 ), .Q ( signal_186 ) ) ;
    buf_clk cell_80 ( .C ( clk ), .D ( signal_177 ), .Q ( signal_188 ) ) ;
    buf_clk cell_84 ( .C ( clk ), .D ( signal_191 ), .Q ( signal_192 ) ) ;
    buf_clk cell_88 ( .C ( clk ), .D ( signal_195 ), .Q ( signal_196 ) ) ;
    buf_clk cell_92 ( .C ( clk ), .D ( signal_199 ), .Q ( signal_200 ) ) ;

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_33 ( .s ({signal_165, signal_161, signal_157}), .b ({signal_64, signal_63, signal_40}), .a ({1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[32], Fresh[31], Fresh[30]}), .c ({signal_74, signal_73, signal_44}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_34 ( .s ({signal_165, signal_161, signal_157}), .b ({signal_60, signal_59, signal_38}), .a ({signal_66, signal_65, signal_41}), .clk ( clk ), .r ({Fresh[35], Fresh[34], Fresh[33]}), .c ({signal_76, signal_75, signal_45}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_35 ( .s ({signal_165, signal_161, signal_157}), .b ({signal_68, signal_67, signal_42}), .a ({signal_62, signal_61, signal_39}), .clk ( clk ), .r ({Fresh[38], Fresh[37], Fresh[36]}), .c ({signal_78, signal_77, signal_46}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_36 ( .s ({signal_177, signal_173, signal_169}), .b ({signal_58, signal_57, signal_37}), .a ({signal_183, signal_181, signal_179}), .clk ( clk ), .r ({Fresh[41], Fresh[40], Fresh[39]}), .c ({signal_82, signal_81, signal_16}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_37 ( .s ({signal_165, signal_161, signal_157}), .b ({signal_70, signal_69, signal_43}), .a ({signal_66, signal_65, signal_41}), .clk ( clk ), .r ({Fresh[44], Fresh[43], Fresh[42]}), .c ({signal_84, signal_83, signal_15}) ) ;
    buf_clk cell_77 ( .C ( clk ), .D ( signal_184 ), .Q ( signal_185 ) ) ;
    buf_clk cell_79 ( .C ( clk ), .D ( signal_186 ), .Q ( signal_187 ) ) ;
    buf_clk cell_81 ( .C ( clk ), .D ( signal_188 ), .Q ( signal_189 ) ) ;
    buf_clk cell_85 ( .C ( clk ), .D ( signal_192 ), .Q ( signal_193 ) ) ;
    buf_clk cell_89 ( .C ( clk ), .D ( signal_196 ), .Q ( signal_197 ) ) ;
    buf_clk cell_93 ( .C ( clk ), .D ( signal_200 ), .Q ( signal_201 ) ) ;

    /* cells in depth 7 */
    buf_clk cell_94 ( .C ( clk ), .D ( signal_15 ), .Q ( signal_202 ) ) ;
    buf_clk cell_96 ( .C ( clk ), .D ( signal_83 ), .Q ( signal_204 ) ) ;
    buf_clk cell_98 ( .C ( clk ), .D ( signal_84 ), .Q ( signal_206 ) ) ;
    buf_clk cell_100 ( .C ( clk ), .D ( signal_16 ), .Q ( signal_208 ) ) ;
    buf_clk cell_102 ( .C ( clk ), .D ( signal_81 ), .Q ( signal_210 ) ) ;
    buf_clk cell_104 ( .C ( clk ), .D ( signal_82 ), .Q ( signal_212 ) ) ;

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_38 ( .s ({signal_189, signal_187, signal_185}), .b ({signal_74, signal_73, signal_44}), .a ({signal_76, signal_75, signal_45}), .clk ( clk ), .r ({Fresh[47], Fresh[46], Fresh[45]}), .c ({signal_86, signal_85, signal_18}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(1)) cell_39 ( .s ({signal_189, signal_187, signal_185}), .b ({signal_78, signal_77, signal_46}), .a ({signal_201, signal_197, signal_193}), .clk ( clk ), .r ({Fresh[50], Fresh[49], Fresh[48]}), .c ({signal_88, signal_87, signal_17}) ) ;
    buf_clk cell_95 ( .C ( clk ), .D ( signal_202 ), .Q ( signal_203 ) ) ;
    buf_clk cell_97 ( .C ( clk ), .D ( signal_204 ), .Q ( signal_205 ) ) ;
    buf_clk cell_99 ( .C ( clk ), .D ( signal_206 ), .Q ( signal_207 ) ) ;
    buf_clk cell_101 ( .C ( clk ), .D ( signal_208 ), .Q ( signal_209 ) ) ;
    buf_clk cell_103 ( .C ( clk ), .D ( signal_210 ), .Q ( signal_211 ) ) ;
    buf_clk cell_105 ( .C ( clk ), .D ( signal_212 ), .Q ( signal_213 ) ) ;

    /* register cells */
    reg_masked #(.security_order(2), .pipeline(1)) cell_0 ( .clk ( clk ), .D ({signal_207, signal_205, signal_203}), .Q ({SO_s2[3], SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(2), .pipeline(1)) cell_1 ( .clk ( clk ), .D ({signal_213, signal_211, signal_209}), .Q ({SO_s2[2], SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(2), .pipeline(1)) cell_2 ( .clk ( clk ), .D ({signal_88, signal_87, signal_17}), .Q ({SO_s2[1], SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(2), .pipeline(1)) cell_3 ( .clk ( clk ), .D ({signal_86, signal_85, signal_18}), .Q ({SO_s2[0], SO_s1[0], SO_s0[0]}) ) ;
endmodule
