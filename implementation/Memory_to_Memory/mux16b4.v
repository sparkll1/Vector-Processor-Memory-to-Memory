`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:30 11/02/2021 
// Design Name: 
// Module Name:    mux16b4 
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
module mux16b4(
    input [1:0] s,
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,
    output reg [15:0] r
    );
			//assign r = regoutput;
			always @ (a or b or c or d or s)
			begin
			//may add more (nand/nor...)
				case(s)
					2'd00: 
						//1
						r = a;
					2'd01: 
						//b
						r = b;
					2'd02: 
						//c
						r = c;	
					2'd03:
						//d
						r = d;
				endcase
			end


endmodule
