module compliment2_8bit(in, out);

input	[7:0]	in;
output	[7:0]	out;

wire	[7:0]	not_in;

assign not_in = ~in;

adder_8bit add_1(.in1(not_in), .in2(8'd1), .S(out), .Cout());
endmodule

//////////////////////////////////////////////////////////////////////

module compliment2_9bit(in, out);

input	[8:0]	in;
output	[8:0]	out;

wire	[8:0]	not_in;

assign not_in = ~in;

adder_9bit add_1(.in1(not_in), .in2(9'd1), .S(out), .Cout());
endmodule

//////////////////////////////////////////////////////////////////////

module compliment2_10bit(in, out);

input	[9:0]	in;
output	[9:0]	out;

wire	[9:0]	not_in;

assign not_in = ~in;

adder_10bit add_1(.in1(not_in), .in2(10'd1), .S(out), .Cout());
endmodule

////////////////////////////////////////////////////////////////////////

module compliment2_24bit(in, out);

input	[23:0]	in;
output	[23:0]	out;

wire	[23:0]	not_in;

assign not_in = ~in;

adder_24bit add_1(.in1(not_in), .in2(24'd1), .S(out), .Cout());
endmodule

/////////////////////////////////////////////////////////////////////////

module compliment2_25bit(in, out);

input	[24:0]	in;
output	[24:0]	out;

wire	[24:0]	not_in;

assign not_in = ~in;

adder_25bit add_1(.in1(not_in), .in2(25'd1), .S(out), .Cout());
endmodule

/////////////////////////////////////////////////////////////////////////

module compliment2_49bit(in, out);

input	[48:0]	in;
output	[48:0]	out;

wire	[48:0]	not_in;

assign not_in = ~in;

adder_49bit add_1(.in1(not_in), .in2(49'd1), .S(out), .Cout());
endmodule