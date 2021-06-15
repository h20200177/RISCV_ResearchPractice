`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2021 18:30:37
// Design Name: 
// Module Name: main_proc
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


module main_proc(clock,i_m,mem_enable,count,pc_in);

input clock,mem_enable;
wire [31:0]pc_out;
output [3:0]count;
wire [31:0]instr,result;
input i_m;
wire [2:0] mem_alu;

wire [31:0]rd1,rd2,imm_i,imm_s,shmt_i,imm_u,alu_B,imm_b,imm_j;
wire B_INV,CIN;
wire [1:0]m,s,shift,sel;
wire [3:0]alu_op;
wire reg_wr,reg_rd;
wire [31:0]rd;
input [31:0]pc_in;
wire [31:0] final_pc;
wire [1:0]pc1;
wire pc2;
wire [31:0]JLR,data_mem;
wire final_rd;
wire [31:0] out1;
wire [1:0]alu_src;
/////////////////pc_in, mem_enable,clock is provided by the testbench/////////////////////

 main_controller A2(instr,clock,alu_op,pc1,pc2,wr_rd,i_m,reg_wr,reg_rd,mem_alu,alu_src,final_rd);
 
instr_mem A3(final_pc,clock,mem_enable,instr);

register_file AX(instr,rd,reg_wr,reg_rd,clock,rd1,rd2);

 mux2 M2(clock,alu_src,imm_i,imm_s,shmt_i,rd2, alu_B);
 
 mux1 M1(final_rd,out1,data_mem,rd);
 
 data_memory A8 (result,clock,wr_rd,i_m,rd2,data_mem);
 
mux3 M3( mem_alu,clock, pc_in,imm_u,result, out1);

 alu_control A4(B_INV,shift,sel,CIN,m,s,clock,alu_op);
 
 ALU A5(rd1,alu_B,CIN,B_INV,clock,s,m,shift,sel,result,comp,JLR,count);  ///////////here result is alu result
 
 imm_gen A6(instr,imm_i,imm_u,imm_s,imm_b,imm_j,shmt_i,clock);
 
pc_generation A7(pc_in,pc_out,pc1,pc2,JLR,clock);
mux4 M4(result, final_pc, i_m,clock, pc_in);

endmodule



module mux1 (final_rd,out1,data_mem,rd);

input final_rd;
input [31:0]out1, data_mem;
output [31:0]rd;

assign rd = final_rd ? out1 : data_mem;

endmodule

module mux2 (clock,alusrc,imm_i,imm_s,shmt_i,rd2, alu_B);

input [1:0]alusrc;
input [31:0]imm_i,imm_s,shmt_i;
input [31:0]rd2;
output reg [31:0]alu_B;
input clock;

always@(posedge clock)
begin
case (alusrc)

2'd0: alu_B = rd2;

2'd1: alu_B = imm_i;

2'd2: alu_B = imm_s;

2'd3: alu_B = shmt_i;

default:
alu_B = 32'bz;

endcase
end
endmodule


module mux3 ( mem_alu,clock, pc_in,imm_u,result, out1 );
output reg [31:0] out1;
input [2:0]mem_alu;
input [31:0] imm_u,pc_in;
input clock;
wire [31:0]x1,x2;
input [31:0]result;

adder32 A1(1'b0,pc_in,32'd4,x1,carryout); 
adder32 A2(1'b0,pc_in,imm_u,x2,carryout);

always @(posedge clock)
begin
case(mem_alu)

3'd0: out1 = x1;
3'd1: out1 = x2;
3'd2: out1 = imm_u;
3'd3: out1 = result;

default:
out1 = 32'bz;
endcase
end 


endmodule


module mux4 (result, final_pc, i_m,clock, pc_in);
input [31:0] result,pc_in;
output reg [31:0]final_pc;
input i_m;
input clock;


always@(posedge clock)
final_pc = i_m ?  pc_in : result ;


endmodule
