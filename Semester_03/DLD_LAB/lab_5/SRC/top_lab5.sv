module top_lab5 (
    input  logic [3:0] sw,    // X Input
    output logic [6:0] seg,   // 7-segment display
    output logic [7:0] an     // Anodes
);
    logic [3:0] product;

    // 1. The Multiplier Math
    multiplier_c3 MULT (
        .X(sw),
        .P(product)
    );

    // 2. Your Custom Lab 3 Decoder
    decoder DEC (
        .sum(product[2:0]), // Wire lower 3 bits to your 'sum' input
        .cout(product[3]),  // Wire the 4th bit to your 'cout' input
        .sel(3'b000),       // Feed '000' to decoder_2 to turn on an[0]
        .seg(seg),
        .an(an)
    );
endmodule