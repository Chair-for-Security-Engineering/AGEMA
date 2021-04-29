(* fv_prop = "NI", fv_strat = "assumed", fv_order=d *)
module MSKand_DOM #(parameter d=2) (ina, inb, rnd, clk, out);

localparam n_rnd=d*(d-1)/2;

(* syn_keep = "true", keep = "true", fv_type = "sharing", fv_latency = 0 *) input  [d-1:0] ina, inb;
(* syn_keep = "true", keep = "true", fv_type = "random", fv_count = 1, fv_rnd_lat_0 = 0, fv_rnd_count_0 = n_rnd *) input [n_rnd-1:0] rnd;
(* fv_type = "clock" *) input clk;
(* syn_keep = "true", keep = "true", fv_type = "sharing", fv_latency = 1 *) output [d-1:0] out;

genvar i,j;

// unpack vector to matrix --> easier for randomness hendeling
wire [d-1:0] rnd_mat [d-1:0]; 
for(i=0; i<d; i=i+1) begin: igen
    assign rnd_mat[i][i] = 0;
    for(j=i+1; j<d; j=j+1) begin: jgen
        assign rnd_mat[j][i] = rnd[((i*d)-i*(i+1)/2)+(j-1-i)];
        assign rnd_mat[i][j] = rnd_mat[j][i];
    end
end

for(i=0; i<d; i=i+1) begin: ParProdI
    (* syn_preserve = "true", preserve = "true" *) reg [d-1:0] rfrsh_reg;
    assign out[i] = ^rfrsh_reg;
    for(j=0; j<d; j=j+1) begin: ParProdJ
        (* syn_keep = "true", keep = "true" *) wire mult_wire = ina[i] & inb[j];
        (* syn_keep = "true", keep = "true" *) wire rfrsh_wire = mult_wire ^ rnd_mat[i][j];
        always @(posedge clk) begin
            rfrsh_reg[j] <= rfrsh_wire;
        end
    end
end

endmodule
