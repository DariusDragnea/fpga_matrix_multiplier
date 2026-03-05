module part3_mac_controller (
	input clk, rst, buff_en,
    output reg c_i_counter_en,
    output reg sel, C_wrm
);

    reg [2:0] state, nextstate;

    localparam INITIALIZE    = 3'd0,
               IDLE          = 3'd1,
               //START_C_STATE = 3'd2,
               SLOT_0_STATE  = 3'd3,
               SLOT_1_STATE  = 3'd4;

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
            /*
            START_C_STATE: begin
                sel   = 0;
                C_wrm = 1;
                c_i_counter_en = 1;

                nextstate = SLOT_0_STATE;               
            end
            */
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

                nextstate = IDLE;
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