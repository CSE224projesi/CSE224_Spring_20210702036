
module ProgramCounter(
    input wire clk,
    input wire reset,
    input wire control,  // button input
    output reg [4:0] pc  
);

always @(posedge clk or posedge reset) begin
    if (reset)
        pc <= 5'd0;
    else if (control)
        pc <= pc + 1;
end

endmodule
