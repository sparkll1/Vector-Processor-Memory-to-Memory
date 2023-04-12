`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:29:49 10/25/2021
// Design Name:   IMem
// Module Name:   Z:/Documents/Rose-Hulman/CSSE232/csse232-2122a-project-yellow-2122a-04/implementation/Memory_to_Memory/IMem_tb.v
// Project Name:  Memory_to_Memory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IMem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IMem_tb;

	// Inputs
	reg clka;
	reg [0:0] wea;
	reg [9:0] addra;
	reg [63:0] dina;

	// Outputs
	wire [63:0] douta;

	// Instantiate the Unit Under Test (UUT)
	IMem uut (
		.clka(clka), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);

	// Variables
	parameter HALF_PERIOD = 50;
	integer counter = 0;
	integer failures = 0;
	
	initial begin
		clka = 0;
		forever begin
			#(HALF_PERIOD);
			clka = ~clka;
		end
	end

	initial begin
		// Initialize Inputs
		clka = 0;
		wea = 0;
		addra = 1;
		dina = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// Test 1
		$display(douta);
	end
      
endmodule

