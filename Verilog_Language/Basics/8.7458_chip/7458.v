module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y 
);
wire a3to1_1, a3to1_2;
wire a2to1_1, a2to1_2;

assign a3to1_1 = p1a & p1b & p1c;
assign a3to1_2 = p1d & p1e & p1f;
assign a2to1_1 = p2a & p2b;
assign a2to1_2 = p2c & p2d;
assign p1y = a3to1_1 | a3to1_2;
assign p2y = a2to1_1 | a2to1_2;

endmodule