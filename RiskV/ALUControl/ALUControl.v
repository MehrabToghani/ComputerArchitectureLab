module ALUControl(ALUOp, Funct7, Funct3, Outputs);
    input [1:0] ALUOp;
    input [6:0] Funct7;
    input [2:0] Funct3;
    output reg [3:0] Outputs;

    always @(*)
        casex ({ALUOp, Funct7, Funct3})
            12'b00xxxxxxxxxx: Outputs = 4'b0010; // ld, sd (desired: add)
            12'b01xxxxxxxxxx: Outputs = 4'b0110; // beq (desired: subtract)
            12'b100000000000: Outputs = 4'b0010; // add
            12'b100100000000: Outputs = 4'b0110; // sub
            12'b100000000111: Outputs = 4'b0000; // and
            12'b100000000110: Outputs = 4'b0001; // or
            default: Outputs = 4'bxxxx;
        endcase
endmodule
