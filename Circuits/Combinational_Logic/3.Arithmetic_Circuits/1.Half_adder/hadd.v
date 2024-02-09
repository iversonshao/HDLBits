module top_module( 
    input a, b,
    output cout, sum 
    );
    assign {cout, sum} = a + b;
    assign cout = a & b;
    assign sum = a ^b;
endmodule