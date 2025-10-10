`timescale 1ns / 1ps

module Decoder (input [3:0] btn, input [1:0] sw, output [3:0] led);

assign led[0] = ~sw[0] & ~sw[1] & btn[0];
assign led[1] = ~sw[0] & sw[1] & btn[1];
assign led[2] = sw[0] & ~sw[1] & btn[2];
assign led[3] = sw[0] & sw[1] & btn[3];

endmodule // Decoder
