`timescale 1ns / 1ps

module segment(input [3:0] sw, output [7:0] seg_cat, output reg seg_an);

supply0 anode;
always @(*) begin
seg_an = anode; // the seven segment anode has a inverted relationship, so must be driven to a zero to be on
end
Decoder decoder_init (.num(sw), . A(seg_cat[0]), .B(seg_cat[1]), .C(seg_cat[2]), .C(seg_cat[3]), .D(seg_cat[4]), .E(seg_cat[5]), .F(seg_cat[6]), .G(seg_cat[7]));
// instatiated Decoder module taht determines which cathodes of the seven segment display should be driven to a 1 based on the binary number being inputed from the switches

endmodule
