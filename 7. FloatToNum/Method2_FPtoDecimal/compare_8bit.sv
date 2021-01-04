module compare_8bit(in1, in2, nshift, in1_ST_in2, checktoobig);

input	[7:0]	in1,in2;
output	[4:0]	nshift;
output			in1_ST_in2,checktoobig;

logic 	[8:0]	temp1,temp2,temp3,temp4;
logic 	[7:0]	temp5,temp6;

assign	temp1 = {1'b0,in1};
assign	temp2 = {1'b0,in2};
//Vi exponent 8bit nen ket qua ra co the laf 9bit
//Thuc hien dieu nay de tinh toan cho phep nhan luon (Sau nay lam phep nhan se ro)
complement2_9bit compare_2exp(.in(temp2), .out(temp3));
//thuc hien tru exponent da duoc them bit 0
//Ket qua thu duoc tong la temp4
adder_9bit	subtract_9bit(.in1(temp1), .in2(temp3), .S(temp4), .Cout());
//Lay bu 2 cua ket qua phep tru 2 exponent
//De cho ra ket qua neu ex1 < ex2
complement2_8bit change_exp(.in(temp4[7:0]), .out(temp5));
//ket qua so sanh 2 exponent 
//1: ex1 < ex2; 0: ex1 > ex2
assign in1_ST_in2 = temp4[8];
//Su dung bo mux de lay so checnh lech giua 2 exponent
assign temp6 = temp4[8]?temp5:temp4[7:0];
//Nếu chenh lech >24 thì số cộng quá lớn nen coi nhu la khong co su thay doi
assign checktoobig = temp6[7]|temp6[6]|temp6[5]|(temp6[4]&temp6[3]&(|temp6[2:0]));
//vi co checktobig nen chi can dich toi da la 5 bit (32) la du
assign nshift = checktoobig? 5'd0:temp6[4:0];

endmodule