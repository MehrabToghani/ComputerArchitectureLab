`include "DataMemory.v"
`include "../ClockGenerator/ClockGenerator.v"

module DataMemory_TB();
    reg [63:0] address, writeData;
    wire [63:0] readData;
    reg memWrite, memRead;
    wire clock;
    ClockGenerator#(20) cg(.Clock(clock));
    DataMemory dm(.Address(address), .MemWrite(memWrite), .MemRead(memRead), .WriteData(writeData), .Clock(clock), .ReadData(readData));

    initial begin
        #10 $display("Write Data:");
        memWrite = 1;
        memRead = 0;

        address = 1; writeData = 1;
        #25 $display("  Address: %d    |   WriteData: %d" , address, writeData);

        #10 address = 13; writeData = 12345;
        #25 $display("  Address: %d    |   WriteData: %d" , address, writeData);

        #10 address = 1 << 14; writeData = 1 << 63;
        #25 $display("  Address: %d    |   WriteData: %d" , address, writeData);

        #10 $display("\nRead Data");
        memWrite = 0;
        memRead = 1;

        #10 address = 1;
        #5 $display("  Address: %d    |   ReadData:  %d" , address, readData);

        #10 address = 13;
        #5 $display("  Address: %d    |   ReadData:  %d" , address, readData);

        #10 address = 1 << 14;
        #5 $display("  Address: %d    |   ReadData:  %d" , address, readData);

        #10 address = 9;
        #5 $display("  Address: %d    |   ReadData: %d" , address, readData);
    end

endmodule