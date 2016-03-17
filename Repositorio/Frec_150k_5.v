`timescale 1ns / 1ps

module Frec_150k_5(
    input clk,
    input rst,
    output reg output_150k
    );

reg [8:0] counter=0;
	
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			begin
				counter<=9'd0;
				output_150k<= 1'b0;
			end
		else
			if (counter==9'd332) 
			begin
				counter<=9'd0;
				output_150k <= ~output_150k;
			end
	  else
	   begin
			counter <=counter+1'b1;
		end
	end

endmodule
