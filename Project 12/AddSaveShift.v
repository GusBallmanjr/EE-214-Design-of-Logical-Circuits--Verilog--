`timescale 1ns / 1ps

module AddSaveShift(input clock, input [7:0] num, output reg [10:0] numOut);

always @(posedge(clock)) begin
        numOut <= numOut + num;
        numOut <= numOut[10:3];
end // always block
endmodule