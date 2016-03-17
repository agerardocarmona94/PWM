`timescale 1ns / 1ps

module Frec_75k_2(
    input clk,
    input rst,
    output reg output_75k
    );


reg [9:0] counter=0;
	
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			begin
				counter<=10'd0;
				output_75k<= 1'b0;
			end
		else
			if (counter==10'd666) 
			begin
				counter<=10'd0;
				output_75k <= ~output_75k;
			end
	  else
	   begin
			counter <=counter+1'b1;
		end
	end
endmodule
