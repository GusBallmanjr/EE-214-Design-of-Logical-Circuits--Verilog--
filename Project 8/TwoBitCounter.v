`timescale 1ns / 1ps


module TwoBitCounter (input clock, input rst, output reg [1:0] out);

always @(posedge(clock)) begin
if (rst) out <= 0; // reset
else out <= out + 1'b1; // count
end 

endmodule
