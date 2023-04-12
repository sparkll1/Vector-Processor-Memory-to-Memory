`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:41:03 11/03/2021 
// Design Name: 
// Module Name:    reg64 
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
module reg64(
    input [63:0] datain,
	 input wea,
    output reg [63:0] dataout,
    input clk
    );
	 
	 always @* begin
		if (wea == 1) begin
			dataout = datain;
		end
	 end


endmodule
