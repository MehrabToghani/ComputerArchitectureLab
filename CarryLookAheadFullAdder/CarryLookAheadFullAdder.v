module FullAdder ( X, Y, CarryIn, Sum, CarryOut );
	input wire X , Y;
	input wire CarryIn;
	output reg Sum;
	output reg CarryOut;
	always @(*)
		begin
		assign Sum = X ^ Y ^ CarryIn;
		assign CarryOut = (X & Y) | ((X ^ Y) & CarryIn);
		end
endmodule

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
		FullAdder fullAdder(X[i], Y[i], InternalCarry[i], Sum[i], InternalCarry[i+1]);
		end
	endgenerate
endmodule

module main;
	reg [63:0] x ,y;
	reg carryIn;
	wire [63:0] sum;
	wire carryOut;
	FullAdderN #(64) fullAdderN(.X(x), .Y(y), .CarryIn(carryIn), .Sum(sum), .CarryOut(carryOut));
  	initial
    		begin
		#10 
      		assign x = 1 << 63;
		assign y = 1 << 63;
		assign carryIn = 1;
		#20 
		$display("%0d + %0d + %0d = %0d;  Carry out = %0d", x, y, carryIn, sum, carryOut);

		#10 
      		assign x = 231;
		assign y = 698;
		assign carryIn = 0;
		#20 
		$display("%0d + %0d + %0d = %0d;  Carry out = %0d", x, y, carryIn, sum, carryOut);

		#10 
      		assign x = 1;
		assign y = 1;
		assign carryIn = 0;
		#20 
		$display("%0d + %0d + %0d = %0d;  Carry out = %0d", x, y, carryIn, sum, carryOut);

		#10 
      		assign x = 999999999;
		assign y = 1;
		assign carryIn = 0;
		#20 
		$display("%0d + %0d + %0d = %0d;  Carry out = %0d", x, y, carryIn, sum, carryOut);
    		end
endmodule
