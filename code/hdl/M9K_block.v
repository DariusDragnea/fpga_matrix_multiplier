module M9K_block #(parameter WIDTH = 8, DEPTH = 64) (
	input clk, mwr,
	input [WIDTH - 1:0] mdi,
	input [$clog2(DEPTH) - 1:0] addr,
	output reg [WIDTH - 1:0] mdo
);
	reg signed [WIDTH - 1:0] mem [DEPTH - 1:0] /* synthesis ramstyle = "M9K" */;

	always @(negedge clk) begin
		if (mwr) mem[addr] <= mdi;
		mdo <= mem[addr];
	end
endmodule