module pos_exponent(in,out);

input		[31:0]	in;
output		[3:0]	out;

////////////////////////////////

assign exp_of_0  = in[30:23];
adder_10bit sub_ex_0(.in1({2'b0,exp_of_0}), .in2(-10'd127), .S(exp_0), .Cout());
div			div10_0(.A(in),.B(32'h41200000),.result(indiv10_0),.overflow(),.underflow(),.enable());
assign ena_0 = exp_0[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_1  = indiv10_0[30:23];
adder_10bit sub_ex_1(.in1({2'b0,exp_of_1}), .in2(-10'd127), .S(exp_1), .Cout());
div			div10_1(.A(indiv10_0),.B(32'h41200000),.result(indiv10_1),.overflow(),.underflow(),.enable());
assign ena_1 = exp_1[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_2  = indiv10_1[30:23];
adder_10bit sub_ex_2(.in1({2'b0,exp_of_2}), .in2(-10'd127), .S(exp_2), .Cout());
div			div10_2(.A(indiv10_1),.B(32'h41200000),.result(indiv10_2),.overflow(),.underflow(),.enable());
assign ena_2 = exp_2[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_3  = indiv10_2[30:23];
adder_10bit sub_ex_3(.in1({2'b0,exp_of_3}), .in2(-10'd127), .S(exp_3), .Cout());
div			div10_3(.A(indiv10_2),.B(32'h41200000),.result(indiv10_3),.overflow(),.underflow(),.enable());
assign ena_3 = exp_3[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_4  = indiv10_3[30:23];
adder_10bit sub_ex_4(.in1({2'b0,exp_of_4}), .in2(-10'd127), .S(exp_4), .Cout());
div			div10_1(.A(indiv10_3),.B(32'h41200000),.result(indiv10_4),.overflow(),.underflow(),.enable());
assign ena_4 = exp_4[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_5  = indiv10_4[30:23];
adder_10bit sub_ex_5(.in1({2'b0,exp_of_5}), .in2(-10'd127), .S(exp_5), .Cout());
div			div10_5(.A(indiv10_4),.B(32'h41200000),.result(indiv10_5),.overflow(),.underflow(),.enable());
assign ena_5 = exp_5[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_6  = indiv10_5[30:23];
adder_10bit sub_ex_6(.in1({2'b0,exp_of_6}), .in2(-10'd127), .S(exp_6), .Cout());
div			div10_6(.A(indiv10_5),.B(32'h41200000),.result(indiv10_6),.overflow(),.underflow(),.enable());
assign ena_6 = exp_6[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_7  = indiv10_6[30:23];
adder_10bit sub_ex_7(.in1({2'b0,exp_of_7}), .in2(-10'd127), .S(exp_7), .Cout());
div			div10_7(.A(indiv10_6),.B(32'h41200000),.result(indiv10_7),.overflow(),.underflow(),.enable());
assign ena_7 = exp_7[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_8  = indiv10_7[30:23];
adder_10bit sub_ex_8(.in1({2'b0,exp_of_8}), .in2(-10'd127), .S(exp_8), .Cout());
div			div10_8(.A(indiv10_7),.B(32'h41200000),.result(indiv10_8),.overflow(),.underflow(),.enable());
assign ena_8 = exp_8[9]?1'b0:1'b1;

//////////////////////////////// note

assign exp_of_9  = indiv10_8[30:23];
adder_10bit sub_ex_9(.in1({2'b0,exp_of_9}), .in2(-10'd127), .S(exp_9), .Cout());
div			div10_9(.A(indiv10_8),.B(32'h41200000),.result(indiv10_9),.overflow(),.underflow(),.enable());
assign ena_9 = exp_9[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_10  = indiv10_9[30:23];
adder_10bit sub_ex_10(.in1({2'b0,exp_of_10}), .in2(-10'd127), .S(exp_10), .Cout());
div			div10_10(.A(indiv10_9),.B(32'h41200000),.result(indiv10_10),.overflow(),.underflow(),.enable());
assign ena_10 = exp_10[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_11  = indiv10_10[30:23];
adder_10bit sub_ex_11(.in1({2'b0,exp_of_11}), .in2(-10'd127), .S(exp_11), .Cout());
div			div10_11(.A(indiv10_10),.B(32'h41200000),.result(indiv10_11),.overflow(),.underflow(),.enable());
assign ena_11 = exp_11[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_12  = indiv10_11[30:23];
adder_10bit sub_ex_12(.in1({2'b0,exp_of_12}), .in2(-10'd127), .S(exp_12), .Cout());
div			div10_12(.A(indiv10_11),.B(32'h41200000),.result(indiv10_12),.overflow(),.underflow(),.enable());
assign ena_12 = exp_12[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_13  = indiv10_12[30:23];
adder_10bit sub_ex_13(.in1({2'b0,exp_of_13}), .in2(-10'd127), .S(exp_13), .Cout());
div			div10_13(.A(indiv10_12),.B(32'h41200000),.result(indiv10_13),.overflow(),.underflow(),.enable());
assign ena_13 = exp_13[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_14  = indiv10_13[30:23];
adder_10bit sub_ex_14(.in1({2'b0,exp_of_14}), .in2(-10'd127), .S(exp_14), .Cout());
div			div10_14(.A(indiv10_13),.B(32'h41200000),.result(indiv10_14),.overflow(),.underflow(),.enable());
assign ena_14 = exp_14[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_15  = indiv10_14[30:23];
adder_10bit sub_ex_15(.in1({2'b0,exp_of_15}), .in2(-10'd127), .S(exp_15), .Cout());
div			div10_15(.A(indiv10_14),.B(32'h41200000),.result(indiv10_15),.overflow(),.underflow(),.enable());
assign ena_15 = exp_15[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_16  = indiv10_15[30:23];
adder_10bit sub_ex_16(.in1({2'b0,exp_of_16}), .in2(-10'd127), .S(exp_16), .Cout());
div			div10_16(.A(indiv10_15),.B(32'h41200000),.result(indiv10_16),.overflow(),.underflow(),.enable());
assign ena_16 = exp_16[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_17  = indiv10_16[30:23];
adder_10bit sub_ex_17(.in1({2'b0,exp_of_17}), .in2(-10'd127), .S(exp_17), .Cout());
div			div10_17(.A(indiv10_16),.B(32'h41200000),.result(indiv10_17),.overflow(),.underflow(),.enable());
assign ena_17 = exp_17[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_18  = indiv10_17[30:23];
adder_10bit sub_ex_18(.in1({2'b0,exp_of_18}), .in2(-10'd127), .S(exp_18), .Cout());
div			div10_18(.A(indiv10_17),.B(32'h41200000),.result(indiv10_18),.overflow(),.underflow(),.enable());
assign ena_18 = exp_18[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_19  = indiv10_18[30:23];
adder_10bit sub_ex_19(.in1({2'b0,exp_of_19}), .in2(-10'd127), .S(exp_19), .Cout());
div			div10_19(.A(indiv10_18),.B(32'h41200000),.result(indiv10_19),.overflow(),.underflow(),.enable());
assign ena_19 = exp_19[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_20  = indiv10_19[30:23];
adder_10bit sub_ex_20(.in1({2'b0,exp_of_20}), .in2(-10'd127), .S(exp_20), .Cout());
div			div10_20(.A(indiv10_19),.B(32'h41200000),.result(indiv10_20),.overflow(),.underflow(),.enable());
assign ena_20 = exp_20[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_21  = indiv10_20[30:23];
adder_10bit sub_ex_21(.in1({2'b0,exp_of_21}), .in2(-10'd127), .S(exp_21), .Cout());
div			div10_21(.A(indiv10_20),.B(32'h41200000),.result(indiv10_21),.overflow(),.underflow(),.enable());
assign ena_21 = exp_21[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_22  = indiv10_21[30:23];
adder_10bit sub_ex_22(.in1({2'b0,exp_of_22}), .in2(-10'd127), .S(exp_22), .Cout());
div			div10_22(.A(indiv10_21),.B(32'h41200000),.result(indiv10_22),.overflow(),.underflow(),.enable());
assign ena_22 = exp_22[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_23  = indiv10_22[30:23];
adder_10bit sub_ex_23(.in1({2'b0,exp_of_23}), .in2(-10'd127), .S(exp_23), .Cout());
div			div10_23(.A(indiv10_22),.B(32'h41200000),.result(indiv10_23),.overflow(),.underflow(),.enable());
assign ena_23 = exp_23[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_24  = indiv10_23[30:23];
adder_10bit sub_ex_24(.in1({2'b0,exp_of_24}), .in2(-10'd127), .S(exp_24), .Cout());
div			div10_24(.A(indiv10_23),.B(32'h41200000),.result(indiv10_24),.overflow(),.underflow(),.enable());
assign ena_24 = exp_24[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_25  = indiv10_24[30:23];
adder_10bit sub_ex_25(.in1({2'b0,exp_of_25}), .in2(-10'd127), .S(exp_25), .Cout());
div			div10_25(.A(indiv10_24),.B(32'h41200000),.result(indiv10_25),.overflow(),.underflow(),.enable());
assign ena_25 = exp_25[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_26  = indiv10_25[30:23];
adder_10bit sub_ex_26(.in1({2'b0,exp_of_26}), .in2(-10'd127), .S(exp_26), .Cout());
div			div10_26(.A(indiv10_25),.B(32'h41200000),.result(indiv10_26),.overflow(),.underflow(),.enable());
assign ena_26 = exp_26[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_27  = indiv10_26[30:23];
adder_10bit sub_ex_27(.in1({2'b0,exp_of_27}), .in2(-10'd127), .S(exp_27), .Cout());
div			div10_27(.A(indiv10_26),.B(32'h41200000),.result(indiv10_27),.overflow(),.underflow(),.enable());
assign ena_27 = exp_27[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_28  = indiv10_27[30:23];
adder_10bit sub_ex_28(.in1({2'b0,exp_of_28}), .in2(-10'd127), .S(exp_28), .Cout());
div			div10_28(.A(indiv10_27),.B(32'h41200000),.result(indiv10_28),.overflow(),.underflow(),.enable());
assign ena_28 = exp_28[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_29  = indiv10_28[30:23];
adder_10bit sub_ex_29(.in1({2'b0,exp_of_29}), .in2(-10'd127), .S(exp_29), .Cout());
div			div10_29(.A(indiv10_28),.B(32'h41200000),.result(indiv10_29),.overflow(),.underflow(),.enable());
assign ena_29 = exp_29[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_30  = indiv10_29[30:23];
adder_10bit sub_ex_30(.in1({2'b0,exp_of_30}), .in2(-10'd127), .S(exp_30), .Cout());
div			div10_30(.A(indiv10_29),.B(32'h41200000),.result(indiv10_30),.overflow(),.underflow(),.enable());
assign ena_30 = exp_30[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_31  = indiv10_30[30:23];
adder_10bit sub_ex_31(.in1({2'b0,exp_of_31}), .in2(-10'd127), .S(exp_31), .Cout());
div			div10_31(.A(indiv10_30),.B(32'h41200000),.result(indiv10_31),.overflow(),.underflow(),.enable());
assign ena_31 = exp_31[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_32  = indiv10_31[30:23];
adder_10bit sub_ex_32(.in1({2'b0,exp_of_32}), .in2(-10'd127), .S(exp_32), .Cout());
div			div10_32(.A(indiv10_31),.B(32'h41200000),.result(indiv10_32),.overflow(),.underflow(),.enable());
assign ena_32 = exp_32[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_33  = indiv10_32[30:23];
adder_10bit sub_ex_33(.in1({2'b0,exp_of_33}), .in2(-10'd127), .S(exp_33), .Cout());
div			div10_33(.A(indiv10_32),.B(32'h41200000),.result(indiv10_33),.overflow(),.underflow(),.enable());
assign ena_33 = exp_33[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_34  = indiv10_33[30:23];
adder_10bit sub_ex_34(.in1({2'b0,exp_of_34}), .in2(-10'd127), .S(exp_34), .Cout());
div			div10_34(.A(indiv10_33),.B(32'h41200000),.result(indiv10_34),.overflow(),.underflow(),.enable());
assign ena_34 = exp_34[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_35  = indiv10_34[30:23];
adder_10bit sub_ex_35(.in1({2'b0,exp_of_35}), .in2(-10'd127), .S(exp_35), .Cout());
div			div10_35(.A(indiv10_34),.B(32'h41200000),.result(indiv10_35),.overflow(),.underflow(),.enable());
assign ena_35 = exp_35[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_36  = indiv10_35[30:23];
adder_10bit sub_ex_36(.in1({2'b0,exp_of_36}), .in2(-10'd127), .S(exp_36), .Cout());
div			div10_36(.A(indiv10_35),.B(32'h41200000),.result(indiv10_36),.overflow(),.underflow(),.enable());
assign ena_36 = exp_36[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_37  = indiv10_36[30:23];
adder_10bit sub_ex_37(.in1({2'b0,exp_of_37}), .in2(-10'd127), .S(exp_37), .Cout());
div			div10_37(.A(indiv10_36),.B(32'h41200000),.result(indiv10_37),.overflow(),.underflow(),.enable());
assign ena_37 = exp_37[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_38  = indiv10_37[30:23];
adder_10bit sub_ex_38(.in1({2'b0,exp_of_38}), .in2(-10'd127), .S(exp_38), .Cout());
div			div10_38(.A(indiv10_37),.B(32'h41200000),.result(indiv10_38),.overflow(),.underflow(),.enable());
assign ena_38 = exp_38[9]?1'b0:1'b1;

////////////////////////////////

assign exp_of_39  = indiv10_38[30:23];
adder_10bit sub_ex_39(.in1({2'b0,exp_of_39}), .in2(-10'd127), .S(exp_39), .Cout());
div			div10_39(.A(indiv10_38),.B(32'h41200000),.result(indiv10_39),.overflow(),.underflow(),.enable());
assign ena_39 = exp_39[9]?1'b0:1'b1;

////////////////////////////////

always @(*)
begin
case ({ena_39,ena_38,ena_37,ena_36,ena_35,ena_34,ena_33,ena_32,ena_31,ena_30,ena_29,ena_28,ena_27,ena_26,ena_25,ena_24,ena_23,ena_22,ena_21,ena_20,ena_19,ena_18,ena_17,ena_16,ena_15,ena_14,ena_13,ena_12,ena_11,ena_10,ena_9,ena_8,ena_7,ena_6,ena_5,ena_4,ena_3,ena_2,ena_1,ena_0})
	40'b0000000000000000000000000000000000000000: out_float =  indiv10_39;
	40'b1000000000000000000000000000000000000000: out_float =  indiv10_38;
	40'b1100000000000000000000000000000000000000: out_float =  indiv10_37;
	40'b1110000000000000000000000000000000000000: out_float =  indiv10_36;
	40'b1111000000000000000000000000000000000000: out_float =  indiv10_35;
	40'b1111100000000000000000000000000000000000: out_float =  indiv10_34;
	40'b1111110000000000000000000000000000000000: out_float =  indiv10_33;
	40'b1111111000000000000000000000000000000000: out_float =  indiv10_32;
	40'b1111111100000000000000000000000000000000: out_float =  indiv10_31;
	40'b1111111110000000000000000000000000000000: out_float =  indiv10_30;
	40'b1111111111000000000000000000000000000000: out_float =  indiv10_29;
	40'b1111111111100000000000000000000000000000: out_float =  indiv10_28;
	40'b1111111111110000000000000000000000000000: out_float =  indiv10_27;
	40'b1111111111111000000000000000000000000000: out_float =  indiv10_26;
	40'b1111111111111100000000000000000000000000: out_float =  indiv10_25;
	40'b1111111111111110000000000000000000000000: out_float =  indiv10_24;
	40'b1111111111111111000000000000000000000000: out_float =  indiv10_23;
	40'b1111111111111111100000000000000000000000: out_float =  indiv10_22;
	40'b1111111111111111110000000000000000000000: out_float =  indiv10_21;
	40'b1111111111111111111000000000000000000000: out_float =  indiv10_20;
	40'b1111111111111111111100000000000000000000: out_float =  indiv10_19;
	40'b1111111111111111111110000000000000000000: out_float =  indiv10_18;
	40'b1111111111111111111111000000000000000000: out_float =  indiv10_17;
	40'b1111111111111111111111100000000000000000: out_float =  indiv10_16;
	40'b1111111111111111111111110000000000000000: out_float =  indiv10_15;
	40'b1111111111111111111111111000000000000000: out_float =  indiv10_14;
	40'b1111111111111111111111111100000000000000: out_float =  indiv10_13;
	40'b1111111111111111111111111110000000000000: out_float =  indiv10_12;
	40'b1111111111111111111111111111000000000000: out_float =  indiv10_11;
	40'b1111111111111111111111111111100000000000: out_float =  indiv10_10;
	40'b1111111111111111111111111111110000000000: out_float =  indiv10_9 ;
	40'b1111111111111111111111111111111000000000: out_float =  indiv10_8 ;
	40'b1111111111111111111111111111111100000000: out_float =  indiv10_7 ;
	40'b1111111111111111111111111111111110000000: out_float =  indiv10_6 ;
	40'b1111111111111111111111111111111111000000: out_float =  indiv10_5 ;
	40'b1111111111111111111111111111111111100000: out_float =  indiv10_4 ;
	40'b1111111111111111111111111111111111110000: out_float =  indiv10_3 ;
	40'b1111111111111111111111111111111111111000: out_float =  indiv10_2 ;
	40'b1111111111111111111111111111111111111100: out_float =  indiv10_1 ;
	40'b1111111111111111111111111111111111111110: out_float =  indiv10_0 ;
	40'b1111111111111111111111111111111111111111: out_float =  in        ;
default: out_float = 0;
endcase
end

assign exp_out = out_float[30:23];
complement2_10bit	neg(.in({2'b0,exp_out}), .out(neg_exp_out));
adder_10bit sub_ex_40(.in1(10'd151), .in2(neg_exp_out), .S(shift), .Cout());

assign frac_out = {1'b1,out_float[22:0]};

reg		[31:0]	out_float;

wire			ena_39,ena_38,ena_37,ena_36,ena_35,ena_34,ena_33,ena_32,ena_31,ena_30,ena_29,ena_28,ena_27,
				ena_26,ena_25,ena_24,ena_23,ena_22,ena_21,ena_20,ena_19,ena_18,ena_17,ena_16,ena_15,ena_14,
				ena_13,ena_12,ena_11,ena_10,ena_9,ena_8,ena_7,ena_6,ena_5,ena_4,ena_3,ena_2,ena_1,ena_0;

wire	[7:0]	exp_out,exp_of_39,exp_of_38,exp_of_37,exp_of_36,exp_of_35,exp_of_34,exp_of_33,exp_of_32,exp_of_31,
				exp_of_30,exp_of_29,exp_of_28,exp_of_27,exp_of_26,exp_of_25,exp_of_24,exp_of_23,exp_of_22,exp_of_21,
				exp_of_20,exp_of_19,exp_of_18,exp_of_17,exp_of_16,exp_of_15,exp_of_14,exp_of_13,exp_of_12,exp_of_11,
				exp_of_10,exp_of_9,exp_of_8,exp_of_7,exp_of_6,exp_of_5,exp_of_4,exp_of_3,exp_of_2,exp_of_1,exp_of_0;
				
wire	[9:0]	shift,neg_exp_out,exp_39,exp_38,exp_37,exp_36,exp_35,exp_34,exp_33,exp_32,exp_31,exp_30,exp_29,exp_28,
				exp_27,exp_26,exp_25,exp_24,exp_23,exp_22,exp_21,exp_20,exp_19,exp_18,exp_17,exp_16,exp_15,exp_14,
				exp_13,exp_12,exp_11,exp_10,exp_9,exp_8,exp_7,exp_6,exp_5,exp_4,exp_3,exp_2,exp_1,exp_0;
				
wire	[23:0] 	nguyen_24,frac_out;
  
wire	[31:0]	indiv10_39,indiv10_38,indiv10_37,indiv10_36,indiv10_35,indiv10_34,indiv10_33,indiv10_32,indiv10_31,
				indiv10_30,indiv10_29,indiv10_28,indiv10_27,indiv10_26,indiv10_25,indiv10_24,indiv10_23,indiv10_22,
				indiv10_21,indiv10_20,indiv10_19,indiv10_18,indiv10_17,indiv10_16,indiv10_15,indiv10_14,indiv10_13,
				indiv10_12,indiv10_11,indiv10_10,indiv10_9,indiv10_8,indiv10_7,indiv10_6,indiv10_5,indiv10_4,indiv10_3,
				indiv10_2,indiv10_1,indiv10_0;

shift_right dich(.in(frac_out), .nshift(shift[4:0]), .out(nguyen_24));

assign out = nguyen_24[3:0];

endmodule	