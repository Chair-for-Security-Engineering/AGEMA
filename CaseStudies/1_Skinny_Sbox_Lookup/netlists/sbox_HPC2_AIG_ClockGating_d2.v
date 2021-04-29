/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* clock gating is added to the circuit, the latency increased 12 time(s)  */

module sbox_HPC2_AIG_ClockGating_d2 (SI_s0, clk, SI_s1, SI_s2, Fresh, rst, SO_s0, SO_s1, SO_s2, Synch);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [3:0] SI_s2 ;
    input rst ;
    input [50:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
    output [3:0] SO_s2 ;
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
    wire signal_67 ;
    wire signal_68 ;
    wire signal_71 ;
    wire signal_72 ;
    wire signal_75 ;
    wire signal_76 ;
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
    wire signal_203 ;

    /* cells in depth 0 */
    not_masked #(.security_order(2), .pipeline(0)) cell_23 ( .a ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_68, signal_67, signal_34}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_24 ( .a ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_72, signal_71, signal_35}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_25 ( .a ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_76, signal_75, signal_36}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_26 ( .a ({SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_80, signal_79, signal_37}) ) ;
    ClockGatingController #(13) cell_58 ( .clk ( clk ), .rst ( rst ), .GatedClk ( signal_203 ), .Synch ( Synch ) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_27 ( .a ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({SI_s2[0], SI_s1[0], SI_s0[0]}), .clk ( clk ), .r ({Fresh[2], Fresh[1], Fresh[0]}), .c ({signal_82, signal_81, signal_38}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_28 ( .a ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({SI_s2[1], SI_s1[1], SI_s0[1]}), .clk ( clk ), .r ({Fresh[5], Fresh[4], Fresh[3]}), .c ({signal_84, signal_83, signal_39}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_29 ( .a ({signal_82, signal_81, signal_38}), .b ({signal_86, signal_85, signal_40}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_30 ( .a ({signal_84, signal_83, signal_39}), .b ({signal_88, signal_87, signal_41}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_31 ( .a ({signal_72, signal_71, signal_35}), .b ({signal_76, signal_75, signal_36}), .clk ( clk ), .r ({Fresh[8], Fresh[7], Fresh[6]}), .c ({signal_90, signal_89, signal_42}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_32 ( .a ({signal_68, signal_67, signal_34}), .b ({signal_80, signal_79, signal_37}), .clk ( clk ), .r ({Fresh[11], Fresh[10], Fresh[9]}), .c ({signal_92, signal_91, signal_43}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_33 ( .a ({signal_72, signal_71, signal_35}), .b ({signal_80, signal_79, signal_37}), .clk ( clk ), .r ({Fresh[14], Fresh[13], Fresh[12]}), .c ({signal_94, signal_93, signal_44}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_34 ( .a ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_72, signal_71, signal_35}), .clk ( clk ), .r ({Fresh[17], Fresh[16], Fresh[15]}), .c ({signal_96, signal_95, signal_45}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_35 ( .a ({signal_68, signal_67, signal_34}), .b ({signal_72, signal_71, signal_35}), .clk ( clk ), .r ({Fresh[20], Fresh[19], Fresh[18]}), .c ({signal_98, signal_97, signal_46}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_36 ( .a ({signal_94, signal_93, signal_44}), .b ({signal_100, signal_99, signal_47}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_39 ( .a ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_90, signal_89, signal_42}), .c ({signal_106, signal_105, signal_16}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_40 ( .a ({SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_96, signal_95, signal_45}), .c ({signal_108, signal_107, signal_50}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_41 ( .a ({SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({signal_98, signal_97, signal_46}), .c ({signal_110, signal_109, signal_15}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_37 ( .a ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_92, signal_91, signal_43}), .clk ( clk ), .r ({Fresh[23], Fresh[22], Fresh[21]}), .c ({signal_102, signal_101, signal_48}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_38 ( .a ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_94, signal_93, signal_44}), .clk ( clk ), .r ({Fresh[26], Fresh[25], Fresh[24]}), .c ({signal_104, signal_103, signal_49}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_42 ( .a ({signal_102, signal_101, signal_48}), .b ({signal_112, signal_111, signal_51}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_43 ( .a ({signal_104, signal_103, signal_49}), .b ({signal_114, signal_113, signal_52}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_44 ( .a ({signal_68, signal_67, signal_34}), .b ({signal_100, signal_99, signal_47}), .clk ( clk ), .r ({Fresh[29], Fresh[28], Fresh[27]}), .c ({signal_116, signal_115, signal_53}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_45 ( .a ({signal_76, signal_75, signal_36}), .b ({signal_108, signal_107, signal_50}), .clk ( clk ), .r ({Fresh[32], Fresh[31], Fresh[30]}), .c ({signal_118, signal_117, signal_54}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_46 ( .a ({signal_118, signal_117, signal_54}), .b ({signal_120, signal_119, signal_55}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_47 ( .a ({signal_86, signal_85, signal_40}), .b ({signal_116, signal_115, signal_53}), .clk ( clk ), .r ({Fresh[35], Fresh[34], Fresh[33]}), .c ({signal_122, signal_121, signal_56}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_48 ( .a ({signal_76, signal_75, signal_36}), .b ({signal_112, signal_111, signal_51}), .clk ( clk ), .r ({Fresh[38], Fresh[37], Fresh[36]}), .c ({signal_124, signal_123, signal_57}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_49 ( .a ({signal_124, signal_123, signal_57}), .b ({signal_126, signal_125, signal_58}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_50 ( .a ({signal_120, signal_119, signal_55}), .b ({signal_88, signal_87, signal_41}), .clk ( clk ), .r ({Fresh[41], Fresh[40], Fresh[39]}), .c ({signal_128, signal_127, signal_59}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_52 ( .a ({signal_128, signal_127, signal_59}), .b ({signal_132, signal_131, signal_17}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_51 ( .a ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_122, signal_121, signal_56}), .clk ( clk ), .r ({Fresh[44], Fresh[43], Fresh[42]}), .c ({signal_130, signal_129, signal_60}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_53 ( .a ({signal_130, signal_129, signal_60}), .b ({signal_134, signal_133, signal_61}) ) ;

    /* cells in depth 9 */

    /* cells in depth 10 */
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_54 ( .a ({signal_126, signal_125, signal_58}), .b ({signal_134, signal_133, signal_61}), .clk ( clk ), .r ({Fresh[47], Fresh[46], Fresh[45]}), .c ({signal_136, signal_135, signal_62}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_55 ( .a ({signal_136, signal_135, signal_62}), .b ({signal_138, signal_137, signal_63}) ) ;

    /* cells in depth 11 */

    /* cells in depth 12 */
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_56 ( .a ({signal_114, signal_113, signal_52}), .b ({signal_138, signal_137, signal_63}), .clk ( clk ), .r ({Fresh[50], Fresh[49], Fresh[48]}), .c ({signal_140, signal_139, signal_64}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_57 ( .a ({signal_140, signal_139, signal_64}), .b ({signal_142, signal_141, signal_18}) ) ;

    /* register cells */
    reg_masked #(.security_order(2), .pipeline(0)) cell_0 ( .clk ( signal_203 ), .D ({signal_110, signal_109, signal_15}), .Q ({SO_s2[3], SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(2), .pipeline(0)) cell_1 ( .clk ( signal_203 ), .D ({signal_106, signal_105, signal_16}), .Q ({SO_s2[2], SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(2), .pipeline(0)) cell_2 ( .clk ( signal_203 ), .D ({signal_132, signal_131, signal_17}), .Q ({SO_s2[1], SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(2), .pipeline(0)) cell_3 ( .clk ( signal_203 ), .D ({signal_142, signal_141, signal_18}), .Q ({SO_s2[0], SO_s1[0], SO_s0[0]}) ) ;
endmodule
