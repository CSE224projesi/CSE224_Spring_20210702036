module ALU(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [2:0] Opcode,
    output reg [31:0] Result
);
always @(*) begin
    case (Opcode)
        3'b000: Result = 32'd0;             // NOOP
        3'b001: Result = 32'd0;             // NOOP
        3'b010: Result = A + B;             // ADD
        3'b011: Result = A - B;             // SUB
        3'b100: Result = A << B;            // SHIFTL
        3'b101: Result = A >> B;            // SHIFTR
        3'b110: Result = A + B;             // ADDI 
        3'b111: Result = A - B;             // SUBI 
        default: Result = 32'd0;
    endcase
end
endmodule
