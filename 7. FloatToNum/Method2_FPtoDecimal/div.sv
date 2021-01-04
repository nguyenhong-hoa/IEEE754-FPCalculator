`include "adder.sv"
`include "find1.sv"
`include "complement2.sv"
`include "shiftleft_division.sv"
`include "export_result.sv"
`include "checkspecial.sv"

module div(A,B,result,overflow,underflow,enable);

input	[31:0]	A,B;
output	[31:0]	result;
output			overflow,underflow,enable;

logic			sign_result,signA,signB;
logic	[4:0]	nshiftleft;
logic	[7:0]	exp_temp,exp_temp2,exp_out,exp_result,expA,expB;
logic	[9:0]	shiftleftout,temp_exp;
logic	[22:0]	frac_result;
logic	[23:0]	fracleft_before_result,fracA,fracB,frac_out;
logic	[47:0]	temp_fracA,temp_fracB,neg_fracB;

logic	[47:0]	frac_sub0,frac_sub1,frac_sub2,frac_sub3,frac_sub4,frac_sub5,frac_sub6,frac_sub7,frac_sub8,frac_sub9,frac_sub10
				,frac_sub11,frac_sub12,frac_sub13,frac_sub14,frac_sub15,frac_sub16,frac_sub17,frac_sub18,frac_sub19,frac_sub20
				,frac_sub21,frac_sub22,frac_sub23;
				
logic	[47:0]	temp_S0,temp_S1,temp_S2,temp_S3,temp_S4,temp_S5,temp_S6,temp_S7,temp_S8,temp_S9,temp_S10,temp_S11,temp_S12;
logic	[47:0]	temp_S13,temp_S14,temp_S15,temp_S16,temp_S17,temp_S18,temp_S19,temp_S20,temp_S21,temp_S22,temp_S23;


