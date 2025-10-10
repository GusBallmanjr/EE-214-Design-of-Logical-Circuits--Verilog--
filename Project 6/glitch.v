`timescale 1ns / 1ps

module glitch(input A, input B, input C, output y);

//assign X = (A&B)|(~B&C); // B is a hazard because it is a coupled term
wire N1, N2, N3;

// AND gate with 1ns delay
assign #1 N1 = A & B;
// Not Gate with 1ns delay
assign #1 N2 = ~B;
// And Gate with 1ns delay
assign #1 N3 = N2 & C;
// Or Gate with 1ns delay
assign #1 y = N1 | N3;

endmodule
