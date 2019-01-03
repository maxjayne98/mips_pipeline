`timescale 1ns/1ns

module Adder_32(input[31:0] in_1, in_2, output logic[31:0] res);
	assign res= in_1 + in_2;
endmodule