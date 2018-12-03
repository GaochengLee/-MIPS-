module pc(clk, reset, pcin, pcout);
  input clk, reset;
  input [29:0] pcin;
  output [29:0] pcout;
  
  reg [29:0] temp;
  
  assign pcout = temp;
  
  always@ (posedge clk, posedge reset)
  begin
    if(reset) temp = 30'h0000_0c00;
    else temp = pcin;
  end
endmodule
