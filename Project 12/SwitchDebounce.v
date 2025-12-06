`timescale 1ns / 1ps


module SwitchDebounce(input clk, input sw, output reg F);

reg signal;

always @(posedge(clk)) begin
if (sw && signal) begin
F <= 1;
signal <= 0;
end
else if (sw) signal <= 1;
else signal <= 0;
end

always @(posedge(clk)) begin
if (~sw && ~signal) begin
F <= 0;
signal <= 0;
end
else signal <= 0;
end

endmodule
