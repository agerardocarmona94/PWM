`timescale 1ns / 1ps

module Frec_200k_7(
    input clk,
    input rst,
    output reg output_200k
    );

reg [7:0] counter=0;
	
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			begin
				counter<=8'd0;
				output_200k<= 1'b0;
			end
		else
			if (counter==8'd249) 
			begin
				counter<=8'd0;
				output_200k <= ~output_200k;
			end
	  else
	   begin
			counter <=counter+1'b1;
		end
	end
endmodule
