file = pmod_inverter
testbench = cable_tester_tb
pcf = io.pcf

build:
	yosys -p "synth_ice40 -top cable_tester_inverter -json $(file).json" $(file).v 
	nextpnr-ice40 --lp1k --package cm36 --json  $(file).json --pcf $(pcf) --asc $(file).asc
	icepack $(file).asc $(file).bin

sim:
	iverilog -o $(testbench).vvp $(testbench).v $(file).v
	vvp $(testbench).vvp
	gtkwave $(testbench).vcd
	
	
