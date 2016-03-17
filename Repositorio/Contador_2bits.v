`timescale 1ns / 1ps

module Contador_2bits( //Este modulo sirve para activar los ánodos de los displays, ya que se tienen que barrer
    input ck,
    input rst,
    output reg [3:0] an  //salida del contador
    );
	 
reg [3:0] cont;

always @(posedge ck or posedge rst) //se cuenta o borra con el flanco positivo del reset o el clk
	begin
		if (rst)					//si reset en alto la cuenta se pone en 0
			begin
				an <=4'b1111; //se colocan los anodos en 1 para ponerlos en cero los displays
				cont=0;  //se pone la cuenta en cero
			end
		else if (cont==4) //si se llega la cuenta a 4 se vuelve a contar desde cero
			cont=0;
		else
			begin
				an<=4'b1111; 
				an[cont]<=0; //se barre cada display 
				cont=cont+4'b1; //aumenta la cuenta del contador
			end
	end

endmodule
