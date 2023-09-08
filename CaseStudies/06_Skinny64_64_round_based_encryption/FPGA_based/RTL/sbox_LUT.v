
module sbox(X, Y);
  input  [3:0] X;
  output [3:0] Y;

  LUT4 #(.INIT(16'b1100110110010100)) y_0 (.I0(X[0]),  .I1(X[1]),  .I2(X[2]),  .I3(X[3]), .O(Y[0]));
  LUT4 #(.INIT(16'b1110000111100010)) y_1 (.I0(X[0]),  .I1(X[1]),  .I2(X[2]),  .I3(X[3]), .O(Y[1]));
  LUT4 #(.INIT(16'b1111110000000011)) y_2 (.I0(X[0]),  .I1(X[1]),  .I2(X[2]),  .I3(X[3]), .O(Y[2]));
  LUT4 #(.INIT(16'b1010101010100101)) y_3 (.I0(X[0]),  .I1(X[1]),  .I2(X[2]),  .I3(X[3]), .O(Y[3]));

endmodule
