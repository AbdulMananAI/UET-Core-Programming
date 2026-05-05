module comparator_Nbit #(parameter N = 4) (
    input  logic [N-1:0] a,
    input  logic [N-1:0] b,
    output logic eq
);
    // eq is 1 if A equals B, otherwise 0
    always_comb begin
        eq = (a == b);
    end
endmodule