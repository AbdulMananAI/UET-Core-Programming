module tb_mux;

    logic [1:0] w0, w1;
    logic s;
    logic [1:0] f;
    logic [6:0] seg;
    logic [7:0] an;

     // DUT instantiation to be written by student
    mux DUT (
        .w0(w0),
        .w1(w1),
        .s(s),
        .f(f),
        .seg(seg),
        .an(an)
    );

    initial begin
        $display("Time | s | w0 | w1 | f | seg");
        $display("----------------------------------");

        // Test Case 1
        w0 = 2'b00; w1 = 2'b11; s = 0; #10;
        $display("%0t | %b | %b | %b | %b | %b", $time, s, w0, w1, f, seg);

        // Test Case 2
        w0 = 2'b00; w1 = 2'b11; s = 1; #10;
        $display("%0t | %b | %b | %b | %b | %b", $time, s, w0, w1, f, seg);

        // Test Case 3
        w0 = 2'b01; w1 = 2'b10; s = 0; #10;
        $display("%0t | %b | %b | %b | %b | %b", $time, s, w0, w1, f, seg);

        // Test Case 4
        w0 = 2'b01; w1 = 2'b10; s = 1; #10;
        $display("%0t | %b | %b | %b | %b | %b", $time, s, w0, w1, f, seg);

        // Test Case 5
        w0 = 2'b10; w1 = 2'b01; s = 0; #10;
        $display("%0t | %b | %b | %b | %b | %b", $time, s, w0, w1, f, seg);

        // Test Case 6
        w0 = 2'b10; w1 = 2'b01; s = 1; #10;
        $display("%0t | %b | %b | %b | %b | %b", $time, s, w0, w1, f, seg);

        // Test Case 7
        w0 = 2'b11; w1 = 2'b00; s = 0; #10;
        $display("%0t | %b | %b | %b | %b | %b", $time, s, w0, w1, f, seg);

        // Test Case 8
        w0 = 2'b11; w1 = 2'b00; s = 1; #10;
        $display("%0t | %b | %b | %b | %b | %b", $time, s, w0, w1, f, seg);

        $finish;
    end

endmodule
