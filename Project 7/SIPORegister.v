`timescale 1ns / 1ps

module SIPORegister(input clk, input SDI, output reg [7:0] Out);

always @(posedge(clk)) begin
Out <= {Out[6:0], SDI};
end
endmodule
