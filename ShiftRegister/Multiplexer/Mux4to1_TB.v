`include "Mux4to1.v"

module Mux4to1_TB;
	reg [3:0] w;
	reg [1:0] s;
	wire f;
	integer i;
	Mux4to1 M ( .W(w), .S(s), .F(f));
	initial begin
		$display ("_________________________");
		$display ("|   W   |   S   |   F   |");
		$display ("~~~~~~~~~~~~~~~~~~~~~~~~~");
		for ( i = 0; i<8; i = i+1 ) begin
				#10
				s = i[1:0];
				w = i;
				#10
				$display ("| %4b  |   %1d   |   %1d   |" , w , s , f);
				$display ("|~~~~~~~|~~~~~~~|~~~~~~~|");
		end
	end
endmodule