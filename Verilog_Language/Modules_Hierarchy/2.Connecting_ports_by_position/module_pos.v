module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a a1( a, b, c, d, out1, out2);
endmodule

module mod_a ( 
    input in1, in2, in3, in4,
    output o1, o2
);
endmodule