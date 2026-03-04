module full_adder (
    input  logic a,
    input  logic b,
    input  logic cin, // carry_in
    output logic sum,
    output logic cout // carry_out
);
    assign sum  = a ^ b ^ cin; //assign = tells connection btw inputs and outpus  // (A)bar(B)+(A)(B)bar + (A)(B)(C)bar + (A)bar(B)(C)bar
    assign cout = (a & b) | (cin & a) | (cin & b);
endmodule