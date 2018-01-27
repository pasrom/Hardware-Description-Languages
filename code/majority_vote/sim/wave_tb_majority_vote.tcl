onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_majority_vote/x0
add wave -noupdate /tb_majority_vote/x1
add wave -noupdate /tb_majority_vote/x2
add wave -noupdate -divider outputs
add wave -noupdate /tb_majority_vote/y_assign
add wave -noupdate -color Blue -itemcolor Blue /tb_majority_vote/y_case
add wave -noupdate -color {Orange Red} -itemcolor {Orange Red} /tb_majority_vote/y_if
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {381877 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 188
configure wave -valuecolwidth 50
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {924 ns}
