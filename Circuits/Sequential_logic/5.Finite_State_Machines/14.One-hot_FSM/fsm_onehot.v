module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2
    );
    parameter A=0, B=1, C=2, D=3, E=4, F=5, G=6, H=7, I=8, J=9;
    assign next_state[A] = (state[0] | state[1] | state[2] | state[3] | state[4] | state[7] | state[8] | state[9]) & (~in);
    assign next_state[B] = (state[0] | state[8] | state[9]) & in;
    assign next_state[C] = state[1] & in;
    assign next_state[D] = state[2] & in;
    assign next_state[E] = state[3] & in;
    assign next_state[F] = state[4] & in;
    assign next_state[G] = state[5] & in;
    assign next_state[H] = (state[6] | state[7]) & in;
    assign next_state[I] = state[5] & ~in;
    assign next_state[J] = state[6] & ~in;

    assign out1 = (state[I] | state[J]);
    assign out2 = (state[H] | state[J]);



endmodule