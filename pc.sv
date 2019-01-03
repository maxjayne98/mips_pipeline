`timescale 1ns/1ns

module PC(input[31:0] pc_in, input clk, rst, output logic[31:0] pc_out);
	always@ (posedge clk, posedge rst) begin 
		if(rst)
			pc_out <= 32'b0;
		else
			pc_out <= pc_in;
	end
endmodule 
