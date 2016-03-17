`timescale 1ns / 1ps

module Contador_Corriente(
   input botton_up,
    input botton_down,
	 input rst,
	 input EN,
	 input clk,
    output reg [4:0] Q 
    );

   always@(posedge clk or posedge rst)
begin
      if (rst)
				Q <= 0;
		else if (EN==1)
			if (botton_up)
				Q <= Q + 5'b1;
			else if (botton_down)
				Q <= Q - 5'b1;
			else 
				Q <= Q;
					
end 

endmodule
