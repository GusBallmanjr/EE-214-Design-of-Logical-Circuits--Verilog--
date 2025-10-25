`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Gus Ballman
// Create Date: 10/23/2025
// Design Name: D Latch TestBench
// Module Name: DLatchTestBench
// Project Name: EE 214 Project 7
//////////////////////////////////////////////////////////////////////////////////

module DLatchTestBench();
reg S, R; 
wire Q1, Q2;
DLatch DLatch_Test(.D(S), .G(R), .Q1(Q1), .Q2(Q2));
initial begin
    S = 1;
    R = 1;
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

