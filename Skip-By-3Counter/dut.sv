// Code your design here
// 8-Bit Skip-By-3 Counter

module counterSkip3(
  input clk, rst,
  output reg [7:0] dout
);
  
  wire c1, c2, c3, c4, c5, c6, c7;
  
  assign c1 = dout[0];
  assign c2 = dout[1] | c1;
  assign c3 = dout[2] & c2;
  assign c4 = dout[3] & c3;
  assign c5 = dout[4] & c4;
  assign c6 = dout[5] & c5;
  assign c7 = dout[6] & c6;
  
  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      dout <= 0;
    end
    
    else begin
      if (dout == 8'hff) dout <= 0;
      else dout <= {dout[7] ^ c7,
                    dout[6] ^ c6,
                    dout[5] ^ c5,
                    dout[4] ^ c4,
                    dout[3] ^ c3,
                    dout[2] ^ c2,
                    ~(dout[1] ^ c1),
                    ~dout[0]
                   };
    end
    
  end
  
  
endmodule