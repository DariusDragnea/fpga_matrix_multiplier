module part4_main_controller (
	output reg clk_cnt_up, done, macc_sel_up,
	input [5:0] clk_cnt,
	input clk, reset, start
);
	reg [1:0] state;
	always@(state)begin
		case(state)
			2'b00: begin //Idle state
				clk_cnt_up=0;
				done=0;
				macc_sel_up=0; end
			2'b01: begin //Initial 8 cycle calculation state
				clk_cnt_up=1;
				done=0;
				macc_sel_up=0; end
			2'b10: begin //Calculation/storage state
				clk_cnt_up=1;
				done=0;
				macc_sel_up=1; end
			2'b11: begin //Done state
				clk_cnt_up=0;
				done=1;
				macc_sel_up=0; end
			default: begin //Default to idle state behavior
				clk_cnt_up=0;
				done=0;
				macc_sel_up=0; end
		endcase
	end

	always@(posedge clk or posedge reset)begin
		if(reset)begin
			state=2'b00;
		end else begin
			case(state)
				2'b00: begin //leave idle state on start
					if(start)begin state=2'b01;
					end else begin state=2'b00; end
				end
				2'b01: begin //leave init calc. state when clock count at 7
					if(clk_cnt_up==7)begin state=2'b10;
					end else begin state=2'b01; end
				end
				2'b10: begin //leave calc. state when clock count at 71
					if(clk_cnt==71)begin state=2'b11;
					end else begin state=2'b10; end
				end
				default: begin //default to idle state behavior
					if(start)begin state=2'b01;
					end else begin state=2'b00; end
				end
			endcase
		end
	end

endmodule











