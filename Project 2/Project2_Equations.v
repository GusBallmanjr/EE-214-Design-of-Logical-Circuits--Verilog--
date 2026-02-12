`timescale 1ns / 1ps

module project2(input [0:4] btn, input [0:5] sw, output led);

assign led[0] = (~sw[1]&sw[0])|(sw[1]&~sw[0]); // *This is led[0]'s Sum of Products Expression*
// (sw[0]|sw[1])&(~sw[0]|~sw[1]; *This is led[0]'s Product of Sums Expression*

assign led[1] = (~sw[3]&~sw[2]&~sw[1])|(~sw[0]&sw[2]&sw[1])|(sw[3]&~sw[2]&sw[1]); // *This is led[1]'s Sum of Products Expression*
// (sw[3]|sw[2]|~sw[1])&(sw[3]|~sw[2]|sw[1])&(~sw[3]|sw[2]|sw[1])&(~sw[3]|~sw[2]|sw[1])&(~sw[3]|~sw[2]|~sw[1]); *This is led[1]'s Product of Sums Expression*

assign led[2] = (~sw[7]&~sw[6]&~sw[5]&sw[4])|(~sw[7]&~sw[6]&sw[5]&sw[4])|(~sw[7]&sw[6]&~sw[5]&~sw[4])|(sw[7]&sw[6]&sw[5]&sw[4]); // This is led[2]'s Sum of Products Expression
// (sw[7]|sw[6]|sw[5]|sw[4])&(sw[7]|sw[6]|~sw[5]|sw[4])&(sw[7]|~sw[6]|sw[5]|~sw[4])&(sw[7]|~sw[6]|~sw[5]|sw[4])&(sw[7]|~sw[6]|~sw[5]|~sw[4])&(~sw[7]|sw[6]|sw[5]|sw[4])&(~sw[7]|sw[6]|sw[5]|~sw[4])&(~sw[7]|sw[6]|~sw[5]|sw[4])&(~sw[7]|sw[6]|~sw[5]|~sw[4])&(~sw[7]|~sw[6]|sw[5]|sw[4])&(~sw[7]|~sw[6]|sw[5]|~sw[4])&(~sw[7]|~sw[6]|~sw[5]|sw[4]); *This is led[2]'s Product of Sums Expression*

// Later Practice of POS and SOP Expressions of Logic Circuits:
//assign led[3] = (sw[3]|sw[4]|sw[5]|sw[6])&(sw[3]|sw[4]|sw[5]|~sw[6])&(~sw[3]|~sw[4]|~sw[5]|~sw[6])&(sw[3]|~sw[4]|sw[5]|sw[6])&(~sw[3]|sw[4]|~sw[5]|~sw[6])&(~sw[3]|sw[4]|~sw[5]|sw[6])&(sw[3]|~sw[4]|sw[5]|~sw[6]);

//assign led = (~btn[0]&sw[5]&~sw[4]&~sw[3]&sw[2]&~sw[1])|(~btn[0]&~sw[5]&~sw[4]&sw[3]&~sw[2]&sw[1])|(~btn[0]&sw[5]&sw[4]&~sw[3]&sw[2]&~sw[1]);
endmodule
