module nhan10_28bit(in,out);

input 	[27:0]	in;
output	[27:0]	out;

wire	[27:0]	temp1,temp2;

assign temp1 = {in[24:0],3'b0};
assign temp2 = {in[26:0],1'b0};

adder_28bit nhan10_1(.in1(temp1), .in2(temp2), .S(out), .Cout());

endmodule

//////////////////////////////////////////////////////////////////////////////////	

module nhan10_43bit(in,out);

input 	[42:0]	in;
output	[42:0]	out;

wire	[42:0]	temp1,temp2;

assign temp1 = {in[39:0],3'b0};
assign temp2 = {in[41:0],1'b0};

adder_43bit nhan10_1(.in1(temp1), .in2(temp2), .S(out), .Cout());

endmodule

