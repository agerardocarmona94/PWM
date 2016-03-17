`timescale 1ns / 1ps

module Contador_Corriente(		//en este bloque se lleva el control de cual es la corriente seleccionada por el usuario, y su salida va hacia un decodificador de corriente que contiene cual valor del contador corresponde a cada valor de corriente 
    //declaracion de entradas y salidas
	 input botton_up,	//aumenta cuenta			
    input botton_down, //disminuye cuenta
	 input rst,//reset
	 input EN,//enable
	 input clk,//Clock
    output reg [4:0] Q  //salida del contador de 5 bits
    );

   always@(posedge clk or posedge rst) //se realizaen el flanco positivo del clk o el rst
begin
      if (rst)
				Q <= 0;  //si rst esta activo pone la cuenta en cero
		else if (EN==1) //si enable esta en alto se desea seleccionar cambio de corriente
			if (botton_up)//si se quiere aumentar, aumenta en uno la cuenta
				Q <= Q + 5'b1;
			else if (botton_down)//si se quiere disminuir, disminuye en uno la cuenta
				Q <= Q - 5'b1;
			else 
				Q <= Q; //mantiene la salida
					
end 

endmodule
