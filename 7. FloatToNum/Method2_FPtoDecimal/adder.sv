module adder_48bit(in1, in2, S, Cout);

input	[47:0]	in1,in2;
output	[47:0]	S;
output			Cout;

logic	[47:1]	temp_c;

FA FA_0(.x(in1[0]), .y(in2[0]), .cin(1'b0), .s(S[0]), .cout(temp_c[1]));
FA FA_1(.x(in1[1]), .y(in2[1]), .cin(temp_c[1]), .s(S[1]), .cout(temp_c[2]));
FA FA_2(.x(in1[2]), .y(in2[2]), .cin(temp_c[2]), .s(S[2]), .cout(temp_c[3]));
FA FA_3(.x(in1[3]), .y(in2[3]), .cin(temp_c[3]), .s(S[3]), .cout(temp_c[4]));
FA FA_4(.x(in1[4]), .y(in2[4]), .cin(temp_c[4]), .s(S[4]), .cout(temp_c[5]));
FA FA_5(.x(in1[5]), .y(in2[5]), .cin(temp_c[5]), .s(S[5]), .cout(temp_c[6]));
FA FA_6(.x(in1[6]), .y(in2[6]), .cin(temp_c[6]), .s(S[6]), .cout(temp_c[7]));
FA FA_7(.x(in1[7]), .y(in2[7]), .cin(temp_c[7]), .s(S[7]), .cout(temp_c[8]));
FA FA_8(.x(in1[8]), .y(in2[8]), .cin(temp_c[8]), .s(S[8]), .cout(temp_c[9]));
FA FA_9(.x(in1[9]), .y(in2[9]), .cin(temp_c[9]), .s(S[9]), .cout(temp_c[10]));
FA FA_10(.x(in1[10]), .y(in2[10]), .cin(temp_c[10]), .s(S[10]), .cout(temp_c[11]));
FA FA_11(.x(in1[11]), .y(in2[11]), .cin(temp_c[11]), .s(S[11]), .cout(temp_c[12]));
FA FA_12(.x(in1[12]), .y(in2[12]), .cin(temp_c[12]), .s(S[12]), .cout(temp_c[13]));
FA FA_13(.x(in1[13]), .y(in2[13]), .cin(temp_c[13]), .s(S[13]), .cout(temp_c[14]));
FA FA_14(.x(in1[14]), .y(in2[14]), .cin(temp_c[14]), .s(S[14]), .cout(temp_c[15]));
FA FA_15(.x(in1[15]), .y(in2[15]), .cin(temp_c[15]), .s(S[15]), .cout(temp_c[16]));
FA FA_16(.x(in1[16]), .y(in2[16]), .cin(temp_c[16]), .s(S[16]), .cout(temp_c[17]));
FA FA_17(.x(in1[17]), .y(in2[17]), .cin(temp_c[17]), .s(S[17]), .cout(temp_c[18]));
FA FA_18(.x(in1[18]), .y(in2[18]), .cin(temp_c[18]), .s(S[18]), .cout(temp_c[19]));
FA FA_19(.x(in1[19]), .y(in2[19]), .cin(temp_c[19]), .s(S[19]), .cout(temp_c[20]));
FA FA_20(.x(in1[20]), .y(in2[20]), .cin(temp_c[20]), .s(S[20]), .cout(temp_c[21]));
FA FA_21(.x(in1[21]), .y(in2[21]), .cin(temp_c[21]), .s(S[21]), .cout(temp_c[22]));
FA FA_22(.x(in1[22]), .y(in2[22]), .cin(temp_c[22]), .s(S[22]), .cout(temp_c[23]));
FA FA_23(.x(in1[23]), .y(in2[23]), .cin(temp_c[23]), .s(S[23]), .cout(temp_c[24]));
FA FA_24(.x(in1[24]), .y(in2[24]), .cin(temp_c[24]), .s(S[24]), .cout(temp_c[25]));
FA FA_25(.x(in1[25]), .y(in2[25]), .cin(temp_c[25]), .s(S[25]), .cout(temp_c[26]));
FA FA_26(.x(in1[26]), .y(in2[26]), .cin(temp_c[26]), .s(S[26]), .cout(temp_c[27]));
FA FA_27(.x(in1[27]), .y(in2[27]), .cin(temp_c[27]), .s(S[27]), .cout(temp_c[28]));
FA FA_28(.x(in1[28]), .y(in2[28]), .cin(temp_c[28]), .s(S[28]), .cout(temp_c[29]));
FA FA_29(.x(in1[29]), .y(in2[29]), .cin(temp_c[29]), .s(S[29]), .cout(temp_c[30]));
FA FA_30(.x(in1[30]), .y(in2[30]), .cin(temp_c[30]), .s(S[30]), .cout(temp_c[31]));
FA FA_31(.x(in1[31]), .y(in2[31]), .cin(temp_c[31]), .s(S[31]), .cout(temp_c[32]));
FA FA_32(.x(in1[32]), .y(in2[32]), .cin(temp_c[32]), .s(S[32]), .cout(temp_c[33]));
FA FA_33(.x(in1[33]), .y(in2[33]), .cin(temp_c[33]), .s(S[33]), .cout(temp_c[34]));
FA FA_34(.x(in1[34]), .y(in2[34]), .cin(temp_c[34]), .s(S[34]), .cout(temp_c[35]));
FA FA_35(.x(in1[35]), .y(in2[35]), .cin(temp_c[35]), .s(S[35]), .cout(temp_c[36]));
FA FA_36(.x(in1[36]), .y(in2[36]), .cin(temp_c[36]), .s(S[36]), .cout(temp_c[37]));
FA FA_37(.x(in1[37]), .y(in2[37]), .cin(temp_c[37]), .s(S[37]), .cout(temp_c[38]));
FA FA_38(.x(in1[38]), .y(in2[38]), .cin(temp_c[38]), .s(S[38]), .cout(temp_c[39]));
FA FA_39(.x(in1[39]), .y(in2[39]), .cin(temp_c[39]), .s(S[39]), .cout(temp_c[40]));
FA FA_40(.x(in1[40]), .y(in2[40]), .cin(temp_c[40]), .s(S[40]), .cout(temp_c[41]));
FA FA_41(.x(in1[41]), .y(in2[41]), .cin(temp_c[41]), .s(S[41]), .cout(temp_c[42]));
FA FA_42(.x(in1[42]), .y(in2[42]), .cin(temp_c[42]), .s(S[42]), .cout(temp_c[43]));
FA FA_43(.x(in1[43]), .y(in2[43]), .cin(temp_c[43]), .s(S[43]), .cout(temp_c[44]));
FA FA_44(.x(in1[44]), .y(in2[44]), .cin(temp_c[44]), .s(S[44]), .cout(temp_c[45]));
FA FA_45(.x(in1[45]), .y(in2[45]), .cin(temp_c[45]), .s(S[45]), .cout(temp_c[46]));
FA FA_46(.x(in1[46]), .y(in2[46]), .cin(temp_c[46]), .s(S[46]), .cout(temp_c[47]));
FA FA_47(.x(in1[47]), .y(in2[47]), .cin(temp_c[47]), .s(S[47]), .cout(Cout));

endmodule

//////////////////////////////////////////////////////////////////////////////


//adder 26 bit
module adder_26bit(in1, in2, S, Cout);

input	[25:0]	in1,in2;
output	[25:0]	S;
output			Cout;

wire	[25:1]	temp_c;

FA FA_0(.x(in1[0]), .y(in2[0]), .cin(1'b0), .s(S[0]), .cout(temp_c[1]));
FA FA_1(.x(in1[1]), .y(in2[1]), .cin(temp_c[1]), .s(S[1]), .cout(temp_c[2]));
FA FA_2(.x(in1[2]), .y(in2[2]), .cin(temp_c[2]), .s(S[2]), .cout(temp_c[3]));
FA FA_3(.x(in1[3]), .y(in2[3]), .cin(temp_c[3]), .s(S[3]), .cout(temp_c[4]));
FA FA_4(.x(in1[4]), .y(in2[4]), .cin(temp_c[4]), .s(S[4]), .cout(temp_c[5]));
FA FA_5(.x(in1[5]), .y(in2[5]), .cin(temp_c[5]), .s(S[5]), .cout(temp_c[6]));
FA FA_6(.x(in1[6]), .y(in2[6]), .cin(temp_c[6]), .s(S[6]), .cout(temp_c[7]));
FA FA_7(.x(in1[7]), .y(in2[7]), .cin(temp_c[7]), .s(S[7]), .cout(temp_c[8]));
FA FA_8(.x(in1[8]), .y(in2[8]), .cin(temp_c[8]), .s(S[8]), .cout(temp_c[9]));
FA FA_9(.x(in1[9]), .y(in2[9]), .cin(temp_c[9]), .s(S[9]), .cout(temp_c[10]));
FA FA_10(.x(in1[10]), .y(in2[10]), .cin(temp_c[10]), .s(S[10]), .cout(temp_c[11]));
FA FA_11(.x(in1[11]), .y(in2[11]), .cin(temp_c[11]), .s(S[11]), .cout(temp_c[12]));
FA FA_12(.x(in1[12]), .y(in2[12]), .cin(temp_c[12]), .s(S[12]), .cout(temp_c[13]));
FA FA_13(.x(in1[13]), .y(in2[13]), .cin(temp_c[13]), .s(S[13]), .cout(temp_c[14]));
FA FA_14(.x(in1[14]), .y(in2[14]), .cin(temp_c[14]), .s(S[14]), .cout(temp_c[15]));
FA FA_15(.x(in1[15]), .y(in2[15]), .cin(temp_c[15]), .s(S[15]), .cout(temp_c[16]));
FA FA_16(.x(in1[16]), .y(in2[16]), .cin(temp_c[16]), .s(S[16]), .cout(temp_c[17]));
FA FA_17(.x(in1[17]), .y(in2[17]), .cin(temp_c[17]), .s(S[17]), .cout(temp_c[18]));
FA FA_18(.x(in1[18]), .y(in2[18]), .cin(temp_c[18]), .s(S[18]), .cout(temp_c[19]));
FA FA_19(.x(in1[19]), .y(in2[19]), .cin(temp_c[19]), .s(S[19]), .cout(temp_c[20]));
FA FA_20(.x(in1[20]), .y(in2[20]), .cin(temp_c[20]), .s(S[20]), .cout(temp_c[21]));
FA FA_21(.x(in1[21]), .y(in2[21]), .cin(temp_c[21]), .s(S[21]), .cout(temp_c[22]));
FA FA_22(.x(in1[22]), .y(in2[22]), .cin(temp_c[22]), .s(S[22]), .cout(temp_c[23]));
FA FA_23(.x(in1[23]), .y(in2[23]), .cin(temp_c[23]), .s(S[23]), .cout(temp_c[24]));
FA FA_24(.x(in1[24]), .y(in2[24]), .cin(temp_c[24]), .s(S[24]), .cout(temp_c[25]));
FA FA_25(.x(in1[25]), .y(in2[25]), .cin(temp_c[25]), .s(S[25]), .cout(Cout));

endmodule

//adder 25 bit

module adder_25bit(in1, in2, S, Cout);

input	[24:0]	in1,in2;
output	[24:0]	S;
output			Cout;

wire	[24:1]	temp_c;

FA FA_0(.x(in1[0]), .y(in2[0]), .cin(1'b0), .s(S[0]), .cout(temp_c[1]));
FA FA_1(.x(in1[1]), .y(in2[1]), .cin(temp_c[1]), .s(S[1]), .cout(temp_c[2]));
FA FA_2(.x(in1[2]), .y(in2[2]), .cin(temp_c[2]), .s(S[2]), .cout(temp_c[3]));
FA FA_3(.x(in1[3]), .y(in2[3]), .cin(temp_c[3]), .s(S[3]), .cout(temp_c[4]));
FA FA_4(.x(in1[4]), .y(in2[4]), .cin(temp_c[4]), .s(S[4]), .cout(temp_c[5]));
FA FA_5(.x(in1[5]), .y(in2[5]), .cin(temp_c[5]), .s(S[5]), .cout(temp_c[6]));
FA FA_6(.x(in1[6]), .y(in2[6]), .cin(temp_c[6]), .s(S[6]), .cout(temp_c[7]));
FA FA_7(.x(in1[7]), .y(in2[7]), .cin(temp_c[7]), .s(S[7]), .cout(temp_c[8]));
FA FA_8(.x(in1[8]), .y(in2[8]), .cin(temp_c[8]), .s(S[8]), .cout(temp_c[9]));
FA FA_9(.x(in1[9]), .y(in2[9]), .cin(temp_c[9]), .s(S[9]), .cout(temp_c[10]));
FA FA_10(.x(in1[10]), .y(in2[10]), .cin(temp_c[10]), .s(S[10]), .cout(temp_c[11]));
FA FA_11(.x(in1[11]), .y(in2[11]), .cin(temp_c[11]), .s(S[11]), .cout(temp_c[12]));
FA FA_12(.x(in1[12]), .y(in2[12]), .cin(temp_c[12]), .s(S[12]), .cout(temp_c[13]));
FA FA_13(.x(in1[13]), .y(in2[13]), .cin(temp_c[13]), .s(S[13]), .cout(temp_c[14]));
FA FA_14(.x(in1[14]), .y(in2[14]), .cin(temp_c[14]), .s(S[14]), .cout(temp_c[15]));
FA FA_15(.x(in1[15]), .y(in2[15]), .cin(temp_c[15]), .s(S[15]), .cout(temp_c[16]));
FA FA_16(.x(in1[16]), .y(in2[16]), .cin(temp_c[16]), .s(S[16]), .cout(temp_c[17]));
FA FA_17(.x(in1[17]), .y(in2[17]), .cin(temp_c[17]), .s(S[17]), .cout(temp_c[18]));
FA FA_18(.x(in1[18]), .y(in2[18]), .cin(temp_c[18]), .s(S[18]), .cout(temp_c[19]));
FA FA_19(.x(in1[19]), .y(in2[19]), .cin(temp_c[19]), .s(S[19]), .cout(temp_c[20]));
FA FA_20(.x(in1[20]), .y(in2[20]), .cin(temp_c[20]), .s(S[20]), .cout(temp_c[21]));
FA FA_21(.x(in1[21]), .y(in2[21]), .cin(temp_c[21]), .s(S[21]), .cout(temp_c[22]));
FA FA_22(.x(in1[22]), .y(in2[22]), .cin(temp_c[22]), .s(S[22]), .cout(temp_c[23]));
FA FA_23(.x(in1[23]), .y(in2[23]), .cin(temp_c[23]), .s(S[23]), .cout(temp_c[24]));
FA FA_24(.x(in1[24]), .y(in2[24]), .cin(temp_c[24]), .s(S[24]), .cout(Cout));

endmodule
/////////////////////////////////////////////////////////

module adder_10bit(in1, in2, S, Cout);

input	[9:0]	in1,in2;
output	[9:0]	S;
output			Cout;

logic	[9:1]	temp_c;

FA FA_0(.x(in1[0]), .y(in2[0]), .cin(1'b0), .s(S[0]), .cout(temp_c[1]));
FA FA_1(.x(in1[1]), .y(in2[1]), .cin(temp_c[1]), .s(S[1]), .cout(temp_c[2]));
FA FA_2(.x(in1[2]), .y(in2[2]), .cin(temp_c[2]), .s(S[2]), .cout(temp_c[3]));
FA FA_3(.x(in1[3]), .y(in2[3]), .cin(temp_c[3]), .s(S[3]), .cout(temp_c[4]));
FA FA_4(.x(in1[4]), .y(in2[4]), .cin(temp_c[4]), .s(S[4]), .cout(temp_c[5]));
FA FA_5(.x(in1[5]), .y(in2[5]), .cin(temp_c[5]), .s(S[5]), .cout(temp_c[6]));
FA FA_6(.x(in1[6]), .y(in2[6]), .cin(temp_c[6]), .s(S[6]), .cout(temp_c[7]));
FA FA_7(.x(in1[7]), .y(in2[7]), .cin(temp_c[7]), .s(S[7]), .cout(temp_c[8]));
FA FA_8(.x(in1[8]), .y(in2[8]), .cin(temp_c[8]), .s(S[8]), .cout(temp_c[9]));
FA FA_9(.x(in1[9]), .y(in2[9]), .cin(temp_c[9]), .s(S[9]), .cout(Cout));

endmodule
/////////////////////////////////////////////////////////////////////////
//adder 10bit
module adder_10bit(in1, in2, S, Cout);

input	[9:0]in1,in2;
output [9:0]S;
output Cout;

logic	[9:1]	temp_c;

FA FA_0(.x(in1[0]), .y(in2[0]), .cin(1'b0), 	 .s(S[0]), .cout(temp_c[1]));
FA FA_1(.x(in1[1]), .y(in2[1]), .cin(temp_c[1]), .s(S[1]), .cout(temp_c[2]));
FA FA_2(.x(in1[2]), .y(in2[2]), .cin(temp_c[2]), .s(S[2]), .cout(temp_c[3]));
FA FA_3(.x(in1[3]), .y(in2[3]), .cin(temp_c[3]), .s(S[3]), .cout(temp_c[4]));
FA FA_4(.x(in1[4]), .y(in2[4]), .cin(temp_c[4]), .s(S[4]), .cout(temp_c[5]));
FA FA_5(.x(in1[5]), .y(in2[5]), .cin(temp_c[5]), .s(S[5]), .cout(temp_c[6]));
FA FA_6(.x(in1[6]), .y(in2[6]), .cin(temp_c[6]), .s(S[6]), .cout(temp_c[7]));
FA FA_7(.x(in1[7]), .y(in2[7]), .cin(temp_c[7]), .s(S[7]), .cout(temp_c[8]));
FA FA_8(.x(in1[8]), .y(in2[8]), .cin(temp_c[8]), .s(S[8]), .cout(temp_c[9]));
FA FA_9(.x(in1[9]), .y(in2[9]), .cin(temp_c[9]), .s(S[9]), .cout(Cout));

endmodule

///////////////////////////


// adder 8bit
// Su dung de compare exponent cua 2 so floating point
//Neu so nao nho hon thi dich phai cho den khi exponent bang nhau
module adder_8bit(in1, in2, S, Cout);

input	[7:0]in1,in2;
output [7:0]S;
output Cout;

logic	[7:1]	temp_c;

FA FA_0(.x(in1[0]), .y(in2[0]), .cin(1'b0), .s(S[0]), .cout(temp_c[1]));
FA FA_1(.x(in1[1]), .y(in2[1]), .cin(temp_c[1]), .s(S[1]), .cout(temp_c[2]));
FA FA_2(.x(in1[2]), .y(in2[2]), .cin(temp_c[2]), .s(S[2]), .cout(temp_c[3]));
FA FA_3(.x(in1[3]), .y(in2[3]), .cin(temp_c[3]), .s(S[3]), .cout(temp_c[4]));
FA FA_4(.x(in1[4]), .y(in2[4]), .cin(temp_c[4]), .s(S[4]), .cout(temp_c[5]));
FA FA_5(.x(in1[5]), .y(in2[5]), .cin(temp_c[5]), .s(S[5]), .cout(temp_c[6]));
FA FA_6(.x(in1[6]), .y(in2[6]), .cin(temp_c[6]), .s(S[6]), .cout(temp_c[7]));
FA FA_7(.x(in1[7]), .y(in2[7]), .cin(temp_c[7]), .s(S[7]), .cout(Cout));

endmodule

//////////////////////////////////////////////////////////////////

module adder_5bit(in1, in2, S, Cout);

input	[4:0]	in1,in2;
output	[4:0]	S;
output			Cout;

logic	[4:1]	temp_c;

FA FA_0(.x(in1[0]), .y(in2[0]), .cin(1'b0), .s(S[0]), .cout(temp_c[1]));
FA FA_1(.x(in1[1]), .y(in2[1]), .cin(temp_c[1]), .s(S[1]), .cout(temp_c[2]));
FA FA_2(.x(in1[2]), .y(in2[2]), .cin(temp_c[2]), .s(S[2]), .cout(temp_c[3]));
FA FA_3(.x(in1[3]), .y(in2[3]), .cin(temp_c[3]), .s(S[3]), .cout(temp_c[4]));
FA FA_4(.x(in1[4]), .y(in2[4]), .cin(temp_c[4]), .s(S[4]), .cout(Count));

endmodule


module FA(
	x,
	y,
	cin,
	s,
	cout
);

input x, y, cin;
output s, cout;
	assign s = x ^ y ^ cin;
	assign cout = (x & y) | (cin & (x ^ y));
endmodule

//////////////////////////////////////////////////////////////////
// Full adder 1bit
//module FA(a, b, cin, S, cout);

//input a,b,cin;
//output S,cout;

//assign S=a^b^cin;
//assign cout = (a&b)|(a&cin)|(b&cin);

//endmodule

