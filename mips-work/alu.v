module alu(ALUctr, busA, busB, zero, dout);
  input [3:0] ALUctr;
  input [31:0] busA, busB;
  output zero;
  output reg [31:0] dout;

  assign zero = dout == 0 ? 1 : 0;

  always @(ALUctr, busA, busB)
  begin
    case(ALUctr)
        4'b0010 : dout = busA + busB;
        4'b0110 : dout = busA - busB;
        4'b0001 : dout = busA | busB;
        4'b0111 : dout = busA & busB;
        4'b1010 : dout = {busB, 16'h0};
    endcase
  end
endmodule
                 
