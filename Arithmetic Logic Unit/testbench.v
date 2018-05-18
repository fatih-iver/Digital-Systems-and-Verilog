`timescale 1 ns/1 ns

module Testbench();

reg [4:0] X; 
reg [4:0] Y;
reg [1:0] S;
 
wire [4:0] F;
wire cout, overflow, zero, negative;

analysis a(F, cout, overflow, zero, negative, S, X, Y);

initial begin
    $dumpfile("TimingDiagram.vcd");
	$dumpvars(0, F, cout, overflow, zero, negative, S, X, Y);
	
	S = 2'b00;
	
	repeat (4) begin
	
		X = 5'b00000;
	
		repeat (32) begin
		
			Y = 5'b00000;
					
			repeat (32) begin

				Y = Y + 5'b00001;		
                #10;
			end
			
			X = X + 5'b00001;
			#10;
			
		end
		
		#10;	
		S = S + 2'b01;
		
	end
	
    $finish;
end

endmodule