module mux (
    input  logic [1:0] w0,
    input  logic [1:0] w1,
    input  logic       s,
    output logic [1:0] f, // wire logic
    output logic [6:0] seg,   
    output logic [7:0] an  
);


    // 2-bit MUX, write your code here
    assign f =  s ? w1 : w0;

    // enable only AN0, write your code here
    assign an = 8'b11111110;

    // 7-segment decoder
    always_comb begin
        case (f)
            2'b00: seg = 7'b1000000; // 0
            2'b01: seg = 7'b1111001; // 1
            2'b10: seg = 7'b0100100; // 2
            2'b11: seg = 7'b0110000; // 3
            default: seg = 7'b1111111;
        endcase
    end

endmodule





