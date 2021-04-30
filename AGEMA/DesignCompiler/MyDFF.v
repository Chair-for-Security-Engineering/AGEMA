
module MyDFFs ( D, CK, Q);
  input  D, CK;
  output Q;

  DFF_X1 FF (.D(D), .CK(CK), .Q(Q), .QN());
  
endmodule

module MyDFF ( D, CK, Q, QN);
  input  D, CK;
  output Q, QN;
  
  MyDFFs FF (.D(D), .CK(CK), .Q(Q));
  assign QN = ~Q;

endmodule

