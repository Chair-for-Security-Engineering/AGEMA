/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* 10 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 11 register stage(s) in total */

module sbox_HPC1_Pipeline_d2 (SI_s0, clk, SI_s1, SI_s2, Fresh, SO_s0, SO_s1, SO_s2);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [3:0] SI_s2 ;
    input [64:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
    output [3:0] SO_s2 ;
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
    wire new_AGEMA_signal_36 ;
    wire new_AGEMA_signal_37 ;
    wire new_AGEMA_signal_42 ;
    wire new_AGEMA_signal_43 ;
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
    wire new_AGEMA_signal_171 ;
    wire new_AGEMA_signal_172 ;
    wire new_AGEMA_signal_173 ;
    wire new_AGEMA_signal_174 ;
    wire new_AGEMA_signal_175 ;
    wire new_AGEMA_signal_176 ;
    wire new_AGEMA_signal_177 ;
    wire new_AGEMA_signal_178 ;
    wire new_AGEMA_signal_179 ;
    wire new_AGEMA_signal_180 ;
    wire new_AGEMA_signal_181 ;
    wire new_AGEMA_signal_182 ;
    wire new_AGEMA_signal_183 ;
    wire new_AGEMA_signal_184 ;
    wire new_AGEMA_signal_185 ;
    wire new_AGEMA_signal_186 ;
    wire new_AGEMA_signal_187 ;
    wire new_AGEMA_signal_188 ;
    wire new_AGEMA_signal_189 ;
    wire new_AGEMA_signal_190 ;
    wire new_AGEMA_signal_191 ;
    wire new_AGEMA_signal_192 ;
    wire new_AGEMA_signal_193 ;
    wire new_AGEMA_signal_194 ;
    wire new_AGEMA_signal_195 ;
    wire new_AGEMA_signal_196 ;
    wire new_AGEMA_signal_197 ;
    wire new_AGEMA_signal_198 ;
    wire new_AGEMA_signal_199 ;
    wire new_AGEMA_signal_200 ;
    wire new_AGEMA_signal_201 ;
    wire new_AGEMA_signal_202 ;
    wire new_AGEMA_signal_203 ;
    wire new_AGEMA_signal_204 ;
    wire new_AGEMA_signal_205 ;
    wire new_AGEMA_signal_206 ;
    wire new_AGEMA_signal_207 ;
    wire new_AGEMA_signal_208 ;
    wire new_AGEMA_signal_209 ;
    wire new_AGEMA_signal_210 ;
    wire new_AGEMA_signal_211 ;
    wire new_AGEMA_signal_212 ;
    wire new_AGEMA_signal_213 ;
    wire new_AGEMA_signal_214 ;
    wire new_AGEMA_signal_215 ;
    wire new_AGEMA_signal_216 ;
    wire new_AGEMA_signal_217 ;
    wire new_AGEMA_signal_218 ;
    wire new_AGEMA_signal_219 ;
    wire new_AGEMA_signal_220 ;
    wire new_AGEMA_signal_221 ;
    wire new_AGEMA_signal_222 ;
    wire new_AGEMA_signal_223 ;
    wire new_AGEMA_signal_224 ;
    wire new_AGEMA_signal_225 ;
    wire new_AGEMA_signal_226 ;
    wire new_AGEMA_signal_227 ;
    wire new_AGEMA_signal_228 ;
    wire new_AGEMA_signal_229 ;
    wire new_AGEMA_signal_230 ;
    wire new_AGEMA_signal_231 ;
    wire new_AGEMA_signal_232 ;
    wire new_AGEMA_signal_233 ;
    wire new_AGEMA_signal_234 ;
    wire new_AGEMA_signal_235 ;
    wire new_AGEMA_signal_236 ;
    wire new_AGEMA_signal_237 ;
    wire new_AGEMA_signal_238 ;
    wire new_AGEMA_signal_239 ;
    wire new_AGEMA_signal_240 ;
    wire new_AGEMA_signal_241 ;
    wire new_AGEMA_signal_242 ;
    wire new_AGEMA_signal_243 ;
    wire new_AGEMA_signal_244 ;
    wire new_AGEMA_signal_245 ;
    wire new_AGEMA_signal_246 ;
    wire new_AGEMA_signal_247 ;
    wire new_AGEMA_signal_248 ;
    wire new_AGEMA_signal_249 ;
    wire new_AGEMA_signal_250 ;
    wire new_AGEMA_signal_251 ;
    wire new_AGEMA_signal_252 ;
    wire new_AGEMA_signal_253 ;
    wire new_AGEMA_signal_254 ;
    wire new_AGEMA_signal_255 ;
    wire new_AGEMA_signal_256 ;
    wire new_AGEMA_signal_257 ;
    wire new_AGEMA_signal_258 ;
    wire new_AGEMA_signal_259 ;
    wire new_AGEMA_signal_260 ;
    wire new_AGEMA_signal_261 ;
    wire new_AGEMA_signal_262 ;
    wire new_AGEMA_signal_263 ;
    wire new_AGEMA_signal_264 ;
    wire new_AGEMA_signal_265 ;
    wire new_AGEMA_signal_266 ;
    wire new_AGEMA_signal_267 ;
    wire new_AGEMA_signal_268 ;
    wire new_AGEMA_signal_269 ;
    wire new_AGEMA_signal_270 ;
    wire new_AGEMA_signal_271 ;
    wire new_AGEMA_signal_272 ;
    wire new_AGEMA_signal_273 ;
    wire new_AGEMA_signal_274 ;
    wire new_AGEMA_signal_275 ;
    wire new_AGEMA_signal_276 ;
    wire new_AGEMA_signal_277 ;
    wire new_AGEMA_signal_278 ;

    /* cells in depth 0 */
    not_masked #(.security_order(2), .pipeline(1)) U50 ( .a ({SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({new_AGEMA_signal_37, new_AGEMA_signal_36, n53}) ) ;
    not_masked #(.security_order(2), .pipeline(1)) U53 ( .a ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({new_AGEMA_signal_47, new_AGEMA_signal_46, n52}) ) ;
    not_masked #(.security_order(2), .pipeline(1)) U59 ( .a ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({new_AGEMA_signal_51, new_AGEMA_signal_50, n51}) ) ;

    /* cells in depth 1 */
    buf_clk new_AGEMA_reg_buffer_23 ( .C ( clk ), .D ( SI_s0[3] ), .Q ( new_AGEMA_signal_153 ) ) ;
    buf_clk new_AGEMA_reg_buffer_25 ( .C ( clk ), .D ( SI_s1[3] ), .Q ( new_AGEMA_signal_155 ) ) ;
    buf_clk new_AGEMA_reg_buffer_27 ( .C ( clk ), .D ( SI_s2[3] ), .Q ( new_AGEMA_signal_157 ) ) ;
    buf_clk new_AGEMA_reg_buffer_29 ( .C ( clk ), .D ( n53 ), .Q ( new_AGEMA_signal_159 ) ) ;
    buf_clk new_AGEMA_reg_buffer_31 ( .C ( clk ), .D ( new_AGEMA_signal_36 ), .Q ( new_AGEMA_signal_161 ) ) ;
    buf_clk new_AGEMA_reg_buffer_33 ( .C ( clk ), .D ( new_AGEMA_signal_37 ), .Q ( new_AGEMA_signal_163 ) ) ;
    buf_clk new_AGEMA_reg_buffer_35 ( .C ( clk ), .D ( SI_s0[1] ), .Q ( new_AGEMA_signal_165 ) ) ;
    buf_clk new_AGEMA_reg_buffer_37 ( .C ( clk ), .D ( SI_s1[1] ), .Q ( new_AGEMA_signal_167 ) ) ;
    buf_clk new_AGEMA_reg_buffer_39 ( .C ( clk ), .D ( SI_s2[1] ), .Q ( new_AGEMA_signal_169 ) ) ;
    buf_clk new_AGEMA_reg_buffer_41 ( .C ( clk ), .D ( SI_s0[2] ), .Q ( new_AGEMA_signal_171 ) ) ;
    buf_clk new_AGEMA_reg_buffer_43 ( .C ( clk ), .D ( SI_s1[2] ), .Q ( new_AGEMA_signal_173 ) ) ;
    buf_clk new_AGEMA_reg_buffer_45 ( .C ( clk ), .D ( SI_s2[2] ), .Q ( new_AGEMA_signal_175 ) ) ;

    /* cells in depth 2 */
    nor_HPC1 #(.security_order(2), .pipeline(1)) U51 ( .ina ({SI_s2[1], SI_s1[1], SI_s0[1]}), .inb ({SI_s2[2], SI_s1[2], SI_s0[2]}), .clk ( clk ), .rnd ({Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .outt ({new_AGEMA_signal_43, new_AGEMA_signal_42, n40}) ) ;
    xor_HPC1 #(.security_order(2), .pipeline(1)) U52 ( .a ({new_AGEMA_signal_43, new_AGEMA_signal_42, n40}), .b ({new_AGEMA_signal_158, new_AGEMA_signal_156, new_AGEMA_signal_154}), .c ({new_AGEMA_signal_55, new_AGEMA_signal_54, N12}) ) ;
    nor_HPC1 #(.security_order(2), .pipeline(1)) U54 ( .ina ({SI_s2[2], SI_s1[2], SI_s0[2]}), .inb ({new_AGEMA_signal_47, new_AGEMA_signal_46, n52}), .clk ( clk ), .rnd ({Fresh[9], Fresh[8], Fresh[7], Fresh[6], Fresh[5]}), .outt ({new_AGEMA_signal_57, new_AGEMA_signal_56, n41}) ) ;
    xnor_HPC1 #(.security_order(2), .pipeline(1)) U55 ( .a ({new_AGEMA_signal_164, new_AGEMA_signal_162, new_AGEMA_signal_160}), .b ({new_AGEMA_signal_57, new_AGEMA_signal_56, n41}), .c ({new_AGEMA_signal_69, new_AGEMA_signal_68, n42}) ) ;
    nor_HPC1 #(.security_order(2), .pipeline(1)) U57 ( .ina ({SI_s2[0], SI_s1[0], SI_s0[0]}), .inb ({SI_s2[3], SI_s1[3], SI_s0[3]}), .clk ( clk ), .rnd ({Fresh[14], Fresh[13], Fresh[12], Fresh[11], Fresh[10]}), .outt ({new_AGEMA_signal_49, new_AGEMA_signal_48, n43}) ) ;
    nor_HPC1 #(.security_order(2), .pipeline(1)) U60 ( .ina ({new_AGEMA_signal_51, new_AGEMA_signal_50, n51}), .inb ({new_AGEMA_signal_37, new_AGEMA_signal_36, n53}), .clk ( clk ), .rnd ({Fresh[19], Fresh[18], Fresh[17], Fresh[16], Fresh[15]}), .outt ({new_AGEMA_signal_61, new_AGEMA_signal_60, n45}) ) ;
    nor_HPC1 #(.security_order(2), .pipeline(1)) U61 ( .ina ({SI_s2[2], SI_s1[2], SI_s0[2]}), .inb ({SI_s2[0], SI_s1[0], SI_s0[0]}), .clk ( clk ), .rnd ({Fresh[24], Fresh[23], Fresh[22], Fresh[21], Fresh[20]}), .outt ({new_AGEMA_signal_53, new_AGEMA_signal_52, n48}) ) ;
    nand_HPC1 #(.security_order(2), .pipeline(1)) U67 ( .ina ({new_AGEMA_signal_47, new_AGEMA_signal_46, n52}), .inb ({new_AGEMA_signal_51, new_AGEMA_signal_50, n51}), .clk ( clk ), .rnd ({Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25]}), .outt ({new_AGEMA_signal_67, new_AGEMA_signal_66, n54}) ) ;
    xor_HPC1 #(.security_order(2), .pipeline(1)) U68 ( .a ({new_AGEMA_signal_67, new_AGEMA_signal_66, n54}), .b ({new_AGEMA_signal_164, new_AGEMA_signal_162, new_AGEMA_signal_160}), .c ({new_AGEMA_signal_73, new_AGEMA_signal_72, N9}) ) ;
    buf_clk new_AGEMA_reg_buffer_24 ( .C ( clk ), .D ( new_AGEMA_signal_153 ), .Q ( new_AGEMA_signal_154 ) ) ;
    buf_clk new_AGEMA_reg_buffer_26 ( .C ( clk ), .D ( new_AGEMA_signal_155 ), .Q ( new_AGEMA_signal_156 ) ) ;
    buf_clk new_AGEMA_reg_buffer_28 ( .C ( clk ), .D ( new_AGEMA_signal_157 ), .Q ( new_AGEMA_signal_158 ) ) ;
    buf_clk new_AGEMA_reg_buffer_30 ( .C ( clk ), .D ( new_AGEMA_signal_159 ), .Q ( new_AGEMA_signal_160 ) ) ;
    buf_clk new_AGEMA_reg_buffer_32 ( .C ( clk ), .D ( new_AGEMA_signal_161 ), .Q ( new_AGEMA_signal_162 ) ) ;
    buf_clk new_AGEMA_reg_buffer_34 ( .C ( clk ), .D ( new_AGEMA_signal_163 ), .Q ( new_AGEMA_signal_164 ) ) ;
    buf_clk new_AGEMA_reg_buffer_36 ( .C ( clk ), .D ( new_AGEMA_signal_165 ), .Q ( new_AGEMA_signal_166 ) ) ;
    buf_clk new_AGEMA_reg_buffer_38 ( .C ( clk ), .D ( new_AGEMA_signal_167 ), .Q ( new_AGEMA_signal_168 ) ) ;
    buf_clk new_AGEMA_reg_buffer_40 ( .C ( clk ), .D ( new_AGEMA_signal_169 ), .Q ( new_AGEMA_signal_170 ) ) ;
    buf_clk new_AGEMA_reg_buffer_42 ( .C ( clk ), .D ( new_AGEMA_signal_171 ), .Q ( new_AGEMA_signal_172 ) ) ;
    buf_clk new_AGEMA_reg_buffer_44 ( .C ( clk ), .D ( new_AGEMA_signal_173 ), .Q ( new_AGEMA_signal_174 ) ) ;
    buf_clk new_AGEMA_reg_buffer_46 ( .C ( clk ), .D ( new_AGEMA_signal_175 ), .Q ( new_AGEMA_signal_176 ) ) ;

    /* cells in depth 3 */
    buf_clk new_AGEMA_reg_buffer_47 ( .C ( clk ), .D ( n45 ), .Q ( new_AGEMA_signal_177 ) ) ;
    buf_clk new_AGEMA_reg_buffer_49 ( .C ( clk ), .D ( new_AGEMA_signal_60 ), .Q ( new_AGEMA_signal_179 ) ) ;
    buf_clk new_AGEMA_reg_buffer_51 ( .C ( clk ), .D ( new_AGEMA_signal_61 ), .Q ( new_AGEMA_signal_181 ) ) ;
    buf_clk new_AGEMA_reg_buffer_53 ( .C ( clk ), .D ( new_AGEMA_signal_166 ), .Q ( new_AGEMA_signal_183 ) ) ;
    buf_clk new_AGEMA_reg_buffer_57 ( .C ( clk ), .D ( new_AGEMA_signal_168 ), .Q ( new_AGEMA_signal_187 ) ) ;
    buf_clk new_AGEMA_reg_buffer_61 ( .C ( clk ), .D ( new_AGEMA_signal_170 ), .Q ( new_AGEMA_signal_191 ) ) ;
    buf_clk new_AGEMA_reg_buffer_83 ( .C ( clk ), .D ( N9 ), .Q ( new_AGEMA_signal_213 ) ) ;
    buf_clk new_AGEMA_reg_buffer_91 ( .C ( clk ), .D ( new_AGEMA_signal_72 ), .Q ( new_AGEMA_signal_221 ) ) ;
    buf_clk new_AGEMA_reg_buffer_99 ( .C ( clk ), .D ( new_AGEMA_signal_73 ), .Q ( new_AGEMA_signal_229 ) ) ;
    buf_clk new_AGEMA_reg_buffer_107 ( .C ( clk ), .D ( N12 ), .Q ( new_AGEMA_signal_237 ) ) ;
    buf_clk new_AGEMA_reg_buffer_115 ( .C ( clk ), .D ( new_AGEMA_signal_54 ), .Q ( new_AGEMA_signal_245 ) ) ;
    buf_clk new_AGEMA_reg_buffer_123 ( .C ( clk ), .D ( new_AGEMA_signal_55 ), .Q ( new_AGEMA_signal_253 ) ) ;

    /* cells in depth 4 */
    mux2_HPC1 #(.security_order(2), .pipeline(1)) U56 ( .ins ({new_AGEMA_signal_170, new_AGEMA_signal_168, new_AGEMA_signal_166}), .inb ({new_AGEMA_signal_69, new_AGEMA_signal_68, n42}), .ina ({new_AGEMA_signal_176, new_AGEMA_signal_174, new_AGEMA_signal_172}), .clk ( clk ), .rnd ({Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30]}), .outt ({new_AGEMA_signal_75, new_AGEMA_signal_74, N19}) ) ;
    nand_HPC1 #(.security_order(2), .pipeline(1)) U58 ( .ina ({new_AGEMA_signal_49, new_AGEMA_signal_48, n43}), .inb ({new_AGEMA_signal_176, new_AGEMA_signal_174, new_AGEMA_signal_172}), .clk ( clk ), .rnd ({Fresh[39], Fresh[38], Fresh[37], Fresh[36], Fresh[35]}), .outt ({new_AGEMA_signal_59, new_AGEMA_signal_58, n47}) ) ;
    or_HPC1 #(.security_order(2), .pipeline(1)) U62 ( .ina ({new_AGEMA_signal_158, new_AGEMA_signal_156, new_AGEMA_signal_154}), .inb ({new_AGEMA_signal_53, new_AGEMA_signal_52, n48}), .clk ( clk ), .rnd ({Fresh[44], Fresh[43], Fresh[42], Fresh[41], Fresh[40]}), .outt ({new_AGEMA_signal_63, new_AGEMA_signal_62, n44}) ) ;
    nand_HPC1 #(.security_order(2), .pipeline(1)) U65 ( .ina ({new_AGEMA_signal_158, new_AGEMA_signal_156, new_AGEMA_signal_154}), .inb ({new_AGEMA_signal_53, new_AGEMA_signal_52, n48}), .clk ( clk ), .rnd ({Fresh[49], Fresh[48], Fresh[47], Fresh[46], Fresh[45]}), .outt ({new_AGEMA_signal_65, new_AGEMA_signal_64, n49}) ) ;
    buf_clk new_AGEMA_reg_buffer_48 ( .C ( clk ), .D ( new_AGEMA_signal_177 ), .Q ( new_AGEMA_signal_178 ) ) ;
    buf_clk new_AGEMA_reg_buffer_50 ( .C ( clk ), .D ( new_AGEMA_signal_179 ), .Q ( new_AGEMA_signal_180 ) ) ;
    buf_clk new_AGEMA_reg_buffer_52 ( .C ( clk ), .D ( new_AGEMA_signal_181 ), .Q ( new_AGEMA_signal_182 ) ) ;
    buf_clk new_AGEMA_reg_buffer_54 ( .C ( clk ), .D ( new_AGEMA_signal_183 ), .Q ( new_AGEMA_signal_184 ) ) ;
    buf_clk new_AGEMA_reg_buffer_58 ( .C ( clk ), .D ( new_AGEMA_signal_187 ), .Q ( new_AGEMA_signal_188 ) ) ;
    buf_clk new_AGEMA_reg_buffer_62 ( .C ( clk ), .D ( new_AGEMA_signal_191 ), .Q ( new_AGEMA_signal_192 ) ) ;
    buf_clk new_AGEMA_reg_buffer_84 ( .C ( clk ), .D ( new_AGEMA_signal_213 ), .Q ( new_AGEMA_signal_214 ) ) ;
    buf_clk new_AGEMA_reg_buffer_92 ( .C ( clk ), .D ( new_AGEMA_signal_221 ), .Q ( new_AGEMA_signal_222 ) ) ;
    buf_clk new_AGEMA_reg_buffer_100 ( .C ( clk ), .D ( new_AGEMA_signal_229 ), .Q ( new_AGEMA_signal_230 ) ) ;
    buf_clk new_AGEMA_reg_buffer_108 ( .C ( clk ), .D ( new_AGEMA_signal_237 ), .Q ( new_AGEMA_signal_238 ) ) ;
    buf_clk new_AGEMA_reg_buffer_116 ( .C ( clk ), .D ( new_AGEMA_signal_245 ), .Q ( new_AGEMA_signal_246 ) ) ;
    buf_clk new_AGEMA_reg_buffer_124 ( .C ( clk ), .D ( new_AGEMA_signal_253 ), .Q ( new_AGEMA_signal_254 ) ) ;

    /* cells in depth 5 */
    buf_clk new_AGEMA_reg_buffer_55 ( .C ( clk ), .D ( new_AGEMA_signal_184 ), .Q ( new_AGEMA_signal_185 ) ) ;
    buf_clk new_AGEMA_reg_buffer_59 ( .C ( clk ), .D ( new_AGEMA_signal_188 ), .Q ( new_AGEMA_signal_189 ) ) ;
    buf_clk new_AGEMA_reg_buffer_63 ( .C ( clk ), .D ( new_AGEMA_signal_192 ), .Q ( new_AGEMA_signal_193 ) ) ;
    buf_clk new_AGEMA_reg_buffer_65 ( .C ( clk ), .D ( n47 ), .Q ( new_AGEMA_signal_195 ) ) ;
    buf_clk new_AGEMA_reg_buffer_67 ( .C ( clk ), .D ( new_AGEMA_signal_58 ), .Q ( new_AGEMA_signal_197 ) ) ;
    buf_clk new_AGEMA_reg_buffer_69 ( .C ( clk ), .D ( new_AGEMA_signal_59 ), .Q ( new_AGEMA_signal_199 ) ) ;
    buf_clk new_AGEMA_reg_buffer_71 ( .C ( clk ), .D ( n49 ), .Q ( new_AGEMA_signal_201 ) ) ;
    buf_clk new_AGEMA_reg_buffer_75 ( .C ( clk ), .D ( new_AGEMA_signal_64 ), .Q ( new_AGEMA_signal_205 ) ) ;
    buf_clk new_AGEMA_reg_buffer_79 ( .C ( clk ), .D ( new_AGEMA_signal_65 ), .Q ( new_AGEMA_signal_209 ) ) ;
    buf_clk new_AGEMA_reg_buffer_85 ( .C ( clk ), .D ( new_AGEMA_signal_214 ), .Q ( new_AGEMA_signal_215 ) ) ;
    buf_clk new_AGEMA_reg_buffer_93 ( .C ( clk ), .D ( new_AGEMA_signal_222 ), .Q ( new_AGEMA_signal_223 ) ) ;
    buf_clk new_AGEMA_reg_buffer_101 ( .C ( clk ), .D ( new_AGEMA_signal_230 ), .Q ( new_AGEMA_signal_231 ) ) ;
    buf_clk new_AGEMA_reg_buffer_109 ( .C ( clk ), .D ( new_AGEMA_signal_238 ), .Q ( new_AGEMA_signal_239 ) ) ;
    buf_clk new_AGEMA_reg_buffer_117 ( .C ( clk ), .D ( new_AGEMA_signal_246 ), .Q ( new_AGEMA_signal_247 ) ) ;
    buf_clk new_AGEMA_reg_buffer_125 ( .C ( clk ), .D ( new_AGEMA_signal_254 ), .Q ( new_AGEMA_signal_255 ) ) ;
    buf_clk new_AGEMA_reg_buffer_131 ( .C ( clk ), .D ( N19 ), .Q ( new_AGEMA_signal_261 ) ) ;
    buf_clk new_AGEMA_reg_buffer_137 ( .C ( clk ), .D ( new_AGEMA_signal_74 ), .Q ( new_AGEMA_signal_267 ) ) ;
    buf_clk new_AGEMA_reg_buffer_143 ( .C ( clk ), .D ( new_AGEMA_signal_75 ), .Q ( new_AGEMA_signal_273 ) ) ;

    /* cells in depth 6 */
    nor_HPC1 #(.security_order(2), .pipeline(1)) U63 ( .ina ({new_AGEMA_signal_182, new_AGEMA_signal_180, new_AGEMA_signal_178}), .inb ({new_AGEMA_signal_63, new_AGEMA_signal_62, n44}), .clk ( clk ), .rnd ({Fresh[54], Fresh[53], Fresh[52], Fresh[51], Fresh[50]}), .outt ({new_AGEMA_signal_71, new_AGEMA_signal_70, n46}) ) ;
    buf_clk new_AGEMA_reg_buffer_56 ( .C ( clk ), .D ( new_AGEMA_signal_185 ), .Q ( new_AGEMA_signal_186 ) ) ;
    buf_clk new_AGEMA_reg_buffer_60 ( .C ( clk ), .D ( new_AGEMA_signal_189 ), .Q ( new_AGEMA_signal_190 ) ) ;
    buf_clk new_AGEMA_reg_buffer_64 ( .C ( clk ), .D ( new_AGEMA_signal_193 ), .Q ( new_AGEMA_signal_194 ) ) ;
    buf_clk new_AGEMA_reg_buffer_66 ( .C ( clk ), .D ( new_AGEMA_signal_195 ), .Q ( new_AGEMA_signal_196 ) ) ;
    buf_clk new_AGEMA_reg_buffer_68 ( .C ( clk ), .D ( new_AGEMA_signal_197 ), .Q ( new_AGEMA_signal_198 ) ) ;
    buf_clk new_AGEMA_reg_buffer_70 ( .C ( clk ), .D ( new_AGEMA_signal_199 ), .Q ( new_AGEMA_signal_200 ) ) ;
    buf_clk new_AGEMA_reg_buffer_72 ( .C ( clk ), .D ( new_AGEMA_signal_201 ), .Q ( new_AGEMA_signal_202 ) ) ;
    buf_clk new_AGEMA_reg_buffer_76 ( .C ( clk ), .D ( new_AGEMA_signal_205 ), .Q ( new_AGEMA_signal_206 ) ) ;
    buf_clk new_AGEMA_reg_buffer_80 ( .C ( clk ), .D ( new_AGEMA_signal_209 ), .Q ( new_AGEMA_signal_210 ) ) ;
    buf_clk new_AGEMA_reg_buffer_86 ( .C ( clk ), .D ( new_AGEMA_signal_215 ), .Q ( new_AGEMA_signal_216 ) ) ;
    buf_clk new_AGEMA_reg_buffer_94 ( .C ( clk ), .D ( new_AGEMA_signal_223 ), .Q ( new_AGEMA_signal_224 ) ) ;
    buf_clk new_AGEMA_reg_buffer_102 ( .C ( clk ), .D ( new_AGEMA_signal_231 ), .Q ( new_AGEMA_signal_232 ) ) ;
    buf_clk new_AGEMA_reg_buffer_110 ( .C ( clk ), .D ( new_AGEMA_signal_239 ), .Q ( new_AGEMA_signal_240 ) ) ;
    buf_clk new_AGEMA_reg_buffer_118 ( .C ( clk ), .D ( new_AGEMA_signal_247 ), .Q ( new_AGEMA_signal_248 ) ) ;
    buf_clk new_AGEMA_reg_buffer_126 ( .C ( clk ), .D ( new_AGEMA_signal_255 ), .Q ( new_AGEMA_signal_256 ) ) ;
    buf_clk new_AGEMA_reg_buffer_132 ( .C ( clk ), .D ( new_AGEMA_signal_261 ), .Q ( new_AGEMA_signal_262 ) ) ;
    buf_clk new_AGEMA_reg_buffer_138 ( .C ( clk ), .D ( new_AGEMA_signal_267 ), .Q ( new_AGEMA_signal_268 ) ) ;
    buf_clk new_AGEMA_reg_buffer_144 ( .C ( clk ), .D ( new_AGEMA_signal_273 ), .Q ( new_AGEMA_signal_274 ) ) ;

    /* cells in depth 7 */
    buf_clk new_AGEMA_reg_buffer_73 ( .C ( clk ), .D ( new_AGEMA_signal_202 ), .Q ( new_AGEMA_signal_203 ) ) ;
    buf_clk new_AGEMA_reg_buffer_77 ( .C ( clk ), .D ( new_AGEMA_signal_206 ), .Q ( new_AGEMA_signal_207 ) ) ;
    buf_clk new_AGEMA_reg_buffer_81 ( .C ( clk ), .D ( new_AGEMA_signal_210 ), .Q ( new_AGEMA_signal_211 ) ) ;
    buf_clk new_AGEMA_reg_buffer_87 ( .C ( clk ), .D ( new_AGEMA_signal_216 ), .Q ( new_AGEMA_signal_217 ) ) ;
    buf_clk new_AGEMA_reg_buffer_95 ( .C ( clk ), .D ( new_AGEMA_signal_224 ), .Q ( new_AGEMA_signal_225 ) ) ;
    buf_clk new_AGEMA_reg_buffer_103 ( .C ( clk ), .D ( new_AGEMA_signal_232 ), .Q ( new_AGEMA_signal_233 ) ) ;
    buf_clk new_AGEMA_reg_buffer_111 ( .C ( clk ), .D ( new_AGEMA_signal_240 ), .Q ( new_AGEMA_signal_241 ) ) ;
    buf_clk new_AGEMA_reg_buffer_119 ( .C ( clk ), .D ( new_AGEMA_signal_248 ), .Q ( new_AGEMA_signal_249 ) ) ;
    buf_clk new_AGEMA_reg_buffer_127 ( .C ( clk ), .D ( new_AGEMA_signal_256 ), .Q ( new_AGEMA_signal_257 ) ) ;
    buf_clk new_AGEMA_reg_buffer_133 ( .C ( clk ), .D ( new_AGEMA_signal_262 ), .Q ( new_AGEMA_signal_263 ) ) ;
    buf_clk new_AGEMA_reg_buffer_139 ( .C ( clk ), .D ( new_AGEMA_signal_268 ), .Q ( new_AGEMA_signal_269 ) ) ;
    buf_clk new_AGEMA_reg_buffer_145 ( .C ( clk ), .D ( new_AGEMA_signal_274 ), .Q ( new_AGEMA_signal_275 ) ) ;

    /* cells in depth 8 */
    mux2_HPC1 #(.security_order(2), .pipeline(1)) U64 ( .ins ({new_AGEMA_signal_194, new_AGEMA_signal_190, new_AGEMA_signal_186}), .inb ({new_AGEMA_signal_200, new_AGEMA_signal_198, new_AGEMA_signal_196}), .ina ({new_AGEMA_signal_71, new_AGEMA_signal_70, n46}), .clk ( clk ), .rnd ({Fresh[59], Fresh[58], Fresh[57], Fresh[56], Fresh[55]}), .outt ({new_AGEMA_signal_77, new_AGEMA_signal_76, n50}) ) ;
    buf_clk new_AGEMA_reg_buffer_74 ( .C ( clk ), .D ( new_AGEMA_signal_203 ), .Q ( new_AGEMA_signal_204 ) ) ;
    buf_clk new_AGEMA_reg_buffer_78 ( .C ( clk ), .D ( new_AGEMA_signal_207 ), .Q ( new_AGEMA_signal_208 ) ) ;
    buf_clk new_AGEMA_reg_buffer_82 ( .C ( clk ), .D ( new_AGEMA_signal_211 ), .Q ( new_AGEMA_signal_212 ) ) ;
    buf_clk new_AGEMA_reg_buffer_88 ( .C ( clk ), .D ( new_AGEMA_signal_217 ), .Q ( new_AGEMA_signal_218 ) ) ;
    buf_clk new_AGEMA_reg_buffer_96 ( .C ( clk ), .D ( new_AGEMA_signal_225 ), .Q ( new_AGEMA_signal_226 ) ) ;
    buf_clk new_AGEMA_reg_buffer_104 ( .C ( clk ), .D ( new_AGEMA_signal_233 ), .Q ( new_AGEMA_signal_234 ) ) ;
    buf_clk new_AGEMA_reg_buffer_112 ( .C ( clk ), .D ( new_AGEMA_signal_241 ), .Q ( new_AGEMA_signal_242 ) ) ;
    buf_clk new_AGEMA_reg_buffer_120 ( .C ( clk ), .D ( new_AGEMA_signal_249 ), .Q ( new_AGEMA_signal_250 ) ) ;
    buf_clk new_AGEMA_reg_buffer_128 ( .C ( clk ), .D ( new_AGEMA_signal_257 ), .Q ( new_AGEMA_signal_258 ) ) ;
    buf_clk new_AGEMA_reg_buffer_134 ( .C ( clk ), .D ( new_AGEMA_signal_263 ), .Q ( new_AGEMA_signal_264 ) ) ;
    buf_clk new_AGEMA_reg_buffer_140 ( .C ( clk ), .D ( new_AGEMA_signal_269 ), .Q ( new_AGEMA_signal_270 ) ) ;
    buf_clk new_AGEMA_reg_buffer_146 ( .C ( clk ), .D ( new_AGEMA_signal_275 ), .Q ( new_AGEMA_signal_276 ) ) ;

    /* cells in depth 9 */
    buf_clk new_AGEMA_reg_buffer_89 ( .C ( clk ), .D ( new_AGEMA_signal_218 ), .Q ( new_AGEMA_signal_219 ) ) ;
    buf_clk new_AGEMA_reg_buffer_97 ( .C ( clk ), .D ( new_AGEMA_signal_226 ), .Q ( new_AGEMA_signal_227 ) ) ;
    buf_clk new_AGEMA_reg_buffer_105 ( .C ( clk ), .D ( new_AGEMA_signal_234 ), .Q ( new_AGEMA_signal_235 ) ) ;
    buf_clk new_AGEMA_reg_buffer_113 ( .C ( clk ), .D ( new_AGEMA_signal_242 ), .Q ( new_AGEMA_signal_243 ) ) ;
    buf_clk new_AGEMA_reg_buffer_121 ( .C ( clk ), .D ( new_AGEMA_signal_250 ), .Q ( new_AGEMA_signal_251 ) ) ;
    buf_clk new_AGEMA_reg_buffer_129 ( .C ( clk ), .D ( new_AGEMA_signal_258 ), .Q ( new_AGEMA_signal_259 ) ) ;
    buf_clk new_AGEMA_reg_buffer_135 ( .C ( clk ), .D ( new_AGEMA_signal_264 ), .Q ( new_AGEMA_signal_265 ) ) ;
    buf_clk new_AGEMA_reg_buffer_141 ( .C ( clk ), .D ( new_AGEMA_signal_270 ), .Q ( new_AGEMA_signal_271 ) ) ;
    buf_clk new_AGEMA_reg_buffer_147 ( .C ( clk ), .D ( new_AGEMA_signal_276 ), .Q ( new_AGEMA_signal_277 ) ) ;

    /* cells in depth 10 */
    nand_HPC1 #(.security_order(2), .pipeline(1)) U66 ( .ina ({new_AGEMA_signal_77, new_AGEMA_signal_76, n50}), .inb ({new_AGEMA_signal_212, new_AGEMA_signal_208, new_AGEMA_signal_204}), .clk ( clk ), .rnd ({Fresh[64], Fresh[63], Fresh[62], Fresh[61], Fresh[60]}), .outt ({new_AGEMA_signal_79, new_AGEMA_signal_78, N27}) ) ;
    buf_clk new_AGEMA_reg_buffer_90 ( .C ( clk ), .D ( new_AGEMA_signal_219 ), .Q ( new_AGEMA_signal_220 ) ) ;
    buf_clk new_AGEMA_reg_buffer_98 ( .C ( clk ), .D ( new_AGEMA_signal_227 ), .Q ( new_AGEMA_signal_228 ) ) ;
    buf_clk new_AGEMA_reg_buffer_106 ( .C ( clk ), .D ( new_AGEMA_signal_235 ), .Q ( new_AGEMA_signal_236 ) ) ;
    buf_clk new_AGEMA_reg_buffer_114 ( .C ( clk ), .D ( new_AGEMA_signal_243 ), .Q ( new_AGEMA_signal_244 ) ) ;
    buf_clk new_AGEMA_reg_buffer_122 ( .C ( clk ), .D ( new_AGEMA_signal_251 ), .Q ( new_AGEMA_signal_252 ) ) ;
    buf_clk new_AGEMA_reg_buffer_130 ( .C ( clk ), .D ( new_AGEMA_signal_259 ), .Q ( new_AGEMA_signal_260 ) ) ;
    buf_clk new_AGEMA_reg_buffer_136 ( .C ( clk ), .D ( new_AGEMA_signal_265 ), .Q ( new_AGEMA_signal_266 ) ) ;
    buf_clk new_AGEMA_reg_buffer_142 ( .C ( clk ), .D ( new_AGEMA_signal_271 ), .Q ( new_AGEMA_signal_272 ) ) ;
    buf_clk new_AGEMA_reg_buffer_148 ( .C ( clk ), .D ( new_AGEMA_signal_277 ), .Q ( new_AGEMA_signal_278 ) ) ;

    /* register cells */
    reg_masked #(.security_order(2), .pipeline(1)) SO_reg_3_ ( .clk ( clk ), .D ({new_AGEMA_signal_236, new_AGEMA_signal_228, new_AGEMA_signal_220}), .Q ({SO_s2[3], SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(2), .pipeline(1)) SO_reg_2_ ( .clk ( clk ), .D ({new_AGEMA_signal_260, new_AGEMA_signal_252, new_AGEMA_signal_244}), .Q ({SO_s2[2], SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(2), .pipeline(1)) SO_reg_1_ ( .clk ( clk ), .D ({new_AGEMA_signal_278, new_AGEMA_signal_272, new_AGEMA_signal_266}), .Q ({SO_s2[1], SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(2), .pipeline(1)) SO_reg_0_ ( .clk ( clk ), .D ({new_AGEMA_signal_79, new_AGEMA_signal_78, N27}), .Q ({SO_s2[0], SO_s1[0], SO_s0[0]}) ) ;
endmodule
