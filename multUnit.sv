`timescale 1ns/1ns

module MultUnit(input[63:0] write_data, input clk, rst, lo_read, hi_read, write, output logic[31:0] read_data);

	logic[31:0] lo, hi;

	always@ (posedge clk, posedge rst) begin
		if(rst) begin
			lo <= 32'b 00000000000000000000000000000000;
			hi <= 32'b 00000000000000000000000000000000;
		end // if(rst)
		else begin
			if(lo_read)
				read_data <= lo;
			else if(hi_read)
				read_data <= hi;
			else if(write) begin
				hi <= write_data[63:32];
				lo <= write_data[31:0];
			end // else if(write)
		end

	end


endmodule // MultUnit
