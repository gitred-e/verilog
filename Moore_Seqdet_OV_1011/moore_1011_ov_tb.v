`include "moore_1011_ov.v"
`timescale 1ns/1ns

module moore_1011_ov_TB;
reg inp,reset,clk=0;
wire oup;

moore_1011_ov uut(oup,inp,reset,clk);

always #2 clk=~clk;

initial begin
    
    $dumpfile("moore_1011_ov_TB.vcd");
    $dumpvars(0,moore_1011_ov_TB);

    inp=0; reset=1; #1;
    reset=0; inp=1; #2;
    inp=0; #6;
    inp=1; #8;
    inp=0; #4;
    inp=1; #2;
    inp=0; #2;
    inp=1; #2;
    inp=0; #5;
        
    $display("Test Complete.");
    $finish;
end
endmodule
