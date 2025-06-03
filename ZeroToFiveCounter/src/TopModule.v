module TopModule (
    input wire clk,
    input wire rst,
    output wire [3:0] count
);

ZeroToFiveCounter counter (
    .clk(clk),
    .rst(rst),
    .count(count)
);

endmodule
