/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* clock gating is added to the circuit, the latency increased 10 time(s)  */

module sbox_GHPC_ClockGating_d1 (SI_s0, clk, SI_s1, Fresh, rst, SO_s0, SO_s1, Synch);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input rst ;
    input [12:0] Fresh ;
    output [3:0] SO_s0 ;
    output [3:0] SO_s1 ;
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
    wire clk_gated ;

    /* cells in depth 0 */
    not_masked #(.low_latency(0), .pipeline(0)) U50 ( .a ({SI_s1[0], SI_s0[0]}), .b ({new_AGEMA_signal_35, n53}) ) ;
    not_masked #(.low_latency(0), .pipeline(0)) U53 ( .a ({SI_s1[3], SI_s0[3]}), .b ({new_AGEMA_signal_40, n52}) ) ;
    not_masked #(.low_latency(0), .pipeline(0)) U59 ( .a ({SI_s1[2], SI_s0[2]}), .b ({new_AGEMA_signal_42, n51}) ) ;
    ClockGatingController #(11) ClockGatingInst ( .clk ( clk ), .rst ( rst ), .GatedClk ( clk_gated ), .Synch ( Synch ) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    nor_GHPC #(.low_latency(0), .pipeline(0)) U51 ( .a ({SI_s1[1], SI_s0[1]}), .b ({SI_s1[2], SI_s0[2]}), .clk ( clk ), .r ( Fresh[0] ), .c ({new_AGEMA_signal_38, n40}) ) ;
    xor_GHPC #(.low_latency(0), .pipeline(0)) U52 ( .a ({new_AGEMA_signal_38, n40}), .b ({SI_s1[3], SI_s0[3]}), .c ({new_AGEMA_signal_44, N12}) ) ;
    nor_GHPC #(.low_latency(0), .pipeline(0)) U54 ( .a ({SI_s1[2], SI_s0[2]}), .b ({new_AGEMA_signal_40, n52}), .clk ( clk ), .r ( Fresh[1] ), .c ({new_AGEMA_signal_45, n41}) ) ;
    xnor_GHPC #(.low_latency(0), .pipeline(0)) U55 ( .a ({new_AGEMA_signal_35, n53}), .b ({new_AGEMA_signal_45, n41}), .c ({new_AGEMA_signal_51, n42}) ) ;
    nor_GHPC #(.low_latency(0), .pipeline(0)) U57 ( .a ({SI_s1[0], SI_s0[0]}), .b ({SI_s1[3], SI_s0[3]}), .clk ( clk ), .r ( Fresh[2] ), .c ({new_AGEMA_signal_41, n43}) ) ;
    nor_GHPC #(.low_latency(0), .pipeline(0)) U60 ( .a ({new_AGEMA_signal_42, n51}), .b ({new_AGEMA_signal_35, n53}), .clk ( clk ), .r ( Fresh[3] ), .c ({new_AGEMA_signal_47, n45}) ) ;
    nor_GHPC #(.low_latency(0), .pipeline(0)) U61 ( .a ({SI_s1[2], SI_s0[2]}), .b ({SI_s1[0], SI_s0[0]}), .clk ( clk ), .r ( Fresh[4] ), .c ({new_AGEMA_signal_43, n48}) ) ;
    nand_GHPC #(.low_latency(0), .pipeline(0)) U67 ( .a ({new_AGEMA_signal_40, n52}), .b ({new_AGEMA_signal_42, n51}), .clk ( clk ), .r ( Fresh[5] ), .c ({new_AGEMA_signal_50, n54}) ) ;
    xor_GHPC #(.low_latency(0), .pipeline(0)) U68 ( .a ({new_AGEMA_signal_50, n54}), .b ({new_AGEMA_signal_35, n53}), .c ({new_AGEMA_signal_53, N9}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    mux2_GHPC #(.low_latency(0), .pipeline(0)) U56 ( .s ({SI_s1[1], SI_s0[1]}), .b ({new_AGEMA_signal_51, n42}), .a ({SI_s1[2], SI_s0[2]}), .clk ( clk ), .r ( Fresh[6] ), .c ({new_AGEMA_signal_54, N19}) ) ;
    nand_GHPC #(.low_latency(0), .pipeline(0)) U58 ( .a ({new_AGEMA_signal_41, n43}), .b ({SI_s1[2], SI_s0[2]}), .clk ( clk ), .r ( Fresh[7] ), .c ({new_AGEMA_signal_46, n47}) ) ;
    or_GHPC #(.low_latency(0), .pipeline(0)) U62 ( .a ({SI_s1[3], SI_s0[3]}), .b ({new_AGEMA_signal_43, n48}), .clk ( clk ), .r ( Fresh[8] ), .c ({new_AGEMA_signal_48, n44}) ) ;
    nand_GHPC #(.low_latency(0), .pipeline(0)) U65 ( .a ({SI_s1[3], SI_s0[3]}), .b ({new_AGEMA_signal_43, n48}), .clk ( clk ), .r ( Fresh[9] ), .c ({new_AGEMA_signal_49, n49}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    nor_GHPC #(.low_latency(0), .pipeline(0)) U63 ( .a ({new_AGEMA_signal_47, n45}), .b ({new_AGEMA_signal_48, n44}), .clk ( clk ), .r ( Fresh[10] ), .c ({new_AGEMA_signal_52, n46}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    mux2_GHPC #(.low_latency(0), .pipeline(0)) U64 ( .s ({SI_s1[1], SI_s0[1]}), .b ({new_AGEMA_signal_46, n47}), .a ({new_AGEMA_signal_52, n46}), .clk ( clk ), .r ( Fresh[11] ), .c ({new_AGEMA_signal_55, n50}) ) ;

    /* cells in depth 9 */

    /* cells in depth 10 */
    nand_GHPC #(.low_latency(0), .pipeline(0)) U66 ( .a ({new_AGEMA_signal_55, n50}), .b ({new_AGEMA_signal_49, n49}), .clk ( clk ), .r ( Fresh[12] ), .c ({new_AGEMA_signal_56, N27}) ) ;

    /* register cells */
    reg_masked #(.low_latency(0), .pipeline(0)) SO_reg_3_ ( .clk ( clk_gated ), .D ({new_AGEMA_signal_53, N9}), .Q ({SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) SO_reg_2_ ( .clk ( clk_gated ), .D ({new_AGEMA_signal_44, N12}), .Q ({SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) SO_reg_1_ ( .clk ( clk_gated ), .D ({new_AGEMA_signal_54, N19}), .Q ({SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.low_latency(0), .pipeline(0)) SO_reg_0_ ( .clk ( clk_gated ), .D ({new_AGEMA_signal_56, N27}), .Q ({SO_s1[0], SO_s0[0]}) ) ;
endmodule
