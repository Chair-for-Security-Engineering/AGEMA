
module BUF(A, Y);
input A;
output Y;
assign Y = A;
endmodule

module NOT(A, Y);
input A;
output Y;
assign Y = ~A;
endmodule

module NAND(A, B, Y);
input A, B;
output Y;
assign Y = ~(A & B);
endmodule

module AND(A, B, Y);
input A, B;
output Y;
assign Y = (A & B);
endmodule

module NOR(A, B, Y);
input A, B;
output Y;
assign Y = ~(A | B);
endmodule

module OR(A, B, Y);
input A, B;
output Y;
assign Y = (A | B);
endmodule

module XOR(A, B, Y);
input A, B;
output Y;
assign Y = (A ^ B);
endmodule

module XNOR(A, B, Y);
input A, B;
output Y;
assign Y = ~(A ^ B);
endmodule

module DFF(C, D, Q);
input C, D;
output reg Q;
always @(posedge C)
	Q <= D;
endmodule

