module analysis;

  reg clk, reset, RegDst, RegWr, ExtOp, ALUSrc, MemWr, MemtoReg, WrEn;
  reg [3:0] ALUctr;
  reg [15:0] imm;
  reg [4:0] ra, rb, rw, rd;
  
  wire zero;
  wire [31:0] busw, busa, busb, dout1, dout2, dout3, dout4, dout5;


  regfile regfile1(clk, reset, busw, RegWr, ra, rb, rw, busa, busb, RegDst, rd);
  extender extender1(imm, dout1, ExtOp);
  mux mux1(dout1, busb, dout2, ALUSrc);

  alu alu1(ALUctr, busa, dout2, zero, dout3);
  dm dm1(clk, reset, dout3, busb, dout4, WrEn);
  mux mux2(dout4, dout3, busw, MemtoReg);

  initial
  begin
    clk = 0; reset = 0; RegDst = 0; RegWr = 0; ExtOp = 0; ALUSrc = 0; MemWr = 0; MemtoReg = 0; WrEn = 0; ALUctr <= 4'b0000;

    #5 reset = 1;
     RegDst = 0;
      RegWr = 1;
       ExtOp = 1;
        ALUSrc = 1;
         ALUctr = 4'b0010;
          MemWr = 1;
           MemtoReg = 0;
            ra <= 5'b1;
             rb <= 5'b10;
              imm <= 16'h12;
    #5 reset = 0; 

  end

  always
  #20 clk =~ clk;

endmodule
