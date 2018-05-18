`timescale 1 ns/1 ns

module Testbench();

reg input_a, input_b, clock, reset;
wire [1:0] output_y;

// Simulate Clock
always begin
	clock <= 0;
	#10;
	clock <= 1;
	#10;
end

analysis analysis1(output_y, input_a, input_b, clock, reset);

initial begin
    $dumpfile("TimingDiagram.vcd");
	$dumpvars(0, output_y, input_a, input_b, clock, reset);
	
	reset = 1;
	
	input_a = 0;
	input_b = 0;
	
	#20
	reset = 0;
	
	#5 
	#20 input_b = 1;
	#20 input_a = 1;
	#20 input_b = 0;
	#20 input_a = 1;
	#20 input_a = 1;
	#20 input_b = 0;
	#20 input_a = 1;
	#20 input_b = 1;
	#20 input_b = 0;
	#20 input_a = 1;
	#20 input_b = 0;
	#20 input_a = 0;
	#20 input_a = 1;
	#20 input_b = 0;
	#20 input_a = 1;
	#20 input_b = 1;
	#20 input_a = 1;
	#20 input_b = 0;
	#20 input_a = 0;
	#20 input_a = 1;
	#20 input_b = 1;
	#20 input_a = 1;
	#20 input_b = 0;
	#20 input_b = 1;
	#5
	
	reset = 1;
	#20;
	
    $finish;
end

endmodule