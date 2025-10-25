`timescale 1ns / 1ps

module PIPOregister(input clk, input b, input [7:0] D, output reg [7:0] O);

always @(posedge(clk)) begin
if(b) O <= D;
end
endmodule
