module dm(clk, reset, Addr, din, dout, WrEn);
  input [31:0] Addr;
  input [31:0] din;
  input WrEn, clk, reset;
  output reg [31:0] dout;
  
  reg [31:0] dm[1023:0];
  
  always @(posedge clk, posedge reset)
    begin
      if(WrEn)
        dm[Addr[9:0]][31:0] <= din[31:0];
    end

  always @(*)
    dout[31:0] <= dm[Addr[9:0]][31:0];

endmodule
  
