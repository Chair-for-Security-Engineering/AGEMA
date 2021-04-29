/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* clock gating is added to the circuit, the latency increased 8 time(s)  */

module sbox_HPC2_BDDcudd_ClockGating_d4 (SI_s0, clk, SI_s1, SI_s2, SI_s3, SI_s4, Fresh, rst, SO_s0, SO_s1, SO_s2, SO_s3, SO_s4, Synch);
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
    wire signal_318 ;

    /* cells in depth 0 */
    ClockGatingController #(9) cell_40 ( .clk ( clk ), .rst ( rst ), .GatedClk ( signal_318 ), .Synch ( Synch ) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_23 ( .s ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[9], Fresh[8], Fresh[7], Fresh[6], Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .c ({signal_54, signal_53, signal_52, signal_51, signal_34}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_24 ( .s ({SI_s4[3], SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[19], Fresh[18], Fresh[17], Fresh[16], Fresh[15], Fresh[14], Fresh[13], Fresh[12], Fresh[11], Fresh[10]}), .c ({signal_58, signal_57, signal_56, signal_55, signal_35}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_25 ( .s ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25], Fresh[24], Fresh[23], Fresh[22], Fresh[21], Fresh[20]}), .c ({signal_66, signal_65, signal_64, signal_63, signal_36}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_26 ( .s ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_54, signal_53, signal_52, signal_51, signal_34}), .a ({signal_58, signal_57, signal_56, signal_55, signal_35}), .clk ( clk ), .r ({Fresh[39], Fresh[38], Fresh[37], Fresh[36], Fresh[35], Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30]}), .c ({signal_70, signal_69, signal_68, signal_67, signal_37}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_27 ( .s ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .a ({signal_58, signal_57, signal_56, signal_55, signal_35}), .clk ( clk ), .r ({Fresh[49], Fresh[48], Fresh[47], Fresh[46], Fresh[45], Fresh[44], Fresh[43], Fresh[42], Fresh[41], Fresh[40]}), .c ({signal_74, signal_73, signal_72, signal_71, signal_38}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_28 ( .s ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_54, signal_53, signal_52, signal_51, signal_34}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[59], Fresh[58], Fresh[57], Fresh[56], Fresh[55], Fresh[54], Fresh[53], Fresh[52], Fresh[51], Fresh[50]}), .c ({signal_78, signal_77, signal_76, signal_75, signal_39}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_29 ( .s ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_58, signal_57, signal_56, signal_55, signal_35}), .a ({signal_54, signal_53, signal_52, signal_51, signal_34}), .clk ( clk ), .r ({Fresh[69], Fresh[68], Fresh[67], Fresh[66], Fresh[65], Fresh[64], Fresh[63], Fresh[62], Fresh[61], Fresh[60]}), .c ({signal_82, signal_81, signal_80, signal_79, signal_40}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_30 ( .s ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_58, signal_57, signal_56, signal_55, signal_35}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[79], Fresh[78], Fresh[77], Fresh[76], Fresh[75], Fresh[74], Fresh[73], Fresh[72], Fresh[71], Fresh[70]}), .c ({signal_86, signal_85, signal_84, signal_83, signal_41}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_31 ( .s ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_58, signal_57, signal_56, signal_55, signal_35}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[89], Fresh[88], Fresh[87], Fresh[86], Fresh[85], Fresh[84], Fresh[83], Fresh[82], Fresh[81], Fresh[80]}), .c ({signal_90, signal_89, signal_88, signal_87, signal_42}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_32 ( .s ({SI_s4[2], SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_54, signal_53, signal_52, signal_51, signal_34}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[99], Fresh[98], Fresh[97], Fresh[96], Fresh[95], Fresh[94], Fresh[93], Fresh[92], Fresh[91], Fresh[90]}), .c ({signal_94, signal_93, signal_92, signal_91, signal_43}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_33 ( .s ({SI_s4[0], SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_82, signal_81, signal_80, signal_79, signal_40}), .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[109], Fresh[108], Fresh[107], Fresh[106], Fresh[105], Fresh[104], Fresh[103], Fresh[102], Fresh[101], Fresh[100]}), .c ({signal_102, signal_101, signal_100, signal_99, signal_44}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_34 ( .s ({SI_s4[0], SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_74, signal_73, signal_72, signal_71, signal_38}), .a ({signal_86, signal_85, signal_84, signal_83, signal_41}), .clk ( clk ), .r ({Fresh[119], Fresh[118], Fresh[117], Fresh[116], Fresh[115], Fresh[114], Fresh[113], Fresh[112], Fresh[111], Fresh[110]}), .c ({signal_106, signal_105, signal_104, signal_103, signal_45}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_35 ( .s ({SI_s4[0], SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_90, signal_89, signal_88, signal_87, signal_42}), .a ({signal_78, signal_77, signal_76, signal_75, signal_39}), .clk ( clk ), .r ({Fresh[129], Fresh[128], Fresh[127], Fresh[126], Fresh[125], Fresh[124], Fresh[123], Fresh[122], Fresh[121], Fresh[120]}), .c ({signal_110, signal_109, signal_108, signal_107, signal_46}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_36 ( .s ({SI_s4[1], SI_s3[1], SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_70, signal_69, signal_68, signal_67, signal_37}), .a ({signal_58, signal_57, signal_56, signal_55, signal_35}), .clk ( clk ), .r ({Fresh[139], Fresh[138], Fresh[137], Fresh[136], Fresh[135], Fresh[134], Fresh[133], Fresh[132], Fresh[131], Fresh[130]}), .c ({signal_118, signal_117, signal_116, signal_115, signal_16}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_37 ( .s ({SI_s4[0], SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_94, signal_93, signal_92, signal_91, signal_43}), .a ({signal_86, signal_85, signal_84, signal_83, signal_41}), .clk ( clk ), .r ({Fresh[149], Fresh[148], Fresh[147], Fresh[146], Fresh[145], Fresh[144], Fresh[143], Fresh[142], Fresh[141], Fresh[140]}), .c ({signal_122, signal_121, signal_120, signal_119, signal_15}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_38 ( .s ({SI_s4[1], SI_s3[1], SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_102, signal_101, signal_100, signal_99, signal_44}), .a ({signal_106, signal_105, signal_104, signal_103, signal_45}), .clk ( clk ), .r ({Fresh[159], Fresh[158], Fresh[157], Fresh[156], Fresh[155], Fresh[154], Fresh[153], Fresh[152], Fresh[151], Fresh[150]}), .c ({signal_126, signal_125, signal_124, signal_123, signal_18}) ) ;
    mux2_HPC2 #(.security_order(4), .pipeline(0)) cell_39 ( .s ({SI_s4[1], SI_s3[1], SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_110, signal_109, signal_108, signal_107, signal_46}), .a ({signal_66, signal_65, signal_64, signal_63, signal_36}), .clk ( clk ), .r ({Fresh[169], Fresh[168], Fresh[167], Fresh[166], Fresh[165], Fresh[164], Fresh[163], Fresh[162], Fresh[161], Fresh[160]}), .c ({signal_130, signal_129, signal_128, signal_127, signal_17}) ) ;

    /* register cells */
    reg_masked #(.security_order(4), .pipeline(0)) cell_0 ( .clk ( signal_318 ), .D ({signal_122, signal_121, signal_120, signal_119, signal_15}), .Q ({SO_s4[3], SO_s3[3], SO_s2[3], SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(4), .pipeline(0)) cell_1 ( .clk ( signal_318 ), .D ({signal_118, signal_117, signal_116, signal_115, signal_16}), .Q ({SO_s4[2], SO_s3[2], SO_s2[2], SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(4), .pipeline(0)) cell_2 ( .clk ( signal_318 ), .D ({signal_130, signal_129, signal_128, signal_127, signal_17}), .Q ({SO_s4[1], SO_s3[1], SO_s2[1], SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(4), .pipeline(0)) cell_3 ( .clk ( signal_318 ), .D ({signal_126, signal_125, signal_124, signal_123, signal_18}), .Q ({SO_s4[0], SO_s3[0], SO_s2[0], SO_s1[0], SO_s0[0]}) ) ;
endmodule
