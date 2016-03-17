`timescale 1ns / 1ps

module Frec_100k_3(
    input clk,
    input rst,
    output reg output_100k
    );

reg [8:0] counter=0;
	
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			begin
				counter<=9'd0;
				output_100k<= 1'b0;
			end
		else
			if (counter==9'd499) 
			begin
				counter<=9'd0;
				output_100k <= ~output_100k;
			end	  else
	   begin
			counter <=counter+1'b1;
		end
	end
endmodule
