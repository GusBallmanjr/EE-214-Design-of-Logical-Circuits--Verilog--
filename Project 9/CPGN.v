`timescale 1ns / 1ps


module CPGN(input [3:0] A, input [3:0] B, output [3:0] sum); 

wire G0, G1, G2, G3, P0, P1, P2, P3, CI0, CI1, CI2, CI3;
assign CI0 = 1'b0;
assign CI1 = G0|(P0&CI0);
assign CI2 = G1|(P1&G0)|(P1&P0&CI0);
assign CI3 = G2|(P2&G1)|(P2&P1&G0)|(P2&P1&P0&CI0);

CLAbitSlice CLABit0(.A(A[0]), .B(B[0]), .CarryIn(CI0), .P(P0), .S(sum[0]), .G(G0));
CLAbitSlice CLABit1(.A(A[1]), .B(B[1]), .CarryIn(CI1), .P(P1), .S(sum[1]), .G(G1));
CLAbitSlice CLABit2(.A(A[2]), .B(B[2]), .CarryIn(CI2), .P(P2), .S(sum[2]), .G(G2));
CLAbitSlice CLABit3(.A(A[3]), .B(B[3]), .CarryIn(CI3), .P(P3), .S(sum[3]), .G(G3));

endmodule
