module part3_a1_index(
	input wire [10:0] pc_cnt,
	output wire [5:0] a1_i
);
	assign a1_i = (($floor((pc_cnt - 1)/8) % 8) + 8 * (( pc_cnt - 1) % 8))+4;
endmodule