`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Gus Ballman
// Create Date: 10/23/2025
// Design Name: Parallel In - Parallel Out Register
// Module Name: PIPOregister
// Project Name: EE 214 Project 7
//////////////////////////////////////////////////////////////////////////////////

module PIPOregister(input clk, input EN, input [7:0] Data, output reg [7:0] Out);

always @(posedge(clk)) begin
  if(EN) Out <= Data;
end
  
endmodule
