//
// partially taken from https://github.com/cassiersg/fullverif
//

// SNI refresh gadget, for d=2,...,16
module MSKref #(parameter d=2) (in, clk, out, rnd);

`include "MSKref.vh"

(* syn_keep="true", keep="true" *) input [d-1:0] in;
(* syn_keep="true", keep="true" *) output reg [d-1:0] out;
input clk;
(* syn_keep="true", keep="true" *) input [ref_n_rnd-1:0] rnd;

(* syn_preserve = "true", preserve = "true" *) reg [d-1:0] share0;
always @(posedge clk)
    out <= in ^ share0;

if (d == 2) begin
    (* syn_preserve = "true", preserve = "true" *)
    always @(posedge clk) begin
        share0 <= {rnd[0], rnd[0]};
    end
end else if (d==3) begin
    (* syn_preserve = "true", preserve = "true" *) reg [d-1:0] share0b;
    always @(posedge clk) begin
        share0 <= {rnd[0]^rnd[1], rnd[1], rnd[0]};
    end
end else if (d==4 || d==5) begin
    wire [d-1:0] r1 = rnd[d-1:0];
    (* syn_preserve = "true", preserve = "true" *) reg [d-1:0] share0b;
    always @(posedge clk) begin
        share0 <= r1[d-1:0] ^ { r1[d-2:0], r1[d-1] };
    end
end

endmodule