//for sum of product logic expression in decoder 1 to select the segment a bcz zeros are abundant
module decoder_1(
    input logic [2:0] sum,
    input logic cout,
    output logic [6:0]seg
);

// for logic on input = 0 and for logic off input is 1
assign seg[6] =  (~cout & ~sum[2] & ~sum[1] & sum[0]) |
            (~cout & sum[2] & ~sum[1] & ~sum[0]) |
            (cout & ~sum[2] & sum[1] & sum[0])|
            (cout & sum[2] & ~sum[1] & sum[0]);
assign seg[5] =  (~cout & sum[2] & ~sum[1] & sum[0]) |
            (~cout & sum[2] & sum[1] & ~sum[0]) |
            (cout & ~sum[2] & sum[1] & sum[0]) |
            (cout & sum[2] & ~sum[1] & ~sum[0]) |
            (cout & sum[2] & sum[1] & ~sum[0]);
assign seg[4] =  (~cout & ~sum[2] & ~sum[1] & sum[0]) |
            (~cout & ~sum[2] & sum[1] & ~sum[0]) |
            (cout & sum[2] & ~sum[1] & ~sum[0]) |
            (cout & sum[2] & sum[1] & ~sum[0]) |
            (cout & sum[2] & sum[1] & sum[0]); 
assign seg[3] =  (~cout & ~sum[2] & ~sum[1] & sum[0]) |
            (~cout & sum[2] & ~sum[1] & ~sum[0]) |
            (~cout & sum[2] & sum[1] & sum[0]) |
            (cout & ~sum[2] & ~sum[1] & sum[0]) |
            (cout & ~sum[2] & sum[1] & ~sum[0]) |
            (cout & sum[2] & sum[1] & sum[0]);
assign seg[2] =  (~cout & ~sum[2] & ~sum[1] & sum[0]) |
            (~cout & ~sum[2] & sum[1] & sum[0]) |
            (~cout & sum[2] & ~sum[1] & ~sum[0]) |
            (~cout & sum[2] & ~sum[1] & sum[0]) |
            (~cout & sum[2] & sum[1] & sum[0]) |
            (cout & ~sum[2] & ~sum[1] & sum[0]);
assign seg[1] =  (~cout & ~sum[2] & ~sum[1] & sum[0]) |
            (~cout & ~sum[2] & sum[1] & ~sum[0]) |
            (~cout & ~sum[2] & sum[1] & sum[0]) |
            (~cout & sum[2] & sum[1] & sum[0])|
            (cout & sum[2] & ~sum[1] & sum[0]);
assign seg[0] =  (~cout & ~sum[2] & ~sum[1] & ~sum[0]) |
            (~cout & ~sum[2] & ~sum[1] & sum[0]) |
            (~cout & sum[2] & sum[1] & sum[0]) |
            (cout & sum[2] & ~sum[1] & ~sum[0]);

endmodule            
