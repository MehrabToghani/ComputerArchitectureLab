// Status = 0 => read
// Status = 1 => write
// Words Number = 2 ^ WordsNumberLog2
module Memory(Status, Address, I, Clock, Q);
    parameter WordSize=32;
    parameter WordsNumberLog2=8;
    input wire Status, Clock;
    input wire [WordsNumberLog2-1:0] Address;
    input wire [WordSize-1:0] I;
    output wire [WordSize-1:0] Q;
    reg [WordSize-1:0] Data [0:(1 << WordsNumberLog2)-1];

    assign Q = Data[Address];

    always @(posedge Clock) begin
        if (Status == 1)
            Data[Address] = I;
    end
endmodule : Memory