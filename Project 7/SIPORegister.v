`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Gus Ballman
// Create Date: 10/23/2025
// Design Name: Series In - Parallel Out Register
// Module Name: SIPOregister
// Project Name: EE 214 Project 7
//////////////////////////////////////////////////////////////////////////////////

module SIPOregister(input clk, input SDI, output reg [7:0] Out);

always @(posedge(clk)) begin
Out <= {Out[6:0], SDI};
end
endmodule
