
/////////////////////////////////////////////////////////////////////
module shiftleft48(in, nshiftleft, out);

input	[47:0]	in;
input	[5:0]	nshiftleft;
output	[47:0]	out;

logic 	[47:0]	temp1, temp2, temp3, temp4, temp5;

shiftleft48_32 shift_1(.in(in), .ena(nshiftleft[5]), .out(temp1));
shiftleft48_16 shift_2(.in(temp1), .ena(nshiftleft[4]), .out(temp2));
shiftleft48_8  shift_3(.in(temp2), .ena(nshiftleft[3]), .out(temp3));
shiftleft48_4  shift_4(.in(temp3), .ena(nshiftleft[2]), .out(temp4));
shiftleft48_2  shift_5(.in(temp4), .ena(nshiftleft[1]), .out(temp5));
shiftleft48_1  shift_6(.in(temp5), .ena(nshiftleft[0]), .out(out));

endmodule

//////////////////////////////////////////////////////////////////////
module	shiftleft48_32(in, ena, out);

input	[47:0]	in;
input			ena;
output	[47:0]	out;

assign out = ena?{in[15:0],32'b0}:in;
endmodule

//////////////////////////////////////////////////////////////////////
module	shiftleft48_16(in, ena, out);

input	[47:0]	in;
input			ena;
output	[47:0]	out;

assign out = ena?{in[31:0],16'b0}:in;

//////////////////////////////////////////////////////////////////////
endmodule

module	shiftleft48_8(in, ena, out);

input	[47:0]	in;
input			ena;
output	[47:0]	out;

assign out = ena?{in[39:0],8'b0}:in;
endmodule

/////////////////////////////////////////////////////////////////////

module	shiftleft48_4(in, ena, out);

input	[47:0]	in;
input			ena;
output	[47:0]	out;

assign out = ena?{in[43:0],4'b0}:in;
endmodule

/////////////////////////////////////////////////////////////////////

module	shiftleft48_2(in, ena, out);

input	[47:0]	in;
input			ena;
output	[47:0]	out;

assign out = ena?{in[45:0],2'b0}:in;
endmodule

/////////////////////////////////////////////////////////////////////

module	shiftleft48_1(in, ena, out);

input	[47:0]	in;
input			ena;
output	[47:0]	out;

assign out = ena?{in[46:0],1'b0}:in;
endmodule