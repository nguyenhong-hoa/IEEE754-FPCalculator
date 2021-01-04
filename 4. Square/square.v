module square(A,CLK,RST,result,overflow,underflow,enable);

input	[31:0]	A;
input			CLK,RST;
output	[31:0]	result;
output			overflow,underflow,enable;

wire			sign_result,signA,stage1,CLK2,stage2,CLK3,stage3,ena;
wire	[1:0]	rst_5,rst_4;
wire	[4:0]	nshiftleft;
wire	[7:0]	exp_temp,exp_temp2,exp_out,exp_result,expA;
wire	[9:0]	shiftleftout,temp_exp,exp_add;
wire	[22:0]	frac_result;
wire	[23:0]	fracleft_before_result,fracA,frac_out,frac_out1,frac_temp,x,x2,x3,x1out,x2out,
				x2out2,x3out,s1,s2,_5x,_5x4,_7x2,_7x5,x4out,x5out,x4out2,s3,s12,_2x,_4x,_2x2,_4x2,_6x2;

reg				ena7,enable,RST4,ena6;
reg		[1:0]	count_rst5,count_rst4;


assign	signA = A[31];
assign	expA  = A[30:23];
assign	fracA = {1'b1,A[22:0]};
assign	x	  = {1'b0,A[22:0]};
assign	sign_result = signA;

adder_8bit	findadder(.in1(expA), .in2(-8'd127), .S(exp_temp), .Cout());
assign exp_temp2 = {1'b0,exp_temp[7:1]}; 
adder_8bit	adder_exponent(.in1(exp_temp2), .in2(8'd127), .S(exp_out), .Cout());

/////////////////////////////////////////////////////
adder_24bit tinh2x(.in1(x), .in2(x), .S(_2x), .Cout());
adder_24bit tinh4x(.in1(_2x), .in2(_2x), .S(_4x), .Cout());
adder_24bit tinh5x(.in1(_4x), .in2(x), .S(_5x), .Cout());

mult  tinhx2(.CLK(CLK), .RST(RST), .A(x), .B(x), .out(x2), .enaout(stage1));

assign CLK2 = CLK & stage1;

adder_24bit tinh2x2(.in1(x2), .in2(x2), .S(_2x2), .Cout());
adder_24bit tinh4x2(.in1(_2x2), .in2(_2x2), .S(_4x2), .Cout());
adder_24bit tinh6x2(.in1(_4x2), .in2(_2x2), .S(_6x2), .Cout());
adder_24bit tinh7x2(.in1(_6x2), .in2(x2), .S(_7x2), .Cout());

mult  tinhx3(.CLK(CLK2), .RST(RST), .A(x), .B(x2), .out(x3), .enaout(stage2));

assign CLK3 = CLK2&stage2;
			//////// RESET for SQUARE_M1
			adder_2bit RST_SQUARE(.in1(count_rst4), .in2(-2'd1), .S(rst_4), .Cout());

			always @(posedge CLK3 or negedge RST)
			begin
				if (~RST)
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
			///////////////////////////////////////
mult  tinhx4(.CLK(CLK3), .RST(RST4), .A(_5x), .B(x3), .out(_5x4), .enaout());
mult  tinhx5(.CLK(CLK3), .RST(RST4), .A(x3), .B(_7x2), .out(_7x5), .enaout(stage3));

assign x1out = {1'b0,x[23:1]};
assign x2out = {3'b0,x2[23:3]};
assign x3out = {4'b0,x3[23:4]};
assign x4out = {7'b0,_5x4[23:7]};
assign x5out = {8'b0,_7x5[23:8]};

compliment2_24bit complix2(.in(x2out), .out(x2out2));
compliment2_24bit complix4(.in(x4out), .out(x4out2));

adder_24bit add1(.in1(24'h800000), .in2(x1out), .S(s1), .Cout());
adder_24bit add2(.in1(x2out2), .in2(x3out), .S(s2), .Cout());
adder_24bit add3(.in1(x4out2), .in2(x5out), .S(s3), .Cout());
adder_24bit add4(.in1(s1), .in2(s2), .S(s12), .Cout());
adder_24bit add5(.in1(s3), .in2(s12),.S(frac_temp), .Cout());

assign CLK4 = CLK3 & stage3;
mult  tinh_exp_le(.CLK(CLK4), .RST(RST), .A(24'b101101010000010011110011), .B(frac_temp), .out(frac_out1), .enaout(ena));
			//////// WAIT for enable
			adder_2bit RST_SQUARE_M2(.in1(count_rst5), .in2(-2'd1), .S(rst_5), .Cout());
			assign CLKphu = CLK4 & ena;
			always @(posedge CLKphu or negedge RST)
			begin
				if (~RST)
				begin
					count_rst5 <= 2'b10;
					enable <= 1'b0;
				end
				else
				begin
					count_rst5 <= ena7?rst_5:count_rst5;
					enable <= ena7?1'b0:1'b1;
				end
			end

			always @(*)
			begin
				ena7 = (|(count_rst5));
			end
			///////////////////////////////////////
///////////////////////////////////////////////////////

assign frac_out = exp_temp[0]?frac_out1:frac_temp;

find1 findbit1(.in(frac_out), .nshiftleft(nshiftleft));
shiftleft  shift_fracl(.in(frac_out), .nshiftleft(nshiftleft), .out(fracleft_before_result));

assign frac_result = fracleft_before_result[22:0];
compliment2_10bit compli2_exponent(.in({5'b0,nshiftleft}),.out(shiftleftout));

assign exp_add = shiftleftout;
adder_10bit	add_2(.in1(exp_add), .in2({2'b00,exp_out}), .S(temp_exp), .Cout());

assign underflow = temp_exp[9]&temp_exp[8];
assign overflow = ~temp_exp[9]&(temp_exp[8]|(&({temp_exp[7:0]})));

assign exp_result = temp_exp[8]?8'd0:temp_exp[7:0];

export_result  export1(.in1(A), .negcheck(A[31]), .temp_result({sign_result,exp_result,frac_result}), 
							.result(result));

endmodule