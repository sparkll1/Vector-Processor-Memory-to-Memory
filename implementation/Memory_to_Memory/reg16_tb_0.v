// Verilog test fixture created from schematic /home/mellor/ProfessionalArchives/Teaching/Class/csse232_csse_svn/trunk/scratch/reg16/reg16.sch - Sun Oct 10 11:12:09 2010

`timescale 1ns / 1ps

module reg16_tb_0();
   
   // Inputs
   reg [15:0] I;
   reg        Write;
   reg        CLK;
   
   // Output
   wire [15:0] O;
   
   // Bidirs

   // Instantiate the UUT
   reg16 UUT (
              .I(I), 
              .Write(Write), 
              .CLK(CLK), 
              .O(O)
              );
   
   parameter   HALF_PERIOD = 20;
   parameter   PERIOD = 40;
	initial begin
		 CLK = 0;
		 forever begin
			  #(HALF_PERIOD);
			  CLK = ~CLK;
		 end
	end   
   // Initialize Inputs
   initial begin
		CLK = 0;
      I = 0;
      Write = 0;

      #PERIOD;
      I = 16'hffff;
      Write = 1;
      #PERIOD;
		
      Write = 0;
      #PERIOD;
		
      I = 16'h5555;
      Write = 1;
      #PERIOD;
		
      Write = 0;
      #PERIOD;
		
		I = 16'hffff;
      Write = 1;
      #PERIOD;
		
      Write = 0;
      #PERIOD;
		
		I = 16'h5555;
      Write = 1;
      #PERIOD;
		
      Write = 0;
      #PERIOD;
   end

endmodule
