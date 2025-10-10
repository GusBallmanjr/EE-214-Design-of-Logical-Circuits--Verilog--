`timescale 1ns / 1ps

module Shifter (input [10:0] sw, input [1:0]btn, output reg [7:0] led);

always @(*) begin
case(btn[0])
1'b0: led = (btn[1]==1) ? (sw[10:3] >> sw[2:0]) : (sw[10:3] << sw[2:0]);
1'b1: led = (btn[1]==1) ? ((sw[10:3] >> sw[2:0]) | (sw[10:3] << (8-sw[2:0]))) : ((sw[10:3] << sw[2:0]) | (sw[10:3] >> (8 - sw[2:0])));
endcase
end

endmodule // Shifter
