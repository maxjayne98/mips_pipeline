`timescale 1ns/1ns

module MultControl(input[5:0] inst_func, output logic hiRead, loRead, multWrite);

	always@ (*) begin
		{hiRead,loRead,multWrite} <= 3'b 000;
		case(inst_func)
			6'b 010000: hiRead<=1;
			6'b 010010: loRead<=1;
			6'b 011000: multWrite<=1;
		endcase // inst_func
	end // always@ (*)

endmodule // MultControl
