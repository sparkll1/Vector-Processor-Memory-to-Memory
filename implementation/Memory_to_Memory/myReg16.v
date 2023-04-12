`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:27:40 11/04/2021 
// Design Name: 
// Module Name:    myReg16 
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
//////////////////////////////////////////////////////////////////////////////////
module myReg16(
    input [15:0] datain,
    output reg [15:0] dataout,
    input clk,
    input wea,
	 input rst
    );

	always @* begin
		if (rst == 1) begin
			dataout = 0;
		end else
		if (wea == 1) begin
			dataout <= datain;
		end
	 end

endmodule
