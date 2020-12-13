`include "TLC.v"
`timescale 1ms/1ms

module TLC_tb;
wire [3:0]North_South,East_West;
reg reset,clock=1;

TLC uut(North_South,East_West,reset,clock);

always #167 clock=~clock;

initial begin

    $dumpfile("TLC_tb.vcd");
    $dumpvars(0,TLC_tb);

    reset=1; #300;
    reset=0; #14000;
    
    $finish;
end
endmodule
