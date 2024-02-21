module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output reg out
    );
reg q1, q2, q3;
    always @(posedge clk) begin
        if (!resetn) begin
            {q1, q2, q3, out} <= 4'b0;
        end else begin
            {q1, q2, q3, out} <= {in, q1, q2, q3};
        end
    end
endmodule