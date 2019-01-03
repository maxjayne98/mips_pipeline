`timescale 1ns/1ns

module ALU(input[31:0] in_1, in_2, input[2:0] ALUOP, output logic[31:0] res, output logic[63:0] multRes, output logic zero);
	parameter ADD=3'b 010, SUB=3'b 110, AND=3'b 000, OR=3'b 001, XOR=3'b 101, MULT=3'b 011, SLT=3'b 111;
	always@ (*) begin
		case(ALUOP) 
			ADD:
				res <= in_1 + in_2;
			SUB: 	
				res <= in_1 - in_2;
			AND:
				res <= in_1 & in_2;
			OR:
				res <= in_1 | in_2;
			XOR:
				res <= in_1 ^ in_2;
			MULT:
				multRes <= in_1 * in_2;
			SLT:
				if (in_1 < in_2)
					res <= 32'b 00000000000000000000000000000001;
				else 
					res <= 32'b 00000000000000000000000000000000;
		endcase
	end	
	assign zero = (res==0)? 1:
							0;
endmodule 