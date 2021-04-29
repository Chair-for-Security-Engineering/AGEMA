/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* clock gating is added to the circuit, the latency increased 8 time(s)  */

module sbox_HPC2_BDDcudd_ClockGating_d3 (X_s0, clk, X_s1, X_s2, X_s3, Fresh, rst, Y_s0, Y_s1, Y_s2, Y_s3, Synch);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input [3:0] X_s2 ;
    input [3:0] X_s3 ;
    input rst ;
    input [101:0] Fresh ;
    output [3:0] Y_s0 ;
    output [3:0] Y_s1 ;
    output [3:0] Y_s2 ;
    output [3:0] Y_s3 ;
    output Synch ;
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
    wire signal_53 ;
    wire signal_54 ;
    wire signal_55 ;
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
    wire signal_89 ;
    wire signal_90 ;
    wire signal_91 ;
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
    wire signal_228 ;

    /* cells in depth 0 */
    ClockGatingController #(9) cell_43 ( .clk (clk), .rst (rst), .GatedClk (signal_228), .Synch (Synch) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_26 ( .s ({X_s3[2], X_s2[2], X_s1[2], X_s0[2]}), .b ({1'b0, 1'b0, 1'b0, 1'b1}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[5], Fresh[4], Fresh[3], Fresh[2], Fresh[1], Fresh[0]}), .c ({signal_55, signal_54, signal_53, signal_37}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_27 ( .s ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .b ({1'b0, 1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[11], Fresh[10], Fresh[9], Fresh[8], Fresh[7], Fresh[6]}), .c ({signal_61, signal_60, signal_59, signal_38}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_28 ( .s ({X_s3[2], X_s2[2], X_s1[2], X_s0[2]}), .b ({1'b0, 1'b0, 1'b0, 1'b0}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[17], Fresh[16], Fresh[15], Fresh[14], Fresh[13], Fresh[12]}), .c ({signal_64, signal_63, signal_62, signal_39}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_29 ( .s ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .b ({1'b0, 1'b0, 1'b0, 1'b1}), .a ({signal_64, signal_63, signal_62, signal_39}), .clk (clk), .r ({Fresh[23], Fresh[22], Fresh[21], Fresh[20], Fresh[19], Fresh[18]}), .c ({signal_67, signal_66, signal_65, signal_40}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_30 ( .s ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .b ({signal_55, signal_54, signal_53, signal_37}), .a ({signal_64, signal_63, signal_62, signal_39}), .clk (clk), .r ({Fresh[29], Fresh[28], Fresh[27], Fresh[26], Fresh[25], Fresh[24]}), .c ({signal_70, signal_69, signal_68, signal_41}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_31 ( .s ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .b ({1'b0, 1'b0, 1'b0, 1'b0}), .a ({signal_55, signal_54, signal_53, signal_37}), .clk (clk), .r ({Fresh[35], Fresh[34], Fresh[33], Fresh[32], Fresh[31], Fresh[30]}), .c ({signal_73, signal_72, signal_71, signal_42}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_32 ( .s ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .b ({signal_55, signal_54, signal_53, signal_37}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[41], Fresh[40], Fresh[39], Fresh[38], Fresh[37], Fresh[36]}), .c ({signal_76, signal_75, signal_74, signal_43}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_33 ( .s ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .b ({signal_64, signal_63, signal_62, signal_39}), .a ({1'b0, 1'b0, 1'b0, 1'b1}), .clk (clk), .r ({Fresh[47], Fresh[46], Fresh[45], Fresh[44], Fresh[43], Fresh[42]}), .c ({signal_79, signal_78, signal_77, signal_44}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_34 ( .s ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .b ({signal_64, signal_63, signal_62, signal_39}), .a ({signal_55, signal_54, signal_53, signal_37}), .clk (clk), .r ({Fresh[53], Fresh[52], Fresh[51], Fresh[50], Fresh[49], Fresh[48]}), .c ({signal_82, signal_81, signal_80, signal_45}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_35 ( .s ({X_s3[3], X_s2[3], X_s1[3], X_s0[3]}), .b ({signal_55, signal_54, signal_53, signal_37}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[59], Fresh[58], Fresh[57], Fresh[56], Fresh[55], Fresh[54]}), .c ({signal_85, signal_84, signal_83, signal_46}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_36 ( .s ({X_s3[0], X_s2[0], X_s1[0], X_s0[0]}), .b ({signal_73, signal_72, signal_71, signal_42}), .a ({signal_67, signal_66, signal_65, signal_40}), .clk (clk), .r ({Fresh[65], Fresh[64], Fresh[63], Fresh[62], Fresh[61], Fresh[60]}), .c ({signal_91, signal_90, signal_89, signal_47}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_37 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({signal_70, signal_69, signal_68, signal_41}), .a ({signal_61, signal_60, signal_59, signal_38}), .clk (clk), .r ({Fresh[71], Fresh[70], Fresh[69], Fresh[68], Fresh[67], Fresh[66]}), .c ({signal_97, signal_96, signal_95, signal_36}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_38 ( .s ({X_s3[0], X_s2[0], X_s1[0], X_s0[0]}), .b ({signal_82, signal_81, signal_80, signal_45}), .a ({1'b0, 1'b0, 1'b0, 1'b0}), .clk (clk), .r ({Fresh[77], Fresh[76], Fresh[75], Fresh[74], Fresh[73], Fresh[72]}), .c ({signal_100, signal_99, signal_98, signal_48}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_39 ( .s ({X_s3[0], X_s2[0], X_s1[0], X_s0[0]}), .b ({signal_85, signal_84, signal_83, signal_46}), .a ({signal_79, signal_78, signal_77, signal_44}), .clk (clk), .r ({Fresh[83], Fresh[82], Fresh[81], Fresh[80], Fresh[79], Fresh[78]}), .c ({signal_103, signal_102, signal_101, signal_35}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_40 ( .s ({X_s3[0], X_s2[0], X_s1[0], X_s0[0]}), .b ({signal_76, signal_75, signal_74, signal_43}), .a ({signal_79, signal_78, signal_77, signal_44}), .clk (clk), .r ({Fresh[89], Fresh[88], Fresh[87], Fresh[86], Fresh[85], Fresh[84]}), .c ({signal_106, signal_105, signal_104, signal_49}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_41 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({signal_100, signal_99, signal_98, signal_48}), .a ({signal_106, signal_105, signal_104, signal_49}), .clk (clk), .r ({Fresh[95], Fresh[94], Fresh[93], Fresh[92], Fresh[91], Fresh[90]}), .c ({signal_109, signal_108, signal_107, signal_34}) ) ;
    mux2_HPC2 #(.security_order(3), .pipeline(0)) cell_42 ( .s ({X_s3[1], X_s2[1], X_s1[1], X_s0[1]}), .b ({signal_91, signal_90, signal_89, signal_47}), .a ({signal_64, signal_63, signal_62, signal_39}), .clk (clk), .r ({Fresh[101], Fresh[100], Fresh[99], Fresh[98], Fresh[97], Fresh[96]}), .c ({signal_112, signal_111, signal_110, signal_33}) ) ;

    /* register cells */
    reg_masked #(.security_order(3), .pipeline(0)) cell_0 ( .clk (signal_228), .D ({signal_103, signal_102, signal_101, signal_35}), .Q ({Y_s3[3], Y_s2[3], Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.security_order(3), .pipeline(0)) cell_1 ( .clk (signal_228), .D ({signal_97, signal_96, signal_95, signal_36}), .Q ({Y_s3[2], Y_s2[2], Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.security_order(3), .pipeline(0)) cell_2 ( .clk (signal_228), .D ({signal_112, signal_111, signal_110, signal_33}), .Q ({Y_s3[1], Y_s2[1], Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.security_order(3), .pipeline(0)) cell_3 ( .clk (signal_228), .D ({signal_109, signal_108, signal_107, signal_34}), .Q ({Y_s3[0], Y_s2[0], Y_s1[0], Y_s0[0]}) ) ;
endmodule
