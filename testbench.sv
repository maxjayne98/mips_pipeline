`timescale 1ns/1ns

module TB();

	reg clk=0;
	reg rst=1;

	Mips uut1(clk, rst);

	initial 
		repeat(300) #10 clk=~clk;
	
	initial begin 
		#2 rst=0;
	end
endmodule // TB 