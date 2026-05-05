module saturated_counter #(parameter N = 4) (
    input  logic clk,
    input  logic reset,
    output logic [N-1:0] count
);

    logic [N-1:0] adder_out;
    logic [N-1:0] next_count;
    logic is_max;

    // 1. ADDER: Computes (count + 1)
    adder_Nbit #(N) ADDER (
        .a(count),
        .b({{N-1{1'b0}}, 1'b1}), 
        .sum(adder_out)
    );

    // 2. COMPARATOR: Checks if count == Max Value (all 1s)
    comparator_Nbit #(N) COMP (
        .a(count),
        .b({N{1'b1}}),           // {N{1'b1}} creates "1111" for N=4
        .eq(is_max)
    );

    // 3. MUX: If max, hold current count. Else, pass the adder output.
    mux2to1_Nbit #(N) MUX (
        .d0(adder_out),    // sel=0 (Not Max) -> Count up
        .d1(count),        // sel=1 (Is Max)  -> Freeze/Hold
        .sel(is_max),
        .y(next_count)
    );

    // 4. REGISTER: Stores the value
    register_Nbit #(N) REG (
        .clk(clk),
        .reset(reset),
        .d(next_count),
        .q(count)
    );

endmodule