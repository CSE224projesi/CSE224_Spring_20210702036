module TopModule(
    input wire CLK,
    input wire RESET,
    input wire STEP,
    output wire [31:0] ALUResult
);

    reg [7:0] PC;
    wire [31:0] instruction;
    wire [2:0] alu_op;
    wire [4:0] reg_dst, reg_src1, reg_src2;
    wire [31:0] imm, RD1, RD2;
    wire use_imm, is_beq, is_jump;

    // Instruction memory
    InstructionMemory imem(
        .address(PC),
        .instruction(instruction)
    );

    // Decoder
    InstructionDecoder decoder(
        .instruction(instruction),
        .alu_op(alu_op),
        .reg_dst(reg_dst),
        .reg_src1(reg_src1),
        .reg_src2(reg_src2),
        .imm(imm),
        .use_imm(use_imm),
        .is_beq(is_beq),
        .is_jump(is_jump)
    );

    // Register File
    wire write_enable = ~(is_jump | is_beq); // BEQ and JUMP do not write
    RegisterFile regfile(
        .clk(CLK),
        .regWrite(write_enable),
        .rs(reg_src1),
        .rt(reg_src2),
        .rd(reg_dst),
        .writeData(ALUResult),
        .readData1(RD1),
        .readData2(RD2)
    );

    // ALU
    wire [31:0] alu_input_B = (use_imm) ? imm : RD2;
    ALU alu(
        .A(RD1),
        .B(alu_input_B),
        .ALUop(alu_op),
        .Result(ALUResult)
    );

    // Program Counter
    always @(posedge CLK or posedge RESET) begin
        if (RESET)
            PC <= 8'd0;
        else if (STEP) begin
            if (is_jump)
                PC <= imm[7:0];
            else if (is_beq && RD1 == RD2)
                PC <= imm[7:0];
            else
                PC <= PC + 1;
        end
    end

endmodule
