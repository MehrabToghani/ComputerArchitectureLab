module ALU(X, Y, ALUControl, ALUResult, Zero);
    input [63:0] X, Y;
    input [3:0] ALUControl;
    output reg [63:0] ALUResult;
    output reg Zero;

    always @(*)
        begin
            case (ALUControl)
                4'b0000: ALUResult = (X & Y);
                4'b0001: ALUResult = (X | Y);
                4'b0010: ALUResult = (X+Y);
                4'b0110: ALUResult = (X-Y);
                default: ALUResult = {64{1'bx}};
            endcase
            assign Zero = ALUResult == 0;
        end
endmodule
