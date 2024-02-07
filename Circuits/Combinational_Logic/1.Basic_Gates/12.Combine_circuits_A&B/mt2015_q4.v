module top_module (
    input x, input y, 
    output z
    );
wire w1, w2, w3, w4;
wire o1, an1;
mt2015_q4a a1(.x(x), .y(y), .z(w1));
mt2015_q4a a2(.x(x), .y(y), .z(w2));
mt2015_q4b b1(.x(x), .y(y), .z(w3));
mt2015_q4b b2(.x(x), .y(y), .z(w4));
assign o1 = w1 | w2;
assign an1 = w3 & w4;
assign z = o1 ^ an1;

endmodule

module mt2015_q4a (
    input x, input y, 
    output z
    );
assign z = (x ^ y) & x;

endmodule

module mt2015_q4b (
    input x, input y, 
    output z
    );
assign z = ~(x ^ y);

endmodule