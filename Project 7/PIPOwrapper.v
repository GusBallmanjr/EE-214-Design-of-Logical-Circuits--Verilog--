`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Gus Ballman
// Create Date: 10/23/2025
// Design Name: Parallel In - Parallel Out Register Application Wrapper
// Module Name: PIPOwrapper
// Project Name: EE 214 Project 7
//////////////////////////////////////////////////////////////////////////////////

module PIPOwrapper(input [7:0] sw,input clk, input [1:0] btn, output reg [7:0] led);
    
wire [7:0] O;
    PIPOregister PIPO_init(.clk(clk), .EN(btn[0]), .Data(sw), .Out(O));

always @(*) begin
case (btn[1])
1'b0: led = O;
1'b1: led = sw;
endcase
end

endmodule
