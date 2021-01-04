//Shift Significand S (bit dấu) + bit 1 mặc định + 23 bit Fracction
//
module shift_right(in, nshift, out);

input	[24:0]	in;
input	[4:0]	nshift;
output	[24:0]	out;

logic 	[23:0]	temp1,temp2,temp3,temp4;

shift16 shift_1(.in(in[23:0]), .ena(nshift[4]), .out(temp1));
shift8  shift_2(.in(temp1), .ena(nshift[3]), .out(temp2));
shift4  shift_3(.in(temp2), .ena(nshift[2]), .out(temp3));
shift2  shift_4(.in(temp3), .ena(nshift[1]), .out(temp4));
shift1  shift_5(.in(temp4), .ena(nshift[0]), .out(out[23:0]));
//Giu nguyen bit dau S
assign out[24] = in[24];
endmodule
/////////////////////////////////////////////////////////////////////

module shift16(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{16'b0,in[23:16]}:in;
endmodule

/////////////////////////////////////////////////////////////////////

module shift8(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{8'b0,in[23:8]}:in;
endmodule

/////////////////////////////////////////////////////////////////////

module shift4(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{4'b0,in[23:4]}:in;
endmodule

/////////////////////////////////////////////////////////////////////

module shift2(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{2'b0,in[23:2]}:in;
endmodule
//Shift số 24 bit

module shift1(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{1'b0,in[23:1]}:in;
endmodule