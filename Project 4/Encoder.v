`timescale 1ns / 1ps

module Encoder (input EN, input [3:0] I, output reg [1:0] y, output Eout, output GS);

assign Eout = EN;
assign GS = I[0] + I[1] + I[2] + I[3];

always @(*) begin

case (I[0])
1'b1: y = 2'b00 & EN;
endcase
case(I[1])
1'b1: y = 2'b01 & E;
endcase
case(I[2])
1'b1: y = 2'b10 & EN;
endcase
case(I[3])
1'b1: y = 2'b11;
endcase

end

endmodule // Encoder
