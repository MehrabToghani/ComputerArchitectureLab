`include "../Multiplexer/Mux4to1.v"
`include "DFlipFlop/DFlipFlop.v"

// Status = 0 No Change
// Status = 1 Left Shift
// Status = 2 Right Shift
// Status = 3 Load
module ShiftRegister(I, Status, W, Clock, Reset, Q);
    parameter n=1;
    input wire [n-1:0] I;
    input wire [1:0] Status;
    input wire W, Clock, Reset;
    output wire [n-1:0] Q;
    wire [n-1:0] D;

    genvar i;
    generate for (i = 0; i < n; i = i+1) begin
        wire [3:0] MW;
        assign MW[0] = Q[i];
        assign MW[1] = i == 0 ? W:Q[i-1];
        assign MW[2] = i == n-1 ? W:Q[i+1];
        assign MW[3] = I[i];
        Mux4to1 M(.W(MW), .S(Status), .F(D[i]));
        DFlipFlop DFF(.Data(D[i]), .Clock(Clock), .Reset(Reset), .Q(Q[i]), .QNot());
    end
    endgenerate
endmodule