module mux_8bit(in1, in2, select, out);

input	[7:0]	in1,in2;
input			select;
output	[7:0]	out;

assign out = select?in2: in1;

endmodule

///////////////////////////////////////////////////

module mux_25bit(in1, in2, select, out);

input	[24:0]	in1,in2;
input			select;
output	[24:0]	out;

assign out = select?in2: in1;

endmodule

