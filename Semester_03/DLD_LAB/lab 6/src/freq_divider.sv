module freq_divider(input logic clk, reset,
            output logic clk_out);

logic q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,q22,q23,q24,q25;
t_ff ff0(
    .reset(reset),
    .clk(clk),
    .clk_out(q0)
);
t_ff ff1(
    .reset(reset),
    .clk(q0),
    .clk_out(q1)
);
t_ff ff2(
    .reset(reset),
    .clk(q1),
    .clk_out(q2)
);
t_ff ff3(
    .reset(reset),
    .clk(q2),
    .clk_out(q3)
);
t_ff ff4(
    .reset(reset),
    .clk(q3),
    .clk_out(q4)
);
t_ff ff5(
    .reset(reset),
    .clk(q4),
    .clk_out(q5)
);
t_ff ff6(
    .reset(reset),
    .clk(q5),
    .clk_out(q6)
);
t_ff ff7(
    .reset(reset),
    .clk(q6),
    .clk_out(q7)
);
t_ff ff8(
    .reset(reset),
    .clk(q7),
    .clk_out(q8)
);
t_ff ff9(
    .reset(reset),
    .clk(q8),
    .clk_out(q9)
);
t_ff ff10(
    .reset(reset),
    .clk(q9),
    .clk_out(q10)
);
t_ff ff11(
    .reset(reset),
    .clk(q10),
    .clk_out(q11)
);
t_ff ff12(
    .reset(reset),
    .clk(q11),
    .clk_out(q12)
);
t_ff ff13(
    .reset(reset),
    .clk(q12),
    .clk_out(q13)
);
t_ff ff14(
    .reset(reset),
    .clk(q13),
    .clk_out(q14)
);
t_ff ff15(
    .reset(reset),
    .clk(q14),
    .clk_out(q15)
);
t_ff ff16(
    .reset(reset),
    .clk(q15),
    .clk_out(q16)
);
t_ff ff17(
    .reset(reset),
    .clk(q16),
    .clk_out(q17)
);
t_ff ff18(
    .reset(reset),
    .clk(q17),
    .clk_out(q18)
);
t_ff ff19(
    .reset(reset),
    .clk(q18),
    .clk_out(q19)
);
t_ff ff20(
    .reset(reset),
    .clk(q19),
    .clk_out(q20)
);
t_ff ff21(
    .reset(reset),
    .clk(q20),
    .clk_out(q21)
);
t_ff ff22(
    .reset(reset),
    .clk(q21),
    .clk_out(q22)
);
t_ff ff23(
    .reset(reset),
    .clk(q22),
    .clk_out(q23)
);
t_ff ff24(
    .reset(reset),
    .clk(q23),
    .clk_out(q24)
);
t_ff ff25(
    .reset(reset),
    .clk(q24),
    .clk_out(clk_out)
);
endmodule