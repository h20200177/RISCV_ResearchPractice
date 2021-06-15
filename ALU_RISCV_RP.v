`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2021 18:40:57
// Design Name: 
// Module Name: ALU_RISCV_RP
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

module ALU(A,B,CIN,B_INV,clock,s,m,shift,sel,result,comp,JLR,count);

input [31:0]A,B;
input [1:0]s,sel,m;
input CIN,B_INV,clock;
input [1:0]shift;
output reg[31:0]result;
output [3:0]count;
output [31:0] JLR;
output reg comp;
wire [31:0]i0,i1,i2,i3,i4,i5,i6;
wire [31:0]tempB;
wire bt;

assign  tempB = B_INV?(~B):B;

logical m1(A,tempB,clock,sel,i0); /// logical operation
sub_add m2(A,tempB,CIN,i1);      /// add or sub operation
shift   m3(A,B,clock,shift,i2);           /// shift operation
comparison m4(A,tempB,m,clock,bt,count);   /// for branch operation

assign JLR = i1 & (~(32'd1)) ;

always@(posedge clock)
begin

case (s)

2'd0: begin result = i0; comp = 1'bz; end
2'd1: begin result = i1; comp = 1'bz; end
2'd2: begin result = i2; comp = 1'bz; end

2'd3: 
begin 
if (bt == 1'b0)
begin 
comp = 1'b0;
result = 32'd0;
end 
else 
begin
comp = 1'b1;
result = 32'd1;
end
end

default: begin result = 32'dz; comp = 1'bz; end
endcase

end

endmodule

///////////////shift module ////////////////////////////////////////////

module shift(rs,s_value,clk,x,out);
input [31:0]rs,s_value;
input [1:0]x;
input clk;
output reg[31:0]out;
reg [31:0]temp_rs;
reg flag=1'b0;
reg [31:0]i=0;

always@(posedge clk)
begin
case(x)
2'd0:out=rs<<s_value;
2'd1:out=rs>>s_value;
2'd2:out=rs>>>s_value;
default:out=32'dz;
endcase
end
endmodule

////////////////////////////// comparison block///////////////////////////////////////

module comparison (A,B,m,clock,bt,count);

input [31:0]A,B;
input [1:0]m;
output reg bt;
input clock;
wire [32:0] out;
output reg [3:0] count = 0;


sub_add A1(A,B,1'b1,out);

always @( posedge clock )
begin


case (m)
2'd0: 
begin 
if (out  == 32'b0)
begin
 bt = 1'b1;
 count  = count + 1;
 end 
 else
 bt = 1'b0;
 end
 
 2'd1: 
begin 
if (out  == 32'b0 || out[32] == 1'b0)
 bt = 1'b1; 
 else
 bt = 1'b0;
 end
 
 2'd2: 
begin 
if ( out[32] == 1'b1 )
 bt = 1'b1; 
 else
 bt = 1'b0;
 end
 
 2'd3: 
begin 
if (out != 32'b0)
 bt = 1'b1; 
 else
 bt = 1'b0;
 end
 
 default: bt = 1'bz;
endcase
 end
 
endmodule

//////////////////////////// logical operation module //////////////////////////////////////

module logical(x,y,clock,sel,out);
input [31:0]x,y;
input [1:0]sel;
input clock;
output reg[31:0]out;

always@(posedge clock)
begin
case (sel)
2'd0: out=(x&y);
2'd1: out=(x|y);
2'd2: out=(x^y);
default: out=32'bz;
endcase
end
endmodule

//////////////////////////////////////// add_sub ///////////////////////////////////////////////////
module sub_add(a,b,flag,res);


parameter n = 32;

input [n-1:0]a,b;
input flag;
output [n:0]res;

wire [n-1:0]b;
wire c1,c2,c3,cin;
wire [n-1:n/2]out1,out2;
wire [n+1:0]out;

assign cin = flag?1'b1:1'b0;
//assign b = cin?(~B):B;

adder A1(cin,a[((n/2)-1):0],b[((n/2)-1):0],out[((n/2)-1):0],c1);

adder A2(1'b0,a[n-1:n/2],b[n-1:n/2],out1[n-1:n/2],c2);

adder A3(1'b1,a[n-1:n/2],b[n-1:n/2],out2[n-1:n/2],c3);

assign out[n+1:n/2]=c1?{c3,out2[n-1:n/2]}:{c2,out1[n-1:n/2]};
//assign res = out[16]?{1'b0,out[15:0]}:{1'b1,(~out[15:0]+16'b1)};
assign res = flag?({out[n-1],out[n-1:0]}):(out);
 //assign res = {out[15],out[15:0]};

endmodule

module adder(carryin,x,y,sub_add,carryout);

parameter n = 16;

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
full_adder fa(w[i],x[i],y[i],temp_sub_add[i],w[i+1]);
end
endgenerate
assign carryout = w[n];
assign sub_add = {carryout,temp_sub_add};

endmodule


module full_adder(cin,a,b,sum,cout);

output sum,cout;
input a,b,cin;

assign sum = a^b^cin;
assign cout = (a&b)|(b&cin)|(a&cin);

endmodule

////////////////////////////////////////////////////end /////////////////////////////////////////
