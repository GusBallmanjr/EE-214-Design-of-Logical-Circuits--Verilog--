`timescale 1ns / 1ps


module Comparator(input clk, input [7:0] sw, input [1:0] btn, output reg [2:0] RGB_led_A);

reg [7:0] Q1, Q2;

always @(posedge(clk)) begin
if (btn[0]) begin
Q1 <= sw;
end
if (btn[1]) begin
Q2 <= sw;
end

if (Q1 == Q2) RGB_led_A = 3'b010;
if (Q1 > Q2) RGB_led_A = 3'b100;
if (Q1 < Q2) RGB_led_A = 3'b001;
end

endmodule
