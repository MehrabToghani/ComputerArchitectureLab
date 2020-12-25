module ImmGen(Instruction, Immediate);
    input [31:0] Instruction;
    output reg [63:0] Immediate;

    always @(*)
        case (Instruction[6:0])
            7'b0010011: Immediate = {{53{Instruction[31]}}, Instruction[30:20]}; // I-type
            7'b0000011: Immediate = {{53{Instruction[31]}}, Instruction[30:20]}; // I-type
            7'b0100011: Immediate = {{53{Instruction[31]}}, Instruction[30:25], Instruction[11:7]}; // S-type
            7'b1100111: Immediate = {{53{Instruction[31]}}, Instruction[7], Instruction[30:25], Instruction[11:8]}; // SB-type
            7'b0110111: Immediate = {{33{Instruction[31]}}, Instruction[30:12], 12'o0}; // U-type
            7'b1101111: Immediate = {{45{Instruction[31]}}, Instruction[19:12], Instruction[20], Instruction[30:21]}; // UJ-type
            default: Immediate = {64{1'bx}};
        endcase
endmodule
