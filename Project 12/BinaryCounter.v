`timescale 1ns / 1ps


module BinaryCounter(input cen, input clock, output reg [7:0] num = 0);

always @(posedge(clock)) begin
if (cen) begin
if (num == 8'b11111111) num <= 8'b00000000;
else num <= num + 1;
end
end // always block
endmodule
