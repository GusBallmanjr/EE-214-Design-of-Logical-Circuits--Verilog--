`timescale 1ns / 1ps


//module Project3(output reg led, input [7:0] sw);

//assign a = sw[0];
//assign b = sw[1];
//assign c = sw[2];
//assign d = sw[3];
//assign e = sw[4];


//assign led = switch_0 ^ switch_1 ^ switch_2 ^ switch_3 ^ switch_4;

//assign led = (a&b&c)+(a&b&c&d)+(a&b&c&d&e)+(b&c&d)+(b&c&d&e)+(c&d&e)+(a&c&d)+(a&c&d&e)+(a&b&d)+(a&b&d&e)+(a&b&e)+(a&b&d)+(b&d&e)+(b&c&d)+(b&c&d&e);    
//reg [7:0] num;
//always @(*) begin
//num = {sw[7], sw[6], sw[5], sw[4], sw[3], sw[2], sw[1], sw[0]};


//if(num >= 8'b10100000 && num <= 8'b10111001) begin
//led = 1'b11;
 //end else begin
 //led = 1'b00;
// end
// end
//endmodule

module project3 (output [2:0] RGB_led_A, input [5:0] sw);

assign switch_0 = sw[0];
assign switch_1 = sw[1];
assign switch_2 = sw[2];
assign switch_3 = sw[3];
assign switch_4 = sw[4];
assign switch_5 = sw[5];
assign switch_6 = sw[6];
assign switch_7 = sw[7];
//wire c, t, ol, ot, e;
//assign c = sw[0];
//assign t = sw[1];
//assign ol = sw[2];
//assign ot = sw[3];
//assign e = sw[4];

//assign RGB_led_A[0] = (ol & ~c) | c | (ot & c) | (t & ot);
//assign RGB_led_A[1] = 1'b0;
//assign RGB_led_A[2] = (c & t) | (c & ot) | (t & ot) | e | ol | (~c & t) | (~t & c & ot & ~ol);

assign RGB_led_A[0] = switch_0 ^ switch_1 ^ switch_2 ^ switch_3 ^ switch_4 ^ switch_5 ^ switch_6 ^ switch_7;
assign RGB_led_A[1] = 1'b00;
assign RGB_led_A[2] = !(switch_0 ^ switch_1 ^ switch_2 ^ switch_3 ^ switch_4 ^ switch_5 ^ switch_6 ^ switch_7);

endmodule
