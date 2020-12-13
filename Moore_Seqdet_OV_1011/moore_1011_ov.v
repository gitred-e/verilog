module moore_1011_ov(
    output reg oup,
    input inp,reset,clk
);
parameter zero ='b000;
parameter one  ='b001;
parameter two  ='b010;
parameter three='b011;
parameter four ='b100;
reg [3:1]state,next;
reg n_oup;

always @(posedge clk,posedge reset)
    if(reset) state<='b000;
    else      state<=next;

always @(*) begin
    next='bxxx;
    case(state)
    zero : if(inp) next=one;
           else    next=zero;
    one  : if(inp) next=one;
           else    next=two;
    two  : if(inp) next=three;
           else    next=zero;
    three: if(inp) next=four;
           else    next=two;
    four : if(inp) next=one;
           else    next=two;
    default:       next='bxxx;
endcase
end

always @(*) begin
    n_oup='b0;
    case(state)
    zero : if(inp)  n_oup='b0;
           else ;
    one  : if(!inp) n_oup='b0;
           else ;
    two  : if(inp)  n_oup='b0;
           else ;
    three: if(inp)  n_oup='b1;
           else ;
    four : ;
    default:        n_oup='bx;
endcase
end

always @(posedge clk,posedge reset)
    if(reset) oup<=0;
    else      oup<=n_oup;
endmodule
