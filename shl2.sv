`timescale 1ns/1ns

module SHL2(input[31:0] in, output logic[31:0] out);
	assign out= {in[29:0], 2'b00};
endmodule 