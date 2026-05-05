module Binary_to_BCD (
    input  logic [4:0] a,  // 5-bit binary input (0 to 31)
    output logic [7:0] y   // 8-bit BCD output
);

    logic [3:0] tens;
    logic [3:0] ones;

    always_comb begin
        // Behavioral math to split the decimal values
        if (a >= 5'd30) begin
            tens = 4'd3;
            ones = a - 5'd30;
        end 
        else if (a >= 5'd20) begin
            tens = 4'd2;
            ones = a - 5'd20;
        end 
        else if (a >= 5'd10) begin
            tens = 4'd1;
            ones = a - 5'd10;
        end 
        else begin
            tens = 4'd0;
            ones = a[3:0]; 
        end
        
        // Concatenate (combine) the tens and ones into the 8-bit output
        y = {tens, ones};
    end

endmodule