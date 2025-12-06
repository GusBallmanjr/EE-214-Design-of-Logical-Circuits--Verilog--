`timescale 1ns / 1ps

module bin2BCD(input [10:0] binary, output reg [3:0] thousands, output reg [3:0] hundreds, output reg [3:0] tens, output reg [3:0] ones);

reg [23:0] shift_reg;
integer i;

always @(*) begin
    shift_reg <= {16'd0, binary};
    for (i = 0; i < 8; i = i + 1) begin
        if (shift_reg[11:8] > 4) shift_reg[11:8] <= shift_reg[11:8] + 3;
        if (shift_reg[15:12] > 4) shift_reg[15:12] <= shift_reg[15:12] + 3;
        if (shift_reg[19:16] > 4) shift_reg[19:16] <= shift_reg[19:16] + 3;
        if (shift_reg[23:20] > 4) shift_reg[23:20] <= shift_reg[23:20] + 3;
        shift_reg <= shift_reg << 1;
    end
    thousands <= shift_reg[23:20];
    hundreds <= shift_reg[19:16];
    tens <= shift_reg[15:12];
    ones <= shift_reg[11:8];
end

endmodule
