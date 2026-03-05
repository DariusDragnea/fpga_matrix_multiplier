module part4_main_controller_v2 (
	output reg done, cnt_up, pc_up, macc_clear, buff_en,
	input clk, rst, start,
	input wire [10:0] pc_cnt
);

	reg [2:0] state, nextstate;

	localparam IDLE 		 = 3'd0,
			   INITIALIZE	 = 3'd1,
			   CALC_VEC_SUM  = 3'd2,
               END_VEC_SUM   = 3'd3,
               STALL_STATE   = 3'd4,
			   DONE_STATE	 = 3'd5;

	// Combinational Logic for FSM.
	always@(*) begin
		case(state)
			IDLE: begin //Idle state
				done 		= 0;
				cnt_up		= 0;
                pc_up       = 0;
				macc_clear	= 1;
				buff_en     = 0;

                if (start) nextstate = INITIALIZE;
                else nextstate = IDLE;
			end
			INITIALIZE: begin 
				done 		= 0;
				cnt_up		= 1;
                pc_up       = 1;
				macc_clear	= 1;
				buff_en     = 0;

                nextstate = CALC_VEC_SUM;
            end
			CALC_VEC_SUM: begin // Calculation
				done 		= 0;
				cnt_up		= 1;
                pc_up       = 1;
				macc_clear	= 0;
                buff_en     = 0;

                // if (pc_cnt % 8 == 7) ...
                if ({1'b0, pc_cnt[2:0]} == 7) nextstate = END_VEC_SUM;
                else nextstate = CALC_VEC_SUM;
            end
            END_VEC_SUM: begin // End of calculation for a column.
				done 		= 0;
				cnt_up		= 1;
                pc_up       = 0;
				macc_clear	= 1;
				buff_en     = 1;

                nextstate = STALL_STATE;
            end
            STALL_STATE: begin      // State to stall for 1 cycle, so that
                                    // the outputs of the MACs are loaded into
                                    // the buffers.
				done 		= 0;
				cnt_up		= 1;
                pc_up       = 1;
				macc_clear	= 1;
				buff_en     = 0;

                // if ($floor(pc_cnt / 8) < 8)...
                if (pc_cnt[8:3] < 9) nextstate = CALC_VEC_SUM;
                else nextstate = DONE_STATE;
            end
            DONE_STATE: begin
				done 		= 1;
				cnt_up		= 0;
                pc_up       = 0;
				macc_clear	= 1;
				buff_en     = 0;

                nextstate = DONE_STATE;
            end
			default: begin //Default to idle state outputs
				done 		= 0;
				cnt_up		= 0;
                pc_up       = 0;
				macc_clear	= 0;
				buff_en     = 0;

                if (start) nextstate = INITIALIZE;
                else nextstate = IDLE;
            end
		endcase		
	end

    // Sequential Logic for FSM.
	always@(posedge clk or posedge rst)begin
        if (rst) state <= IDLE;
        else state <= nextstate;
	end	

endmodule