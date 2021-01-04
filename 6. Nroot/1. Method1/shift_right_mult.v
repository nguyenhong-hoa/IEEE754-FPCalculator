module shift_right_mult(in, nshift, out);

input	[23:0]	in;
input	[4:0]	nshift;
output	[23:0]	out;

wire	[23:0]	temp1,temp2,temp3,temp4;

shift16_mult shift_1(.in(in[23:0]), .ena(nshift[4]), .out(temp1));
shift8_mult  shift_2(.in(temp1), .ena(nshift[3]), .out(temp2));
shift4_mult  shift_3(.in(temp2), .ena(nshift[2]), .out(temp3));
shift2_mult  shift_4(.in(temp3), .ena(nshift[1]), .out(temp4));
shift1_mult  shift_5(.in(temp4), .ena(nshift[0]), .out(out[23:0]));

assign out[23] = in[23];
endmodule

///////////////////////////////////////////////////////////////////////

module shift16_mult(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{16'b0,in[23:16]}:in;
endmodule

///////////////////////////////////////////////////////////////////////

module shift8_mult(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{8'b0,in[23:8]}:in;
endmodule

///////////////////////////////////////////////////////////////////////

module shift4_mult(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{4'b0,in[23:4]}:in;
endmodule

///////////////////////////////////////////////////////////////////////

module shift2_mult(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{2'b0,in[23:2]}:in;
endmodule

///////////////////////////////////////////////////////////////////////

module shift1_mult(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{1'b0,in[23:1]}:in;
endmodule