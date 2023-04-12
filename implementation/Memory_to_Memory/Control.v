`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:02:52 11/06/2021 
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
    input clk,
    input [7:0] Op,
	 input reset,
    output reg [1:0] PCSrcControl,
    output reg ReadSrcControl,
    output reg [1:0] WriteMemDstControl,
    output reg [1:0] WriteDataSrcControl,
    output reg MemWrite,
    output reg [1:0] ALUSrcAControl,
    output reg [1:0] ALUSrcBControl,
    output reg [3:0] ALUOpControl,
    output reg WriteRaControl,
    output reg WriteSpControl,
    output reg PCWrite,
    output reg PCWriteCond,
    output reg WriteRa,
    output reg WriteSp,
    output reg WriteIR,
    output reg WriteA,
    output reg WriteB,
    output reg RaSrcControl,
	 output reg SpSrcControl,
	 output reg Done
	 //output reg instructions
    );
	 
	 parameter IF1 = 0;
	 parameter IF2 = 1;
	 parameter ID = 2;
	 parameter EX = 3;
	 parameter MEM = 4;
	 parameter EX_B = 5;
	 parameter ID_A = 6;
	 parameter EX_A = 7;
	 parameter ID_L = 8;
	 parameter EX_L = 9;
	 parameter MEM_L = 10;
	 parameter ID_S = 11;
	 parameter EX_L2 = 12;
	 parameter MEM_S = 13;
	 parameter ID_SR = 14;
	 parameter ID_R = 15;
	 parameter EX_R = 16;
	 parameter ID_RI = 17;
	 parameter EX_J = 18;
	 parameter EX_JAL = 19;
	 parameter EX_JR = 20;
	 parameter DONE = 21;
	 
	 
	 reg [5:0] currentState;
	 reg [5:0] nextState;
	 
		always @ (posedge clk, posedge reset) 
			begin
				if (reset == 1) 
					begin
						currentState = -1;
					end 
				else 
					begin
						currentState = nextState;
					end
			end
			
		
		always @ (currentState, Op, reset)
			begin
				if (reset == 1)
					begin
						PCSrcControl = 2'b00;
						ReadSrcControl = 0;
						WriteMemDstControl = 2'b00;
						WriteDataSrcControl = 2'b00;
						MemWrite = 0;
						ALUSrcAControl = 2'b00;
						ALUSrcBControl = 2'b00;
						ALUOpControl = 4'b0000;
						WriteRaControl = 0;
						WriteSpControl = 0;
						PCWrite = 0;
						PCWriteCond = 0;
						WriteRa = 0;
						WriteSp = 1;
						WriteIR = 0;
						WriteA = 0;
						WriteB = 0;
						RaSrcControl = 0;
						SpSrcControl = 1;
						Done = 0;
						//instructions = 0;
						$display("Reset all the signals");
					end
					
				case (currentState)
					DONE:
						begin
							PCWrite = 0;
							MemWrite = 0;
							WriteRa = 0;
							WriteSp = 0;
							WriteIR = 0;
							WriteA = 0;
							WriteB = 0;
							Done = 1;
							$display("finish");
						end
					IF1:
						begin
							SpSrcControl = 0;
							PCSrcControl = 2'b00;
							PCWrite = 1;
							MemWrite = 0;
							PCWriteCond = 0;
							WriteA = 0;
							WriteB = 0;
							WriteSp = 0;
							WriteRa = 0;
						end
					IF2:
						begin
							WriteIR = 1;
							PCWrite = 0;
							ReadSrcControl = 0;
							WriteMemDstControl = 2'b00;
							WriteDataSrcControl = 2'b11;
						end
					ID:
						begin
							WriteA = 1;
							WriteB = 1;
							WriteIR = 0;
							ReadSrcControl = 0;
							ALUSrcBControl = 2'b10;
							ALUSrcAControl = 2'b00;
							ALUOpControl = 4'b0000;
						end
					ID_R:
						begin
							WriteA = 1;
							WriteIR = 0;
						end
					ID_S:
						begin
							WriteIR = 0;
							ReadSrcControl = 0;
							ALUSrcAControl = 2'b10;
							ALUSrcBControl = 2'b10;
							ALUOpControl = 4'b0001;
							WriteA = 1;
						end
					ID_SR:
						begin
							WriteIR = 0;
							ReadSrcControl = 0;
							ALUSrcAControl = 2'b10;
							ALUSrcBControl = 2'b10;
							ALUOpControl = 4'b0001;
							WriteMemDstControl = 2'b10;
							WriteDataSrcControl = 2'b10;
							MemWrite = 1;
						end
					ID_A:
						begin
							ALUSrcAControl = 2'b10;
							ALUSrcBControl = 2'b10;
							WriteIR = 0;
							case (Op)
								16: ALUOpControl = 4'b0000;
								17: ALUOpControl = 4'b0001;
							endcase
						end
					ID_L:
						begin							
							WriteIR = 0;
							WriteMemDstControl = 2'b00;
							ALUSrcAControl = 2'b10;
							ALUSrcBControl = 2'b10;
							ALUOpControl = 4'b0001;
							ReadSrcControl = 1;
						end
					ID_RI:
						begin
							WriteIR = 0;
							MemWrite = 1;
							PCSrcControl = 2'b11;
							PCWrite = 1;
							WriteDataSrcControl = 2'b11;
						end
					EX:
						begin
							ALUSrcAControl = 2'b01;
							case (Op)
								0,1,2,3: ALUSrcBControl = 2'b00;
								21,22,23: ALUSrcBControl = 2'b10;
							endcase
							case (Op)
								0,1,2,3: WriteMemDstControl = 2'b01;
								21,22,23: WriteMemDstControl = 2'b00;
							endcase
							case (Op)
								0,21: ALUOpControl = 4'b0000;
								1: ALUOpControl = 4'b0001;
								2,22: ALUOpControl = 4'b0010;
								3,23: ALUOpControl = 4'b0011;
							endcase
						end
					EX_L:
						begin
							WriteDataSrcControl = 2'b01;
							WriteA = 1;
						end
					EX_L2:
						begin
							WriteA = 0;
							RaSrcControl = 0;
							WriteRa = 1;
						end
					EX_A:
						begin
							WriteSp = 1;
						end
					EX_B:
						begin
							PCWriteCond = 1;
							PCSrcControl = 2'b01;
							ALUSrcAControl = 2'b01;
							ALUOpControl = 4'b0100;
							case (Op)
								4,5,6,7,8,9: ALUSrcBControl = 2'b01;
								10,11,12,14,14,15: ALUSrcBControl = 2'b00;
							endcase
						end
					EX_R:
						begin
							WriteA = 0;
							WriteMemDstControl = 2'b00;
							WriteDataSrcControl = 2'b01;
							MemWrite = 1;
							PCSrcControl = 2'b11;
							PCWrite = 1;
						end
					EX_J:
						begin
							WriteIR = 0;
							PCWrite = 1;
							PCSrcControl = 2'b10;
						end
					EX_JAL:
						begin
							WriteIR = 0;
							RaSrcControl = 1;
							PCWrite = 1;
							WriteRa = 1;
							PCSrcControl = 2'b10;
						end
					EX_JR:
						begin
							WriteIR = 0;
							PCSrcControl = 2'b11;
							PCWrite = 1;
						end
					MEM_L:
						begin
							WriteA = 0;
							MemWrite = 1;
							WriteIR = 0;
						end
					MEM:
						begin
							WriteA = 0;
							WriteB = 0;
							MemWrite = 1;
							WriteDataSrcControl = 2'b00;
						end
					MEM_S:
						begin
							WriteA = 0;
							WriteDataSrcControl = 2'b01;
							WriteMemDstControl = 2'b10;
							MemWrite = 1;
						end
					default:
						begin
							$display(">>>>>>>>>>>>>>>>>>>>>>>Wrong State");
						end
				endcase
			end
			
		always @(currentState, nextState, Op)
			begin
				case (currentState)
					DONE:
						begin
							nextState = DONE;
						end
					IF1:
						begin
							nextState = IF2;
						end
					IF2:
						begin
							case (Op)
							0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,21,22,23: nextState = ID;
							16,17: nextState = ID_A;
							18,20: nextState = ID_L;
							19: nextState = MEM_L;
							26: nextState = ID_S;
							27: nextState = ID_SR;
							28: nextState = ID_R;
							29: nextState = ID_RI;
							30: nextState = EX_J;
							31: nextState = EX_JAL;
							24: nextState = EX_JR;
							25: nextState = DONE;
							endcase
						end
					ID:
						begin
							case (Op)
								0,1,2,3,21,22,23: nextState = EX;
								4,5,6,7,8,9,10,11,12,13,14,15: nextState = EX_B;
							endcase
						end
					ID_A:
						begin
							nextState = EX_A;
						end
					ID_L:
						begin
							nextState = EX_L;
						end
					ID_S:
						begin
							nextState = MEM_S;
						end
					ID_R:
						begin
							nextState = EX_R;
						end
					EX:
						begin
							case(Op)
								0,1,2,3,21,22,23: nextState = MEM;
							endcase
						end
					EX_L:
						begin
							case(Op)
								18: nextState = MEM_L;
								20: nextState = EX_L2;
							endcase
						end
					EX_R:
						begin
							nextState = IF1;
						end
					EX_A,EX_L2,EX_B,MEM,MEM_L,MEM_S,ID_SR,ID_RI,EX_J,EX_JAL,EX_JR:
						begin
							//instructions = instructions + 1;
							nextState = IF1;
						end
					default:
						begin
							nextState = IF1;
						end
				endcase
			end
			
		
		
		
			
			


endmodule
