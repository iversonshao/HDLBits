module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output done
    );

    // FSM from fsm_ps2
    parameter A = 0, B = 1, C = 2, D = 3;
    reg [1:0] state, next_state;
    // State transition logic (combinational)
    always @(*) begin
        case (state)
            A: next_state = (in[3] == 1) ? B : A;
            B: next_state = C;
            C: next_state = D;
            D: next_state = (in[3] == 1) ? B : A;
            default: next_state = A;
        endcase
    end
    // State flip-flops (sequential)
    always @(posedge clk or posedge reset) begin
        if (reset) state <= A;
        else state <= next_state;
    end
    // Output logic
    assign done = (state == D);
    // New: Datapath to store incoming bytes.
    always@(posedge clk)
        case(state)
            A:out_bytes[23:16] <= in;
            B:out_bytes[15:8] <= in;
            C:out_bytes[7:0] <= in;
            D:out_bytes[23:16] <= in; 
        endcase
endmodule