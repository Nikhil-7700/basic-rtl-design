
// Rise and Fall Detector

module edge_detector(
	input wire	clk,
	input wire	rst,
	input wire	a_in,
	output wire	out_rise,
	output wire	out_fall
	);
	
	reg a_in_r;
	reg out_fall_r, out_rise_r;
	
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			out_fall_r <= 0;
			out_rise_r <= 0;
		end
		else begin
			a_in_r <= a_in;
		end
	end

	
	always @(a_in or a_in_r) begin
		out_rise_r <= a_in & ~a_in_r;
		out_fall_r <= ~a_in & a_in_r;
	end
	
	assign out_fall = out_fall_r;
	assign out_rise = out_rise_r;
	
endmodule