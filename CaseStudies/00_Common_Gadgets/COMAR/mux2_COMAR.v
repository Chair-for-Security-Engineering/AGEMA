//
// -----------------------------------------------------------------
// COMPANY : Ruhr University Bochum
// AUTHOR  : AUTHOR  : David Knichel david.knichel@rub.de and Amir Moradi amir.moradi@rub.de 
// DOCUMENT: [Composable Gadgets with Reused Fresh Masks] https://doi.org/10.46586/tches.v2022.i3.114-140
// -----------------------------------------------------------------
//
// Copyright (c) 2022, David Knichel and  Amir Moradi
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

-- IF s = 1: c <= a, else b

module mux2_COMAR 
  #(parameter security_order = 1, /* ignored  */
    parameter pipeline       = 1) /* ignored  */
   (input  [1:0] a,
    input  [1:0] b,
    input  [1:0] s,
    input  [5:0] r,
    input  clk,    
    output [1:0] c
   );

   wire [1:0] sbar;
   wire [1:0] as;
   wire [1:0] bsbar;
   
   sbar[0] = ~s[0];
   sbar[1] =  s[1]; 
      
   and_COMAR #(.security_order(1), .pipeline(1)) AND_as    (.a(a),  .b(s),     .r(r), .clk(clk), .c(as));
   and_COMAR #(.security_order(1), .pipeline(1)) AND_bsbar (.a(b),  .b(sbar),  .r(r), .clk(clk), .c(bsbar));

   xor_COMAR #(.security_order(1), .pipeline(1)) XOR_res   (.a(as), .b(bsbar), .r(r), .clk(clk), .c(c));

endmodule
