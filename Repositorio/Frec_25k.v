`timescale 1ns / 1ps

module Frec_25k_0(
    input clk,
	 input rst,
    output reg output_25k
    );

reg [10:0] counter=0;
	
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			begin
				counter<=11'd0;
				output_25k<= 1'b0;
			end
		else
			if (counter==11'd1999) 
			begin
				counter<=11'd0;
				output_25k <= ~output_25k;
			end
	  else
	   begin
			counter <=counter+1'b1;
		end
	end
endmodule
