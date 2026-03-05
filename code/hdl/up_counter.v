module up_counter #(parameter N = 11) ( 
    input clk, rst, en,
    output reg [N - 1:0] clk_cnt
);

    always @(posedge clk or posedge rst) begin
        if (rst) clk_cnt <= 0;
        else if (en) clk_cnt <= clk_cnt + 1;
    end

endmodule