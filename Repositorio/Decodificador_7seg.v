`timescale 1ns / 1ps

module Decodificador_7seg(
    input [3:0] bcd,
    output reg [6:0] segmento
    );

always @*
	begin
		case (bcd)
			4'b0000: segmento=7'b1000000;
			4'b0001: segmento=7'b1111001;
			4'b0010: segmento=7'b0100100;
			4'b0011: segmento=7'b0110000;
			4'b0100: segmento=7'b0011001;
			4'b0101: segmento=7'b0010010;
			4'b0110: segmento=7'b0000010;
			4'b0111: segmento=7'b1111000;
			4'b1000: segmento=7'b0000000;
			4'b1001: segmento=7'b0010000;
			default: segmento=7'b1111111;
		endcase
	end

endmodule
