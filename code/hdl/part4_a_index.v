module part4_a_index(
	input wire [10:0] pc_cnt,
	output wire [3:0] a0_i, a1_i, a2_i, a3_i, a4_i, a5_i, a6_i, a7_i
);
    // assign a0_i = 8 * (pc_cnt % 8);
    // assign a1_i = a0_i + 1;
    // assign a2_i = a0_i + 2; ...

	//assign a0_i = {pc_cnt[2:0], 3'b0};
    assign a0_i = {1'b0, pc_cnt[2:0]};
    assign a1_i = a0_i + 8;
    assign a2_i = a0_i;
    assign a3_i = a0_i + 8;
    assign a4_i = a0_i;
    assign a5_i = a0_i + 8;
    assign a6_i = a0_i;
    assign a7_i = a0_i + 8;
	
endmodule