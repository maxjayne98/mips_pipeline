`timescale 1ns/1ns

module SignExtender(input[15:0] in, output logic[31:0] out);
  assign out = {in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15],in[15:0]};
endmodule 	

