`timescale 1ns / 1ns
module TestBench();

reg i0, i1, i2;
wire b;

my_module soccer(b, i0, i1, i2);

initial begin
	$dumpfile("TimingDiagram.vcd");
	$dumpvars(0, b, i0, i1, i2);
	
	i0 = 0; i1 = 0; i2 = 0;
	#20
	i0 = 0; i1 = 0; i2 = 1;
	#20
	i0 = 0; i1 = 1; i2 = 0;
	#20
	i0 = 0; i1 = 1; i2 = 1;
	#20
	i0 = 1; i1 = 0; i2 = 0;
	#20
	i0 = 1; i1 = 0; i2 = 1;
	#20
	i0 = 1; i1 = 1; i2 = 0;
	#20
	i0 = 1; i1 = 1; i2 = 1;
	#20
	$finish;
end
endmodule