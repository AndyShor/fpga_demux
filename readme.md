FPGA testing of verilog code to control ADG732 DEMUX 32 chanel chip.
Assumed FPGA is iCESugar-nano, according to documentation https://github.com/wuxx/icesugar-nano
ice40 FPGA is LP1K and package type is CM36.

requires installed icestorm toolchain, yosys, nextpnr
for simulations require iverilog, GTKwave
iCESugar-nano is supported by apio

in order to synthesise bitstream for a demo with inverting LED PMOD unit

$ make build_pmod 

in order to synthesise bitstream for controlling real demux chip

$ make build_demux 

in order to simulate

$ make sim

simulation has clock division of 100 instead of 10M for covenience
