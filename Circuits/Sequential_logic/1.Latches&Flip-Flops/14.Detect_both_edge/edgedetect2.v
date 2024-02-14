module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
    );
reg [7:0] q1;
    always @(posedge clk) begin
        q1 <= in; 
        anyedge <= in ^ q1;
    end
endmodule