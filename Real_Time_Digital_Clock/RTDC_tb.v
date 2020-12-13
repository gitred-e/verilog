`include "RTDC.v"
`timescale 1s/1s

module RTDC_tb;
wire [3:0]SEC_L,SEC_M,MIN_L,MIN_M,HRL,HRM;
reg RST,CLK=0;

RTDC uut(SEC_L,SEC_M,MIN_L,MIN_M,HRL,HRM,CLK,RST);

always #1 CLK=~CLK;

initial begin

    $dumpfile("RTDC_tb.vcd");
    $dumpvars(0,RTDC_tb);

    RST=1; #3;
    RST=0; #200000;
    
    $finish;
end
endmodule
