`timescale 1ns / 1ps

module Frec_175k_6(
    input clk,
    input rst,						//igual que el de 25kHz
    output reg output_175k
    );
	 
reg [8:0] counter=0;
	
	always @(posedge clk or posedge rst)
	begin
		if (rst)
			begin
				counter<=9'd0;
				output_175k<= 1'b0;
			end
		else
			if (counter==9'd285) 
			begin
				counter<=9'd0;
				output_175k <= ~output_175k;
			end
	  else
	   begin
			counter <=counter+1'b1;
		end
	end

endmodule
