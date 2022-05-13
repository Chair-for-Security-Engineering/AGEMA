/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* clock gating is added to the circuit, the latency increased 8 time(s)  */

module sbox_HPC2_BDDsylvan_ClockGating_d2 (SI_s0, clk, SI_s1, SI_s2, Fresh, rst, SO_s0, SO_s1, SO_s2, Synch);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [3:0] SI_s2 ;
    input rst ;
    input [62:0] Fresh ;
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
    wire signal_53 ;
    wire signal_54 ;
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
    wire signal_71 ;
    wire signal_72 ;
    wire signal_73 ;
    wire signal_74 ;
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
    wire signal_93 ;
    wire signal_94 ;
    wire signal_95 ;
    wire signal_96 ;
    wire signal_97 ;
    wire signal_98 ;
    wire signal_99 ;
    wire signal_100 ;
    wire signal_173 ;

    /* cells in depth 0 */
    ClockGatingController #(9) cell_44 ( .clk ( clk ), .rst ( rst ), .GatedClk ( signal_173 ), .Synch ( Synch ) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_23 ( .s ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[2], Fresh[1], Fresh[0]}), .c ({signal_54, signal_53, signal_34}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_24 ( .s ({SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({1'b0, 1'b0, 1'b1}), .a ({1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[5], Fresh[4], Fresh[3]}), .c ({signal_58, signal_57, signal_35}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_25 ( .s ({SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[8], Fresh[7], Fresh[6]}), .c ({signal_60, signal_59, signal_36}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_26 ( .s ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({1'b0, 1'b0, 1'b1}), .a ({1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[11], Fresh[10], Fresh[9]}), .c ({signal_62, signal_61, signal_37}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_27 ( .s ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_58, signal_57, signal_35}), .a ({1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[14], Fresh[13], Fresh[12]}), .c ({signal_64, signal_63, signal_38}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_28 ( .s ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_58, signal_57, signal_35}), .a ({signal_60, signal_59, signal_36}), .clk ( clk ), .r ({Fresh[17], Fresh[16], Fresh[15]}), .c ({signal_66, signal_65, signal_39}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_29 ( .s ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({1'b0, 1'b0, 1'b0}), .a ({signal_58, signal_57, signal_35}), .clk ( clk ), .r ({Fresh[20], Fresh[19], Fresh[18]}), .c ({signal_68, signal_67, signal_40}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_30 ( .s ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_60, signal_59, signal_36}), .a ({1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[23], Fresh[22], Fresh[21]}), .c ({signal_70, signal_69, signal_41}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_31 ( .s ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_58, signal_57, signal_35}), .a ({1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[26], Fresh[25], Fresh[24]}), .c ({signal_72, signal_71, signal_42}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_32 ( .s ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({signal_60, signal_59, signal_36}), .a ({1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[29], Fresh[28], Fresh[27]}), .c ({signal_74, signal_73, signal_43}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_33 ( .s ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_54, signal_53, signal_34}), .a ({1'b0, 1'b0, 1'b1}), .clk ( clk ), .r ({Fresh[32], Fresh[31], Fresh[30]}), .c ({signal_78, signal_77, signal_44}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_34 ( .s ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_62, signal_61, signal_37}), .a ({1'b0, 1'b0, 1'b0}), .clk ( clk ), .r ({Fresh[35], Fresh[34], Fresh[33]}), .c ({signal_80, signal_79, signal_45}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_35 ( .s ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_58, signal_57, signal_35}), .a ({signal_60, signal_59, signal_36}), .clk ( clk ), .r ({Fresh[38], Fresh[37], Fresh[36]}), .c ({signal_82, signal_81, signal_46}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_36 ( .s ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_64, signal_63, signal_38}), .a ({signal_54, signal_53, signal_34}), .clk ( clk ), .r ({Fresh[41], Fresh[40], Fresh[39]}), .c ({signal_84, signal_83, signal_47}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_37 ( .s ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_68, signal_67, signal_40}), .a ({signal_66, signal_65, signal_39}), .clk ( clk ), .r ({Fresh[44], Fresh[43], Fresh[42]}), .c ({signal_86, signal_85, signal_48}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_38 ( .s ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_72, signal_71, signal_42}), .a ({signal_70, signal_69, signal_41}), .clk ( clk ), .r ({Fresh[47], Fresh[46], Fresh[45]}), .c ({signal_88, signal_87, signal_49}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_39 ( .s ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({signal_74, signal_73, signal_43}), .a ({signal_70, signal_69, signal_41}), .clk ( clk ), .r ({Fresh[50], Fresh[49], Fresh[48]}), .c ({signal_90, signal_89, signal_50}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_40 ( .s ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_80, signal_79, signal_45}), .a ({signal_78, signal_77, signal_44}), .clk ( clk ), .r ({Fresh[53], Fresh[52], Fresh[51]}), .c ({signal_94, signal_93, signal_16}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_41 ( .s ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_82, signal_81, signal_46}), .a ({signal_60, signal_59, signal_36}), .clk ( clk ), .r ({Fresh[56], Fresh[55], Fresh[54]}), .c ({signal_96, signal_95, signal_15}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_42 ( .s ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_86, signal_85, signal_48}), .a ({signal_84, signal_83, signal_47}), .clk ( clk ), .r ({Fresh[59], Fresh[58], Fresh[57]}), .c ({signal_98, signal_97, signal_18}) ) ;
    mux2_HPC2 #(.security_order(2), .pipeline(0)) cell_43 ( .s ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({signal_90, signal_89, signal_50}), .a ({signal_88, signal_87, signal_49}), .clk ( clk ), .r ({Fresh[62], Fresh[61], Fresh[60]}), .c ({signal_100, signal_99, signal_17}) ) ;

    /* register cells */
    reg_masked #(.security_order(2), .pipeline(0)) cell_0 ( .clk ( signal_173 ), .D ({signal_96, signal_95, signal_15}), .Q ({SO_s2[3], SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(2), .pipeline(0)) cell_1 ( .clk ( signal_173 ), .D ({signal_94, signal_93, signal_16}), .Q ({SO_s2[2], SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(2), .pipeline(0)) cell_2 ( .clk ( signal_173 ), .D ({signal_100, signal_99, signal_17}), .Q ({SO_s2[1], SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(2), .pipeline(0)) cell_3 ( .clk ( signal_173 ), .D ({signal_98, signal_97, signal_18}), .Q ({SO_s2[0], SO_s1[0], SO_s0[0]}) ) ;
endmodule
