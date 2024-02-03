module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

wire c1;
wire [31:16] s1, s2;

add16 a1( .a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(c1) );
add16 a2( .a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(s1), .cout() );
add16 a3( .a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(s2), .cout() );
mux16bit2to1 m1( .sel(c1), .a(s1), .b(s2), .y(sum[31:16]) );


endmodule

module add1 ( 
    input a, input b, 
    input cin,   
    output sum, 
    output cout 
    );
assign sum = a ^ b ^ cin;
assign cout = ((a ^ b) & cin) | (a & b);

// Full adder module here

endmodule


module add16 (
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);
wire [14:0] c;
genvar i;
generate
    for (i = 0; i < 16; i = i + 1) begin : adders
        if (i == 0)
            add1 adders(
            .a(a[i]),
            .b(b[i]),
            .cin(cin),
            .sum(sum[i]),
            .cout(c[i])
            );
        else if (i == 15)
            add1 adders(
            .a(a[i]),
            .b(b[i]),
            .cin(c[i-1]),
            .sum(sum[i]),
            .cout(cout)
            );
        else
            add1 adders(
            .a(a[i]),
            .b(b[i]),
            .cin(c[i-1]),
            .sum(sum[i]),
            .cout(c[i])
            );
    end
endgenerate
endmodule

module mux16bit2to1 (
    input sel,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] y
    );
always @ (*) begin
    if (sel == 1'b0)
        y = a;
    else
        y = b;
end

endmodule