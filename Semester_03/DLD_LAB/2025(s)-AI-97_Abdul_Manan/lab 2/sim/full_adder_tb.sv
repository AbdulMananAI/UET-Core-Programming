module full_adder_tb();
    logic a1;
    logic b1;
    logic c1;
    logic sum1;
    logic cout;

    // Instance of the Full Adder
    full_adder MEA (
        .a(a1),
        .b(b1),
        .cin(c1),
        .sum(sum1),
        .cout(cout) // Note: Image shows 'carry1', ensure your signal names match
    );

    initial begin
        // Provide different combinations of the inputs to check validity
        a1 = 0; b1 = 0; c1 = 0; #10;
        a1 = 0; b1 = 0; c1 = 1; #10;
        a1 = 0; b1 = 1; c1 = 0; #10;
        a1 = 0; b1 = 1; c1 = 1; #10;
        a1 = 1; b1 = 0; c1 = 0; #10;
        a1 = 1; b1 = 0; c1 = 1; #10;
        a1 = 1; b1 = 1; c1 = 0; #10;
        a1 = 1; b1 = 1; c1 = 1; #10;
        $stop;
    end
endmodule