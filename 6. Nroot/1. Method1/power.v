module power(A,B,CLK,RST,result,overflow,underflow,enable);

input	[31:0]	A;
input	[23:0]	B;
input			CLK,RST;
output	[31:0]	result;
output			overflow,underflow,enable;

wire			signA,stage1,CLK2,ena,o1,o2,u1,u2;
wire	[7:0]	expA;
wire	[23:0]	fracA;
wire	[4:0]	count;
wire	[31:0]	temp_data,temp;

reg				temp_rst,reset_mult;
reg		[4:0]	count_out;
reg		[23:0]	temp_B;
reg		[31:0]	temp_mult,data;

assign	signA = A[31];
assign	expA  = A[30:23];
assign	fracA = {1'b1,A[22:0]};

////////////////////////////////////////////

mult mult_A(.A(data), .B(data) ,.CLK(CLK) , .RST(reset_mult) ,.result(temp_data), 
				.overflow(o1), .underflow(u1), .enable(stage1));
mult mult_B(.A(temp_mult), .B(data), .CLK(CLK), .RST(reset_mult), .result(temp), 
				.overflow(o2), .underflow(u2), .enable());
				
adder_5bit	countdown(.in1(count_out), .in2(-5'd1), .S(count), .Cout());

assign CLK2 = stage1&CLK;

always @(negedge CLK or negedge RST)
begin
	temp_rst = stage1?(~(stage1^CLK2)):1'b1;
	reset_mult = temp_rst & RST;
end

always @(posedge CLK2 or negedge RST)
begin
	if (~RST)
		begin
		temp_mult <= 32'b00111111100000000000000000000000;
		data <= A;
		count_out <= 5'd24;
		temp_B <= B;
		end
	else
		begin
		temp_mult <= ena?(temp_B[0]?temp:temp_mult):temp_mult;
		count_out <= ena?count:count_out;
		data <= ena?temp_data:data;
		temp_B <= ena?{1'b0,temp_B[23:1]}:temp_B;
		end
end

assign ena = |(count_out);
assign enable = ~ena;
///////////////////////////////////////////

assign overflow = o1|o2;
assign underflow = u1|u2;
assign result = temp_mult;

endmodule