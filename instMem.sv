`timescale 1ns/1ns

module InsMem(input[31:0] pc, output logic[31:0] inst);
	logic[31:0] insMem [127:0];

	assign inst = insMem[pc];
	
// 											edit here to add instructions 
// ************************************************test1*************************************************************
	//load from mem to 1-10 registers...
	// assign insMem[0] = 32'b 10001100000000010000000011111011; // load mem[1000/4 + 1] in r1  
	// assign insMem[1] = 32'b 10001100000000100000000011111100; // load mem[1004/4 + 1] in r2 
	// assign insMem[2] = 32'b 10001100000000110000000011111101; // load mem[1008/4 + 1] in r3
	// assign insMem[3] = 32'b 10001100000001000000000011111110; // load mem[1012/4 + 1] in r4
	// assign insMem[4] = 32'b 10001100000001010000000011111111; // load mem[1016/4 + 1] in r5
	// assign insMem[5] = 32'b 10001100000001100000000100000000; // load mem[1020/4 + 1] in r6
	// assign insMem[6] = 32'b 10001100000001110000000100000001; // load mem[1024/4 + 1] in r7 
	// assign insMem[7] = 32'b 10001100000010000000000100000010; // load mem[1028/4 + 1] in r8
	// assign insMem[8] = 32'b 10001100000010010000000100000011; // load mem[1032/4 + 1] in r9
	// assign insMem[9] = 32'b 10001100000010100000000100000100; // load mem[1036/4 + 1] in r10
	// end of loading 
	//adding... 
	// assign insMem[10] = 32'b 00000000001000100101100000100000; //add r1+r2 in r11
	// assign insMem[11] = 32'b 00000001011000110101100000100000; //add r11+r3 in r11
	// assign insMem[12] = 32'b 00000001011001000101100000100000; //add r11+r4 in r11
	// assign insMem[13] = 32'b 00000001011001010101100000100000; //add r11+r5 in r11
	// assign insMem[14] = 32'b 00000001011001100101100000100000; //add r11+r6 in r11
	// assign insMem[15] = 32'b 00000001011001110101100000100000; //add r11+r7 in r11
	// assign insMem[16] = 32'b 00000001011010000101100000100000; //add r11+r8 in r11
	// assign insMem[17] = 32'b 00000001011010010101100000100000; //add r11+r9 in r11
	// assign insMem[18] = 32'b 00000001011010100101100000100000; //add r11+r10 in r11
	//end of adding
	//storing...
	// assign insMem[19] = 32'b 10101100000010110000000111110101; //store r11 in mem[2000/4 + 1] 
	//end of storing
// ****************************************************************************************************************
//******************************************************test2******************************************************	
	//load from mem to 1-20 registers...
	assign insMem[0] = 32'b 10001100000000010000000011111011; // load mem[1000/4 + 1] in r1  
	assign insMem[1] = 32'b 10001100000000100000000011111100; // load mem[1004/4 + 1] in r2 
	assign insMem[2] = 32'b 10001100000000110000000011111101; // load mem[1008/4 + 1] in r3
	assign insMem[3] = 32'b 10001100000001000000000011111110; // load mem[1012/4 + 1] in r4
	assign insMem[4] = 32'b 10001100000001010000000011111111; // load mem[1016/4 + 1] in r5
	assign insMem[5] = 32'b 10001100000001100000000100000000; // load mem[1020/4 + 1] in r6
	assign insMem[6] = 32'b 10001100000001110000000100000001; // load mem[1024/4 + 1] in r7 
	assign insMem[7] = 32'b 10001100000010000000000100000010; // load mem[1028/4 + 1] in r8
	assign insMem[8] = 32'b 10001100000010010000000100000011; // load mem[1032/4 + 1] in r9
	assign insMem[9] = 32'b 10001100000010100000000100000100; // load mem[1036/4 + 1] in r10
	assign insMem[10] = 32'b 10001100000010110000000100000101; // load mem[1040/4 + 1] in r11
	assign insMem[11] = 32'b 10001100000011000000000100000110; // load mem[1044/4 + 1] in r12
	assign insMem[12] = 32'b 10001100000011010000000100000111; // load mem[1048/4 + 1] in r13
	assign insMem[13] = 32'b 10001100000011100000000100001000; // load mem[1052/4 + 1] in r14
	assign insMem[14] = 32'b 10001100000011110000000100001001; // load mem[1056/4 + 1] in r15
	assign insMem[15] = 32'b 10001100000100000000000100001010; // load mem[1060/4 + 1] in r16
	assign insMem[16] = 32'b 10001100000100010000000100001011; // load mem[1064/4 + 1] in r17
	assign insMem[17] = 32'b 10001100000100100000000100001100; // load mem[1068/4 + 1] in r18
	assign insMem[18] = 32'b 10001100000100110000000100001101; // load mem[1072/4 + 1] in r19
	assign insMem[19] = 32'b 10001100000101000000000100001110; // load mem[1076/4 + 1] in r20
	//end of loading
	//find max... , each step store slt result in r21, store max in r22, and store index in r23
	assign insMem[20] = 32'b 00000000000000011011000000100000; //add r1,r0 in r22

	assign insMem[21] = 32'b 00000000000000001011100000100000;// add r0,r0 in r23

	assign insMem[22] = 32'b 00000010110000101010100000101010; // slt r22,r2 in r21
	assign insMem[23] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r2) skip next instruction
	assign insMem[24] = 32'b 00000000000000101011000000100000; // add r0,r2 in r22

	assign insMem[25] = 32'b 00100000000101110000000000000001; // addi r0,1 in r23

	// assign insMem[23] = 32'b 00000000000000011011000000100000; // add r0,r1 in r22

	assign insMem[26] = 32'b 00000010110000111010100000101010; // slt r22,r3 in r21
	assign insMem[27] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r3) skip next instruction
	assign insMem[28] = 32'b 00000000000000111011000000100000; // add r0,r3 in r22
	
	assign insMem[29] = 32'b 00100000000101110000000000000010; // addi r0,2 in r23

	assign insMem[30] = 32'b 00000010110001001010100000101010; // slt r22,r4 in r21
	assign insMem[31] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r4) skip next instruction
	assign insMem[32] = 32'b 00000000000001001011000000100000; // add r0,r4 in r22

	assign insMem[33] = 32'b 00100000000101110000000000000011; // addi r0,3 in r23

	assign insMem[34] = 32'b 00000010110001011010100000101010; // slt r22,r5 in r21
	assign insMem[35] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r5) skip next instruction
	assign insMem[36] = 32'b 00000000000001011011000000100000; // add r0,r5 in r22

	assign insMem[37] = 32'b 00100000000101110000000000000100; // addi r0,4 in r23

	assign insMem[38] = 32'b 00000010110001101010100000101010; // slt r22,r6 in r21
	assign insMem[39] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r6) skip next instruction
	assign insMem[40] = 32'b 00000000000001101011000000100000; // add r0,r6 in r22

	assign insMem[41] = 32'b 00100000000101110000000000000101; // addi r0,5 in r23

	assign insMem[42] = 32'b 00000010110001111010100000101010; // slt r22,r7 in r21
	assign insMem[43] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r7) skip next instruction
	assign insMem[44] = 32'b 00000000000001111011000000100000; // add r0,r7 in r22

	assign insMem[45] = 32'b 00100000000101110000000000000110; // addi r0,6 in r23

	assign insMem[46] = 32'b 00000010110010001010100000101010; // slt r22,r8 in r21
	assign insMem[47] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r8) skip next instruction
	assign insMem[48] = 32'b 00000000000010001011000000100000; // add r0,r8 in r22

	assign insMem[49] = 32'b 00100000000101110000000000000111; // addi r0,7 in r23

	assign insMem[50] = 32'b 00000010110010011010100000101010; // slt r22,r9 in r21
	assign insMem[51] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r9) skip next instruction
	assign insMem[52] = 32'b 00000000000010011011000000100000; // add r0,r9 in r22

	assign insMem[53] = 32'b 00100000000101110000000000001000; // addi r0,8 in r23

	assign insMem[54] = 32'b 00000010110010101010100000101010; // slt r22,r10 in r21
	assign insMem[55] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r10) skip next instruction
	assign insMem[56] = 32'b 00000000000010101011000000100000; // add r0,r10 in r22

	assign insMem[57] = 32'b 00100000000101110000000000001001; // addi r0,9 in r23

	assign insMem[58] = 32'b 00000010110010111010100000101010; // slt r22,r11 in r21
	assign insMem[59] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r11) skip next instruction
	assign insMem[60] = 32'b 00000000000010111011000000100000; // add r0,r11 in r22

	assign insMem[61] = 32'b 00100000000101110000000000001010; // addi r0,10 in r23

	assign insMem[62] = 32'b 00000010110011001010100000101010; // slt r22,r12 in r21
	assign insMem[63] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r12) skip next instruction
	assign insMem[64] = 32'b 00000000000011001011000000100000; // add r0,r12 in r22

	assign insMem[65] = 32'b 00100000000101110000000000001011; // addi r0,11 in r23

	assign insMem[66] = 32'b 00000010110011011010100000101010; // slt r22,r13 in r21
	assign insMem[67] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r13) skip next instruction
	assign insMem[68] = 32'b 00000000000011011011000000100000; // add r0,r13 in r22

	assign insMem[69] = 32'b 00100000000101110000000000001100; // addi r0,12 in r23

	assign insMem[70] = 32'b 00000010110011101010100000101010; // slt r22,r14 in r21
	assign insMem[71] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r14) skip next instruction
	assign insMem[72] = 32'b 00000000000011101011000000100000; // add r0,r14 in r22

	assign insMem[73] = 32'b 00100000000101110000000000001101; // addi r0,13 in r23

	assign insMem[74] = 32'b 00000010110011111010100000101010; // slt r22,r15 in r21
	assign insMem[75] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r15) skip next instruction
	assign insMem[76] = 32'b 00000000000011111011000000100000; // add r0,r15 in r22

	assign insMem[77] = 32'b 00100000000101110000000000001110; // addi r0,14 in r23

	assign insMem[78] = 32'b 00000010110100001010100000101010; // slt r22,r16 in r21
	assign insMem[79] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r16) skip next instruction
	assign insMem[80] = 32'b 00000000000100001011000000100000; // add r0,r16 in r22

	assign insMem[81] = 32'b 00100000000101110000000000001111; // addi r0,15 in r23

	assign insMem[82] = 32'b 00000010110100011010100000101010; // slt r22,r17 in r21
	assign insMem[83] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r17) skip next instruction
	assign insMem[84] = 32'b 00000000000100011011000000100000; // add r0,r17 in r22

	assign insMem[85] = 32'b 00100000000101110000000000010000; // addi r0,16 in r23

	assign insMem[86] = 32'b 00000010110100101010100000101010; // slt r22,r18 in r21
	assign insMem[87] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r18) skip next instruction
	assign insMem[88] = 32'b 00000000000100101011000000100000; // add r0,r18 in r22

	assign insMem[89] = 32'b 00100000000101110000000000010001; // addi r0,17 in r23

	assign insMem[90] = 32'b 00000010110100111010100000101010; // slt r22,r19 in r21
	assign insMem[91] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r19) skip next instruction
	assign insMem[92] = 32'b 00000000000100111011000000100000; // add r0,r19 in r22

	assign insMem[93] = 32'b 00100000000101110000000000010010; // addi r0,18 in r23

	assign insMem[94] = 32'b 00000010110101001010100000101010; // slt r22,r20 in r21
	assign insMem[95] = 32'b 00010010101000000000000000000010; // beq: if r21 is 0(r22>r20) skip next instruction
	assign insMem[96] = 32'b 00000000000101001011000000100000; // add r0,r20 in r22

	assign insMem[97] = 32'b 00100000000101110000000000010011; // addi r0,19 in r23

	//end of finding max and index
	//store max and index in memory

	assign insMem[98] = 32'b 10101100000101100000000111110101; //store r22 in mem[2000/4 + 1]
	assign insMem[99] = 32'b 10101100000101110000000111110110; //store r23 in mem[2004/4 + 1] 

	//end of store

// *****************************************************************************************************************
endmodule 
