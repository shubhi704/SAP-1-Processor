`timescale 1ns/1ns
module Accumulator(La,Ea,Clk,Data_in,Data_out_bus,Data_out_addsub);
input La;
input Ea;
input Clk;
input [7:0]Data_in;
output [7:0]Data_out_bus;
output reg [7:0]Data_out_addsub;

reg [7:0]Data_out_reg;

always @(posedge Clk)
begin
 if(La===0)
  begin
    Data_out_reg <= Data_in;
    Data_out_addsub <= Data_in;
 end
else if(La===1) begin
  Data_out_reg<=Data_out_reg;
  Data_out_addsub<=Data_out_addsub;
end
end

assign Data_out_bus=(!Ea) ? 8'bz : Data_out_reg;

endmodule
