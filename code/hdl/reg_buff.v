module reg_buff #(parameter BUFF_WIDTH = 8) (
    input clk, en,
    input [BUFF_WIDTH - 1:0] in,
    output reg [BUFF_WIDTH - 1:0] out
);

    always @(posedge clk) if (en) out <= in;

endmodule