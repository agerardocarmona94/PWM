`timescale 1ns / 1ps

module Metastabilidad1(  //modulo para evitar los efectos del rebote del pulsador
    input Din,			    //Declaracion de entradas y salidas
    input clk,			    //el modulo consiste en flipflops tipo D en cascada
	 output EN_Selector
    );

wire q0,q1,q2,q3;

FF_0 FF_0 (        //FlipFlop 0
    .ck(clk), 
    .d(Din), 
    .q(q0)
    );

FF_1 FF_1 (			//FlipFlop 1
    .ck(clk), 
    .d(q0), 
    .q(q1)
    );

FF_2 FF_2 (			//FlipFlop 2
    .ck(clk), 
    .d(q1), 
    .q(q2)
    );

FF_3 FF_3 (			//FlipFlop 3
    .ck(clk), 
    .d(q2), 
    .q(q3)
    );

FF_4 FF_4 (			//FlipFlop 4
    .ck(clk), 
    .d(q3), 
    .q(EN_Selector)
    );






endmodule
