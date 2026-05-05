module t_ff (input logic clk, reset,
            output logic clk_out);
logic q;
assign clk_out = q;            
always_ff @(posedge clk or posedge reset)
begin
    if (reset)
        q <= #1 0;
    else
        q <= #1 !q;
end
endmodule