module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum 
    );
    add1 adder100[99:0](
        .a(a[99:0]),
        .b(b[99:0]),
        .cin({cout[98:0], cin}),
        .sum(sum[99:0]),
        .cout(cout[99:0])
    );
endmodule
module add1 ( 
    input a, input b, 
    input cin,   
    output sum, 
    output cout 
    );
assign sum = a ^ b ^ cin;
assign cout = ((a ^ b) & cin) | (a & b);
endmodule

