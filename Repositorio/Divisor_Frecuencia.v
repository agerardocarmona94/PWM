`timescale 1ns / 1ps

module Divisor_Frecuencia(	 //se definen entradas y salidas del modulos 		
    input wire clk,  		 //entrada de clk y reset
    input wire rst,			 //salidas de cada una de las frecuencias 
    output wire output_25k, 
    output wire output_50k,
    output wire output_75k,
    output wire output_100k,
    output wire output_125k,
    output wire output_150k,
    output wire output_175k,
    output wire output_200k
    );
 
 
 
Frec_25k_0 Frec_25k_0 (       //instanciaciones de los modulos de cada una de las frecuencias 
    .clk(clk), 
    .rst(rst), 
    .output_25k(output_25k)
    );
Frec_50k_1 Frec_50k_1 (
    .clk(clk), 
    .rst(rst), 
    .output_50k(output_50k)
    );
 Frec_75k_2 Frec_75k_2 (
    .clk(clk), 
    .rst(rst), 
    .output_75k(output_75k)
    );
Frec_100k_3 Frec_100k_3 (
    .clk(clk), 
    .rst(rst), 
    .output_100k(output_100k)
    );
Frec_125k_4 Frec_125k_4 (
    .clk(clk), 
    .rst(rst), 
    .output_125k(output_125k)
    );
Frec_150k_5 Frec_150k_5 (
    .clk(clk), 
    .rst(rst), 
    .output_150k(output_150k)
    );
Frec_175k_6 Frec_175k_6 (
    .clk(clk), 
    .rst(rst), 
    .output_175k(output_175k)
    );
 
Frec_200k_7 Frec_200k_7 (
    .clk(clk), 
    .rst(rst), 
    .output_200k(output_200k)
    );
 
endmodule
