module sbox (SI, clk, SO);
   
   /* Inputs */
   input      [3:0] SI;
   input  clk;
   
   /* Outputs */
   output reg [3:0] SO;   
   
   /* Always blocks */
   always @(posedge clk)
   begin
      case(SI)
         4'h0 : SO = 4'hC;
         4'h1 : SO = 4'h6;
         4'h2 : SO = 4'h9;
         4'h3 : SO = 4'h0;
         4'h4 : SO = 4'h1;
         4'h5 : SO = 4'hA;
         4'h6 : SO = 4'h2;
         4'h7 : SO = 4'hB;
         4'h8 : SO = 4'h3;
         4'h9 : SO = 4'h8;
         4'hA : SO = 4'h5;
         4'hB : SO = 4'hD;
         4'hC : SO = 4'h4;
         4'hD : SO = 4'hE;
         4'hE : SO = 4'h7;
         4'hF : SO = 4'hF;
      endcase
   end

endmodule
