`timescale 1ns / 1ps



module CBCD1kHzmodule(input clk, output reg clkOut = 0);

reg [25:0] count;
localparam Divider = 100000 - 1;

always @(posedge(clk)) begin
if (count != Divider) count <= count + 1;
else begin
clkOut  = ~clkOut;
count <= 0;
end

end // always

endmodule
