`include "../Memory/Memory.v"

module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clock, ReadData1, ReadData2);
    input wire [63:0] WriteData;
    input wire [5:0] ReadRegister1, ReadRegister2, WriteRegister;
    input wire RegWrite, Clock;
    output wire [63:0] ReadData1, ReadData2;

    reg [63:0] Data [0:31];

    initial begin
        Data[0] = 63'o0;  // x0 must always be zero
    end

    assign ReadData1 = Data[ReadRegister1];
    assign ReadData2 = Data[ReadRegister2];

    always @(posedge Clock) begin
        if (RegWrite)
            if (WriteRegister != 5'b00000)
                Data[WriteRegister] = WriteData;
    end

endmodule : RegisterFile