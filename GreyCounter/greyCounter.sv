module greyCounter(
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
  
  
  
endmodule