module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);
wire [7:0] d1, d2, d3;
my_dff8 dff1( .clk(clk), .d(d), .q(d1) );
my_dff8 dff2( .clk(clk), .d(d1), .q(d2) );
my_dff8 dff3( .clk(clk), .d(d2), .q(d3) );
// mux use blocking assignment
    always @(*) begin
        case(sel)
            2'b00: q = d;
            2'b01: q = d1;
            2'b10: q = d2;
            2'b11: q = d3;

        endcase
    
    end
endmodule
// dff use non-blocking assignment
module my_dff8 ( 
    input clk,
    input [7:0] d, 
    output reg [7:0] q 
    );
    always @(posedge clk) begin
        q <= d;
    end
endmodule

