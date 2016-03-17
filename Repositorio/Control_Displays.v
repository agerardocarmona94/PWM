`timescale 1ns / 1ps

module Control_Displays(   //este modulo se encarga de controlar lo que se mostrara en el 7 segmentos
    input clk,					//declaracion de entradas y salidas del modulo 
    input rst,	
    input selector_F_I, //entrada de seleccion de frecuencia o corriente 
	 input [4:0] Corriente, //entrada del contador de corriente
    input [2:0] Frecuencia, //entrada del contador de frecuencia
    output wire [6:0] catodo, //salida de control a los catodos
    output wire [3:0] anodo //salida de control a los anodos
    );
	 
wire q;         //declaracion de wire para interconectar modulos
wire [3:0]y;
wire [3:0]D1;
wire [3:0]D2;
wire [3:0]D3;
wire [3:0]D4;
wire [15:0]dato;

assign D4= dato[15:12]; //separacion de cada uno de los bytes
assign D3= dato[11:8];
assign D2= dato[7:4];
assign D1= dato[3:0];

//-----------------------------------------
Decodificador_F_I Decodificador_F_I (  // instanciacion del decodificador de los valores de corriente, frecuencia y seleccion a datos hexadecimales
    .Corriente(Corriente), 
    .Frecuencia(Frecuencia), 
    .selector_F_I(selector_F_I), 
    .dato_Hx(dato)
    );
	 
//-----------------------------------------
Divisor_displays Divisor_displays (   //instanciacion del divisor de frecuencia de los displays
    .clk(clk), 
    .rst(rst), 
    .q(q)
    );

//-----------------------------------------
Contador_2bits Contador_2bits (   //instanciacion del contador de 2 bits para barrer los 7 sementos
    .ck(q), 
    .rst(rst), 
    .an(anodo)
    );
	 
//-----------------------------------------
Mux_Displays Mux_Displays (  //instanciacion del multiplexor 
    .select(anodo), 
    .dato_D1(D1), 
    .dato_D2(D2), 
    .dato_D3(D3), 
    .dato_D4(D4), 
    .y(y)
    );
	 
//-----------------------------------------
Decodificador_7seg Decodificador_7seg (  //instanciacion de bcd
    .bcd(y),
    .segmento(catodo)
    );
	 
endmodule
