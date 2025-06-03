module TopModule(
    input wire clk,
    input wire reset_btn,
    input wire next_instr_btn,
    output wire [31:0] alu_result
);

wire [4:0] pc;
wire [31:0] instruction;
wire [2:0] alu_op;
wire [4:0] reg_dst, reg_src1, reg_src2;
wire [31:0] imm;
wire use_imm;
wire [31:0] rd1, rd2, alu_in2;

wire we = (alu_op != 3'b000); // NOOP değilse yaz

ProgramCounter pc_unit(
    .clk(clk),
    .reset(reset_btn),
    .control(next_instr_btn),
    .pc(pc)
);

InstructionMemory imem(
    .addr(pc),
    .instruction(instruction)
);

InstructionDecoder decoder(
    .instruction(instruction),
    .alu_op(alu_op),
    .reg_dst(reg_dst),
    .reg_src1(reg_src1),
    .reg_src2(reg_src2),
    .imm(imm),
    .use_imm(use_imm)
);

RegisterFile rf(
    .CLK(clk),
    .WE3(we),
    .A1(reg_src1),
    .A2(use_imm ? 5'd0 : reg_src2),
    .A3(reg_dst),
    .WD3(alu_result),
    .RD1(rd1),
    .RD2(rd2)
);

assign alu_in2 = use_imm ? imm : rd2;

ALU alu(
    .A(rd1),
    .B(alu_in2),
    .Opcode(alu_op),
    .Result(alu_result)
);

endmodule
