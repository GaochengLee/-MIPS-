module extender (din, dout, ExtOp);
  input [15:0] din;
  output [31:0] dout;
  input ExtOp;
  
  assign dout = (ExtOp && din[15]) == 1 ? {16'hffff, din} : {16'h0, din};

endmodule
