module mac_controller (
	output reg macc_clr, C_mwr, macc_PC_up,
	input start, clk, reset, 
	input [2:0] macc_PC_cnt
);
	reg [1:0] state;
	//States:
		//00: clear macc + product 0
		//01: macc_sum + product n
		//10: macc_sum + product 7 and store

	
	always@(state)begin
		case(state)
			2'b00: begin
				macc_clr=1;
				C_mwr=0;
				macc_PC_up=1; end
			2'b01: begin
				macc_clr=0;
				C_mwr=0;
				macc_PC_up=1; end
			2'b10: begin
				macc_clr=0;
				C_mwr=1;
				macc_PC_up=1; end
			default: begin
				macc_clr=1;
				macc_PC_up=1; end
		endcase
	end

	always@(posedge clk or posedge reset)begin
		if(reset) state=2'b00;
		else begin
			case(state)
				2'b00: begin
					if(start)begin state=2'b01; end
					else begin state=2'b00; end end
				2'b01: begin
					if(macc_PC_cnt%8==6)begin state=2'b10; end
					else begin state=2'b01; end end
				2'b10: state=2'b00;
				default: begin
					if(start)begin state=2'b01; end
					else begin state=2'b00; end end
			endcase
		end
	end
endmodule


//program counter for macc_controller module
//Counts 0->7 circular
//reset to 0 on reset, count up on macc_PC_up
module macc_PC(
	input macc_PC_up, clk, reset,
	output reg [2:0] macc_PC_cnt
);

	reg [2:0] state;
	initial state=3'b000;
	
	always@(state)begin
		macc_PC_cnt=state;	
	end
	

	always@(posedge clk or posedge reset)begin
		if(reset)begin 
			state=3'b000;
		end else if (macc_PC_up) begin
			state=state+3'b001;
		end else begin
			state=state;
		end
	end

endmodule
















