module twos_complement(
    input [7:0] sw,  
    output [7:0] led  
);
    assign led = ~sw + 1;  
endmodule
