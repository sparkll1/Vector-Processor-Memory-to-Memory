`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:16 11/02/2021 
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
    output reg [15:0] ALUOut,
    input [3:0] ALUOp,
	 output reg zero,
	 output reg nzero,
	 output reg gt,
	 output reg lt,
	 output reg gte,
	 output reg lte
    );
	 
		always @*
		begin
		//may add more (nand/nor...)
		
			zero = 0;
			nzero = 0;
			gt = 0;
			lt = 0;
			gte = 0;
			lte = 0;
			
			case(ALUOp)
				0: 
					//add
					ALUOut = A + B;
				1: 
					//sub
					ALUOut = A - B;
				2: 
					//and
					ALUOut = A & B;
				3: 
					//or
					ALUOut = A | B;
				4:
					//branch
					begin
						if (A - B == 0) begin
							zero = 1;
						end
						if (A - B != 0) begin
							nzero = 1;
						end
						if (A > B) begin
							gt = 1;
						end
						if (A < B) begin
							lt = 1;
						end
						if (A >= B) begin
							gte = 1;
						end
						if (A <= B) begin
							lte = 1;
						end
					end
			endcase
		end


endmodule
