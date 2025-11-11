`timescale 1ns / 1ps


module ALUSevenSegmentCircuit(input clk, input [10:0] sw, input [3:0] btn, output reg [2:0] RGB_led_A, output reg [1:0] led, output [6:0] seg_cat, output reg [3:0] seg_an);

wire [7:0] num;
assign num = sw[7:0];
wire [2:0] opcode = sw[10:8];

reg [7:0] Q1, Q2;
reg [1:0] sel;
wire kHzClock;
reg [15:0] result;
reg [6:0] segment;
reg carryOut, carryOutAdj;

always @(posedge(clk)) begin
if (btn[0]) begin
Q1 <= sw;
end
if (btn[1]) begin
Q2 <= sw;
end
end

    CBCD1kHzmodule CBCD_init(.clk(clk), .clkOut(kHzClock)); // Module found in project 8 and 9

always @(*) begin
carryOut <= (Q1[7] & Q2[7]);
carryOutAdj <= (Q1[6] & Q2[6]);

if (opcode == 0) result <= Q1 + Q2;
else if (opcode == 1) result <= Q1 + 1;
else if (opcode == 2) result <= Q1 - Q2;
else if (opcode == 3) result <= Q1 * Q2;
else if (opcode == 4) result <= !Q1;
else if (opcode == 5) result <= Q1 ^ Q2;
else if (opcode == 6) result <= Q1 | Q2;
else if (opcode == 7) result <= Q1 & Q2;
end

// 2 - Bit Counter
always @(posedge(kHzClock)) begin
if (sel == 2'b11) sel <= 2'b00;
else sel <= sel + 2'b01;
end


// mux to sev seg decoder
// mux to sev seg decoder
always @(*) begin
    case (sel)
        2'b00: segment = result[3:0];
        2'b01: segment = result[7:4];
        2'b10: segment = result[11:8];
        2'b11: segment = result[15:12];
    endcase
end

// mux to anodes
always @(*) begin
    case (sel)
        2'b00: seg_an = 4'b1110;
        2'b01: seg_an = 4'b1101;
        2'b10: seg_an = 4'b1011;
        2'b11: seg_an = 4'b0111;
    endcase
end

//sev seg decoder
assign seg_cat = (segment == 8'h0) ? 7'b1000000 :
                 (segment == 7'h1) ? 7'b1111001 : (segment == 8'h2) ? 7'b0100100 : (segment == 8'h3) ? 7'b0110000 :
                 (segment == 8'h4) ? 7'b0011001 : (segment == 8'h5) ? 7'b0010010 : (segment == 8'h6) ? 7'b0000010 :
                 (segment == 8'h7) ? 7'b1111000 : (segment == 8'h8) ? 7'b0000000 : (segment == 8'h9) ? 7'b0010000 :
                 (segment == 8'hA) ? 7'b0001000 : (segment == 8'hB) ? 7'b0000011 : (segment == 8'hC) ? 7'b1000110 :
                 (segment == 8'hD) ? 7'b0100001 : (segment == 8'hE) ? 7'b0000110 : (segment == 8'hF) ? 7'b0001110 :
                 7'b1111111;

// the ALU output is 0;
//the ALU output is negative (assuming 8-bit 2's compliment numbers);
//the output resulted a carry out of the MSB;
//the output is incorrect due to overflow or underflow.

always @(*) begin
if (result == 0) begin
led[0] <= 1'b1;
end

else begin
led[0] <= 1'b0;
end

if (result[15] == 1'b1) begin
RGB_led_A[2] <= 1'b1;
end
else RGB_led_A[2] <= 1'b0;

if (opcode == 0 && Q1[7] == 1'b1 && Q2[7] == 1) begin
RGB_led_A[1] <= 1'b1;
end
else RGB_led_A[1] <= 1'b0;

if (result > 32767) begin
RGB_led_A[0] <= 1'b1;
end
else RGB_led_A[0] <= 1'b0;

end
endmodule
