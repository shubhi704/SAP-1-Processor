`timescale 1ns/1ns
module in_MAR(mar_out,out_count,clk,Lm);
output reg[3:0]mar_out;
input [3:0]out_count;
input clk,Lm;
reg [3:0]temp;

always @(posedge clk)
begin
 if(!Lm)
  mar_out = out_count;
 else
   mar_out = mar_out;
 end
endmodule
       