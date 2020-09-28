quit -sim

vlib alteraa
vdel -lib alteraa -all
vlib work
vdel -lib work -all

vlib alteraa
vlog -work alteraa altera_mf.v
vlog -work alteraa ../../par/altera/ip/dcfifo_128b_16.v

vlib work
vlog -work work ../../rtl/tsu/tsu.v
vlog -work work ../../rtl/tsu/ptp_parser.v
vlog -work work ../../rtl/tsu/ptp_queue.v +initreg+0 +incdir+../../par/altera/ip
vlog -work work gmii_rx_bfm.v
vlog -work work gmii_tx_bfm.v
vlog -work work tsu_queue_tb.v
vsim -novopt -L alteraa work.tsu_queue_tb

log -r */*
radix -hexadecimal
do wave.do

run -all
