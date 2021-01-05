`include "Memory.v"
`include "../ClockGenerator/ClockGenerator.v"
`include "../FullAdder/FullAdder64.v"
`include "../ShiftRegister/ShiftRegister.v"

module Memory_TB;
	reg status;
	reg [7:0] addr;
	reg [31:0] memoryI;
	wire [31:0] Q;

	reg [63:0] shiftRegisterI;
	wire [63:0] FS;
	wire [7:0] SHRQ;
	wire clock;

	ClockGenerator #(50) CG ( .Clock (clock) );
	Memory #(.WordSize(32), .WordsNumber(8)) memory ( .Status(status), .Address(addr), .I(memoryI), .Q(Q));
	FullAdder64 FA (.X(Q), .Y(1), .CarryIn(1'b0), .Sum(FS), .CarryOut() );
	ShiftRegister #(64) SHR (.I(shiftRegisterI), .Status(2'o3), .W(1'b0), .Clock(clock), .Q(SHRQ));

	initial begin
		// initial memory data
		#10 status = 1; addr = 0; memoryI = 4;
		#10 addr = 1; memoryI = 1;
		#10 addr = 2; memoryI = 3;
		#10 addr = 3; memoryI = 4;
		#10 addr = 4; memoryI = 2;
		#10 addr = 5; memoryI = 5;
		#10 addr = 6; memoryI = 6;
		#10 addr = 7; memoryI = 0;
		#10 status = 0;

		#10 shiftRegisterI = 0;
		#10 assign shiftRegisterI = FS; 
		#10 assign addr = SHRQ;
	end

	always @(negedge clock) begin
		if (status == 0)
			$display ( "address: %d  |  data: %d", addr, Q);
	end
endmodule 