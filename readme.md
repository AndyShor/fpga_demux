FPGA testing of verilog code to control ADG732  32 chanel DEMUX chip.
Assumed FPGA is iCESugar-nano, according to documentation https://github.com/wuxx/icesugar-nano
ice40 FPGA is LP1K and package type is CM36.

requires installed icestorm toolchain: yosys, nextpnr, iceprog.
For simulations requires iverilog, GTKwave. iCESugar-nano is supported by apio.
This version is for testing with a PMOD LED unit visualizing output channels.
LED unit uses common anode and logic signals must be inverted, which is done by pmod_inverter.v module.

in order to synthesise bitstream for a demo with inverting LED PMOD unit

$ make build_pmod 

in order to synthesise bitstream for controlling real demux chip

$ make build_demux 

in order to simulate

$ make sim

simulation has clock division of 100 instead of 10M for covenience transferred as a parameter

on the photo red wire sets rst to low, LEDs D7-D3 show value at 5-bit channel selection bus, D7 lowest bit D3 highest.

![photo](/img/fpga_led_test.jpg)

Switching tests with actual ADG732 chip. Signals measured with scope yellow trace - CS is set high prior to changing green trace WR L-> H,
that triggers actual switch.

![photo](/img/demux_signal.jpeg)

When connected to actual ADG732BSUZ on a break out board - performs switching as expected at 10 MHZ FPGA clock frequency.

![photo](/img/demux_switching.jpeg)

Design files for the break out board - coming
