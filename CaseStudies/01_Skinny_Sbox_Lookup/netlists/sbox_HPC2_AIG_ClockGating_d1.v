/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* clock gating is added to the circuit, the latency increased 12 time(s)  */

module sbox_HPC2_AIG_ClockGating_d1 (SI_s0, clk, SI_s1, Fresh, rst, SO_s0, SO_s1, Synch);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input rst ;
    input [16:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
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
    wire signal_66 ;
    wire signal_68 ;
    wire signal_70 ;
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
    wire signal_126 ;

    /* cells in depth 0 */
    not_masked #(.security_order(1), .pipeline(0)) cell_23 ( .a ({SI_s1[3], SI_s0[3]}), .b ({signal_66, signal_34}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_24 ( .a ({SI_s1[2], SI_s0[2]}), .b ({signal_68, signal_35}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_25 ( .a ({SI_s1[1], SI_s0[1]}), .b ({signal_70, signal_36}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_26 ( .a ({SI_s1[0], SI_s0[0]}), .b ({signal_72, signal_37}) ) ;
    ClockGatingController #(13) cell_58 ( .clk ( clk ), .rst ( rst ), .GatedClk ( signal_126 ), .Synch ( Synch ) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_27 ( .a ({SI_s1[2], SI_s0[2]}), .b ({SI_s1[0], SI_s0[0]}), .clk ( clk ), .r ( Fresh[0] ), .c ({signal_73, signal_38}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_28 ( .a ({SI_s1[2], SI_s0[2]}), .b ({SI_s1[1], SI_s0[1]}), .clk ( clk ), .r ( Fresh[1] ), .c ({signal_74, signal_39}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_29 ( .a ({signal_73, signal_38}), .b ({signal_75, signal_40}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_30 ( .a ({signal_74, signal_39}), .b ({signal_76, signal_41}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_31 ( .a ({signal_68, signal_35}), .b ({signal_70, signal_36}), .clk ( clk ), .r ( Fresh[2] ), .c ({signal_77, signal_42}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_32 ( .a ({signal_66, signal_34}), .b ({signal_72, signal_37}), .clk ( clk ), .r ( Fresh[3] ), .c ({signal_78, signal_43}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_33 ( .a ({signal_68, signal_35}), .b ({signal_72, signal_37}), .clk ( clk ), .r ( Fresh[4] ), .c ({signal_79, signal_44}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_34 ( .a ({SI_s1[3], SI_s0[3]}), .b ({signal_68, signal_35}), .clk ( clk ), .r ( Fresh[5] ), .c ({signal_80, signal_45}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_35 ( .a ({signal_66, signal_34}), .b ({signal_68, signal_35}), .clk ( clk ), .r ( Fresh[6] ), .c ({signal_81, signal_46}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_36 ( .a ({signal_79, signal_44}), .b ({signal_82, signal_47}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_39 ( .a ({SI_s1[3], SI_s0[3]}), .b ({signal_77, signal_42}), .c ({signal_85, signal_16}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_40 ( .a ({SI_s1[0], SI_s0[0]}), .b ({signal_80, signal_45}), .c ({signal_86, signal_50}) ) ;
    xor_HPC2 #(.security_order(1), .pipeline(0)) cell_41 ( .a ({SI_s1[0], SI_s0[0]}), .b ({signal_81, signal_46}), .c ({signal_87, signal_15}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_37 ( .a ({SI_s1[2], SI_s0[2]}), .b ({signal_78, signal_43}), .clk ( clk ), .r ( Fresh[7] ), .c ({signal_83, signal_48}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_38 ( .a ({SI_s1[3], SI_s0[3]}), .b ({signal_79, signal_44}), .clk ( clk ), .r ( Fresh[8] ), .c ({signal_84, signal_49}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_42 ( .a ({signal_83, signal_48}), .b ({signal_88, signal_51}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_43 ( .a ({signal_84, signal_49}), .b ({signal_89, signal_52}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_44 ( .a ({signal_66, signal_34}), .b ({signal_82, signal_47}), .clk ( clk ), .r ( Fresh[9] ), .c ({signal_90, signal_53}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_45 ( .a ({signal_70, signal_36}), .b ({signal_86, signal_50}), .clk ( clk ), .r ( Fresh[10] ), .c ({signal_91, signal_54}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_46 ( .a ({signal_91, signal_54}), .b ({signal_92, signal_55}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_47 ( .a ({signal_75, signal_40}), .b ({signal_90, signal_53}), .clk ( clk ), .r ( Fresh[11] ), .c ({signal_93, signal_56}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_48 ( .a ({signal_70, signal_36}), .b ({signal_88, signal_51}), .clk ( clk ), .r ( Fresh[12] ), .c ({signal_94, signal_57}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_49 ( .a ({signal_94, signal_57}), .b ({signal_95, signal_58}) ) ;
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_50 ( .a ({signal_92, signal_55}), .b ({signal_76, signal_41}), .clk ( clk ), .r ( Fresh[13] ), .c ({signal_96, signal_59}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_52 ( .a ({signal_96, signal_59}), .b ({signal_98, signal_17}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_51 ( .a ({SI_s1[1], SI_s0[1]}), .b ({signal_93, signal_56}), .clk ( clk ), .r ( Fresh[14] ), .c ({signal_97, signal_60}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_53 ( .a ({signal_97, signal_60}), .b ({signal_99, signal_61}) ) ;

    /* cells in depth 9 */

    /* cells in depth 10 */
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_54 ( .a ({signal_95, signal_58}), .b ({signal_99, signal_61}), .clk ( clk ), .r ( Fresh[15] ), .c ({signal_100, signal_62}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_55 ( .a ({signal_100, signal_62}), .b ({signal_101, signal_63}) ) ;

    /* cells in depth 11 */

    /* cells in depth 12 */
    and_HPC2 #(.security_order(1), .pipeline(0)) cell_56 ( .a ({signal_89, signal_52}), .b ({signal_101, signal_63}), .clk ( clk ), .r ( Fresh[16] ), .c ({signal_102, signal_64}) ) ;
    not_masked #(.security_order(1), .pipeline(0)) cell_57 ( .a ({signal_102, signal_64}), .b ({signal_103, signal_18}) ) ;

    /* register cells */
    reg_masked #(.security_order(1), .pipeline(0)) cell_0 ( .clk ( signal_126 ), .D ({signal_87, signal_15}), .Q ({SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_1 ( .clk ( signal_126 ), .D ({signal_85, signal_16}), .Q ({SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_2 ( .clk ( signal_126 ), .D ({signal_98, signal_17}), .Q ({SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_3 ( .clk ( signal_126 ), .D ({signal_103, signal_18}), .Q ({SO_s1[0], SO_s0[0]}) ) ;
endmodule
