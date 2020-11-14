`include "Memory.v"
`include "../ClockGenerator/ClockGenerator.v"
`include "../FullAdder/FullAdder64.v"
`include "../ShiftRegister/ShiftRegister.v"

module Memory_TB;
    reg status, resetR;
    reg [3:0] addr;
    reg [31:0] memoryI;
    wire [31:0] Q;

    wire [63:0] FS;
    wire [7:0] SHRQ;
    wire clock;

    ClockGenerator#(50) CG(.Clock(clock));
    Memory#(.WordSize(32), .WordsNumberLog2(4)) memory(.Status(status), .Address(addr), .I(memoryI), .Clock(clock), .Q(Q));
    FullAdder64 FA(.X(Q), .Y(1), .CarryIn(1'b0), .Sum(FS), .CarryOut());
    ShiftRegister#(64) SHR(.I(FS), .Status(2'o3), .W(1'b0), .Clock(clock), .Reset(resetR), .Q(SHRQ));

    initial begin
        // initial memory data
        #25 status = 1; addr = 0; memoryI = 4;
        #25 addr = 1; memoryI = 1;
        #25 addr = 2; memoryI = 3;
        #25 addr = 3; memoryI = 4;
        #25 addr = 4; memoryI = 2;
        #25 addr = 5; memoryI = 5;
        #25 addr = 6; memoryI = 6;
        #25 addr = 7; memoryI = 0;
        #25 status = 0;

        #10 resetR = 1;
        #10 resetR = 0;
        #10 assign addr = SHRQ;
    end

    always @(negedge clock) begin
        if (status == 0)
            $display("address: %d  |  data: %d", addr, Q);
    end
endmodule 