module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah 
    ); 
    parameter left = 0, right = 1, lfall = 2, rfall = 3;
    reg [1:0] state, next_state;

    always @(*) begin
        case (state)
            left: 
                if (ground == 1) begin
                    next_state = bump_left ? right : left;
                end else begin next_state = lfall;
                end
            right: 
                if (ground == 1) begin
                    next_state = bump_right ? left : right;
                end else begin next_state = rfall;
                end
            lfall: next_state = ground ? left : lfall;
            rfall: next_state = ground ? right : rfall;
        endcase
    end

    always @(posedge clk or posedge areset) begin
        if (areset) state <= left;
        else state <= next_state;
    end

    assign walk_left = (state == left);
    assign walk_right = (state == right);
    assign aaah = (state == lfall) || (state == rfall);
endmodule
