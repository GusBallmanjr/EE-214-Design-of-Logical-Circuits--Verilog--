`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 10:17:02 AM
// Design Name: 
// Module Name: DFlipFlopClear
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DFlipFlopClear(input D, input G, input Clear, output Q1);

wire X1, X2, Q2;
NAND(X1, D, G, Clear);
NAND(X2, ~D, G);
NANDcell NANDBasicCELL_init(.s(X1), .r(X2), .Q1(Q1), .Q2(Q2));
endmodule
