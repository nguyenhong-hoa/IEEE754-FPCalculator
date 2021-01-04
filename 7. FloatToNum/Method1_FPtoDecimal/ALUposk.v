module ALUposk(CLK,RST,frac,exp,nguyen,le,lt);

input			CLK,RST;
input	[22:0]	frac;
input	[8:0]	exp;

output	[19:0]	le;
output	[4:0]	nguyen;
output	[8:0]	lt;

wire	[31:0]	number1,temp_result,number2;
wire	[27:0]	frac1;
wire	[8:0]	_2k,_3k,exp_temp,exp_out,temp_lt;
wire	[7:0]	exp1;
wire	[1:0]	rst_1;
wire			ena1,CLK2,ena2,CLK3;

reg		[1:0]	count_rst;
reg				RST2,ena3;

assign number1 = {1'b0,8'b01111111,frac};

assign _2k = {exp[7:0],1'b0};

adder_9bit tinh3k(.in1(_2k), .in2(exp), .S(_3k), .Cout());

power tinhmu3k(.A(32'h3E00E9F9), .B({15'b0,_3k}), .CLK(CLK), .RST(RST), .result(temp_result), 
				.overflow(), .underflow(), .enable(ena1)); //ok

assign CLK2 = CLK&ena1;

mult mult1(.A(number1), .B(temp_result), .CLK(CLK2), .RST(RST), .result(number2),
			.overflow(), .underflow(), .enable(ena2)); 

assign CLK3 = CLK2&ena2;

assign exp1  = number2[30:23];
assign frac1 = {5'b00001,number2[22:0]};

adder_9bit tinh_exp(.in1({1'b0,exp1}), .in2(-9'd127), .S(exp_temp), .Cout());
compliment2_9bit dao_exp(.in(exp_temp), .out(exp_out));

			//////// RESET for neg
			adder_2bit RST_SECOND(.in1(count_rst), .in2(-2'd1), .S(rst_1), .Cout());

			always @(posedge CLK3 or negedge RST)
			begin
				if (~RST)
				begin
					count_rst <= 2'b10;
					RST2 <= 1'b1;
				end
				else
				begin
					count_rst <= ena3?(rst_1):(count_rst);
					RST2 <= |rst_1;
				end
			end

			always @(*)
			begin
				ena3 = ~(&(count_rst));
			end
			///////////////////////////////////////

ALUnegk ALU1(.CLK(CLK3), .RST(RST2), .frac(frac1), .exp(exp_out), 
				.nguyen(nguyen), .le(le), .lt(temp_lt));

adder_9bit tinhlt(.in1(temp_lt), .in2(_3k), .S(lt), .Cout());

endmodule

