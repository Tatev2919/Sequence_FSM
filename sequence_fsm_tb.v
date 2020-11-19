module sequence_fsm_tb;
	reg data_in,clk,rst;
	wire out;
	
  sequence_fsm fsm1(clk, rst,data_in, out);
	initial 
      begin 
        $dumpfile("wv.vcd");
        $dumpvars();
      end
  
    initial begin 
          rst = 1;
  	  data_in = 0;
          clk = 0;
          #20 rst = 0;
      end

    always begin 	   
        #10 clk=~clk;
    end
  
   initial 
     begin 
        @(posedge clk) data_in <= 1;
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 1;
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 1;
        @(posedge clk) data_in <= 1;
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 1;
        @(posedge clk) data_in <= 0;
        @(posedge clk) data_in <= 1;
        @(posedge clk) data_in <= 1;
	#500;
 	$finish;
      end
 
endmodule

 
