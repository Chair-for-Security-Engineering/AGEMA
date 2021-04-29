/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* clock gating is added to the circuit, the latency increased 4 time(s)  */

module sbox_HPC2_AIG_ClockGating_d1 (X_s0, clk, X_s1, Fresh, rst, Y_s0, Y_s1, Synch);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input rst ;
    input [3:0] Fresh ;
    output [3:0] Y_s0 ;
    output [3:0] Y_s1 ;
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
    wire signal_58 ;
    wire signal_60 ;
    wire signal_62 ;
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
    wire signal_94 ;

    /* cells in depth 0 */
    not_masked #(.security_order(1), .pipeline(0)) cell_26 ( .a ({X_s1[2], X_s0[2]}), .b ({signal_58, signal_37}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_27 ( .a ({X_s1[3], X_s0[3]}), .b ({X_s1[2], X_s0[2]}), .c ({signal_60, signal_38}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_28 ( .a ({X_s1[2], X_s0[2]}), .b ({X_s1[0], X_s0[0]}), .c ({signal_62, signal_39}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_29 ( .a ({X_s1[2], X_s0[2]}), .b ({X_s1[1], X_s0[1]}), .c ({signal_64, signal_40}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_31 ( .a ({X_s1[1], X_s0[1]}), .b ({signal_62, signal_39}), .c ({signal_66, signal_42}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_32 ( .a ({X_s1[1], X_s0[1]}), .b ({signal_60, signal_38}), .c ({signal_67, signal_43}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_33 ( .a ({X_s1[2], X_s0[2]}), .b ({signal_62, signal_39}), .c ({signal_68, signal_44}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_34 ( .a ({signal_68, signal_44}), .b ({signal_69, signal_45}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_36 ( .a ({signal_67, signal_43}), .b ({signal_68, signal_44}), .c ({signal_71, signal_47}) ) ;
    ClockGatingController #(5) cell_50 ( .clk (clk), .rst (rst), .GatedClk (signal_94), .Synch (Synch) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_30 ( .a ({signal_58, signal_37}), .b ({signal_64, signal_40}), .clk (clk), .r (Fresh[0]), .c ({signal_65, signal_41}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_35 ( .a ({signal_58, signal_37}), .b ({signal_67, signal_43}), .clk (clk), .r (Fresh[1]), .c ({signal_70, signal_46}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_37 ( .a ({signal_60, signal_38}), .b ({signal_65, signal_41}), .c ({signal_72, signal_48}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_38 ( .a ({signal_72, signal_48}), .b ({signal_73, signal_36}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_39 ( .a ({signal_66, signal_42}), .b ({signal_70, signal_46}), .c ({signal_74, signal_49}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_40 ( .a ({signal_65, signal_41}), .b ({signal_71, signal_47}), .c ({signal_75, signal_50}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_41 ( .a ({signal_62, signal_39}), .b ({signal_70, signal_46}), .c ({signal_76, signal_51}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_44 ( .a ({signal_65, signal_41}), .b ({signal_76, signal_51}), .c ({signal_79, signal_54}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_45 ( .a ({signal_79, signal_54}), .b ({signal_80, signal_35}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_42 ( .a ({X_s1[1], X_s0[1]}), .b ({signal_74, signal_49}), .clk (clk), .r (Fresh[2]), .c ({signal_77, signal_52}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_43 ( .a ({signal_69, signal_45}), .b ({signal_75, signal_50}), .clk (clk), .r (Fresh[3]), .c ({signal_78, signal_53}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_46 ( .a ({signal_65, signal_41}), .b ({signal_77, signal_52}), .c ({signal_81, signal_55}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_47 ( .a ({signal_64, signal_40}), .b ({signal_77, signal_52}), .c ({signal_82, signal_56}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_48 ( .a ({signal_76, signal_51}), .b ({signal_82, signal_56}), .c ({signal_83, signal_33}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_49 ( .a ({signal_78, signal_53}), .b ({signal_81, signal_55}), .c ({signal_84, signal_34}) ) ;

    /* register cells */
    reg_masked #(.security_order(1), .pipeline(0)) cell_0 ( .clk (signal_94), .D ({signal_80, signal_35}), .Q ({Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_1 ( .clk (signal_94), .D ({signal_73, signal_36}), .Q ({Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_2 ( .clk (signal_94), .D ({signal_83, signal_33}), .Q ({Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_3 ( .clk (signal_94), .D ({signal_84, signal_34}), .Q ({Y_s1[0], Y_s0[0]}) ) ;
endmodule
