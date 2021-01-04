module adder_48bit(in1, in2, S, Cout);

input	[47:0]	in1,in2;
output	[47:0]	S;
output			Cout;

wire	[47:1]	temp_c;

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
FA FA_25(.a(in1[25]), .b(in2[25]), .cin(temp_c[25]), .S(S[25]), .cout(temp_c[26]));
FA FA_26(.a(in1[26]), .b(in2[26]), .cin(temp_c[26]), .S(S[26]), .cout(temp_c[27]));
FA FA_27(.a(in1[27]), .b(in2[27]), .cin(temp_c[27]), .S(S[27]), .cout(temp_c[28]));
FA FA_28(.a(in1[28]), .b(in2[28]), .cin(temp_c[28]), .S(S[28]), .cout(temp_c[29]));
FA FA_29(.a(in1[29]), .b(in2[29]), .cin(temp_c[29]), .S(S[29]), .cout(temp_c[30]));
FA FA_30(.a(in1[30]), .b(in2[30]), .cin(temp_c[30]), .S(S[30]), .cout(temp_c[31]));
FA FA_31(.a(in1[31]), .b(in2[31]), .cin(temp_c[31]), .S(S[31]), .cout(temp_c[32]));
FA FA_32(.a(in1[32]), .b(in2[32]), .cin(temp_c[32]), .S(S[32]), .cout(temp_c[33]));
FA FA_33(.a(in1[33]), .b(in2[33]), .cin(temp_c[33]), .S(S[33]), .cout(temp_c[34]));
FA FA_34(.a(in1[34]), .b(in2[34]), .cin(temp_c[34]), .S(S[34]), .cout(temp_c[35]));
FA FA_35(.a(in1[35]), .b(in2[35]), .cin(temp_c[35]), .S(S[35]), .cout(temp_c[36]));
FA FA_36(.a(in1[36]), .b(in2[36]), .cin(temp_c[36]), .S(S[36]), .cout(temp_c[37]));
FA FA_37(.a(in1[37]), .b(in2[37]), .cin(temp_c[37]), .S(S[37]), .cout(temp_c[38]));
FA FA_38(.a(in1[38]), .b(in2[38]), .cin(temp_c[38]), .S(S[38]), .cout(temp_c[39]));
FA FA_39(.a(in1[39]), .b(in2[39]), .cin(temp_c[39]), .S(S[39]), .cout(temp_c[40]));
FA FA_40(.a(in1[40]), .b(in2[40]), .cin(temp_c[40]), .S(S[40]), .cout(temp_c[41]));
FA FA_41(.a(in1[41]), .b(in2[41]), .cin(temp_c[41]), .S(S[41]), .cout(temp_c[42]));
FA FA_42(.a(in1[42]), .b(in2[42]), .cin(temp_c[42]), .S(S[42]), .cout(temp_c[43]));
FA FA_43(.a(in1[43]), .b(in2[43]), .cin(temp_c[43]), .S(S[43]), .cout(temp_c[44]));
FA FA_44(.a(in1[44]), .b(in2[44]), .cin(temp_c[44]), .S(S[44]), .cout(temp_c[45]));
FA FA_45(.a(in1[45]), .b(in2[45]), .cin(temp_c[45]), .S(S[45]), .cout(temp_c[46]));
FA FA_46(.a(in1[46]), .b(in2[46]), .cin(temp_c[46]), .S(S[46]), .cout(temp_c[47]));
FA FA_47(.a(in1[47]), .b(in2[47]), .cin(temp_c[47]), .S(S[47]), .cout(Cout));

endmodule

///////////////////////////////////////////////////////////////////////////////////////////

module adder_43bit(in1, in2, S, Cout);

input	[42:0]	in1,in2;
output	[42:0]	S;
output			Cout;

