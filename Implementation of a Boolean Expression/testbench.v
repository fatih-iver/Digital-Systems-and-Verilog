module test;

wire z;

reg y1, y0;
reg x2, x1, x0;

my_model soccer(z, y1, y0, x2, x1, x0);

initial 
	begin
		$dumpfile("TimingDiagram.vcd");
		$dumpvars(0, z, y1, y0, x2, x1, x0);
		
		y1 = 0; y0 = 0; x2 = 0; x1 = 0; x0 = 0;
		#20
		y1 = 0; y0 = 0; x2 = 0; x1 = 0; x0 = 1;
		#20
		y1 = 0; y0 = 0; x2 = 0; x1 = 1; x0 = 0;
		#20
		y1 = 0; y0 = 0; x2 = 0; x1 = 1; x0 = 1;
		#20
		y1 = 0; y0 = 0; x2 = 1; x1 = 0; x0 = 0;
		#20
		y1 = 0; y0 = 0; x2 = 1; x1 = 0; x0 = 1;
		#20
		y1 = 0; y0 = 0; x2 = 1; x1 = 1; x0 = 0;
		#20
		y1 = 0; y0 = 0; x2 = 1; x1 = 1; x0 = 1;
		#20
		
		y1 = 0; y0 = 1; x2 = 0; x1 = 0; x0 = 0;
		#20
		y1 = 0; y0 = 1; x2 = 0; x1 = 0; x0 = 1;
		#20
		y1 = 0; y0 = 1; x2 = 0; x1 = 1; x0 = 0;
		#20
		y1 = 0; y0 = 1; x2 = 0; x1 = 1; x0 = 1;
		#20
		y1 = 0; y0 = 1; x2 = 1; x1 = 0; x0 = 0;
		#20
		y1 = 0; y0 = 1; x2 = 1; x1 = 0; x0 = 1;
		#20
		y1 = 0; y0 = 1; x2 = 1; x1 = 1; x0 = 0;
		#20
		y1 = 0; y0 = 1; x2 = 1; x1 = 1; x0 = 1;
		#20
		
		y1 = 1; y0 = 0; x2 = 0; x1 = 0; x0 = 0;
		#20
		y1 = 1; y0 = 0; x2 = 0; x1 = 0; x0 = 1;
		#20
		y1 = 1; y0 = 0; x2 = 0; x1 = 1; x0 = 0;
		#20
		y1 = 1; y0 = 0; x2 = 0; x1 = 1; x0 = 1;
		#20
		y1 = 1; y0 = 0; x2 = 1; x1 = 0; x0 = 0;
		#20
		y1 = 1; y0 = 0; x2 = 1; x1 = 0; x0 = 1;
		#20
		y1 = 1; y0 = 0; x2 = 1; x1 = 1; x0 = 0;
		#20
		y1 = 1; y0 = 0; x2 = 1; x1 = 1; x0 = 1;
		#20
		
		y1 = 1; y0 = 1; x2 = 0; x1 = 0; x0 = 0;
		#20
		y1 = 1; y0 = 1; x2 = 0; x1 = 0; x0 = 1;
		#20
		y1 = 1; y0 = 1; x2 = 0; x1 = 1; x0 = 0;
		#20
		y1 = 1; y0 = 1; x2 = 0; x1 = 1; x0 = 1;
		#20
		y1 = 1; y0 = 1; x2 = 1; x1 = 0; x0 = 0;
		#20
		y1 = 1; y0 = 1; x2 = 1; x1 = 0; x0 = 1;
		#20
		y1 = 1; y0 = 1; x2 = 1; x1 = 1; x0 = 0;
		#20
		y1 = 1; y0 = 1; x2 = 1; x1 = 1; x0 = 1;
		#20
		$finish;
	end
endmodule