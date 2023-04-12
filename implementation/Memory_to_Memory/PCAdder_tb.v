`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:09:23 10/25/2021
// Design Name:   PCAdder
// Module Name:   Z:/Documents/Rose-Hulman/CSSE232/csse232-2122a-project-yellow-2122a-04/implementation/Memory_to_Memory/PCAdder_tb.v
// Project Name:  Memory_to_Memory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PCAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PCAdder_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg CLK;
	
	// Outputs
	wire [15:0] C;

	// Instantiate the Unit Under Test (UUT)
	PCAdder uut (
		.A(A), 
		.B(B), 
		.C(C)
	);
	
	parameter HALF_PERIOD = 50;
	integer cycle_counter = 0;
	integer counter = 0;
	integer failures = 0;
	
	initial begin
		 CLK = 0;
		 forever begin
			  #(HALF_PERIOD);
			  CLK = ~CLK;
		 end
	end

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		CLK = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here
		// -------Test 1-------
		$display("Teseting PC Adder");
		repeat (40) begin
			#(2*HALF_PERIOD);
			A = A + 1;
			repeat (40) begin
				#(2*HALF_PERIOD);
				B = B + 1;
				#(2*HALF_PERIOD);

				if (C != A + B) begin
					failures = failures + 1;
					$display("%t (PC Adder) Error: A = %d, B = %d, C = %d", $time, A, B, C);
				end
			end
		end
		
		if (failures == 0) begin
			$display("(PC Adder) PASS");
		end
	end
      
endmodule



