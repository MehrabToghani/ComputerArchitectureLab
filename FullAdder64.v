module FullAdder ( X, Y, CarryIn, Sum, CarryOut );
	input X , Y;
	input CarryIn;
	output Sum;
	output CarryOut;
	assign Sum = X ^ Y ^ CarryIn;
	assign CarryOut = (X & Y) | ((X ^ Y) & CarryIn);
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
