module Binary_to_BCD_tb;

    logic [4:0] a1;
    logic [7:0] y1;

// instantiate
    Binary_to_BCD DUT (
        .a(a1), 
        .y(y1)
    );


    initial begin
        a1 = 5'd0;  #10;  // Test case: 0  -> Expect 0000_0000
        a1 = 5'd5;  #10;  // Test case: 5  -> Expect 0000_0101
        a1 = 5'd11; #10;  // Test case: 11 -> Expect 0001_0001
        a1 = 5'd15; #10;  // Test case: 15 -> Expect 0001_0101
        a1 = 5'd20; #10;  // Test case: 20 -> Expect 0010_0000
        a1 = 5'd31; #10;  // Test case: 31 -> Expect 0011_0001
        
        $stop; 
    end

endmodule