`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:31:02 11/05/2021
// Design Name:   ALU
// Module Name:   Z:/Documents/Rose-Hulman/CSSE232/csse232-2122a-project-yellow-2122a-04/implementation/Memory_to_Memory/ALU_tb.v
// Project Name:  Memory_to_Memory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [3:0] ALUOp;

	// Outputs
	wire [15:0] ALUOut;
	wire zero;
	wire nzero;
	wire gt;
	wire lt;
	wire gte;
	wire lte;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.ALUOut(ALUOut), 
		.ALUOp(ALUOp), 
		.zero(zero), 
		.nzero(nzero), 
		.gt(gt), 
		.lt(lt), 
		.gte(gte), 
		.lte(lte)
	);

	initial begin
		// Initialize Inputs
		A = 1;
		B = 1;
		ALUOp = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		A = 1;
		B = 2;
		
		
		#100;
		A = 2;
		B = 1;

	end
      
endmodule

