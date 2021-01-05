`include "DFlipFlop.v"
`include "../../ClockGenerator/ClockGenerator.v"

module DFlipFlop_TB;
    reg data;
    wire clock, q, qnot;
    integer i;
    ClockGenerator#(16) CG(.Clock(clock));
    DFlipFlop DFF(.Data(data), .Clock(clock), .Reset(1'b0), .Q(q), .QNot(qnot));
    initial begin
        $display("_________________________________");
        $display("| Clock | Data  |   Q   |  ~Q   |");
        $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        for (i = 0; i < 16; i = i+1) begin
            #10
                data = i[1];
            $display("|   ", clock, "   |   ", data, "   |   ", q, "   |   ", qnot, "   |");
            $display("|~~~~~~~|~~~~~~~|~~~~~~~|~~~~~~~|");
        end
    end
endmodule