module sequence_fsm (
    input clk,
    input rst,
    input data_in,
    output out
);
  parameter IDLE = 3'b001;
  parameter s1 = 3'b010;
  parameter s2 = 3'b011;
  parameter s3 = 3'b100;
  parameter s4 = 3'b101;
  
  reg [2:0] state , next_state;
  assign out = (state == s4)?1'b1:1'b0;
  
  always @(posedge clk)
	begin
      if (rst) 
   		state <= IDLE;
 	else
   		state <= next_state;
    end
  
  always @ (state or data_in)
        begin 
          case (state) 
           IDLE:
             if(data_in == 1'b1) 
             begin
            	next_state = s1; 	
             end 
            else 
              next_state = state;
            s1: 
              if(data_in == 1'b0 )
                begin 
                	next_state = s2;
                end
               else 
                 begin 
                 	next_state = state;
                 end 
            s2:
              if(data_in == 1'b1) 
                begin 
                	next_state = s3;
                end
              else 
                  begin 
                  	next_state = IDLE;
                  end
             s3:
               if (data_in == 1'b0)
                 begin 
                 	next_state = s4;
                 end
               else 
                 begin 
                 	next_state = s1;
                 end
              s4:
                if (data_in == 1'b0 )
                  begin 
                  	next_state = s2;
                  end
                else 
                  begin 
                  	next_state = s3;
                  end
            default: 
                 next_state  = IDLE;
          endcase
        end
endmodule