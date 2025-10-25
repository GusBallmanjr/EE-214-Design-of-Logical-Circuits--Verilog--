`timescale 1ns / 1ps

module NANDTestBench();
reg S, R;
wire Q1, Q2;
NANDcell NORcell_init(.s(S), .r(R), .Q1(Q1), .Q2(Q2));
initial begin
    // Initialize Inputs
    S = 1;
    R = 1;

    // Add stimulus here
    #100 S = 0;
    #100 S = 1;
    #100 R = 0;
    #100 R = 1;
    #100 S = 0;
         R = 0;
    #100 S = 1;
         R = 1;
    #100 S = 0;
         R = 0;
    #100 ;
end
endmodule

