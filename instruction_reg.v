`timescale 1ns/1ns

module instruction(out1,out2,in,clk,clr,Ei,Li);
output [3:0]out1,out2;
input [7:0]in;
input clk,clr,Ei,Li;

reg [7:0]temp;


assign out2 = (Ei) ? 4'bz : temp[3:0];
assign out1 = temp[7:4];

always @(posedge clk)
  begin
    if(!clr)
      begin temp = 8'd0; end
      
    else if(!Li)
      begin temp = in; end
  end  

endmodule
