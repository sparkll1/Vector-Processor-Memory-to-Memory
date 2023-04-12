`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:52 11/02/2021 
// Design Name: 
// Module Name:    mux16b2 
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
module mux16b2(
    input s,
    input [15:0] a,
    input [15:0] b,
    output [15:0] r
    );
	 
	 assign r = (s == 1) ? b : a;


endmodule
