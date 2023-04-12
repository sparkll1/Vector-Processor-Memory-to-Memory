`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:43:24 11/05/2021
// Design Name:   myReg16
// Module Name:   Z:/Documents/Rose-Hulman/CSSE232/csse232-2122a-project-yellow-2122a-04/implementation/Memory_to_Memory/myReg16_tb.v
// Project Name:  Memory_to_Memory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: myReg16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module myReg16_tb;

	// Inputs
	reg [15:0] datain;
	reg clk;
	reg wea;
	reg rst;

	// Outputs
	wire [15:0] dataout;

	// Instantiate the Unit Under Test (UUT)
	myReg16 uut (
		.datain(datain), 
		.dataout(dataout), 
		.clk(clk), 
		.wea(wea), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		datain = 0;
		clk = 0;
		wea = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here

	end
      
endmodule

