/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* 8 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 9 register stage(s) in total */

module sbox_HPC2_BDDsylvan_Pipeline_d4 (X_s0, clk, X_s1, X_s2, X_s3, X_s4, Fresh, Y_s0, Y_s1, Y_s2, Y_s3, Y_s4);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input [3:0] X_s2 ;
    input [3:0] X_s3 ;
    input [3:0] X_s4 ;
    input [209:0] Fresh ;
    output [3:0] Y_s0 ;
    output [3:0] Y_s1 ;
    output [3:0] Y_s2 ;
    output [3:0] Y_s3 ;
    output [3:0] Y_s4 ;
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
    wire signal_58 ;
    wire signal_59 ;
    wire signal_60 ;
    wire signal_61 ;
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
    wire signal_95 ;
    wire signal_96 ;
    wire signal_97 ;
    wire signal_98 ;
    wire signal_99 ;
    wire signal_100 ;
    wire signal_101 ;
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
    wire signal_427 ;
    wire signal_428 ;
    wire signal_429 ;
    wire signal_430 ;
    wire signal_431 ;
    wire signal_432 ;
    wire signal_433 ;
    wire signal_434 ;
    wire signal_435 ;
    wire signal_436 ;
    wire signal_437 ;
    wire signal_438 ;
    wire signal_439 ;
    wire signal_440 ;
    wire signal_441 ;
    wire signal_442 ;
    wire signal_443 ;
    wire signal_444 ;
    wire signal_445 ;
    wire signal_446 ;
    wire signal_447 ;
    wire signal_448 ;
    wire signal_449 ;
    wire signal_450 ;
    wire signal_451 ;
    wire signal_452 ;
    wire signal_453 ;
    wire signal_454 ;
    wire signal_455 ;
    wire signal_456 ;
    wire signal_457 ;
    wire signal_458 ;
    wire signal_459 ;
    wire signal_460 ;
    wire signal_461 ;
    wire signal_462 ;
    wire signal_463 ;
    wire signal_464 ;
    wire signal_465 ;
    wire signal_466 ;
    wire signal_467 ;
    wire signal_468 ;
    wire signal_469 ;
    wire signal_470 ;
    wire signal_471 ;
    wire signal_472 ;
    wire signal_473 ;
    wire signal_474 ;
    wire signal_475 ;
    wire signal_476 ;
    wire signal_477 ;
    wire signal_478 ;
    wire signal_479 ;

    /* cells in depth 0 */

    /* cells in depth 1 */
    buf_clk cell_47 ( .C (clk), .D (X_s0[1]), .Q (signal_380) ) ;
    buf_clk cell_49 ( .C (clk), .D (X_s1[1]), .Q (signal_382) ) ;
    buf_clk cell_51 ( .C (clk), .D (X_s2[1]), .Q (signal_384) ) ;
    buf_clk cell_53 ( .C (clk), .D (X_s3[1]), .Q (signal_386) ) ;
    buf_clk cell_55 ( .C (clk), .D (X_s4[1]), .Q (signal_388) ) ;
    buf_clk cell_57 ( .C (clk), .D (X_s0[2]), .Q (signal_390) ) ;
    buf_clk cell_59 ( .C (clk), .D (X_s1[2]), .Q (signal_392) ) ;
    buf_clk cell_61 ( .C (clk), .D (X_s2[2]), .Q (signal_394) ) ;
    buf_clk cell_63 ( .C (clk), .D (X_s3[2]), .Q (signal_396) ) ;
    buf_clk cell_65 ( .C (clk), .D (X_s4[2]), .Q (signal_398) ) ;
    buf_clk cell_87 ( .C (clk), .D (X_s0[3]), .Q (signal_420) ) ;
    buf_clk cell_91 ( .C (clk), .D (X_s1[3]), .Q (signal_424) ) ;
    buf_clk cell_95 ( .C (clk), .D (X_s2[3]), .Q (signal_428) ) ;
    buf_clk cell_99 ( .C (clk), .D (X_s3[3]), .Q (signal_432) ) ;
    buf_clk cell_103 ( .C (clk), .D (X_s4[3]), .Q (signal_436) ) ;

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_26 ( .s ({X_s4[1], X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[9], Fresh[8], Fresh[7], Fresh[6], Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .c ({signal_61, signal_60, signal_59, signal_58, signal_37}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_27 ( .s ({X_s4[0], X_s3[0], X_s2[0], X_s1[0], X_s0[0]}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[19], Fresh[18], Fresh[17], Fresh[16], Fresh[15], Fresh[14], Fresh[13], Fresh[12], Fresh[11], Fresh[10]}), .c ({signal_69, signal_68, signal_67, signal_66, signal_38}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_28 ( .s ({X_s4[0], X_s3[0], X_s2[0], X_s1[0], X_s0[0]}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25], Fresh[24], Fresh[23], Fresh[22], Fresh[21], Fresh[20]}), .c ({signal_73, signal_72, signal_71, signal_70, signal_39}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_29 ( .s ({X_s4[1], X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[39], Fresh[38], Fresh[37], Fresh[36], Fresh[35], Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30]}), .c ({signal_77, signal_76, signal_75, signal_74, signal_40}) ) ;
    buf_clk cell_48 ( .C (clk), .D (signal_380), .Q (signal_381) ) ;
    buf_clk cell_50 ( .C (clk), .D (signal_382), .Q (signal_383) ) ;
    buf_clk cell_52 ( .C (clk), .D (signal_384), .Q (signal_385) ) ;
    buf_clk cell_54 ( .C (clk), .D (signal_386), .Q (signal_387) ) ;
    buf_clk cell_56 ( .C (clk), .D (signal_388), .Q (signal_389) ) ;
    buf_clk cell_58 ( .C (clk), .D (signal_390), .Q (signal_391) ) ;
    buf_clk cell_60 ( .C (clk), .D (signal_392), .Q (signal_393) ) ;
    buf_clk cell_62 ( .C (clk), .D (signal_394), .Q (signal_395) ) ;
    buf_clk cell_64 ( .C (clk), .D (signal_396), .Q (signal_397) ) ;
    buf_clk cell_66 ( .C (clk), .D (signal_398), .Q (signal_399) ) ;
    buf_clk cell_88 ( .C (clk), .D (signal_420), .Q (signal_421) ) ;
    buf_clk cell_92 ( .C (clk), .D (signal_424), .Q (signal_425) ) ;
    buf_clk cell_96 ( .C (clk), .D (signal_428), .Q (signal_429) ) ;
    buf_clk cell_100 ( .C (clk), .D (signal_432), .Q (signal_433) ) ;
    buf_clk cell_104 ( .C (clk), .D (signal_436), .Q (signal_437) ) ;

    /* cells in depth 3 */
    buf_clk cell_67 ( .C (clk), .D (signal_391), .Q (signal_400) ) ;
    buf_clk cell_69 ( .C (clk), .D (signal_393), .Q (signal_402) ) ;
    buf_clk cell_71 ( .C (clk), .D (signal_395), .Q (signal_404) ) ;
    buf_clk cell_73 ( .C (clk), .D (signal_397), .Q (signal_406) ) ;
    buf_clk cell_75 ( .C (clk), .D (signal_399), .Q (signal_408) ) ;
    buf_clk cell_77 ( .C (clk), .D (signal_37), .Q (signal_410) ) ;
    buf_clk cell_79 ( .C (clk), .D (signal_58), .Q (signal_412) ) ;
    buf_clk cell_81 ( .C (clk), .D (signal_59), .Q (signal_414) ) ;
    buf_clk cell_83 ( .C (clk), .D (signal_60), .Q (signal_416) ) ;
    buf_clk cell_85 ( .C (clk), .D (signal_61), .Q (signal_418) ) ;
    buf_clk cell_89 ( .C (clk), .D (signal_421), .Q (signal_422) ) ;
    buf_clk cell_93 ( .C (clk), .D (signal_425), .Q (signal_426) ) ;
    buf_clk cell_97 ( .C (clk), .D (signal_429), .Q (signal_430) ) ;
    buf_clk cell_101 ( .C (clk), .D (signal_433), .Q (signal_434) ) ;
    buf_clk cell_105 ( .C (clk), .D (signal_437), .Q (signal_438) ) ;
    buf_clk cell_107 ( .C (clk), .D (signal_39), .Q (signal_440) ) ;
    buf_clk cell_109 ( .C (clk), .D (signal_70), .Q (signal_442) ) ;
    buf_clk cell_111 ( .C (clk), .D (signal_71), .Q (signal_444) ) ;
    buf_clk cell_113 ( .C (clk), .D (signal_72), .Q (signal_446) ) ;
    buf_clk cell_115 ( .C (clk), .D (signal_73), .Q (signal_448) ) ;

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_30 ( .s ({signal_389, signal_387, signal_385, signal_383, signal_381}), .b ({signal_69, signal_68, signal_67, signal_66, signal_38}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[49], Fresh[48], Fresh[47], Fresh[46], Fresh[45], Fresh[44], Fresh[43], Fresh[42], Fresh[41], Fresh[40]}), .c ({signal_81, signal_80, signal_79, signal_78, signal_41}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_31 ( .s ({signal_389, signal_387, signal_385, signal_383, signal_381}), .b ({signal_69, signal_68, signal_67, signal_66, signal_38}), .a ({signal_73, signal_72, signal_71, signal_70, signal_39}), .clk (clk), .r ({Fresh[59], Fresh[58], Fresh[57], Fresh[56], Fresh[55], Fresh[54], Fresh[53], Fresh[52], Fresh[51], Fresh[50]}), .c ({signal_85, signal_84, signal_83, signal_82, signal_42}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_32 ( .s ({signal_389, signal_387, signal_385, signal_383, signal_381}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .a ({signal_69, signal_68, signal_67, signal_66, signal_38}), .clk (clk), .r ({Fresh[69], Fresh[68], Fresh[67], Fresh[66], Fresh[65], Fresh[64], Fresh[63], Fresh[62], Fresh[61], Fresh[60]}), .c ({signal_89, signal_88, signal_87, signal_86, signal_43}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_33 ( .s ({signal_389, signal_387, signal_385, signal_383, signal_381}), .b ({signal_73, signal_72, signal_71, signal_70, signal_39}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[79], Fresh[78], Fresh[77], Fresh[76], Fresh[75], Fresh[74], Fresh[73], Fresh[72], Fresh[71], Fresh[70]}), .c ({signal_93, signal_92, signal_91, signal_90, signal_44}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_34 ( .s ({signal_389, signal_387, signal_385, signal_383, signal_381}), .b ({signal_69, signal_68, signal_67, signal_66, signal_38}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[89], Fresh[88], Fresh[87], Fresh[86], Fresh[85], Fresh[84], Fresh[83], Fresh[82], Fresh[81], Fresh[80]}), .c ({signal_97, signal_96, signal_95, signal_94, signal_45}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_35 ( .s ({signal_389, signal_387, signal_385, signal_383, signal_381}), .b ({signal_73, signal_72, signal_71, signal_70, signal_39}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[99], Fresh[98], Fresh[97], Fresh[96], Fresh[95], Fresh[94], Fresh[93], Fresh[92], Fresh[91], Fresh[90]}), .c ({signal_101, signal_100, signal_99, signal_98, signal_46}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_36 ( .s ({signal_399, signal_397, signal_395, signal_393, signal_391}), .b ({signal_61, signal_60, signal_59, signal_58, signal_37}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[109], Fresh[108], Fresh[107], Fresh[106], Fresh[105], Fresh[104], Fresh[103], Fresh[102], Fresh[101], Fresh[100]}), .c ({signal_109, signal_108, signal_107, signal_106, signal_47}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_37 ( .s ({signal_399, signal_397, signal_395, signal_393, signal_391}), .b ({signal_77, signal_76, signal_75, signal_74, signal_40}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[119], Fresh[118], Fresh[117], Fresh[116], Fresh[115], Fresh[114], Fresh[113], Fresh[112], Fresh[111], Fresh[110]}), .c ({signal_113, signal_112, signal_111, signal_110, signal_48}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_38 ( .s ({signal_399, signal_397, signal_395, signal_393, signal_391}), .b ({signal_69, signal_68, signal_67, signal_66, signal_38}), .a ({signal_73, signal_72, signal_71, signal_70, signal_39}), .clk (clk), .r ({Fresh[129], Fresh[128], Fresh[127], Fresh[126], Fresh[125], Fresh[124], Fresh[123], Fresh[122], Fresh[121], Fresh[120]}), .c ({signal_117, signal_116, signal_115, signal_114, signal_49}) ) ;
    buf_clk cell_68 ( .C (clk), .D (signal_400), .Q (signal_401) ) ;
    buf_clk cell_70 ( .C (clk), .D (signal_402), .Q (signal_403) ) ;
    buf_clk cell_72 ( .C (clk), .D (signal_404), .Q (signal_405) ) ;
    buf_clk cell_74 ( .C (clk), .D (signal_406), .Q (signal_407) ) ;
    buf_clk cell_76 ( .C (clk), .D (signal_408), .Q (signal_409) ) ;
    buf_clk cell_78 ( .C (clk), .D (signal_410), .Q (signal_411) ) ;
    buf_clk cell_80 ( .C (clk), .D (signal_412), .Q (signal_413) ) ;
    buf_clk cell_82 ( .C (clk), .D (signal_414), .Q (signal_415) ) ;
    buf_clk cell_84 ( .C (clk), .D (signal_416), .Q (signal_417) ) ;
    buf_clk cell_86 ( .C (clk), .D (signal_418), .Q (signal_419) ) ;
    buf_clk cell_90 ( .C (clk), .D (signal_422), .Q (signal_423) ) ;
    buf_clk cell_94 ( .C (clk), .D (signal_426), .Q (signal_427) ) ;
    buf_clk cell_98 ( .C (clk), .D (signal_430), .Q (signal_431) ) ;
    buf_clk cell_102 ( .C (clk), .D (signal_434), .Q (signal_435) ) ;
    buf_clk cell_106 ( .C (clk), .D (signal_438), .Q (signal_439) ) ;
    buf_clk cell_108 ( .C (clk), .D (signal_440), .Q (signal_441) ) ;
    buf_clk cell_110 ( .C (clk), .D (signal_442), .Q (signal_443) ) ;
    buf_clk cell_112 ( .C (clk), .D (signal_444), .Q (signal_445) ) ;
    buf_clk cell_114 ( .C (clk), .D (signal_446), .Q (signal_447) ) ;
    buf_clk cell_116 ( .C (clk), .D (signal_448), .Q (signal_449) ) ;

    /* cells in depth 5 */
    buf_clk cell_117 ( .C (clk), .D (signal_423), .Q (signal_450) ) ;
    buf_clk cell_119 ( .C (clk), .D (signal_427), .Q (signal_452) ) ;
    buf_clk cell_121 ( .C (clk), .D (signal_431), .Q (signal_454) ) ;
    buf_clk cell_123 ( .C (clk), .D (signal_435), .Q (signal_456) ) ;
    buf_clk cell_125 ( .C (clk), .D (signal_439), .Q (signal_458) ) ;

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_39 ( .s ({signal_409, signal_407, signal_405, signal_403, signal_401}), .b ({signal_81, signal_80, signal_79, signal_78, signal_41}), .a ({signal_419, signal_417, signal_415, signal_413, signal_411}), .clk (clk), .r ({Fresh[139], Fresh[138], Fresh[137], Fresh[136], Fresh[135], Fresh[134], Fresh[133], Fresh[132], Fresh[131], Fresh[130]}), .c ({signal_121, signal_120, signal_119, signal_118, signal_50}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_40 ( .s ({signal_409, signal_407, signal_405, signal_403, signal_401}), .b ({signal_89, signal_88, signal_87, signal_86, signal_43}), .a ({signal_85, signal_84, signal_83, signal_82, signal_42}), .clk (clk), .r ({Fresh[149], Fresh[148], Fresh[147], Fresh[146], Fresh[145], Fresh[144], Fresh[143], Fresh[142], Fresh[141], Fresh[140]}), .c ({signal_125, signal_124, signal_123, signal_122, signal_51}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_41 ( .s ({signal_409, signal_407, signal_405, signal_403, signal_401}), .b ({signal_97, signal_96, signal_95, signal_94, signal_45}), .a ({signal_93, signal_92, signal_91, signal_90, signal_44}), .clk (clk), .r ({Fresh[159], Fresh[158], Fresh[157], Fresh[156], Fresh[155], Fresh[154], Fresh[153], Fresh[152], Fresh[151], Fresh[150]}), .c ({signal_129, signal_128, signal_127, signal_126, signal_52}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_42 ( .s ({signal_409, signal_407, signal_405, signal_403, signal_401}), .b ({signal_101, signal_100, signal_99, signal_98, signal_46}), .a ({signal_93, signal_92, signal_91, signal_90, signal_44}), .clk (clk), .r ({Fresh[169], Fresh[168], Fresh[167], Fresh[166], Fresh[165], Fresh[164], Fresh[163], Fresh[162], Fresh[161], Fresh[160]}), .c ({signal_133, signal_132, signal_131, signal_130, signal_53}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_43 ( .s ({signal_439, signal_435, signal_431, signal_427, signal_423}), .b ({signal_113, signal_112, signal_111, signal_110, signal_48}), .a ({signal_109, signal_108, signal_107, signal_106, signal_47}), .clk (clk), .r ({Fresh[179], Fresh[178], Fresh[177], Fresh[176], Fresh[175], Fresh[174], Fresh[173], Fresh[172], Fresh[171], Fresh[170]}), .c ({signal_141, signal_140, signal_139, signal_138, signal_36}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_44 ( .s ({signal_439, signal_435, signal_431, signal_427, signal_423}), .b ({signal_117, signal_116, signal_115, signal_114, signal_49}), .a ({signal_449, signal_447, signal_445, signal_443, signal_441}), .clk (clk), .r ({Fresh[189], Fresh[188], Fresh[187], Fresh[186], Fresh[185], Fresh[184], Fresh[183], Fresh[182], Fresh[181], Fresh[180]}), .c ({signal_145, signal_144, signal_143, signal_142, signal_35}) ) ;
    buf_clk cell_118 ( .C (clk), .D (signal_450), .Q (signal_451) ) ;
    buf_clk cell_120 ( .C (clk), .D (signal_452), .Q (signal_453) ) ;
    buf_clk cell_122 ( .C (clk), .D (signal_454), .Q (signal_455) ) ;
    buf_clk cell_124 ( .C (clk), .D (signal_456), .Q (signal_457) ) ;
    buf_clk cell_126 ( .C (clk), .D (signal_458), .Q (signal_459) ) ;

    /* cells in depth 7 */
    buf_clk cell_127 ( .C (clk), .D (signal_35), .Q (signal_460) ) ;
    buf_clk cell_129 ( .C (clk), .D (signal_142), .Q (signal_462) ) ;
    buf_clk cell_131 ( .C (clk), .D (signal_143), .Q (signal_464) ) ;
    buf_clk cell_133 ( .C (clk), .D (signal_144), .Q (signal_466) ) ;
    buf_clk cell_135 ( .C (clk), .D (signal_145), .Q (signal_468) ) ;
    buf_clk cell_137 ( .C (clk), .D (signal_36), .Q (signal_470) ) ;
    buf_clk cell_139 ( .C (clk), .D (signal_138), .Q (signal_472) ) ;
    buf_clk cell_141 ( .C (clk), .D (signal_139), .Q (signal_474) ) ;
    buf_clk cell_143 ( .C (clk), .D (signal_140), .Q (signal_476) ) ;
    buf_clk cell_145 ( .C (clk), .D (signal_141), .Q (signal_478) ) ;

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_45 ( .s ({signal_459, signal_457, signal_455, signal_453, signal_451}), .b ({signal_125, signal_124, signal_123, signal_122, signal_51}), .a ({signal_121, signal_120, signal_119, signal_118, signal_50}), .clk (clk), .r ({Fresh[199], Fresh[198], Fresh[197], Fresh[196], Fresh[195], Fresh[194], Fresh[193], Fresh[192], Fresh[191], Fresh[190]}), .c ({signal_149, signal_148, signal_147, signal_146, signal_34}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(1)) cell_46 ( .s ({signal_459, signal_457, signal_455, signal_453, signal_451}), .b ({signal_133, signal_132, signal_131, signal_130, signal_53}), .a ({signal_129, signal_128, signal_127, signal_126, signal_52}), .clk (clk), .r ({Fresh[209], Fresh[208], Fresh[207], Fresh[206], Fresh[205], Fresh[204], Fresh[203], Fresh[202], Fresh[201], Fresh[200]}), .c ({signal_153, signal_152, signal_151, signal_150, signal_33}) ) ;
    buf_clk cell_128 ( .C (clk), .D (signal_460), .Q (signal_461) ) ;
    buf_clk cell_130 ( .C (clk), .D (signal_462), .Q (signal_463) ) ;
    buf_clk cell_132 ( .C (clk), .D (signal_464), .Q (signal_465) ) ;
    buf_clk cell_134 ( .C (clk), .D (signal_466), .Q (signal_467) ) ;
    buf_clk cell_136 ( .C (clk), .D (signal_468), .Q (signal_469) ) ;
    buf_clk cell_138 ( .C (clk), .D (signal_470), .Q (signal_471) ) ;
    buf_clk cell_140 ( .C (clk), .D (signal_472), .Q (signal_473) ) ;
    buf_clk cell_142 ( .C (clk), .D (signal_474), .Q (signal_475) ) ;
    buf_clk cell_144 ( .C (clk), .D (signal_476), .Q (signal_477) ) ;
    buf_clk cell_146 ( .C (clk), .D (signal_478), .Q (signal_479) ) ;

    /* register cells */
    reg_masked #(.security_order(4), .pipeline(1)) cell_0 ( .clk (clk), .D ({signal_469, signal_467, signal_465, signal_463, signal_461}), .Q ({Y_s4[3], Y_s3[3], Y_s2[3], Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.security_order(4), .pipeline(1)) cell_1 ( .clk (clk), .D ({signal_479, signal_477, signal_475, signal_473, signal_471}), .Q ({Y_s4[2], Y_s3[2], Y_s2[2], Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.security_order(4), .pipeline(1)) cell_2 ( .clk (clk), .D ({signal_153, signal_152, signal_151, signal_150, signal_33}), .Q ({Y_s4[1], Y_s3[1], Y_s2[1], Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.security_order(4), .pipeline(1)) cell_3 ( .clk (clk), .D ({signal_149, signal_148, signal_147, signal_146, signal_34}), .Q ({Y_s4[0], Y_s3[0], Y_s2[0], Y_s1[0], Y_s0[0]}) ) ;
endmodule