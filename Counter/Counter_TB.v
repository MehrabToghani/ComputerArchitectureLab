`include "../ShiftRegister/ShiftRegister/ShiftRegister.v"
`include "../CarryLookAheadFullAdder/FullAdderN.v"
`include "../ShiftRegister/ClockGenerator/ClockGenerator.v"

module Counter_TB;
	reg [63:0] I;
	wire [63:0] FS;
	wire [63:0] q;
	wire clock;
	ClockGenerator #(20) CG ( .Clock (clock) );
	FullAdderN #(64) FA (.X(q), .Y({0,4}), .CarryIn(0), .Sum(FS), .CarryOut() );
	ShiftRegister #(64) SHR (.I(I), .Status(3), .W(0), .Clock(clock), .Q(q));

	initial begin
		#10
		I = 0;
		#10
		assign I = FS;
	end

	always @(negedge clock) begin
		$display ( q );
	end
endmodule
