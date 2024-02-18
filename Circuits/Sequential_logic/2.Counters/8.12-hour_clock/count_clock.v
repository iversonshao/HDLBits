module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
    ); 
    always @(posedge clk) begin
        if (reset) begin
            pm <= 1'b0;
            hh <= 8'h12;
            mm <= 8'h00;
            ss <= 8'h00;
        end else begin
            if (ena) begin
                if (ss < 8'h59) begin
                    if (ss[3:0] < 4'h9) begin //1 digit
                        ss[3:0] <= ss[3:0] + 1'h1;
                    end else begin
                        ss[3:0] <= 0; //59->00
                        ss[7:4] <= ss[7:4] + 1'h1; //10 digit
                    end
                end else begin
                    ss <= 0;
                    if (mm < 8'h59) begin
                        if (mm[3:0] < 4'h9) begin 
                            mm[3:0] <= mm[3:0] + 1'h1;
                        end else begin
                            mm[3:0] <= 0; //59->00
                            mm[7:4] <= mm[7:4] + 1'h1; 
                        end
                    end else begin
                        mm <= 1'h0;
                        if (hh == 8'h11) 
                            pm = !pm;
                        if (hh < 8'h12) begin
                            if (hh[3:0] < 4'h9) begin 
                                hh[3:0] <= hh[3:0] + 1'h1;
                            end else begin
                                hh[3:0] <= 0; //59->00
                                hh[7:4] <= hh[7:4] + 1'h1; 
                            end
                        end else begin
                            hh <= 1'h1; //hour 12->1
                        end
                    end
                end
            end
        end            
    end

endmodule