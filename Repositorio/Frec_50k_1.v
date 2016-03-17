`timescale 1ns / 1ps

module Frec_50k_1(
    input clk,
    input rst,      //igual que el de 25kHz
    output reg output_50k
    );

reg [9:0] counter=0;
	
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			begin
				counter<=10'd0;
				output_50k<= 1'b0;
			end
		else
			if (counter==10'd999) 
			begin
				counter<=10'd0;
				output_50k <= ~output_50k;
			end
	  else
	   begin
			counter <=counter+1'b1;
		end
	end

endmodule
