module part4_b_index(
	input wire [10:0] pc_cnt,
	output wire [5:0] b_i
);
	// assign b_i = (($floor(pc_cnt / 8) * 8) + (pc_cnt % 8);
	assign b_i = {pc_cnt[5:3], 3'b0} + {3'b0, pc_cnt[2:0]};
endmodule