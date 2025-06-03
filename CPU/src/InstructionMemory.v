module InstructionMemory(
    input [7:0] address,
    output reg [31:0] instruction
);

always @(*) begin
    case (address)
        // Format: {opcode[3:0], dest[4:0], src1[4:0], src2[4:0], imm[13:0]}

        8'd0:  instruction = {4'b1100, 5'd10, 5'd0, 18'd10};        // ADDI R10, R0, 10
        8'd1:  instruction = {4'b1100, 5'd15, 5'd0, 18'd15};        // ADDI R15, R0, 15
        8'd2:  instruction = {4'b0010, 5'd25, 5'd10, 5'd15, 13'd0}; // ADD R25, R10, R15
        8'd3:  instruction = {4'b1111, 5'd20, 5'd25, 18'd5};        // SUBI R20, R25, 5
        8'd4:  instruction = {4'b1100, 5'd21, 5'd0, 18'd2};         // ADDI R21, R0, 2

        8'd5:  instruction = {4'b1000, 28'd12};                     // JUMP to addr 12

        // BEQ R4, R5, 7
        // if R4 == R5 then PC = 7
        8'd12: instruction = {4'b1100, 5'd4, 5'd0, 18'd4};          // ADDI R4, R0, 4
        8'd13: instruction = {4'b0010, 5'd5, 5'd0, 5'd0, 13'd0};    // ADD R5, R0, R0
        8'd14: instruction = {4'b1001, 5'd4, 5'd5, 18'd7};          // BEQ R4, R5, to addr 7

        default: instruction = 32'd0;
    endcase
end

endmodule
