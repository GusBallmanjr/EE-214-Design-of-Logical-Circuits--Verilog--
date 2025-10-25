`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Gus Ballman
// Create Date: 10/23/2025
// Design Name: NOR Basic Cell TestBench
// Module Name: NORTestBench
// Project Name: EE 214 Project 7
//////////////////////////////////////////////////////////////////////////////////

module NORTestBench();
reg S, R; 
wire Q1, Q2;
NORcell NORcell_init(.s(S), .r(R), .Q1(Q1), .Q2(Q2));
initial begin
    // Initialize Inputs
    S = 1;
    R = 1;

    // Add stimulus here
    #100 S = 0;
    #100 S = 1;
    #100 R = 0;
    #100 R = 1;
    #100 S = 0;
         R = 0;
    #100 S = 1;
         R = 1;
    #100 S = 0;
         R = 0;
    #100 ;
end
endmodule
