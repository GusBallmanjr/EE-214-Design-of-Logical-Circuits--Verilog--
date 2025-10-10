`timescale 1ns / 1ps

module Mux_8_1_1bit (input [7:0] sw, input [3:0] btn, output [2:0] RGB_led_A);

wire [7:0] I = sw[7:0];
wire [3:0] selector = btn[3:0];

assign RGB_led_A[1] = (selector == 3'b000) ? (I[0]) : ((selector == 3'b001) ? (I[1]) : ((selector == 3'b010) ? (I[2]) : ((selector == 3'b011) ? (I[3]) : ((selector == 3'b100) ? (I[4]) : ((selector == 3'b101) ? (I[5]) : ((selector == 3'b110) ? (I[6]) : (I[7]))))))); 
endmodule // 8:1Mux