wire	[42:1]	temp_c;

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
FA FA_25(.a(in1[25]), .b(in2[25]), .cin(temp_c[25]), .S(S[25]), .cout(temp_c[26]));
FA FA_26(.a(in1[26]), .b(in2[26]), .cin(temp_c[26]), .S(S[26]), .cout(temp_c[27]));
FA FA_27(.a(in1[27]), .b(in2[27]), .cin(temp_c[27]), .S(S[27]), .cout(temp_c[28]));
FA FA_28(.a(in1[28]), .b(in2[28]), .cin(temp_c[28]), .S(S[28]), .cout(temp_c[29]));
FA FA_29(.a(in1[29]), .b(in2[29]), .cin(temp_c[29]), .S(S[29]), .cout(temp_c[30]));
FA FA_30(.a(in1[30]), .b(in2[30]), .cin(temp_c[30]), .S(S[30]), .cout(temp_c[31]));
FA FA_31(.a(in1[31]), .b(in2[31]), .cin(temp_c[31]), .S(S[31]), .cout(temp_c[32]));
FA FA_32(.a(in1[32]), .b(in2[32]), .cin(temp_c[32]), .S(S[32]), .cout(temp_c[33]));
FA FA_33(.a(in1[33]), .b(in2[33]), .cin(temp_c[33]), .S(S[33]), .cout(temp_c[34]));
FA FA_34(.a(in1[34]), .b(in2[34]), .cin(temp_c[34]), .S(S[34]), .cout(temp_c[35]));
FA FA_35(.a(in1[35]), .b(in2[35]), .cin(temp_c[35]), .S(S[35]), .cout(temp_c[36]));
FA FA_36(.a(in1[36]), .b(in2[36]), .cin(temp_c[36]), .S(S[36]), .cout(temp_c[37]));
FA FA_37(.a(in1[37]), .b(in2[37]), .cin(temp_c[37]), .S(S[37]), .cout(temp_c[38]));
FA FA_38(.a(in1[38]), .b(in2[38]), .cin(temp_c[38]), .S(S[38]), .cout(temp_c[39]));
FA FA_39(.a(in1[39]), .b(in2[39]), .cin(temp_c[39]), .S(S[39]), .cout(temp_c[40]));
FA FA_40(.a(in1[40]), .b(in2[40]), .cin(temp_c[40]), .S(S[40]), .cout(temp_c[41]));
FA FA_41(.a(in1[41]), .b(in2[41]), .cin(temp_c[41]), .S(S[41]), .cout(temp_c[42]));
FA FA_42(.a(in1[42]), .b(in2[42]), .cin(temp_c[42]), .S(S[42]), .cout(Cout));

endmodule

//////////////////////////////////////////////////////////////////////////////////////////

module adder_28bit(in1, in2, S, Cout);

input	[27:0]	in1,in2;
output	[27:0]	S;
output			Cout;

wire	[27:1]	temp_c;

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
FA FA_25(.a(in1[25]), .b(in2[25]), .cin(temp_c[25]), .S(S[25]), .cout(temp_c[26]));
FA FA_26(.a(in1[26]), .b(in2[26]), .cin(temp_c[26]), .S(S[26]), .cout(temp_c[27]));
FA FA_27(.a(in1[27]), .b(in2[27]), .cin(temp_c[27]), .S(S[27]), .cout(Cout));

endmodule

///////////////////////////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////////////////////////////////////

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

//////////////////////////////////////////////////////////////////////////////////////

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

//////////////////////////////////////////////////////////////////////////////////////

module adder_5bit(in1, in2, S, Cout);

input	[4:0]	in1,in2;
output	[4:0]	S;
output			Cout;

wire	[4:1]	temp_c;

FA FA_0(.a(in1[0]), .b(in2[0]), .cin(1'b0), .S(S[0]), .cout(temp_c[1]));
FA FA_1(.a(in1[1]), .b(in2[1]), .cin(temp_c[1]), .S(S[1]), .cout(temp_c[2]));
FA FA_2(.a(in1[2]), .b(in2[2]), .cin(temp_c[2]), .S(S[2]), .cout(temp_c[3]));
FA FA_3(.a(in1[3]), .b(in2[3]), .cin(temp_c[3]), .S(S[3]), .cout(temp_c[4]));
FA FA_4(.a(in1[4]), .b(in2[4]), .cin(temp_c[4]), .S(S[4]), .cout(Cout));

endmodule

//////////////////////////////////////////////////////////////////////////////////////

module adder_3bit(in1, in2, S, Cout);

input	[2:0]	in1,in2;
output	[2:0]	S;
output			Cout;

wire	[2:1]	temp_c;

FA FA_0(.a(in1[0]), .b(in2[0]), .cin(1'b0), .S(S[0]), .cout(temp_c[1]));
FA FA_1(.a(in1[1]), .b(in2[1]), .cin(temp_c[1]), .S(S[1]), .cout(temp_c[2]));
FA FA_2(.a(in1[2]), .b(in2[2]), .cin(temp_c[2]), .S(S[2]), .cout(Cout));

endmodule

//////////////////////////////////////////////////////////////////////////////////////

module adder_2bit(in1, in2, S, Cout);

input	[1:0]	in1,in2;
output	[1:0]	S;
output			Cout;

wire			temp_c;

FA FA_0(.a(in1[0]), .b(in2[0]), .cin(1'b0), .S(S[0]), .cout(temp_c));
FA FA_1(.a(in1[1]), .b(in2[1]), .cin(temp_c), .S(S[1]), .cout(Cout));

endmodule

//////////////////////////////////////////////////////////////////////////////////////

module FA(a,b,S,cin,cout);

input	a,b,cin;
output	S,cout;

assign S = a^b^cin;
assign cout =  ((a&b) | (cin&(a^b)));

endmodule