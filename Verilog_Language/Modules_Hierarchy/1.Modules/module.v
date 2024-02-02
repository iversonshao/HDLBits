module top_module ( 
    input a, input b, 
    output out 
);
mod_a a1 ( .in1(a), .in2(b), .out(out) );
endmodule
// The module mod_a is defined as follows:
module mod_a ( 
    input in1, in2, 
    output out 
);
endmodule
