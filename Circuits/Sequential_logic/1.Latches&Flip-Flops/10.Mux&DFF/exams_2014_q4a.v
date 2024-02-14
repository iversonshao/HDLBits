module top_module (
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