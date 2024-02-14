module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
    );
reg [7:0] q1;
    always @(posedge clk) begin
        q1 <= in; // q1 always delayed by one clock cycle from in
        pedge <= in & ~q1;
        // 1 -> detected rising edge
        // 0 -> no rising edge
    end
endmodule