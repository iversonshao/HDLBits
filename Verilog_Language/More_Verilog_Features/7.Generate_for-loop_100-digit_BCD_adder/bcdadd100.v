module top_module (
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum
    );
wire [99:-1] c;
assign c[-1] = cin;
genvar i;
generate
    for (i = 0; i < $bits(a)/4; i = i + 1) begin: adder100
        bcd_fadd adder(
            .a(a[4*(i + 1) - 1: 4*i ]),
            .b(b[4*(i + 1) - 1: 4*i ]),
            .cin(c[i-1]),
            .sum(sum[4*(i + 1) - 1: 4*i]),
            .cout(c[i])
        );
    end
endgenerate
assign cout = c[99];
endmodule


module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output reg cout,
    output reg [3:0] sum
    );
reg [4:0] temp;

always @(*) begin
    temp = a + b + cin;
    {cout, sum} = (temp > 9) ? {1'b1, temp-10} : {1'b0, temp};
end
endmodule

