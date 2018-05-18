`timescale 1ns / 1ns
module my_model(z, y1, y0, x2, x1, x0);
input y1, y0, x2, x1, x0;
output z;

wire y1_or_y0, not_y0, y1_nand_y0, not_y1_nand_y0, not_y1;

or(y1_or_y0, y1, y0);
not(not_y0, y0);
nand(y1_nand_y0, y1, y0);
not(not_y1_nand_y0, y1_nand_y0);
not(not_y1, y1);

wire [2:0] S;
wire [7:0] X;

assign S[0] = x0;
assign S[1] = x1;
assign S[2] = x2;

assign X[0] = y1;
assign X[1] = y1_or_y0;
assign X[2] = not_y0;
assign X[3] = y1_nand_y0;
assign X[4] = not_y1_nand_y0;
assign X[5] = y1_nand_y0; 
assign X[6] = 0;
assign X[7] = not_y1;

mux_8_1 mux(z, X, S);


endmodule