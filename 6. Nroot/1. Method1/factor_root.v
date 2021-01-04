module factor_root(fracin,check, checkin,checkBin, factor, root,over,checkout);

input	[31:0]	fracin;
input			checkin,check,checkBin;
output	[23:0]	factor;
output	[4:0]	root;
output			over,checkout;

wire			sign,smaller_24,bigger23,checkB;
wire	[4:0]	shiftright,root;
wire	[7:0]	exp;
wire	[8:0]	exp_temp1,exp_temp2,exp_temp3;
wire	[23:0]	frac,factor;
wire	[24:0]	frac_before;

reg		[8:0]	sbt;
reg		[4:0]	root1;
reg		[23:0]	frac1,frac2;

assign	sign = fracin[31];
assign	exp  = fracin[30:23];
assign	frac = {1'b1,fracin[22:0]};

//Tinh gia tri real exponent
adder_9bit expreal(.in1({1'b0,exp}), .in2(-9'd127), .S(exp_temp1), .Cout());

//Xem e có lớn hơn 6 không
assign bigger23 = ~exp_temp1[8]&((~(|exp_temp1[7:5])&exp_temp1[4]&exp_temp1[3] | (|exp_temp1[7:5])));
assign over = bigger23;

//Tính -e
compliment2_9bit negexp(.in(exp_temp1) ,.out(exp_temp2));

//Nếu e < 0 thì dịch 1 đoạn shiftright nếu (-e) > 24 thì dịch 1 đoạn 24 còn không dịch theo -e
assign smaller_24 = ~exp_temp2[8]&((~(|exp_temp2[7:5])&exp_temp2[4]&exp_temp2[3]&(|exp_temp2[2:0]) | (|exp_temp2[7:5])));
assign shiftright = smaller_24?5'd24:exp_temp2[4:0];

//Dịch frac
shift_right_add dichphai(.in({1'b0,frac}), .nshift(shiftright), .out(frac_before));

assign checkB = checkin?checkBin:~exp_temp1[8];

always @(*)
begin
case({checkB,check})
2'b00:
	begin
	sbt = 9'd5;
	root1 = 5'd6;
	frac1 = {17'b0,frac_before[23:17]};
	frac2 = {18'b0,frac[23:18]};
	end
2'b01:
	begin
	sbt = 9'd6;
	root1 = 5'd3;
	frac1 = {20'b0,frac_before[23:20]};
	frac2 = {17'b0,frac[23:17]};
	end
2'b10:
	begin
	sbt = 9'd21;
	root1 = 5'd3;
	frac1 = {20'b0,frac_before[23:20]};
	frac2 = {2'b0,frac[23:2]};
	end
2'b11:
	begin
	sbt = 9'd5;
	root1 = 5'd5;
	frac1 = {18'b0,frac_before[23:18]};
	frac2 = {18'b0,frac[23:18]};
	end
endcase
end

//Tính số lần căn 6 - e nếu e dương
adder_9bit solancan(.in1(exp_temp2), .in2(sbt), .S(exp_temp3), .Cout());

//Tính số lan lấy căn 2
assign root = exp_temp1[8]?root1:exp_temp3[4:0];

//Tính số mũ
assign factor = exp_temp1[8]?frac1:frac2;

assign checkout = ~exp_temp1[8];
endmodule