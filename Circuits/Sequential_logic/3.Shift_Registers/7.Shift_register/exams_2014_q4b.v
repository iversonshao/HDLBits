module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
    );
    MUXDFF M1(.clk(KEY[0]), .w(KEY[3]), .R(SW[3]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[3]));
    MUXDFF M2(.clk(KEY[0]), .w(LEDR[3]), .R(SW[2]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[2]));
    MUXDFF M3(.clk(KEY[0]), .w(LEDR[2]), .R(SW[1]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[1]));
    MUXDFF M4(.clk(KEY[0]), .w(LEDR[1]), .R(SW[0]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[0]));

endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output reg Q
    );
wire m1, m2;
    assign m1 = E ? w : Q;
    assign m2 = L ? R : m1;
    always @(posedge clk) begin
        Q <= m2;
    end
endmodule