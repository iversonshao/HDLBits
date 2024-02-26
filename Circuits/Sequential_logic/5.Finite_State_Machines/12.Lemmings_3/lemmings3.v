module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging 
    ); 
    parameter left = 0, right = 1, lfall = 2, rfall = 3, digleft = 4, digright = 5;
    reg [2:0] state, next_state;

    always @(*) begin
        case (state)
            left: next_state = ground? (dig? digleft : (bump_left? right : left)) : lfall;
            right: next_state = ground? (dig? digright : (bump_right? left : right)) : rfall;
            lfall: next_state = ground ? left : lfall;
            rfall: next_state = ground ? right : rfall;
            digleft: next_state = ground ? digleft : lfall;
            digright: next_state = ground ? digright : rfall;
        endcase
    end

    always @(posedge clk or posedge areset) begin
        if (areset) state <= left;
        else state <= next_state;
    end

    assign walk_left = (state == left);
    assign walk_right = (state == right);
    assign aaah = (state == lfall) | (state == rfall);
    assign digging = (state == digleft) | (state == digright);
endmodule
