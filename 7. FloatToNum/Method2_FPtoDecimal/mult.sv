`include "mult24.sv"
`include "adder.sv"
`include "find1.sv"
`include "complement2.sv"
`include "shiftleft24_mult.sv"
`include "shiftleft48_mult.sv"
`include "shift_right.sv"
`include "export_result.sv"
`include "checkspecial.sv"


module mult(A,B,result,overflow,underflow);

input	[31:0]	A,B;
output	[31:0]	result;
output			overflow,underflow;

logic			sign_result,signA,signB;
logic	[4:0]	nshiftleft;
logic	[7:0]	exp_temp,exp_out,exp_result,expA,expB;
logic	[9:0]	shiftleftout,temp_exp,exp_add;
logic	[22:0]	frac_result;
logic	[23:0]	fracright_before_result,fracleft_before_result,fracA,fracB;
logic	[47:0]	temp_fracCPA;

logic		[23:0]	frac_out;


assign	signA = A[31];
assign	expA  = A[30:23];
assign	fracA = {1'b1,A[22:0]};
assign	signB = B[31];
assign	expB  = B[30:23];
assign	fracB = {1'b1,B[22:0]}; // bit 1 mặc định và 23 bit fraction --> significands
//////////////////SEPARATE SIGN////////////////
//Xor: 
//sign_result 1bit: giống nhau = 0, khác nhau =1
assign	sign_result = signA ^ signB;
//////////////////ADD EXPONENT/////////////////
//Tìm exponentA
adder_8bit	findadder(.in1(expA), .in2(-8'd127), .S(exp_temp), .Cout());
//Cộng 2 exponent lại với nhau
//exp_out 8bit: tổng exponent
adder_8bit	adder_exponent(.in1(expB), .in2(exp_temp), .S(exp_out), .Cout());

////////////////////////MULTIPLE SIGNIFICANDS///////////////////////////////////////////////////

mult24 mul_significands(fracA,fracB,temp_fracCPA);

////////////////////////NORMALIZE///////////////////////////////////////////////////////
assign frac_out=temp_fracCPA[46:23]; //Lấy 24 bit frac sau phép nhân 24 bit
//Tìm vị trí bit 1 đầu tiên để chuẩn hóa
find1 findbit1(.in(frac_out), .nshiftleft(nshiftleft));
//Dịch trái 24 bit frac về dạng 1.xxx..... nếu frac_out có dạng 1,.... hoặc 0,.....
shiftleft24 shift_fracl(.in(frac_out), .nshiftleft(nshiftleft), .out(fracleft_before_result));
//Dịch phải nếu nó là dạng 10,....
shift_right shift_fracr(.in(frac_out), .nshift(5'b1), .out(fracright_before_result));

assign frac_result = temp_fracCPA[47]?fracright_before_result[22:0]:fracleft_before_result[22:0];
//Tính toán cộng thêm hay trừ đi exponent
complement2_10bit comple2_exponent(.in({5'b0,nshiftleft}),.out(shiftleftout));
//Nếu có dạng 10,.... thì 
assign exp_add = temp_fracCPA[47]?10'd1:shiftleftout;
adder_10bit	add_2(.in1(exp_add), .in2({2'b00,exp_out}), .S(temp_exp), .Cout());

//Xét xem có bị underflow hay overflow hay không
assign underflow = temp_exp[9]&temp_exp[8];
assign overflow = ~temp_exp[9]&(temp_exp[8]|(&({temp_exp[7:0]})));

//Xuất kết quả exponent
assign exp_result = temp_exp[8]?8'd0:temp_exp[7:0];

///////////////////////////////EXPORT/////////////////////////////////////

export_result_multiple export1(.in1(A), .in2(B), .temp_result({sign_result,exp_result,frac_result}), .result(result));
endmodule