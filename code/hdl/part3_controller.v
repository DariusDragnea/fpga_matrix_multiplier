module part3_controller (
	output reg done, cnt_up, macc_clear, C_wrm, pc_up, C_idx_sel,
	input clk, reset, start,
	input wire [10:0] clk_cnt, 
	input wire [10:0] pc_cnt
);

	reg [2:0] state, nextstate;

	localparam IDLE 		 = 3'd0,
			   INITIALIZE	 = 3'd1,
			   START_VEC_SUM = 3'd2,
			   LOOP_VEC_SUM  = 3'd3,
			   MACC_0_WRITE  = 3'd4,
			   MACC_1_WRITE  = 3'd5,
			   DONE			 = 3'd6;

	// Combinational Logic for FSM.
	always@(*) begin
		case(state)
			IDLE: begin //Idle state
				done 		= 0;
				cnt_up		= 0;
				pc_up		= 0;
				macc_clear	= 0;
				C_idx_sel	= 0;
				C_wrm		= 0;	
			end
			3'b001: begin //Start new calculation
				done=0;
				cnt_up=1;
				pc_up=1;
				macc_clear=1;
				C_idx_sel=0;
				C_wrm=0; end
			3'b010: begin //Calculation
				done=0;
				cnt_up=1;
				pc_up=1;
				macc_clear=0;
				C_idx_sel=0;
				C_wrm=0; end
			3'b011: begin //Store MACC_0 to memory
				done=0;
				cnt_up=1;
				pc_up=0;
				macc_clear=0;
				C_idx_sel=0;
				C_wrm=1; end
			3'b100: begin //Store MACC_1 to memory
				done=0;
				cnt_up=1;
				pc_up=1;
				macc_clear=0;
				C_idx_sel=1;
				C_wrm=1; end
			3'b101: begin //Done state
				done=1;
				cnt_up=0;
				pc_up=0;
				macc_clear=1;
				C_idx_sel=0;
				C_wrm=0; end
			default: begin //Default to idle state outputs
				done=0;
				cnt_up=0;
				pc_up=0;
				macc_clear=0;
				C_idx_sel=0;
				C_wrm=0; end
		endcase		
	end

	always@(posedge clk or posedge reset)begin
		if(reset)begin
			state=3'b000;
		end else begin
			case(state)
				3'b000: begin
					if(start) state=3'b001;
					else state=3'b000; 
				end
				3'b001: state=3'b010;
				3'b010: begin
					if((pc_cnt%8)==7) state=3'b011;
					else state=3'b010;	
				end
				3'b011: state=3'b100;
				3'b100: begin
					if(floor(pc_cnt/8)<32) state=3'b001;
					else state=3'b101;
				end
				3'b101: state=3'b101;
				default: state=3'b000; //default to idle state
			endcase
		end
	end	

endmodule