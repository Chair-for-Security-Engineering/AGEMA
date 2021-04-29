/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* 5 register stage(s) are added to the circuit and formed a pipeline design */
/* the circuit has 6 register stage(s) in total */

module sbox_GHPCLL_Pipeline_d1 (SI_s0, clk, SI_s1, Fresh, SO_s0, SO_s1);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [51:0] Fresh ;
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

    /* cells in depth 0 */
    not_masked #(.low_latency(1), .pipeline(1)) U50 ( .a ({SI_s1[0], SI_s0[0]}), .b ({new_AGEMA_signal_35, n53}) ) ;
    not_masked #(.low_latency(1), .pipeline(1)) U53 ( .a ({SI_s1[3], SI_s0[3]}), .b ({new_AGEMA_signal_40, n52}) ) ;
    not_masked #(.low_latency(1), .pipeline(1)) U59 ( .a ({SI_s1[2], SI_s0[2]}), .b ({new_AGEMA_signal_42, n51}) ) ;

    /* cells in depth 1 */
    nor_GHPC #(.low_latency(1), .pipeline(1)) U51 ( .a ({SI_s1[1], SI_s0[1]}), .b ({SI_s1[2], SI_s0[2]}), .clk ( clk ), .r ({Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .c ({new_AGEMA_signal_38, n40}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) U52 ( .a ({new_AGEMA_signal_38, n40}), .b ({new_AGEMA_signal_114, new_AGEMA_signal_113}), .c ({new_AGEMA_signal_44, N12}) ) ;
    nor_GHPC #(.low_latency(1), .pipeline(1)) U54 ( .a ({SI_s1[2], SI_s0[2]}), .b ({new_AGEMA_signal_40, n52}), .clk ( clk ), .r ({Fresh[7], Fresh[6], Fresh[5], Fresh[4]}), .c ({new_AGEMA_signal_45, n41}) ) ;
    xnor_GHPC #(.low_latency(1), .pipeline(1)) U55 ( .a ({new_AGEMA_signal_116, new_AGEMA_signal_115}), .b ({new_AGEMA_signal_45, n41}), .c ({new_AGEMA_signal_51, n42}) ) ;
    nor_GHPC #(.low_latency(1), .pipeline(1)) U57 ( .a ({SI_s1[0], SI_s0[0]}), .b ({SI_s1[3], SI_s0[3]}), .clk ( clk ), .r ({Fresh[11], Fresh[10], Fresh[9], Fresh[8]}), .c ({new_AGEMA_signal_41, n43}) ) ;
    nor_GHPC #(.low_latency(1), .pipeline(1)) U60 ( .a ({new_AGEMA_signal_42, n51}), .b ({new_AGEMA_signal_35, n53}), .clk ( clk ), .r ({Fresh[15], Fresh[14], Fresh[13], Fresh[12]}), .c ({new_AGEMA_signal_47, n45}) ) ;
    nor_GHPC #(.low_latency(1), .pipeline(1)) U61 ( .a ({SI_s1[2], SI_s0[2]}), .b ({SI_s1[0], SI_s0[0]}), .clk ( clk ), .r ({Fresh[19], Fresh[18], Fresh[17], Fresh[16]}), .c ({new_AGEMA_signal_43, n48}) ) ;
    nand_GHPC #(.low_latency(1), .pipeline(1)) U67 ( .a ({new_AGEMA_signal_40, n52}), .b ({new_AGEMA_signal_42, n51}), .clk ( clk ), .r ({Fresh[23], Fresh[22], Fresh[21], Fresh[20]}), .c ({new_AGEMA_signal_50, n54}) ) ;
    xor_GHPC #(.low_latency(1), .pipeline(1)) U68 ( .a ({new_AGEMA_signal_50, n54}), .b ({new_AGEMA_signal_116, new_AGEMA_signal_115}), .c ({new_AGEMA_signal_53, N9}) ) ;
    buf_clk new_AGEMA_reg_buffer_23 ( .C ( clk ), .D ( SI_s0[3] ), .Q ( new_AGEMA_signal_113 ) ) ;
    buf_clk new_AGEMA_reg_buffer_24 ( .C ( clk ), .D ( SI_s1[3] ), .Q ( new_AGEMA_signal_114 ) ) ;
    buf_clk new_AGEMA_reg_buffer_25 ( .C ( clk ), .D ( n53 ), .Q ( new_AGEMA_signal_115 ) ) ;
    buf_clk new_AGEMA_reg_buffer_26 ( .C ( clk ), .D ( new_AGEMA_signal_35 ), .Q ( new_AGEMA_signal_116 ) ) ;
    buf_clk new_AGEMA_reg_buffer_27 ( .C ( clk ), .D ( SI_s0[1] ), .Q ( new_AGEMA_signal_117 ) ) ;
    buf_clk new_AGEMA_reg_buffer_28 ( .C ( clk ), .D ( SI_s1[1] ), .Q ( new_AGEMA_signal_118 ) ) ;
    buf_clk new_AGEMA_reg_buffer_29 ( .C ( clk ), .D ( SI_s0[2] ), .Q ( new_AGEMA_signal_119 ) ) ;
    buf_clk new_AGEMA_reg_buffer_30 ( .C ( clk ), .D ( SI_s1[2] ), .Q ( new_AGEMA_signal_120 ) ) ;

    /* cells in depth 2 */
    mux2_GHPC #(.low_latency(1), .pipeline(1)) U56 ( .s ({new_AGEMA_signal_118, new_AGEMA_signal_117}), .b ({new_AGEMA_signal_51, n42}), .a ({new_AGEMA_signal_120, new_AGEMA_signal_119}), .clk ( clk ), .r ({Fresh[27], Fresh[26], Fresh[25], Fresh[24]}), .c ({new_AGEMA_signal_54, N19}) ) ;
    nand_GHPC #(.low_latency(1), .pipeline(1)) U58 ( .a ({new_AGEMA_signal_41, n43}), .b ({new_AGEMA_signal_120, new_AGEMA_signal_119}), .clk ( clk ), .r ({Fresh[31], Fresh[30], Fresh[29], Fresh[28]}), .c ({new_AGEMA_signal_46, n47}) ) ;
    or_GHPC #(.low_latency(1), .pipeline(1)) U62 ( .a ({new_AGEMA_signal_114, new_AGEMA_signal_113}), .b ({new_AGEMA_signal_43, n48}), .clk ( clk ), .r ({Fresh[35], Fresh[34], Fresh[33], Fresh[32]}), .c ({new_AGEMA_signal_48, n44}) ) ;
    nand_GHPC #(.low_latency(1), .pipeline(1)) U65 ( .a ({new_AGEMA_signal_114, new_AGEMA_signal_113}), .b ({new_AGEMA_signal_43, n48}), .clk ( clk ), .r ({Fresh[39], Fresh[38], Fresh[37], Fresh[36]}), .c ({new_AGEMA_signal_49, n49}) ) ;
    buf_clk new_AGEMA_reg_buffer_31 ( .C ( clk ), .D ( n45 ), .Q ( new_AGEMA_signal_121 ) ) ;
    buf_clk new_AGEMA_reg_buffer_32 ( .C ( clk ), .D ( new_AGEMA_signal_47 ), .Q ( new_AGEMA_signal_122 ) ) ;
    buf_clk new_AGEMA_reg_buffer_33 ( .C ( clk ), .D ( new_AGEMA_signal_117 ), .Q ( new_AGEMA_signal_123 ) ) ;
    buf_clk new_AGEMA_reg_buffer_35 ( .C ( clk ), .D ( new_AGEMA_signal_118 ), .Q ( new_AGEMA_signal_125 ) ) ;
    buf_clk new_AGEMA_reg_buffer_43 ( .C ( clk ), .D ( N9 ), .Q ( new_AGEMA_signal_133 ) ) ;
    buf_clk new_AGEMA_reg_buffer_47 ( .C ( clk ), .D ( new_AGEMA_signal_53 ), .Q ( new_AGEMA_signal_137 ) ) ;
    buf_clk new_AGEMA_reg_buffer_51 ( .C ( clk ), .D ( N12 ), .Q ( new_AGEMA_signal_141 ) ) ;
    buf_clk new_AGEMA_reg_buffer_55 ( .C ( clk ), .D ( new_AGEMA_signal_44 ), .Q ( new_AGEMA_signal_145 ) ) ;

    /* cells in depth 3 */
    nor_GHPC #(.low_latency(1), .pipeline(1)) U63 ( .a ({new_AGEMA_signal_122, new_AGEMA_signal_121}), .b ({new_AGEMA_signal_48, n44}), .clk ( clk ), .r ({Fresh[43], Fresh[42], Fresh[41], Fresh[40]}), .c ({new_AGEMA_signal_52, n46}) ) ;
    buf_clk new_AGEMA_reg_buffer_34 ( .C ( clk ), .D ( new_AGEMA_signal_123 ), .Q ( new_AGEMA_signal_124 ) ) ;
    buf_clk new_AGEMA_reg_buffer_36 ( .C ( clk ), .D ( new_AGEMA_signal_125 ), .Q ( new_AGEMA_signal_126 ) ) ;
    buf_clk new_AGEMA_reg_buffer_37 ( .C ( clk ), .D ( n47 ), .Q ( new_AGEMA_signal_127 ) ) ;
    buf_clk new_AGEMA_reg_buffer_38 ( .C ( clk ), .D ( new_AGEMA_signal_46 ), .Q ( new_AGEMA_signal_128 ) ) ;
    buf_clk new_AGEMA_reg_buffer_39 ( .C ( clk ), .D ( n49 ), .Q ( new_AGEMA_signal_129 ) ) ;
    buf_clk new_AGEMA_reg_buffer_41 ( .C ( clk ), .D ( new_AGEMA_signal_49 ), .Q ( new_AGEMA_signal_131 ) ) ;
    buf_clk new_AGEMA_reg_buffer_44 ( .C ( clk ), .D ( new_AGEMA_signal_133 ), .Q ( new_AGEMA_signal_134 ) ) ;
    buf_clk new_AGEMA_reg_buffer_48 ( .C ( clk ), .D ( new_AGEMA_signal_137 ), .Q ( new_AGEMA_signal_138 ) ) ;
    buf_clk new_AGEMA_reg_buffer_52 ( .C ( clk ), .D ( new_AGEMA_signal_141 ), .Q ( new_AGEMA_signal_142 ) ) ;
    buf_clk new_AGEMA_reg_buffer_56 ( .C ( clk ), .D ( new_AGEMA_signal_145 ), .Q ( new_AGEMA_signal_146 ) ) ;
    buf_clk new_AGEMA_reg_buffer_59 ( .C ( clk ), .D ( N19 ), .Q ( new_AGEMA_signal_149 ) ) ;
    buf_clk new_AGEMA_reg_buffer_62 ( .C ( clk ), .D ( new_AGEMA_signal_54 ), .Q ( new_AGEMA_signal_152 ) ) ;

    /* cells in depth 4 */
    mux2_GHPC #(.low_latency(1), .pipeline(1)) U64 ( .s ({new_AGEMA_signal_126, new_AGEMA_signal_124}), .b ({new_AGEMA_signal_128, new_AGEMA_signal_127}), .a ({new_AGEMA_signal_52, n46}), .clk ( clk ), .r ({Fresh[47], Fresh[46], Fresh[45], Fresh[44]}), .c ({new_AGEMA_signal_55, n50}) ) ;
    buf_clk new_AGEMA_reg_buffer_40 ( .C ( clk ), .D ( new_AGEMA_signal_129 ), .Q ( new_AGEMA_signal_130 ) ) ;
    buf_clk new_AGEMA_reg_buffer_42 ( .C ( clk ), .D ( new_AGEMA_signal_131 ), .Q ( new_AGEMA_signal_132 ) ) ;
    buf_clk new_AGEMA_reg_buffer_45 ( .C ( clk ), .D ( new_AGEMA_signal_134 ), .Q ( new_AGEMA_signal_135 ) ) ;
    buf_clk new_AGEMA_reg_buffer_49 ( .C ( clk ), .D ( new_AGEMA_signal_138 ), .Q ( new_AGEMA_signal_139 ) ) ;
    buf_clk new_AGEMA_reg_buffer_53 ( .C ( clk ), .D ( new_AGEMA_signal_142 ), .Q ( new_AGEMA_signal_143 ) ) ;
    buf_clk new_AGEMA_reg_buffer_57 ( .C ( clk ), .D ( new_AGEMA_signal_146 ), .Q ( new_AGEMA_signal_147 ) ) ;
    buf_clk new_AGEMA_reg_buffer_60 ( .C ( clk ), .D ( new_AGEMA_signal_149 ), .Q ( new_AGEMA_signal_150 ) ) ;
    buf_clk new_AGEMA_reg_buffer_63 ( .C ( clk ), .D ( new_AGEMA_signal_152 ), .Q ( new_AGEMA_signal_153 ) ) ;

    /* cells in depth 5 */
    nand_GHPC #(.low_latency(1), .pipeline(1)) U66 ( .a ({new_AGEMA_signal_55, n50}), .b ({new_AGEMA_signal_132, new_AGEMA_signal_130}), .clk ( clk ), .r ({Fresh[51], Fresh[50], Fresh[49], Fresh[48]}), .c ({new_AGEMA_signal_56, N27}) ) ;
    buf_clk new_AGEMA_reg_buffer_46 ( .C ( clk ), .D ( new_AGEMA_signal_135 ), .Q ( new_AGEMA_signal_136 ) ) ;
    buf_clk new_AGEMA_reg_buffer_50 ( .C ( clk ), .D ( new_AGEMA_signal_139 ), .Q ( new_AGEMA_signal_140 ) ) ;
    buf_clk new_AGEMA_reg_buffer_54 ( .C ( clk ), .D ( new_AGEMA_signal_143 ), .Q ( new_AGEMA_signal_144 ) ) ;
    buf_clk new_AGEMA_reg_buffer_58 ( .C ( clk ), .D ( new_AGEMA_signal_147 ), .Q ( new_AGEMA_signal_148 ) ) ;
    buf_clk new_AGEMA_reg_buffer_61 ( .C ( clk ), .D ( new_AGEMA_signal_150 ), .Q ( new_AGEMA_signal_151 ) ) ;
    buf_clk new_AGEMA_reg_buffer_64 ( .C ( clk ), .D ( new_AGEMA_signal_153 ), .Q ( new_AGEMA_signal_154 ) ) ;

    /* register cells */
    reg_masked #(.low_latency(1), .pipeline(1)) SO_reg_3_ ( .clk ( clk ), .D ({new_AGEMA_signal_140, new_AGEMA_signal_136}), .Q ({SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.low_latency(1), .pipeline(1)) SO_reg_2_ ( .clk ( clk ), .D ({new_AGEMA_signal_148, new_AGEMA_signal_144}), .Q ({SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.low_latency(1), .pipeline(1)) SO_reg_1_ ( .clk ( clk ), .D ({new_AGEMA_signal_154, new_AGEMA_signal_151}), .Q ({SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.low_latency(1), .pipeline(1)) SO_reg_0_ ( .clk ( clk ), .D ({new_AGEMA_signal_56, N27}), .Q ({SO_s1[0], SO_s0[0]}) ) ;
endmodule
