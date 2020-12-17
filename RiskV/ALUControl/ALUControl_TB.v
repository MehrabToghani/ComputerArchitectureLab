`include "ALUControl.v"

module ALUControl_TB();
    reg [1:0] aluOp;
    reg [6:0] funct7;
    reg [2:0] funct3;
    wire [3:0] outputs;

    ALUControl ac(.ALUOp(aluOp), .Funct7(funct7), .Funct3(funct3), .Outputs(outputs));

    initial begin
        // ld (desired: add)
        aluOp = 2'b00;
        funct7 = 7'b0011111;
        funct3 = 3'b011;
        #10 $display("ld (desired: add): ");
        $display("   ALU control input: %b" , outputs);

        // sd (desired: add)
        #10 aluOp = 2'b00;
        funct7 = 7'b0011111;
        funct3 = 3'b011;
        #10 $display("sd (desired: add): ");
        $display("   ALU control input: %b" , outputs);

        // beq (desired: subtract)
        #10 aluOp = 2'b01;
        funct7 = 7'b1100111;
        funct3 = 3'b000;
        #10 $display("beq (desired: subtract): ");
        $display("   ALU control input: %b" , outputs);

        // add
        #10 aluOp = 2'b10;
        funct7 = 7'b0000000;
        funct3 = 3'b000;
        #10 $display("add: ");
        $display("   ALU control input: %b" , outputs);

        // sub
        #10 aluOp = 2'b10;
        funct7 = 7'b0100000;
        funct3 = 3'b000;
        #10 $display("sub: ");
        $display("   ALU control input: %b" , outputs);

        // and
        #10 aluOp = 2'b10;
        funct7 = 7'b0000000;
        funct3 = 3'b111;
        #10 $display("and: ");
        $display("   ALU control input: %b" , outputs);

        // or
        #10 aluOp = 2'b10;
        funct7 = 7'b0000000;
        funct3 = 3'b110;
        #10 $display("or: ");
        $display("   ALU control input: %b" , outputs);
    end
endmodule