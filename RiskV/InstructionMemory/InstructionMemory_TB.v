`include "InstructionMemory.v"
`include "../ClockGenerator/ClockGenerator.v"

module InstructionMemory_TB();
    reg [63:0] address;
    wire [31:0] instruction;
    InstructionMemory im(.Address(address), .Instruction(instruction));

    initial begin
        #1000 // set instructions
            #10 $display("\nInstructions:");

        #10 address = 1;
        #5 $display("  Address: %d    |   Instruction:  0x%h" , address, instruction);

        #10 address = 2;
        #5 $display("  Address: %d    |   Instruction:  0x%h" , address, instruction);

        #10 address = 3;
        #5 $display("  Address: %d    |   Instruction:  0x%h" , address, instruction);

        #10 address = 4;
        #5 $display("  Address: %d    |   Instruction:  0x%h" , address, instruction);

        #10 address = 5;
        #5 $display("  Address: %d    |   Instruction:  0x%h" , address, instruction);

        #10 address = 6;
        #5 $display("  Address: %d    |   Instruction:  0x%h" , address, instruction);

        #10 address = 7;
        #5 $display("  Address: %d    |   Instruction:  0x%h" , address, instruction);
    end

endmodule