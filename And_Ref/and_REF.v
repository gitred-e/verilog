module and_REF(
    output reg y_r,
    input a_r,b_r
);
always @(*)
begin
   if(a_r == 1 && b_r == 1) y_r=1;
   else                     y_r=0; 
end
endmodule
