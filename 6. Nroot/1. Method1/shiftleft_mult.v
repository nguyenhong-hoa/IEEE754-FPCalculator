module shiftleft_mult(in, nshiftleft, out);

input	[23:0]	in;
input	[4:0]	nshiftleft;
output	[23:0]	out;

wire	[23:0]	temp1, temp2, temp3, temp4;

shiftleft16_mult shift_1(.in(in), .ena(nshiftleft[4]), .out(temp1));
shiftleft8_mult  shift_2(.in(temp1), .ena(nshiftleft[3]), .out(temp2));
shiftleft4_mult  shift_3(.in(temp2), .ena(nshiftleft[2]), .out(temp3));
shiftleft2_mult  shift_4(.in(temp3), .ena(nshiftleft[1]), .out(temp4));
shiftleft1_mult  shift_5(.in(temp4), .ena(nshiftleft[0]), .out(out));

endmodule

//////////////////////////////////////////////////////////////////////////

module	shiftleft16_mult(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{in[8:0],16'b0}:in;
endmodule

//////////////////////////////////////////////////////////////////////////

module	shiftleft8_mult(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{in[16:0],8'b0}:in;
endmodule

//////////////////////////////////////////////////////////////////////////

module	shiftleft4_mult(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{in[20:0],4'b0}:in;
endmodule

//////////////////////////////////////////////////////////////////////////

module	shiftleft2_mult(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{in[22:0],2'b0}:in;
endmodule

//////////////////////////////////////////////////////////////////////////

module	shiftleft1_mult(in, ena, out);

input	[23:0]	in;
input			ena;
output	[23:0]	out;

assign out = ena?{in[23:0],1'b0}:in;
endmodule