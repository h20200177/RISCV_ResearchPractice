`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2021 17:17:50
// Design Name: 
// Module Name: instr_mem
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

module instr_mem(add,clock,mem_enable,instr);

input [31:0]add;
//input restart;
input clock,mem_enable;
output reg[31:0]instr;

reg [31:0]rom[0:39];


always@(posedge clock)
begin

if(mem_enable)
instr = rom[add];

end

initial
begin

rom[0]=32'h0001a083;  ////load instruction to load the random sequence pattern into R0 register.
rom[1]=32'h40208133;
rom[2]=32'h002092b3;
rom[3]=32'h0020a2b3;
rom[4]=32'h0020f3b3;  ////branch to this instruction after load.. AND opearation is done here
rom[5]=32'h0020d2b3;
rom[6]=32'h0020e2b3;
rom[7]=32'h4020d2b3;
rom[8]=32'h00538363;  //// branch if equal instruction ..if true then branch to 14th location(imm = 6 ), if not then branch to 12th location
rom[9]=32'h00308293;
rom[10]=32'h0030a293;
rom[11]=32'h0030c293;
rom[12]=32'h0080d0b3; //// right shift by 1 instruction...after this branch to 16th instruction
rom[13]=32'h0030f293;
rom[14]=32'h0060d0b3; ////if branch is true in 8th instruction.......this is a right shift by 5 instruction
rom[15]=32'h00c082e7;
rom[16]=32'h0020f3b3; ///////////////////after right shift in 12th instruction ..branch here that does the AND operation
rom[17]=32'h00309293;
rom[17]=32'h0030d293;
rom[18]=32'h0020f3b3; //// do the AND oparation after doing right shift by 5 in 14th instruction
rom[19]=32'h0620a2a3;
rom[20]=32'h005383e3; //// after doing the AND opearion in 16th instruction check the branch if equal condition here
rom[21]=32'h062092e3;
rom[22]=32'h005383e3; //// check the equal condition here after AND operation in 18th instruction
rom[23]=32'h0620d2e3;
rom[24]=32'h0080d0b3;
rom[25]=32'h000082b7;
rom[26]=32'h0080d0b3;
rom[27]=32'h0060d0b3;
rom[28]=32'h0020f3b3;
rom[29]=32'h0060d0b3;
rom[30]=32'h0020f3b3;
rom[31]=32'h0020f3b3;
rom[32]=32'h005382e3;
rom[33]=32'h0020f3b3;
rom[34]=32'h005383e3;
rom[35]=32'h00538363;
rom[36]=32'h0080d0b3;
rom[37]=32'h005383e3;
rom[38]=32'h0080d0b3;
rom[39]=32'h0080d0b3;
rom[40]=32'h0020f3b3;
rom[41]=32'h0060d0b3;
rom[42]=32'h0020f3b3;
rom[43]=32'h0020f3b3;
rom[44]=32'h0080d0b3;
rom[45]=32'h0020f3b3;
rom[49]=32'h005383e3;

end

endmodule

module data_memory (add,clock,wr_rd,i_m,data_in,data_mem);

input [31:0]add;
input [31:0]data_in;
input clock, wr_rd,i_m;
output reg [31:0]data_mem;
reg [31:0]mem[1:40];
//output reg mem_enable;

always@(posedge clock)
begin

if (!wr_rd)
begin
$readmemb("data_mem.mem",mem);
data_mem = mem[add];
end

if (wr_rd )
begin
mem[add] = data_in;
$writememb ("D:/RP/data_mem.mem",mem);
end

end
endmodule
