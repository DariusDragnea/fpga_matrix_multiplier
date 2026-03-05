module part2_a_index(
	input wire [10:0] clk_cnt,
	output wire [5:0] a_i
);
	// assign a_i = (($floor(clk_cnt / 8) % 8) + (8 * (clk_cnt % 8)));
	assign a_i = {3'b0, clk_cnt[5:3]} + {clk_cnt[2:0], 3'b0};
	
endmodule