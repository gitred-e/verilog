module js #(parameter N=5)
    (
        output reg [N-1:0]q,
        input reset,clock
    );

always @(posedge clock) begin
   if(reset) q<=0;
   else      q<={~q[0],q[N-1:1]}; 
end
endmodule
