`include "js.v"
`timescale 1ns/1ps

module js_TB;
parameter N=5;
wire [N-1:0]q;
reg reset,clock=0;

js uut(q,reset,clock);

always #2 clock=~clock;

initial begin

   $dumpfile("js_TB.vcd");
   $dumpvars;

   reset=1; #3;
   reset=0; #50;
   
   $finish; 
end
endmodule
