module ifu(clk, reset, nPC_sel, zero, ins, jumpCtr, tarAddr);

  input clk, reset, nPC_sel, zero, jumpCtr;
  input [25:0] tarAddr;
  output [31:0] ins;

  wire [15:0] imm;
  wire [29:0] npcout, pcout;

  assign imm = ins[15:0];

  pc pc1(clk, reset, npcout, pcout);
  im im1(pcout[9:0], ins);
  npc npc1(nPC_sel, zero, imm, pcout, npcout, jumpCtr, tarAddr);

endmodule
