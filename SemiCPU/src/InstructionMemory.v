module InstructionMemory(
    input wire [4:0] addr,
    output reg [31:0] instruction
);

// Örnek komutlar:
// Format: [31:28] opcode | [27:23] dest | [22:18] src1 | [17:0] immediate/src2

always @(*) begin
    case (addr)
        5'd0: instruction = {4'b1100, 5'd10, 5'd0, 18'd10};  // ADDI r10, r0, 10
        5'd1: instruction = {4'b1100, 5'd15, 5'd0, 18'd15};  // ADDI r15, r0, 15
        5'd2: instruction = {4'b0010, 5'd25, 5'd10, 5'd15, 13'd0}; // ADD r25, r10, r15
        5'd3: instruction = {4'b1111, 5'd20, 5'd25, 18'd5};   // SUBI r20, r25, 5
        5'd4: instruction = {4'b1100, 5'd5, 5'd0, 18'd2};     // ADDI r5, r0, 2
        5'd5: instruction = {4'b0100, 5'd30, 5'd25, 5'd5, 13'd0}; // SHIFTL r30, r25, r5
        default: instruction = 32'd0;
    endcase
end

endmodule
