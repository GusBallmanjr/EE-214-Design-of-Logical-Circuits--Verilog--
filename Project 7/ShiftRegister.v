`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Gus Ballman
// Create Date: 10/23/2025
// Design Name: Shift Register (Parallel In - Series Out Register)
// Module Name: ShiftRegister
// Project Name: EE 214 Project 7
//////////////////////////////////////////////////////////////////////////////////

module ShiftRegister(input cntr, input [7:0] Data, input [1:0] EN, output reg [15:0] Out);

always @(posedge cntr) begin
 Out <= {Out[14:0], Out[15]};  
if (EN[0]) begin
Out[7:0] <= Data; 
end
if (EN[1]) begin
Out[15:8] <= Data;
end
end
 
endmodule
