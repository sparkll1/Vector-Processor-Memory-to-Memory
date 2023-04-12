`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:33 10/25/2021 
// Design Name: 
// Module Name:    PCAdder 
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
/////////////////////////////////////////////////////////////// ///////////////////
module PCAdder(
    input [15:0] A,
    input [15:0] B,
    output reg [15:0] C
    );
	 
	 always @ (A, B)
	 begin
			C = A + B;
	 end
		

endmodule
