module part2_c_index(
	input wire [10:0] clk_cnt,
	output wire [5:0] c_i
);
	// assign c_i = $floor(clk_cnt / 8);
	assign c_i = clk_cnt[8:3] - 1;
endmodule