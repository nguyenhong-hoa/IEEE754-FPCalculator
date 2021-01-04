`include "adder.v"
`include "compliment2.v"
`include "checkspecial.v"
`include "compare_8bit.v"
`include "export_result.v"
`include "shift_right_add.v"
`include "shift_right_mult.v"
`include "shiftleft_add.v"
`include "shiftleft_div.v"
`include "find1.v"
`include "factor_root.v"
`include "div.v"
`include "add_sub.v"
`include "square.v"
`include "power.v"
`include "mult.v"
`include "mux.v"
`include "mult_sq.v"
`include "find1_add.v"
`include "shiftleft_mult.v"

module nroot(A,B,CLK,RST,result,overflow,underflow);

input	[31:0]	A,B;
input			CLK,RST;
output	[31:0]	result;
output			overflow,underflow;

wire    		sign_result,stage1,stage2,stage11,CLK2,CLK3,CLK5,enaphu,enaphu2,over1,over2,overflow1,ena_m2,f1_ST_1,checkso1;
wire 	[1:0] 	rst_2,rst_3,rst_4,rst_5,rst_6;
wire	[7:0]	exp_f1,count3;
wire	[8:0]	exp_real,neg_exp,expf1;
wire 	[23:0] 	factor1,factor2;
wire 	[4:0] 	root1,root2,count2,count4;
wire 	[31:0] 	in3,in1,f1,f3,f4,m1,result1,number1,number2,result2,temp_sum,square1,square2,temp_result;

reg				RST2,RST3,RST4,RST5,RST6,ena2,ena3,ena4,ena5,ena6,ena7,ena8,ena9,reset_mult,reset_mult2,temp_rst1,temp_rst2;
reg				stage3,stage4;
reg 	[1:0] 	count_rst2,count_rst3,count_rst4,count_rst5,count_rst6;
reg		[4:0]	count_out2,count_out4;
reg		[7:0]	count_out3;
reg		[31:0]	sum,temp_square1,temp_square2,next;


//Tinh m3e3
assign	sign_result = 1'b0;
div divin2(.A(32'h3F800000), .B({1'b0,B[30:0]}) , .CLK(CLK), .RST(RST), .result(in3), .overflow(o1), 
			.underflow(u1), .enable(stage1));

