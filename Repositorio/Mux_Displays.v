`timescale 1ns / 1ps

module Mux_Displays(
    input [3:0] select,
    input [3:0] dato_D1,
	 input [3:0] dato_D2,
	 input [3:0] dato_D3,
	 input [3:0] dato_D4,

    output reg [3:0] y
    );
always @*
	begin
		case (select)
			4'b0111: y=dato_D4;
			4'b1011: y=dato_D3;
			4'b1101: y=dato_D2;
			4'b1110: y=dato_D1;
			default: y=dato_D4;		
		endcase
end
endmodule
