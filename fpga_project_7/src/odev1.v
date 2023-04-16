module led(input sys_clk, input sys_rst_n,output reg[2:0]led);
reg[63:0]counter;
always @(posedge sys_clk or negedge sys_rst_n)begin
       if(!sys_rst_n)
         counter <= 64'd0;
       else if(counter < 64'd32000_0000)
         counter <= counter +1;
       else
          counter <=64'd0;
       
end
always @(posedge sys_clk or negedge sys_rst_n)begin
         if ( !sys_rst_n)
            led <= 3'b110;
         else if (counter == 64'd32000_0000)
            led <=3'b011;
        else if(counter == 64'd9000_0000)
            led<= 3'b110;
         else if(counter == 64'd26000_0000)
            led <= 3'b101;
      
        
         else
            led<=led;
      end




endmodule