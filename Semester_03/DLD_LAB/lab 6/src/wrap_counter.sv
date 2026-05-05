module wrap_counter #(parameter N = 4) (
    input  logic clk,
    input  logic reset,
    output logic [N-1:0] count
);

    logic [N-1:0] next_count;

    // 1. ADDER: Computes (count + 1)
    // When count hits max (1111), adding 1 naturally rolls over to 0000!
    adder_Nbit #(N) ADDER (
        .a(count),
        .b({{N-1{1'b0}}, 1'b1}), // Adds 1
        .sum(next_count)
    );

    // 2. REGISTER: Stores the value on every clock tick
    register_Nbit #(N) REG (
        .clk(clk),
        .reset(reset),
        .d(next_count),
        .q(count)
    );

endmodule