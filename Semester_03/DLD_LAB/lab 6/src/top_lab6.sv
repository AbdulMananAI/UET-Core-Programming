module top_lab6 (
    input  logic clk,          // 100MHz board clock
    input  logic reset,        // Reset button
    output logic [15:0] led,   // LEDs for the Saturated Counter
    output logic [6:0] seg,    // 7-segment segments for Wrap Counter
    output logic [7:0] an      // 7-segment anodes
);

    logic clk_slow;
    logic [3:0] count_wrap;
    logic [3:0] count_sat;

    // 1. Slow down the clock
    freq_divider CLK_DIV (
        .clk(clk),
        .reset(reset),
        .clk_out(clk_slow)
    );

    // 2. The Separated Wrap Counter
    wrap_counter #(4) WRAP_CNT (
        .clk(clk_slow),
        .reset(reset),
        .count(count_wrap)
    );

    // 3. The Separated Saturated Counter
    saturated_counter #(4) SAT_CNT (
        .clk(clk_slow),
        .reset(reset),
        .count(count_sat)
    );

    // 4. Route the Wrap Counter to the 7-Segment Display
    decoder DEC (
        .sum(count_wrap[2:0]), 
        .cout(count_wrap[3]),  
        .sel(3'b000),       // Turn on only the first digit (an[0])
        .seg(seg),
        .an(an)
    );

    // 5. Route the Saturated Counter to the LEDs
    assign led[3:0] = count_sat;
    assign led[15:4] = 12'b0;  // Turn off the remaining 12 LEDs

endmodule