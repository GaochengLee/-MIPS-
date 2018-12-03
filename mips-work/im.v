module  im(addr, ins);
  input [9:0] addr;
  output [31:0] ins;
  
  reg [31:0] my_memory[1023:0];
  assign ins = my_memory[addr];
  
  initial
    $readmemh("test.txt", my_memory);
  
endmodule
