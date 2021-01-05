module DFlipFlop(Data, Clock, Reset, Q, QNot);
    input wire Data, Clock, Reset;
    output reg Q, QNot;
    always @(posedge Clock) begin
        if (Reset)
            begin
                Q = 0;
                QNot = 1;
            end
        else
            begin
                Q = Data;
                QNot = ~Data;
            end
    end
endmodule
