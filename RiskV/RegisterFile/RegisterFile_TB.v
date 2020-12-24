`include "RegisterFile.v"
`include "../ClockGenerator/ClockGenerator.v"

module RegisterFile_TB();
    reg [63:0] writeData;
    reg [5:0] readRegister1, readRegister2, writeRegister;
    reg regWrite;
    wire [63:0] readData1, readData2;
    wire clock;

    ClockGenerator#(20) cg(.Clock(clock));
    RegisterFile rf(.ReadRegister1(readRegister1), .ReadRegister2(readRegister2), .WriteRegister(writeRegister), .WriteData(writeData), .RegWrite(regWrite), .Clock(clock), .ReadData1(readData1), .ReadData2(readData2));

    initial begin
        #10 $display("Write Registers: ");
        regWrite = 1;

        writeRegister = 1; writeData = 1;
        #25 $display("  Register: X%d    |   WriteData: %d" , writeRegister, writeData);

        #10 writeRegister = 13; writeData = 12345;
        #25 $display("  Register: X%d    |   WriteData: %d" , writeRegister, writeData);

        #10 writeRegister = 30; writeData = 1 << 63;
        #25 $display("  Register: X%d    |   WriteData: %d" , writeRegister, writeData);

        #10 $display("\nRead Registers: ");
        regWrite = 0;

        #10 readRegister1 = 1;
        readRegister2 = 13;
        #5 $display("  Register: X%d    |   ReadData:  %d" , readRegister1, readData1);
        $display("  Register: X%d    |   ReadData:  %d" , readRegister2, readData2);

        #10 readRegister1 = 30;
        readRegister2 = 9;
        #5 $display("  Register: X%d    |   ReadData:  %d" , readRegister1, readData1);
        $display("  Register: X%d    |   ReadData:  %d" , readRegister2, readData2);

        #10 $display("\n\nWrite in X0 Register.");
        #10 writeRegister = 0; writeData = 14;
        #25 $display("  Register: X%d    |   WriteData: %d" , writeRegister, writeData);

        #10 $display("\nRead from X0 Register.");
        #10 readRegister1 = 0;
        #5 $display("  Register: X%d    |   ReadData:  %d" , readRegister1, readData1);
    end

endmodule