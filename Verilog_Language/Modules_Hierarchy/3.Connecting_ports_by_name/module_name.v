module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a a1( .in1(a), .in2(b), .in3(c), .in4(d), .out1(out1), .out2(out2));
endmodule

module mod_a ( 
    input in1, in2, in3, in4,
    output out1, out2
);
endmodule