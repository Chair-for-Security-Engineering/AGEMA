/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* clock gating is added to the circuit, the latency increased 10 time(s)  */

module sbox_HPC2_ClockGating_d2 (SI_s0, clk, SI_s1, SI_s2, Fresh, rst, SO_s0, SO_s1, SO_s2, Synch);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input [3:0] SI_s2 ;
    input rst ;
    input [38:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
    output [3:0] SO_s2 ;
    output Synch ;
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
    wire new_AGEMA_signal_36 ;
    wire new_AGEMA_signal_37 ;
    wire new_AGEMA_signal_42 ;
    wire new_AGEMA_signal_43 ;
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
    wire new_AGEMA_signal_57 ;
    wire new_AGEMA_signal_58 ;
    wire new_AGEMA_signal_59 ;
    wire new_AGEMA_signal_60 ;
    wire new_AGEMA_signal_61 ;
    wire new_AGEMA_signal_62 ;
    wire new_AGEMA_signal_63 ;
    wire new_AGEMA_signal_64 ;
    wire new_AGEMA_signal_65 ;
    wire new_AGEMA_signal_66 ;
    wire new_AGEMA_signal_67 ;
    wire new_AGEMA_signal_68 ;
    wire new_AGEMA_signal_69 ;
    wire new_AGEMA_signal_70 ;
    wire new_AGEMA_signal_71 ;
    wire new_AGEMA_signal_72 ;
    wire new_AGEMA_signal_73 ;
    wire new_AGEMA_signal_74 ;
    wire new_AGEMA_signal_75 ;
    wire new_AGEMA_signal_76 ;
    wire new_AGEMA_signal_77 ;
    wire new_AGEMA_signal_78 ;
    wire new_AGEMA_signal_79 ;
    wire clk_gated ;

    /* cells in depth 0 */
    not_masked #(.security_order(2), .pipeline(0)) U50 ( .a ({SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({new_AGEMA_signal_37, new_AGEMA_signal_36, n53}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) U53 ( .a ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({new_AGEMA_signal_47, new_AGEMA_signal_46, n52}) ) ;
    not_masked #(.security_order(2), .pipeline(0)) U59 ( .a ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({new_AGEMA_signal_51, new_AGEMA_signal_50, n51}) ) ;
    ClockGatingController #(11) ClockGatingInst ( .clk ( clk ), .rst ( rst ), .GatedClk ( clk_gated ), .Synch ( Synch ) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    nor_HPC2 #(.security_order(2), .pipeline(0)) U51 ( .a ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({SI_s2[2], SI_s1[2], SI_s0[2]}), .clk ( clk ), .r ({Fresh[2], Fresh[1], Fresh[0]}), .c ({new_AGEMA_signal_43, new_AGEMA_signal_42, n40}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) U52 ( .a ({new_AGEMA_signal_43, new_AGEMA_signal_42, n40}), .b ({SI_s2[3], SI_s1[3], SI_s0[3]}), .c ({new_AGEMA_signal_55, new_AGEMA_signal_54, N12}) ) ;
    nor_HPC2 #(.security_order(2), .pipeline(0)) U54 ( .a ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({new_AGEMA_signal_47, new_AGEMA_signal_46, n52}), .clk ( clk ), .r ({Fresh[5], Fresh[4], Fresh[3]}), .c ({new_AGEMA_signal_57, new_AGEMA_signal_56, n41}) ) ;
    xnor_HPC2 #(.security_order(2), .pipeline(0)) U55 ( .a ({new_AGEMA_signal_37, new_AGEMA_signal_36, n53}), .b ({new_AGEMA_signal_57, new_AGEMA_signal_56, n41}), .c ({new_AGEMA_signal_69, new_AGEMA_signal_68, n42}) ) ;
    nor_HPC2 #(.security_order(2), .pipeline(0)) U57 ( .a ({SI_s2[0], SI_s1[0], SI_s0[0]}), .b ({SI_s2[3], SI_s1[3], SI_s0[3]}), .clk ( clk ), .r ({Fresh[8], Fresh[7], Fresh[6]}), .c ({new_AGEMA_signal_49, new_AGEMA_signal_48, n43}) ) ;
    nor_HPC2 #(.security_order(2), .pipeline(0)) U60 ( .a ({new_AGEMA_signal_51, new_AGEMA_signal_50, n51}), .b ({new_AGEMA_signal_37, new_AGEMA_signal_36, n53}), .clk ( clk ), .r ({Fresh[11], Fresh[10], Fresh[9]}), .c ({new_AGEMA_signal_61, new_AGEMA_signal_60, n45}) ) ;
    nor_HPC2 #(.security_order(2), .pipeline(0)) U61 ( .a ({SI_s2[2], SI_s1[2], SI_s0[2]}), .b ({SI_s2[0], SI_s1[0], SI_s0[0]}), .clk ( clk ), .r ({Fresh[14], Fresh[13], Fresh[12]}), .c ({new_AGEMA_signal_53, new_AGEMA_signal_52, n48}) ) ;
    nand_HPC2 #(.security_order(2), .pipeline(0)) U67 ( .a ({new_AGEMA_signal_47, new_AGEMA_signal_46, n52}), .b ({new_AGEMA_signal_51, new_AGEMA_signal_50, n51}), .clk ( clk ), .r ({Fresh[17], Fresh[16], Fresh[15]}), .c ({new_AGEMA_signal_67, new_AGEMA_signal_66, n54}) ) ;
    xor_HPC2 #(.security_order(2), .pipeline(0)) U68 ( .a ({new_AGEMA_signal_67, new_AGEMA_signal_66, n54}), .b ({new_AGEMA_signal_37, new_AGEMA_signal_36, n53}), .c ({new_AGEMA_signal_73, new_AGEMA_signal_72, N9}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(2), .pipeline(0)) U56 ( .s ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({new_AGEMA_signal_69, new_AGEMA_signal_68, n42}), .a ({SI_s2[2], SI_s1[2], SI_s0[2]}), .clk ( clk ), .r ({Fresh[20], Fresh[19], Fresh[18]}), .c ({new_AGEMA_signal_75, new_AGEMA_signal_74, N19}) ) ;
    nand_HPC2 #(.security_order(2), .pipeline(0)) U58 ( .a ({new_AGEMA_signal_49, new_AGEMA_signal_48, n43}), .b ({SI_s2[2], SI_s1[2], SI_s0[2]}), .clk ( clk ), .r ({Fresh[23], Fresh[22], Fresh[21]}), .c ({new_AGEMA_signal_59, new_AGEMA_signal_58, n47}) ) ;
    or_HPC2 #(.security_order(2), .pipeline(0)) U62 ( .a ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({new_AGEMA_signal_53, new_AGEMA_signal_52, n48}), .clk ( clk ), .r ({Fresh[26], Fresh[25], Fresh[24]}), .c ({new_AGEMA_signal_63, new_AGEMA_signal_62, n44}) ) ;
    nand_HPC2 #(.security_order(2), .pipeline(0)) U65 ( .a ({SI_s2[3], SI_s1[3], SI_s0[3]}), .b ({new_AGEMA_signal_53, new_AGEMA_signal_52, n48}), .clk ( clk ), .r ({Fresh[29], Fresh[28], Fresh[27]}), .c ({new_AGEMA_signal_65, new_AGEMA_signal_64, n49}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    nor_HPC2 #(.security_order(2), .pipeline(0)) U63 ( .a ({new_AGEMA_signal_61, new_AGEMA_signal_60, n45}), .b ({new_AGEMA_signal_63, new_AGEMA_signal_62, n44}), .clk ( clk ), .r ({Fresh[32], Fresh[31], Fresh[30]}), .c ({new_AGEMA_signal_71, new_AGEMA_signal_70, n46}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(2), .pipeline(0)) U64 ( .s ({SI_s2[1], SI_s1[1], SI_s0[1]}), .b ({new_AGEMA_signal_59, new_AGEMA_signal_58, n47}), .a ({new_AGEMA_signal_71, new_AGEMA_signal_70, n46}), .clk ( clk ), .r ({Fresh[35], Fresh[34], Fresh[33]}), .c ({new_AGEMA_signal_77, new_AGEMA_signal_76, n50}) ) ;

    /* cells in depth 9 */

    /* cells in depth 10 */
    nand_HPC2 #(.security_order(2), .pipeline(0)) U66 ( .a ({new_AGEMA_signal_77, new_AGEMA_signal_76, n50}), .b ({new_AGEMA_signal_65, new_AGEMA_signal_64, n49}), .clk ( clk ), .r ({Fresh[38], Fresh[37], Fresh[36]}), .c ({new_AGEMA_signal_79, new_AGEMA_signal_78, N27}) ) ;

    /* register cells */
    reg_masked #(.security_order(2), .pipeline(0)) SO_reg_3_ ( .clk ( clk_gated ), .D ({new_AGEMA_signal_73, new_AGEMA_signal_72, N9}), .Q ({SO_s2[3], SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(2), .pipeline(0)) SO_reg_2_ ( .clk ( clk_gated ), .D ({new_AGEMA_signal_55, new_AGEMA_signal_54, N12}), .Q ({SO_s2[2], SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(2), .pipeline(0)) SO_reg_1_ ( .clk ( clk_gated ), .D ({new_AGEMA_signal_75, new_AGEMA_signal_74, N19}), .Q ({SO_s2[1], SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(2), .pipeline(0)) SO_reg_0_ ( .clk ( clk_gated ), .D ({new_AGEMA_signal_79, new_AGEMA_signal_78, N27}), .Q ({SO_s2[0], SO_s1[0], SO_s0[0]}) ) ;
endmodule
