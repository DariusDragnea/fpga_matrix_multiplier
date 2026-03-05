module part3_c0_index(
	input wire [10:0] pc_cnt,
	output wire [5:0] c0_i
);
	assign c0_i = $floor((pc_cnt - 1)/8);
endmodule