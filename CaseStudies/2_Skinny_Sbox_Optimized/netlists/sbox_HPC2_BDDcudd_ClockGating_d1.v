/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* clock gating is added to the circuit, the latency increased 8 time(s)  */

module sbox_HPC2_BDDcudd_ClockGating_d1 (X_s0, clk, X_s1, Fresh, rst, Y_s0, Y_s1, Synch);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input rst ;
    input [16:0] Fresh ;
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
    wire signal_51 ;
    wire signal_53 ;
    wire signal_54 ;
    wire signal_55 ;
    wire signal_56 ;
    wire signal_57 ;
    wire signal_58 ;
    wire signal_59 ;
    wire signal_60 ;
    wire signal_61 ;
    wire signal_63 ;
    wire signal_65 ;
    wire signal_66 ;
    wire signal_67 ;
    wire signal_68 ;
    wire signal_69 ;
    wire signal_70 ;
    wire signal_93 ;

    /* cells in depth 0 */
    ClockGatingController #(9) cell_43 ( .clk (clk), .rst (rst), .GatedClk (signal_93), .Synch (Synch) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_26 ( .s ({X_s1[2], X_s0[2]}), .b ({1'b0, 1'b1}), .a ({1'b0, 1'b0}), .clk (clk), .r (Fresh[0]), .c ({signal_51, signal_37}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_27 ( .s ({X_s1[3], X_s0[3]}), .b ({1'b0, 1'b0}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[1]), .c ({signal_53, signal_38}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_28 ( .s ({X_s1[2], X_s0[2]}), .b ({1'b0, 1'b0}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[2]), .c ({signal_54, signal_39}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_29 ( .s ({X_s1[3], X_s0[3]}), .b ({1'b0, 1'b1}), .a ({signal_54, signal_39}), .clk (clk), .r (Fresh[3]), .c ({signal_55, signal_40}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_30 ( .s ({X_s1[3], X_s0[3]}), .b ({signal_51, signal_37}), .a ({signal_54, signal_39}), .clk (clk), .r (Fresh[4]), .c ({signal_56, signal_41}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_31 ( .s ({X_s1[3], X_s0[3]}), .b ({1'b0, 1'b0}), .a ({signal_51, signal_37}), .clk (clk), .r (Fresh[5]), .c ({signal_57, signal_42}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_32 ( .s ({X_s1[3], X_s0[3]}), .b ({signal_51, signal_37}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[6]), .c ({signal_58, signal_43}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_33 ( .s ({X_s1[3], X_s0[3]}), .b ({signal_54, signal_39}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[7]), .c ({signal_59, signal_44}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_34 ( .s ({X_s1[3], X_s0[3]}), .b ({signal_54, signal_39}), .a ({signal_51, signal_37}), .clk (clk), .r (Fresh[8]), .c ({signal_60, signal_45}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_35 ( .s ({X_s1[3], X_s0[3]}), .b ({signal_51, signal_37}), .a ({1'b0, 1'b0}), .clk (clk), .r (Fresh[9]), .c ({signal_61, signal_46}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_36 ( .s ({X_s1[0], X_s0[0]}), .b ({signal_57, signal_42}), .a ({signal_55, signal_40}), .clk (clk), .r (Fresh[10]), .c ({signal_63, signal_47}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_37 ( .s ({X_s1[1], X_s0[1]}), .b ({signal_56, signal_41}), .a ({signal_53, signal_38}), .clk (clk), .r (Fresh[11]), .c ({signal_65, signal_36}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_38 ( .s ({X_s1[0], X_s0[0]}), .b ({signal_60, signal_45}), .a ({1'b0, 1'b0}), .clk (clk), .r (Fresh[12]), .c ({signal_66, signal_48}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_39 ( .s ({X_s1[0], X_s0[0]}), .b ({signal_61, signal_46}), .a ({signal_59, signal_44}), .clk (clk), .r (Fresh[13]), .c ({signal_67, signal_35}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_40 ( .s ({X_s1[0], X_s0[0]}), .b ({signal_58, signal_43}), .a ({signal_59, signal_44}), .clk (clk), .r (Fresh[14]), .c ({signal_68, signal_49}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_41 ( .s ({X_s1[1], X_s0[1]}), .b ({signal_66, signal_48}), .a ({signal_68, signal_49}), .clk (clk), .r (Fresh[15]), .c ({signal_69, signal_34}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_42 ( .s ({X_s1[1], X_s0[1]}), .b ({signal_63, signal_47}), .a ({signal_54, signal_39}), .clk (clk), .r (Fresh[16]), .c ({signal_70, signal_33}) ) ;

    /* register cells */
    reg_masked #(.security_order(1), .pipeline(0)) cell_0 ( .clk (signal_93), .D ({signal_67, signal_35}), .Q ({Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_1 ( .clk (signal_93), .D ({signal_65, signal_36}), .Q ({Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_2 ( .clk (signal_93), .D ({signal_70, signal_33}), .Q ({Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_3 ( .clk (signal_93), .D ({signal_69, signal_34}), .Q ({Y_s1[0], Y_s0[0]}) ) ;
endmodule
