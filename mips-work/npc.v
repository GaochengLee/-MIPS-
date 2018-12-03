module npc(npc_sel, zero, imm, pc, npcout, jumpCtr, tarAddr);
  input npc_sel, zero, jumpCtr;
  input [25:0] tarAddr;
  input [15:0] imm;
  input [29:0] pc;
  output [29:0] npcout;
  
  wire [29:0] t0, t1, immext, nextAddr;

  assign nextAddr = {pc[29:26], tarAddr};
  
  assign immext = (imm[15] == 0) ? {14'b0, imm} : {14'hffff, imm};
  assign t0 = pc + 1;
  assign t1 = t0 + immext;
  assign npcout = jumpCtr ? nextAddr : ((npc_sel && zero) ? t1 : t0);
  
endmodule
