module part4_mac_controller_v2 (
	input clk, rst, buff_en,
    output reg [2:0] sel,
    output reg c_i_counter_en,
    output reg C_wrm
);

    reg [3:0] state, nextstate;

    localparam INITIALIZE    = 4'd0,
               IDLE          = 4'd1,
               SLOT_0_STATE  = 4'd2,
               SLOT_1_STATE  = 4'd3,
               SLOT_2_STATE  = 4'd4,
               SLOT_3_STATE  = 4'd5,
               SLOT_4_STATE  = 4'd6,
               SLOT_5_STATE  = 4'd7,
               SLOT_6_STATE  = 4'd8,
               SLOT_7_STATE  = 4'd9,
               STALL_STATE   = 4'd10;

    // Combinational Logic for FSM.
    always @(*) begin
        case(state)
            INITIALIZE: begin  // Used after reset to set c_i = 0.
                sel   = 0;
                C_wrm = 0;
                c_i_counter_en = 0;

                if (!rst) nextstate = IDLE;
                else nextstate = INITIALIZE;
            end
            IDLE: begin
                sel   = 0;
                C_wrm = 0;
                c_i_counter_en = 0;

                if (buff_en) nextstate = SLOT_0_STATE;
                else nextstate = IDLE;               
            end
            SLOT_0_STATE: begin
                sel   = 0;
                C_wrm = 1;
                c_i_counter_en = 1;

                nextstate = SLOT_1_STATE;
            end
            SLOT_1_STATE: begin
                sel   = 1;
                C_wrm = 1;
                c_i_counter_en = 1;

                nextstate = SLOT_2_STATE;
            end
            SLOT_2_STATE: begin
                sel   = 2;
                C_wrm = 1;
                c_i_counter_en = 1;

                nextstate = SLOT_3_STATE;
            end
            SLOT_3_STATE: begin
                sel   = 3;
                C_wrm = 1;
                c_i_counter_en = 1;

                nextstate = SLOT_4_STATE;
            end
            SLOT_4_STATE: begin
                sel   = 4;
                C_wrm = 1;
                c_i_counter_en = 1;

                nextstate = SLOT_5_STATE;
            end
            SLOT_5_STATE: begin
                sel   = 5;
                C_wrm = 1;
                c_i_counter_en = 1;

                nextstate = SLOT_6_STATE;
            end
            SLOT_6_STATE: begin
                sel   = 6;
                C_wrm = 1;
                c_i_counter_en = 1;

                nextstate = SLOT_7_STATE;
            end
            SLOT_7_STATE: begin
                sel   = 7;
                C_wrm = 1;
                c_i_counter_en = 1;

                nextstate = STALL_STATE;
            end
            STALL_STATE: begin
                sel   = 0;
                C_wrm = 0;
                c_i_counter_en = 0;

                nextstate = SLOT_0_STATE;
            end
            default: begin // Default to INITALIZE outputs
                sel   = 0;
                C_wrm = 0;
                c_i_counter_en = 0;

                if (!rst) nextstate = IDLE;
                else nextstate = INITIALIZE;
            end
        endcase
    end


    // Sequential Logic for FSM.
    always @(posedge clk or posedge rst) begin
        if (rst) state <= INITIALIZE;
        else state <= nextstate;
    end

endmodule