module ZeroToFiveCounter (
    input wire clk,
    input wire rst,
    output reg [3:0] count
);

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 4'd0;
    else if (count == 4)
        count <= 4'd0;
    else
        count <= count + 1;
end

endmodule
