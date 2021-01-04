module mult(A,B,CLK,RST,result,overflow,underflow);

input	[31:0]	A,B;
input			CLK,RST;
output	[31:0]	result;
output			overflow,underflow;

wire			sign_result,signA,signB;
wire	[4:0]	count,nshiftleft;
wire	[7:0]	exp_temp,exp_out,exp_result,expA,expB;
wire	[9:0]	shiftleftout,temp_exp,exp_add;
wire	[22:0]	frac_result;
wire	[23:0]	fracright_before_result,fracleft_before_result,fracA,fracB;
wire	[24:0]	Mneg,datasub,dataadd;

reg				ena,q,q0;
reg		[4:0]	count_out;
reg		[23:0]	frac_out;
reg		[24:0]	M,Q,A1,data_A;
reg		[49:0]	AQq,temp_fracCPA;

assign	signA = A[31];
assign	expA  = A[30:23];
assign	fracA = {1'b1,A[22:0]};
assign	signB = B[31];
assign	expB  = B[30:23];
assign	fracB = {1'b1,B[22:0]};

assign	sign_result = signA ^ signB;

adder_8bit	findadder(.in1(expA), .in2(-8'd127), .S(exp_temp), .Cout());
adder_8bit	adder_exponent(.in1(expB), .in2(exp_temp), .S(exp_out), .Cout());

////////////////////////////////////////////////////////////////////////////////////////////////

adder_5bit	add_count(.in1(count_out), .in2(-5'b1), .S(count), .Cout());

compliment2_25bit negM(.in(M), .out(Mneg));
adder_25bit sub_AM(.in1(A1), .in2(Mneg), .S(datasub), .Cout());
adder_25bit add_AM(.in1(A1), .in2(M), .S(dataadd), .Cout());

/////////////////////////
always @(*)
begin
	case ({Q[0],q})
		2'b10: data_A = datasub;
		2'b01: data_A = dataadd;
		default: data_A = A1;
	endcase
	AQq = {data_A[24],data_A,Q[24:1]};
	q0 = Q[0];
end

always @(posedge CLK or negedge RST)
begin
	if (!RST)
		begin
		M <= {1'b0,fracA};
		Q <= {1'b0,fracB};
		q <= 1'b0;
		A1 <= 25'b0;
		count_out <= 5'd25; 
		end
	else
		begin
		{A1,Q,q} <= ena?{AQq,q0}:{A1,Q,q};
		count_out <= ena?count:count_out;
		end
end

///////////////////////////////
always @(*)
begin
temp_fracCPA = {A1,Q};
frac_out = (~(|(count_out)))?temp_fracCPA[46:23]:24'b0;
ena	= |(count_out);
end
////////////////////////////////////////////////////////////////////////////////

find1 findbit1(.in(frac_out), .nshiftleft(nshiftleft));
shiftleft shift_fracl(.in(frac_out), .nshiftleft(nshiftleft), .out(fracleft_before_result));
shift_right shift_fracr(.in(frac_out), .nshift(5'b1), .out(fracright_before_result));

assign frac_result = temp_fracCPA[47]?fracright_before_result[22:0]:fracleft_before_result[22:0];

compliment2_10bit compli2_exponent(.in({5'b0,nshiftleft}),.out(shiftleftout));
assign exp_add = temp_fracCPA[47]?10'b1:shiftleftout;
adder_10bit	add_2(.in1(exp_add), .in2({2'b00,exp_out}), .S(temp_exp), .Cout());

assign underflow = temp_exp[9]&temp_exp[8];
assign overflow = ~temp_exp[9]&(temp_exp[8]|(&({temp_exp[7:0]})));

assign exp_result = temp_exp[8]?8'd0:temp_exp[7:0];

export_result export1(.in1(A), .in2(B), .temp_result({sign_result,exp_result,frac_result}), .result(result));

endmodule