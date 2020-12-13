`include "rc.v"
`timescale 1ns/1ps

module rc_TB;
parameter N=5;
wire [N-1:0]q;
reg reset,clock=0;

rc uut(q,reset,clock);

always #2 clock=~clock;

initial begin

   $dumpfile("rc_TB.vcd");
   $dumpvars;

   reset=1; #3;
   reset=0; #25;
   
   $finish;
end
endmodule
