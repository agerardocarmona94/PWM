`timescale 1ns / 1ps

module PWM(
    input Selector_F_I,
    input Aumento,
    input Disminucion,
    input reset,
    input clk,
    output pwm,
    output [3:0] anodos,
    output [6:0] catodos
    );

	 

wire EN_Selector;
Metastabilidad1 Selector (
    .Din(Selector_F_I), 
    .clk(clk), 
    .EN_Selector(EN_Selector)
    ); 

	 
wire aumentar; 
Metastabilidad2 Aumenta_Cuenta (
    .Din(Aumento), 
    .clk(clk), 
    .out(aumentar)
    );



wire disminuir;
Metastabilidad3 Disminuir_Cuenta (
    .Din(Disminucion), 
    .clk(clk),  
    .out(disminuir)
    );

	 
wire rst;
Metastabilidad4 Reset (
    .Din(reset), 
    .clk(clk), 
    .out(rst)
    );
	 

wire [2:0]salida_cont_frec;

Contador_Frec Contador_Frec (
    .botton_up(aumentar), 
    .botton_down(disminuir), 
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
    .clk(clk), 
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

Mux_Frec Mux_Frec (
    .f(f), 
    .selec(salida_cont_frec), 
    .z(mux_out)
    );

wire [9:0]conta_PWM;
Contador_PWM Contador_PWM (
    .clk(mux_out), 
    .rst(rst), 
    .z(conta_PWM)
    );

wire [4:0]salida_cont_I; 
Contador_Corriente Contador_Corriente (
    .botton_up(aumentar), 
    .botton_down(disminuir), 
    .rst(rst), 
    .EN(EN_Selector), 
	 .clk(clk),
    .Q(salida_cont_I)
    );

wire [9:0]cuenta_max;
Decodificador_Corriente Decodificador_Corriente (
    .contador_I(salida_cont_I), 
    .cuenta_max(cuenta_max)
    );


Comparador_pwm Comparador_pwm (
    .contador_clk(conta_PWM), 
    .cuenta_max(cuenta_max), 
    .PWM(pwm)
    );

Control_Displays Control_Displays (
    .clk(clk), 
    .rst(rst), 
    .selector_F_I(EN_Selector),
    .Corriente(salida_cont_I), 
    .Frecuencia(salida_cont_frec), 
    .catodo(catodos), 
    .anodo(anodos)
    );


endmodule
