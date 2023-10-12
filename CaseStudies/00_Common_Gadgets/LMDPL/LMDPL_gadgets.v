
module nonlinearLayer_LMDPL(
   input  a,
   input  b,
   input  r,
   output [7:0] t);
	
   assign t[0] = ( a &  b) ^ r;
   assign t[1] = ( a & !b) ^ r;
   assign t[2] = (!a &  b) ^ r;
   assign t[3] = (!a & !b) ^ r;
	
   assign t[7:4] = ~t[3:0];
	
endmodule	

//-----------------------------------------------------------------------	

module OperationLayer_LMDPL(
   input  [7:0] t,
   input  [2:1] a,
   input  [2:1] b,
   output [2:1] c);
	
   wire   [7:0] q;
	
   and_3 andInst0 (.I({a[2], b[2], t[0]}), .O(q[0]));
   and_3 andInst1 (.I({a[2], b[1], t[1]}), .O(q[1]));
   and_3 andInst2 (.I({a[1], b[2], t[2]}), .O(q[2]));
   and_3 andInst3 (.I({a[1], b[1], t[3]}), .O(q[3]));
   or_4  orInst1  (.I(q[3:0]), .O(c[1]));
	
   and_3 andInst4 (.I({a[2], b[2], t[4]}), .O(q[4]));
   and_3 andInst5 (.I({a[2], b[1], t[5]}), .O(q[5]));
   and_3 andInst6 (.I({a[1], b[2], t[6]}), .O(q[6]));
   and_3 andInst7 (.I({a[1], b[1], t[7]}), .O(q[7]));
   or_4  orInst2  (.I(q[7:4]), .O(c[2]));
	
endmodule	

//-----------------------------------------------------------------------	

