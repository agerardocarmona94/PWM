`timescale 1ns / 1ps

module Decodificador_7seg( // este segmento se encarga de decodificar el numero a mostrar y activar los catodos de los displays segun el numero 
    input [3:0] bcd, //entrada en bcd
    output reg [6:0] segmento //salida a los catodos
    );

always @*
	begin
		case (bcd)       //segun el  numero que se muestra se configuran cuales catodos se activan, en este caso se activan con cero
			4'b0000: segmento=7'b1000000; // 0
			4'b0001: segmento=7'b1111001; //1
			4'b0010: segmento=7'b0100100; //2
			4'b0011: segmento=7'b0110000; //3
			4'b0100: segmento=7'b0011001; //4
			4'b0101: segmento=7'b0010010; //5
			4'b0110: segmento=7'b0000010; //6
			4'b0111: segmento=7'b1111000; //7 
			4'b1000: segmento=7'b0000000; //8
			4'b1001: segmento=7'b0010000; //9
			default: segmento=7'b1111111; //no se muestra nada
		endcase
	end

endmodule
