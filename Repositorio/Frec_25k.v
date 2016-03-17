`timescale 1ns / 1ps

module Frec_25k_0(
    input clk,      						//modulo de divisor de frecuencia consiste en un contador el cual divide la frecuencia de la fpga
	 input rst,								//declaracion de entradas y salida 
    output reg output_25k				
    );

reg [10:0] counter=0; // declaracion del tamaño del contador
	
	always @(posedge clk or posedge rst)   //activacion del contador con flanco positivo de clk o rst
	begin
		if (rst)					//si se activa reset la cuenta y la salida se ponen en cero
			begin
				counter<=11'd0;
				output_25k<= 1'b0;
			end
		else
			if (counter==11'd1999)  //se delimita la cuenta del contador para poder dividir la frecuencia requerida
			begin
				counter<=11'd0;
				output_25k <= ~output_25k;
			end
	  else
	   begin
			counter <=counter+1'b1; //se aumenta la cuenta del contador en 1
		end
	end
endmodule
