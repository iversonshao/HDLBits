module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
    );
reg [31:0] q1;
wire [31:0] capture;
    always @(posedge clk) begin
        q1 <= in;
    end
    assign capture = ~in & q1;
    always @(posedge clk) begin
        if (reset) begin
            out <= 0;
        end else begin
            out <= capture | out;
        end
    end
endmodule
