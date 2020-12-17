module Control(OpCode, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
    input [6:0] OpCode;
    output wire ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch;
    output wire [1:0] ALUOp;

    reg [7:0] outputs;
    assign {ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = outputs;

    always @(*)
        begin
            casex (OpCode)
                7'b0110011: assign outputs = 8'b00100010; // R Type
                7'b0000011: assign outputs = 8'b11110000; // ld
                7'b0100011: assign outputs = 8'b1x001000; // sd
                7'b1100011: assign outputs = 8'b0x000101; // beq
                default: assign outputs = 8'bxxxxxxxx;
            endcase
        end
endmodule
