`timescale 1ns / 1ps

module StartReact(input kHzClock, input [2:0] btn, output cen, output reg led = 0);

reg [7:0] count = 0;
reg [7:0] target = 0;
reg start = 0;
reg [7:0] random = 8'hA5;

always @(posedge(kHzClock)) begin
random <= {random[6:0], random[7]^random[5]^random[4]^random[3]};
if (btn[0]) begin
start <= 1;
target <= random;
end

if (start && count != target) count <= count + 1;
else if (start && count == target) begin
led <= 1;

if (btn[1]) begin
start <= 0;
led <= 0;
end
end

end // always block

assign cen = led;

endmodule




