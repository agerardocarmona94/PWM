`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:09:41 03/15/2016 
// Design Name: 
// Module Name:    FF_14 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FF_14(
	input ck,d,
	output reg q
	);
	
always @ (posedge ck )
	q <= d;
endmodule 