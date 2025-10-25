`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Gus Ballman
// Create Date: 10/23/2025
// Design Name: Series In - Parallel Out Register Application Wrapper
// Module Name: SIPOwrapper
// Project Name: EE 214 Project 7
//////////////////////////////////////////////////////////////////////////////////

module SIPOWrapper(input clk, input btn, output [7:0] led);

reg [25:0] cntr;

 always @ (posedge(clk))
    cntr <= cntr + 1;
    
SIPOregister SIPO_reg(.clk(cntr[25]), .SDI(btn), .Out(led));

endmodule
