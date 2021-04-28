`timescale 1ns/1ns
module ram(ram_out,addr,Ce);
output [7:0]ram_out;
input [3:0]addr;
input Ce;
reg [7:0]ram_out;

always @(*)
 if(!Ce)
    begin
      casex(addr)
       4'b0000 : ram_out = 8'b0000_1001;
       4'b0001 : ram_out = 8'b0001_1010;
       4'b0010 : ram_out = 8'b0001_1011;
       4'b0011 : ram_out = 8'b0010_1100;
       4'b0100 : ram_out = 8'b1110_1111;
       4'b0101 : ram_out = 8'b1111_0000;
       4'b0110 : ram_out = 8'b1111_0000;
       4'b0111 : ram_out = 8'b0000_0110; //AA
       4'b1000 : ram_out = 8'b1010_1010; //DF
       4'b1001 : ram_out = 8'b1110_1111; 
       4'b1010 : ram_out = 8'b0000_0111;
       4'b1011 : ram_out = 8'b0001_0100;
       4'b1100 : ram_out = 8'b0001_1000;
       4'b1101 : ram_out = 8'b0010_0000;
       4'b1110 : ram_out = 8'b0001_0001;
       4'b1111 : ram_out = 8'b0001_1000;
       default : ram_out = 8'b0010_0000;
      endcase
    end
  else begin ram_out = 8'bz; end
endmodule