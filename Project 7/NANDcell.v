`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Gus Ballman
// Create Date: 10/23/2025
// Design Name: NAND Basic Cell
// Module Name: NANDcell
// Project Name: EE 214 Project 7
//////////////////////////////////////////////////////////////////////////////////

module NANDcell(input s, input r, output Q1, output Q2);
assign #10 Q2 = !(Q1&s);
assign #10 Q1 = !(Q2&r);
endmodule
