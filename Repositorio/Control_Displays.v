`timescale 1ns / 1ps

module Control_Displays(
    input clk,
    input rst,
    input selector_F_I,
	 input [4:0] Corriente,
    input [2:0] Frecuencia,
    output wire [6:0] catodo,
    output wire [3:0] anodo
    );
	 
wire q;
wire [3:0]y;
wire [3:0]D1;
wire [3:0]D2;
wire [3:0]D3;
wire [3:0]D4;
wire [15:0]dato;

assign D4= dato[15:12];
assign D3= dato[11:8];
assign D2= dato[7:4];
assign D1= dato[3:0];

//-----------------------------------------
Decodificador_F_I Decodificador_F_I (
    .Corriente(Corriente), 
    .Frecuencia(Frecuencia), 
    .selector_F_I(selector_F_I), 
    .dato_Hx(dato)
    );
	 
//-----------------------------------------
Divisor_displays Divisor_displays (
    .clk(clk), 
    .rst(rst), 
    .q(q)
    );

//-----------------------------------------
Contador_2bits Contador_2bits (
    .ck(q), 
    .rst(rst), 
    .an(anodo)
    );
	 
//-----------------------------------------
Mux_Displays Mux_Displays (
    .select(anodo), 
    .dato_D1(D1), 
    .dato_D2(D2), 
    .dato_D3(D3), 
    .dato_D4(D4), 
    .y(y)
    );
	 
//-----------------------------------------
Decodificador_7seg Decodificador_7seg (
    .bcd(y),
    .segmento(catodo)
    );
	 
endmodule
