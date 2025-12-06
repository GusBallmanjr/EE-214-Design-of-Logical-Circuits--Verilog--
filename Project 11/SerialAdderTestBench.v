`timescale 1ns / 1ps


module SA_tb;

reg A, B, clk, rst;
wire F, cout;


SA SA_Init(.A(A),.B(B),.F(F),.Cout(Cout),.clk(clk),.rst(rst));

initial begin

clk = 1'b0;
forever #5 clk = ~clk;
end

initial begin
rst = 1'b1;
A = 1'b0;
B = 1'b0;
#10
rst = 1'b0;
#10
A = 1'b1;
B = 1'b0;
#10
A = 1'b0;
B = 1'b1;
#10
A = 1'b1;
B = 1'b1;
#10
A = 1'b0;
B = 1'b0;
#10
A = 1'b1;
B = 1'b1;
#10
A = 1'b0;
B = 1'b1;
#10
A = 1'b1;
B = 1'b0;
#10
A = 1'b0;
B = 1'b0;
#10
$finish;
end
endmodule