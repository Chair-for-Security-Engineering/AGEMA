`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

module AND(
    input  A,
	 input  B,
    output Y
    );

 assign Y = A & B;

endmodule

//////////////////////////////////////////////////////////////////////////////////

module NAND(
    input  A,
	 input  B,
    output Y
    );

 assign Y = ~(A & B);

endmodule

//////////////////////////////////////////////////////////////////////////////////

module OR(
    input  A,
	 input  B,
    output Y
    );

 assign Y = A | B;

endmodule

//////////////////////////////////////////////////////////////////////////////////

module NOR(
    input  A,
	 input  B,
    output Y
    );

 assign Y = ~(A | B);

endmodule

//////////////////////////////////////////////////////////////////////////////////

module XOR(
    input  A,
	 input  B,
    output Y
    );

 assign Y = A ^ B;

endmodule

//////////////////////////////////////////////////////////////////////////////////

module XNOR(
    input  A,
	 input  B,
    output Y
    );

 assign Y = ~(A ^ B);

endmodule

//////////////////////////////////////////////////////////////////////////////////

module NOT(
    input  A,
    output Y
    );

 assign Y = ~A;

endmodule

//////////////////////////////////////////////////////////////////////////////////

module BUFF(
    input  A,
    output Y
    );

 assign Y = A;

endmodule

//////////////////////////////////////////////////////////////////////////////////

module DFF(
    input  C,
	 input  D,
    output reg Q = 1'b0
    );

	always @(posedge C) 
	begin
		Q <= D; 
	end 
	
endmodule

//////////////////////////////////////////////////////////////////////////////////

module DFF_X(
    input  C,
	 input  D,
    output reg Q = 1'b0,
    output QN
    );

	always @(posedge C) 
	begin
		Q <= D; 
	end 

	assign QN = ~Q;
	
endmodule

//////////////////////////////////////////////////////////////////////////////////

module Latch_X(
    input  E,
	 input  D,
    output reg Q = 1'b0,
    output QN
    );

	always @(E) 
	begin
		if (E)
			Q <= D; 
	end
	
	assign QN = ~Q;
		
endmodule

//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

module BUF_X1(
    input  A,
    output Z
    );

	assign Z = A;
		
endmodule

//////////////////////////////////////////////////////////////////////////////////

module INV_X1(
    input  A,
    output ZN
    );

 assign ZN = ~A;

endmodule

module INV_X2(
    input  A,
    output ZN
    );

 assign ZN = ~A;

endmodule

module INV_X4(
    input  A,
    output ZN
    );

 assign ZN = ~A;

endmodule

//////////////////////////////////////////////////////////////////////////////////

module AND2_X1(
    input  A1,
	 input  A2,
    output ZN
    );

 assign ZN = A1 & A2;

endmodule

//////////////////////////////////////////////////////////////////////////////////

module XOR2_X1(
    input  A,
	 input  B,
    output Z
    );

 assign Z= A ^ B;

endmodule

module XOR2_X2(
    input  A,
	 input  B,
    output Z
    );

 assign Z= A ^ B;

endmodule

module XOR2_X4(
    input  A,
	 input  B,
    output Z
    );

 assign Z= A ^ B;

endmodule


//////////////////////////////////////////////////////////////////////////////////

module XNOR2_X1(
    input  A,
	 input  B,
    output ZN
    );

 assign ZN= ~(A ^ B);

endmodule

module XNOR2_X2(
    input  A,
	 input  B,
    output ZN
    );

 assign ZN= ~(A ^ B);

endmodule

module XnOR2_X4(
    input  A,
	 input  B,
    output ZN
    );

 assign ZN= ~(A ^ B);

endmodule

//////////////////////////////////////////////////////////////////////////////////

module OR2_X1(
    input  A1,
	 input  A2,
    output ZN
    );

 assign ZN= A1 | A2;

endmodule

module OR2_X2(
    input  A1,
	 input  A2,
    output ZN
    );

 assign ZN= A1 | A2;

endmodule

module OR2_X4(
    input  A1,
	 input  A2,
    output ZN
    );

 assign ZN= A1 | A2;

endmodule

//////////////////////////////////////////////////////////////////////////////////

module NOR2_X1(
    input  A1,
	 input  A2,
    output ZN
    );

 assign ZN= ~(A1 | A2);

endmodule

module NOR2_X2(
    input  A1,
	 input  A2,
    output ZN
    );

 assign ZN= ~(A1 | A2);

endmodule

module NOR2_X4(
    input  A1,
	 input  A2,
    output ZN
    );

 assign ZN= ~(A1 | A2);

endmodule

//////////////////////////////////////////////////////////////////////////////////

module NAND2_X1(
    input  A1,
	 input  A2,
    output ZN
    );

 assign ZN= ~(A1 & A2);

endmodule

module NAND2_X2(
    input  A1,
	 input  A2,
    output ZN
    );

 assign ZN= ~(A1 & A2);

endmodule

module NAND2_X4(
    input  A1,
	 input  A2,
    output ZN
    );

 assign ZN= ~(A1 & A2);

endmodule

//////////////////////////////////////////////////////////////////////////////////

module DFF_X1(
    input  D,
    input  CK,
    output reg Q = 1'b0,
    output QN
    );

	always @(posedge CK) 
	begin
		Q <= D; 
	end 
	
	assign QN = ~Q;
	
endmodule

//////////////////////////////////////////////////////////////////////////////////

module DFF_X2(
    input  D,
    input  CK,
    output reg Q = 1'b0,
    output QN
    );

	always @(posedge CK) 
	begin
		Q <= D; 
	end 
	
	assign QN = ~Q;
	
endmodule

//////////////////////////////////////////////////////////////////////////////////

module DFF_X4(
    input  D,
    input  CK,
    output reg Q = 1'b0,
    output QN
    );

	always @(posedge CK) 
	begin
		Q <= D; 
	end 
	
	assign QN = ~Q;
	
endmodule


//////////////////////////////////////////////////////////////////////////////////

module MUX2_X1(
    input  S,
	 input  A,
	 input  B,
    output Z
    );

 assign Z = ((~S) & A) | (S & B);

endmodule

module MUX2_X2(
    input  S,
	 input  A,
	 input  B,
    output Z
    );

 assign Z = ((~S) & A) | (S & B);

endmodule

//////////////////////////////////////////////////////////////////////////////////

