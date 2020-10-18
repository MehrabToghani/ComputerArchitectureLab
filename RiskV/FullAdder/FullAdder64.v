`include "FullAdder4.v"

module FullAdder64(X, Y, CarryIn, Sum, CarryOut);
    input wire [63:0] X, Y;
    input wire CarryIn;
    output [63:0] Sum;
    output CarryOut;

    wire [16:0] Carry;
    assign Carry[0] = CarryIn;
    assign CarryOut = Carry[16];

    genvar i;
    generate for (i = 0; i < 64; i = i+4)
        begin
            FullAdder4 fa(X[i+3:i], Y[i+3:i], Carry[i/4], Sum[i+3:i], Carry[i/4+1]);
        end
    endgenerate

endmodule