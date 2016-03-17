`timescale 1ns / 1ps

module Metastabilidad2(  //modulo para evitar los efectos del rebote del pulsador
    input Din,			    //Declaracion de entradas y salidas
    input clk,			    //el modulo consiste en flipflops tipo D en cascada
	 output out
    );

wire q0,q1,q2,q3;

FF_5 FF_5 (        //FlipFlop 0
    .ck(clk), 
    .d(Din), 
    .q(q0)
    );

FF_6 FF_6 (			//FlipFlop 1
    .ck(clk), 
    .d(q0), 
    .q(q1)
    );

FF_7 FF_7 (			//FlipFlop 2
    .ck(clk), 
    .d(q1), 
    .q(q2)
    );

FF_8 FF_8 (			//FlipFlop 3
    .ck(clk), 
    .d(q2), 
    .q(q3)
    );

FF_9 FF_9 (			//FlipFlop 4
    .ck(clk), 
    .d(q3), 
    .q(out)
    );






endmodule

