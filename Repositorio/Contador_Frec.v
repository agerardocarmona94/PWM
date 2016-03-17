`timescale 1ns / 1ps

									//en este bloque se lleva el control de cual es la frecuencia seleccionada por el usuario, la cual va hacia la seleccion del mux de frecuencias
module Contador_Frec(    //declaracion de entradas y salidas
    input botton_up,	    //boton aumento cuenta
    input botton_down,	 //boton dismuye cuenta
	 input rst,				 //reset
	 input EN,				 //Enable
	 input clk,				 //clock
    output reg [2:0] Q); //salida del contador de 3bits 

reg dato_u, dato_d=0;  // variables para mitigar el rebote

 always @(posedge clk or posedge rst)   //se cummple cuando hay un flanco positivo en el clk y el rst
 begin
	    if (rst)
         Q <= 3'b0;    // si reset esta activo pone la salida en 1  
		else if (EN==0)  //si enable esta en cero se desea seleccionar cambio de frecuencia
         if (botton_up & !dato_u) //condicion que se cumple si se aumenta cuenta y no hay un dato previamente guardado del pulsador para evitar rebote 
			begin
				Q <= Q + 3'b1; //aumenta cuenta
				dato_u<=1;     //guarda para el antirrebote
			end
			else if (botton_down & !dato_d) //condicion que se cumple si se disminuye cuenta y no hay un dato previamente guardado del pulsador para evitar rebote 
			begin
				Q <= Q - 3'b1;      //se disminuye cuenta
				dato_d<=1;          //guarda para el antirrebote
			end
			else
				begin
					dato_u<=0; 		  // borra los valores del antirrebote y mantiene la salida en el mismo valor
					dato_d<=0;
					Q <= Q;
				end
end
	
endmodule
