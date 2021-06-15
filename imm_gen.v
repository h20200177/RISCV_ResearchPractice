`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2021 01:42:39
// Design Name: 
// Module Name: imm_gen
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

module imm_gen(instr,imm_i,imm_u,imm_s,imm_b,imm_j,shmt_i,clock);

output reg[31:0]imm_i,imm_u,imm_s,imm_b,imm_j,shmt_i;

input clock;

input [31:0]instr;

always @(posedge clock)
begin

case(instr[6:0])

7'b0000011: imm_i= {{20{instr[31]}},instr[31:20]};       // I-type

7'b0010011: begin
            if((instr[14:12]==3'd1)||(instr[14:12]==3'd5))
            shmt_i= {27'b0,instr[24:20]};       // shamt I-type
            else
            imm_i= {{20{instr[31]}},instr[31:20]};       // I-type
            end
            
7'b1100111: imm_i= {{20{instr[31]}},instr[31:20]};       // I-type

7'b0100011: imm_s= {{20{instr[31]}},instr[31:25],instr[11:7]};       // S-type 

7'b1100011: imm_b= {{18{instr[31]}},instr[31],instr[7],instr[30:25],instr[11:8],1'b0};       // B-type

7'b1101111: imm_j= {{11{instr[31]}},instr[31],instr[19:12],instr[21],instr[30:22],1'b0};       // J-type

7'b0110111: imm_u= {instr[31:12],12'b0} ;       // U-type

7'b0010111: imm_u= {instr[31:12],12'b0} ;       // U-type
// 
default: begin imm_i=32'b0;imm_u=32'b0;imm_s=32'b0;imm_b=32'b0;imm_j=32'b0;shmt_i=32'b0;end

endcase




end
endmodule
