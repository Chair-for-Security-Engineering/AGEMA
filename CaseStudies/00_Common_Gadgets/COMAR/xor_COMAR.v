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

module xor_COMAR 
  #(parameter security_order = 1, /* ignored  */
    parameter pipeline       = 1) /* ignored  */
   (input  [1:0] a,
    input  [1:0] b,
    input  [5:0] r,
    input  clk,    
    output [1:0] c
   );

   wire [1:0] in0_masked, in1_masked, in0_masked_stable, in1_masked_stable;
   wire       xor0_masked, xor1_masked, xor2_masked, xor3_masked;
   wire       xor0_masked_stable, xor1_masked_stable, xor2_masked_stable, xor3_masked_stable;
   wire       sum_r, sum_r_stable;

   /* signal refreshing */

   assign in0_masked[0] = a[0] ^ r[0];
   assign in0_masked[1] = a[1] ^ r[0];

   assign in1_masked[0] = b[0] ^ r[1];
   assign in1_masked[1] = b[1] ^ r[1];

   reg1 reg_in0_masked_0 (.clk(clk), .d(in0_masked[0]), .q(in0_masked_stable[0]));
   reg1 reg_in0_masked_1 (.clk(clk), .d(in0_masked[1]), .q(in0_masked_stable[1]));
   reg1 reg_in1_masked_0 (.clk(clk), .d(in1_masked[0]), .q(in1_masked_stable[0]));
   reg1 reg_in1_masked_1 (.clk(clk), .d(in1_masked[1]), .q(in1_masked_stable[1]));

   /* operation stage 1 */

   assign xor0_masked = in0_masked_stable[0] ^ r[2]; 
   assign xor1_masked = in0_masked_stable[1] ^ r[3]; 
   assign xor2_masked = in1_masked_stable[0] ^ r[4]; 
   assign xor3_masked = in1_masked_stable[1] ^ r[5]; 

   assign sum_r = r[2] ^ r[3] ^ r[4] ^ r[5];

   reg1 reg_xor0_masked (.clk(clk), .d(xor0_masked), .q(xor0_masked_stable));
   reg1 reg_xor1_masked (.clk(clk), .d(xor1_masked), .q(xor1_masked_stable));
   reg1 reg_xor2_masked (.clk(clk), .d(xor2_masked), .q(xor2_masked_stable));
   reg1 reg_xor3_masked (.clk(clk), .d(xor3_masked), .q(xor3_masked_stable));

   reg1 reg_sum_r (.clk(clk), .d(sum_r), .q(sum_r_stable));
   
   /* operatoin staqe 2 */

   assign c[0] = xor0_masked_stable ^ xor1_masked_stable ^ xor2_masked_stable ^ xor3_masked_stable; 
   assign c[1] = sum_r_stable;

endmodule
