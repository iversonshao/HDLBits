module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum
    );
    //way1
    // wire [3:0] c1, c2, c3;
    // fadd fa1(.a(x[0]), .b(y[0]), .cin(), .cout(c1), .sum(sum[0]));
    // fadd fa2(.a(x[1]), .b(y[1]), .cin(c1), .cout(c2), .sum(sum[1]));
    // fadd fa3(.a(x[2]), .b(y[2]), .cin(c2), .cout(c3), .sum(sum[2]));
    // fadd fa4(.a(x[3]), .b(y[3]), .cin(c3), .cout(sum[4]), .sum(sum[3]));
    
    //way2
    assign sum = x + y;
endmodule


module fadd( 
    input a, b, cin,
    output cout, sum 
    );
    assign {cout, sum} = a + b + cin;
endmodule