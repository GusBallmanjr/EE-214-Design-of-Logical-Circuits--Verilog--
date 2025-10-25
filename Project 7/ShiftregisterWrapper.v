`timescale 1ns / 1ps

module ShiftregisterWrapper(input [7:0] sw, input [1:0] btn, input clk, output [9:0] led, output [2:0] RGB_led_A, output [2:0] RGB_led_B);

reg [25:0] cntr;
always @ (posedge(clk)) begin
cntr <= cntr + 1;
end

wire [15:0] F = {RGB_led_B[2:0], RGB_led_A[2:0], led[9:0]};

ShiftRegister ShiftReg_init1(.cntr(cntr[25]), .Data(sw[7:0]), .EN(btn), .Out(F));
endmodule
