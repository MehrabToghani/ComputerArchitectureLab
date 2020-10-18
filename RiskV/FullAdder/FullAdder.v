module FullAdder(X, Y, CarryIn, Sum, CarryOut);
    input wire X, Y;
    input wire CarryIn;
    output Sum;
    output CarryOut;

    assign Sum = X ^ Y ^ CarryIn;
    assign CarryOut = (X & Y) | ((X ^ Y) & CarryIn);
endmodule