`timescale 1ns / 1ps

module bin2seg(input [7:0] sw, input btn, output [3:0] seg_an, output [6:0] seg_cat); 

assign seg_an[0] = ~btn;
assign seg_an[1] = btn;
assign seg_an[2] = 1;
assign seg_an[3] = 1;
wire [3:0] num;
Twoto1Mux mux_init(.I0(sw[3:0]), .I1(sw[7:4]), .selector(btn), .O(num));
Decoders decoder_init(.num(num), .A(seg_cat[0]), .B(seg_cat[1]), .C(seg_cat[2]), .D(seg_cat[3]), .E(seg_cat[4]), .F(seg_cat[5]), .G(seg_cat[6]));

endmodule
