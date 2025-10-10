`timescale 1ns / 1ps

module Mux8_1(input [7:0] I, [2:0] selector, output y);

assign y = (selector == 3'b000) ? (I[0]) : ((selector == 3'b001) ? (I[1]) : ((selector == 3'b010) ? (I[2]) : ((selector == 3'b011) ? (I[3]) : 
((selector == 3'b100) ? (I[4]) : ((selector == 3'b101) ? (I[5]) : ((selector == 3'b110) ? (I[6]) : (I[7])))))));

endmodule // 8:1 mux
