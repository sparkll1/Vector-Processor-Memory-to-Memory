`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:21:20 11/02/2021
// Design Name:   mux16b2
// Module Name:   Z:/Documents/Rose-Hulman/CSSE232/csse232-2122a-project-yellow-2122a-04/implementation/Memory_to_Memory/mux16b2_tb.v
// Project Name:  Memory_to_Memory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux16b2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux16b2_tb;

	// Inputs
	reg s;
	reg [15:0] a;
	reg [15:0] b;

	// Outputs
	wire [15:0] r;

	// Instantiate the Unit Under Test (UUT)
	mux16b2 uut (
		.s(s), 
		.a(a), 
		.b(b), 
		.r(r)
	);

	initial begin
		// Initialize Inputs
		s = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// check output
	  repeat (2) begin
		  repeat (16) begin
			 repeat (16) begin
				#1;
				if (s == 0) begin
				  if (a == r)  $display("PASS! a=%d (s = %d)", a, s);
				  else         $display("FAIL! a=%d (s = %d)", a, s);
				end
				else begin
				  if (b == r)  $display("PASS! b=%d (s = %d)", b, s);
				  else         $display("FAIL! b=%d (s = %d)", b, s);
				end
				a = a + 1;
			 end
			 b = b + 1;
		  end
		  s = ~s;
	  end

	end
      
endmodule

