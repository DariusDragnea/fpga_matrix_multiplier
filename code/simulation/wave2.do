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
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /tb_lab6/clk
add wave -noupdate -radix binary /tb_lab6/start
add wave -noupdate -radix binary /tb_lab6/reset
add wave -noupdate -radix binary /tb_lab6/done
add wave -noupdate -radix unsigned /tb_lab6/clock_count
add wave -noupdate -radix binary /tb_lab6/DUT/macc/macc_clear
add wave -noupdate -radix binary /tb_lab6/DUT/macc_en
add wave -noupdate -radix binary /tb_lab6/DUT/RAMOUTPUT/mwr
add wave -noupdate -radix decimal /tb_lab6/DUT/RAMOUTPUT/mdi
add wave -noupdate -radix unsigned /tb_lab6/DUT/RAMOUTPUT/addr
add wave -noupdate -radix part_2_FSM_state /tb_lab6/DUT/controller/state
add wave -noupdate -radix part_2_FSM_state /tb_lab6/DUT/controller/nextstate
add wave -noupdate -radix unsigned /tb_lab6/DUT/in_A/a_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/in_B/b_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/in_C/c_i
add wave -noupdate -radix unsigned /tb_lab6/DUT/RAMA/addr
add wave -noupdate -radix decimal /tb_lab6/DUT/RAMA/mdo
add wave -noupdate -radix unsigned /tb_lab6/DUT/RAMB/addr
add wave -noupdate -radix decimal /tb_lab6/DUT/RAMB/mdo
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 211
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
WaveRestoreZoom {0 ps} {120320 ps}
