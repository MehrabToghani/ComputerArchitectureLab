
// Status = 0 => read
// Status = 1 => write
module Memory ( Status, Address, I, Q);
	parameter WordSize = 32;
	parameter WordsNumber = 8;
	input wire Status;
	input wire [WordsNumber-1:0] Address;
	input wire [WordSize-1:0] I;
	output reg [WordSize-1:0] Q;
	reg [WordsNumber-1 : 0] Data [WordSize-1 : 0];

	always @(Status or Address or I) begin
		if (Status == 0)
			assign Q = Data[Address];
	   	else
			Data[Address]  = I;
	end
endmodule