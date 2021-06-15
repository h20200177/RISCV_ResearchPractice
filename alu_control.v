`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.06.2021 12:23:20
// Design Name: 
// Module Name: alu_control
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


module alu_control(B_INV,shift,sel,CIN,m,s,clock,alu_op);

output reg B_INV,CIN;
output reg [1:0]m,s,shift,sel;
input [3:0]alu_op;
input clock;


always @( posedge clock)
begin 

case (alu_op)

4'd0:  /////addition 
begin
B_INV = 1'b0;
CIN = 1'b0;
s = 2'd1;
end

4'd1:  /////subtraction
begin
B_INV = 1'b1;
CIN = 1'b1;
s = 2'd1;
end

4'd2:  /////logical left shift operation
begin
B_INV = 1'b0;
shift = 2'd0;
s = 2'd2;
end

4'd3:  /////logical right shift operation
begin
B_INV = 1'b0;
shift = 2'd1;
s = 2'd2;
end

4'd4:  /////arithmetic right shift operation
begin
B_INV = 1'b0;
shift = 2'd2;
s = 2'd2;
end

4'd5:  /////logical AND operation
begin
B_INV = 1'b0;
sel = 2'd0;
s = 2'd0;
end

4'd6:  ///////logical OR operation
begin
B_INV = 1'b0;
sel = 2'd1;
s = 2'd0;
end

4'd7:  ///////logical XOR operation
begin
B_INV = 1'b0;
sel = 2'd2;
s = 2'd0;
end

4'd8:  /////comparing equal operation
begin
B_INV = 1'b1;
CIN = 1'b1;
s = 2'd3;
m = 2'd0;
end

4'd9:  /////comparing greater than or equal to operation
begin
B_INV = 1'b1;
CIN = 1'b1;
s = 2'd3;
m = 2'd1;
end

4'd10:  /////comparing less than operation
begin
B_INV = 1'b1;
CIN = 1'b1;
s = 2'd3;
m = 2'd2;
end


4'd11:  /////comparing not equal operation
begin
B_INV = 1'b1;
CIN = 1'b1;
s = 2'd3;
m = 2'd3;
end


default:
begin
B_INV = 1'bz;
CIN = 1'bz;
m = 2'bzz;
s = 2'bzz;
shift = 2'bzz;
sel = 2'bzz;
end

endcase

end
endmodule
