`timescale 1ns / 1ps

module PWM(  				//en este bloque se contiene cada uno de los bloques individuales que cumplen cada uno una funcion diferente
								//se definen entradas y salidas del modulo
	 
	 input Selector_F_I, //entrada para definir si se desea configurar la frecuencia o corriente
    input Aumento,		//entrada que indica si se desea aumentar la cuenta de frec o corriente
    input Disminucion,	//entrada que indica si se desea disminuir la cuenta de frec o corriente
    input reset,			//entrada reset  general
    input clk,				//entrada del clk general
    output pwm,			//salida del pwm
    output [3:0] anodos,	//salida anodos de displays 7 seg
    output [6:0] catodos	//salida catodos de displays 7 seg
    );

	 

wire EN_Selector;
Metastabilidad1 Selector (				// se instancian los botones a modulos para eliminar la metastabilidad
    .Din(Selector_F_I), 
    .clk(clk), 
    .EN_Selector(EN_Selector)
    ); 

	 
wire aumentar; 
Metastabilidad2 Aumenta_Cuenta ( 				// se instancian los botones a modulos para eliminar la metastabilidad
    .Din(Aumento), 
    .clk(clk), 
    .out(aumentar)
    );



wire disminuir;
Metastabilidad3 Disminuir_Cuenta (   				// se instancian los botones a modulos para eliminar la metastabilidad
    .Din(Disminucion), 
    .clk(clk),  
    .out(disminuir)
    );

	 
wire rst;
Metastabilidad4 Reset (   				// se instancian los botones a modulos para eliminar la metastabilidad
    .Din(reset), 
    .clk(clk), 
    .out(rst)
    );
	 

wire [2:0]salida_cont_frec;

Contador_Frec Contador_Frec (
    .botton_up(aumentar), 
    .botton_down(disminuir), 			//se instancia el contador de frecuencia y su salida va hacia la seleccion del mux 
    .rst(rst), 
    .EN(EN_Selector), 
	 .clk(clk),
    .Q(salida_cont_frec)
    );
wire output_25k;
wire output_50k;
wire output_75k;
wire output_100k;
wire output_125k;
wire output_150k;
wire output_175k;
wire output_200k;

Divisor_Frecuencia Divisor_Frecuencia (
    .clk(clk),  									//se instancia el divisor de frecuencias, el cual va hacia el mux
    .rst(rst), 
    .output_25k(output_25k), 
    .output_50k(output_50k), 
    .output_75k(output_75k), 
    .output_100k(output_100k), 
    .output_125k(output_125k), 
    .output_150k(output_150k), 
    .output_175k(output_175k), 
    .output_200k(output_200k)
    );

wire [7:0]f;
assign f[0]=output_25k;
assign f[1]=output_50k;
assign f[2]=output_75k;
assign f[3]=output_100k;
assign f[4]=output_125k;
assign f[5]=output_150k;
assign f[6]=output_175k;
assign f[7]=output_200k;
wire mux_out;

Mux_Frec Mux_Frec (				//se instancia mux que coloca la frecuencia adecuada en el contador PWM
    .f(f), 
    .selec(salida_cont_frec), 
    .z(mux_out)
    );

wire [9:0]conta_PWM;
Contador_PWM Contador_PWM (	//se instancia el contador del PWM, el cual va hacia el comparador 
    .clk(mux_out), 
    .rst(rst), 
    .z(conta_PWM)
    );

wire [4:0]salida_cont_I; 
Contador_Corriente Contador_Corriente (
    .botton_up(aumentar), 						//se instancia el contador de corriente el cual va al decodificador de corriente
    .botton_down(disminuir), 
    .rst(rst), 
    .EN(EN_Selector), 
	 .clk(clk),
    .Q(salida_cont_I)
    );

wire [9:0]cuenta_max;
Decodificador_Corriente Decodificador_Corriente ( //se instancia el decodificador de corriente el cual va al comparador
    .contador_I(salida_cont_I), 
    .cuenta_max(cuenta_max)
    );


Comparador_pwm Comparador_pwm (  //se instancia el comparador el cual va directamente a la salida ya con el PWM
    .contador_clk(conta_PWM), 
    .cuenta_max(cuenta_max), 
    .PWM(pwm)
    );

Control_Displays Control_Displays ( 	//se instancia el control de los displays, el cual va hacia los catodos y anodos de los 7 seg
    .clk(clk), 
    .rst(rst), 
    .selector_F_I(EN_Selector),
    .Corriente(salida_cont_I), 
    .Frecuencia(salida_cont_frec), 
    .catodo(catodos), 
    .anodo(anodos)
    );


endmodule
