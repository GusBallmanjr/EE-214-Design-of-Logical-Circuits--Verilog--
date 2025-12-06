`timescale 1ns / 1ps

module ReactionTimeMonitor(input clk, input [3:0] btn, output reg led = 0, output [3:0] seg_an, output [6:0] seg_cat);

wire cen, clock1kHz;
reg [7:0] numIn = 0;
reg [10:0] numOut = 0;
reg [3:0] digit3, digit2, digit1, digit0;
reg [7:0] count = 0;
reg [7:0] target = 0;
reg start = 0, rst = 0;
reg [7:0] random = 8'hA5;

kHzClock kHzClock_init(.clock(clk), .clkOut(clock1kHz));

assign cen = led;

always @(posedge(clock1kHz)) begin
rst <= btn[2];
random <= {random[6:0], random[7] ^ random[4] ^ random[3] ^ random[2]};

if (btn[0]) begin
start <= 1;
count <= 0;
target <= random;
end

if (btn[1] & led) begin
start <= 0;
count <= 0;
led <= 0;
end

led <= (count == target) & start;

if(count != target) count <= count + 1;

end // always block

always @(posedge (clock1kHz)) begin
    if (cen) begin
        if (numIn == 8'hFF) numIn <= 0;
        else  numIn <= numIn + 1;
    end
    if (rst) numIn <= 0;

    numOut <= (numOut + numIn) >> 1;
    //numOut <= numIn;
end

reg [23:0] shift_reg;
integer i;
always @(*) begin
    shift_reg = {16'd0, numOut};
    for (i = 0; i < 8; i = i + 1) begin
        if (shift_reg[11:8] > 4) shift_reg[11:8] = shift_reg[11:8] + 3;
        if (shift_reg[15:12] > 4) shift_reg[15:12] = shift_reg[15:12] + 3;
        if (shift_reg[19:16] > 4) shift_reg[19:16] = shift_reg[19:16] + 3;
        if (shift_reg[23:20] > 4) shift_reg[23:20] = shift_reg[23:20] + 3;
        shift_reg = shift_reg << 1;
    end
    digit3 = shift_reg[23:20];
    digit2 = shift_reg[19:16];
    digit1 = shift_reg[15:12];
    digit0 = shift_reg[11:8];
end

SevenSegmentDisplaySystem display(.clock1kHz(clock1kHz), .cen(cen), .rst(btn[3]), .d3(digit3), .d2(digit2), .d1(digit1), .d0(digit0), .seg_an(seg_an), .seg_cat(seg_cat));
endmodule