module FPtoDec(in,nguyen,le,luythua);

input	[31:0]	in;
output	[3:0]	nguyen;
output	[9:0] 	le;
output	[5:0]	luythua;

reg		[31:0]	sub,sub1,sub2;

wire	[3:0]	temp_le1,temp_le2,temp_le3;
wire	[9:0]	so1,so2,so3,so4,so5,so6,s1,s2,s3,s4;
wire	[31:0]	temp_out1,temp_out2,temp_out3,temp_out4,temp_out5,temp_out6,temp_out7,temp_out8,temp_out9;

pos_exponent findint(.in(in),.nguyen(nguyen),.luythua(luythua),.out_float(temp_out1));

always @(*)
begin
	case(nguyen)
		4'd1:	sub = 32'h3F800000;
		4'd2:	sub = 32'h40000000;
		4'd3:	sub = 32'h40400000;
		4'd4:	sub = 32'h40800000;
		4'd5:	sub = 32'h40A00000;
		4'd6:	sub = 32'h40C00000;
		4'd7:	sub = 32'h40E00000;
		4'd8:	sub = 32'h41000000;
		4'd9:	sub = 32'h41100000;
		default: sub = 32'd0;
	endcase
end

add_sub	findf1_0(.A(temp_out1), .B(sub), .checkequation(1'b1), .result(temp_out2), .overflow() ,.underflow());
mult	findf1_1(.A(temp_out2), .B(32'h41200000), .result(temp_out3), .overflow(), .underflow());
pos_exponent findf1_2(.in(temp_out3),.nguyen(temp_le1),.luythua(),.out_float(temp_out4));

always @(*)
begin
	case(temp_le1)
		4'd1:	sub1 = 32'h3F800000;
		4'd2:	sub1 = 32'h40000000;
		4'd3:	sub1 = 32'h40400000;
		4'd4:	sub1 = 32'h40800000;
		4'd5:	sub1 = 32'h40A00000;
		4'd6:	sub1 = 32'h40C00000;
		4'd7:	sub1 = 32'h40E00000;
		4'd8:	sub1 = 32'h41000000;
		4'd9:	sub1 = 32'h41100000;
		default: sub1 = 32'd0;
	endcase
end

add_sub	findf1_3(.A(temp_out4), .B(sub1), .checkequation(1'b1), .result(temp_out5), .overflow() ,.underflow());
mult	findf1_4(.A(temp_out5), .B(32'h41200000), .result(temp_out6), .overflow(), .underflow());
pos_exponent findf1_5(.in(temp_out6),.nguyen(temp_le2),.luythua(),.out_float(temp_out7));

always @(*)
begin
	case(temp_le2)
		4'd1:	sub2 = 32'h3F800000;
		4'd2:	sub2 = 32'h40000000;
		4'd3:	sub2 = 32'h40400000;
		4'd4:	sub2 = 32'h40800000;
		4'd5:	sub2 = 32'h40A00000;
		4'd6:	sub2 = 32'h40C00000;
		4'd7:	sub2 = 32'h40E00000;
		4'd8:	sub2 = 32'h41000000;
		4'd9:	sub2 = 32'h41100000;
		default: sub2 = 32'd0;
	endcase
end

add_sub	findf1_6(.A(temp_out7), .B(sub2), .checkequation(1'b1), .result(temp_out8), .overflow() ,.underflow());
mult	findf1_7(.A(temp_out8), .B(32'h41200000), .result(temp_out9), .overflow(), .underflow());
pos_exponent findf1_8(.in(temp_out9),.nguyen(temp_le3),.luythua(),.out_float());

assign so1 = {temp_le1,6'b0};
assign so2 = {1'b0,temp_le1,5'b0};
assign so3 = {4'b0,temp_le1,2'b0};

assign so4 = {3'b0,temp_le2,3'b0};
assign so5 = {5'b0,temp_le2,1'b0};

assign so6 = {6'b0,temp_le3};

adder_10bit sum1(.in1(so1),.in2(so2),.S(s1),.Cout());
adder_10bit sum2(.in1(s1),.in2(so3),.S(s2),.Cout());
adder_10bit sum3(.in1(s2),.in2(so4),.S(s3),.Cout());
adder_10bit sum4(.in1(s3),.in2(so5),.S(s4),.Cout());
adder_10bit sum5(.in1(s4),.in2(so6),.S(le),.Cout());

endmodule