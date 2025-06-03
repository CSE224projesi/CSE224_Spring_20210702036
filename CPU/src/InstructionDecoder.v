module InstructionDecoder(
    input wire [31:0] instruction,
    output reg [2:0] alu_op,
    output reg [4:0] reg_dst,     
    output reg [4:0] reg_src1,   
    output reg [4:0] reg_src2,    
    output reg [31:0] imm,        // sign-extended immediate
    output reg use_imm,           
    output reg is_beq,            // 1 if BEQ instruction
    output reg is_jump            // 1 if JUMP instruction
);

always @(*) begin
    // Default values
    reg_dst  = instruction[27:23];
    reg_src1 = instruction[22:18];
    reg_src2 = instruction[17:13];
    imm      = {{14{instruction[17]}}, instruction[17:0]};
    alu_op   = 3'b000;
    use_imm  = 1'b0;
    is_beq   = 1'b0;
    is_jump  = 1'b0;

    case (instruction[31:28])
        4'b0000, 4'b0001: alu_op = 3'b000;             // NOOP
        4'b0010:          alu_op = 3'b010;             // ADD
        4'b0011:          alu_op = 3'b011;             // SUB
        4'b0100:          alu_op = 3'b100;             // SHIFTL
        4'b0101:          alu_op = 3'b101;             // SHIFTR
        4'b1100: begin alu_op = 3'b110; use_imm = 1; end // ADDI
        4'b1111: begin alu_op = 3'b111; use_imm = 1; end // SUBI
        4'b1000:          is_jump = 1'b1;              // JUMP
        4'b1001:          is_beq  = 1'b1;              // BEQ
        default:          alu_op = 3'b000;             // Default: NOOP
    endcase
end

endmodule
