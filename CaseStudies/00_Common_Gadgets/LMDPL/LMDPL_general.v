`timescale 100ps/1ps

//-----------------------------------------

module and_2 (
   input  [1:0] I,
   output       O);

   assign O = &I;

endmodule	

//-----------------------------------------

module and_3 (
   input  [2:0] I,
   output       O);

   assign O = &I;

endmodule	

//-----------------------------------------

module or_2 (
   input  [1:0] I,
   output       O);

   assign O = |I;

endmodule	

//-----------------------------------------

module or_4 (
   input  [3:0] I,
   output       O);

   assign O = |I;

endmodule	

//-----------------------------------------

module nor_2 (
   input  [1:0] I,
   output       O);

   assign O = !(|I);

endmodule	

//-----------------------------------------

module xor_2 (
   input  [1:0] I,
   output       O);

   assign O = ^I;

endmodule	

//-----------------------------------------

module mux2_sr (
   input  S, A, B,
   output O);

   assign O = (S == 1'b1)? A:B;

endmodule	

//-----------------------------------------

module reg_r(
   input  D,
   input  C,
   input  R,
   output reg Q);

   always @(posedge C) 
   begin
      if (R == 1'b1)
         Q <= 1'b0;
      else	
         Q <= D; 
   end 
	
endmodule	

//-----------------------------------------

module reg_s(
   input  D,
   input  C,
   input  S,
   output reg Q);

   always @(posedge C) 
   begin
      if (S == 1'b1)
         Q <= 1'b1;
      else	
         Q <= D; 
   end 
	
endmodule	

//-----------------------------------------

module reg_r_en(
   input  D,
   input  C,
   input  R,
   input  EN,
   output reg Q);

   always @(posedge C) 
   begin
      if (R == 1'b1)
         Q <= 1'b0;
      else if (EN == 1'b1)
         Q <= D;
   end 
	
endmodule	

//-----------------------------------------
