module RegisterFile(
    input wire clk,
    input wire regWrite,
    input wire [4:0] rs,      // Read address 1
    input wire [4:0] rt,      // Read address 2
    input wire [4:0] rd,      // Write address
    input wire [31:0] writeData,
    output wire [31:0] readData1,
    output wire [31:0] readData2
);

    reg [31:0] registers[0:31];

    // Asynchronous read
    assign readData1 = registers[rs];
    assign readData2 = registers[rt];

    // Synchronous write
    always @(posedge clk) begin
        if (regWrite)
            registers[rd] <= writeData;
    end

endmodule
