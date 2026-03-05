module part3_a_index(
	input wire [10:0] pc_cnt,
	output wire [5:0] a0_i, a1_i
);
    // assign a0_i = ((($floor(pc_cnt / 8) % 4) * 2) + (8 * (pc_cnt % 8));
    // assign a1_i = a0_i + 1;
	assign a0_i = {2'b0, pc_cnt[4:3], 1'b0} + {pc_cnt[2:0], 3'b0};
    assign a1_i = a0_i + 1;
	
endmodule