module part3_c1_index(
	input wire [10:0] pc_cnt,
	output wire [5:0] c1_i
);
	assign c1_i = $floor((pc_cnt - 1)/8) + 32;
endmodule