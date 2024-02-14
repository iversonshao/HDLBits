module top_module (
    input clk,
    input in, 
    output reg out
    );
wire x1;
assign x1 = in ^ out;
    always @(posedge clk) begin
        out <= x1;
    end
endmodule