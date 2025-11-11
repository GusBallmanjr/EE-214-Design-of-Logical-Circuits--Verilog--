`timescale 1ns / 1ps

module CLAWrapper(input clk, input [7:0] sw, output [6:0] seg_cat, output [1:0] seg_an);

wire [3:0] sum1;
wire [3:0] sum;
wire kHzClock;
reg [1:0] sel;
wire [7:0] hex;

CPGN CPGN_init(.A(sw[3:0]), .B(sw[7:4]), .sum(sum1));

CBCD1kHzmodule CBCD_init(.clk(clk), .clkOut(kHzClock));

// 2 - Bit Counter
always @(posedge(kHzClock)) begin
if (sel == 2'b11) sel <= 2'b00;
else sel <= sel + 2'b01;
end

// mux to sev seg decoder
bin2hex bin2hex_init(.bin(sum1), .hex(hex));

assign sum = (sel == 0) ? (hex[3:0]) : (hex[7:4]);

// mux to anodes
assign seg_an[1:0] = (sel == 0) ? (2'b10) : (2'b01);

//sev seg decoder
assign seg_cat = (sum == 4'h0) ? 7'b1000000 :
                 (sum == 4'h1) ? 7'b1111001 : (sum == 4'h2) ? 7'b0100100 : (sum == 4'h3) ? 7'b0110000 :
                 (sum == 4'h4) ? 7'b0011001 : (sum == 4'h5) ? 7'b0010010 : (sum == 4'h6) ? 7'b0000010 :
                 (sum == 4'h7) ? 7'b1111000 : (sum == 4'h8) ? 7'b0000000 : (sum == 4'h9) ? 7'b0010000 :
                 (sum == 4'hA) ? 7'b0001000 : (sum == 4'hB) ? 7'b0000011 : (sum == 4'hC) ? 7'b1000110 :
                 (sum == 4'hD) ? 7'b0100001 : (sum == 4'hE) ? 7'b0000110 : (sum == 4'hF) ? 7'b0001110 :
                 7'b1111111;


endmodule
