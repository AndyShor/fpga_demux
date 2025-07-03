FPGA testing of verilog code to control ADG732 DEMUX 32 chanel chip.
Assumed FPGA is iCESugar-nano, according to documentation https://github.com/wuxx/icesugar-nano
ice40 FPGA is LP1K and package type is CM36.

requires installed icestorm toolchain, yosys, nextpnr
for simulations require iverilog, GTKwave
iCESugar-nano is supported by apio

in order to synthesise bitstream

$ make build 

in order to simulate

$ make sim
