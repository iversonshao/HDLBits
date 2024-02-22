// Note the Verilog-1995 module declaration syntax here:
module  top_module (
    input clk,
    input reset,    // Synchronous reset to state B
    input in,
    output reg out
);

    // Fill in state name declarations
    parameter A = 0, B = 1;
    reg present_state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin  
            // Fill in reset logic
            present_state <= B;
            out <= 1'b1; // Reset output to 0 when in reset state
        end else begin
            case (present_state)
                A: next_state <= in ? A : B;
                B: next_state <= in ? B : A;
            endcase

            // State flip-flops
            present_state <= next_state;

            // Fill in output logic
            case (present_state)
                A: if (in) out <= 0; else out <= 1;
                B: if (in) out <= 1; else out <= 0;

            endcase
        end
    end

endmodule
