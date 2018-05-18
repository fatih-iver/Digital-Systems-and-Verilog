`timescale 1ns / 1ns

module analysis(output reg [1:0] output_y, input input_a, input input_b, input clock, input reset);

	reg [1:0] state, nextState;
	
	parameter output_00 = 2'b00, output_01 = 2'b01, output_10 = 2'b10, output_11 = 2'b11;
	parameter state_00 = 2'b00, state_01 = 2'b01, state_10 = 2'b10, state_11 = 2'b11;

	// Update State Registers
	always @(posedge clock) begin
		if (reset == 1)
			state <= state_00;
		else
			state <= nextState;
	end
	
	// Drive Combinational Logic
	always @(state, input_a, input_b) begin
	
		case(state)
			
			state_00: begin
			
				if (input_a == 0 && input_b == 0 ) begin
				
					nextState <= state_00;
					output_y <= output_00;
				
				end
				
				else if (input_a == 0 && input_b == 1 ) begin
					
					nextState <= state_01;
					output_y <= output_01;
				
				end
				
				else if (input_a == 1 && input_b == 0 ) begin
					
					nextState <= state_10;
					output_y <= output_10;
				
				end
				
				else begin
				
					nextState <= state_11;
					output_y <= output_10;
				
				end
				
			end			
			
			state_01: begin
			
				if (input_a == 0 && input_b == 0 ) begin
				
					nextState <= state_00;
					output_y <= output_00;
				
				end
				
				else if (input_a == 0 && input_b == 1 ) begin
				
					nextState <= state_00;
					output_y <= output_01;
				
				end
				
				else if (input_a == 1 && input_b == 0 ) begin
				
					nextState <= state_10;
					output_y <= output_10;
				
				end
				
				else begin
				
					nextState <= state_10;
					output_y <= output_10;
				
				end
				
			end
			
			state_10: begin
				
				if (input_a == 0 && input_b == 0 ) begin
					
					nextState <= state_00;
					output_y <= output_00;
					
				end
				
				else if (input_a == 0 && input_b == 1 ) begin
				
					nextState <= state_01;
					output_y <= output_01;
				
				end
				
				else if (input_a == 1 && input_b == 0 ) begin
				
					nextState <= state_10;
					output_y <= output_10;
				
				end
				
				else begin
				
					nextState <= state_01;
					output_y <= output_01;
				
				end
			end
			
			state_11: begin
			
				if (input_a == 0 && input_b == 0 ) begin
				
					nextState <= state_01;
					output_y <= output_01;
				
				end
				
				else if (input_a == 0 && input_b == 1 ) begin
				
					nextState <= state_01;
					output_y <= output_01;
				
				end
				
				else if (input_a == 1 && input_b == 0 ) begin
				
					nextState <= state_01;
					output_y <= output_01;
				
				end
				
				else begin
				
					nextState <= state_01;
					output_y <= output_01;
				
				end
			
			end
			
		endcase
	
	end
	

endmodule