module M9K_block_2_port #(parameter WIDTH = 8, DEPTH = 64) (
	input clk, mwr_0, mwr_1,
	input [WIDTH - 1:0] mdi_0, mdi_1,
	input [$clog2(DEPTH) - 1:0] addr_0, addr_1,
	output reg [WIDTH - 1:0] mdo_0, mdo_1
);
	reg signed [WIDTH - 1:0] mem [DEPTH - 1:0] /* synthesis ramstyle = "M9K" */;

	always @(negedge clk) begin
		if (mwr_0) mem[addr_0] <= mdi_0;
        if (mwr_1) mem[addr_1] <= mdi_1;
		mdo_0 <= mem[addr_0];
        mdo_1 <= mem[addr_1];
	end
endmodule