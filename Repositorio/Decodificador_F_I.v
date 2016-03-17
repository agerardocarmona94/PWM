`timescale 1ns / 1ps

module Decodificador_F_I(  //en este bloque se decodifica el dato como frecuencia a corriente para poder mostrarlo en los displays
    input [4:0] Corriente, //recibe la cuenta del contador de corriente 
    input [2:0] Frecuencia, //recibe la cuenta del contador de frecuencia
    input selector_F_I,//0->Frec, 1->corriente
    output reg [15:0] dato_Hx//Bits necesarios para usar 4 displays

    );
always  @*
begin
if (selector_F_I==0)//si se selecciona frecuencia 
	begin
	case(Frecuencia)        //se decodifica el numero del contador con el valor correspondiente de frecuencia 
		0: dato_Hx =15'h0025; //25kHz
		1: dato_Hx =15'h0050; //50kHz
		2: dato_Hx =15'h0075; //75kHz
		3: dato_Hx =15'h0100; //100kHz
		4: dato_Hx =15'h0125; //125kHz
		5: dato_Hx =15'h0150; //150kHz
		6: dato_Hx =15'h0175; //175kHz
		7: dato_Hx =15'h0200; //200kHz
	endcase
	end
	
else if (selector_F_I==1)//si se selecciona frecuencia 
	begin
	case(Corriente) //se decodifica el numero del contador con el valor correspondiente de corriente
		0: dato_Hx =15'h0000;
		1: dato_Hx =15'h0031;
		2: dato_Hx =15'h0062;
		3: dato_Hx =15'h0094;
		4: dato_Hx =15'h0125;					//el numero corresponde con la a¿cantidad de amperes de corriente
		5: dato_Hx =15'h0156;
		6: dato_Hx =15'h0187;
		7: dato_Hx =15'h0219;
		8: dato_Hx =15'h0250;
		9: dato_Hx =15'h0281;
		10: dato_Hx =15'h0312;
		11: dato_Hx =15'h0344;
		12: dato_Hx =15'h0375;
		13: dato_Hx =15'h0406;
		14: dato_Hx =15'h0437;
		15: dato_Hx =15'h0469;
		16: dato_Hx =15'h0500;
		17: dato_Hx =15'h0531;
		18: dato_Hx =15'h0562;
		19: dato_Hx =15'h0594;
		20: dato_Hx =15'h0625;
		21: dato_Hx =15'h0656;
		22: dato_Hx =15'h0687;
		23: dato_Hx =15'h0719;
		24: dato_Hx =15'h0750;
		25: dato_Hx =15'h0781;
		26: dato_Hx =15'h0812;
		27: dato_Hx =15'h0844;
		28: dato_Hx =15'h0875;
		29: dato_Hx =15'h0906;
		30: dato_Hx =15'h0937;
		31: dato_Hx =15'h0969;	
	endcase
	end
end

endmodule
