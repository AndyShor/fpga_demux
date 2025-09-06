file = demux
testbench = demux_tb
inverter = pmod_inverter
pcf = io.pcf
inv_pcf = inverter_io.pcf


build_demux:
	yosys -p "synth_ice40 -top $(file) -json $(file).json" $(file).v $(testbench).v 
	nextpnr-ice40 --lp1k --package cm36 --json  $(file).json --pcf $(pcf) --asc $(file).asc
	icepack $(file).asc $(file).bin

build_pmod:
	yosys -p "synth_ice40 -top $(inverter) -json $(inverter).json" $(inverter).v $(file).v 
	nextpnr-ice40 --lp1k --package cm36 --json  $(inverter).json --pcf $(inv_pcf) --asc $(inverter).asc
	icepack $(inverter).asc $(inverter).bin


sim:
	iverilog -o $(testbench).vvp $(testbench).v $(file).v
	vvp $(testbench).vvp
	gtkwave $(testbench).vcd
	
	
