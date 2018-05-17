`timescale 1 ns/1 ns

module Testbench();

reg B, Clk, Rst;
wire [1:0] Y;

// Clock Procedure
always begin
	Clk <= 0;
	#10;
	Clk <= 1;
	#10;
end

Barcode barcode(B, Y, Clk, Rst);

initial begin
    $dumpfile("TimingDiagram.vcd");
	$dumpvars(0, B, Y, Clk, Rst);
	
	Rst = 1;
	#15 Rst = 0;
	#5 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 0;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	
	#20 Rst = 1;
	#15 Rst = 0;
	#5 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 0;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;

	
	#20 Rst = 1;
	#15 Rst = 0;
	#5 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20;
	
	#20 Rst = 1;
	#15 Rst = 0;
	#5 B = 1;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 1;

	
	#20 Rst = 1;
	#15 Rst = 0;
	#5 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 0;
	#20 B = 0;
	#20 B = 1;
	#20 B = 1;
	#20;
	
    $finish;
end

endmodule

/*
`timescale 1ns/1ns

module testbench();

wire [1:0] output_y;

reg input_b;
initial input_b = 0;

reg reset;
initial reset = 1;

reg clock;

always begin
	clock <= 0;
	#10;
	clock <= 1;
	#10;
end

barcode b(output_y, input_b, reset, clock);

initial begin
    $dumpfile("TimingDiagram.vcd");
	$dumpvars(0, output_y, input_b, reset, clock);
	
	#15 reset= 0;
	input_b=1;
	#20 input_b=0;
	#20 input_b=1;
	#20 input_b=0;
	#20 input_b=0;	
	#20 input_b=0;
	reset = 1;
	#20 input_b=1;
	#20 input_b=1;
	#20 input_b=0;
	#150;
    $finish;
end

endmodule
*/