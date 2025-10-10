`timescale 1ns / 1ps

module Decoder (input [2:0] selector, input EN, output [7:0] O);

assign O[0] = EN & (selector == 3'b000);
assign O[1] = EN & (selector == 3'b001);
assign O[2] = EN & (selector == 3'b010);
assign O[3] = EN & (selector == 3'b011);
assign O[4] = EN & (selector == 3'b100);
assign O[5] = EN & (selector == 3'b101);
assign O[6] = EN & (selector == 3'b110);
assign O[7] = EN & (selector == 3'b111);

endmodule // Decoder
