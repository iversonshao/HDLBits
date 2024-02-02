module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
wire c1;
add16 add1(
    .a(a[15:0]),
    .b(b[15:0]),
    .cin(1'b0),
    .sum(sum[15:0]),
    .cout(c1)
);
add16 add2(
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(c1),
    .sum(sum[31:16]),
    .cout()
);
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
            fulladder adders(
            .A(a[i]),
            .B(b[i]),
            .cin(cin),
            .S(sum[i]),
            .cout(c[i])
            );
        else if (i == 15)
            fulladder adders(
            .A(a[i]),
            .B(b[i]),
            .cin(c[i-1]),
            .S(sum[i]),
            .cout(cout)
            );
        else
            fulladder adders(
            .A(a[i]),
            .B(b[i]),
            .cin(c[i-1]),
            .S(sum[i]),
            .cout(c[i])
            );
    end
endgenerate
endmodule

module adder1(
    input A,
    input B,
    input cin,
    output reg cout,
    output reg S
    );

always @(*) begin
    S = (A ^ B) ^ cin;
    cout = ((A ^ B) & cin) | (A & B);
end
endmodule