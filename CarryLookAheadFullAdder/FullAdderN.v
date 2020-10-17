`include "FullAdder.v"

module FullAdderN ( X, Y, CarryIn, Sum, CarryOut );
	parameter n = 1;
	input wire [n-1:0] X , Y;
	input wire CarryIn;
	output wire [n-1:0] Sum;
	output wire CarryOut;
	wire [n:0] InternalCarry;
	genvar i;

	assign InternalCarry [0] = CarryIn;
	assign CarryOut = InternalCarry [n];

	generate for (i = 0; i<n ; i = i+1) begin
			// G[i] = A[i] + B[i]
			// P[i] = A[i] * B[i]
			// C[i+1] = G[i] + ( P[i] * C[i] )
			assign InternalCarry[i+1] = (X[i] & Y[i]) | ((X[i] | Y[i]) & InternalCarry[i]);
			FullAdder fullAdder(X[i], Y[i], InternalCarry[i], Sum[i], );
		end
	endgenerate
endmodule
