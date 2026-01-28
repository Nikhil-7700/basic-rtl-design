// Method 1
/*module greyCounter(
  input clk, rst,
  output [3:0] greyCnt
);
  
  reg [3:0] counter;
  
  
  always @(posedge clk or negedge rst) begin
    if (!rst) counter <= 4'b0;
    else counter <= counter + 1;    
  end
  
  assign greyCnt = {counter[3],
                    counter[3] ^ counter[2],
                    counter[2] ^ counter[1],
                    counter[1] ^ counter[0] };
  
  
  

endmodule*/


// Method 2
module greyCounter(
  input clk, rst,
  output reg [2:0] Qout
);
  
  //reg [2:0] Qout_r;
  
  always @(posedge clk or negedge rst) begin
    if (!rst) Qout <= 0;
    
    else begin
      Qout[2] <= ( Qout[2] & Qout[0] ) | ( Qout[1] & ~Qout[0] );
      Qout[1] <= ( ~Qout[2] & Qout[0] ) | ( Qout[1] & ~Qout[0] );
      Qout[0] <= ~(Qout[2] ^ Qout[1]);
      
    end
    
  end
  
  
  
endmodule
