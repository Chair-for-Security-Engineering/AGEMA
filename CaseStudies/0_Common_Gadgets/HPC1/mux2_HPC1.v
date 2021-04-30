//
// partially taken from https://github.com/cassiersg/fullverif
//
// -----------------------------------------------------------------
// COMPANY : Ruhr University Bochum
// AUTHOR  : Amir Moradi (amir.moradi@rub.de)
// DOCUMENT: https://eprint.iacr.org/2021/
// -----------------------------------------------------------------
//
//
// Copyright (c) 2021, David Knichel, Amir Moradi, Niolai Müller, Pascal Sasdrich
//
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTERS BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Please see LICENSE and README for license and further instructions.
//

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