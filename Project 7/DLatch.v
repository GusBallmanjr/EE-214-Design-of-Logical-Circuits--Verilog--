`timescale 1ns / 1ps


module DLatch(input D, input G, output Q1, output Q2);

wire X1, X2;
assign #10 X1 = !(D&G);
assign #10 X2 = !(~D&G);
assign #10 Q1 = ~X1|~Q2;
assign #10 Q2 = !(X2&Q1);
endmodule
