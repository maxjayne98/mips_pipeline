`timescale 1ns/1ns

module Mux5(input[4:0] in_0, in_1, input sel, output logic[4:0] mux_out);
	
	assign mux_out= (!sel)? in_0:
		     		in_1;
endmodule
