module decoder_tb;

    // Inputs
    logic [2:0] a;
    logic [2:0] b;
    logic       c_in;
    logic [2:0] sel; // [?] filled with [2:0] for a 3-bit select line

    // Outputs
    logic [6:0] seg; // [?] filled with [6:0] for 7 segments
    logic [7:0] an;  // [?] filled with [7:0] for 8 anodes

    // Instantiate the top module
    top_adder_decoder MEA (
        .a(a),
        .b(b),
        .c_in(c_in),
        .sel(sel),   // Added this connection! The module needs the select line.
        .seg(seg),
        .an(an)
    );

    initial begin
        // Display header (fixed the extra spaces in the tab escape sequences \t)
        $display("a\tb\tc_in\tresult(seg)\tan");

        // Test Case 1: a=3, b=4, c_in=0
        a = 3; b = 4; c_in = 0; sel = 7;
        
        // Wait 10ns to allow signals to propagate
        #10;
        
        $display("%b\t%b\t%b\t%b\t%b", a, b, c_in, seg, an);

        // Assert expected outputs (fixed the weird spacing in the binary literals)
        if (seg != 7'b0001111)
            $display("ERROR: seg_output_incorrect");
        else
            $display("PASS: seg_output_correct");

        if (an != 8'b01111111)
            $display("ERROR: an_output_incorrect");
        else
            $display("PASS: an_output_correct");
            
        // Add more test cases here if needed
        $display("Now_its_your_turn!_Try_other_input_combinations_to_explore_the_adder_output.");
        
        $stop; // Good practice to include $stop to pause the Questa simulator
    end

endmodule

