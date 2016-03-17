`timescale 1ns / 1ps

module Mux_Displays(  // este multiplexor toma los valores del decodificador y pasa al decodificador de 7 segmentos el numero a mostrar
    input [3:0] select,   //esta entrada proviene del contador para igualmente barrer cada display
    input [3:0] dato_D1,  //se colocan cada uno de los numeros a mostrar en las entradas del multiplexor como se pude ver son D1,D2,D3,D4 
	 input [3:0] dato_D2,
	 input [3:0] dato_D3,
	 input [3:0] dato_D4,

    output reg [3:0] y //se define la salida del mux
    );
always @*
	begin
		case (select) //dependiendo del display que se vca mostrando se coloca el dato a la salida
			4'b0111: y=dato_D4;
			4'b1011: y=dato_D3;
			4'b1101: y=dato_D2;
			4'b1110: y=dato_D1;
			default: y=dato_D4;		//determinadamente se muestra en el display menos significativo
		endcase
end
endmodule
