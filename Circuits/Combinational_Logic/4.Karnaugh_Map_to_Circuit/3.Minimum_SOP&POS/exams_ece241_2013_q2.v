module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
    ); 
// SOP is f
assign out_sop = c & d | ~a & ~b & c;
// POS is f',so need demorgans law
assign out_pos = c & (~a | b) & (~b | ~c | d);
endmodule