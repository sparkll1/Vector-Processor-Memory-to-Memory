`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:26:13 11/02/2021
// Design Name:   mux16b4
// Module Name:   Z:/Documents/Rose-Hulman/CSSE232/csse232-2122a-project-yellow-2122a-04/implementation/Memory_to_Memory/mux16b4_tb.v
// Project Name:  Memory_to_Memory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux16b4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux16b4_tb;

	// Inputs
	reg [1:0] s;
	reg [15:0] a;
	reg [15:0] b;
	reg [15:0] c;
	reg [15:0] d;

	// Outputs
	wire [15:0] r;

	// Instantiate the Unit Under Test (UUT)
	mux16b4 uut (
		.s(s), 
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.r(r)
	);

	initial begin
		// Initialize Inputs
		s = 0;
		a = 0;
		b = 0;
		c = 0;
		d = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// check output
		 repeat (4) begin
			repeat (16) begin
			 repeat (16) begin
				repeat (16) begin
				 repeat (16) begin
					#1;
					case (s)
					  2'b00: if (a != r)  $display("FAIL! a=%d (s = %d)", a, s);
					  2'b01: if (b != r)  $display("FAIL! b=%d (s = %d)", b, s);
					  2'b10: if (c != r)  $display("FAIL! c=%d (s = %d)", c, s);
					  2'b11: if (d != r)  $display("FAIL! d=%d (s = %d)", d, s);
					endcase
					a = a + 1;
				 end
				 b = b + 1;
			  end
			  c = c + 1;
			end
			d = d + 1;
		  end
		  s = s + 1;
		 end

	end
      
endmodule

