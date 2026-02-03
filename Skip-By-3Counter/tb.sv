// Code your testbench here
// or browse Examples
module tb;
  
  logic clk, rst;
  logic [7:0] dout;
  
  counterSkip3 dut(.clk(clk), .rst(rst), .dout(dout));
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    rst = 1'b0;
    #27;
    rst = 1'b1;
    #1000;
    $finish();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule