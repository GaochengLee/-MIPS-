module regfile(clk, reset, busw, regwr, rs, rt, rw, busa, busb, RegDst, rd);
  input clk, regwr, reset, RegDst;
  input [4:0] rs, rt, rw, rd;
  input [31:0] busw;
  output [31:0] busa, busb;
  wire [4:0] rw;
  
  reg [31:0] regstore[31:0];
  integer i;
  integer j;

  assign rw = RegDst ? rd : rt;
  assign busa = regstore[rs];
  assign busb = regstore[rt];
  
  always @(posedge clk,  posedge reset)
  
  begin
    if (reset)
      for (i = 0; i < 32; i = i + 1) regstore[i] = 0;
    else
    if (regwr && rw != 0)
      regstore[rw] = busw;
  end
endmodule
  

