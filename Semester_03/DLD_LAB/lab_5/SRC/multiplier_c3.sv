module multiplier_c3 (
    input  logic [3:0] X,
    output logic [3:0] P
);
    logic [3:0] shift0_out, shift1_out, shift2_out, shift3_out;
    logic [3:0] add0_out, add1_out;

    log_shifter_4bit S0 (.in(X), .amt(2'b01), .force_zero(1'b0), .out(shift0_out)); // Shift by 1
    log_shifter_4bit S1 (.in(X), .amt(2'b00), .force_zero(1'b0), .out(shift1_out)); // Shift by 0
    log_shifter_4bit S2 (.in(X), .amt(2'b00), .force_zero(1'b1), .out(shift2_out)); // Output 0
    log_shifter_4bit S3 (.in(X), .amt(2'b00), .force_zero(1'b1), .out(shift3_out)); // Output 0

    rca_4bit ADD0 (.a(shift0_out), .b(shift1_out), .sum(add0_out));
    rca_4bit ADD1 (.a(add0_out),   .b(shift2_out), .sum(add1_out));
    rca_4bit ADD2 (.a(add1_out),   .b(shift3_out), .sum(P));
endmodule