module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output reg [4:0] q
    ); 
    always @(posedge clk) begin
        
        if (reset) begin
            q <= 5'h1;
        end else begin
            q[4] <= q[0]; // x ^ 0 = x
            q[3] <= q[4];
            q[2] <= q[3] ^ q[0];
            q[1] <= q[2];
            q[0] <= q[1];
        end
    end
endmodule