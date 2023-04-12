`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:40 10/26/2021 
// Design Name: 
// Module Name:    mux41 
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
module mux41(

	input [15:0] A,
	input [15:0] B,
	input [15:0] C,
	input [15:0] D,
	input [1:0] S,
	output [15:0] out,
    );
	reg [15:0] regoutput;
		assign out = regoutput
		always @ (A or B or C or D or S)
		begin
		//may add more (nand/nor...)
			case(s)
				2'd00: 
					//1
					regoutput = A;
				2'd01: 
					//b
					regoutput = B;
				2'd02: 
					//c
					regoutput = C;	
				2'd03:
					//d
					regoutput = D;
			endcase
		end


endmodule
