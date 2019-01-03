`timescale 1ns/1ns

module RegFile(input[4:0] read_r1, read_r2, write_r, input[31:0] write_data, input clk, rst, RegWrite, output [31:0] read_d1, 	
				read_d2);

	logic[31:0] RFile [31:0];

	assign read_d1= RFile[read_r1];
	assign read_d2= RFile[read_r2];

	always@ (posedge clk, posedge rst) begin 
		RFile[0] <= 32'b0;
		if(rst) begin 	
			integer i;
			for (i=1; i<32; i=i+1)
				RFile[i] <= 32'b0;
		end
		else if(RegWrite) 
			RFile[write_r] <= write_data; 
	end
endmodule 