`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2021 17:06:40
// Design Name: 
// Module Name: register_file
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


module register_file(instr,wr_data,reg_wr,reg_rd,clock,rd1,rd2);

input [31:0]wr_data;
input reg_rd,clock,reg_wr;
output reg[31:0]rd1,rd2;
integer i;

reg [4:0]rs1,rs2,rd;
reg [31:0]mem[1:40];

input [31:0]instr;


always@(posedge clock)
begin

rs1=instr[19:15]; rs2=instr[24:20]; rd =instr[11:7];

if (reg_rd)
begin
$readmemb("reg_file.mem",mem);
for ( i=0; i<=40; i=i+1)
$display ("%h", mem[i]);

rd1 = mem[rs1];
rd2 = mem[rs2];
end

if (reg_wr)
begin
mem[rd] = wr_data;
$writememb ("D:/RP/reg_file.mem",mem);
end

end
endmodule
