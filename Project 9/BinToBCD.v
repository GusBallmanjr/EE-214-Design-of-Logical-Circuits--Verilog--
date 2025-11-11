`timescale 1ns / 1ps



module bin2hex(
    input  [3:0] bin,
    output reg [7:0] hex
);
    always @(*) begin
        hex = {4'b0000, bin};
    end
endmodule

