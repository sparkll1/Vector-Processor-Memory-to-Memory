`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:44:30 11/03/2021
// Design Name:   Integration
// Module Name:   Z:/Documents/Rose-Hulman/CSSE232/csse232-2122a-project-yellow-2122a-04/implementation/Memory_to_Memory/Integration_tb.v
// Project Name:  Memory_to_Memory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Integration
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Integration_tb;

	// Inputs
	reg clk;
	reg [1:0] PCSrcControl;
	reg ReadSrcControl;
	reg [1:0] WriteMemDstControl;
	reg [1:0] WriteDataSrcControl;
	reg MemWrite;
	reg [1:0] ALUSrcAControl;
	reg [1:0] ALUSrcBControl;
	reg [3:0] ALUOpControl;
	reg WriteRaControl;
	reg WriteSpControl;
	reg PCWrite;
	reg PCWriteCond;
	reg WriteRa;
	reg WriteSp;
	reg WriteIR;
	reg WriteA;
	reg WriteB;
	reg RaSrcControl;
	//reg rst;

	//output
	

	// Instantiate the Unit Under Test (UUT)
	Integration uut (
		.clk(clk),
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
		.RaSrcControl(RaSrcControl)
	//	.rst(rst)
	);
	
	parameter HALF_PERIOD = 50;
	integer cycle_counter = 0;
	integer counter = 0;
	integer failures = 0;
	
	parameter cycle = 2 * HALF_PERIOD;
	
	initial begin
		 clk = 0;
		 forever begin
			  #(HALF_PERIOD);
			  clk = ~clk;
		 end
	end

	initial begin
		// Initialize Inputs
		clk = 0;
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
		WriteSp = 0;
		WriteIR = 0;
		WriteA = 0;
		WriteB = 0;
	//	rst = 1;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here
		//Test for add
		#(HALF_PERIOD);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
	//	rst = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		WriteMemDstControl = 2'b00;
		
		
		#(cycle);
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b00;
		ALUOpControl = 4'b0000;
		WriteMemDstControl = 2'b01;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		MemWrite = 1;
		WriteDataSrcControl = 2'b00;
		$display("add done");
		
		
		//Test for sub
		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
		
		#(cycle);
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b00;
		ALUOpControl = 4'b0001;
		WriteMemDstControl = 2'b01;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		MemWrite = 1;
		WriteDataSrcControl = 2'b00;
		$display("sub done");
		
		//Test for and
		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
		
		#(cycle);
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b00;
		ALUOpControl = 4'b0010;
		WriteMemDstControl = 2'b01;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		MemWrite = 1;
		WriteDataSrcControl = 2'b00;
		$display("and done");
		
		//Test for or
		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
		
		#(cycle);
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b00;
		ALUOpControl = 4'b0011;
		WriteMemDstControl = 2'b01;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		MemWrite = 1;
		WriteDataSrcControl = 2'b00;
		$display("or done");
		
		//Test for beq
		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		PCWriteCond = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
				
		#(cycle);
		PCWriteCond = 1;
		PCSrcControl = 2'b01;
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b00;
		ALUOpControl = 4'b0100;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		
		
		$display("beq done");
		
		//Test for bne
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
				
		#(cycle);
		PCWriteCond = 1;
		PCSrcControl = 2'b01;
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b00;
		ALUOpControl = 4'b0100;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		
		$display("bne done");
		
		//Test for bgt
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
				
		#(cycle);
		PCWriteCond = 1;
		PCSrcControl = 2'b01;
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b00;
		ALUOpControl = 4'b0100;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		
		$display("bgt done");
		
		//Test for bge
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
				
		#(cycle);
		PCWriteCond = 1;
		PCSrcControl = 2'b01;
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b00;
		ALUOpControl = 4'b0100;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		$display("bge done");
		
		//Test for blt
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
				
		#(cycle);
		PCWriteCond = 1;
		PCSrcControl = 2'b01;
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b00;
		ALUOpControl = 4'b0100;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		$display("blt done");
		
		//Test for ble
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
				
		#(cycle);
		PCWriteCond = 1;
		PCSrcControl = 2'b01;
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b00;
		ALUOpControl = 4'b0100;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		$display("ble done");
		
		//Test for beqi
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
				
		#(cycle);
		PCWriteCond = 1;
		PCSrcControl = 2'b01;
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b01;
		ALUOpControl = 4'b0100;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		$display("beqi done");
		
		
		//Test for bnei
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
				
		#(cycle);
		PCWriteCond = 1;
		PCSrcControl = 2'b01;
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b01;
		ALUOpControl = 4'b0100;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		$display("bnei done");
		//Test for bgei
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
				
		#(cycle);
		PCWriteCond = 1;
		PCSrcControl = 2'b01;
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b01;
		ALUOpControl = 4'b0100;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		$display("bgei done");
		//Test for bgti
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
				
		#(cycle);
		PCWriteCond = 1;
		PCSrcControl = 2'b01;
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b01;
		ALUOpControl = 4'b0100;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		$display("bgti done");
		
		//Test for blei
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
				
		#(cycle);
		PCWriteCond = 1;
		PCSrcControl = 2'b01;
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b01;
		ALUOpControl = 4'b0100;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		
		$display("blei done");
		
		//Test for blti
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;
		ALUSrcBControl = 2'b10;
		ALUSrcAControl = 2'b00;
		ALUOpControl = 4'b0000;
		
				
		#(cycle);
		PCWriteCond = 1;
		PCSrcControl = 2'b01;
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b01;
		ALUOpControl = 4'b0100;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		$display("blti done");
		
		
		//Test for allo
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		ALUSrcAControl = 2'b10;
		ALUSrcBControl = 2'b10;
		ALUOpControl = 4'b0000;
		
		#(cycle);
		WriteSp = 1;
		WriteIR = 0;
		
		
		
		
		$display("allo done");
		
		//Test for free
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteSp = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		ALUSrcAControl = 2'b10;
		ALUSrcBControl = 2'b10;
		ALUOpControl = 4'b0001;
		
		#(cycle);
		WriteSp = 1;
		WriteIR = 0;
		$display("free done");
		
		
		//Test for ld
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteSp = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		ALUSrcAControl = 2'b10;
		ALUSrcBControl = 2'b10;
		ALUOpControl = 4'b0000;
		ReadSrcControl = 1;
		
				
		#(cycle);
		WriteDataSrcControl = 2'b01;
		WriteIR =  0;
		
		
		#(cycle);
		WriteA = 1;
		MemWrite = 1;
		
		#(cycle);
		WriteA = 0;
		
		
		$display("ld done");
		//Test for li
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteSp = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		WriteDataSrcControl =  2'b11;
		
		#(cycle);
		MemWrite = 1;
		WriteIR = 0;
		$display("li done");
		
		//Test for lr
		#(cycle);
		PCWriteCond = 0;
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteSp = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		ALUSrcAControl = 2'b10;
		ALUSrcBControl = 2'b10;
		ALUOpControl = 4'b0000;
		ReadSrcControl = 1;
		
		#(cycle);
		WriteDataSrcControl = 2'b01;
		WriteIR = 0;
		WriteA = 1;
		
		#(cycle);
		
		#(cycle);
		RaSrcControl = 0;
		WriteRa = 1;
		$display("lr done");
		
		//Test for addi
		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteRa = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;		
		
		#(cycle);
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b10;
		ALUOpControl = 4'b0000;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		MemWrite = 1;
		WriteDataSrcControl = 2'b00;
		
		$display("addi done");
		
		//Test for andi
		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteRa = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;		
		
		#(cycle);
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b10;
		ALUOpControl = 4'b0010;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		MemWrite = 1;
		WriteDataSrcControl = 2'b00;
		
		$display("andi done");
		
		//Test for ori
		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteRa = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		
		#(cycle);
		WriteA = 1;
		WriteB = 1;
		WriteIR = 0;
		ReadSrcControl = 0;		
		
		#(cycle);
		ALUSrcAControl = 2'b01;
		ALUSrcBControl = 2'b10;
		ALUOpControl = 4'b0011;
		WriteMemDstControl = 2'b00;
		
		#(cycle);
		WriteA = 0;
		WriteB = 0;
		MemWrite = 1;
		WriteDataSrcControl = 2'b00;
	
		$display("ori done");
		
		
		//Test for sll
		$display("sll done");
		
		
		//Test for srl
		$display("srl done");
		
		
		
		//Test for sv
		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteRa = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		ALUSrcAControl = 2'b10;
		ALUSrcBControl = 2'b01;
		ALUOpControl = 4'b0000;
		WriteDataSrcControl = 2'b11;
		WriteMemDstControl = 2'b10;
		
		#(cycle);
		WriteIR = 0;
		MemWrite = 1;
		
		$display("sv done");
		
		//Test for sr

		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteRa = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		ALUSrcAControl = 2'b10;
		ALUSrcBControl = 2'b10;
		ALUOpControl = 4'b0000;
		WriteDataSrcControl = 2'b10;
		WriteMemDstControl = 2'b10;
		
		#(cycle);
		WriteIR = 0;
		MemWrite = 1;
		
		$display("sr done");

		//Test for rtm
		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteRa = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		ReadSrcControl = 0;
		
		#(cycle);
		
		#(cycle);
		WriteA = 1;
		WriteMemDstControl = 2'b00;
		WriteDataSrcControl = 2'b01;
		
		#(cycle);
		WriteA = 0;
		MemWrite = 1;
		PCSrcControl = 2'b11;
		PCWrite = 1;
		
		$display("rtm done");
		//Test for rti
		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteRa = 0;
		
		#(cycle);
		WriteIR = 1;
		PCWrite = 0;
		WriteMemDstControl = 2'b00;
		WriteDataSrcControl = 2'b11;
		
		#(cycle);
		MemWrite = 1;
		PCSrcControl = 2'b11;
		PCWrite = 1;	
		
		$display("rti done");
		//Test for j
		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteRa = 0;
		
		#(cycle);
		WriteIR = 1;
		PCSrcControl = 2'b10;
		
		$display("j done");
		//Test for jal
		#(cycle);
		PCSrcControl = 2'b00;
		PCWrite = 1;
		MemWrite = 0;
		WriteRa = 0;
		
		#(cycle);
		PCWrite = 0;
		WriteIR = 1;	
		RaSrcControl = 1;
		
		#(cycle);
		WriteIR = 0;
		PCWrite = 1;
		WriteRa = 1;
		PCSrcControl = 2'b10;
		$display("jal done");
		//Test for jr
		#(cycle);
		PCSrcControl = 2'b11;
		MemWrite = 0;
		WriteRa = 0;
		
		#(cycle);
		PCWrite = 1;
		
		#(cycle);
		PCWrite = 0;
		$display("jr done");
	end
      
endmodule

