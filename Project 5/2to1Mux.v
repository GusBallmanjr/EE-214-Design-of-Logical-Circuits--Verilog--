`timescale 1ns / 1ps

module Twoto1Mux(input [3:0] I0, input [3:0] I1, input selector, output [3:0] O);

assign O = (selector == 1) ? (I1) : I0;
  
endmodule // 2to1Mux
