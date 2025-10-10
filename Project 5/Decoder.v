`timescale 1ns / 1ps

module Decoders(input [3:0] num, output A, B, C, D, E, F, G);

wire [6:0] segments; // 7 bit bus 

assign {A, B, C, D, E, F, G} = ~segments; // concatenates A - G and assigned to segment to form a 7 bit binary number
assign segments = (num == 4'h0) ? 7'b1111110 :
                  ((num == 4'h1) ? 7'b0110000 : ((num == 4'h2) ? 7'b1101101 : ((num == 4'h3) ? 7'b1111001 : ((num == 4'h4) ? 7'b0110011 :
                  ((num == 4'h5) ? 7'b1011011 : ((num == 4'h6) ? 7'b1011111 : ((num == 4'h7) ? 7'b1110000 : ((num == 4'h8) ? 7'b1111111 :
                  ((num == 4'h9) ? 7'b1111011 : ((num == 4'hA) ? 7'b1110111 : ((num == 4'hB) ? 7'b0011111 : ((num == 4'hC) ? 7'b1001110 :
                  ((num == 4'hD) ? 7'b0111101 : ((num == 4'hE) ? 7'b1001111 : ((num == 4'hF) ? 7'b1000111 : 7'b0000000)))))))))))))));
                  // Uses ternary operator to assign A - G (within the segment bus) based off of which hexadecimal number is trying to be inputted;
endmodule
