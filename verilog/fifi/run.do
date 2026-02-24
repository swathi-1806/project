vlib work
vlog fifo1_tb.v
vsim top +testcase=test_5wr_5rd
add wave -position insertpoint sim:/top/dut/*
run -all
