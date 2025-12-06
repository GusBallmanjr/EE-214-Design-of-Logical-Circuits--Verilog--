`timescale 1ns / 1ps


module SevenSegmentDisplaySystem(input clock1kHz, input cen, input rst, output reg [3:0] seg_an, output [6:0] seg_cat);

wire [3:0] d0, d1, d2, d3;
wire [1:0] sel;
reg  [3:0] digit;
reg [6:0] seg;


// Binary Coded Decimal COunter
BCDCounter bcd(.clock(clock1kHz), .rst(rst), .cen(cen), .digit0(d0), .digit1(d1), .digit2(d2), .digit3(d3));

//Two bit counter for decoder and mux selection
TwoBitCounter TwoBit(.clock(clock1kHz), .rst(rst), .out(sel));

// mux for both seven segment anodes and digit for seven segment decoder
always @(*) begin
    case (sel)
        2'd0: begin
            digit <= d0;
            seg_an <= 4'b1110;
        end
        2'd1: begin
            digit <= d1;
            seg_an <= 4'b1101;
        end
        2'd2: begin
            digit <= d2;
            seg_an <= 4'b1011;
        end
        2'd3: begin
            digit <= d3;
            seg_an <= 4'b0111;
        end
        default: begin
            digit <= 0;
            seg_an <= 4'b1111;
        end
    endcase
end // always block

// seven segment decoder
always @(*) begin
    case (digit)
        0: seg = 7'b1000000;
        1: seg = 7'b1111001;
        2: seg = 7'b0100100;
        3: seg = 7'b0110000;
        4: seg = 7'b0011001;
        5: seg = 7'b0010010;
        6: seg = 7'b0000010;
        7: seg = 7'b1111000;
        8: seg = 7'b0000000;
        9: seg = 7'b0010000;
        default: seg = 7'b1111111;
    endcase
end // always block

assign seg_cat = seg;

endmodule