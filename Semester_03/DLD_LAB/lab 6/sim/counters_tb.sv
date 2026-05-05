module counters_tb;

    localparam N = 4;
    logic clk;
    logic reset;
    
    logic [N-1:0] wrap_out;
    logic [N-1:0] sat_out;

    wrap_counter #(N) WRAP_DUT (
        .clk(clk),
        .reset(reset),
        .count(wrap_out)
    );

    saturated_counter #(N) SAT_DUT (
        .clk(clk),
        .reset(reset),
        .count(sat_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1; 
        #10;
        reset = 0;
        #400; 
        $stop;
    end

endmodule