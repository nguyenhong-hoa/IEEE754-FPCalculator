module compliment2_10bit(in, out);

input	[9:0]	in;
output	[9:0]	out;

wire	[9:0]	not_in;

assign not_in = ~in;

adder_10bit add_1(.in1(not_in), .in2(10'd1), .S(out), .Cout());
endmodule

module compliment2_24bit(in, out);

input	[23:0]	in;
output	[23:0]	out;

wire	[23:0]	not_in;

assign not_in = ~in;

adder_24bit add_1(.in1(not_in), .in2(24'd1), .S(out), .Cout());
endmodule