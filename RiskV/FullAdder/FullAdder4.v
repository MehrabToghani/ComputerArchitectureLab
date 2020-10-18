`include "FullAdder.v"

module FullAdder4(X, Y, CarryIn, Sum, CarryOut);
    input wire [3:0] X, Y;
    input wire CarryIn;
    output [3:0] Sum;
    output CarryOut;

    wire [3:0] G, P;
    wire [2:0] Carry;

    FullAdder fa1(X[0], Y[0], CarryIn, Sum[0],);
    FullAdder fa2(X[1], Y[1], Carry[0], Sum[1],);
    FullAdder fa3(X[2], Y[2], Carry[1], Sum[2],);
    FullAdder fa4(X[3], Y[3], Carry[2], Sum[3],);

    // G[i] = X[i] * Y[i]
    // P[i] = X[i] + Y[i]
    assign P[0] = X[0] | Y[0];
    assign G[0] = X[0] & Y[0];
    assign P[1] = X[1] | Y[1];
    assign G[1] = X[1] & Y[1];
    assign P[2] = X[2] | Y[2];
    assign G[2] = X[2] & Y[2];
    assign P[3] = X[3] | Y[3];
    assign G[3] = X[3] & Y[3];

    // Carry
    assign Carry[0] = G[0] | (P[0] & CarryIn);
    assign Carry[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & CarryIn);
    assign Carry[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & CarryIn);
    assign CarryOut = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & CarryIn);

endmodule