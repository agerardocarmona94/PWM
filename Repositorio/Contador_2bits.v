`timescale 1ns / 1ps

module Contador_2bits( //para activar los ánodos de los displays
    input ck,
    input rst,
    output reg [3:0] an
    );
	 
reg [3:0] cont;

always @(posedge ck or posedge rst)
	begin
		if (rst)
			begin
				an <=4'b1111;
				cont=0;
			end
		else if (cont==4)
			cont=0;
		else
			begin
				an<=4'b1111;
				an[cont]<=0;
				cont=cont+4'b1;
			end
	end

endmodule
