`timescale 1ns / 1ps

module RandomNum(input clock, input reset, output reg [7:0] random_out);
always @(posedge(clock) or posedge(reset)) begin
    if (reset)
        random_out <= 0;
    else
        random_out <= {random_out[6:0], random_out[7] ^ random_out[5] ^ random_out[4] ^ random_out[3]};
end
endmodule
