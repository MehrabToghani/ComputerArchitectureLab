`include "ImmGen.v"

module ImmGen_TB();
    reg [31:0] instruction;
    wire signed [63:0] immediate;

    ImmGen ig(.Instruction(instruction), .Immediate(immediate));

    initial begin
        #10 instruction = 'h015A04B3; // R-type: add x9, x20, x21
        #5 $display("  Instruction: add x9, x20, x21       |   Immediate:  %d" , immediate);

        #10 instruction = 'h0F053483; // I-type: ld x9, #240(x10)
        #5 $display("  Instruction: ld x9, #240(x10)       |   Immediate:  %d" , immediate);

        #10 instruction = 'h819C0067; // SB-type: beq x24, x25, #2048
        #5 $display("  Instruction: beq x24, x25, #2048    |   Immediate:  %d" , immediate);

        #10 instruction = 'h025F3023; // S-type: sd x5, #32(x30)
        #5 $display("  Instruction: sd x5, #32(x30)        |   Immediate:  %d" , immediate);

        #10 instruction = 'h00001837; // U-type: lui x16, #1
        #5 $display("  Instruction: lui x16, #1            |   Immediate:  %d" , immediate);
    end

endmodule : ImmGen_TB