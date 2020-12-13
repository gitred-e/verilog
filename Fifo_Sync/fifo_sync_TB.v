`timescale 1ns/1ps
`include "fifo_sync.v"

module fifo_sync_TB;

wire full_t,empty_t;
wire [4:0]dout_t;
reg [4:0]din_t;
reg wen_t,ren_t,rst_t,clock_t;

integer i;

fifo_sync dut(
    .full(full_t),
    .empty(empty_t),
    .dout(dout_t),
    .din(din_t),
    .wen(wen_t),
    .ren(ren_t),
    .rst(rst_t),
    .clock(clock_t)
);

initial
begin
   $dumpfile("fifo_sync_TB.vcd");
   $dumpvars;
   #140;
   $finish;
end

initial
begin
   din_t='d0; wen_t=0; ren_t=0; rst_t=0; clock_t=0;
   forever #5 clock_t=!clock_t; 
end

initial
begin
    reset();
    #6;
    write();
    #1;
    read();
end

// RESET
task reset;
begin
    #3;
    rst_t=1;
    #4;
    rst_t=0;
end
endtask

// WRITE
task write;
begin
    wen_t=1;
    for(i=0;i<5;i=i+1)
    begin
        din_t=$random;
        #10;
    end
    wen_t=0;
end
endtask

// READ
task read;
begin
    ren_t=1;
    #50;
    ren_t=0;
end
endtask
endmodule