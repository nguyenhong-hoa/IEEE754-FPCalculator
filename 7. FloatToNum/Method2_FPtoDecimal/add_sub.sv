`include "compare_8bit.sv"
`include "mux.sv"
`include "shift_right.sv"
`include "complement2.sv"
`include "adder.sv"
`include "shiftleft.sv"
`include "export_result.sv"
`include "find1.sv"

module add_sub(A,B,checkequation,result,overflow,underflow);
//Mô tả ngõ vào
input	[31:0]	A,B;
input			checkequation;			//bit phép tính
output			overflow,underflow;
output	[31:0]	result;

logic 			signA,signB,exA_ST_exB,checktoobig,checkzero;
logic 	[4:0]	nshift,nshiftleft;
logic 	[7:0]	expA,expB,exp_out,exp_result;
logic 	[9:0]	temp_exp,shiftleftout,temp_shiftleftout;
logic 	[22:0]	frac_result;
logic 	[23:0]	fracA,fracB;
logic 	[24:0]	frac_out1,frac_out2,frac_out3,frac1,frac3,frac,frac_out,frac_before_result,frac_before_result2;
logic 	[25:0]	frac1_beforeadd,frac2_beforeadd,frac_afteradd;

//Trích xuất sign, exponent, frac
assign	signA	= A[31];
assign	signB	= B[31]^checkequation;
assign	expA	= A[30:23];
assign	expB	= B[30:23];
assign	fracA	= {1'B1,A[22:0]};
assign	fracB	= {1'B1,B[22:0]};

//So sánh 2 exponent 
//Kết quả output:
//nshift - Chênh lệch giữa 2 exponent
//exA_ST_exB - 1: Nếu exA < exB, 0 nếu ngược lại
//checktoobig - Nếu chênh lệch >=25 thì xem như quá lớn bỏ qua luôn
compare_8bit compare_expAandexpB(.in1(expA), .in2(expB), .nshift(nshift), .in1_ST_in2(exA_ST_exB), .checktoobig(checktoobig));

//Xuất exponent lớn hơn
mux_8bit select_exponent(.in1(expA), .in2(expB), .select(exA_ST_exB), .out(exp_out));

//Chọn frac dịch và không dịch
//Nếu exA_ST_exB = 1 --> exB lớn hơn --> B không cần dịch
//frac_out1 25bit: S (bit dấu) + bit 1 mặc định + 23 bit Fracction
mux_25bit find_fraction_noshift(.in1({signA,fracA}), .in2({signB,fracB}), .select(exA_ST_exB), .out(frac_out1));
//Ngược lại
//frac_out2 25bit: frac dich
mux_25bit find_fraction_shift(.in1({signB,fracB}), .in2({signA,fracA}), .select(exA_ST_exB), .out(frac_out2));
//Dịch significand
//Kết quả output:
//frac_out3 - 25 bit significand đã được dịch sao cho 2 exponend là bằng nhau
shift_right shift_fraction(.in(frac_out2), .nshift(nshift), .out(frac_out3));

//Nếu là số âm thì thực hiện bù 2
//frac1 25bit: bù 2 của 24 bit frac_out1 (không có bit dấu S)
//frac3 25bit: bù 2 của 24 bit frac_out3 
complement2_25bit compli2_fraction1(.in({1'b0,frac_out1[23:0]}), .out(frac1));
complement2_25bit compli2_fraction2(.in({1'b0,frac_out3[23:0]}), .out(frac3));
//Lấy ra 2 số 26bit để tính tổng (26 bit vì mình không dùng Cout)
//Nếu frac_out1 là số âm thì thêm bit 1 vô trước, dương thì thêm bit 0
assign frac1_beforeadd = frac_out1[24]?{1'b1,frac1}:{2'b00,frac_out1[23:0]};
assign frac2_beforeadd = frac_out2[24]?{1'b1,frac3}:{2'b00,frac_out3[23:0]};

//Thực hiện tính toán cộng 2 số frac
//frac_afteradd 26bit: kết quả của việt tính tổng 2 fraction
adder_26bit add_1(.in1(frac1_beforeadd), .in2(frac2_beforeadd), .S(frac_afteradd), .Cout());
//frac_out 25bit: Lấy bù 2 của 25bit frac_afteradd (bỏ qua bit dấu)
complement2_25bit compli_frac(.in(frac_afteradd[24:0]), .out(frac_out));
//frac 25bit: Xét bit dấu để chọn 25 bit kết quả 
assign frac = frac_afteradd[25]?frac_out:frac_afteradd[24:0];
//Dấu
assign sign_result = frac_afteradd[25];

//Tìm vị trí số 1 dầu tiên từ bit[23] qua phải
find1	find_1_in_frac(.in(frac), .nshiftleft(nshiftleft), .checkzero(checkzero));
//Dich trai frac nshiftleft nếu kết quả là 1,.... hoặc 0,....
//frac_before_result 25 bit: kết quả đã được dịch về dạng 1,....
shiftleft shift_frac(.in(frac), .nshiftleft(nshiftleft), .out(frac_before_result));

//Trường hợp số 1 nằm vì trị 24
//Trường hợp kết quả là 10,.....
shift_right shift_fraction1(.in(frac), .nshift(5'd1), .out(frac_before_result2));

assign frac_result = frac[24]?frac_before_result2[22:0]:frac_before_result[22:0];

complement2_10bit compli2_exponent(.in({5'b0,nshiftleft}),.out(temp_shiftleftout));

assign shiftleftout = frac[24]?10'b1:temp_shiftleftout;

//Chuẩn hóa exponent
adder_10bit	add_2(.in1(shiftleftout), .in2({2'b00,exp_out}), .S(temp_exp), .Cout());

assign underflow = temp_exp[9]&temp_exp[8];
assign overflow = ~temp_exp[9]&(temp_exp[8]|(&({temp_exp[7:0]})));

assign exp_result = temp_exp[8]?8'd0:(checkzero?8'd0:temp_exp[7:0]);

export_result_addsub export1(.in1(A), .in2({signB,B[30:0]}), .temp_result({sign_result,exp_result,frac_result}), .toobig({exA_ST_exB,checktoobig}), .result(result));

endmodule