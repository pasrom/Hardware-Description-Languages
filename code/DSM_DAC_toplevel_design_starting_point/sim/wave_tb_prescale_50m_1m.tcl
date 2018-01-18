onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_prescale_50m_1m/rst_n
add wave -noupdate /tb_prescale_50m_1m/clk50m
add wave -noupdate /tb_prescale_50m_1m/en50m_1m
add wave -noupdate /tb_prescale_50m_1m/run_sim
add wave -noupdate /tb_prescale_50m_1m/err_cnt
add wave -noupdate /tb_prescale_50m_1m/action
add wave -noupdate -divider Checker
add wave -noupdate -color Orange -itemcolor Orange /tb_prescale_50m_1m/err_cnt
add wave -noupdate /tb_prescale_50m_1m/en_hitime
add wave -noupdate /tb_prescale_50m_1m/en_period
add wave -noupdate /tb_prescale_50m_1m/t1
add wave -noupdate /tb_prescale_50m_1m/t2
add wave -noupdate /tb_prescale_50m_1m/t3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 225
configure wave -valuecolwidth 40
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
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {12705 ns}
