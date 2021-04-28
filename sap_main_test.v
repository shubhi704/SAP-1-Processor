module sap_test;

reg clk,clr;
wire [7:0]Data_out_bus,Data_out_addsub,out_reg;
 
end_module as(clk,clr,Data_out_bus,Data_out_addsub,out_reg);

initial
 begin
  clk = 0;
  forever #5 clk = ~clk;
 end
initial
 begin
  @(posedge clk) clr = 1'b0;
  #6 clr= 1'b1;
 end
initial
 begin
  $dumpfile("s.vcd");
  $dumpvars;
 end
initial
 #1000 $finish;
endmodule