module nonlinear_LMDPL #(
   parameter [1:0] CONF = 2'b00 
                       // 2'b00: and
                       // 2'b01: nand
                       // 2'b10: nor
                       // 2'b11: or
   )(
   input  [2:0] a,
   input  [2:0] b,
   input  mid_rst,
   input  clk,
   input  r,
   output [2:0] c);
	
   wire   [7:0] t;
   wire   [7:0] t_reg;
   wire   [2:0] in_a;
   wire   [2:0] in_b;
   wire   [2:0] out_c;
	
   generate
      if (CONF[0] == 1'b0) begin: Gen_out
         assign c = out_c;
      end else begin: Gen_out_inv
         assign c = {out_c[1], out_c[2], out_c[0]};
      end

      if (CONF[1] == 1'b0) begin: Gen_in
         assign in_a = a;
         assign in_b = b;
      end else begin: Gen_in_inv
         assign in_a = {a[1], a[2], a[0]};
         assign in_b = {b[1], b[2], b[0]};
      end
   endgenerate
	
   nonlinearLayer_LMDPL nonlinearInst (.a(in_a[0]), .b(in_b[0]), .r(r), .t(t));
   assign out_c[0] = r;

   //-----------------------------------------------------------------
	
   genvar i;
   generate
      for (i=0; i < 8; i=i+1) begin: gen_reg
         reg_r regIns (.D(t[i]), .C(clk), .R(mid_rst), .Q(t_reg[i]));
      end
   endgenerate
	
   //-----------------------------------------------------------------
	
   OperationLayer_LMDPL OperationInst (.t(t_reg), .a(in_a[2:1]), .b(in_b[2:1]), .c(out_c[2:1]));

endmodule

//-----------------------------------------------------------------------	

module not_LMDPL(
   input  [2:0] x,
   output [2:0] y);

   assign y = {x[1], x[2], x[0]};

endmodule

//-----------------------------------------------------------------------	

module linear_LMDPL #(
   parameter CONF = 1'b0  
                 // 1'b0: xor
                 // 1'b1: xnor
   )(
   input  [2:0] a,
   input  [2:0] b,
   output [2:0] c);

   wire   [3:0] w;
   wire   [2:0] out_c;

   generate
      if (CONF == 1'b0) begin: Gen_out
         assign c = out_c;
      end else begin: Gen_out_inv
         assign c = {out_c[1], out_c[2], out_c[0]};
      end
   endgenerate

   //-----------------------------------------------------

   xor_2 xorInst  (.I({a[0], b[0]}), .O(out_c[0]));
	
   //-----------------------------------------------------
	
   and_2 andInst0 (.I({a[2], b[1]}), .O(w[0]));
   and_2 andInst1 (.I({a[1], b[2]}), .O(w[1]));
   and_2 andInst2 (.I({a[2], b[2]}), .O(w[2]));
   and_2 andInst3 (.I({a[1], b[1]}), .O(w[3]));
	
   or_2  orInst1  (.I(w[1:0]), .O(out_c[1]));
   or_2  orInst2  (.I(w[3:2]), .O(out_c[2]));
	
endmodule

//-----------------------------------------------------------------------	

// if s = 1: c <= a, else b
module mux2_LMDPL(
   input  [2:0] s,
   input  [2:0] a,
   input  [2:0] b,
   input  mid_rst,
   input  clk,
   input  r,
   output [2:0] c);

   wire   [2:0] a_xor_b;
   wire   [2:0] w;

   linear_LMDPL    #(.CONF(1'b0))  xorInst1 (.a(a), .b(b), .c(a_xor_b));
   nonlinear_LMDPL #(.CONF(2'b00)) andInst  (.a(s), .b(a_xor_b), .mid_rst(mid_rst), .clk(clk), .r(r), .c(w));
   linear_LMDPL    #(.CONF(1'b0))  xorInst2 (.a(w), .b(b), .c(c));

endmodule

//-----------------------------------------------------------------------	

// if s = 1: c <= a, else b
module mux2_masked_LMDPL(
   input  [2:0] s, // s is not masked
   input  [2:0] a,
   input  [2:0] b,
   output [2:0] c);

   wire   [3:0] w;

   //-----------------------------------------------------

   mux2_sr MuxInst  (.S(s[0]), .A(a[0]), .B(b[0]), .O(c[0]));
	
   //-----------------------------------------------------

   and_2 andInst0 (.I({s[1], a[1]}), .O(w[0]));
   and_2 andInst1 (.I({s[2], b[1]}), .O(w[1]));
   or_2  orInst1  (.I(w[1:0]), .O(c[1]));
 
   and_2 andInst2 (.I({s[1], a[2]}), .O(w[2]));
   and_2 andInst3 (.I({s[2], b[2]}), .O(w[3]));
   or_2  orInst2  (.I(w[3:2]), .O(c[2]));

endmodule

//-----------------------------------------------------------------------	

module reg_LMDPL(
   input  [2:0] D,
   input  Po_rst,
   input  en,
   input  clk,
   output [2:0] Q);
	
   wire   [2:1] W;
	
   reg_r_en regIns0   (.D(D[0]), .C(clk), .R(Po_rst), .EN(en), .Q(Q[0]));
		
   reg_r    regIns1_0 (.D(D[1]), .C(clk), .R(Po_rst), .Q(W[1]));
   reg_r    regIns1_1 (.D(W[1]), .C(clk), .R(Po_rst), .Q(Q[1]));

   reg_s    regIns2_0 (.D(D[2]), .C(clk), .S(Po_rst), .Q(W[2]));
   reg_r    regIns2_1 (.D(W[2]), .C(clk), .R(Po_rst), .Q(Q[2]));

endmodule

//-----------------------------------------------------------------------	

module reg_sr_LMDPL(
   input  D,
   input  Po_rst,
   input  en,
   input  clk,
   output Q,
   output QN);

   reg_r_en regIns0   (.D(D), .C(clk), .R(Po_rst), .EN(en), .Q(Q));
   assign QN = !Q;

endmodule

//-----------------------------------------------------------------------	

module Precharger_reg(
   input  D,
   input  mid_rst,
   input  clk,
   output [2:1] Q);
	
   wire   W, Wn;
   
   assign W  =  D;
   assign Wn = !D;
   
   reg_r regIns1 (.D(W),  .C(clk), .R(mid_rst), .Q(Q[1]));
   reg_r regIns2 (.D(Wn), .C(clk), .R(mid_rst), .Q(Q[2]));

endmodule

//-----------------------------------------------------------------------	

module Precharger(
   input  D,
   input  pre,
   output [2:1] Q);
	
   wire   W, Wn;
   
   assign W  =  D;
   assign Wn = !D;
   
   nor_2 norInst1 (.I({W,  pre}), .O(Q[2]));
   nor_2 norInst2 (.I({Wn, pre}), .O(Q[1]));

endmodule

//-----------------------------------------------------------------------	

module ClockController_LMDPL(
   input  clk,
   input  Po_rst,
   output pre1,
   output pre2,
   output mid_rst);
	
   reg_r  regInst (.D(pre2), .C(clk), .R(Po_rst), .Q(pre1));
   
   assign pre2 = !pre1;
   assign mid_rst = Po_rst | pre1;
	
endmodule
