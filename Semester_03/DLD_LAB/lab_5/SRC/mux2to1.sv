module mux2to1 (
    input  logic i0,
    input  logic i1,
    input  logic sel,
    output logic y
);
    always_comb begin
        if (sel) y = i1;
        else     y = i0;
    end
endmodule