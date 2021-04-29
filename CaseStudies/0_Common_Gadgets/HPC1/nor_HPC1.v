module nor_HPC1 
#(parameter security_order = 2, parameter pipeline = 1)
(ina, inb, rnd, clk, outt);

parameter integer d = security_order+1;

`include "MSKand_HPC1.vh"

input  [d-1:0] ina;
input  [d-1:0] inb;
output [d-1:0] outt;
input clk;
input [and_pini_nrnd-1:0] rnd;

wire [d-1:0] inb_ref;
reg  [d-1:0] ina_delay;

wire [ref_n_rnd-1:0] rnd_ref;
assign rnd_ref = rnd[ref_n_rnd-1:0];

wire [and_pini_mul_nrnd-1:0] rnd_mul;
assign rnd_mul = rnd[and_pini_nrnd-1:ref_n_rnd];

wire [d-1:0] not_ina;
wire [d-1:0] not_inb;

assign not_ina[0]     = ~ina[0];
assign not_ina[d-1:1] =  ina[d-1:1];

assign not_inb[0]     = ~inb[0];
assign not_inb[d-1:1] =  inb[d-1:1];

if (pipeline != 0) begin 
    always @(posedge clk)
        ina_delay <= not_ina;
end else begin
    always @(*)
        ina_delay <= not_ina;
end

MSKref #(.d(d)) rfrsh (.in(not_inb), .clk(clk), .out(inb_ref), .rnd(rnd_ref));
MSKand_DOM #(.d(d)) mul (.ina(ina_delay), .inb(inb_ref), .clk(clk), .rnd(rnd_mul), .out(outt));

endmodule