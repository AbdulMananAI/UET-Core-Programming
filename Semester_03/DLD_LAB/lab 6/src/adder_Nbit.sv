module adder_Nbit #(parameter N = 4) (
    input  logic [N-1:0] a,
    input  logic [N-1:0] b,
    output logic [N-1:0] sum
);
    always_comb begin
        sum = a + b;
    end
endmodule