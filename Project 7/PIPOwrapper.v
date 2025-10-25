`timescale 1ns / 1ps

module PIPOwrapper(input [7:0] sw,input clk, input [1:0] btn, output reg [7:0] led);
    
wire [7:0] O;
PIPOregister PIPO_init(.clk(clk), .b(btn[0]), .D(sw), .O(O));

always @(*) begin
case (btn[1])
1'b0: led = O;
1'b1: led = sw;
endcase
end

endmodule