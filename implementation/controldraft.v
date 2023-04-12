`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:59 11/03/2021 
// Design Name: 
// Module Name:    controldraft 
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

`timescale 1ns / 100ps

module MIPS_control_unit (
      //this is input op
		op,
		pcSrc,
		writeMemDst,
		memWrite,
		writeDataSrc,
		//output op
		aluOp,
		aluSrcA,
		aluSrcB,
		readSrc,
		pcWrite,
		pcWriteCond,
		writeRa,
		writeSp,
		clock,
		reset,
		current_state,
		next_state
                          );
   //input and output
	 input clock;
	 input reset;
    input [7:0] op;
	 
	 output [1:0] pcSrc;
	 output [1:0] writeMemDst;
	 output [1:0] writeDataSrc;
	 output [3:0] aluOp;
	 output [1:0] aluSrcA;
	 output [1:0] aluSrcB;
	 output readSrc;
	 output pcWrite;
	 output pcWriteCond;
	 output writeRa;
	 output writeSp;
	 output memWrite;
	 
	 output [3:0] current_state;
	 output [3:0] next_state;
	// register

	 reg [1:0] pcSrc;
	 reg [1:0] writeMemDst;
	 reg [1:0] writeDataSrc;
	 reg [3:0] aluOp;
	 reg [1:0] aluSrcA;
	 reg [1:0] aluSrcB;
	 reg readSrc;
	 reg pcWrite;
	 reg pcWriteCond;
	 reg writeRa;
	 reg writeSp;
	 reg memWrite;
	 
	 reg [3:0] current_state;
	 reg [3:0] next_state;
   //state flip-flops


   //state definitions still working on it
	
   parameter    Fetch = 0;
	
   parameter    Mtype_decode = 1;
   parameter    Btype_decode = 2;
   parameter    Branch_decode = 3;
   parameter    Itype_decode = 4;
   parameter    Load_decode = 5;
	
   parameter    R_Execution = 6;
   parameter    R_Write = 7;
   parameter    Branch = 8;
   parameter    Jump = 9;

   //register calculation
   always @ (posedge CLK, posedge Reset)
     begin
        if (Reset)
          current_state = Fetch;
        else 
          current_state = next_state;
     end


   //OUTPUT signals for each state (depends on current state)
   always @ (current_state)
     begin
        //Reset all signals that cannot be don't cares
        RegWrite = 0; 
        MemRead = 0;
        MemWrite = 0; 
        IRWrite = 0; 
        PCWrite = 0;
        PCWriteCond = 0;
        
        case (current_state)
          
          Fetch:
            begin
				
				readSrc = 0;
				aluSrcA = 0; 
				aluSrcB = 2; 
				aluOp = 0; 
            end 
 //decode state. 5 options!               
          Mtype_decode:
            begin
					aluSrcA = 1; 
					aluSrcB = 0; 
					aluOp = ?;						
            end
        
          Btype_decode:
            begin
					aluSrcA = 1; 
					aluSrcB = 2; 
					aluOp = ?;
					pcSrc = 1;
            end
        
          Branch_Decode:
            begin
					aluSrcA = 1; 
					aluSrcB = 0; 
					aluop = ?;
					pcSrc= 1;  
            end
        
          Itype_Decode:
            begin
					aluSrcA = 2;
					aluSrcB = 2;
            end
			 Load_Decode:
            begin
					aluSrcA = 2; 
					aluSrcB = 2; 
					aluop = 0;
					pcSrc = 1;
            end
//Execution stage. 12 options.....	

			// jump execution
          Jr_Execute:
            begin
               pcWrite = 1;
               PCSource = 3;
            end
			J_Execute:
            begin
               pcWrite = 1;
               PCSource = 2;
            end
			Jal_Execute:
            begin
					pcWrite = 1;
               writeRa = 1;
               PCSource = 2;
            end	
			//allo free	
			Allofree_Execute:
            begin
					aluSrcA = 1; 
					writeSp = 1;  		
            end	
			//load exection
			LD_Execute:
            begin
					writeMemDest = 0;
					writeDataSrc = 1;
					memWrite = 1;
            end				
			Li_Execute:
            begin
					writeMemDst = 0;
					writeDataSrc = 3;
					memWrite = 1;
            end					 
			Lr_Execute:
            begin
					writeRa = 1;
            end
			// M type
			Mtype_Execute:
				begin
					memWrite = 1;
					writeMemDst = 1;
					writeDataSrc = 0;
				end
			//I type
			Itype_Execute:
				begin
					aluSrcA = 1;
					aluSrcB = 2;
					aluOp = ?;
				end
			Sv_Execute:
				begin
					memWrite = 1;
					writeMemDst = 2;
					writeDataSrc = 1;
				end
			Sr_Execute:
				begin
					memWrite = 1;
					writeMemDst = 2;
					writeDataSrc = 2;
				end				
			Rtm_Execute:
				begin
					writeMemDst = 0;
					writeDataSrc = 1;
					pcSrc = 3;
					pcWrite = 1;
				end			 
			Rti_Execute:
				begin
					writeMemDst = 0;
					writeDataSrc = 3;
					pcSrc = 3;
					pcWrite = 1;
				end



			 
          Mem1:
            begin
               $display ("Mem1 outputs not implemented"); 
            end
        
        
          default:
            begin $display ("not implemented"); end
          
        endcase
     end
                
   //NEXT STATE calculation (depends on current state and opcode)       
   always @ (current_state, next_state, Opcode)
     begin         

        $display("The current state is %d", current_state);
        
        case (current_state)
          
          Fetch:
            begin
               next_state = Decode;
               $display("In Fetch, the next_state is %d", next_state);
            end
          
          Decode: 
            begin       
               $display("The opcode is %d", op);
               if(op == 2'h1F)
                   begin
                      next_state = Jump;
                      $display("The next state is R");
                   end
                 2:
                   begin
                      next_state = Jump;
                      $display("The next state is Jump");
                   end
                 4:
                   begin
                      next_state = Branch;
                      $display("The next state is Branch");
                   end
                 35:
                   begin
                      next_state = Mem1;
                      $display("The next state is Mem");
                   end
                 43:
                   begin next_state = Mem1;
                      $display("The next state is Mem");
                   end
                 default:
                   begin 
                      $display(" Wrong Opcode %d ", Opcode);  
                      next_state = Fetch; 
                   end
               endcase  
               
               $display("In Decode, the next_state is %d", next_state);
            end
          
          R_Execution:
            begin
               next_state = R_Write;
               $display("In R_Exec, the next_state is %d", next_state);
            end
          
          R_Write:
            begin
               next_state = Fetch;
               $display("In R_Write, the next_state is %d", next_state);
            end
          
          Branch:
            begin
               next_state = Fetch;
               $display("In Branch, the next_state is %d", next_state);
            end

          Mem1:
            begin
               //not implemented - forcing return to cycle 1
               next_state = Fetch;
               $display("In Mem1, the next_state is %d", next_state);
            end
          
          Jump:
            begin
               next_state = Fetch;
               $display("In Jump, the next_state is %d", next_state);
            end
          
          default:
            begin
               $display(" Not implemented!");
               next_state = Fetch;
            end
          
        endcase
        
        $display("After the tests, the next_state is %d", next_state);
                
     end

endmodule