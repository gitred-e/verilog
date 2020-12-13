module rc #(parameter N=5)
    (
        output reg[N-1:0]q,
        input reset,clock
    );

always @(posedge clock) begin
   if(reset) begin
       q[N-1]<=1;
       q[N-2:0]<=0;
   end
   else q<={q[0],q[N-1:1]}; 
end
endmodule
