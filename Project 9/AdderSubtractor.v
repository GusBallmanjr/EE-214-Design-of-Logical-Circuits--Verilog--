`timescale 1ns / 1ps


module AdderSubtractor(input clk, input [7:0] sw, input [2:0] btn, output [6:0] seg_cat, output [3:0] seg_an);

reg [7:0] Q1, Q2;
wire [7:0] sum;
reg [7:0] sumBin;
wire [7:0] hex;
reg [1:0] sel;

always @(posedge(clk)) begin
if (btn[0]) begin
Q1 <= sw;
end
if (btn[1]) begin
Q2 <= sw;
end
end

always @(*) begin
if (~btn[2]) begin
sumBin <= Q1 + Q2;
end
else if (btn[2]) begin
sumBin <= Q1 - Q2;
end
end

CBCD1kHzmodule CBCD_init(.clk(clk), .clkOut(kHzClock));

// 2 - Bit Counter
always @(posedge(kHzClock)) begin
if (sel == 2'b11) sel <= 2'b00;
else sel <= sel + 2'b01;
end


// mux to sev seg decoder
assign sum = (sel == 0) ? (sumBin % 16) : (sumBin/16);

// mux to anodes
assign seg_an[1:0] = (sel == 0) ? (2'b10) : (2'b01);

//sev seg decoder
assign seg_cat = (sum == 7'h0) ? 7'b1000000 :
                 (sum == 7'h1) ? 7'b1111001 : (sum == 7'h2) ? 7'b0100100 : (sum == 7'h3) ? 7'b0110000 :
                 (sum == 7'h4) ? 7'b0011001 : (sum == 7'h5) ? 7'b0010010 : (sum == 7'h6) ? 7'b0000010 :
                 (sum == 7'h7) ? 7'b1111000 : (sum == 7'h8) ? 7'b0000000 : (sum == 7'h9) ? 7'b0010000 :
                 (sum == 7'hA) ? 7'b0001000 : (sum == 7'hB) ? 7'b0000011 : (sum == 7'hC) ? 7'b1000110 :
                 (sum == 7'hD) ? 7'b0100001 : (sum == 7'hE) ? 7'b0000110 : (sum == 7'hF) ? 7'b0001110 :
                 7'b1111111;
endmodule
