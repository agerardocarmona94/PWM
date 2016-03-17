`timescale 1ns / 1ps

module Comparador_pwm(input wire [9:0] contador_clk,
input wire [9:0] cuenta_max,
output reg PWM
    );

always @*
		begin
		if(contador_clk<cuenta_max)begin
		PWM=1;
		end else begin
		PWM=0;
		end

end
endmodule
 
