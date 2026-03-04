module decoder (
    
    input logic [2:0] sum,
    input logic cout,
    input  logic [2:0] sel,    
    output logic [6:0] seg,    
    output logic [7:0] an      
);


    decoder_1 DEC_SEG (
        .sum(sum[2:0]),
        .cout(cout),
        .seg(seg)
    );

    decoder_2 DEC_AN (
    .sel(sel),
    .an(an)
);

endmodule