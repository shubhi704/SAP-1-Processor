`timescale 1ns/1ns
//Define the 8-bit ouput register
module outreg(out_reg,Lo, clk, in);
//Declare inputs and outputs
output reg[7:0]out_reg;
input clk, Lo;
input [7:0]in;


always @(posedge clk)
 begin
  if(!Lo)
   out_reg <= in;
  else
   out_reg <= out_reg;
 end
endmodule
 