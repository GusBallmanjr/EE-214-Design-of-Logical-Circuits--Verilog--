`timescale 1ns / 1ps


module NANDcell(input s, input r, output Q1, output Q2);
assign #10 Q2 = !(Q1&s);
assign #10 Q1 = !(Q2&r);
endmodule
