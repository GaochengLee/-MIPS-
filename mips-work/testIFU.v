module testIFU;

  reg clk, reset, nPC_sel, zero, jumpCtr;
  wire [31:0] ins;
  reg [25:0] tarAddr;


  ifu ifu1(clk, reset, nPC_sel, zero, ins, jumpCtr, tarAddr);

  initial
  begin
    clk = 0;
    #5 reset = 0;
    #5 reset = 1;
  end

  always
    #20 clk =~ clk;

endmodule