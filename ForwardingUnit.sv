
module ForwardingUnit(input[4:0] ID_EX_Rt, ID_EX_Rs, EX_MEM_Rd, EX_MEM_Reg_write, MEM_WB_Rd, MEM_WB_Reg_write,
					output logic[1:0] forward_A , forward_B);
	assign forward_A  = ( MEM_WB_Reg_write == 1 && (MEM_WB_Rd != 0) && 
								!( EX_MEM_Reg_write == 1 && (EX_MEM_Rd != 0) && (EX_MEM_Rd == ID_EX_Rs) ) 
								&& (MEM_WB_Rd == ID_EX_Rs) )? 01: 00;
				
	assign forward_B = ( MEM_WB_Reg_write && (MEM_WB_Rd != 0) && !(EX_MEM_Reg_write  == 1 && (EX_MEM_Rd != 0)
							&& (EX_MEM_Rd == ID_EX_Rt))
							&& (MEM_WB_Rd == ID_EX_Rt))? 01: 00;
endmodule // ForwardingUnit
