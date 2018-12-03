module mips;
  reg clk, reset;

  wire [31:0] ins, busw, busa, busb, dout1, dout2, dout3, dout4;
  wire [25:0] tarAddr;
  wire [15:0] imm16;
  wire [4:0] rs, rt, rw, rd;
  wire [3:0] ALUctr;
  wire nPC_sel, RegWr, RegDst, ExtOp, ALUSrc, MemWr, MemtoReg, jumpCtr, zero;
  

  ifu ifu1(clk, reset, nPC_sel, zero, ins, jumpCtr, tarAddr);

  ctrl ctrl1(ins, nPC_sel, RegWr, RegDst, ExtOp, ALUSrc, ALUctr, MemWr, MemtoReg, jumpCtr, rs, rt, rd, tarAddr, imm16);

  regfile regfile1(clk, reset, busw, RegWr, rs, rt, rw, busa, busb, RegDst, rd);
  extender extender1(imm16, dout1, ExtOp);

  mux mux1(dout1, busb, dout2, ALUSrc);

  alu alu1(ALUctr, busa, dout2, zero, dout3);
  dm dm1(clk, reset, dout3, busb, dout4, MemWr);

  mux mux2(dout4, dout3, busw, MemtoReg);


  initial
  begin
    clk = 0;
    #5 reset = 1;
    #5 reset = 0;
  end

  always
    #20 clk =~ clk;

  
endmodule
