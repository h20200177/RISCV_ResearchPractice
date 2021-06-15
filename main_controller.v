`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2021 08:36:55
// Design Name: 
// Module Name: main_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module main_controller(instr,clock,ALUop,pc1,pc2,wr_rd,i_m,reg_wr,reg_rd,mem_alu,alu_src,final_rd);


input [31:0]instr;
input clock;
output reg [2:0]mem_alu;
output reg [1:0]pc1,alu_src;
output reg [3:0]ALUop;
output reg wr_rd,i_m,reg_wr,reg_rd,pc2;
output reg final_rd;

always@(posedge clock)
begin

case(instr[6:0])
7'b0110011:begin ////////////////////////////////////////////////////////////// R-TYPE

           case({instr[30],instr[14:12]})
           

           4'b0000: 
           begin 
           ALUop = 4'd0;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
           
           i_m = 1'd1;
           reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd0;
            end                      /////////////////////////////////////////////////////////////// //add
            
            
           4'b1000: 
           begin 
           ALUop = 4'd1;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
           
           i_m = 1'd1;
           reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd0;
            end  //////////////////////////////////////////////////////////////////sub
            
            
           4'b0001: 
           begin 
           ALUop = 4'd2;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
           
           i_m = 1'd1;
           reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd0;
            end   ////////////////////////////////////////////////////////////////////////////////sll
            
            
            4'b0010: 
           begin 
           ALUop = 4'd10;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
         
           i_m = 1'd1;
          reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd0;
            end  ///////////////////////////////////////////////////////////////////////////////////slt

            4'b0100: 
           begin 
           ALUop = 4'd7;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
        
           i_m = 1'd1;
          reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd0;
            end    ////////////////////////////////////////////////////////////////////////////////////xor


         4'b0101: 
           begin 
           ALUop = 4'd3;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
         
           i_m = 1'd1;
           reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd0;
            end  /////////////////////////////////////////////////////////////////////////////srl


            4'b1101: 
           begin 
           ALUop = 4'd4;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
      
           i_m = 1'd1;
           reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd0;
            end  ///////////////////////////////////////////////////////////////////////////////sra



             4'b0110: 
           begin 
           ALUop = 4'd6;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
         
           i_m = 1'd1;
          reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd0;
            end  ////////////////////////////////////////////////////////////////or
            
            
             4'b0111: 
           begin 
           ALUop = 4'd5;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
            
           i_m = 1'd1;
           reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd0;
            end  //////////////////////////////////////////////////////////////////and
            
            
             default: 
           begin 
           ALUop = 4'dz;
           pc1 = 2'dz;
           pc2 = 1'dz;
           wr_rd = 1'dz;
         
           i_m = 1'dz;
           reg_wr = 1'dz;
           reg_rd = 1'dz;
           mem_alu = 3'dz;
           final_rd = 1'dz;
           alu_src = 2'dz;
            end  
 
           endcase  
           end

7'b0010011:
begin // I-TYPE
           case({instr[14:12]})
           
     3'b000: 
           begin 
           ALUop = 4'd0;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
            
           i_m = 1'd1;
           reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd1;
            end  ///////////////////////////////////////////////////////////addi
           
     3'b001: 
           begin 
           ALUop = 4'd10;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
            
           i_m = 1'd1;
            reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd1;
            end   //////////////////////////////////////////////////////////////////slti
            
            
            
            
     3'b100: 
           begin 
           ALUop = 4'd7;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
            
           i_m = 1'd1;
            reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd1;
            end   //////////////////////////////////////////////////////////////////xori
            
    3'b110: 
           begin 
           ALUop = 4'd6;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
           
           i_m = 1'd1;
           reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd1;
            end   //////////////////////////////////////////////////////////////////ori
            
    3'b111: 
           begin 
           ALUop = 4'd5;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
       
           i_m = 1'd1;
           reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd1;
            end   //////////////////////////////////////////////////////////////////andi
  
    default: 
           begin 
           ALUop = 4'dz;
           pc1 = 2'dz;
           pc2 = 1'dz;
           wr_rd = 1'dz;
  
           i_m = 1'dz;
           reg_wr = 1'dz;
           reg_rd = 1'dz;
           mem_alu = 3'dz;
           final_rd = 1'dz;
           alu_src = 2'dz;
            end  

           endcase
           
           case({instr[30],instr[14:12]})
           
      4'b0001: 
           begin 
           ALUop = 4'd2;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
        
           i_m = 1'd1;
           reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd1;
            end  ///////////////////////////////slli
            
            
            
      4'b0101: 
           begin 
           ALUop = 4'd3;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
        
           i_m = 1'd1;
          reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd1;
            end  ///////////////////////////////srli
            

     4'b1101: 
           begin 
           ALUop = 4'd4;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
      
           i_m = 1'd1;
          reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd1;
           alu_src = 2'd1;
            end  ///////////////////////////////srai
            
       default: 
           begin 
           ALUop = 4'dz;
           pc1 = 2'dz;
           pc2 = 1'dz;
           wr_rd = 1'dz;
      
           i_m = 1'dz;
           reg_wr = 1'dz;
            reg_rd = 1'dz;
           mem_alu = 3'dz;
           final_rd = 1'dz;
           alu_src = 2'dz;
            end       
         
          
           endcase
           
   end
           
7'b0000011:begin ///////////////////////////////////////////////////// I-TYPE
           if( instr[14:12] == 3'b010)
            begin 
           ALUop = 4'd0;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
            
           i_m = 1'd0;
           reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'd0;
           alu_src = 2'd1;
            end  /////////////////////////////////////////lw
           end           
           
7'b1100111:
begin ///////////////////////////////////////////////////////////// I-TYPE
           if(instr[14:12] == 3'b000) 
           
            begin 
           ALUop = 4'd0;
           pc1 = 2'd3;
           pc2 = 1'd1;
           wr_rd = 1'd0;
     
           i_m = 1'd1;
           reg_rd = 1'd1;
           reg_wr = 1'd1;
           mem_alu = 3'd0;
           final_rd = 1'd1;
           alu_src = 2'd1;
           
            end  //////////////////////////////////jalr
  end    
                  
7'b0100011:begin // S-TYPE
           if(instr[14:12] == 3'b010)
            
           begin 
           ALUop = 4'd0;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd1;
     
           i_m = 1'd0;
           reg_wr = 1'dz;
           reg_rd = 1'd1;
           mem_alu = 3'd3;
           final_rd = 1'dz;
           alu_src = 2'd2;
            end  ///////////////////////////////sw
           end
           
7'b1100011:begin ////////////////////////////////////////////////////// B-TYPE
           case(instr[14:12])
           
       3'b000: 
            begin 
           ALUop = 4'd8;
           pc1 = 2'bxx;
           pc2 = 1'bx;
           wr_rd = 1'd0;
       
           i_m = 1'd1;
           reg_wr = 1'dz;
           reg_rd = 1'dz;
           mem_alu = 3'dz;
           final_rd = 1'dz;
           alu_src = 2'dz;
            end  ///////////////////////////////beq
            
            
           3'b001: 
            begin 
           ALUop = 4'd11;
           pc1 = 2'bxx;
           pc2 = 1'bx;
           wr_rd = 1'd0;
   
           i_m = 1'd1;
            reg_wr = 1'dz;
           reg_rd = 1'dz;
           mem_alu = 3'dz;
           final_rd = 1'dz;
           alu_src = 2'dz;
            end  ///////////////////////////////bnq
           3'b100: 
           
           begin 
           ALUop = 4'd10;
           pc1 = 2'bxx;
           pc2 = 1'bx;
           wr_rd = 1'd0;
       
           i_m = 1'd1;
            reg_wr = 1'dz;
           reg_rd = 1'dz;
           mem_alu = 3'dz;
           final_rd = 1'dz;
           alu_src = 2'dz;
            end  ///////////////////////////////blt
            
           3'b101: 
           
           begin 
           ALUop = 4'd9;
           pc1 = 2'bxx;
           pc2 = 1'bx;
           wr_rd = 1'd0;
          
           i_m = 1'd1;
          reg_wr = 1'dz;
           reg_rd = 1'dz;
           mem_alu = 3'dz;
           final_rd = 1'dz;
           alu_src = 2'dz;
            end  ///////////////////////////////bge
            
           default : 
           
           begin 
           ALUop = 4'bz;
           pc1 = 2'bzz;
           pc2 = 1'bz;
           wr_rd = 1'dz;
        
           i_m = 1'dz;
            reg_wr = 1'dz;
           reg_rd = 1'dz;
           mem_alu = 3'dz;
           final_rd = 1'dz;
           alu_src = 2'dz;
            end  ///////////////////////////////beq
              
        endcase 
           end          
           
7'b1101111:       //J-TYPE    //jal
 begin 
           ALUop = 4'dz;
           pc1 = 2'd1;
           pc2 = 1'd0;
           wr_rd = 1'd0;
         
           i_m = 1'd1;
           reg_wr = 1'd1;
           reg_rd = 1'dz;
           mem_alu = 3'd0;
           final_rd = 1'd1;
           alu_src = 2'dz;
     end  ///////////////////////////////////////////////////// jal

7'b0110111:       //U-TYPE    //lui

   begin 
           ALUop = 4'dz;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
       
           i_m = 1'd1;
           reg_wr = 1'd1;
           reg_rd = 1'dz;
           mem_alu = 3'd1;
           final_rd = 1'd1;
           alu_src = 2'dz;
     end  ///////////////////////////////////////////////////// lui
           
7'b0010111:
   begin 
           ALUop = 4'dz;
           pc1 = 2'd0;
           pc2 = 1'd0;
           wr_rd = 1'd0;
          
           i_m = 1'd1;
           reg_wr = 1'd1;
           reg_rd = 1'dz;
           mem_alu = 3'd1;
           final_rd = 1'd1;
           alu_src = 2'dz;
     end  ///////////////////////////////////////////////////// auipc

default:
    begin 
           ALUop = 4'dz;
           pc1 = 2'dz;
           pc2 = 1'dz;
           wr_rd = 1'dz;
       
           i_m = 1'dz;
           reg_wr = 1'dz;
           reg_rd = 1'dz;
           mem_alu = 3'dz;
           final_rd = 1'dz;
           alu_src = 2'dz;
      end            
      
                   
endcase

end
endmodule