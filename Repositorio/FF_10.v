`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:07:10 03/15/2016 
// Design Name: 
// Module Name:    FF_10 
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
module FF_10(
	input ck,d,
	output reg q
	);
	
always @ (posedge ck )
	q <= d;
endmodule 
