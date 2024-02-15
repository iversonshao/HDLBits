module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
    ); 
    assign c_enable = enable;
    assign c_load = reset | (Q == 4'd12 & enable == 1'b1);
    assign c_d = 4'd1;
    count4 the_counter (.clk(clk), .enable(enable), .load(c_load), .d(c_d), .Q(Q));

endmodule

module count4 (
    input clk,
    input enable,
    input load,
    input [3:0] d,
    output reg [3:0] Q
    );
    always @(posedge clk) begin
        if (load) begin
            if (enable) begin
                Q <= d;
            end else if (Q == 4'h1111) begin
                Q <= 4'd0;
            end else begin
                Q <= Q + 4'd1;
            end
        end
    end
endmodule