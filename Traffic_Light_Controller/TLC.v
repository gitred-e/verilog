module TLC(
	output reg [3:0]North_South,East_West,
	input reset,clock
);
parameter zero  =3'd0;
parameter one   =3'd1;
parameter two   =3'd2;
parameter three =3'd3;
parameter four  =3'd4;
parameter five  =3'd5;
parameter red   =4'd1;
parameter green =4'd2;
parameter yellow=4'd4;
reg [3:0]count;
reg [2:0]state;

always @(posedge clock) begin
	if(reset) begin
		state<=zero;
		count<=4'd0;
		North_South<=4'd0;
		East_West<=4'd0;
	end
	else begin
		case(state)
			zero:begin
				if(count<4'd14) begin
					state<=zero;
					count<=count+4'd1;
					North_South<=green;
					East_West<=red;
				end
				else begin
					state<=one;
					count<=4'd0;
				end
			end
			one:begin
				if(count<4'd2) begin
					state<=one;
					count<=count+4'd1;	
					North_South<=yellow;
					East_West<=red;
				end
				else begin
					state<=two;
					count<=4'd0;
				end
			end
			two:begin
				if(count<4'd2) begin
					state<=two;
					count<=count+4'd1;
					North_South<=red;
					East_West<=red;
				end
				else begin
					state<=three;
					count<=4'd0;
				end
			end
			three:begin
				if(count<4'd14) begin
					state<=three;
					count<=count+4'd1;
					North_South<=red;
					East_West<=green;
				end
				else begin
					state<=four;
					count<=4'd0;
				end
			end
			four:begin
				if(count<4'd2) begin
					state<=four;
					count<=count+4'd1;
					North_South<=red;
					East_West<=yellow;
				end
				else begin
					state<=five;
					count<=4'd0;
				end
			end
			five:begin
				if(count<4'd2) begin
					state<=five;
					count<=count+4'd1;
					North_South<=red;
					East_West<=red;
				end
				else begin
					state<=zero;
					count<=4'd0;
				end
			end
			default:state<=zero;
		endcase
	end
end
endmodule
