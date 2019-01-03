`timescale 1ns/1ns

module DP(input clk, rst, RegDst, R31Write, RegWrite, ALUSrc, input[2:0] ALUOperation, input MemRead, MemWrite, MemToReg, lui, Link,
				Branch, bne, Jump, RegToPc, LoRead, HiRead, MultWrite, output logic[5:0] opcode, func);
	wire[31:0] pc_in, pc_out, instruction, w1, reg_data1, reg_data2, w4, alu_in2, alu_res, memory_data, 
				w5, w6, w7, w8, w9, w10, w11, w14, w15, w16, w17, w18; 
	wire[4:0] w2, w3;
	wire w12, w13, m7_sel, Move, zero;   
	wire[63:0] mult_res; 
	PC program_counter(pc_in, clk , rst, pc_out);	
	InsMem inst_memory(pc_out, instruction);
	Adder_32 a1(pc_out, 32'b00000000000000000000000000000001, w1);
	Mux5 m1(instruction[20:16], instruction[15:11], RegDst, w2);
	Mux5 m2(w2, 5'b11111, R31Write, w3);
	RegFile register_file(instruction[25:21], instruction[20:16], w3, w17, clk, rst, RegWrite, reg_data1, reg_data2);
	SignExtender sign_extender(instruction[15:0], w18);
	Mux32 m3(reg_data2, w18, ALUSrc, alu_in2);
	ALU alu_unit(reg_data1, alu_in2, ALUOperation, alu_res, mult_res, zero);
	DataMem data_memory(alu_res, reg_data2, clk, rst, MemRead, MemWrite, memory_data);
	Mux32 m4(alu_res, memory_data, MemToReg, w5);
	SHL16 shift_16(instruction[15:0], w6);
	Mux32 m5(w5, w6, lui, w7);
	Mux32 m6(w7, w8, Link, w4);
	SHL2 shift_2(w5, w9);
	Adder_32 a2(w1, w9, w10);
	Mux32 m7(w1, w10, m7_sel, w11);
	and #(0) and1(w12, Branch, zero);
	and #(0) and2(w13, bne, !zero);
	or #(0) or1(m7_sel, w12, w13);
	Mux32 m8(w11, 32'b00000000000000000000000000000001, Link, w8);
	Mux32 m9(w5, {pc_out[31:28], instruction[25:0], 2'b00}, Jump, w14);
	Mux32 m10(w11, w14, Jump, w15);
	Mux32 m11(w15, reg_data1, RegToPc, pc_in);
	MultUnit mult_unit(mult_res, clk, rst, LoRead, HiRead, MultWrite, w16);
	or #(0) or2(Move, LoRead, HiRead);
	Mux32 m12(w4, w16, Move, w17);
	assign opcode = instruction[31:26];
	assign func = instruction[5:0];

endmodule // DP
