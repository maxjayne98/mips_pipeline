
//******************************************* IF/ID *****************************************************************

module IF_ID_Reg(input clk, rst, flush, stall, input[31:0] instruction_in, next_pc_in, 
	output logic[31:0] instruction_out, next_pc_out);
	always@(posedge clk, posedge rst) begin
		if (rst || flush) begin instruction_out <=0;
			next_pc_out <= 0;
		end
		else if (~stall) begin
			instruction_out <= instruction_in;
			next_pc_out <= next_pc_in;
		end
	end
endmodule // IF_ID_Reg


//******************************************** ID/EX *****************************************************************

module ID_EX_Reg(input clk, rst, input[31:0] next_pc_in, data_1_in, data_2_in, sign_extended_address, 
				input[4:0] instr20_16_in, instr15_11_in, output logic[31:0] next_pc_out, data_1_out, data_2_out, 
				output logic[4:0] instr20_16_out, instr15_11_out);
	
	always @(posedge clk, rst) begin
		if (rst) begin
			next_pc_out <= 0; 
			data_1_out <= 0;
			data_2_out <= 0;
			instr20_16_out <= 0;
			instr15_11_out <= 0;
		end
		else begin
			next_pc_out <= next_pc_in;
			data_1_out <= data_1_in;
			data_2_out <= data_2_in;
			instr20_16_out <= instr20_16_in;
			instr15_11_out <= instr15_11_in;
		end
	end
endmodule


//*********************************************** EX/MEM ***************************************************************

module EX_MEM_Reg(input clk, rst, zero, input[31:0] Alu_res_in, mem_write_data_in, mem_address_in, next_pc_in, 
				input[4:0] reg_dst_in, output logic[31:0] Alu_res_out , mem_write_data_out, mem_address_out, next_pc_out);
	
	always @(posedge clk, rst) begin
		if (rst) begin
			Alu_res_out <= 0 ;
			mem_write_data_out <= 0;
			mem_address_out <= 0;
			next_pc_out <= 0;
		end // if (rst)
		else begin
			Alu_res_out <= Alu_res_in;
			mem_write_data_out <= mem_write_data_in;
			mem_address_out <= mem_address_in;
			next_pc_out <= next_pc_in;
		end 
	end
endmodule

//*********************************************** MEM/WB *******************************************************************

module MEM_WB_Reg(input clk, rst, input[31:0] mem_data_in, mem_address_in, input[4:0] reg_dst_in, 
				output logic[31:0] mem_data_out, mem_address_out, output logic[4:0] reg_dst_out);
	
	always @(posedge clk, posedge rst) begin
		if(rst) begin
				mem_data_out <= 0;
				mem_address_out <= 0;
				reg_dst_out <= 0;
		end
		else begin
			mem_data_out <= mem_data_in;
			mem_address_out <= mem_data_in;
			reg_dst_out <= reg_dst_in;
		end
	end

endmodule
