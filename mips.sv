`timescale 1ns/1ns

module Mips(input clk, rst);

	wire[5:0] opcode, func;
	wire[3:0] ALUOp;
	wire[2:0] ALUOperation;
	wire RegDstm, R31Write, RegWrite, ALUSrc, MemRead, MemWrite, MemToReg, Lui, Link, Branch, bne, Jump, RegToPc, 
		 LoRead, HiRead, MultWrite, done; 
	DP datapath(clk, rst, RegDst, R31Write, RegWrite, ALUSrc, ALUOperation, MemRead, MemWrite, MemToReg, Lui, Link,
				Branch, bne, Jump, RegToPc, LoRead, HiRead, MultWrite, opcode, func);
	Controller control_unit(opcode, clk, rst, RegDst, Branch, MemRead, MemWrite, MemToReg, ALUSrc, RegWrite, Lui, Jump, 
							Link, R31Write, RegToPc, bne, ALUOp);
	ALUControl alu_control(func, ALUOp, ALUOperation);
	MultControl mult_control(func, HiRead, LoRead, MultWrite);
endmodule // Mips
