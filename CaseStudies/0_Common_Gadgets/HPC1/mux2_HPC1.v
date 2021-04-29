module mux2_HPC1 
#(parameter security_order = 2, parameter pipeline = 1)
(ina, inb, ins, rnd, clk, outt);

/* IF s = 1: c <= a, else b */

parameter integer d = security_order+1;

`include "MSKand_HPC1.vh"

input  [d-1:0] ina;
input  [d-1:0] inb;
input  [d-1:0] ins;
output [d-1:0] outt;
input clk;
input [and_pini_nrnd-1:0] rnd;

wire [d-1:0] and_in, and_out;
reg  [d-1:0] b_s1, b_s2;

genvar i;
for (i=0; i<d; i=i+1) 
begin: gen_1
    assign and_in[i] = ina[i] ^ inb[i];

    //pipeline
    if (pipeline != 0)
    begin
        always @(posedge clk)
        begin
            b_s2[i] <= b_s1[i];
            b_s1[i] <= inb[i];
	 end        
    end	else
    begin
        always @(*)
            b_s2[i] <= inb[i];
    end
    
    assign outt[i] = and_out[i] ^ b_s2[i];
end

and_HPC1 #(.security_order(security_order), .pipeline(pipeline)) and_HPC1_inst 
(.ina(ins), .inb(and_in), .rnd(rnd), .clk(clk), .outt(and_out));

endmodule