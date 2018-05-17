module Barcode(B, Y, Clk, Rst);
	input Clk, Rst, B;
	output reg [1:0] Y;
	
	reg [2:0] S; 
	reg [2:0] N;
		
	always @(posedge Clk) begin
		if(Rst == 1)
			S = 3'b000;
		else
			S = N;
		Y[0] = S[0] & S[1];
		Y[1] = S[0] & S[2];
		N[0] = B | (~S[0] & ~S[1] & S[2]);
		N[1] = (S[0] & ~S[2]) | (S[0] & ~S[1] & ~B) | (S[1] & ~S[2] & B) | (~S[0] & S[1] & S[2] & ~B);
		N[2] = (S[0] & ~S[2] & B) | (~S[0] & S[1] & ~B) | (~S[1] & S[2] & ~B);
	end


endmodule

/*
`timescale 1ns / 1ns

module barcode(output reg [1:0] output_y, input input_b, input reset, input clock);

reg [2:0] state;


initial begin
	//output_y <= output_dash;
	state <= state_idle;
end


parameter output_dash = 2'b00, output_zero = 2'b01, output_one = 2'b10, output_end = 2'b11;
parameter state_idle=3'b000, state_b=3'b001, state_bw=3'b010, state_bwb=3'b011, state_bww=3'b100, state_bwww=3'b101, state_invalid=3'b110, state_exit=3'b111;

// Sync reset
always @(posedge clock) begin
	if (reset) begin
		state <= state_idle;
		output_y <= output_dash;
	end 
	
	else begin
		case (state)
			state_idle: begin
							state <= input_b ? state_b : state_idle;
							output_y <= output_dash;
						end
						
			state_b:  	begin 
							state <= input_b ? state_exit : state_bw;
							output_y <= output_dash;
						end
						
			state_bw:  	begin 
							state <= input_b ? state_bwb : state_bww;
							output_y <= output_dash;
						end
						
			state_bwb:  begin 
							state <= input_b ? state_exit : state_bw;
							output_y <= output_zero;
						end
						
			state_bww:  begin 
							state <= input_b ? state_b : state_bwww;
							output_y <= output_dash;
						end
						
			state_bwww: begin 
							state <= input_b ? state_b : state_invalid;
							output_y <= output_one;
						end
						
			state_invalid:  begin 
								state <= input_b ? state_b : state_invalid;
								output_y <= output_dash;
							end
							
			state_exit:	begin 
							state <= input_b ? state_b : state_idle;
							output_y <= output_end;
						end
		endcase		
	end
end

endmodule

*/