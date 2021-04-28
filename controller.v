`timescale 1ns/1ns
module controller(CON,op_code,clk,clr);
output reg [11:0]CON;
input clk;
input clr;
input [3:0]op_code;
reg [5:0]state;

parameter  LDA = 4'b0000,
 ADD= 4'b0001,
 SUB= 4'b0010,
 OUT= 4'b1110,
 HLT= 4'b1111;

always @(negedge clk,negedge clr)  
begin
 if(!clr)
  begin state <= 6'd1; end
 else if(state == 6'd32)
   begin state <= 6'd1; end
  else
   begin state <= state << 1; end
 end

always @(state,clr)
 begin
 if(clr)
  begin
   case(state)
    6'd1 : begin CON <= 12'h5E3; end 
    6'd2 : begin CON <= 12'hBE3; end 
    6'd4 : begin CON <= 12'h263; end 
    6'd8 : begin
            if(op_code == ADD || op_code == SUB || op_code == LDA)   // ADD + SUB  

              begin CON <= 12'h1A3; end 
           else if(op_code == OUT)   // OUT 
             begin CON <= 12'h3F2; end
          else if(op_code == HLT)     // HLT
             begin CON <= 12'h3E3;
                   $stop;
                       end
               end

   6'd16 : begin
           if(op_code == LDA)        // LDA
             begin CON <= 12'h2C3; end  
           else if(op_code == ADD || op_code ==SUB)      // ADD + SUB	
             begin CON <= 12'h2E1; end
           else if(op_code == OUT)      //OUT
             begin CON <= 12'h3E3;
                        end
           end
    

    6'd32 : begin  
            if(op_code == ADD)           // SUB
             begin CON = 12'h3C7;
                    end 
            else if(op_code == SUB)       //ADD
             begin CON = 12'h3CF; end
                   
            else if(op_code == LDA)
             begin CON <= 12'h3E3;
                    end
           end

   default: $display($time,"output come in next state",state,clr,clk,op_code); 
  endcase
 end 
else begin CON <= 12'hxxx; end 

 end
endmodule     









    
