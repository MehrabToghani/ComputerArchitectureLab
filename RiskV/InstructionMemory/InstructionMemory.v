`include "../Memory/Memory.v"

module InstructionMemory(Address, Instruction);
    input wire [63:0] Address;
    output wire [31:0] Instruction;

    reg IsWrite;
    reg [31:0] WriteInstruction;
    reg [15:0] Addr;
    wire clock;
    ClockGenerator#(20) cg(.Clock(clock));

    Memory#(.WordSize(32), .WordsNumberLog2(16)) memory(.Status(IsWrite), .Address(Addr), .I(WriteInstruction), .Clock(clock), .Q(Instruction));

    initial begin
        #10 IsWrite = 1;

        #25 Addr = 1; WriteInstruction = 'h015A04B3; // R-type: add x9, x20, x21
        #25 Addr = 2; WriteInstruction = 'h40538333; // R-type: sub x6, x7, x5
        #25 Addr = 3; WriteInstruction = 'h00F6F1B3; // R-type: and x3, x13, x15
        #25 Addr = 4; WriteInstruction = 'h00A5E733; // R-type: or x14, x11, x10
        #25 Addr = 5; WriteInstruction = 'h0F053483; // I-type: ld x9, #240(x10)
        #25 Addr = 6; WriteInstruction = 'h025F3023; // S-type: sd x5, #32(x30)
        #25 Addr = 7; WriteInstruction = 'h119C0267; // SB-type: beq x24, x25, #130

        #25 IsWrite = 0;
	assign Addr = Address;
    end
endmodule