module ctrl(Instruction, nPC_sel, RegWr, RegDst, ExtOp, ALUSrc, ALUctr, MemWr, MemtoReg, jumpCtr, rs, rt, rd, tarAddr, imm16);

    input [31:0] Instruction;
    output reg nPC_sel;
    output reg RegWr;
    output reg RegDst;
    output reg ExtOp;
    output reg ALUSrc;
    output reg [3:0] ALUctr;
    output reg MemWr;
    output reg MemtoReg;
    output reg jumpCtr;


    output rs, rt, rd;
    output tarAddr; 
    output imm16;

    
    parameter R = 6'b000000,
              LW = 6'b100011,
              SW = 6'b101011,
              BEQ = 6'b000100,
              ORI = 6'b001101,
              J = 6'b000010,
              LUI = 6'b001111;
              
              
    wire [5:0] opcode = Instruction[31:26];
    wire [5:0] funct = Instruction[5:0];
    wire [4:0] rs = Instruction[25:21];
    wire [4:0] rt = Instruction[20:16];
    wire [4:0] rd = Instruction[15:11];
    wire [25:0] tarAddr = Instruction[25:0];
    wire [15:0] imm16 = Instruction[15:0];
    
    always @(*)begin
      case (opcode)
        R : begin
          if (funct == 6'b100001) begin
            ALUctr <= 4'b0010;
            
            RegDst = 1;
            ALUSrc = 0;
            MemtoReg = 0;
            RegWr = 1;
            MemWr = 0;
            nPC_sel = 0;
            ExtOp = 0;
            jumpCtr = 0;
          end
          else begin
            ALUctr <= 4'b0110;
            
            RegDst = 1;
            ALUSrc = 0;
            MemtoReg = 0;
            RegWr = 1;
            MemWr = 0;
            nPC_sel = 0;
            ExtOp = 0;
            jumpCtr = 0;
          end
        end
        LW : begin
          ALUctr <= 4'b0010;
          
            RegDst = 0;
            ALUSrc = 1;
            MemtoReg = 1;
            RegWr = 1;
            MemWr = 0;
            nPC_sel = 0;
            ExtOp = 1;
            jumpCtr = 0;
        end
        SW : begin
          ALUctr <= 4'b0010;
          
            RegDst = 0;
            ALUSrc = 1;
            MemtoReg = 0;
            RegWr = 0;
            MemWr = 1;
            nPC_sel = 0;
            ExtOp = 1;
            jumpCtr = 0;
        end
        BEQ : begin
          ALUctr <= 4'b0110;
          
          RegDst = 0;
          ALUSrc = 0;
          MemtoReg = 0;
          RegWr = 0;
          MemWr = 0;
          nPC_sel = 1;
          ExtOp = 0;
          jumpCtr = 0;
        end
        ORI : begin
          ALUctr = 4'b0001;
          
          RegDst = 0;
          ALUSrc = 1;
          MemtoReg = 0;
          RegWr = 1;
          MemWr = 0;
          nPC_sel = 0;
          ExtOp = 0;
          jumpCtr = 0;
        end
        J : begin
          ALUctr = 4'b0000;
          
          RegDst = 0;
          ALUSrc = 0;
          MemtoReg = 0;
          RegWr = 0;
          MemWr = 0;
          nPC_sel = 0;
          ExtOp = 0;
          jumpCtr = 1;
        end
        LUI : begin
          ALUctr = 4'b1010;
          
          RegDst = 0;
          ALUSrc = 1;
          MemtoReg = 0;
          RegWr = 1;
          MemWr = 0;
          nPC_sel = 0;
          ExtOp = 0;
          jumpCtr = 0;
        end
    endcase
  end
      
endmodule
          
          
        
  
