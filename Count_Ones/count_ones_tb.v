`timescale 1ns/1ns
`include "count_ones.v"

module count_TB;
reg [7:0]IN;
wire [3:0]NUM;

count uut(NUM,IN);

initial begin
			
	$dumpfile("count_TB.vcd");
	$dumpvars(0,count_TB);
	
	IN=8'B0000_0000; #5;
	IN=8'B1011_0101; #5;
	IN=8'B1110_0100; #5;
	IN=8'B1111_1111; #5;
	
	$display("Test Completed.");
	$finish;
end
endmodule
