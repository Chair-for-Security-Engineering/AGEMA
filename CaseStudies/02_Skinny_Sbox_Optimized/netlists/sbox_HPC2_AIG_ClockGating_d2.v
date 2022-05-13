/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* clock gating is added to the circuit, the latency increased 4 time(s)  */

module sbox_HPC2_AIG_ClockGating_d2 (X_s0, clk, X_s1, X_s2, Fresh, rst, Y_s0, Y_s1, Y_s2, Synch);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input [3:0] X_s2 ;
    input rst ;
    input [11:0] Fresh ;
    output [3:0] Y_s0 ;
    output [3:0] Y_s1 ;
    output [3:0] Y_s2 ;
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
    wire signal_50 ;
    wire signal_51 ;
    wire signal_52 ;
    wire signal_53 ;
    wire signal_54 ;
    wire signal_55 ;
    wire signal_56 ;
    wire signal_59 ;
    wire signal_60 ;
    wire signal_63 ;
    wire signal_64 ;
    wire signal_67 ;
    wire signal_68 ;
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
    wire signal_134 ;

    /* cells in depth 0 */
    not_masked #(.security_order(2), .pipeline(0)) cell_26 ( .a ({X_s2[2], X_s1[2], X_s0[2]}), .b ({signal_60, signal_59, signal_37}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_27 ( .a ({X_s2[3], X_s1[3], X_s0[3]}), .b ({X_s2[2], X_s1[2], X_s0[2]}), .c ({signal_64, signal_63, signal_38}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_28 ( .a ({X_s2[2], X_s1[2], X_s0[2]}), .b ({X_s2[0], X_s1[0], X_s0[0]}), .c ({signal_68, signal_67, signal_39}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_29 ( .a ({X_s2[2], X_s1[2], X_s0[2]}), .b ({X_s2[1], X_s1[1], X_s0[1]}), .c ({signal_72, signal_71, signal_40}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_31 ( .a ({X_s2[1], X_s1[1], X_s0[1]}), .b ({signal_68, signal_67, signal_39}), .c ({signal_76, signal_75, signal_42}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_32 ( .a ({X_s2[1], X_s1[1], X_s0[1]}), .b ({signal_64, signal_63, signal_38}), .c ({signal_78, signal_77, signal_43}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_33 ( .a ({X_s2[2], X_s1[2], X_s0[2]}), .b ({signal_68, signal_67, signal_39}), .c ({signal_80, signal_79, signal_44}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_34 ( .a ({signal_80, signal_79, signal_44}), .b ({signal_82, signal_81, signal_45}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_36 ( .a ({signal_78, signal_77, signal_43}), .b ({signal_80, signal_79, signal_44}), .c ({signal_86, signal_85, signal_47}) ) ;
    ClockGatingController #(5) cell_50 ( .clk (clk), .rst (rst), .GatedClk (signal_134), .Synch (Synch) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_30 ( .a ({signal_60, signal_59, signal_37}), .b ({signal_72, signal_71, signal_40}), .clk (clk), .r ({Fresh[2], Fresh[1], Fresh[0]}), .c ({signal_74, signal_73, signal_41}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_35 ( .a ({signal_60, signal_59, signal_37}), .b ({signal_78, signal_77, signal_43}), .clk (clk), .r ({Fresh[5], Fresh[4], Fresh[3]}), .c ({signal_84, signal_83, signal_46}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_37 ( .a ({signal_64, signal_63, signal_38}), .b ({signal_74, signal_73, signal_41}), .c ({signal_88, signal_87, signal_48}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_38 ( .a ({signal_88, signal_87, signal_48}), .b ({signal_90, signal_89, signal_36}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_39 ( .a ({signal_76, signal_75, signal_42}), .b ({signal_84, signal_83, signal_46}), .c ({signal_92, signal_91, signal_49}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_40 ( .a ({signal_74, signal_73, signal_41}), .b ({signal_86, signal_85, signal_47}), .c ({signal_94, signal_93, signal_50}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_41 ( .a ({signal_68, signal_67, signal_39}), .b ({signal_84, signal_83, signal_46}), .c ({signal_96, signal_95, signal_51}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_44 ( .a ({signal_74, signal_73, signal_41}), .b ({signal_96, signal_95, signal_51}), .c ({signal_102, signal_101, signal_54}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) cell_45 ( .a ({signal_102, signal_101, signal_54}), .b ({signal_104, signal_103, signal_35}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_42 ( .a ({X_s2[1], X_s1[1], X_s0[1]}), .b ({signal_92, signal_91, signal_49}), .clk (clk), .r ({Fresh[8], Fresh[7], Fresh[6]}), .c ({signal_98, signal_97, signal_52}) ) ;
    and_HPC2 #(.security_order(2), .pipeline(0)) cell_43 ( .a ({signal_82, signal_81, signal_45}), .b ({signal_94, signal_93, signal_50}), .clk (clk), .r ({Fresh[11], Fresh[10], Fresh[9]}), .c ({signal_100, signal_99, signal_53}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_46 ( .a ({signal_74, signal_73, signal_41}), .b ({signal_98, signal_97, signal_52}), .c ({signal_106, signal_105, signal_55}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_47 ( .a ({signal_72, signal_71, signal_40}), .b ({signal_98, signal_97, signal_52}), .c ({signal_108, signal_107, signal_56}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_48 ( .a ({signal_96, signal_95, signal_51}), .b ({signal_108, signal_107, signal_56}), .c ({signal_110, signal_109, signal_33}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) cell_49 ( .a ({signal_100, signal_99, signal_53}), .b ({signal_106, signal_105, signal_55}), .c ({signal_112, signal_111, signal_34}) ) ;

    /* register cells */
    reg_masked #(.security_order(2), .pipeline(0)) cell_0 ( .clk (signal_134), .D ({signal_104, signal_103, signal_35}), .Q ({Y_s2[3], Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.security_order(2), .pipeline(0)) cell_1 ( .clk (signal_134), .D ({signal_90, signal_89, signal_36}), .Q ({Y_s2[2], Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.security_order(2), .pipeline(0)) cell_2 ( .clk (signal_134), .D ({signal_110, signal_109, signal_33}), .Q ({Y_s2[1], Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.security_order(2), .pipeline(0)) cell_3 ( .clk (signal_134), .D ({signal_112, signal_111, signal_34}), .Q ({Y_s2[0], Y_s1[0], Y_s0[0]}) ) ;
endmodule
