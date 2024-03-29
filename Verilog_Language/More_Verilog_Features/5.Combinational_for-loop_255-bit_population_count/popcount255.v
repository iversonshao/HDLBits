module top_module( 
    input [254:0] in,
    output reg [7:0] out 
    );
integer i;

always @(*) begin
    out = 8'b0;
    for (i = 0; i < 255; i = i + 1) begin
        if (in[i] == 1'b1) begin
            out = out + 1'b1;
        end else begin
            out = out + 1'b0;
        end
    end
end
endmodule