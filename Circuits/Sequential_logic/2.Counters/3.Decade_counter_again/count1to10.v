module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output reg [3:0] q
    );
    always @(posedge clk) begin
        if (reset) begin
            q <= 4'd1;
        end else if (q == 4'ha) begin
            q <= 4'd1;
        end else begin
            q <= q + 4'd1;
        end
    end
endmodule