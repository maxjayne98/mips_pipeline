`timescale 1ns/1ns

module Mux32(input[31:0] in_0, in_1, input sel, output logic[31:0] mux_out);

	assign mux_out= (!sel)? in_0:
		     		in_1;

endmodule
		     
