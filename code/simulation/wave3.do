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
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_lab6/clk
add wave -noupdate /tb_lab6/start
add wave -noupdate /tb_lab6/reset
add wave -noupdate -radix binary /tb_lab6/done
add wave -noupdate -radix binary /tb_lab6/DUT/cnt_up
add wave -noupdate -radix binary /tb_lab6/DUT/pc_up
add wave -noupdate -radix decimal /tb_lab6/DUT/clk_cnt
add wave -noupdate -radix decimal /tb_lab6/DUT/pc_cnt
add wave -noupdate -radix binary /tb_lab6/DUT/sel
add wave -noupdate -radix binary /tb_lab6/DUT/macc_clear
add wave -noupdate -radix binary /tb_lab6/DUT/C_wrm
add wave -noupdate -radix binary /tb_lab6/DUT/buff_en
add wave -noupdate -radix decimal /tb_lab6/DUT/A0_data
add wave -noupdate -radix decimal /tb_lab6/DUT/A1_data
add wave -noupdate -radix decimal /tb_lab6/DUT/B_data
add wave -noupdate -radix decimal /tb_lab6/DUT/ramC_in
add wave -noupdate -radix decimal /tb_lab6/DUT/macc0_out
add wave -noupdate -radix decimal /tb_lab6/DUT/macc1_out
add wave -noupdate -radix unsigned /tb_lab6/DUT/a0_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/a1_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/b_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/c_i
add wave -noupdate -radix binary /tb_lab6/DUT/c_i_counter_en
add wave -noupdate -radix part_3_Main_FSM_state /tb_lab6/DUT/main_controller/state
add wave -noupdate -radix part_3_Main_FSM_state /tb_lab6/DUT/main_controller/nextstate
add wave -noupdate -radix part_3_MAC_FSM_state /tb_lab6/DUT/mac_controller/state
add wave -noupdate -radix part_3_MAC_FSM_state /tb_lab6/DUT/mac_controller/nextstate
add wave -noupdate -radix decimal -childformat {{{/tb_lab6/DUT/RAMOUTPUT/mem[63]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[62]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[61]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[60]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[59]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[58]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[57]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[56]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[55]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[54]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[53]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[52]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[51]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[50]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[49]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[48]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[47]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[46]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[45]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[44]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[43]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[42]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[41]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[40]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[39]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[38]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[37]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[36]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[35]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[34]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[33]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[32]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[31]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[30]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[29]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[28]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[27]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[26]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[25]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[24]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[23]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[22]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[21]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[20]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[19]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[18]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[17]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[16]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[15]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[14]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[13]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[12]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[11]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[10]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[9]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[8]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[7]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[6]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[5]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[4]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[3]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[2]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[1]} -radix decimal} {{/tb_lab6/DUT/RAMOUTPUT/mem[0]} -radix decimal}} -subitemconfig {{/tb_lab6/DUT/RAMOUTPUT/mem[63]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[62]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[61]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[60]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[59]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[58]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[57]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[56]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[55]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[54]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[53]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[52]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[51]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[50]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[49]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[48]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[47]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[46]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[45]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[44]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[43]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[42]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[41]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[40]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[39]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[38]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[37]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[36]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[35]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[34]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[33]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[32]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[31]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[30]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[29]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[28]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[27]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[26]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[25]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[24]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[23]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[22]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[21]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[20]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[19]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[18]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[17]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[16]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[15]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[14]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[13]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[12]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[11]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[10]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[9]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[8]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[7]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[6]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[5]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[4]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[3]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[2]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[1]} {-height 15 -radix decimal} {/tb_lab6/DUT/RAMOUTPUT/mem[0]} {-height 15 -radix decimal}} /tb_lab6/DUT/RAMOUTPUT/mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 216
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {384470 ps}
