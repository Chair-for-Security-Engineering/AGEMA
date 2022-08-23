/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* 8 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 9 register stage(s) in total */

module sbox_HPC2_BDDsylvan_Pipeline_d3 (X_s0, clk, X_s1, X_s2, X_s3, Fresh, Y_s0, Y_s1, Y_s2, Y_s3);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input [3:0] X_s2 ;
    input [3:0] X_s3 ;
    input [125:0] Fresh ;
    output [3:0] Y_s0 ;
    output [3:0] Y_s1 ;
    output [3:0] Y_s2 ;
    output [3:0] Y_s3 ;
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
    wire signal_267 ;
    wire signal_268 ;
    wire signal_269 ;
    wire signal_270 ;
    wire signal_271 ;
    wire signal_272 ;
    wire signal_273 ;
    wire signal_274 ;
    wire signal_275 ;
    wire signal_276 ;
    wire signal_277 ;
    wire signal_278 ;
    wire signal_279 ;
    wire signal_280 ;
    wire signal_281 ;
    wire signal_282 ;
    wire signal_283 ;
    wire signal_284 ;
    wire signal_285 ;
    wire signal_286 ;
    wire signal_287 ;
    wire signal_288 ;
    wire signal_289 ;
    wire signal_290 ;
    wire signal_291 ;
    wire signal_292 ;
    wire signal_293 ;
    wire signal_294 ;
    wire signal_295 ;
    wire signal_296 ;
    wire signal_297 ;
    wire signal_298 ;
    wire signal_299 ;
    wire signal_300 ;
    wire signal_301 ;
    wire signal_302 ;
    wire signal_303 ;
    wire signal_304 ;
    wire signal_305 ;
    wire signal_306 ;
    wire signal_307 ;
    wire signal_308 ;
    wire signal_309 ;
    wire signal_310 ;
    wire signal_311 ;
    wire signal_312 ;
    wire signal_313 ;
    wire signal_314 ;
    wire signal_315 ;
    wire signal_316 ;
    wire signal_317 ;
    wire signal_318 ;
    wire signal_319 ;
    wire signal_320 ;
    wire signal_321 ;
    wire signal_322 ;
    wire signal_323 ;
    wire signal_324 ;
    wire signal_325 ;
    wire signal_326 ;
    wire signal_327 ;
    wire signal_328 ;
    wire signal_329 ;
    wire signal_330 ;
    wire signal_331 ;
    wire signal_332 ;
    wire signal_333 ;
    wire signal_334 ;
    wire signal_335 ;
    wire signal_336 ;
    wire signal_337 ;
    wire signal_338 ;
    wire signal_339 ;
    wire signal_340 ;
    wire signal_341 ;
    wire signal_342 ;
    wire signal_343 ;
    wire signal_344 ;
    wire signal_345 ;
    wire signal_346 ;

    /* cells in depth 0 */

    /* cells in depth 1 */
    buf_clk cell_47 ( .C (clk), .D (X_s0[1]), .Q (signal_267) ) ;
    buf_clk cell_49 ( .C (clk), .D (X_s1[1]), .Q (signal_269) ) ;
    buf_clk cell_51 ( .C (clk), .D (X_s2[1]), .Q (signal_271) ) ;
    buf_clk cell_53 ( .C (clk), .D (X_s3[1]), .Q (signal_273) ) ;
    buf_clk cell_55 ( .C (clk), .D (X_s0[2]), .Q (signal_275) ) ;
    buf_clk cell_57 ( .C (clk), .D (X_s1[2]), .Q (signal_277) ) ;
    buf_clk cell_59 ( .C (clk), .D (X_s2[2]), .Q (signal_279) ) ;
    buf_clk cell_61 ( .C (clk), .D (X_s3[2]), .Q (signal_281) ) ;
    buf_clk cell_79 ( .C (clk), .D (X_s0[3]), .Q (signal_299) ) ;
    buf_clk cell_83 ( .C (clk), .D (X_s1[3]), .Q (signal_303) ) ;
    buf_clk cell_87 ( .C (clk), .D (X_s2[3]), .Q (signal_307) ) ;
    buf_clk cell_91 ( .C (clk), .D (X_s3[3]), .Q (signal_311) ) ;

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_26 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({1'b0, 1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .c ({signal_59, signal_58, signal_57, signal_37}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_27 ( .s ({X_s3[0], X_s2[0], X_s1[0], X_s0[0]}), .b ({1'b0, 1'b0, 1'b0, 1'b1}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[11], Fresh[10], Fresh[9], Fresh[8], Fresh[7], Fresh[6]}), .c ({signal_65, signal_64, signal_63, signal_38}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_28 ( .s ({X_s3[0], X_s2[0], X_s1[0], X_s0[0]}), .b ({1'b0, 1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[17], Fresh[16], Fresh[15], Fresh[14], Fresh[13], Fresh[12]}), .c ({signal_68, signal_67, signal_66, signal_39}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_29 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({1'b0, 1'b0, 1'b0, 1'b1}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[23], Fresh[22], Fresh[21], Fresh[20], Fresh[19], Fresh[18]}), .c ({signal_71, signal_70, signal_69, signal_40}) ) ;
    buf_clk cell_48 ( .C (clk), .D (signal_267), .Q (signal_268) ) ;
    buf_clk cell_50 ( .C (clk), .D (signal_269), .Q (signal_270) ) ;
    buf_clk cell_52 ( .C (clk), .D (signal_271), .Q (signal_272) ) ;
    buf_clk cell_54 ( .C (clk), .D (signal_273), .Q (signal_274) ) ;
    buf_clk cell_56 ( .C (clk), .D (signal_275), .Q (signal_276) ) ;
    buf_clk cell_58 ( .C (clk), .D (signal_277), .Q (signal_278) ) ;
    buf_clk cell_60 ( .C (clk), .D (signal_279), .Q (signal_280) ) ;
    buf_clk cell_62 ( .C (clk), .D (signal_281), .Q (signal_282) ) ;
    buf_clk cell_80 ( .C (clk), .D (signal_299), .Q (signal_300) ) ;
    buf_clk cell_84 ( .C (clk), .D (signal_303), .Q (signal_304) ) ;
    buf_clk cell_88 ( .C (clk), .D (signal_307), .Q (signal_308) ) ;
    buf_clk cell_92 ( .C (clk), .D (signal_311), .Q (signal_312) ) ;

    /* cells in depth 3 */
    buf_clk cell_63 ( .C (clk), .D (signal_276), .Q (signal_283) ) ;
    buf_clk cell_65 ( .C (clk), .D (signal_278), .Q (signal_285) ) ;
    buf_clk cell_67 ( .C (clk), .D (signal_280), .Q (signal_287) ) ;
    buf_clk cell_69 ( .C (clk), .D (signal_282), .Q (signal_289) ) ;
    buf_clk cell_71 ( .C (clk), .D (signal_37), .Q (signal_291) ) ;
    buf_clk cell_73 ( .C (clk), .D (signal_57), .Q (signal_293) ) ;
    buf_clk cell_75 ( .C (clk), .D (signal_58), .Q (signal_295) ) ;
    buf_clk cell_77 ( .C (clk), .D (signal_59), .Q (signal_297) ) ;
    buf_clk cell_81 ( .C (clk), .D (signal_300), .Q (signal_301) ) ;
    buf_clk cell_85 ( .C (clk), .D (signal_304), .Q (signal_305) ) ;
    buf_clk cell_89 ( .C (clk), .D (signal_308), .Q (signal_309) ) ;
    buf_clk cell_93 ( .C (clk), .D (signal_312), .Q (signal_313) ) ;
    buf_clk cell_95 ( .C (clk), .D (signal_39), .Q (signal_315) ) ;
    buf_clk cell_97 ( .C (clk), .D (signal_66), .Q (signal_317) ) ;
    buf_clk cell_99 ( .C (clk), .D (signal_67), .Q (signal_319) ) ;
    buf_clk cell_101 ( .C (clk), .D (signal_68), .Q (signal_321) ) ;

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_30 ( .s ({signal_274, signal_272, signal_270, signal_268}), .b ({signal_65, signal_64, signal_63, signal_38}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25], Fresh[24]}), .c ({signal_74, signal_73, signal_72, signal_41}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_31 ( .s ({signal_274, signal_272, signal_270, signal_268}), .b ({signal_65, signal_64, signal_63, signal_38}), .a ({signal_68, signal_67, signal_66, signal_39}), .clk (clk), .r ({Fresh[35], Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30]}), .c ({signal_77, signal_76, signal_75, signal_42}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_32 ( .s ({signal_274, signal_272, signal_270, signal_268}), .b ({1'b0, 1'b0, 1'b0, 1'b0}), .a ({signal_65, signal_64, signal_63, signal_38}), .clk (clk), .r ({Fresh[41], Fresh[40], Fresh[39], Fresh[38], Fresh[37], Fresh[36]}), .c ({signal_80, signal_79, signal_78, signal_43}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_33 ( .s ({signal_274, signal_272, signal_270, signal_268}), .b ({signal_68, signal_67, signal_66, signal_39}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[47], Fresh[46], Fresh[45], Fresh[44], Fresh[43], Fresh[42]}), .c ({signal_83, signal_82, signal_81, signal_44}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_34 ( .s ({signal_274, signal_272, signal_270, signal_268}), .b ({signal_65, signal_64, signal_63, signal_38}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[53], Fresh[52], Fresh[51], Fresh[50], Fresh[49], Fresh[48]}), .c ({signal_86, signal_85, signal_84, signal_45}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_35 ( .s ({signal_274, signal_272, signal_270, signal_268}), .b ({signal_68, signal_67, signal_66, signal_39}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[59], Fresh[58], Fresh[57], Fresh[56], Fresh[55], Fresh[54]}), .c ({signal_89, signal_88, signal_87, signal_46}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_36 ( .s ({signal_282, signal_280, signal_278, signal_276}), .b ({signal_59, signal_58, signal_57, signal_37}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[65], Fresh[64], Fresh[63], Fresh[62], Fresh[61], Fresh[60]}), .c ({signal_95, signal_94, signal_93, signal_47}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_37 ( .s ({signal_282, signal_280, signal_278, signal_276}), .b ({signal_71, signal_70, signal_69, signal_40}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[71], Fresh[70], Fresh[69], Fresh[68], Fresh[67], Fresh[66]}), .c ({signal_98, signal_97, signal_96, signal_48}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_38 ( .s ({signal_282, signal_280, signal_278, signal_276}), .b ({signal_65, signal_64, signal_63, signal_38}), .a ({signal_68, signal_67, signal_66, signal_39}), .clk (clk), .r ({Fresh[77], Fresh[76], Fresh[75], Fresh[74], Fresh[73], Fresh[72]}), .c ({signal_101, signal_100, signal_99, signal_49}) ) ;
    buf_clk cell_64 ( .C (clk), .D (signal_283), .Q (signal_284) ) ;
    buf_clk cell_66 ( .C (clk), .D (signal_285), .Q (signal_286) ) ;
    buf_clk cell_68 ( .C (clk), .D (signal_287), .Q (signal_288) ) ;
    buf_clk cell_70 ( .C (clk), .D (signal_289), .Q (signal_290) ) ;
    buf_clk cell_72 ( .C (clk), .D (signal_291), .Q (signal_292) ) ;
    buf_clk cell_74 ( .C (clk), .D (signal_293), .Q (signal_294) ) ;
    buf_clk cell_76 ( .C (clk), .D (signal_295), .Q (signal_296) ) ;
    buf_clk cell_78 ( .C (clk), .D (signal_297), .Q (signal_298) ) ;
    buf_clk cell_82 ( .C (clk), .D (signal_301), .Q (signal_302) ) ;
    buf_clk cell_86 ( .C (clk), .D (signal_305), .Q (signal_306) ) ;
    buf_clk cell_90 ( .C (clk), .D (signal_309), .Q (signal_310) ) ;
    buf_clk cell_94 ( .C (clk), .D (signal_313), .Q (signal_314) ) ;
    buf_clk cell_96 ( .C (clk), .D (signal_315), .Q (signal_316) ) ;
    buf_clk cell_98 ( .C (clk), .D (signal_317), .Q (signal_318) ) ;
    buf_clk cell_100 ( .C (clk), .D (signal_319), .Q (signal_320) ) ;
    buf_clk cell_102 ( .C (clk), .D (signal_321), .Q (signal_322) ) ;

    /* cells in depth 5 */
    buf_clk cell_103 ( .C (clk), .D (signal_302), .Q (signal_323) ) ;
    buf_clk cell_105 ( .C (clk), .D (signal_306), .Q (signal_325) ) ;
    buf_clk cell_107 ( .C (clk), .D (signal_310), .Q (signal_327) ) ;
    buf_clk cell_109 ( .C (clk), .D (signal_314), .Q (signal_329) ) ;

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_39 ( .s ({signal_290, signal_288, signal_286, signal_284}), .b ({signal_74, signal_73, signal_72, signal_41}), .a ({signal_298, signal_296, signal_294, signal_292}), .clk (clk), .r ({Fresh[83], Fresh[82], Fresh[81], Fresh[80], Fresh[79], Fresh[78]}), .c ({signal_104, signal_103, signal_102, signal_50}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_40 ( .s ({signal_290, signal_288, signal_286, signal_284}), .b ({signal_80, signal_79, signal_78, signal_43}), .a ({signal_77, signal_76, signal_75, signal_42}), .clk (clk), .r ({Fresh[89], Fresh[88], Fresh[87], Fresh[86], Fresh[85], Fresh[84]}), .c ({signal_107, signal_106, signal_105, signal_51}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_41 ( .s ({signal_290, signal_288, signal_286, signal_284}), .b ({signal_86, signal_85, signal_84, signal_45}), .a ({signal_83, signal_82, signal_81, signal_44}), .clk (clk), .r ({Fresh[95], Fresh[94], Fresh[93], Fresh[92], Fresh[91], Fresh[90]}), .c ({signal_110, signal_109, signal_108, signal_52}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_42 ( .s ({signal_290, signal_288, signal_286, signal_284}), .b ({signal_89, signal_88, signal_87, signal_46}), .a ({signal_83, signal_82, signal_81, signal_44}), .clk (clk), .r ({Fresh[101], Fresh[100], Fresh[99], Fresh[98], Fresh[97], Fresh[96]}), .c ({signal_113, signal_112, signal_111, signal_53}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_43 ( .s ({signal_314, signal_310, signal_306, signal_302}), .b ({signal_98, signal_97, signal_96, signal_48}), .a ({signal_95, signal_94, signal_93, signal_47}), .clk (clk), .r ({Fresh[107], Fresh[106], Fresh[105], Fresh[104], Fresh[103], Fresh[102]}), .c ({signal_119, signal_118, signal_117, signal_36}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_44 ( .s ({signal_314, signal_310, signal_306, signal_302}), .b ({signal_101, signal_100, signal_99, signal_49}), .a ({signal_322, signal_320, signal_318, signal_316}), .clk (clk), .r ({Fresh[113], Fresh[112], Fresh[111], Fresh[110], Fresh[109], Fresh[108]}), .c ({signal_122, signal_121, signal_120, signal_35}) ) ;
    buf_clk cell_104 ( .C (clk), .D (signal_323), .Q (signal_324) ) ;
    buf_clk cell_106 ( .C (clk), .D (signal_325), .Q (signal_326) ) ;
    buf_clk cell_108 ( .C (clk), .D (signal_327), .Q (signal_328) ) ;
    buf_clk cell_110 ( .C (clk), .D (signal_329), .Q (signal_330) ) ;

    /* cells in depth 7 */
    buf_clk cell_111 ( .C (clk), .D (signal_35), .Q (signal_331) ) ;
    buf_clk cell_113 ( .C (clk), .D (signal_120), .Q (signal_333) ) ;
    buf_clk cell_115 ( .C (clk), .D (signal_121), .Q (signal_335) ) ;
    buf_clk cell_117 ( .C (clk), .D (signal_122), .Q (signal_337) ) ;
    buf_clk cell_119 ( .C (clk), .D (signal_36), .Q (signal_339) ) ;
    buf_clk cell_121 ( .C (clk), .D (signal_117), .Q (signal_341) ) ;
    buf_clk cell_123 ( .C (clk), .D (signal_118), .Q (signal_343) ) ;
    buf_clk cell_125 ( .C (clk), .D (signal_119), .Q (signal_345) ) ;

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_45 ( .s ({signal_330, signal_328, signal_326, signal_324}), .b ({signal_107, signal_106, signal_105, signal_51}), .a ({signal_104, signal_103, signal_102, signal_50}), .clk (clk), .r ({Fresh[119], Fresh[118], Fresh[117], Fresh[116], Fresh[115], Fresh[114]}), .c ({signal_125, signal_124, signal_123, signal_34}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(1)) cell_46 ( .s ({signal_330, signal_328, signal_326, signal_324}), .b ({signal_113, signal_112, signal_111, signal_53}), .a ({signal_110, signal_109, signal_108, signal_52}), .clk (clk), .r ({Fresh[125], Fresh[124], Fresh[123], Fresh[122], Fresh[121], Fresh[120]}), .c ({signal_128, signal_127, signal_126, signal_33}) ) ;
    buf_clk cell_112 ( .C (clk), .D (signal_331), .Q (signal_332) ) ;
    buf_clk cell_114 ( .C (clk), .D (signal_333), .Q (signal_334) ) ;
    buf_clk cell_116 ( .C (clk), .D (signal_335), .Q (signal_336) ) ;
    buf_clk cell_118 ( .C (clk), .D (signal_337), .Q (signal_338) ) ;
    buf_clk cell_120 ( .C (clk), .D (signal_339), .Q (signal_340) ) ;
    buf_clk cell_122 ( .C (clk), .D (signal_341), .Q (signal_342) ) ;
    buf_clk cell_124 ( .C (clk), .D (signal_343), .Q (signal_344) ) ;
    buf_clk cell_126 ( .C (clk), .D (signal_345), .Q (signal_346) ) ;

    /* register cells */
    reg_masked #(.security_order(3), .pipeline(1)) cell_0 ( .clk (clk), .D ({signal_338, signal_336, signal_334, signal_332}), .Q ({Y_s3[3], Y_s2[3], Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.security_order(3), .pipeline(1)) cell_1 ( .clk (clk), .D ({signal_346, signal_344, signal_342, signal_340}), .Q ({Y_s3[2], Y_s2[2], Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.security_order(3), .pipeline(1)) cell_2 ( .clk (clk), .D ({signal_128, signal_127, signal_126, signal_33}), .Q ({Y_s3[1], Y_s2[1], Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.security_order(3), .pipeline(1)) cell_3 ( .clk (clk), .D ({signal_125, signal_124, signal_123, signal_34}), .Q ({Y_s3[0], Y_s2[0], Y_s1[0], Y_s0[0]}) ) ;
endmodule