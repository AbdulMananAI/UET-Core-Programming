module multiplier_c3_tb;
    logic [3:0] X_test;
    logic [3:0] P_test;

    multiplier_c3 DUT (
        .X(X_test),
        .P(P_test)
    );

    initial begin
        X_test = 4'd0; #10; 
        X_test = 4'd1; #10; 
        X_test = 4'd2; #10; 
        X_test = 4'd3; #10; 
        X_test = 4'd4; #10; 
        X_test = 4'd5; #10; 
        $stop;
    end
endmodule