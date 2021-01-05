module ClockGenerator ( Clock );
	parameter n = 8;
	output reg Clock;

	integer i = 0;
	initial begin
		Clock = 0;
	end

	always @(i) begin 
		while (i < n) begin
			#10 Clock = ~Clock;
			i = i+1;
		end
	end
endmodule