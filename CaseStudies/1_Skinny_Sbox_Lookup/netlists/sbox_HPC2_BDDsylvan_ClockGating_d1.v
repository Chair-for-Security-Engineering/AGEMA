/* modified netlist. Source: module sbox in file ../sbox_lookup/sbox.v */
/* clock gating is added to the circuit, the latency increased 8 time(s)  */

module sbox_HPC2_BDDsylvan_ClockGating_d1 (SI_s0, clk, SI_s1, Fresh, rst, SO_s0, SO_s1, Synch);
    input [3:0] SI_s0 ;
    input clk ;
    input [3:0] SI_s1 ;
    input rst ;
    input [20:0] Fresh ;
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
    wire signal_52 ;
    wire signal_54 ;
    wire signal_55 ;
    wire signal_56 ;
    wire signal_57 ;
    wire signal_58 ;
    wire signal_59 ;
    wire signal_60 ;
    wire signal_61 ;
    wire signal_62 ;
    wire signal_64 ;
    wire signal_65 ;
    wire signal_66 ;
    wire signal_67 ;
    wire signal_68 ;
    wire signal_69 ;
    wire signal_70 ;
    wire signal_72 ;
    wire signal_73 ;
    wire signal_74 ;
    wire signal_75 ;
    wire signal_102 ;

    /* cells in depth 0 */
    ClockGatingController #(9) cell_44 ( .clk ( clk ), .rst ( rst ), .GatedClk ( signal_102 ), .Synch ( Synch ) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_23 ( .s ({SI_s1[1], SI_s0[1]}), .b ({1'b0, 1'b0}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[0] ), .c ({signal_52, signal_34}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_24 ( .s ({SI_s1[0], SI_s0[0]}), .b ({1'b0, 1'b1}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[1] ), .c ({signal_54, signal_35}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_25 ( .s ({SI_s1[0], SI_s0[0]}), .b ({1'b0, 1'b0}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[2] ), .c ({signal_55, signal_36}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_26 ( .s ({SI_s1[1], SI_s0[1]}), .b ({1'b0, 1'b1}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[3] ), .c ({signal_56, signal_37}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_27 ( .s ({SI_s1[1], SI_s0[1]}), .b ({signal_54, signal_35}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[4] ), .c ({signal_57, signal_38}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_28 ( .s ({SI_s1[1], SI_s0[1]}), .b ({signal_54, signal_35}), .a ({signal_55, signal_36}), .clk ( clk ), .r ( Fresh[5] ), .c ({signal_58, signal_39}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_29 ( .s ({SI_s1[1], SI_s0[1]}), .b ({1'b0, 1'b0}), .a ({signal_54, signal_35}), .clk ( clk ), .r ( Fresh[6] ), .c ({signal_59, signal_40}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_30 ( .s ({SI_s1[1], SI_s0[1]}), .b ({signal_55, signal_36}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[7] ), .c ({signal_60, signal_41}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_31 ( .s ({SI_s1[1], SI_s0[1]}), .b ({signal_54, signal_35}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[8] ), .c ({signal_61, signal_42}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_32 ( .s ({SI_s1[1], SI_s0[1]}), .b ({signal_55, signal_36}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[9] ), .c ({signal_62, signal_43}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_33 ( .s ({SI_s1[2], SI_s0[2]}), .b ({signal_52, signal_34}), .a ({1'b0, 1'b1}), .clk ( clk ), .r ( Fresh[10] ), .c ({signal_64, signal_44}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_34 ( .s ({SI_s1[2], SI_s0[2]}), .b ({signal_56, signal_37}), .a ({1'b0, 1'b0}), .clk ( clk ), .r ( Fresh[11] ), .c ({signal_65, signal_45}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_35 ( .s ({SI_s1[2], SI_s0[2]}), .b ({signal_54, signal_35}), .a ({signal_55, signal_36}), .clk ( clk ), .r ( Fresh[12] ), .c ({signal_66, signal_46}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_36 ( .s ({SI_s1[2], SI_s0[2]}), .b ({signal_57, signal_38}), .a ({signal_52, signal_34}), .clk ( clk ), .r ( Fresh[13] ), .c ({signal_67, signal_47}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_37 ( .s ({SI_s1[2], SI_s0[2]}), .b ({signal_59, signal_40}), .a ({signal_58, signal_39}), .clk ( clk ), .r ( Fresh[14] ), .c ({signal_68, signal_48}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_38 ( .s ({SI_s1[2], SI_s0[2]}), .b ({signal_61, signal_42}), .a ({signal_60, signal_41}), .clk ( clk ), .r ( Fresh[15] ), .c ({signal_69, signal_49}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_39 ( .s ({SI_s1[2], SI_s0[2]}), .b ({signal_62, signal_43}), .a ({signal_60, signal_41}), .clk ( clk ), .r ( Fresh[16] ), .c ({signal_70, signal_50}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_40 ( .s ({SI_s1[3], SI_s0[3]}), .b ({signal_65, signal_45}), .a ({signal_64, signal_44}), .clk ( clk ), .r ( Fresh[17] ), .c ({signal_72, signal_16}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_41 ( .s ({SI_s1[3], SI_s0[3]}), .b ({signal_66, signal_46}), .a ({signal_55, signal_36}), .clk ( clk ), .r ( Fresh[18] ), .c ({signal_73, signal_15}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_42 ( .s ({SI_s1[3], SI_s0[3]}), .b ({signal_68, signal_48}), .a ({signal_67, signal_47}), .clk ( clk ), .r ( Fresh[19] ), .c ({signal_74, signal_18}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_43 ( .s ({SI_s1[3], SI_s0[3]}), .b ({signal_70, signal_50}), .a ({signal_69, signal_49}), .clk ( clk ), .r ( Fresh[20] ), .c ({signal_75, signal_17}) ) ;

    /* register cells */
    reg_masked #(.security_order(1), .pipeline(0)) cell_0 ( .clk ( signal_102 ), .D ({signal_73, signal_15}), .Q ({SO_s1[3], SO_s0[3]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_1 ( .clk ( signal_102 ), .D ({signal_72, signal_16}), .Q ({SO_s1[2], SO_s0[2]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_2 ( .clk ( signal_102 ), .D ({signal_75, signal_17}), .Q ({SO_s1[1], SO_s0[1]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_3 ( .clk ( signal_102 ), .D ({signal_74, signal_18}), .Q ({SO_s1[0], SO_s0[0]}) ) ;
endmodule
