`timescale 1ns / 1ps

module Contador_PWM(
    input clk,
	 input rst,
    output reg [9:0] z
    );

   always @(posedge clk or posedge rst)
      if (rst)
         z <= 0;
      else
			z <= z + 10'b1;
			

endmodule
