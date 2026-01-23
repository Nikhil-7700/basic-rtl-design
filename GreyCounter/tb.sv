// Code your testbench here
// or browse Examples
module tb;
  
  logic clk, rst;
  logic greyCnt;
  
  greyCounter dut(
    .clk(clk), .rst(rst),
    .greyCnt(greyCnt)
  );
  
  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfiles("dump.vcd");
    $dumpvars();
  end
  
  initial begin
    rst = 1'b0;
    #17;
    rst = 1'b1;
    #100;
    rst = 1'b0;
    #10;
    rst = 1'b1;
    #300;
    
    $finish();
  end
  
endmodule