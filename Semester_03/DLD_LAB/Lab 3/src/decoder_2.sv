module decoder_2 (
    input  logic [2:0] sel,
    output logic [7:0] an
);
// for product of sum in decoder 2 to select the display bcz ones are abundant
    assign an[0] = sel[2] | sel[1] | sel[0];           // 000 -> 11111110
    assign an[1] = sel[2] | sel[1] | ~sel[0];          // 001 -> 11111101
    assign an[2] = sel[2] | ~sel[1] | sel[0];          // 010 -> 11111011
    assign an[3] = sel[2] | ~sel[1] | ~sel[0];         // 011 -> 11110111
    assign an[4] = ~sel[2] | sel[1] | sel[0];          // 100 -> 11101111
    assign an[5] = ~sel[2] | sel[1] | ~sel[0];         // 101 -> 11011111
    assign an[6] = ~sel[2] | ~sel[1] | sel[0];         // 110 -> 10111111
    assign an[7] = ~sel[2] | ~sel[1] | ~sel[0];        // 111 -> 01111111
endmodule