`include "and_d.v"
`include "and_REF.v"
`timescale 1ns/1ps

module and_TB;
wire y_t,y_e;
reg a_t,b_t;

and_d dut(y_t,a_t,b_t);
and_TB dut_r(y_e,a_t,b_t);

initial
begin
   stimuli($random,$random);
   stimuli($random,$random);
   stimuli($random,$random);
   stimuli($random,$random); 
end

task stimuli;
input a_k,b_k;
begin
   a_t=a_k;
   b_t=b_k;
   #10;
   if(y_e == y_t)
   $display("Test correct");
   else
   $display("Test Incorrect");
end
endtask

initial
begin
   $dumpfile("and_TB.vcd");
   $dumpvars; 
end

endmodule
