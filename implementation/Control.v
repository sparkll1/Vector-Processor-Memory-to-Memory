`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:16 11/01/2021 
// Design Name: 
// Module Name:    Control 
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
module Control(

//all the names start with lowercase

    input clock,

    input [7:0] op,
	 output [1:0] pcSrc ,
	 output [1:0] writeMemDst,
	 output memWrite,
	 output [1:0] writeDataSrc,
	 output [3:0] aluOp ,
	 output [1:0] aluSrcA,
	 output [1:0] aluSrcB,
	 output readSrc,
	 output pcWrite,
	 output writeRa,
	 output writeSp
	 
    );
	 always @(posedge clock)
	 begin
	 
	 pcSrc = 00
	 //opcode of jr is 20(the last). 
	 always @(posedge clock)
	 begin
	 
	 pcSrc = 00
	 //opcode of jr is 20(the last). 
	 if(op == 2'h1F)
		pcSrc = 3;
	//any other insturctions that are not jr.
	 else
		readSrc = 0;
		aluSrcA = 0; 
		aluSrcB = 2; 
		aluOp = 0; 
	//m-type	
		if(op =< 2'h03)
			aluSrcA = 1; 
			aluSrcB = 0; 
			aluOp = 2; 
	//b-type (branch with imm)
	
	/////fix the aluop
		else if(op >= 2'h04 && op <= 2'h09)
			aluSrcA = 1; 
			aluSrcB = 2; 
			aluOp = ?;
			pcSrc = 1;
			
	//branch(beq,bne....)
		else if(op >= 2'h0A && op <= 2'h0F)
			aluSrcA = 1; 
			aluSrcB = 0; 
			aluop = ;
			pcSrc= 1;
	//allo free
		else if(op >= 2'10 && op <= 2'h11)
			aluSrcA = 1; 
			writeSp = 1;  	
	//load
      else if(op >= 2'h12 && op <= 2'h14)
			aluSrcA = 2; 
			aluSrcB = 2; 
			aluop = 0;
			pcSrc = 1;
   //I-types
		else if(op >= 2'h15 && op <= 2'h1D)
			aluSrcA = 2;
			aluSrcB = 2;
	//jump
		else if(op == 2'h1E)
			pcSrc = 2;
			pcWrite = 1;
			
	//jal
		else if(op == 2'h1F)
			writeRa = 1;
			pcSrc = 2;
			pcWrite = 1;
			
		end	
			
endmodule			