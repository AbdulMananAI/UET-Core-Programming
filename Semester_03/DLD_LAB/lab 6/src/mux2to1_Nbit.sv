module mux2to1_Nbit #(parameter N = 4) (
    input  logic [N-1:0] d0,
    input  logic [N-1:0] d1,
    input  logic sel,
    output logic [N-1:0] y
);
    always_comb begin
        y = sel ? d1 : d0;
    end
endmodule