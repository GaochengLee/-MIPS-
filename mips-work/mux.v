module mux(ina, inb, dout, s);
  input [31:0] ina;
  input [31:0] inb;
  input s;
  output [31:0] dout;
  
  assign dout = s ? ina : inb;
  
endmodule
