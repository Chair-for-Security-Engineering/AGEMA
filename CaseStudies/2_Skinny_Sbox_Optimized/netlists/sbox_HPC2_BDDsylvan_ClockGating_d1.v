/* modified netlist. Source: module sbox in file Designs/SkinnySbox/AGEMA/sbox_opt_correct/sbox.v */
/* clock gating is added to the circuit, the latency increased 8 time(s)  */

module sbox_HPC2_BDDsylvan_ClockGating_d1 (X_s0, clk, X_s1, Fresh, rst, Y_s0, Y_s1, Synch);
    input [3:0] X_s0 ;
    input clk ;
    input [3:0] X_s1 ;
    input rst ;
    input [20:0] Fresh ;
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
    wire signal_55 ;
    wire signal_57 ;
    wire signal_58 ;
    wire signal_59 ;
    wire signal_60 ;
    wire signal_61 ;
    wire signal_62 ;
    wire signal_63 ;
    wire signal_64 ;
    wire signal_65 ;
    wire signal_67 ;
    wire signal_68 ;
    wire signal_69 ;
    wire signal_70 ;
    wire signal_71 ;
    wire signal_72 ;
    wire signal_73 ;
    wire signal_75 ;
    wire signal_76 ;
    wire signal_77 ;
    wire signal_78 ;
    wire signal_105 ;

    /* cells in depth 0 */
    ClockGatingController #(9) cell_47 ( .clk (clk), .rst (rst), .GatedClk (signal_105), .Synch (Synch) ) ;

    /* cells in depth 1 */

    /* cells in depth 2 */
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_26 ( .s ({X_s1[1], X_s0[1]}), .b ({1'b0, 1'b0}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[0]), .c ({signal_55, signal_37}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_27 ( .s ({X_s1[0], X_s0[0]}), .b ({1'b0, 1'b1}), .a ({1'b0, 1'b0}), .clk (clk), .r (Fresh[1]), .c ({signal_57, signal_38}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_28 ( .s ({X_s1[0], X_s0[0]}), .b ({1'b0, 1'b0}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[2]), .c ({signal_58, signal_39}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_29 ( .s ({X_s1[1], X_s0[1]}), .b ({1'b0, 1'b1}), .a ({1'b0, 1'b0}), .clk (clk), .r (Fresh[3]), .c ({signal_59, signal_40}) ) ;

    /* cells in depth 3 */

    /* cells in depth 4 */
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_30 ( .s ({X_s1[1], X_s0[1]}), .b ({signal_57, signal_38}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[4]), .c ({signal_60, signal_41}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_31 ( .s ({X_s1[1], X_s0[1]}), .b ({signal_57, signal_38}), .a ({signal_58, signal_39}), .clk (clk), .r (Fresh[5]), .c ({signal_61, signal_42}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_32 ( .s ({X_s1[1], X_s0[1]}), .b ({1'b0, 1'b0}), .a ({signal_57, signal_38}), .clk (clk), .r (Fresh[6]), .c ({signal_62, signal_43}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_33 ( .s ({X_s1[1], X_s0[1]}), .b ({signal_58, signal_39}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[7]), .c ({signal_63, signal_44}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_34 ( .s ({X_s1[1], X_s0[1]}), .b ({signal_57, signal_38}), .a ({1'b0, 1'b0}), .clk (clk), .r (Fresh[8]), .c ({signal_64, signal_45}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_35 ( .s ({X_s1[1], X_s0[1]}), .b ({signal_58, signal_39}), .a ({1'b0, 1'b0}), .clk (clk), .r (Fresh[9]), .c ({signal_65, signal_46}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_36 ( .s ({X_s1[2], X_s0[2]}), .b ({signal_55, signal_37}), .a ({1'b0, 1'b1}), .clk (clk), .r (Fresh[10]), .c ({signal_67, signal_47}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_37 ( .s ({X_s1[2], X_s0[2]}), .b ({signal_59, signal_40}), .a ({1'b0, 1'b0}), .clk (clk), .r (Fresh[11]), .c ({signal_68, signal_48}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_38 ( .s ({X_s1[2], X_s0[2]}), .b ({signal_57, signal_38}), .a ({signal_58, signal_39}), .clk (clk), .r (Fresh[12]), .c ({signal_69, signal_49}) ) ;

    /* cells in depth 5 */

    /* cells in depth 6 */
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_39 ( .s ({X_s1[2], X_s0[2]}), .b ({signal_60, signal_41}), .a ({signal_55, signal_37}), .clk (clk), .r (Fresh[13]), .c ({signal_70, signal_50}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_40 ( .s ({X_s1[2], X_s0[2]}), .b ({signal_62, signal_43}), .a ({signal_61, signal_42}), .clk (clk), .r (Fresh[14]), .c ({signal_71, signal_51}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_41 ( .s ({X_s1[2], X_s0[2]}), .b ({signal_64, signal_45}), .a ({signal_63, signal_44}), .clk (clk), .r (Fresh[15]), .c ({signal_72, signal_52}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_42 ( .s ({X_s1[2], X_s0[2]}), .b ({signal_65, signal_46}), .a ({signal_63, signal_44}), .clk (clk), .r (Fresh[16]), .c ({signal_73, signal_53}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_43 ( .s ({X_s1[3], X_s0[3]}), .b ({signal_68, signal_48}), .a ({signal_67, signal_47}), .clk (clk), .r (Fresh[17]), .c ({signal_75, signal_36}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_44 ( .s ({X_s1[3], X_s0[3]}), .b ({signal_69, signal_49}), .a ({signal_58, signal_39}), .clk (clk), .r (Fresh[18]), .c ({signal_76, signal_35}) ) ;

    /* cells in depth 7 */

    /* cells in depth 8 */
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_45 ( .s ({X_s1[3], X_s0[3]}), .b ({signal_71, signal_51}), .a ({signal_70, signal_50}), .clk (clk), .r (Fresh[19]), .c ({signal_77, signal_34}) ) ;
    mux2_HPC2 #(.security_order(1), .pipeline(0)) cell_46 ( .s ({X_s1[3], X_s0[3]}), .b ({signal_73, signal_53}), .a ({signal_72, signal_52}), .clk (clk), .r (Fresh[20]), .c ({signal_78, signal_33}) ) ;

    /* register cells */
    reg_masked #(.security_order(1), .pipeline(0)) cell_0 ( .clk (signal_105), .D ({signal_76, signal_35}), .Q ({Y_s1[3], Y_s0[3]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_1 ( .clk (signal_105), .D ({signal_75, signal_36}), .Q ({Y_s1[2], Y_s0[2]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_2 ( .clk (signal_105), .D ({signal_78, signal_33}), .Q ({Y_s1[1], Y_s0[1]}) ) ;
    reg_masked #(.security_order(1), .pipeline(0)) cell_3 ( .clk (signal_105), .D ({signal_77, signal_34}), .Q ({Y_s1[0], Y_s0[0]}) ) ;
endmodule
