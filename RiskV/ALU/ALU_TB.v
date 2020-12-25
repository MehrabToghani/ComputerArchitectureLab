`include "ALU.v"

module ALU_TB();
    reg [63:0] x, y;
    reg [3:0] aluCtrl;
    wire signed [63:0] aluResult;
    wire zero;

    ALU alu(.X(x), .Y(y), .ALUControl(aluCtrl), .ALUResult(aluResult), .Zero(zero));

    initial begin
        #10 x = 7; y = 4; aluCtrl = 4'b0000;
        #10 $display("%2d & %2d = %2d;  zero = %b" , x, y, aluResult , zero);

        #10 x = 7; y = 8; aluCtrl = 4'b0001;
        #10 $display("%2d | %2d = %2d;  zero = %b" , x, y, aluResult , zero);

        #10 x = 10; y = 23; aluCtrl = 4'b0010;
        #10 $display("%2d + %2d = %2d;  zero = %b" , x, y, aluResult , zero);

        #10 x = 15; y = 18; aluCtrl = 4'b0110;
        #10 $display("%2d - %2d = %2d;  zero = %b" , x, y, aluResult , zero);

        #10 x = 5; y = 5; aluCtrl = 4'b0110;
        #10 $display("%2d - %2d = %2d;  zero = %b" , x, y, aluResult , zero);
    end

endmodule