`timescale 1ns / 1ps

module FF_0(     //declaracion de entradas y salidas del Flip Flop
	input ck,d,
	output reg q
	);
	
always @ (posedge ck )    
	q <= d;						//pone la entrada en la salida con un flanco positivo de reloj
endmodule 
