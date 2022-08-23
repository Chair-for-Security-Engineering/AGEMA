/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* 8 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 9 register stage(s) in total */

module sbox_HPC2_BDDcudd_Pipeline_d4 (SI_s0, clk, SI_s1, SI_s2, SI_s3, SI_s4, Fresh, SO_s0, SO_s1, SO_s2, SO_s3, SO_s4);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [3:0] SI_s2 ;
    input [3:0] SI_s3 ;
    input [3:0] SI_s4 ;
    input [169:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
    output [3:0] SO_s2 ;
    output [3:0] SO_s3 ;
    output [3:0] SO_s4 ;
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
    wire signal_51 ;
    wire signal_52 ;
    wire signal_53 ;
    wire signal_54 ;
    wire signal_55 ;
    wire signal_56 ;
    wire signal_57 ;
    wire signal_58 ;
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
    wire signal_90 ;
    wire signal_91 ;
    wire signal_92 ;
    wire signal_93 ;
    wire signal_94 ;
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
    wire signal_347 ;
    wire signal_348 ;
    wire signal_349 ;
    wire signal_350 ;
    wire signal_351 ;
    wire signal_352 ;
    wire signal_353 ;
    wire signal_354 ;
    wire signal_355 ;
    wire signal_356 ;
    wire signal_357 ;
    wire signal_358 ;
    wire signal_359 ;
    wire signal_360 ;
    wire signal_361 ;
    wire signal_362 ;
    wire signal_363 ;
    wire signal_364 ;
    wire signal_365 ;
    wire signal_366 ;
    wire signal_367 ;
    wire signal_368 ;
    wire signal_369 ;
    wire signal_370 ;
    wire signal_371 ;
    wire signal_372 ;
    wire signal_373 ;
    wire signal_374 ;
    wire signal_375 ;
    wire signal_376 ;
    wire signal_377 ;
    wire signal_378 ;
    wire signal_379 ;
    wire signal_380 ;
    wire signal_381 ;
    wire signal_382 ;
    wire signal_383 ;
    wire signal_384 ;
    wire signal_385 ;
    wire signal_386 ;
    wire signal_387 ;
    wire signal_388 ;
    wire signal_389 ;
    wire signal_390 ;
    wire signal_391 ;
    wire signal_392 ;
    wire signal_393 ;
    wire signal_394 ;
    wire signal_395 ;
    wire signal_396 ;
    wire signal_397 ;
    wire signal_398 ;
    wire signal_399 ;
    wire signal_400 ;
    wire signal_401 ;
    wire signal_402 ;
    wire signal_403 ;
    wire signal_404 ;
    wire signal_405 ;
    wire signal_406 ;
    wire signal_407 ;
    wire signal_408 ;
    wire signal_409 ;
    wire signal_410 ;
    wire signal_411 ;
    wire signal_412 ;
    wire signal_413 ;
    wire signal_414 ;
    wire signal_415 ;
    wire signal_416 ;
    wire signal_417 ;
    wire signal_418 ;
    wire signal_419 ;
    wire signal_420 ;
    wire signal_421 ;
    wire signal_422 ;
    wire signal_423 ;
    wire signal_424 ;
    wire signal_425 ;
    wire signal_426 ;

    /* cells in depth 0 */

    /* cells in depth 1 */
    buf_clk cell_40 ( .C ( clk ), .D ( SI_s0[2] ), .Q ( signal_317 ) ) ;
    buf_clk cell_42 ( .C ( clk ), .D ( SI_s1[2] ), .Q ( signal_319 ) ) ;
    buf_clk cell_44 ( .C ( clk ), .D ( SI_s2[2] ), .Q ( signal_321 ) ) ;
    buf_clk cell_46 ( .C ( clk ), .D ( SI_s3[2] ), .Q ( signal_323 ) ) ;
    buf_clk cell_48 ( .C ( clk ), .D ( SI_s4[2] ), .Q ( signal_325 ) ) ;
    buf_clk cell_50 ( .C ( clk ), .D ( SI_s0[0] ), .Q ( signal_327 ) ) ;
    buf_clk cell_54 ( .C ( clk ), .D ( SI_s1[0] ), .Q ( signal_331 ) ) ;
    buf_clk cell_58 ( .C ( clk ), .D ( SI_s2[0] ), .Q ( signal_335 ) ) ;
    buf_clk cell_62 ( .C ( clk ), .D ( SI_s3[0] ), .Q ( signal_339 ) ) ;
    buf_clk cell_66 ( .C ( clk ), .D ( SI_s4[0] ), .Q ( signal_343 ) ) ;
    buf_clk cell_70 ( .C ( clk ), .D ( SI_s0[1] ), .Q ( signal_347 ) ) ;
    buf_clk cell_74 ( .C ( clk ), .D ( SI_s1[1] ), .Q ( signal_351 ) ) ;
    buf_clk cell_78 ( .C ( clk ), .D ( SI_s2[1] ), .Q ( signal_355 ) ) ;
    buf_clk cell_82 ( .C ( clk ), .D ( SI_s3[1] ), .Q ( signal_359 ) ) ;
    buf_clk cell_86 ( .C ( clk ), .D ( SI_s4[1] ), .Q ( signal_363 ) ) ;

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_23 ( .s ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[9], Fresh[8], Fresh[7], Fresh[6], Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .c ({signal_54, signal_53, signal_52, signal_51, signal_34}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_24 ( .s ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[19], Fresh[18], Fresh[17], Fresh[16], Fresh[15], Fresh[14], Fresh[13], Fresh[12], Fresh[11], Fresh[10]}), .c ({signal_58, signal_57, signal_56, signal_55, signal_35}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_25 ( .s ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25], Fresh[24], Fresh[23], Fresh[22], Fresh[21], Fresh[20]}), .c ({signal_66, signal_65, signal_64, signal_63, signal_36}) ) ;
    buf_clk cell_41 ( .C ( clk ), .D ( signal_317 ), .Q ( signal_318 ) ) ;
    buf_clk cell_43 ( .C ( clk ), .D ( signal_319 ), .Q ( signal_320 ) ) ;
    buf_clk cell_45 ( .C ( clk ), .D ( signal_321 ), .Q ( signal_322 ) ) ;
    buf_clk cell_47 ( .C ( clk ), .D ( signal_323 ), .Q ( signal_324 ) ) ;
    buf_clk cell_49 ( .C ( clk ), .D ( signal_325 ), .Q ( signal_326 ) ) ;
    buf_clk cell_51 ( .C ( clk ), .D ( signal_327 ), .Q ( signal_328 ) ) ;
    buf_clk cell_55 ( .C ( clk ), .D ( signal_331 ), .Q ( signal_332 ) ) ;
    buf_clk cell_59 ( .C ( clk ), .D ( signal_335 ), .Q ( signal_336 ) ) ;
    buf_clk cell_63 ( .C ( clk ), .D ( signal_339 ), .Q ( signal_340 ) ) ;
    buf_clk cell_67 ( .C ( clk ), .D ( signal_343 ), .Q ( signal_344 ) ) ;
    buf_clk cell_71 ( .C ( clk ), .D ( signal_347 ), .Q ( signal_348 ) ) ;
    buf_clk cell_75 ( .C ( clk ), .D ( signal_351 ), .Q ( signal_352 ) ) ;
    buf_clk cell_79 ( .C ( clk ), .D ( signal_355 ), .Q ( signal_356 ) ) ;
    buf_clk cell_83 ( .C ( clk ), .D ( signal_359 ), .Q ( signal_360 ) ) ;
    buf_clk cell_87 ( .C ( clk ), .D ( signal_363 ), .Q ( signal_364 ) ) ;

    /* cells in depth 3 */
    buf_clk cell_52 ( .C ( clk ), .D ( signal_328 ), .Q ( signal_329 ) ) ;
    buf_clk cell_56 ( .C ( clk ), .D ( signal_332 ), .Q ( signal_333 ) ) ;
    buf_clk cell_60 ( .C ( clk ), .D ( signal_336 ), .Q ( signal_337 ) ) ;
    buf_clk cell_64 ( .C ( clk ), .D ( signal_340 ), .Q ( signal_341 ) ) ;
    buf_clk cell_68 ( .C ( clk ), .D ( signal_344 ), .Q ( signal_345 ) ) ;
    buf_clk cell_72 ( .C ( clk ), .D ( signal_348 ), .Q ( signal_349 ) ) ;
    buf_clk cell_76 ( .C ( clk ), .D ( signal_352 ), .Q ( signal_353 ) ) ;
    buf_clk cell_80 ( .C ( clk ), .D ( signal_356 ), .Q ( signal_357 ) ) ;
    buf_clk cell_84 ( .C ( clk ), .D ( signal_360 ), .Q ( signal_361 ) ) ;
    buf_clk cell_88 ( .C ( clk ), .D ( signal_364 ), .Q ( signal_365 ) ) ;
    buf_clk cell_90 ( .C ( clk ), .D ( signal_35 ), .Q ( signal_367 ) ) ;
    buf_clk cell_92 ( .C ( clk ), .D ( signal_55 ), .Q ( signal_369 ) ) ;
    buf_clk cell_94 ( .C ( clk ), .D ( signal_56 ), .Q ( signal_371 ) ) ;
    buf_clk cell_96 ( .C ( clk ), .D ( signal_57 ), .Q ( signal_373 ) ) ;
    buf_clk cell_98 ( .C ( clk ), .D ( signal_58 ), .Q ( signal_375 ) ) ;
    buf_clk cell_110 ( .C ( clk ), .D ( signal_36 ), .Q ( signal_387 ) ) ;
    buf_clk cell_114 ( .C ( clk ), .D ( signal_63 ), .Q ( signal_391 ) ) ;
    buf_clk cell_118 ( .C ( clk ), .D ( signal_64 ), .Q ( signal_395 ) ) ;
    buf_clk cell_122 ( .C ( clk ), .D ( signal_65 ), .Q ( signal_399 ) ) ;
    buf_clk cell_126 ( .C ( clk ), .D ( signal_66 ), .Q ( signal_403 ) ) ;

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_26 ( .s ({signal_326, signal_324, signal_322, signal_320, signal_318}), .b ({signal_54, signal_53, signal_52, signal_51, signal_34}), .a ({signal_58, signal_57, signal_56, signal_55, signal_35}), .clk ( clk ), .r ({Fresh[39], Fresh[38], Fresh[37], Fresh[36], Fresh[35], Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30]}), .c ({signal_70, signal_69, signal_68, signal_67, signal_37}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_27 ( .s ({signal_326, signal_324, signal_322, signal_320, signal_318}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .a ({signal_58, signal_57, signal_56, signal_55, signal_35}), .clk ( clk ), .r ({Fresh[49], Fresh[48], Fresh[47], Fresh[46], Fresh[45], Fresh[44], Fresh[43], Fresh[42], Fresh[41], Fresh[40]}), .c ({signal_74, signal_73, signal_72, signal_71, signal_38}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_28 ( .s ({signal_326, signal_324, signal_322, signal_320, signal_318}), .b ({signal_54, signal_53, signal_52, signal_51, signal_34}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[59], Fresh[58], Fresh[57], Fresh[56], Fresh[55], Fresh[54], Fresh[53], Fresh[52], Fresh[51], Fresh[50]}), .c ({signal_78, signal_77, signal_76, signal_75, signal_39}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_29 ( .s ({signal_326, signal_324, signal_322, signal_320, signal_318}), .b ({signal_58, signal_57, signal_56, signal_55, signal_35}), .a ({signal_54, signal_53, signal_52, signal_51, signal_34}), .clk ( clk ), .r ({Fresh[69], Fresh[68], Fresh[67], Fresh[66], Fresh[65], Fresh[64], Fresh[63], Fresh[62], Fresh[61], Fresh[60]}), .c ({signal_82, signal_81, signal_80, signal_79, signal_40}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_30 ( .s ({signal_326, signal_324, signal_322, signal_320, signal_318}), .b ({signal_58, signal_57, signal_56, signal_55, signal_35}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[79], Fresh[78], Fresh[77], Fresh[76], Fresh[75], Fresh[74], Fresh[73], Fresh[72], Fresh[71], Fresh[70]}), .c ({signal_86, signal_85, signal_84, signal_83, signal_41}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_31 ( .s ({signal_326, signal_324, signal_322, signal_320, signal_318}), .b ({signal_58, signal_57, signal_56, signal_55, signal_35}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[89], Fresh[88], Fresh[87], Fresh[86], Fresh[85], Fresh[84], Fresh[83], Fresh[82], Fresh[81], Fresh[80]}), .c ({signal_90, signal_89, signal_88, signal_87, signal_42}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_32 ( .s ({signal_326, signal_324, signal_322, signal_320, signal_318}), .b ({signal_54, signal_53, signal_52, signal_51, signal_34}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[99], Fresh[98], Fresh[97], Fresh[96], Fresh[95], Fresh[94], Fresh[93], Fresh[92], Fresh[91], Fresh[90]}), .c ({signal_94, signal_93, signal_92, signal_91, signal_43}) ) ;
    buf_clk cell_53 ( .C ( clk ), .D ( signal_329 ), .Q ( signal_330 ) ) ;
    buf_clk cell_57 ( .C ( clk ), .D ( signal_333 ), .Q ( signal_334 ) ) ;
    buf_clk cell_61 ( .C ( clk ), .D ( signal_337 ), .Q ( signal_338 ) ) ;
    buf_clk cell_65 ( .C ( clk ), .D ( signal_341 ), .Q ( signal_342 ) ) ;
    buf_clk cell_69 ( .C ( clk ), .D ( signal_345 ), .Q ( signal_346 ) ) ;
    buf_clk cell_73 ( .C ( clk ), .D ( signal_349 ), .Q ( signal_350 ) ) ;
    buf_clk cell_77 ( .C ( clk ), .D ( signal_353 ), .Q ( signal_354 ) ) ;
    buf_clk cell_81 ( .C ( clk ), .D ( signal_357 ), .Q ( signal_358 ) ) ;
    buf_clk cell_85 ( .C ( clk ), .D ( signal_361 ), .Q ( signal_362 ) ) ;
    buf_clk cell_89 ( .C ( clk ), .D ( signal_365 ), .Q ( signal_366 ) ) ;
    buf_clk cell_91 ( .C ( clk ), .D ( signal_367 ), .Q ( signal_368 ) ) ;
    buf_clk cell_93 ( .C ( clk ), .D ( signal_369 ), .Q ( signal_370 ) ) ;
    buf_clk cell_95 ( .C ( clk ), .D ( signal_371 ), .Q ( signal_372 ) ) ;
    buf_clk cell_97 ( .C ( clk ), .D ( signal_373 ), .Q ( signal_374 ) ) ;
    buf_clk cell_99 ( .C ( clk ), .D ( signal_375 ), .Q ( signal_376 ) ) ;
    buf_clk cell_111 ( .C ( clk ), .D ( signal_387 ), .Q ( signal_388 ) ) ;
    buf_clk cell_115 ( .C ( clk ), .D ( signal_391 ), .Q ( signal_392 ) ) ;
    buf_clk cell_119 ( .C ( clk ), .D ( signal_395 ), .Q ( signal_396 ) ) ;
    buf_clk cell_123 ( .C ( clk ), .D ( signal_399 ), .Q ( signal_400 ) ) ;
    buf_clk cell_127 ( .C ( clk ), .D ( signal_403 ), .Q ( signal_404 ) ) ;

    /* cells in depth 5 */
    buf_clk cell_100 ( .C ( clk ), .D ( signal_350 ), .Q ( signal_377 ) ) ;
    buf_clk cell_102 ( .C ( clk ), .D ( signal_354 ), .Q ( signal_379 ) ) ;
    buf_clk cell_104 ( .C ( clk ), .D ( signal_358 ), .Q ( signal_381 ) ) ;
    buf_clk cell_106 ( .C ( clk ), .D ( signal_362 ), .Q ( signal_383 ) ) ;
    buf_clk cell_108 ( .C ( clk ), .D ( signal_366 ), .Q ( signal_385 ) ) ;
    buf_clk cell_112 ( .C ( clk ), .D ( signal_388 ), .Q ( signal_389 ) ) ;
    buf_clk cell_116 ( .C ( clk ), .D ( signal_392 ), .Q ( signal_393 ) ) ;
    buf_clk cell_120 ( .C ( clk ), .D ( signal_396 ), .Q ( signal_397 ) ) ;
    buf_clk cell_124 ( .C ( clk ), .D ( signal_400 ), .Q ( signal_401 ) ) ;
    buf_clk cell_128 ( .C ( clk ), .D ( signal_404 ), .Q ( signal_405 ) ) ;

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_33 ( .s ({signal_346, signal_342, signal_338, signal_334, signal_330}), .b ({signal_82, signal_81, signal_80, signal_79, signal_40}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[109], Fresh[108], Fresh[107], Fresh[106], Fresh[105], Fresh[104], Fresh[103], Fresh[102], Fresh[101], Fresh[100]}), .c ({signal_102, signal_101, signal_100, signal_99, signal_44}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_34 ( .s ({signal_346, signal_342, signal_338, signal_334, signal_330}), .b ({signal_74, signal_73, signal_72, signal_71, signal_38}), .a ({signal_86, signal_85, signal_84, signal_83, signal_41}), .clk ( clk ), .r ({Fresh[119], Fresh[118], Fresh[117], Fresh[116], Fresh[115], Fresh[114], Fresh[113], Fresh[112], Fresh[111], Fresh[110]}), .c ({signal_106, signal_105, signal_104, signal_103, signal_45}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_35 ( .s ({signal_346, signal_342, signal_338, signal_334, signal_330}), .b ({signal_90, signal_89, signal_88, signal_87, signal_42}), .a ({signal_78, signal_77, signal_76, signal_75, signal_39}), .clk ( clk ), .r ({Fresh[129], Fresh[128], Fresh[127], Fresh[126], Fresh[125], Fresh[124], Fresh[123], Fresh[122], Fresh[121], Fresh[120]}), .c ({signal_110, signal_109, signal_108, signal_107, signal_46}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_36 ( .s ({signal_366, signal_362, signal_358, signal_354, signal_350}), .b ({signal_70, signal_69, signal_68, signal_67, signal_37}), .a ({signal_376, signal_374, signal_372, signal_370, signal_368}), .clk ( clk ), .r ({Fresh[139], Fresh[138], Fresh[137], Fresh[136], Fresh[135], Fresh[134], Fresh[133], Fresh[132], Fresh[131], Fresh[130]}), .c ({signal_118, signal_117, signal_116, signal_115, signal_16}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_37 ( .s ({signal_346, signal_342, signal_338, signal_334, signal_330}), .b ({signal_94, signal_93, signal_92, signal_91, signal_43}), .a ({signal_86, signal_85, signal_84, signal_83, signal_41}), .clk ( clk ), .r ({Fresh[149], Fresh[148], Fresh[147], Fresh[146], Fresh[145], Fresh[144], Fresh[143], Fresh[142], Fresh[141], Fresh[140]}), .c ({signal_122, signal_121, signal_120, signal_119, signal_15}) ) ;
    buf_clk cell_101 ( .C ( clk ), .D ( signal_377 ), .Q ( signal_378 ) ) ;
    buf_clk cell_103 ( .C ( clk ), .D ( signal_379 ), .Q ( signal_380 ) ) ;
    buf_clk cell_105 ( .C ( clk ), .D ( signal_381 ), .Q ( signal_382 ) ) ;
    buf_clk cell_107 ( .C ( clk ), .D ( signal_383 ), .Q ( signal_384 ) ) ;
    buf_clk cell_109 ( .C ( clk ), .D ( signal_385 ), .Q ( signal_386 ) ) ;
    buf_clk cell_113 ( .C ( clk ), .D ( signal_389 ), .Q ( signal_390 ) ) ;
    buf_clk cell_117 ( .C ( clk ), .D ( signal_393 ), .Q ( signal_394 ) ) ;
    buf_clk cell_121 ( .C ( clk ), .D ( signal_397 ), .Q ( signal_398 ) ) ;
    buf_clk cell_125 ( .C ( clk ), .D ( signal_401 ), .Q ( signal_402 ) ) ;
    buf_clk cell_129 ( .C ( clk ), .D ( signal_405 ), .Q ( signal_406 ) ) ;

    /* cells in depth 7 */
    buf_clk cell_130 ( .C ( clk ), .D ( signal_15 ), .Q ( signal_407 ) ) ;
    buf_clk cell_132 ( .C ( clk ), .D ( signal_119 ), .Q ( signal_409 ) ) ;
    buf_clk cell_134 ( .C ( clk ), .D ( signal_120 ), .Q ( signal_411 ) ) ;
    buf_clk cell_136 ( .C ( clk ), .D ( signal_121 ), .Q ( signal_413 ) ) ;
    buf_clk cell_138 ( .C ( clk ), .D ( signal_122 ), .Q ( signal_415 ) ) ;
    buf_clk cell_140 ( .C ( clk ), .D ( signal_16 ), .Q ( signal_417 ) ) ;
    buf_clk cell_142 ( .C ( clk ), .D ( signal_115 ), .Q ( signal_419 ) ) ;
    buf_clk cell_144 ( .C ( clk ), .D ( signal_116 ), .Q ( signal_421 ) ) ;
    buf_clk cell_146 ( .C ( clk ), .D ( signal_117 ), .Q ( signal_423 ) ) ;
    buf_clk cell_148 ( .C ( clk ), .D ( signal_118 ), .Q ( signal_425 ) ) ;

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_38 ( .s ({signal_386, signal_384, signal_382, signal_380, signal_378}), .b ({signal_102, signal_101, signal_100, signal_99, signal_44}), .a ({signal_106, signal_105, signal_104, signal_103, signal_45}), .clk ( clk ), .r ({Fresh[159], Fresh[158], Fresh[157], Fresh[156], Fresh[155], Fresh[154], Fresh[153], Fresh[152], Fresh[151], Fresh[150]}), .c ({signal_126, signal_125, signal_124, signal_123, signal_18}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_39 ( .s ({signal_386, signal_384, signal_382, signal_380, signal_378}), .b ({signal_110, signal_109, signal_108, signal_107, signal_46}), .a ({signal_406, signal_402, signal_398, signal_394, signal_390}), .clk ( clk ), .r ({Fresh[169], Fresh[168], Fresh[167], Fresh[166], Fresh[165], Fresh[164], Fresh[163], Fresh[162], Fresh[161], Fresh[160]}), .c ({signal_130, signal_129, signal_128, signal_127, signal_17}) ) ;
    buf_clk cell_131 ( .C ( clk ), .D ( signal_407 ), .Q ( signal_408 ) ) ;
    buf_clk cell_133 ( .C ( clk ), .D ( signal_409 ), .Q ( signal_410 ) ) ;
    buf_clk cell_135 ( .C ( clk ), .D ( signal_411 ), .Q ( signal_412 ) ) ;
    buf_clk cell_137 ( .C ( clk ), .D ( signal_413 ), .Q ( signal_414 ) ) ;
    buf_clk cell_139 ( .C ( clk ), .D ( signal_415 ), .Q ( signal_416 ) ) ;
    buf_clk cell_141 ( .C ( clk ), .D ( signal_417 ), .Q ( signal_418 ) ) ;
    buf_clk cell_143 ( .C ( clk ), .D ( signal_419 ), .Q ( signal_420 ) ) ;
    buf_clk cell_145 ( .C ( clk ), .D ( signal_421 ), .Q ( signal_422 ) ) ;
    buf_clk cell_147 ( .C ( clk ), .D ( signal_423 ), .Q ( signal_424 ) ) ;
    buf_clk cell_149 ( .C ( clk ), .D ( signal_425 ), .Q ( signal_426 ) ) ;

    /* register cells */
    reg_masked #(.security_order(4), .pipeline(1)) cell_0 ( .clk ( clk ), .D ({signal_416, signal_414, signal_412, signal_410, signal_408}), .Q ({SO_s4[3], SO_s3[3], SO_s2[3], SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(4), .pipeline(1)) cell_1 ( .clk ( clk ), .D ({signal_426, signal_424, signal_422, signal_420, signal_418}), .Q ({SO_s4[2], SO_s3[2], SO_s2[2], SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(4), .pipeline(1)) cell_2 ( .clk ( clk ), .D ({signal_130, signal_129, signal_128, signal_127, signal_17}), .Q ({SO_s4[1], SO_s3[1], SO_s2[1], SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(4), .pipeline(1)) cell_3 ( .clk ( clk ), .D ({signal_126, signal_125, signal_124, signal_123, signal_18}), .Q ({SO_s4[0], SO_s3[0], SO_s2[0], SO_s1[0], SO_s0[0]}) ) ;
endmodule