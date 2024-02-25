module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output reg fr3,
    output reg fr2,
    output reg fr1,
    output reg dfr
    );
    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;
    reg [1:0] state, next_state;
    always @(*) begin
        case(state)
            s0: if(s == 3'b000) next_state = s0;
                else if(s == 3'b001) next_state = s1;
            s1: if(s == 3'b000) next_state = s0;
                else if(s == 3'b001) next_state = s1;
                else if(s == 3'b011) next_state = s2;
            s2: if(s == 3'b001) next_state = s1;
                else if(s == 3'b011) next_state = s2;
                else if(s == 3'b111) next_state = s3;
            s3: if(s == 3'b011) next_state = s2;
                else if(s == 3'b111) next_state = s3;
            default: next_state = s0;
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            state <= s0;
        end else begin
            state <= next_state;
        end
    end
    always @(posedge clk) begin
        if(reset) begin
            {fr3, fr2, fr1, dfr} <= 4'b1111;
        end else begin
            case(next_state)
                s0: begin
                    {fr3, fr2, fr1, dfr} <= 4'b1111;                
                end
                s1: begin
                    {fr3, fr2, fr1, dfr} <= 4'b0110;
                    if (state == s0 && next_state == s1) dfr <= 1'b0 ;
                    else if(state == s1 && next_state == s1) dfr <= dfr;
                    else dfr <= 1'b1;
                end
                s2: begin
                    {fr3, fr2, fr1, dfr} <= 4'b0010;
                    if (state == s1 && next_state == s2) dfr <= 1'b0 ;
                    else if(state == s2 && next_state == s2) dfr <= dfr;
                    else dfr <= 1'b1;
                end
                s3: begin
                    {fr3, fr2, fr1, dfr} <= 4'b0001;
                    if (state == s2 && next_state == s3) dfr <= 1'b0 ;
                    else if(state == s3 && next_state == s3) dfr <= dfr;
                    else dfr <= 1'b1;
                end
            endcase
        end
    end

endmodule
