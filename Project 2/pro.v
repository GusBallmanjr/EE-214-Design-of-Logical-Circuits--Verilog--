`timescale 1ns / 1ps



module pro(input btn, input [0:5] sw, output led);
assign led = (~btn&sw[5]&~sw[4]&~sw[3]&sw[2]&~sw[1])|(~btn&~sw[5]&~sw[4]&sw[3]&~sw[2]&sw[1])|(~btn&sw[5]&sw[4]&~sw[3]&sw[2]&~sw[1]);
endmodule
