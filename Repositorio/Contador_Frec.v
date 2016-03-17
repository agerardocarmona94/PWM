`timescale 1ns / 1ps


module Contador_Frec(
    input botton_up,
    input botton_down,
	 input rst,
	 input EN,
	 input clk,
    output reg [2:0] Q);

reg dato_u, dato_d=0;

 always @(posedge clk or posedge rst)
 begin
	    if (rst)
         Q <= 3'b0;
		else if (EN==0)
         if (botton_up & !dato_u)
			begin
				Q <= Q + 3'b1;
				dato_u<=1;
			end
			else if (botton_down & !dato_d)
			begin
				Q <= Q - 3'b1;
				dato_d<=1; 
			end
			else
				begin
					dato_u<=0;
					dato_d<=0;
					Q <= Q;
				end
end
	
endmodule
