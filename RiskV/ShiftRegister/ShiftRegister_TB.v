`include "ShiftRegister.v"
`include "../ClockGenerator/ClockGenerator.v"

module ShiftRegister_TB;
    reg [3:0] I;
    wire [3:0] q;
    reg [1:0] s;
    reg w, r;
    wire clock;
    ClockGenerator#(32) CG(.Clock(clock));
    ShiftRegister#(4) SHR(.I(I), .Status(s), .W(w), .Reset(r), .Clock(clock), .Q(q));

    integer i = 0;
    always @(negedge clock) begin
        i = i+1;
        if (i == 1) begin
            $display("%4b" , q);
            $display("-----     Load 1101");
            r = 0;
            s = 3;
            I = 4'b1101;
        end
        if (i == 2) begin
            $display("%4b" , q);
            $display("-----     Reset");
            r = 1;
        end
        if (i == 3) begin
            $display("%4b" , q);
            $display("-----     Left Shift 1");
            r = 0;
            s = 1;
            w = 1;
        end
        if (i == 4 || i == 5 || i == 6) begin
            $display("%4b" , q);
        end
        if (i == 7) begin
            $display("%4b" , q);
            $display("-----     Reset");
            r = 1;
        end
        if (i == 8) begin
            $display("%4b" , q);
            $display("-----     Right Shift 1");
            r = 0;
            s = 2;
            w = 1;
        end
        if (i == 9 || i == 10 || i == 11) begin
            $display("%4b" , q);
        end
        if (i == 12) begin
            $display("%4b" , q);
            $display("-----     Load 1001");
            s = 3;
            I = 4'b1001;
        end
        if (i == 13) begin
            $display("%4b" , q);
            $display("-----     No Change");
            s = 0;
        end
        if (i == 14 || i == 15 || i == 16) begin
            $display("%4b" , q);
        end
    end
endmodule