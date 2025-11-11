`timescale 1ns / 1ps


module CLAbitSlice(input A, input B, input CarryIn, output P, output S, output G);

assign P = A^B;
assign S = P^CarryIn;
assign G = A&B;

endmodule
