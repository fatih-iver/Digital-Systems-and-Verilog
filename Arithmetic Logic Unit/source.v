`timescale 1ns / 1ns

module analysis(output reg [4:0] F, output reg cout, output reg overflow, output reg zero, output reg negative, input [1:0] select, input [4:0] X, input [4:0] Y);

	parameter select_00 = 2'b00, select_01 = 2'b01, select_10 = 2'b10, select_11 = 2'b11;
	
	
	reg s01_c11, s01_c12, s01_c13, s01_c21, s01_c22, s01_c23, s01_c31, s01_c32, s01_c33, s01_c41, s01_c42, s01_c43;
	reg s01_s11, s01_s12, s01_s13, s01_s21, s01_s22, s01_s23, s01_s31, s01_s32, s01_s33, s01_s41, s01_s42, s01_s43;
	
	reg s10_cout1, s10_cout2, s10_cout3, s10_cout4, s10_cout5;
	reg s10_s1, s10_s2, s10_s3, s10_s4, s10_s5;

	reg s11_cout1, s11_cout2, s11_cout3, s11_cout4, s11_cout5;
	reg s11_s1, s11_s2, s11_s3, s11_s4, s11_s5;
	
	wire t_xor1, t_xor2;
	
	always @(select, X, Y) begin
	
		case(select)
			
			select_00: begin
				
				// negative
				negative <= 0;
				
				// overflow
				overflow <= 0;
				
				// zero
				zero <= 1;
				
				// Cout
				 
				cout <= ~(((X[0] & Y[0]) | (~X[0] & ~Y[0])) & ((X[1] & Y[1]) | (~X[1] & ~Y[1])) & ((X[2] & Y[2]) | (~X[2] & ~Y[2])) & ((X[3] & Y[3]) | (~X[3] & ~Y[3])) & ((X[4] & Y[4]) | (~X[4] & ~Y[4])));
				
				F <= 0;
			
			end			
			
			select_01: begin
				
				negative <= 0;
				overflow <= 0;
				
				// X[4:2] * Y[3:1]
				{s01_c11, s01_s11} = X[2]&Y[1];
				{s01_c12, s01_s12} = X[3]&Y[1];
				{s01_c13, s01_s13} = X[4]&Y[1];
				
				{s01_c21, s01_s21} = (X[2]&Y[2]) + s01_s12 + s01_c11;
				{s01_c22, s01_s22} = (X[3]&Y[2]) + s01_s13 + s01_c12;
				{s01_c23, s01_s23} = (X[4]&Y[2]) + s01_c13;

				{s01_c31, s01_s31} = (X[2]&Y[3]) + s01_s22 + s01_c21;
				{s01_c32, s01_s32} = (X[3]&Y[3]) + s01_s23 + s01_c22;
				{s01_c33, s01_s33} = (X[4]&Y[3]) + s01_c23;
				
				{s01_c41, s01_s41} = s01_c31 + s01_s32;
				{s01_c42, s01_s42} = s01_c32 + s01_s33 + s01_c41;
				{s01_c43, s01_s43} = s01_c33 + s01_c42;
				
				zero <= ~(s01_s11 | s01_s21 | s01_s31 | s01_s41 | s01_s42);
				cout <= s01_s43;
				F[0] <= s01_s11;
				F[1] <= s01_s21;
				F[2] <= s01_s31;
				F[3] <= s01_s41;
				F[4] <= s01_s42;
				
				
				
			end
			
			select_10: begin
							
				// X + (Y[3:0] / 2)
				
				{s10_cout1, s10_s1} = X[0] + Y[1];
				{s10_cout2, s10_s2} = X[1] + Y[2] + s10_cout1;
				{s10_cout3, s10_s3} = X[2] + Y[3] + s10_cout2;
				{s10_cout4, s10_s4} = X[3] + s10_cout3;
				{s10_cout5, s10_s5} = X[4] + s10_cout4;
				
				zero <= ~(s10_s1 | s10_s2 | s10_s3 | s10_s4 | s10_s5);
				overflow <= (~s10_cout4 & s10_cout5) | (s10_cout4 & s10_cout5);
				negative <= s10_s4;
				cout <= s10_cout5;
				F[0] <= s10_s1;
				F[1] <= s10_s2;
				F[2] <= s10_s3;
				F[3] <= s10_s4;
				F[4] <= s10_s5;
				
				

			end
			
			select_11: begin
				
				// X + Y + 1
				
				{s11_cout1, s11_s1} = X[0] + Y[0] + 1;
				{s11_cout2, s11_s2} = X[1] + Y[1] + s11_cout1;
				{s11_cout3, s11_s3} = X[2] + Y[2] + s11_cout2;
				{s11_cout4, s11_s4} = X[3] + Y[3] + s11_cout3;
				{s11_cout5, s11_s5} = X[4] + Y[4] + s11_cout4;
				
				zero <= ~(s11_s1 | s11_s2 | s11_s3 | s11_s4 | s11_s5);
				overflow <= (~s11_cout4 & s11_cout5) | (s11_cout4 & s11_cout5);
				negative <= s11_s4;
				cout <= s11_cout5;
				F[0] <= s11_s1;
				F[1] <= s11_s2;
				F[2] <= s11_s3;
				F[3] <= s11_s4;
				F[4] <= s11_s5;
				
			
			end
			
		endcase
	
	end
	
endmodule