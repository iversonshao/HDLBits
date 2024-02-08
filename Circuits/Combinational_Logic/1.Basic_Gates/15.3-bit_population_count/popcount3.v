module top_module( 
    input [2:0] in,
    output [1:0] out 
    );
assign out[0] = (~in[2] & ~in[1] & in[0]) | (~in[2] & in[1] & ~in[0]) | (in[2] & ~in[1] & ~in[0]) | (in[2] & in[1] & in[0]);
assign out[1] = (in[1] & in[0]) | (in[2] & in[0]) | (in[2] & in[1]);



endmodule
