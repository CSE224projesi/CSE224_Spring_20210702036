module ALU(
input wire [31:0] A,
input wire [31:0] B,
input wire [1:0] Opcode,
output reg [31:0] Result
);
always @(*) begin
case (Opcode)
2'b00: Result = A + B; // ADD
2'b01: Result = A - B; // SUB
2'b10: Result = A << B; // SHIFTL
2'b11: Result = A >> B; // SHIFTR
default: Result = 32'd0;
endcase
end
endmodule
