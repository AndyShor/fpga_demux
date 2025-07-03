// timescale time precision
`timescale 1ns/10ps

//define testbench as a generic module

module cable_tester_tb();

// internal signals

wire [4:0] set_ch;
wire ena;
wire cs;
wire wr;




// storage elements (set initial values to zero)

reg clk = 0;
reg rst = 0;

// set parameters

localparam DURATION=40000;

// generate substitute clock signal 1/((2*41.67)*1ns)=11.999040.08 MHz

always begin

    //delay for 41.67 time units (ns) 
    #41.667
    clk=~clk;

end

// instantiate unit under test

main uut(
    .clk(clk),
    .rst(rst), 
    .set_ch(set_ch)
);



initial begin
    #100
    rst=1'b1;
    #200
    rst=1'b0;
end

// run simulation

initial begin

    $dumpfile("cable_tester_tb.vcd");
    $dumpvars(0, cable_tester_tb);
    #(DURATION)
    $display("finished");
    $finish;
end




endmodule