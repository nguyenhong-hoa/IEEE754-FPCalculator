module div(A,B,CLK,RST,result,overflow,underflow,enable);

input	[31:0]	A,B;
input			CLK,RST;
output	[31:0]	result;
output			overflow,underflow,enable;

wire			sign_result,signA,signB;
wire	[4:0]	nshiftleft;
wire	[5:0]	count;
wire	[7:0]	exp_temp,exp_temp2,exp_out,exp_result,expA,expB;
wire	[9:0]	shiftleftout,temp_exp;
wire	[22:0]	frac_result;
wire	[23:0]	fracleft_before_result,fracA,fracB;
wire	[48:0]	Mneg;
wire	[47:0]	fracA1,fracB1;

reg				ena,q;
reg		[5:0]	count_out;
reg		[23:0]	frac_out;
reg		[47:0]	Q;
reg		[48:0]	M,A1,dataA,temp_A,dataAout;
reg		[96:0]	AQq;

assign	signA = A[31];
assign	expA  = A[30:23];
assign	fracA = {1'b1,A[22:0]};
assign	signB = B[31];
assign	expB  = B[30:23];
assign	fracB = {1'b1,B[22:0]};

assign	sign_result = signA ^ signB;

adder_8bit	findadder(.in1(expB), .in2(-8'd127), .S(exp_temp), .Cout());
compliment2_8bit compliexp(.in(exp_temp), .out(exp_temp2));
adder_8bit	adder_exponent(.in1(expA), .in2(exp_temp2), .S(exp_out), .Cout());

/////////////////////////////////////////////////////////////////////////////////////////

compliment2_49bit compliM(.in(M), .out(Mneg));

adder_49bit AM(.in1(dataA), .in2(Mneg), .S(temp_A), .Cout());
adder_6bit countdown(.in1(count_out), .in2(-6'd1), .S(count), .Cout());

assign fracA1 = {fracA,24'B0};
assign fracB1 = {24'b0,fracB};

always @(*)
begin
	AQq = {A1[47:0],Q,q};
	dataA = AQq[96:48];
	q = ~temp_A[48];
	dataAout = temp_A[48]?dataA:temp_A;
end

always @(posedge CLK or negedge RST)
begin
	if (!RST)
		begin
		Q <= fracA1;
		M <= {1'b0,fracB1};
		A1 <= 49'b0;
		count_out <= 6'd48; 
		end
	else
		begin
		A1 <= ena?dataAout:A1;
		Q <= ena?AQq[47:0]:Q;
		count_out <= ena?count:count_out;
		end
end


always @(*)
begin
frac_out = (~(|(count_out)))?Q[24:1]:24'b0;
ena	= |(count_out);
enable =~ena;
end

//////////////////////////////////////////////////////////////////////////////

find1 findbit1(.in(frac_out), .nshiftleft(nshiftleft));
shiftleft shift_fracl(.in(frac_out), .nshiftleft(nshiftleft), .out(fracleft_before_result));

assign frac_result = fracleft_before_result[22:0];
compliment2_10bit compli2_exponent(.in({5'b0,nshiftleft}),.out(shiftleftout));

adder_10bit	add_2(.in1({2'b00,exp_out}), .in2(shiftleftout), .S(temp_exp), .Cout());
assign underflow = temp_exp[9]&temp_exp[8];
assign overflow = ~temp_exp[9]&(temp_exp[8]|(&({temp_exp[7:0]})));

assign exp_result = temp_exp[8]?8'd0:temp_exp[7:0];

export_result export1(.in1(A), .in2(B), .temp_result({sign_result,exp_result,frac_result}), .result(result));

endmodule