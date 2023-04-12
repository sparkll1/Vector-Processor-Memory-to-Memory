`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:56:32 11/06/2021
// Design Name:   Integration
// Module Name:   Z:/Documents/Rose-Hulman/CSSE232/csse232-2122a-project-yellow-2122a-04/implementation/Memory_to_Memory/Integration_Control_tb.v
// Project Name:  Memory_to_Memory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Integration
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Integration_Control_tb;

	// Inputs
	reg clk;
	reg reset;
	wire Done;
	//wire instructions;

	// Outputs

	// Instantiate the Unit Under Test (UUT)
	Integration uut (
		.clk(clk), 
		.reset(reset),
		.Done(Done)
		//.instructions(instructions)
	);
	
	parameter HALF_PERIOD = 50;
	integer cycle_counter = 0;
	parameter cycle = 2 * HALF_PERIOD;
	
	initial begin
		 clk = 0;
		 forever begin
			  #(HALF_PERIOD);
			  clk = ~clk;
			  
		 end
	end
	
	initial begin
		#(HALF_PERIOD);
		forever begin
			#(cycle);
			if (reset == 0 && Done == 0) begin
					cycle_counter = cycle_counter + 1;
			end
		end
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		//Done = 0;

		// Wait 100 ns for global reset to finish
		#(HALF_PERIOD);
		#(cycle);
      reset = 0;
		

	end
      
endmodule

