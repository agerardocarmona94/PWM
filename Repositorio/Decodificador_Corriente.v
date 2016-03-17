`timescale 1ns / 1ps

module Decodificador_Corriente(
    input [4:0] contador_I,
    output reg [9:0] cuenta_max
    );

always @*
begin
	case(contador_I)
		0: cuenta_max=0;
		1: cuenta_max=32;
		2: cuenta_max=64;
		3: cuenta_max=96;
		4: cuenta_max=128;
		5: cuenta_max=160;
		6: cuenta_max=192;
		7: cuenta_max=224;
		8: cuenta_max=256;
		9: cuenta_max=288;
		10: cuenta_max=320;
		11: cuenta_max=352;
		12: cuenta_max=384;
		13: cuenta_max=416;
		14: cuenta_max=448;
		15: cuenta_max=480;
		16: cuenta_max=512;
		17: cuenta_max=544;
		18: cuenta_max=576;
		19: cuenta_max=608;
		20: cuenta_max=640;
		21: cuenta_max=672;
		22: cuenta_max=704;
		23: cuenta_max=736;
		24: cuenta_max=768;
		25: cuenta_max=800;
		26: cuenta_max=832;
		27: cuenta_max=864;
		28: cuenta_max=896;
		29: cuenta_max=928;
		30: cuenta_max=960;
		31: cuenta_max=992; 
		default:cuenta_max=0; 

		endcase end
endmodule
