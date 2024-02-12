module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  
    ); 
//a'bc'd'+ab'c'd'+a'b'c'd+abc'd+a'bcd+ab'cd+a'b'cd'+abcd'
//->c'd'(a^b)+a'b'(c^d)+cd(a^b)+ab(c^d)
//->(a^b)^(c^d)
    assign out = (a ^ b) ^ (c ^ d) ;

endmodule