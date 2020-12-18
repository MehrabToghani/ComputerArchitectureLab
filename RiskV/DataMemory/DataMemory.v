`include "../Memory/Memory.v"

module DataMemory(Address, MemWrite, MemRead, WriteData, Clock, ReadData);
    input wire [63:0] Address, WriteData;
    input wire MemWrite, MemRead, Clock;
    output wire [63:0] ReadData;

    Memory#(.WordSize(64), .WordsNumberLog2(16)) memory(.Status(MemWrite), .Address(Address[15:0]), .I(WriteData), .Clock(Clock), .Q(ReadData));
endmodule