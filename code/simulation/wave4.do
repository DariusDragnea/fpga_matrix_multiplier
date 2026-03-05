onerror {resume}
radix define part_2_FSM_state {
    "3'd0" "Idle" -color "cyan",
    "3'd1" "Initialize" -color "yellow",
    "3'd2" "Start_Vec_Sum" -color "light green",
    "3'd3" "Loop_Vec_Sum" -color "green",
    "3'd4" "End_Vec_Sum" -color "dark green",
    "3'd5" "Done_State" -color "purple",
    -default hexadecimal
    -defaultcolor cyan
}
radix define part_3_Main_FSM_state {
    "3'd0" "Idle" -color "cyan",
    "3'd1" "Initialize" -color "yellow",
    "3'd2" "Calc_Vec_Sum" -color "light green",
    "3'd3" "End_Vec_Sum" -color "dark green",
    "3'd4" "Stall_State" -color "dark blue",
    "3'd5" "Done_State" -color "purple",
    -default hexadecimal
    -defaultcolor cyan
}
radix define part_3_MAC_FSM_state {
    "3'd0" "Initialize" -color "cyan",
    "3'd1" "Idle" -color "yellow",
    "3'd2" "Start_C_State" -color "orange",
    "3'd3" "Slot_0_State" -color "green",
    "3'd4" "Slot_1_State" -color "blue",
    -default hexadecimal
    -defaultcolor cyan
}
radix define part_4_Main_FSM_state {
    "3'd0" "Idle" -color "cyan",
    "3'd1" "Initialize" -color "yellow",
    "3'd2" "Calc_Vec_Sum" -color "light green",
    "3'd3" "End_Vec_Sum" -color "green",
    "3'd4" "Stall_State" -color "blue",
    "3'd5" "Done_State" -color "purple",
    -default hexadecimal
    -defaultcolor cyan
}
radix define part_4_MAC_FSM_state {
    "4'd0" "Initialize" -color "cyan",
    "4'd1" "Idle" -color "yellow",
    "4'd2" "Slot_0_State" -color "green",
    "4'd3" "Slot_1_State" -color "green",
    "4'd4" "Slot_2_State" -color "green",
    "4'd5" "Slot_3_State" -color "green",
    "4'd6" "Slot_4_State" -color "green",
    "4'd7" "Slot_5_State" -color "green",
    "4'd8" "Slot_6_State" -color "green",
    "4'd9" "Slot_7_State" -color "blue",
    -default hexadecimal
    -defaultcolor cyan
}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /tb_lab6/DUT/clk
add wave -noupdate -radix binary /tb_lab6/DUT/rst
add wave -noupdate -radix binary /tb_lab6/DUT/start
add wave -noupdate -radix binary /tb_lab6/DUT/done
add wave -noupdate -radix unsigned /tb_lab6/DUT/clk_cnt
add wave -noupdate -radix unsigned /tb_lab6/DUT/pc_cnt
add wave -noupdate -radix unsigned /tb_lab6/DUT/sel
add wave -noupdate -radix binary /tb_lab6/DUT/cnt_up
add wave -noupdate -radix binary /tb_lab6/DUT/pc_up
add wave -noupdate -radix binary /tb_lab6/DUT/macc_clear
add wave -noupdate -radix binary /tb_lab6/DUT/C_wrm
add wave -noupdate -radix binary /tb_lab6/DUT/buff_en
add wave -noupdate -radix binary /tb_lab6/DUT/c_i_counter_en
add wave -noupdate -radix unsigned /tb_lab6/DUT/a0_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/a1_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/a2_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/a3_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/a4_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/a5_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/a6_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/a7_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/b_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/c_i
add wave -noupdate -radix decimal /tb_lab6/DUT/ramA0_data
add wave -noupdate -radix decimal /tb_lab6/DUT/ramA1_data
add wave -noupdate -radix decimal /tb_lab6/DUT/ramA2_data
add wave -noupdate -radix decimal /tb_lab6/DUT/ramA3_data
add wave -noupdate -radix decimal /tb_lab6/DUT/ramA4_data
add wave -noupdate -radix decimal /tb_lab6/DUT/ramA5_data
add wave -noupdate -radix decimal /tb_lab6/DUT/ramA6_data
add wave -noupdate -radix decimal /tb_lab6/DUT/ramA7_data
add wave -noupdate -radix decimal /tb_lab6/DUT/ramB_data
add wave -noupdate -radix decimal /tb_lab6/DUT/ramC_in
add wave -noupdate -radix decimal /tb_lab6/DUT/macc0_out
add wave -noupdate -radix decimal /tb_lab6/DUT/macc1_out
add wave -noupdate -radix decimal /tb_lab6/DUT/macc2_out
add wave -noupdate -radix decimal /tb_lab6/DUT/macc3_out
add wave -noupdate -radix decimal /tb_lab6/DUT/macc4_out
add wave -noupdate -radix decimal /tb_lab6/DUT/macc5_out
add wave -noupdate -radix decimal /tb_lab6/DUT/macc6_out
add wave -noupdate -radix decimal /tb_lab6/DUT/macc7_out
add wave -noupdate -radix decimal /tb_lab6/DUT/buff_0_out
add wave -noupdate -radix decimal /tb_lab6/DUT/buff_1_out
add wave -noupdate -radix decimal /tb_lab6/DUT/buff_2_out
add wave -noupdate -radix decimal /tb_lab6/DUT/buff_3_out
add wave -noupdate -radix decimal /tb_lab6/DUT/buff_4_out
add wave -noupdate -radix decimal /tb_lab6/DUT/buff_5_out
add wave -noupdate -radix decimal /tb_lab6/DUT/buff_6_out
add wave -noupdate -radix decimal /tb_lab6/DUT/buff_7_out
add wave -noupdate -radix part_4_Main_FSM_state /tb_lab6/DUT/main_controller/state
add wave -noupdate -radix part_4_Main_FSM_state /tb_lab6/DUT/main_controller/nextstate
add wave -noupdate -radix part_4_MAC_FSM_state /tb_lab6/DUT/mac_controller/state
add wave -noupdate -radix part_4_MAC_FSM_state /tb_lab6/DUT/mac_controller/nextstate
add wave -noupdate /tb_lab6/DUT/RAMOUTPUT/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {258530 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 187
configure wave -valuecolwidth 107
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {170560 ps}
