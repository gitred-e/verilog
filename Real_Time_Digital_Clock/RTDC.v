module RTDC(
	output reg [3:0]SEC_L,SEC_M,MIN_L,MIN_M,HRL,HRM,
	input CLK,RST
);

always @(posedge CLK) begin
	if(RST) begin
		SEC_L='d0;
		SEC_M='d0;
		MIN_L='d0;
		MIN_M='d0;
		HRL='d0;
		HRM='d0;
	end
	else begin
		if(SEC_L=='d9) begin
			SEC_L='d0;
			if(SEC_M=='d5) begin
				SEC_M='d0;
			end
			else begin
				SEC_M=SEC_M+1;
			end
		end
		else begin
			SEC_L=SEC_L+1;
		end
		if(SEC_M=='d0 && SEC_L=='d0) begin
			if(MIN_L=='d9) begin
				MIN_L='d0;
				if(MIN_M=='d5) begin
					MIN_M='d0;
				end
				else begin
					MIN_M=MIN_M+1;
				end
			end
			else begin
				MIN_L=MIN_L+1;
			end
			if(MIN_L=='d0 && MIN_M=='d0) begin
				if(HRL=='d9) begin
					HRL='d0;
					HRM=HRM+1;
				end
				else begin
					if(HRM=='d2 && HRL=='d3) begin
						HRL='d0;
						HRM='d0;
					end
					else begin
						HRL=HRL+1;
					end
				end
			end
		end
	end
end
endmodule

