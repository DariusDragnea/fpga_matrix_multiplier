module part2_controller(
    input clk, rst, start, 
    input [10:0] clk_cnt,
    output reg done, cnt_up_en, macc_clear, ramC_wrm 
);

    reg [2:0] state, nextstate;

    localparam IDLE          = 3'd0,
               INITIALIZE    = 3'd1,
               START_VEC_SUM = 3'd2,
               LOOP_VEC_SUM  = 3'd3,
               END_VEC_SUM   = 3'd4,
               DONE_STATE    = 3'd5;

    // Combinational Logic for FSM.
    always @(*) begin
        case(state)
            IDLE: begin
                done       = 0;
                cnt_up_en  = 0;
                macc_clear = 0;
                ramC_wrm   = 0;

                if (start) nextstate = INITIALIZE;
                else nextstate = IDLE;
            end
            INITIALIZE: begin
                done       = 0;
                cnt_up_en  = 1;
                macc_clear = 1;
                ramC_wrm   = 0;

                nextstate = LOOP_VEC_SUM;
            end
            START_VEC_SUM: begin
                done       = 0;
                cnt_up_en  = 1;
                macc_clear = 0;
                ramC_wrm   = 0;

                nextstate = LOOP_VEC_SUM;
            end
            LOOP_VEC_SUM: begin
                done       = 0;
                cnt_up_en  = 1;
                macc_clear = 0;
                ramC_wrm   = 0;

                // if (clk_cnt % 8 == 7) ...
                if ({1'b0, clk_cnt[2:0]} == 7) nextstate = END_VEC_SUM;
                else nextstate = LOOP_VEC_SUM;
            end
            END_VEC_SUM: begin
                done       = 0;
                cnt_up_en  = 1;
                macc_clear = 1;
                ramC_wrm   = 1;

                // if ($floor(clk_cnt / 8) < 63) ...
                if (clk_cnt[8:3] < 63) nextstate = START_VEC_SUM;
                else nextstate = DONE_STATE;
            end
            DONE_STATE: begin
                done       = 1;
                cnt_up_en  = 0;
                macc_clear = 1;
                ramC_wrm   = 0;

                nextstate = DONE_STATE;
            end
            default: begin  // Default to IDLE outputs
                done       = 0;
                cnt_up_en  = 0;
                macc_clear = 0;
                ramC_wrm   = 0;
            end
        endcase
    end

    // Sequential Logic for FSM.
    always @(posedge clk or posedge rst) begin
        if (rst) state <= IDLE;
        else state <= nextstate;
    end

endmodule