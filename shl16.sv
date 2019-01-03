`timescale 1ns/1ns

module SHL16(input[15:0] in, output logic[31:0] out);
	assign out= {in, 16'b0};
endmodule 