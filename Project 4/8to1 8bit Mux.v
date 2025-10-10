`timescale 1ns / 1ps

module Mux_8_1_8bit (input [2:0] selector, output y );

reg [7:0] I [0:7];

initial begin
I[0] = 8'h01;
I[1] = 8'h23;
I[2] = 8'h4A;
I[3] = 8'h12;
I[4] = 8'h0F;
I[5] = 8'h13;
I[6] = 8'h14;
I[7] = 8'hEF;
end

assign y = (I[selector]);
endmodule // 8:1Mux
