`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:51 11/02/2021 
// Design Name: 
// Module Name:    Integration 
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
module Integration(
	 input clk,
	 input reset,
	 output Done
	 //output instructions
	 //input [15:0] pc
	 /*
	 input [1:0] PCSrcControl,
	 input ReadSrcControl,
	 input [1:0] WriteMemDstControl,
	 input [1:0] WriteDataSrcControl,
	 input MemWrite,
	 input [1:0] ALUSrcAControl,
	 input [1:0] ALUSrcBControl,
	 input [3:0] ALUOpControl,
	 input WriteRaControl,
	 input WriteSpControl,
	 input PCWrite,
	 input PCWriteCond,
	 input WriteRa,
	 input WriteSp,
	 input WriteIR,
	 input WriteA,
	 input WriteB,
	 input RaSrcControl
	// input rst
	*/
    );
	
	 wire [15:0] pc;
	 wire [15:0] PCAdderOut;
	 wire [15:0] pco;
	 wire [63:0] IROut;
	 wire [15:0] ALUSrcA;
	 wire [15:0] ALUSrcB;
	 wire [15:0] AIn;
	 wire [15:0] AOut;
	 wire [15:0] BIn;
	 wire [15:0] BOut;
	 wire zero;
	 wire nzero;
	 wire gt;
	 wire lt;
	 wire gte;
	 wire lte;
	 wire [63:0] inst;

	 
	 wire [15:0] ReadSrc;
	 wire [15:0] WriteDataSrc;
	 wire [15:0] WriteMemDst;
	 wire [15:0] RaSrc;
	 
	 wire [15:0] ra;
	 wire [15:0] sp;
	 wire [15:0] SpSrc;
	 
	 wire [15:0] ALUOut;
    wire [1:0] PCSrcControl;
    wire ReadSrcControl;
    wire [1:0] WriteMemDstControl;
    wire [1:0] WriteDataSrcControl;
    wire MemWrite;
    wire [1:0] ALUSrcAControl;
    wire [1:0] ALUSrcBControl;
    wire [3:0] ALUOpControl;
    wire WriteRaControl;
    wire WriteSpControl;
    wire PCWrite;
    wire PCWriteCond;
    wire WriteRa;
    wire WriteSp;
    wire WriteIR;
    wire WriteA;
    wire WriteB;
    wire RaSrcControl;
	 wire SpSrcControl;
	 
	 wire [15:0] const;

 
	reg16 PC (
			.I(pc), 
			.Write(PCWrite | (PCWriteCond & ((zero & ((inst[63:56]==8'h04)|(inst[63:56]==8'h0A))) | 
														(nzero & ((inst[63:56]==8'h05)|(inst[63:56]==8'h0B))) | 
														(gt & ((inst[63:56]==8'h07)|(inst[63:56]==8'h0C))) | 
														(gte & ((inst[63:56]==8'h06)|(inst[63:56]==8'h0D))) | 
														(lt & ((inst[63:56]==8'h09)|(inst[63:56]==8'h0F))) | 
														(lte & ((inst[63:56]==8'h08)|(inst[63:56]==8'h0E)))))), 
			.CLK(clk), 
			.O(pco)
		 );
		 

		 /**
    myReg16 PC (
			.datain(pc), 
			.wea(PCWrite | (PCWriteCond & (zero | nzero | gt | gte | lt | lte))), 
			.clk(clk), 
			.dataout(pco),
			.rst(rst)
		 ); 
		 
		 */
		
	 
	 IMem myIMem (
		  .clka(clk), // input clka
		  .wea(1'b0), // input [0 : 0] wea
		  .addra(pco[9:0]), // input [9 : 0] addra
		  .dina(64'b0), // input [63 : 0] dina
		  .douta(IROut) // output [63 : 0] douta
		);
		
	 reg64 IR (
		 .datain(IROut), 
		 .wea(WriteIR), 
		 .dataout(inst), 
		 .clk(clk)
		 );
		 
	 Control ControlUnit (
		 .clk(clk), 
		 .Op(inst[63:56]), 
		 .reset(reset), 
		 .PCSrcControl(PCSrcControl), 
		 .ReadSrcControl(ReadSrcControl), 
		 .WriteMemDstControl(WriteMemDstControl), 
		 .WriteDataSrcControl(WriteDataSrcControl), 
		 .MemWrite(MemWrite), 
		 .ALUSrcAControl(ALUSrcAControl), 
		 .ALUSrcBControl(ALUSrcBControl), 
		 .ALUOpControl(ALUOpControl), 
		 .WriteRaControl(WriteRaControl), 
		 .WriteSpControl(WriteSpControl), 
		 .PCWrite(PCWrite), 
		 .PCWriteCond(PCWriteCond), 
		 .WriteRa(WriteRa), 
		 .WriteSp(WriteSp), 
		 .WriteIR(WriteIR), 
		 .WriteA(WriteA), 
		 .WriteB(WriteB), 
		 .RaSrcControl(RaSrcControl),
		 .SpSrcControl(SpSrcConrol),
		 .Done(Done)
		// .instructions(instructions)
		);



	 PCAdder myPCAdder (
		 .A(pco), 
		 .B(16'b1), 
		 .C(PCAdderOut)
		);
		
		
	  mux16b4 PCSrcMux (
		 .s(PCSrcControl), 
		 .a(PCAdderOut), 
		 .b(ALUOut), 
		 .c(inst[23:8]), 
		 .d(ra), 
		 .r(pc)
		);
		
		mux16b2 ReadSrcMux (
		 .s(ReadSrcControl), 
		 .a(inst[55:40]), 
		 .b(ALUOut), 
		 .r(ReadSrc)
		 );
		 
		mux16b4 WriteMemDstMux (
		 .s(WriteMemDstControl), 
		 .a(inst[39:24]), 
		 .b(inst[23:8]), 
		 .c(ALUOut), 
		 .d(16'b0), 
		 .r(WriteMemDst)
		);
		 
		mux16b4 WriteDataSrcMux (
		 .s(WriteDataSrcControl), 
		 .a(ALUOut), 
		 .b(AOut), 
		 .c(ra), 
		 .d(inst[23:8]), 
		 .r(WriteDataSrc)
		);
		
		reg16 A_Reg (
			.I(AIn), 
			.Write(WriteA), 
			.CLK(clk), 
			.O(AOut)
		);
		
		reg16 B_Reg (
			.I(BIn), 
			.Write(WriteA), 
			.CLK(clk), 
			.O(BOut)
		);
		
		DMem myDMem (
		  .clka(clk), // input clka
		  .wea(1'b0), // input [0 : 0] wea
		  .addra(ReadSrc[9:0]), // input [9 : 0] addra
		  .dina(16'b0), // input [15 : 0] dina
		  .douta(AIn), // output [15 : 0] douta
		  .clkb(clk), // input clkb
		  .web(MemWrite), // input [0 : 0] web
		  .addrb(WriteMemDst[9:0]), // input [9 : 0] addrb
		  .dinb(WriteDataSrc), // input [15 : 0] dinb
		  .doutb(BIn) // output [15 : 0] doutb
		);

		mux16b4 ALUSrcAMux (
		 .s(ALUSrcAControl), 
		 .a(pco), 
		 .b(AOut), 
		 .c(sp), 
		 .d(16'b0), 
		 .r(ALUSrcA)
		);
		
		mux16b4 ALUSrcBMux (
		 .s(ALUSrcBControl), 
		 .a(BOut), 
		 .b(inst[39:24]), 
		 .c(inst[23:8]), 
		 .d(16'b0), 
		 .r(ALUSrcB)
		);
		
		ALU myALU (
		 .A(ALUSrcA), 
		 .B(ALUSrcB), 
		 .ALUOut(ALUOut), 
		 .ALUOp(ALUOpControl), 
		 .zero(zero), 
		 .nzero(nzero), 
		 .gt(gt), 
		 .lt(lt), 
		 .gte(gte), 
		 .lte(lte)
		 );
		 
		 
		mux16b2 RaMux (
		 .s(RaSrcControl), 
		 .a(AOut), 
		 .b(pco), 
		 .r(RaSrc)
		 );

		reg16 myRA (
			.I(RaSrc), 
			.Write(WriteRa), 
			.CLK(clk), 
			.O(ra)
		);
		
		mux16b2 SP_mux (
		 .s(SpSrcConrol), 
		 .a(ALUOut), 
		 .b(const), 
		 .r(SpSrc)
		 );
		 
		constant16b0001 UUT (
			.O(const)
		);
		
		
		reg16 mySP(
			.I(SpSrc), 
			.Write(WriteSp), 
			.CLK(clk), 
			.O(sp)
		);
	 
	 

endmodule
