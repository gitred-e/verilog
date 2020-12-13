// Full-Adder module
module fa(cout,s,a,b,cin);

	input a,b,cin;
	output cout,s;

	assign cout = (a&b) | (b&cin) | (cin&a);
	assign s = a ^ b ^ cin;
endmodule


// Half-Adder module
module ha(c,s,a,b);

	input a,b;
	output c,s;

	assign c = a&b;
	assign s = a^b;
endmodule


// Counting module
module count(NUM,IN);

	input [7:0]IN;
	output [3:0]NUM;

	wire [1:0]A,B,D,E;
	wire [2:0]F,G;
	wire X1,X2,X3,X4;

	// Stage-1
	ha ha0(A[1],A[0],IN[0],IN[1]);
	ha ha1(B[1],B[0],IN[2],IN[3]);
	ha ha2(D[1],D[0],IN[4],IN[5]);
	ha ha3(E[1],E[0],IN[6],IN[7]);

	// Stage-2
	ha ha4(X1,F[0],A[0],B[0]);
	fa fa1(F[2],F[1],A[1],B[1],X1);
	ha ha5(X2,G[0],D[0],E[0]);
	fa fa2(G[2],G[1],D[1],E[1],X2);

	// Stage-3
	ha ha6(X3,NUM[0],F[0],G[0]);
	fa fa3(X4,NUM[1],F[1],G[1],X3);
	fa fa4(NUM[3],NUM[2],F[2],G[2],X4);
endmodule
