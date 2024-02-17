module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
    );
    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = (q[3:0] == 4'd9 && q[7:4] == 4'd9);
    assign ena[3] = (q[3:0] == 4'd9 && q[7:4] == 4'd9 && q[11:8] == 4'd9);
    
    count4 c1( .clk(clk), .reset(reset), .slowena(1'b1), .q(q[3:0]) );
    count4 c2( .clk(clk), .reset(reset), .slowena(ena[1]), .q(q[7:4]) );
    count4 c3( .clk(clk), .reset(reset), .slowena(ena[2]), .q(q[11:8]) );
    count4 c4( .clk(clk), .reset(reset), .slowena(ena[3]), .q(q[15:12]) );
endmodule

module count4 (
    input clk,
    input reset,        // Synchronous active-high reset
    input slowena,      // Enable slow counting
    output reg [3:0] q
    );
    always @(posedge clk) begin
        if (reset) begin
            q <= 4'd0;
        end else begin
            if (slowena) begin
                if (q == 4'd9) begin
                    q <= 4'd0;
                end else begin
                    q <= q + 4'd1;
                end
            end
        end
    end
endmodule