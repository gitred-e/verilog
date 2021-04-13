// Design
module mealy_101_nov(
        output reg y,
        input i,resetn,clk);

reg [1:0] state,next;
parameter a='d0,b='d1,c='d2;

// Sequential logic
always @(posedge clk) begin
        if(!resetn)
                state<=a;
        else
                state<=next;
end

// Nextstate and Output combinational logic
always @(i,state) begin
        case(state)
                a:begin
                        y='b0;
                        next=i?b:a;
                end
                b:begin
                        y='b0;
                        next=i?b:c;
                end
                c:begin
                        y=i?1:0;
                        next=a;
                end
                default:begin
                        y='bx;
                        next=a;
                end
        endcase
end
endmodule

// Testbench
`timescale 1ns/1ps

module mealy_101_nov_TB;
wire y;
reg i,resetn,clk=0;

mealy_101_nov dut(y,i,resetn,clk);

always #1 clk=!clk;

initial begin
        #0.5;
        resetn=0; #2;
        resetn=1; i=1; #2;
        i=0; #2;
        i=1; #2;
        i=0; #2;
        i=1; #2;
        i=0; #2;
        i=1; #2;
        $finish();
end
endmodule
