/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* clock gating is added to the circuit, the latency increased 12 time(s)  */

module sbox_HPC2_AIG_ClockGating_d3 (SI_s0, clk, SI_s1, SI_s2, SI_s3, Fresh, rst, SO_s0, SO_s1, SO_s2, SO_s3, Synch);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [3:0] SI_s2 ;
    input [3:0] SI_s3 ;
    input rst ;
    input [101:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
    output [3:0] SO_s2 ;
    output [3:0] SO_s3 ;
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
    wire signal_68 ;
    wire signal_69 ;
    wire signal_70 ;
    wire signal_74 ;
    wire signal_75 ;
    wire signal_76 ;
    wire signal_80 ;
    wire signal_81 ;
    wire signal_82 ;
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
    wire signal_297 ;

    /* cells in depth 0 */
    not_masked #(.security_order(3), .pipeline(0)) cell_23 ( .a ({SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_70, signal_69, signal_68, signal_34}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_24 ( .a ({SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_76, signal_75, signal_74, signal_35}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_25 ( .a ({SI_s3[1], SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_82, signal_81, signal_80, signal_36}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_26 ( .a ({SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_88, signal_87, signal_86, signal_37}) ) ;
    ClockGatingController #(13) cell_58 ( .clk ( clk ), .rst ( rst ), .GatedClk ( signal_297 ), .Synch ( Synch ) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_27 ( .a ({SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .clk ( clk ), .r ({Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .c ({signal_91, signal_90, signal_89, signal_38}) ) ;
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_28 ( .a ({SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({SI_s3[1], SI_s2[1], SI_s1[1], SI_s0[1]}), .clk ( clk ), .r ({Fresh[11], Fresh[10], Fresh[9], Fresh[8], Fresh[7], Fresh[6]}), .c ({signal_94, signal_93, signal_92, signal_39}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_29 ( .a ({signal_91, signal_90, signal_89, signal_38}), .b ({signal_97, signal_96, signal_95, signal_40}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_30 ( .a ({signal_94, signal_93, signal_92, signal_39}), .b ({signal_100, signal_99, signal_98, signal_41}) ) ;
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_31 ( .a ({signal_76, signal_75, signal_74, signal_35}), .b ({signal_82, signal_81, signal_80, signal_36}), .clk ( clk ), .r ({Fresh[17], Fresh[16], Fresh[15], Fresh[14], Fresh[13], Fresh[12]}), .c ({signal_103, signal_102, signal_101, signal_42}) ) ;
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_32 ( .a ({signal_70, signal_69, signal_68, signal_34}), .b ({signal_88, signal_87, signal_86, signal_37}), .clk ( clk ), .r ({Fresh[23], Fresh[22], Fresh[21], Fresh[20], Fresh[19], Fresh[18]}), .c ({signal_106, signal_105, signal_104, signal_43}) ) ;
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_33 ( .a ({signal_76, signal_75, signal_74, signal_35}), .b ({signal_88, signal_87, signal_86, signal_37}), .clk ( clk ), .r ({Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25], Fresh[24]}), .c ({signal_109, signal_108, signal_107, signal_44}) ) ;
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_34 ( .a ({SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_76, signal_75, signal_74, signal_35}), .clk ( clk ), .r ({Fresh[35], Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30]}), .c ({signal_112, signal_111, signal_110, signal_45}) ) ;
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_35 ( .a ({signal_70, signal_69, signal_68, signal_34}), .b ({signal_76, signal_75, signal_74, signal_35}), .clk ( clk ), .r ({Fresh[41], Fresh[40], Fresh[39], Fresh[38], Fresh[37], Fresh[36]}), .c ({signal_115, signal_114, signal_113, signal_46}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_36 ( .a ({signal_109, signal_108, signal_107, signal_44}), .b ({signal_118, signal_117, signal_116, signal_47}) ) ;
    xor_HPC2 #(.security_order(3), .pipeline(0)) cell_39 ( .a ({SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_103, signal_102, signal_101, signal_42}), .c ({signal_127, signal_126, signal_125, signal_16}) ) ;
    xor_HPC2 #(.security_order(3), .pipeline(0)) cell_40 ( .a ({SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_112, signal_111, signal_110, signal_45}), .c ({signal_130, signal_129, signal_128, signal_50}) ) ;
    xor_HPC2 #(.security_order(3), .pipeline(0)) cell_41 ( .a ({SI_s3[0], SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_115, signal_114, signal_113, signal_46}), .c ({signal_133, signal_132, signal_131, signal_15}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_37 ( .a ({SI_s3[2], SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_106, signal_105, signal_104, signal_43}), .clk ( clk ), .r ({Fresh[47], Fresh[46], Fresh[45], Fresh[44], Fresh[43], Fresh[42]}), .c ({signal_121, signal_120, signal_119, signal_48}) ) ;
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_38 ( .a ({SI_s3[3], SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_109, signal_108, signal_107, signal_44}), .clk ( clk ), .r ({Fresh[53], Fresh[52], Fresh[51], Fresh[50], Fresh[49], Fresh[48]}), .c ({signal_124, signal_123, signal_122, signal_49}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_42 ( .a ({signal_121, signal_120, signal_119, signal_48}), .b ({signal_136, signal_135, signal_134, signal_51}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_43 ( .a ({signal_124, signal_123, signal_122, signal_49}), .b ({signal_139, signal_138, signal_137, signal_52}) ) ;
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_44 ( .a ({signal_70, signal_69, signal_68, signal_34}), .b ({signal_118, signal_117, signal_116, signal_47}), .clk ( clk ), .r ({Fresh[59], Fresh[58], Fresh[57], Fresh[56], Fresh[55], Fresh[54]}), .c ({signal_142, signal_141, signal_140, signal_53}) ) ;
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_45 ( .a ({signal_82, signal_81, signal_80, signal_36}), .b ({signal_130, signal_129, signal_128, signal_50}), .clk ( clk ), .r ({Fresh[65], Fresh[64], Fresh[63], Fresh[62], Fresh[61], Fresh[60]}), .c ({signal_145, signal_144, signal_143, signal_54}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_46 ( .a ({signal_145, signal_144, signal_143, signal_54}), .b ({signal_148, signal_147, signal_146, signal_55}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_47 ( .a ({signal_97, signal_96, signal_95, signal_40}), .b ({signal_142, signal_141, signal_140, signal_53}), .clk ( clk ), .r ({Fresh[71], Fresh[70], Fresh[69], Fresh[68], Fresh[67], Fresh[66]}), .c ({signal_151, signal_150, signal_149, signal_56}) ) ;
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_48 ( .a ({signal_82, signal_81, signal_80, signal_36}), .b ({signal_136, signal_135, signal_134, signal_51}), .clk ( clk ), .r ({Fresh[77], Fresh[76], Fresh[75], Fresh[74], Fresh[73], Fresh[72]}), .c ({signal_154, signal_153, signal_152, signal_57}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_49 ( .a ({signal_154, signal_153, signal_152, signal_57}), .b ({signal_157, signal_156, signal_155, signal_58}) ) ;
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_50 ( .a ({signal_148, signal_147, signal_146, signal_55}), .b ({signal_100, signal_99, signal_98, signal_41}), .clk ( clk ), .r ({Fresh[83], Fresh[82], Fresh[81], Fresh[80], Fresh[79], Fresh[78]}), .c ({signal_160, signal_159, signal_158, signal_59}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_52 ( .a ({signal_160, signal_159, signal_158, signal_59}), .b ({signal_166, signal_165, signal_164, signal_17}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_51 ( .a ({SI_s3[1], SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_151, signal_150, signal_149, signal_56}), .clk ( clk ), .r ({Fresh[89], Fresh[88], Fresh[87], Fresh[86], Fresh[85], Fresh[84]}), .c ({signal_163, signal_162, signal_161, signal_60}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_53 ( .a ({signal_163, signal_162, signal_161, signal_60}), .b ({signal_169, signal_168, signal_167, signal_61}) ) ;

    /* cells in depth 9 */

    /* cells in depth 10 */
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_54 ( .a ({signal_157, signal_156, signal_155, signal_58}), .b ({signal_169, signal_168, signal_167, signal_61}), .clk ( clk ), .r ({Fresh[95], Fresh[94], Fresh[93], Fresh[92], Fresh[91], Fresh[90]}), .c ({signal_172, signal_171, signal_170, signal_62}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_55 ( .a ({signal_172, signal_171, signal_170, signal_62}), .b ({signal_175, signal_174, signal_173, signal_63}) ) ;

    /* cells in depth 11 */

    /* cells in depth 12 */
    and_HPC2 #(.security_order(3), .pipeline(0)) cell_56 ( .a ({signal_139, signal_138, signal_137, signal_52}), .b ({signal_175, signal_174, signal_173, signal_63}), .clk ( clk ), .r ({Fresh[101], Fresh[100], Fresh[99], Fresh[98], Fresh[97], Fresh[96]}), .c ({signal_178, signal_177, signal_176, signal_64}) ) ;
    not_masked #(.security_order(3), .pipeline(0)) cell_57 ( .a ({signal_178, signal_177, signal_176, signal_64}), .b ({signal_181, signal_180, signal_179, signal_18}) ) ;

    /* register cells */
    reg_masked #(.security_order(3), .pipeline(0)) cell_0 ( .clk ( signal_297 ), .D ({signal_133, signal_132, signal_131, signal_15}), .Q ({SO_s3[3], SO_s2[3], SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(3), .pipeline(0)) cell_1 ( .clk ( signal_297 ), .D ({signal_127, signal_126, signal_125, signal_16}), .Q ({SO_s3[2], SO_s2[2], SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(3), .pipeline(0)) cell_2 ( .clk ( signal_297 ), .D ({signal_166, signal_165, signal_164, signal_17}), .Q ({SO_s3[1], SO_s2[1], SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(3), .pipeline(0)) cell_3 ( .clk ( signal_297 ), .D ({signal_181, signal_180, signal_179, signal_18}), .Q ({SO_s3[0], SO_s2[0], SO_s1[0], SO_s0[0]}) ) ;
endmodule
