`timescale 1ns / 1ps

module Stopwatch(input clk, input [3:0] btn, output [3:0] seg_an, output [6:0] seg_cat);
reg Cen, rst, prev, start;
wire clock1kHz;
reg [9:0] count;

kHzClock CBCD_inito(.clock(clk), .clkOut(clock1kHz));
SevenSegmentDisplaySystem display(.clock1kHz(clock1kHz), .cen(Cen), .rst(rst), .seg_an(seg_an), .seg_cat(seg_cat));

always @(posedge clock1kHz) begin
    rst <= btn[3];
    if (btn[0]) start <= 1;
    else if (btn[1]) start <= 0;
    
    prev <= btn[2];
    if (btn[2] & ~prev) count <= 0;
    else if (count != 1000) count <= count + 1;
    Cen <= (count != 1000) || start;
end

endmodule



