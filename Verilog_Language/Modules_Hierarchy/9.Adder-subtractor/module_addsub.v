module top_module (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
wire [31:0] x;
wire c1;
assign x = {32{sub}} ^ b;
add16 a1 ( .a(a[15:0]), .b(x[15:0]), .cin(sub), .sum(sum[15:0]), .cout(c1) );
add16 a2 ( .a(a[31:16]), .b(x[31:16]), .cin(c1), .sum(sum[31:16]), .cout() );
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