module part2_b_index(
	input wire [10:0] clk_cnt,
	output wire [5:0] b_i
);
	// assign b_i = (($floor(clk_cnt / 64) * 8) + (clk_cnt % 8));
	// assign b_i = (clk_cnt[10:6] << 3) + clk_cnt[2:0];
	assign b_i = {clk_cnt[8:6], 3'b0} + {3'b0, clk_cnt[2:0]};
endmodule