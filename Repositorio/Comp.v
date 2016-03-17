`timescale 1ns / 1ps

module Comparador_pwm(       //En este bloque se realiza la modulacion del ancho de pulso ya que se mantentra la salida en alto mientras no se pase el valor de cuenta maxima
input wire [9:0] contador_clk,//entrada de la frecuencia definida por el contador del pwm
input wire [9:0] cuenta_max,//entrada de cuenta maxima proveniente del decodificador de corriente
output reg PWM //salida PWM
    );

always @*
		begin
		if(contador_clk<cuenta_max)begin // mientras que el contador del pwm sea menor que la cuenta maxima mantiene la salida en alto
		PWM=1;
		end else begin
		PWM=0;//una vez pasada cuenta max se pone la salida en bajo
		end

end
endmodule
 
