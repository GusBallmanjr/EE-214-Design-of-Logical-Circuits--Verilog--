`timescale 1ns / 1ps


module BCDCounter (input clock, input rst, input cen, output reg [3:0] digit0, output reg [3:0] digit1, output reg [3:0] digit2, output reg [3:0] digit3);

always @(posedge clock) begin
if (rst) begin // Reset
    digit0 <= 0;
    digit1 <= 0;
    digit2 <= 0;
    digit3 <= 0;
end

else if (cen) begin // If Counter Enable is high, start count
if (digit0 == 9) begin // Reset LSD if it reaches 9
digit0 <= 0;

if (digit1 == 9) begin // Reset digit one if it reaches 9
digit1 <= 0;

if (digit2 == 9) begin // Reset digit two if it reaches 9
digit2 <= 0;

if (digit3 == 9) digit3 <= 0; // Reset digit three if it reaches 9

else digit3 <= digit3 + 1; // Increment digit
end

else digit2 <= digit2 + 1; // Increment digit
end

else digit1 <= digit1 + 1; // Increment digit
end

else digit0 <= digit0 + 1; // Increment digit
end

end // always block
endmodule
