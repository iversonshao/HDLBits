module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q
    );
wire m1;
    assign m1 = L ? r_in : q_in;
    always @(posedge clk) begin
        Q <= m1;
    end
endmodule