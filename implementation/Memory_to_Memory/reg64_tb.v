`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:45:46 11/03/2021
// Design Name:   reg64
// Module Name:   Z:/Documents/Rose-Hulman/CSSE232/csse232-2122a-project-yellow-2122a-04/implementation/Memory_to_Memory/reg64_tb.v
// Project Name:  Memory_to_Memory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg64
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module reg64_tb;

	// Inputs
	reg [63:0] datain;
	reg clk;
	reg wea;

	// Outputs
	wire [63:0] dataout;

	// Instantiate the Unit Under Test (UUT)
	reg64 uut (
		.datain(datain), 
		.dataout(dataout), 
		.wea(wea),
		.clk(clk)
	);
   parameter   PERIOD = 20;
   parameter   real DUTY_CYCLE = 0.5;
   parameter   OFFSET = 10;
   
   initial    // Clock process for CLK
     begin
        #OFFSET;
        forever
          begin
             clk = 1'b0;
             #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
             #(PERIOD*DUTY_CYCLE);
          end
     end
   
   // Initialize Inputs
   initial begin
      datain = 0;
      wea = 0;

      #200;
      datain = 64'hffffffffffffffff;
      wea = 1;
      #PERIOD;
		$display(dataout);
      wea = 0;
      #PERIOD;
      datain = 64'h5555;
      wea = 0;
      #PERIOD;
		$display(dataout);

      wea = 0;
      #PERIOD;
   end
      
endmodule

