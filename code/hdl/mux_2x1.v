module mux_2x1 #(parameter MUX_WIDTH = 8) (
    input [MUX_WIDTH - 1:0] a, 
    input [MUX_WIDTH - 1:0] b, 
    input sel,
    output reg [MUX_WIDTH - 1:0] out);

always @(*) begin
    case(sel)
        1'b0    : out = a;
        default : out = b;
    endcase
end

endmodule
