module register_Nbit #(parameter N = 4) (
    input  logic clk,
    input  logic reset,
    input  logic [N-1:0] d,
    output logic [N-1:0] q
);
    always_ff @(posedge clk) begin
        if (reset) q <= {N{1'b0}}; // Reset to 0
        else       q <= d;         // Update on clock edge
    end
endmodule