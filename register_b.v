`timescale 1ns/1ns
//Define the 8-bit B register
module Bregister(b_out,Lb,clk,in);
//Declare inputs and outputs
output reg[7:0] b_out;
input clk, Lb;
input [7:0]in;


always @(posedge clk) 
begin 
if(!Lb)
b_out = in;
else
 b_out = b_out;
 end
endmodule