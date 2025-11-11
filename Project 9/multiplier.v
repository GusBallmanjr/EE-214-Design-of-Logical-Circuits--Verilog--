`timescale 1ns / 1ps


module multiplier(input clk, input [7:0] sw, input [1:0] btn, output [6:0] seg_cat, output reg [3:0] seg_an);

reg [7:0] Q1, Q2;
reg [15:0] product;
reg [7:0] segment;
reg [1:0] sel;


always @(posedge(clk)) begin
if (btn[0]) begin
Q1 <= sw;
end
if (btn[1]) begin
Q2 <= sw;
end
end

always @(*) begin
product <= Q1 * Q2;
end

CBCD1kHzmodule CBCD_init(.clk(clk), .clkOut(kHzClock));

// 2 - Bit Counter
always @(posedge(kHzClock)) begin
if (sel == 2'b11) sel <= 2'b00;
else sel <= sel + 2'b01;
end

// mux to sev seg decoder
always @(*) begin
    case (sel)
        2'b00: segment = product[3:0];
        2'b01: segment = product[7:4];
        2'b10: segment = product[11:8];
        2'b11: segment = product[15:12];
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
                 

endmodule
