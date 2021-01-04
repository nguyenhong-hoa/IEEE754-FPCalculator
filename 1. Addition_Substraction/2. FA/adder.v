module adder_26bit(in1, in2, S, Cout);

input	[25:0]	in1,in2;
output	[25:0]	S;
output			Cout;

wire	[25:1]	temp_c;

FA FA_0(.a(in1[0]), .b(in2[0]), .cin(1'b0), .S(S[0]), .cout(temp_c[1]));
FA FA_1(.a(in1[1]), .b(in2[1]), .cin(temp_c[1]), .S(S[1]), .cout(temp_c[2]));
FA FA_2(.a(in1[2]), .b(in2[2]), .cin(temp_c[2]), .S(S[2]), .cout(temp_c[3]));
FA FA_3(.a(in1[3]), .b(in2[3]), .cin(temp_c[3]), .S(S[3]), .cout(temp_c[4]));
FA FA_4(.a(in1[4]), .b(in2[4]), .cin(temp_c[4]), .S(S[4]), .cout(temp_c[5]));
FA FA_5(.a(in1[5]), .b(in2[5]), .cin(temp_c[5]), .S(S[5]), .cout(temp_c[6]));
FA FA_6(.a(in1[6]), .b(in2[6]), .cin(temp_c[6]), .S(S[6]), .cout(temp_c[7]));
FA FA_7(.a(in1[7]), .b(in2[7]), .cin(temp_c[7]), .S(S[7]), .cout(temp_c[8]));
FA FA_8(.a(in1[8]), .b(in2[8]), .cin(temp_c[8]), .S(S[8]), .cout(temp_c[9]));
FA FA_9(.a(in1[9]), .b(in2[9]), .cin(temp_c[9]), .S(S[9]), .cout(temp_c[10]));
FA FA_10(.a(in1[10]), .b(in2[10]), .cin(temp_c[10]), .S(S[10]), .cout(temp_c[11]));
FA FA_11(.a(in1[11]), .b(in2[11]), .cin(temp_c[11]), .S(S[11]), .cout(temp_c[12]));
FA FA_12(.a(in1[12]), .b(in2[12]), .cin(temp_c[12]), .S(S[12]), .cout(temp_c[13]));
FA FA_13(.a(in1[13]), .b(in2[13]), .cin(temp_c[13]), .S(S[13]), .cout(temp_c[14]));
FA FA_14(.a(in1[14]), .b(in2[14]), .cin(temp_c[14]), .S(S[14]), .cout(temp_c[15]));
FA FA_15(.a(in1[15]), .b(in2[15]), .cin(temp_c[15]), .S(S[15]), .cout(temp_c[16]));
FA FA_16(.a(in1[16]), .b(in2[16]), .cin(temp_c[16]), .S(S[16]), .cout(temp_c[17]));
FA FA_17(.a(in1[17]), .b(in2[17]), .cin(temp_c[17]), .S(S[17]), .cout(temp_c[18]));
FA FA_18(.a(in1[18]), .b(in2[18]), .cin(temp_c[18]), .S(S[18]), .cout(temp_c[19]));
FA FA_19(.a(in1[19]), .b(in2[19]), .cin(temp_c[19]), .S(S[19]), .cout(temp_c[20]));
FA FA_20(.a(in1[20]), .b(in2[20]), .cin(temp_c[20]), .S(S[20]), .cout(temp_c[21]));
FA FA_21(.a(in1[21]), .b(in2[21]), .cin(temp_c[21]), .S(S[21]), .cout(temp_c[22]));
FA FA_22(.a(in1[22]), .b(in2[22]), .cin(temp_c[22]), .S(S[22]), .cout(temp_c[23]));
FA FA_23(.a(in1[23]), .b(in2[23]), .cin(temp_c[23]), .S(S[23]), .cout(temp_c[24]));
FA FA_24(.a(in1[24]), .b(in2[24]), .cin(temp_c[24]), .S(S[24]), .cout(temp_c[25]));
FA FA_25(.a(in1[25]), .b(in2[25]), .cin(temp_c[25]), .S(S[25]), .cout(Cout));

endmodule

/////////////////////////////////////////////////////////////////////////////////////

module adder_25bit(in1, in2, S, Cout);

input	[24:0]	in1,in2;
output	[24:0]	S;
output			Cout;

wire	[24:1]	temp_c;

FA FA_0(.a(in1[0]), .b(in2[0]), .cin(1'b0), .S(S[0]), .cout(temp_c[1]));
FA FA_1(.a(in1[1]), .b(in2[1]), .cin(temp_c[1]), .S(S[1]), .cout(temp_c[2]));
FA FA_2(.a(in1[2]), .b(in2[2]), .cin(temp_c[2]), .S(S[2]), .cout(temp_c[3]));
FA FA_3(.a(in1[3]), .b(in2[3]), .cin(temp_c[3]), .S(S[3]), .cout(temp_c[4]));
FA FA_4(.a(in1[4]), .b(in2[4]), .cin(temp_c[4]), .S(S[4]), .cout(temp_c[5]));
FA FA_5(.a(in1[5]), .b(in2[5]), .cin(temp_c[5]), .S(S[5]), .cout(temp_c[6]));
FA FA_6(.a(in1[6]), .b(in2[6]), .cin(temp_c[6]), .S(S[6]), .cout(temp_c[7]));
FA FA_7(.a(in1[7]), .b(in2[7]), .cin(temp_c[7]), .S(S[7]), .cout(temp_c[8]));
FA FA_8(.a(in1[8]), .b(in2[8]), .cin(temp_c[8]), .S(S[8]), .cout(temp_c[9]));
FA FA_9(.a(in1[9]), .b(in2[9]), .cin(temp_c[9]), .S(S[9]), .cout(temp_c[10]));
FA FA_10(.a(in1[10]), .b(in2[10]), .cin(temp_c[10]), .S(S[10]), .cout(temp_c[11]));
FA FA_11(.a(in1[11]), .b(in2[11]), .cin(temp_c[11]), .S(S[11]), .cout(temp_c[12]));
FA FA_12(.a(in1[12]), .b(in2[12]), .cin(temp_c[12]), .S(S[12]), .cout(temp_c[13]));
FA FA_13(.a(in1[13]), .b(in2[13]), .cin(temp_c[13]), .S(S[13]), .cout(temp_c[14]));
FA FA_14(.a(in1[14]), .b(in2[14]), .cin(temp_c[14]), .S(S[14]), .cout(temp_c[15]));
FA FA_15(.a(in1[15]), .b(in2[15]), .cin(temp_c[15]), .S(S[15]), .cout(temp_c[16]));
FA FA_16(.a(in1[16]), .b(in2[16]), .cin(temp_c[16]), .S(S[16]), .cout(temp_c[17]));
FA FA_17(.a(in1[17]), .b(in2[17]), .cin(temp_c[17]), .S(S[17]), .cout(temp_c[18]));
FA FA_18(.a(in1[18]), .b(in2[18]), .cin(temp_c[18]), .S(S[18]), .cout(temp_c[19]));
FA FA_19(.a(in1[19]), .b(in2[19]), .cin(temp_c[19]), .S(S[19]), .cout(temp_c[20]));
FA FA_20(.a(in1[20]), .b(in2[20]), .cin(temp_c[20]), .S(S[20]), .cout(temp_c[21]));
FA FA_21(.a(in1[21]), .b(in2[21]), .cin(temp_c[21]), .S(S[21]), .cout(temp_c[22]));
FA FA_22(.a(in1[22]), .b(in2[22]), .cin(temp_c[22]), .S(S[22]), .cout(temp_c[23]));
FA FA_23(.a(in1[23]), .b(in2[23]), .cin(temp_c[23]), .S(S[23]), .cout(temp_c[24]));
FA FA_24(.a(in1[24]), .b(in2[24]), .cin(temp_c[24]), .S(S[24]), .cout(Cout));

endmodule

////////////////////////////////////////////////////////////////////////////////////////

module adder_9bit(in1, in2, S, Cout);

input	[8:0]	in1,in2;
output	[8:0]	S;
output			Cout;

wire	[8:1]	temp_c;

FA FA_0(.a(in1[0]), .b(in2[0]), .cin(1'b0), .S(S[0]), .cout(temp_c[1]));
FA FA_1(.a(in1[1]), .b(in2[1]), .cin(temp_c[1]), .S(S[1]), .cout(temp_c[2]));
FA FA_2(.a(in1[2]), .b(in2[2]), .cin(temp_c[2]), .S(S[2]), .cout(temp_c[3]));
FA FA_3(.a(in1[3]), .b(in2[3]), .cin(temp_c[3]), .S(S[3]), .cout(temp_c[4]));
FA FA_4(.a(in1[4]), .b(in2[4]), .cin(temp_c[4]), .S(S[4]), .cout(temp_c[5]));
FA FA_5(.a(in1[5]), .b(in2[5]), .cin(temp_c[5]), .S(S[5]), .cout(temp_c[6]));
FA FA_6(.a(in1[6]), .b(in2[6]), .cin(temp_c[6]), .S(S[6]), .cout(temp_c[7]));
FA FA_7(.a(in1[7]), .b(in2[7]), .cin(temp_c[7]), .S(S[7]), .cout(temp_c[8]));
FA FA_8(.a(in1[8]), .b(in2[8]), .cin(temp_c[8]), .S(S[8]), .cout(Cout));

endmodule

///////////////////////////////////////////////////////////////////////////////////

module adder_8bit(in1, in2, S, Cout);

input	[7:0]	in1,in2;
output	[7:0]	S;
output			Cout;

wire	[7:1]	temp_c;

FA FA_0(.a(in1[0]), .b(in2[0]), .cin(1'b0), .S(S[0]), .cout(temp_c[1]));
FA FA_1(.a(in1[1]), .b(in2[1]), .cin(temp_c[1]), .S(S[1]), .cout(temp_c[2]));
FA FA_2(.a(in1[2]), .b(in2[2]), .cin(temp_c[2]), .S(S[2]), .cout(temp_c[3]));
FA FA_3(.a(in1[3]), .b(in2[3]), .cin(temp_c[3]), .S(S[3]), .cout(temp_c[4]));
FA FA_4(.a(in1[4]), .b(in2[4]), .cin(temp_c[4]), .S(S[4]), .cout(temp_c[5]));
FA FA_5(.a(in1[5]), .b(in2[5]), .cin(temp_c[5]), .S(S[5]), .cout(temp_c[6]));
FA FA_6(.a(in1[6]), .b(in2[6]), .cin(temp_c[6]), .S(S[6]), .cout(temp_c[7]));
FA FA_7(.a(in1[7]), .b(in2[7]), .cin(temp_c[7]), .S(S[7]), .cout(Cout));

endmodule

////////////////////////////////////////////////////////////////////////////////////

module adder_10bit(in1, in2, S, Cout);

input	[9:0]	in1,in2;
output	[9:0]	S;
output			Cout;

wire	[9:1]	temp_c;

FA FA_0(.a(in1[0]), .b(in2[0]), .cin(1'b0), .S(S[0]), .cout(temp_c[1]));
FA FA_1(.a(in1[1]), .b(in2[1]), .cin(temp_c[1]), .S(S[1]), .cout(temp_c[2]));
FA FA_2(.a(in1[2]), .b(in2[2]), .cin(temp_c[2]), .S(S[2]), .cout(temp_c[3]));
FA FA_3(.a(in1[3]), .b(in2[3]), .cin(temp_c[3]), .S(S[3]), .cout(temp_c[4]));
FA FA_4(.a(in1[4]), .b(in2[4]), .cin(temp_c[4]), .S(S[4]), .cout(temp_c[5]));
FA FA_5(.a(in1[5]), .b(in2[5]), .cin(temp_c[5]), .S(S[5]), .cout(temp_c[6]));
FA FA_6(.a(in1[6]), .b(in2[6]), .cin(temp_c[6]), .S(S[6]), .cout(temp_c[7]));
FA FA_7(.a(in1[7]), .b(in2[7]), .cin(temp_c[7]), .S(S[7]), .cout(temp_c[8]));
FA FA_8(.a(in1[8]), .b(in2[8]), .cin(temp_c[8]), .S(S[8]), .cout(temp_c[9]));
FA FA_9(.a(in1[9]), .b(in2[9]), .cin(temp_c[9]), .S(S[9]), .cout(Cout));

endmodule

/////////////////////////////////////////////////////////////////////////////////////

module FA(a,b,S,cin,cout);

input	a,b,cin;
output	S,cout;

assign S = a^b^cin;
assign cout =  ((a&b) | (cin&(a^b)));

endmodule