FPGA testing of verilog code to control ADG732  32 chanel DEMUX chip.
Assumed FPGA is iCESugar-nano, according to documentation https://github.com/wuxx/icesugar-nano
ice40 FPGA is LP1K and package type is CM36.

requires installed icestorm toolchain: yosys, nextpnr, iceprog.
For simulations requires iverilog, GTKwave. iCESugar-nano is supported by apio.
This version is for testing with a PMOD LED unit visualizing output channels.
LED unit uses common anode and logic signals must be inverted, which is done by pmod_inverter.v module.

in order to synthesise bitstream

$ make build 

in order to simulate

$ make sim

on the photo red wire sets rst to low, LEDs D7-D3 show value at 5-bit channel selection bus, D7 lowest bit D3 highest.

![photo](/img/fpga_led_test.jpg)
