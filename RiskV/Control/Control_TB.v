`include "Control.v"

module Control_TB();
    reg [6:0] opCode;
    wire aluSrc, memToReg, regWrite, memRead, memWrite, branch;
    wire [1:0] aluOp;

    Control c(.OpCode(opCode), .ALUSrc(aluSrc), .MemToReg(memToReg), .RegWrite(regWrite), .MemRead(memRead), .MemWrite(memWrite), .Branch(branch), .ALUOp(aluOp));

    initial begin
        // R Type
        #10 opCode = 7'b0110011;
        #5 $display("R Type:");

        // ld
        #10 opCode = 7'b0000011;
        #5 $display("ld:");

        // sd
        #10 opCode = 7'b0100011;
        #5 $display("sd:");

        // beq
        #10 opCode = 7'b1100011;
        #5 $display("beq:");
    end

    always @(opCode)
        begin
            #10 $display("  ALUSrc: %b" , aluSrc);
            $display("  MemToReg: %b" , memToReg);
            $display("  RegWrite: %b" , regWrite);
            $display("  MemRead: %b" , memRead);
            $display("  MemWrite: %b" , memWrite);
            $display("  Branch: %b" , branch);
            $display("  ALUOp: %b" , aluOp);
        end
endmodule