`timescale 1ns/1ns

module Controller(input[5:0] opcode, input clk, rst, output logic RegDst, Branch, MemRead, MemWrite, MemToReg, ALUSrc,  
					RegWrite, Lui, jump, link, R31Write, RegtoPc, bne, output logic[3:0] ALUOp);


	always@ (opcode) begin
		{RegDst, Branch, MemRead, MemWrite, MemToReg, ALUSrc, RegWrite, Lui, jump, link, R31Write, RegtoPc, bne} <= 16'b0;

				case(opcode)
					6'b 000000: begin RegDst<=1; RegWrite<=1; ALUOp<=4'b 0000; end //R_type
					6'b 001000: begin ALUSrc<=1; RegWrite<=1; ALUOp<=4'b 0001; end //addi
					6'b 001100: begin ALUSrc<=1; RegWrite<=1; ALUOp<=4'b 0010; end//andi
					6'b 001101: begin ALUSrc<=1; RegWrite<=1; ALUOp<=4'b 0011; end//ori 
					6'b 001110: begin ALUSrc<=1; RegWrite<=1; ALUOp<=4'b 0100; end//xori
					6'b 100011: begin MemRead<=1; RegWrite<=1; ALUSrc<=1; MemToReg<=1; ALUOp<=4'b 0111; end//lw
					6'b 101011: begin MemWrite<=1; ALUSrc<=1; ALUOp<=4'b 1010; end//sw
					6'b 001111: begin RegWrite<=1; Lui<=1; end//lui
					6'b 000010: begin RegWrite<=1; R31Write<=1; jump<=1; end//jump
					6'b 000011: begin RegWrite<=1; jump<=1; link<=1; R31Write<=1; end//jal
					6'b 000100: begin Branch<=1; ALUOp<=4'b 0101; end//beq
					6'b 000101: begin bne<=1; ALUOp<=4'b 0110; end//bne 
					6'b 001010: begin RegDst<=1; RegWrite<=1; ALUSrc<=1; ALUOp<=4'b 1000; end //slti
				endcase // opcode
		// endcase
	end
endmodule // Controller