module decoder_1(
    input logic [2:0] sum,
    input logic cout,
    output logic [6:0] seg
);

// Active-Low logic: equation = 1 turns the segment OFF.
assign seg[6] = (~cout & ~sum[2] & ~sum[1] & sum[0]) |
                (~cout & sum[2] & ~sum[1] & ~sum[0]) |
                (cout & ~sum[2] & sum[1] & sum[0]) |
                (cout & sum[2] & ~sum[1] & sum[0]);

assign seg[5] = (~cout & sum[2] & ~sum[1] & sum[0]) |
                (~cout & sum[2] & sum[1] & ~sum[0]) |
                (cout & ~sum[2] & sum[1] & sum[0]) |
                (cout & sum[2] & ~sum[1] & ~sum[0]) |
                (cout & sum[2] & sum[1] & ~sum[0]) |
                (cout & sum[2] & sum[1] & sum[0]);     // FIXED: Added 15 so 'b' is OFF for 'F'

assign seg[4] = (~cout & ~sum[2] & sum[1] & ~sum[0]) |  // FIXED: Removed 1 so 'c' is ON for '1'
                (cout & sum[2] & ~sum[1] & ~sum[0]) |
                (cout & sum[2] & sum[1] & ~sum[0]) |
                (cout & sum[2] & sum[1] & sum[0]); 

assign seg[3] = (~cout & ~sum[2] & ~sum[1] & sum[0]) |
                (~cout & sum[2] & ~sum[1] & ~sum[0]) |
                (~cout & sum[2] & sum[1] & sum[0]) |
                (cout & ~sum[2] & sum[1] & ~sum[0]) |   // FIXED: Removed 9 so 'd' is ON for '9'
                (cout & sum[2] & sum[1] & sum[0]);

assign seg[2] = (~cout & ~sum[2] & ~sum[1] & sum[0]) |
                (~cout & ~sum[2] & sum[1] & sum[0]) |
                (~cout & sum[2] & ~sum[1] & ~sum[0]) |
                (~cout & sum[2] & ~sum[1] & sum[0]) |
                (~cout & sum[2] & sum[1] & sum[0]) |
                (cout & ~sum[2] & ~sum[1] & sum[0]);

assign seg[1] = (~cout & ~sum[2] & ~sum[1] & sum[0]) |
                (~cout & ~sum[2] & sum[1] & ~sum[0]) |
                (~cout & ~sum[2] & sum[1] & sum[0]) |
                (~cout & sum[2] & sum[1] & sum[0]) |
                (cout & sum[2] & ~sum[1] & sum[0]);

assign seg[0] = (~cout & ~sum[2] & ~sum[1] & ~sum[0]) |
                (~cout & ~sum[2] & ~sum[1] & sum[0]) |
                (~cout & sum[2] & sum[1] & sum[0]) |
                (cout & sum[2] & ~sum[1] & ~sum[0]);

endmodule