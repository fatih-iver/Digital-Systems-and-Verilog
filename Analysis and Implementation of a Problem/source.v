`timescale 1ns / 1ns
module my_module(b, i0, i1, i2);
input i0, i1, i2;
output b;
wire not_i0, not_i1, not_i1_and_i2;

not(not_i0, i0);
not(not_i1, i1);
and(not_i1_and_i2, not_i1, i2);
or(b, not_i0, not_i1_and_i2);

endmodule