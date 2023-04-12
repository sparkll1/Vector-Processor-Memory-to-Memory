`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sadie Park
// 
// Create Date:    07:25:35 10/26/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
		 input [15:0] A,
		 input [15:0] B,
		 output [15:0] ALUOut,
		 input [4:0] ALUOp
    );
		reg [15:0] ALUoutput;
		assign ALUOut = ALUoutput
		always @*
		begin
		//may add more (nand/nor...)
			case(ALUOp)
				0: 
					//add
					ALUoutput = A + B;
				1: 
					//sub
					ALUoutput = A - B;
				2: 
					//and
					ALUoutput = A & B;
				3: 
					//or
					ALUoutput = A | B;
				4: 
					//xor
					ALUoutput = A & B;
				5: 
					//equal. If A = B, produce 1. Otherwise 0.
					ALUoutput = (A == B)? 16'b1:16'b0;
				6: 
					//equal. If A < B, produce 1.  If B < A, produce 0.
					ALUoutput = (A < B)? 16'b1:16'b0;	
				7: 
					//select A
					ALUoutput = A;
				8: 
					//select B
					ALUoutput = B;
			endcase
		end	
	
endmodule

