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
endmodule;

module main;
	reg x ,y;
	reg carryIn;
	wire sum;
	wire carryOut;
	FullAdder fullAdder(.X(x), .Y(y), .CarryIn(carryIn), .Sum(sum), .CarryOut(carryOut));
  	initial
    		begin
		#10 
      		assign x = 1;
		assign y = 1;
		assign carryIn = 1;
		#20 
		$display("%0d + %0d + %0d = %0d;  Carry out = %0d", x, y, carryIn, sum, carryOut);
    		end
endmodule;
