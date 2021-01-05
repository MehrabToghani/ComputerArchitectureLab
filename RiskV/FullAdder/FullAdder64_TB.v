`include "FullAdder64.v"

module FullAdder64_TB;
    reg [63:0] x, y;
    reg carryIn;
    wire [63:0] sum;
    wire carryOut;

    FullAdder64 fa(.X(x), .Y(y), .CarryIn(carryIn), .Sum(sum), .CarryOut(carryOut));

    initial
        begin

            #10 assign x = 1;
            assign y = 1;
            assign carryIn = 0;
            #20 $display("%0d + %0d + %0d = %0d;  Carry out = %0d", x, y, carryIn, sum, carryOut);

            #10 assign x = 231;
            assign y = 698;
            assign carryIn = 0;
            #20 $display("%0d + %0d + %0d = %0d;  Carry out = %0d", x, y, carryIn, sum, carryOut);

            #10 assign x = 999999999;
            assign y = 1;
            assign carryIn = 1;
            #20 $display("%0d + %0d + %0d = %0d;  Carry out = %0d", x, y, carryIn, sum, carryOut);

            #10 assign x = 1 << 63;
            assign y = 1 << 63;
            assign carryIn = 1;
            #20 $display("%0d + %0d + %0d = %0d;  Carry out = %0d", x, y, carryIn, sum, carryOut);

        end
endmodule