assign	signA = A[31];
assign	expA  = A[30:23];
assign	fracA = {1'b1,A[22:0]};
assign	signB = B[31];
assign	expB  = B[30:23];
assign	fracB = {1'b1,B[22:0]};

assign	sign_result = signA ^ signB;

adder_8bit	findadder(.in1(expB), .in2(-8'd127), .S(exp_temp), .Cout());
complement2_8bit compleexp(.in(exp_temp), .out(exp_temp2));
adder_8bit	adder_exponent(.in1(expA), .in2(exp_temp2), .S(exp_out), .Cout());

//////////////////////////////////////////////////////////////////////////////

assign temp_fracA = {fracA,24'd0};
assign temp_fracB = {24'd0,fracB}; //23:0
complement2_48bit negfracB(.in(temp_fracB),.out(neg_fracB));

adder_48bit sub0(.in1({24'd0,temp_fracA[47:24]}), .in2(neg_fracB), .S(temp_S0), .Cout());
assign frac_out[23] = ~temp_S0[26];
assign frac_sub0 = temp_S0[26]?{23'd0,temp_fracA[47:24],1'b0}:{temp_S0[46:0],1'b0};

adder_48bit sub1(.in1(frac_sub0), .in2(neg_fracB), .S(temp_S1), .Cout());
assign frac_out[22] = ~temp_S1[26];
assign frac_sub1 = temp_S1[26]?{frac_sub0[46:0],1'b0}:{temp_S1[46:0],1'b0};

adder_48bit sub2(.in1(frac_sub1), .in2(neg_fracB), .S(temp_S2), .Cout());
assign frac_out[21] = ~temp_S2[26];
assign frac_sub2 = temp_S2[26]?{frac_sub1[46:0],1'b0}:{temp_S2[46:0],1'b0};

adder_48bit sub3(.in1(frac_sub2), .in2(neg_fracB), .S(temp_S3), .Cout());
assign frac_out[20] = ~temp_S3[26];
assign frac_sub3 = temp_S3[26]?{frac_sub2[46:0],1'b0}:{temp_S3[46:0],1'b0};

adder_48bit sub4(.in1(frac_sub3), .in2(neg_fracB), .S(temp_S4), .Cout());
assign frac_out[19] = ~temp_S4[26];
assign frac_sub4 = temp_S4[26]?{frac_sub3[46:0],1'b0}:{temp_S4[46:0],1'b0};

adder_48bit sub5(.in1(frac_sub4), .in2(neg_fracB), .S(temp_S5), .Cout());
assign frac_out[18] = ~temp_S5[26];
assign frac_sub5 = temp_S5[26]?{frac_sub4[46:0],1'b0}:{temp_S5[46:0],1'b0};

adder_48bit sub6(.in1(frac_sub5), .in2(neg_fracB), .S(temp_S6), .Cout());
assign frac_out[17] = ~temp_S6[26];
assign frac_sub6 = temp_S6[26]?{frac_sub5[46:0],1'b0}:{temp_S6[46:0],1'b0};

adder_48bit sub7(.in1(frac_sub6), .in2(neg_fracB), .S(temp_S7), .Cout());
assign frac_out[16] = ~temp_S7[26];
assign frac_sub7 = temp_S7[26]?{frac_sub6[46:0],1'b0}:{temp_S7[46:0],1'b0};

adder_48bit sub8(.in1(frac_sub7), .in2(neg_fracB), .S(temp_S8), .Cout());
assign frac_out[15] = ~temp_S8[26];
assign frac_sub8 = temp_S8[26]?{frac_sub7[46:0],1'b0}:{temp_S8[46:0],1'b0};

adder_48bit sub9(.in1(frac_sub8), .in2(neg_fracB), .S(temp_S9), .Cout());
assign frac_out[14] = ~temp_S9[26];
assign frac_sub9 = temp_S9[26]?{frac_sub8[46:0],1'b0}:{temp_S9[46:0],1'b0};

adder_48bit sub10(.in1(frac_sub9), .in2(neg_fracB), .S(temp_S10), .Cout());
assign frac_out[13] = ~temp_S10[26];
assign frac_sub10 = temp_S10[26]?{frac_sub9[46:0],1'b0}:{temp_S10[46:0],1'b0};

adder_48bit sub11(.in1(frac_sub10), .in2(neg_fracB), .S(temp_S11), .Cout());
assign frac_out[12] = ~temp_S11[26];
assign frac_sub11 = temp_S11[26]?{frac_sub10[46:0],1'b0}:{temp_S11[46:0],1'b0};

adder_48bit sub12(.in1(frac_sub11), .in2(neg_fracB), .S(temp_S12), .Cout());
assign frac_out[11] = ~temp_S12[26];
assign frac_sub12 = temp_S12[26]?{frac_sub11[46:0],1'b0}:{temp_S12[46:0],1'b0};

adder_48bit sub13(.in1(frac_sub12), .in2(neg_fracB), .S(temp_S13), .Cout());
assign frac_out[10] = ~temp_S13[26];
assign frac_sub13 = temp_S13[26]?{frac_sub12[46:0],1'b0}:{temp_S13[46:0],1'b0};

adder_48bit sub14(.in1(frac_sub13), .in2(neg_fracB), .S(temp_S14), .Cout());
assign frac_out[9] = ~temp_S14[26];
assign frac_sub14 = temp_S14[26]?{frac_sub13[46:0],1'b0}:{temp_S14[46:0],1'b0};

adder_48bit sub15(.in1(frac_sub14), .in2(neg_fracB), .S(temp_S15), .Cout());
assign frac_out[8] = ~temp_S15[26];
assign frac_sub15 = temp_S15[26]?{frac_sub14[46:0],1'b0}:{temp_S15[46:0],1'b0};

adder_48bit sub16(.in1(frac_sub15), .in2(neg_fracB), .S(temp_S16), .Cout());
assign frac_out[7] = ~temp_S16[26];
assign frac_sub16 = temp_S16[26]?{frac_sub15[46:0],1'b0}:{temp_S16[46:0],1'b0};

adder_48bit sub17(.in1(frac_sub16), .in2(neg_fracB), .S(temp_S17), .Cout());
assign frac_out[6] = ~temp_S17[26];
assign frac_sub17 = temp_S17[26]?{frac_sub16[46:0],1'b0}:{temp_S17[46:0],1'b0};

adder_48bit sub18(.in1(frac_sub17), .in2(neg_fracB), .S(temp_S18), .Cout());
assign frac_out[5] = ~temp_S18[26];
assign frac_sub18 = temp_S18[26]?{frac_sub17[46:0],1'b0}:{temp_S18[46:0],1'b0};

adder_48bit sub19(.in1(frac_sub18), .in2(neg_fracB), .S(temp_S19), .Cout());
assign frac_out[4] = ~temp_S19[26];
assign frac_sub19 = temp_S19[26]?{frac_sub18[46:0],1'b0}:{temp_S19[46:0],1'b0};

adder_48bit sub20(.in1(frac_sub19), .in2(neg_fracB), .S(temp_S20), .Cout());
assign frac_out[3] = ~temp_S20[26];
assign frac_sub20 = temp_S20[26]?{frac_sub19[46:0],1'b0}:{temp_S20[46:0],1'b0};

adder_48bit sub21(.in1(frac_sub20), .in2(neg_fracB), .S(temp_S21), .Cout());
assign frac_out[2] = ~temp_S21[26];
assign frac_sub21 = temp_S21[26]?{frac_sub20[46:0],1'b0}:{temp_S21[46:0],1'b0};

adder_48bit sub22(.in1(frac_sub21), .in2(neg_fracB), .S(temp_S22), .Cout());
assign frac_out[1] = ~temp_S22[26];
assign frac_sub22 = temp_S22[26]?{frac_sub21[46:0],1'b0}:{temp_S22[46:0],1'b0};

adder_48bit sub23(.in1(frac_sub22), .in2(neg_fracB), .S(temp_S23), .Cout());
assign frac_out[0] = ~temp_S23[26];
assign frac_sub23 = temp_S23[26]?{frac_sub22[46:0],1'b0}:{temp_S23[46:0],1'b0};

//////////////////////////////////////////////////////////////////////////////

find1 findbit1(.in(frac_out), .nshiftleft(nshiftleft));
shiftleft shift_fracl(.in(frac_out), .nshiftleft(nshiftleft), .out(fracleft_before_result));

assign frac_result = fracleft_before_result[22:0];
complement2_10bit comple2_exponent(.in({5'b0,nshiftleft}),.out(shiftleftout));

adder_10bit	add_2(.in1({2'b00,exp_out}), .in2(shiftleftout), .S(temp_exp), .Cout());
assign underflow = temp_exp[9]&temp_exp[8];
assign overflow = ~temp_exp[9]&(temp_exp[8]|(&({temp_exp[7:0]})));

assign exp_result = temp_exp[8]?8'd0:temp_exp[7:0];

export_result_division export1(.in1(A), .in2(B), .temp_result({sign_result,exp_result,frac_result}), .result(result));

endmodule