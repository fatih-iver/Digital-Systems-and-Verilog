`timescale 1ns / 1ns
module mux_8_1(
	output reg W,
	input [7:0] X,
	input [2:0] S
);

always @(*) begin
	case(S)
		3'b000: W <= X[0];
		3'b001: W <= X[1];
		3'b010: W <= X[2];
		3'b011: W <= X[3];
		3'b100: W <= X[4];
		3'b101: W <= X[5];
		3'b110: W <= X[6];
		3'b111: W <= X[7];
	endcase
end

endmodule
