`default_nettype none
`timescale 1ns / 100ps

module pmod_inverter (
    input  wire       clk, // clock signal from the board
    input  wire       rst, // reset signal from the board
    output wire       ena_inv,         // inverted enable signal
    output wire       wr_inv,           // inverted write signal
    output wire       cs_inv,           // inverted chip select signal
    output wire [4:0] set_ch_inv  // inverted set output channel
);

demux #(.CLK_DIVIDER(24'd2000000)) uut (
    .clk(clk),
    .rst(rst),
    .ena(ena),
    .wr(wr),
    .cs(cs),
    .set_ch(set_ch)
);

wire ena;
wire wr;
wire cs;
wire [4:0] set_ch;

assign ena_inv = ~ena;
assign wr_inv = ~wr;
assign cs_inv = ~cs;
assign set_ch_inv = ~set_ch;

endmodule
