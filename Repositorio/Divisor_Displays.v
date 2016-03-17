`timescale 1ns / 1ps

module Divisor_displays(
    input clk,
    input rst,
    output reg q
    );
reg [16:0] counter=0;
	
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			begin
				counter<=17'd0;
				q<= 1'b0;
			end
		else
			if (counter==17'd99999) 
			begin
				counter<=17'd0;
				q <= ~q;
			end
	  else
	   begin
			counter <=counter+1'b1;
		end
	end

endmodule
