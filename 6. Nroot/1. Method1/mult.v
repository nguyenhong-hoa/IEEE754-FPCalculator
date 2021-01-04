module mult(A,B,CLK,RST,result,overflow,underflow,enable);

input	[31:0]	A,B;
input			CLK,RST;
output	[31:0]	result;
output			overflow,underflow,enable;

wire			sign_result,signA,signB;
wire	[4:0]	count,nshiftleft;
wire	[7:0]	exp_temp,exp_out,exp_result,expA,expB;
wire	[9:0]	shiftleftout,temp_exp,exp_add;
wire	[22:0]	frac_result;
wire	[23:0]	fracright_before_result,fracleft_before_result,fracA,fracB,temp_add;
wire	[47:0]	temp_fracCPA;

reg				temp_and,ena,enable;
reg		[4:0]	count_out;
reg		[23:0]	temp_fracA,frac_out;
reg		[47:0]	temp_frac;


assign	signA = A[31];
assign	expA  = A[30:23];
assign	fracA = {1'b1,A[22:0]};
assign	signB = B[31];
assign	expB  = B[30:23];
assign	fracB = {1'b1,B[22:0]};

assign	sign_result = signA ^ signB;

adder_8bit	findadder(.in1(expA), .in2(-8'd127), .S(exp_temp), .Cout());
adder_8bit	adder_exponent(.in1(expB), .in2(exp_temp), .S(exp_out), .Cout());

//////////////////////////////////////////////////////////////////////////////////////////////

assign temp_add = ({24{temp_and}}&fracB);

adder_48bit	add_frac(.in1({24'b0,temp_add}), .in2(temp_frac), .S(temp_fracCPA), .Cout());

adder_5bit	add_count(.in1(count_out), .in2(-5'b1), .S(count), .Cout());

always @(posedge CLK or negedge RST)
begin
if (!RST)
	begin
	temp_fracA 	<= fracA;
	temp_frac 	<= 48'b0;
	temp_and 	<= 1'b0;
	count_out 	<= 5'd24;
	enable 		<= 1'b0;
	end
else
	begin
	count_out 	<= ena?count:count_out;
	temp_fracA 	<= ena?{temp_fracA[22:0],1'b0}:temp_fracA;
	temp_and 	<= ena?temp_fracA[23]:temp_and;
	temp_frac 	<= ena?{temp_fracCPA[46:0],1'b0}:temp_frac;
	enable 		<= ~ena;
	end
end

always @(*)
begin
frac_out = (~(|(count_out)))?temp_fracCPA[46:23]:24'b0;
ena	= (|(count_out));
end

////////////////////////////////////////////////////////////////////////////////////////////////////

find1 findbit1(.in(frac_out), .nshiftleft(nshiftleft));
shiftleft_mult shift_fracl(.in(frac_out), .nshiftleft(nshiftleft), .out(fracleft_before_result));
shift_right_mult shift_fracr(.in(frac_out), .nshift(5'b1), .out(fracright_before_result));

assign frac_result = temp_fracCPA[47]?fracright_before_result[22:0]:fracleft_before_result[22:0];

compliment2_10bit compli2_exponent(.in({5'b0,nshiftleft}),.out(shiftleftout));

assign exp_add = temp_fracCPA[47]?10'b1:shiftleftout;
adder_10bit	add_2(.in1(exp_add), .in2({2'b00,exp_out}), .S(temp_exp), .Cout());

assign underflow = temp_exp[9]&temp_exp[8];
assign overflow = ~temp_exp[9]&(temp_exp[8]|(&({temp_exp[7:0]})));

assign exp_result = temp_exp[8]?8'd0:temp_exp[7:0];

export_result_mult export1(.in1(A), .in2(B), .temp_result({sign_result,exp_result,frac_result}), .result(result));
endmodule