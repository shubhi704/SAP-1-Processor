`include "pc.v"
`include "controller.v"
`include "input_MAR.v"
`include "ram.v"
`include "instruction_reg.v"
`include "accumulator.v"
`include "sub_add.v"
`include "register_b.v"
`include "output_reg.v"

module end_module(clk,clr,Data_out_bus,Data_out_addsub,out_reg);

input clk,clr;
output [7:0]Data_out_bus,out_reg;
output [7:0]Data_out_addsub,b_out,add_sub;
output [3:0]mar_out,IR,inst2;
wire [11:0]CON;
wire [7:0]ram_out;
wire [7:0]w_bus;

program_counter es(w_bus[3:0],CON[11],clk,clr,CON[10]);

in_MAR mar(mar_out,w_bus[3:0],clk,CON[9]);

ram rm(w_bus,mar_out,CON[8]); 

instruction inst(IR,w_bus[3:0],w_bus,clk,clr,CON[6],CON[7]); 

controller con(CON,IR,clk,clr);

Accumulator acc(CON[5],CON[4],clk,w_bus,Data_out_bus,Data_out_addsub);

sub_add sa(w_bus,Data_out_addsub,b_out,CON[2],CON[3]);

Bregister regb(b_out,CON[1],clk,w_bus);

outreg oreg(out_reg,CON[0],clk,Data_out_bus);

endmodule