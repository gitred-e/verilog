module fifo_sync(
    output full,empty,
    output reg [4:0]dout,
    input [4:0]din,
    input wen,ren,rst,clock
);
reg [2:0]wptr,rptr;
reg [2:0]count;
reg [4:0]mem[0:4];

// Full and Empty
assign full=(count==5);
assign empty=(count==0);

// Write only
always @(posedge clock)
begin
    if(rst) wptr<='d0;
    else if(wen)
    begin
        mem[wptr]<=din;
        wptr<=wptr+1;
    end
end

// Read only
always @(posedge clock)
begin
    if(rst) rptr<='d0;
    else if(ren)
    begin
        dout<=mem[rptr];
        rptr<=rptr+1;
    end
end

// Count updation
always @(posedge clock)
begin
    if(rst) count<='d0;
    else
    begin
        case({wen,ren})
        2'b10:count<=count+1;
        2'b01:count<=count-1;
        2'b11:count<=count;
        2'b00:count<=count;
        default:count<=count;
        endcase
    end
end
endmodule


