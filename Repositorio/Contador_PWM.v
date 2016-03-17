`timescale 1ns / 1ps

module Contador_PWM(      // en este bloque se implemento un contador el cual ira a una frecuencia delimitada proveniente del mux de frecuencias   
    input clk,				 //la cual va hacia el comparador donde se realiza la verdadera modulacion del pulso
	 input rst,
    output reg [9:0] z  //se definen las entradas y la salida de 10 bits del contador
    );

   always @(posedge clk or posedge rst)  //se realiza su funcion en el flanco positivo del clk o rst
      if (rst)							//si el rst esta activo se pasa la cuenta a 0
         z <= 0;
      else
			z <= z + 10'b1;			//se aumenta la cuenta en una unidad
			

endmodule
