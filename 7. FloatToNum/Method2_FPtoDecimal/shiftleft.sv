module shiftleft(in, nshiftleft, out);

input	[24:0]	in;
input	[4:0]	nshiftleft;
output	[24:0]	out;

logic 	[24:0]	temp1, temp2, temp3, temp4;

shiftleft16 shift_1(.in(in), .ena(nshiftleft[4]), .out(temp1));
shiftleft8  shift_2(.in(temp1), .ena(nshiftleft[3]), .out(temp2));
shiftleft4  shift_3(.in(temp2), .ena(nshiftleft[2]), .out(temp3));
shiftleft2  shift_4(.in(temp3), .ena(nshiftleft[1]), .out(temp4));
shiftleft1  shift_5(.in(temp4), .ena(nshiftleft[0]), .out(out));

endmodule

/////////////////////////////////////////////////////////////////////

module	shiftleft16(in, ena, out);

input	[24:0]	in;
input			ena;
output	[24:0]	out;

assign out = ena?{in[8:0],16'b0}:in;
endmodule

/////////////////////////////////////////////////////////////

module	shiftleft8(in, ena, out);

input	[24:0]	in;
input			ena;
output	[24:0]	out;

assign out = ena?{in[16:0],8'b0}:in;
endmodule

/////////////////////////////////////////////////////////////////////

module	shiftleft4(in, ena, out);

input	[24:0]	in;
input			ena;
output	[24:0]	out;

assign out = ena?{in[20:0],4'b0}:in;
endmodule

/////////////////////////////////////////////////////////////////////

module	shiftleft2(in, ena, out);

input	[24:0]	in;
input			ena;
output	[24:0]	out;

assign out = ena?{in[22:0],2'b0}:in;
endmodule

/////////////////////////////////////////////////////////////////////

module	shiftleft1(in, ena, out);

input	[24:0]	in;
input			ena;
output	[24:0]	out;

assign out = ena?{in[23:0],1'b0}:in;
endmodule