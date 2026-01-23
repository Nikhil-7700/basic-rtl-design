// Testbench for Edge Detector

module tb_edge;
	reg	clk;
	reg	rst;
	reg	a_in;
	reg	out_rise;
	reg	out_fall;
	
	edge_detector dut(.clk(clk), .rst(rst), .a_in(a_in), .out_fall(out_fall), .out_rise(out_rise));
	
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		$dumpfile("dump.vcd"); $dumpvars;
	end
	
	initial begin
		rst = 1'b0;
		#23
		rst = 1'b1;
		
		#100
		rst = 1'b0;
        #10
        $finish;
	end
	
	initial begin
		a_in = 1'b0;
		#13
		a_in = 1'b1;
		#10
		a_in = 1'b0;
		#25
		a_in = 1'b1;
		#14
		a_in = 1'b0;
		#17
		a_in = 1'b1;
		#10
		a_in = 1'b0;
		#20
		a_in = 1'b1;
		#10
		a_in = 1'b0;
	end
endmodule