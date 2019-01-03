`timescale 1ns/1ns

module ALUControl(input[5:0] func, input[3:0] ALUop, output logic[2:0] ALUoperation);
	
	always @(*) begin
		case(ALUop)
			4'b 0000: case(func)
						6'b 100000: ALUoperation <= 3'b 010; //add
						6'b 100010: ALUoperation <= 3'b 110; //sub
						6'b 100100: ALUoperation <= 3'b 000; //and
						6'b 100101: ALUoperation <= 3'b 001; //or
						6'b 011000: ALUoperation <= 3'b 011; //mult
						6'b 100110: ALUoperation <= 3'b 101; //xor
						6'b 101010: ALUoperation <= 3'b 111; //slt
					endcase // func
			4'b 0001: ALUoperation <= 3'b 010; //addi
			4'b 0010: ALUoperation <= 3'b 000; //andi
			4'b 0011: ALUoperation <= 3'b 001; //ori
			4'b 0100: ALUoperation <= 3'b 101; //xori
			4'b 0111: ALUoperation <= 3'b 010; //lw
			4'b 1010: ALUoperation <= 3'b 010; //sw
			4'b 0101: ALUoperation <= 3'b 110; //beq
			4'b 0110: ALUoperation <= 3'b 110; //bne
			4'b 1000: ALUoperation <= 3'b 111; //slti
		endcase // ALUop
	end // always @(*)


endmodule // ALUControl