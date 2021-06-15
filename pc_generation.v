`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2021 23:09:34
// Design Name: 
// Module Name: pc_generation
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

module pc_generation(pc_in,pc_out,pc1,pc2,JLR,clock);

input [31:0]JLR,pc_in;
//input [31:0]pc_in;
input [1:0]pc1;
input pc2;
output reg [31:0]pc_out;
wire [31:0]imm_b,imm_j;

input clock;
wire comp;
wire [31:0]JLR;
wire [31:0] pc_B;
reg [31:0]pc_A;

always@(posedge clock)
begin

case(pc1)

2'd0:
pc_A = 32'd4;

2'd1:  
pc_A = imm_j;

2'd2: 
if(comp)
pc_A = imm_b;
else
pc_A = 32'd4;

2'd3: 
pc_A = 32'h0;

default : pc_A = 32'hz;
endcase

end

adder32 X1(1'b0,pc_in,pc_A,pc_B,carryout); 


always @(posedge clock)
begin
pc_out = pc2 ? JLR:pc_B ;

end

endmodule


module adder32(carryin,x,y,sub_add,carryout);

parameter n = 32;

output [n-1:0]sub_add;
output carryout;
input [n-1:0]x,y;
input carryin;
 
 wire [n-1:0]temp_sub_add;

 wire [n:0]w;
 genvar i;
 assign w[0] = carryin;
 generate
 for (i=0; i<n; i=i+1 )
 
 begin: nbit_adder
full_adder1 fa(w[i],x[i],y[i],temp_sub_add[i],w[i+1]);
end
endgenerate
assign carryout = w[n];
assign sub_add = {carryout,temp_sub_add};

endmodule


module full_adder1 (cin,a,b,sum,cout);

output sum,cout;
input a,b,cin;

assign sum = a^b^cin;
assign cout = (a&b)|(b&cin)|(a&cin);

endmodule
