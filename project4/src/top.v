module top (
    input wire CLK,
    input wire WE3,
    input wire [4:0] A1, A2, A3,
    input wire [31:0] WD3,
    input wire [1:0] Opcode,
    output wire [31:0] Result
);

    wire [31:0] RD1;
    wire [31:0] RD2;

    // Register File modülü örneği
    RegisterFile rf (
        .CLK(CLK),
        .WE3(WE3),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .WD3(WD3),
        .RD1(RD1),
        .RD2(RD2)
    );

    // ALU modülü örneği
    ALU alu (
        .A(RD1),
        .B(RD2),
        .Opcode(Opcode),
        .Result(Result)
    );

endmodule
