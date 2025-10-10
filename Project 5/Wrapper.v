`timescale 1ns / 1ps

module Wrapper(input [7:0] sw, input clk, output [7:0] led);


wire [2:0] B;
counter counter_init(.clk (clk), .B(B));
wire EN;
Mux8_1 Mux_init(.I(sw), .selector(B), .y(EN));

Decoder decoder_init(.selector(B), .EN(EN), .O(led));
endmodule
