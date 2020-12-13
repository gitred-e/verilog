`timescale 1ns/1ps
`include "sp_sram.v"

module sp_sram_TB;
wire [7:0]dout_T;
reg [7:0]din_T;
reg [2:0]addr_T;
reg wr_en_T,rst_T,clk_T=0;
integer i,j;

sp_sram dut(dout_T,din_T,addr_T,wr_en_T,rst_T,clk_T);

always #1 clk_T = !clk_T;

initial
begin
    stimuli_gen_wr(0,1,8'd0,3'd0);

    for(i=0;i<8;i=i+1)
    stimuli_gen_wr(1,0,$random,i);
    
    for(j=0;j<8;j=j+1)
    stimuli_gen_rd(0,0,j);
end

task stimuli_gen_wr;
input wr_en_wk,rst_wk;
input [7:0]din_wk;
input [2:0]addr_wk;
begin
    wr_en_T = wr_en_wk;
    rst_T   = rst_wk;
    din_T   = din_wk;
    addr_T  = addr_wk;
    @(posedge clk_T);
    #1;
end
endtask

task stimuli_gen_rd;
input wr_en_rk,rst_rk;
input [2:0]addr_rk;
begin
    wr_en_T = wr_en_rk;
    rst_T   = rst_rk;
    addr_T  = addr_rk;
    @(posedge clk_T);
    #1;
end
endtask

initial
begin
   $dumpfile("sp_sram_TB.vcd");
   $dumpvars;
   #30;
   $finish;
end

endmodule