module sp_sram(
    output reg [7:0]dout,
    input [7:0]din,
    input [2:0]addr,
    input wr_en,rst,clk
);

reg [7:0]sram[0:7];

always @(posedge clk)
begin
if(rst)        dout       <= 'd0;
else if(wr_en) sram[addr] <= din;
else           dout       <= sram[addr];
end

endmodule