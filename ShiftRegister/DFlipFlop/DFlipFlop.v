module DFlipFlop (Data, Clock, Q, QNot);
	input wire Data, Clock;
	output reg Q, QNot;
	always @( posedge Clock) begin
		Q = Data;
		QNot = ~Data;
	end
endmodule
