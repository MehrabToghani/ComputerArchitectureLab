module Mux2to1 (W, S, F);
	input wire [1:0] W;
	input wire S;
	output F;

	assign F = S ? W[1] : W[0];
endmodule