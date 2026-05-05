module log_shifter_4bit (
    input  logic [3:0] in,
    input  logic [1:0] amt,       // Shift amount (a1, a0)
    input  logic force_zero,      // High to output 0000
    output logic [3:0] out
);
    logic w0, w1, w2, w3; 
    logic x0, x1, x2, x3; 

    // Level 0: Controlled by amt[0]
    mux2to1 m00(.i0(in[0]), .i1(1'b0),  .sel(amt[0]), .y(w0));
    mux2to1 m01(.i0(in[1]), .i1(in[0]), .sel(amt[0]), .y(w1));
    mux2to1 m02(.i0(in[2]), .i1(in[1]), .sel(amt[0]), .y(w2));
    mux2to1 m03(.i0(in[3]), .i1(in[2]), .sel(amt[0]), .y(w3));

    // Level 1: Controlled by amt[1]
    mux2to1 m10(.i0(w0), .i1(1'b0), .sel(amt[1]), .y(x0));
    mux2to1 m11(.i0(w1), .i1(1'b0), .sel(amt[1]), .y(x1));
    mux2to1 m12(.i0(w2), .i1(w0),  .sel(amt[1]), .y(x2));
    mux2to1 m13(.i0(w3), .i1(w1),  .sel(amt[1]), .y(x3));

    // Modification: Force to Zero
    mux2to1 mz0(.i0(x0), .i1(1'b0), .sel(force_zero), .y(out[0]));
    mux2to1 mz1(.i0(x1), .i1(1'b0), .sel(force_zero), .y(out[1]));
    mux2to1 mz2(.i0(x2), .i1(1'b0), .sel(force_zero), .y(out[2]));
    mux2to1 mz3(.i0(x3), .i1(1'b0), .sel(force_zero), .y(out[3]));
endmodule