//Tính 1/m1
div divin1(.A(32'h3F800000), .B(A) , .CLK(CLK), .RST(RST), .result(in1), 
			.overflow(o2), .underflow(u2), .enable(stage11));
			
assign f1 = B[31]?in1:A;
assign f3 = {1'b0,in3[30:0]};

adder_9bit expreal(.in1({1'b0,f1[30:23]}), .in2(-9'd127), .S(expf1), .Cout());
assign f1_ST_1 = expf1[8];

assign CLK2 = stage1 &stage11& CLK;

///////////////////////////////////////////////////////////////////////
// Tính toán số đầu tiên
///////////////////////////////////////////////////////////////////////

assign m1 = {1'b0,8'b01111111,f1[22:0]};

factor_root so1(.fracin(f3), .check(f1_ST_1), .checkin(1'b0), .checkout(checkso1), .checkBin(1'b0),
				.factor(factor1), .root(root1), .over(over1));

			//////// RESET for POWER_M1
			adder_2bit RST_power_1(.in1(count_rst2), .in2(-2'd1), .S(rst_2), .Cout());

			always @(posedge CLK2 or negedge RST)
			begin
				if (~RST)
				begin
					count_rst2 <= 2'b10;
					RST2 <= 1'b1&RST;
				end
				else
				begin
					count_rst2 <= ena2?rst_2:count_rst2;
					RST2 <= |rst_2;
				end
			end

			always @(*)
			begin
				ena2 = ~(&(count_rst2));
			end
			///////////////////////////////////////

power power_m1(.A(m1), .B(factor1), .CLK(CLK2), .RST(RST2), .result(result1),
				.overflow(o3), .underflow(u3), .enable(stage2));

assign CLK3 = CLK2 & stage2;

			//////// RESET for SQUARE_M1
			adder_2bit RST_SQUARE_M1(.in1(count_rst3), .in2(-2'd1), .S(rst_3), .Cout());

			always @(posedge CLK3 or negedge RST)
			begin
				if (~RST)
				begin
					count_rst3 <= 2'b10;
					RST3 <= 1'b1;
				end
				else
				begin
					count_rst3 <= ena3?(rst_3):(count_rst3);
					RST3 <= |rst_3;
				end
			end

			always @(*)
			begin
				ena3 = ~(&(count_rst3));
			end
			///////////////////////////////////////

adder_5bit count_down2(.in1(count_out2), .in2(-5'd1), .S(count2), .Cout());
square	squareone(.A(temp_square1), .CLK(CLK3), .RST(reset_mult), .result(square1), .overflow(o4), .underflow(u4), .enable(enaphu));

assign CLKphu = enaphu & CLK3;

always @(negedge CLK3 or negedge RST3)
begin
	temp_rst1 = enaphu?(~(enaphu^CLKphu)):1'b1;
	reset_mult = temp_rst1 & RST3;
end

always @(posedge CLKphu or negedge RST3)
begin
	if (~RST3)
	begin
		count_out2 <= root1;
		temp_square1 <= result1;
	end
	else
	begin
		count_out2 <= ena4?count2:count_out2;
		temp_square1 <= ena4?square1:temp_square1;
	end
end

always @(*)
begin
	ena4 = |(count_out2);
end

assign number1 = temp_square1;

///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
// Tính toán số thứ 2
///////////////////////////////////////////////////////////////////////

adder_9bit tinh_exponent_f1(.in1({1'b0,f1[30:23]}), .in2(-9'd127), .S(exp_real), .Cout());
compliment2_9bit tinh_negexp(.in(exp_real), .out(neg_exp));

assign exp_f1 = exp_real[8]?neg_exp[7:0]:exp_real[7:0];
assign f4 = exp_real[8]?32'h3F000000:32'h40000000;

// Tính toán nhân exp_f1 và f3

adder_8bit count_down_Expf1(.in1(count_out3), .in2(-8'd1), .S(count3), .Cout());
add_sub add_power_of_secondnumber(.A(sum), .B(f3), .checkequation(1'b0), .result(temp_sum), .overflow(o5), .underflow(u5));

always @(posedge CLK2 or negedge RST2)
begin
	if (~RST2)
	begin
		sum <= 32'b0;
		count_out3 <= exp_f1;
	end
	else
	begin
		sum <= ena5?temp_sum:sum;
		count_out3 <= ena5?count3:count_out3;
	end
end

always @(*) 
begin
	ena5 = (|(count_out3));
	stage3 = ~ena5;
end

////////////////////////////////////////

assign CLK4 = stage3 & CLK2;

factor_root so2(.fracin(sum), .check(f1_ST_1), .checkin(1'b1), .checkBin(checkso1), .checkout(),
				.factor(factor2), .root(root2), .over(over2));

			//////// RESET for SQUARE_M1
			adder_2bit RST_SQUARE_M2(.in1(count_rst5), .in2(-2'd1), .S(rst_5), .Cout());

			always @(posedge CLK4 or negedge RST)
			begin
				if (~RST)
				begin
					count_rst5 <= 2'b10;
					RST5 <= 1'b1&RST;
				end
				else
				begin
					count_rst5 <= ena7?rst_5:count_rst5;
					RST5 <= |rst_5;
				end
			end

			always @(*)
			begin
				ena7 = ~(&(count_rst5));
			end
			///////////////////////////////////////

adder_5bit count_down3(.in1(count_out4), .in2(-5'd1), .S(count4), .Cout());
square	square3(.A(temp_square2), .CLK(CLK4), .RST(reset_mult2), .result(square2), .overflow(o6), .underflow(u6), .enable(enaphu2));

assign CLKphu2 = enaphu2 & CLK4;

always @(negedge CLK4 or negedge RST5)
begin
	temp_rst2 = enaphu2?(~(enaphu2^CLKphu2)):1'b1;
	reset_mult2 = temp_rst2 & RST5;
end

always @(posedge CLKphu2 or negedge RST5)
begin
	if (~RST5)
	begin
		count_out4 <= root2;
		temp_square2 <= f4;
	end
	else
	begin
		count_out4 <= ena8?count4:count_out4;
		temp_square2 <= ena8?square2:temp_square2;
	end
end

always @(*)
begin
		stage4 = RST?(RST5?~ena8:1'b0):1'b0;
		ena8   = RST?(RST5?|(count_out4):1'b0):1'b0;
		next   = stage4?temp_square2:32'b0;
end

///////////////////////////////////////////////////////////////////////////////////////////
assign CLK5 = CLK4 & stage4;

			//////// RESET for POWER_M2
			adder_2bit RST_power_2(.in1(count_rst4), .in2(-2'd1), .S(rst_4), .Cout());

			always @(posedge CLK5 or negedge RST5)
			begin
				if (~RST5)
				begin
					count_rst4 <= 2'b10;
					RST4 <= 1'b1;
				end
				else
				begin
					count_rst4 <= ena6?rst_4:count_rst4;
					RST4 <= |rst_4;
				end
			end

			always @(*)
			begin
				ena6 = ~(&(count_rst4));
			end
			//////////////////////////////////////
			
			

power power_m2(.A(next), .B(factor2), .CLK(CLK5), .RST(RST4), .result(result2),
				.overflow(o7), .underflow(u7), .enable(ena_m2));

assign number2 = ena_m2?result2:32'h3f800000;

//////////////////////////////////////////////////////////////

assign CLK6 = CLK5 & ena_m2 & ~ena4;

			//////// RESET for final
			adder_2bit RST_FINAL(.in1(count_rst6), .in2(-2'd1), .S(rst_6), .Cout());

			always @(posedge CLK6 or negedge RST)
			begin
				if (~RST)
				begin
					count_rst6 <= 2'b10;
					RST6 <= 1'b1;
				end
				else
				begin
					count_rst6 <= ena9?rst_6:count_rst6;
					RST6 <= |rst_6;
				end
			end

			always @(*)
			begin
				ena9 = ~(&(count_rst6));
			end
			///////////////////////////////////////

mult final_mult(.A(number1), .B(number2), .CLK(CLK6), .RST(RST6), .result(temp_result), 
		.overflow(overflow1), .underflow(underflow), .enable());
		
assign overflow = (overflow1|over1|over2|o1|o2|o3|o4|o5|o6|o7);
assign underflow = u1|u2|u3|u4|u5|u6|u7;

export_result_nroot final_stage(.in1(A), .in2(B), .temp_result(temp_result), .result(result));
endmodule