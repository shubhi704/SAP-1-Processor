`timescale 1ns/1ns
//creating the program counter module
module program_counter (to_WBUS,Cp,clk,clr,Ep);
output [3:0]to_WBUS;
input Cp;
input clk;
input clr;
input Ep;
reg [3:0]tempc;

assign to_WBUS = (Ep) ? tempc : 4'bz;
always @(negedge clk)  // negative edge of nCLK means positive edge of CLK
   begin
     if(clr == 0 )
        /* Reset Program Counter */
     begin
      tempc = 4'b0000;
     end
     else if(Cp == 1)
      begin
       tempc = tempc + 1;
      end
  end

  endmodule