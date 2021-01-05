module Mux4to1 (W, S, F);
	input wire [3:0] W;
	input wire [1:0] S;
	output F;
	
	assign F = S[1] ? ( S[0] ? W[3] : W[2] ) : ( S[0] ? W[1] : W[0] );
endmodule