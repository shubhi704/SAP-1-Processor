`timescale 1ns/1ns
module sub_add(add_sub,a,b,enable,sub);
output [7:0]add_sub;
input [7:0]a,b;
input enable,sub;
reg [7:0]temp;

assign add_sub = enable ? temp : 8'hz;
always @(enable)
begin
   if(!sub)
     begin
      temp = a + b;
     
    end
 else
   begin
    temp  = a-b;
  
   end
 end
endmodule