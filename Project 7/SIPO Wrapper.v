`timescale 1ns / 1ps

module SIPOWrapper(input clk, input btn, output [7:0] led);

reg [25:0] cntr;

 always @ (posedge(clk))
    cntr <= cntr + 1;
    
SIPORegister SIPO_reg(.clk(cntr[25]), .SDI(btn), .Out (led));

endmodule
