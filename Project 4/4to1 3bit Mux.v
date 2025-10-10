`timescale 1ns / 1ps

module Mux_4_1_3bit (input [11:0] sw, input [1:0] btn, output [2:0] led);

wire [2:0] I0 = sw[2:0];
wire [2:0] I1 = sw[5:3];
wire [2:0] I2 = sw[8:6];
wire [2:0] I3 = sw[11:9];
wire [1:0] selector = btn[1:0];

assign led = (selector == 2'b00) ? I0 : ((selector == 2'b01) ? I1 : ((selector == 2'b10) ? I2 : I3));
endmodule // 4:1Mux
