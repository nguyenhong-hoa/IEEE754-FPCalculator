module mult24(in1,in2,S);

input [23:0]in1,in2;
output [47:0]S;

logic [47:0]temp_in1;
logic [47:0]temp_mul[23:0],mul[22:0];

assign temp_in1 = {24'b0,in1};

assign temp_mul[0]=temp_in1&{48{in2[0]}}; //bit 0
//assign temp_mul0=temp_in1&{48{in2[0]}}; //bit0

shiftleft48 s1(temp_in1&{48{in2[1]}}, 1, temp_mul[1]);


shiftleft48 s2(temp_in1&{48{in2[2]}}, 2, temp_mul[2]);


shiftleft48 s3(temp_in1&{48{in2[3]}}, 3, temp_mul[3]);


shiftleft48 s4(temp_in1&{48{in2[4]}}, 4, temp_mul[4]);


shiftleft48 s5(temp_in1&{48{in2[5]}}, 5, temp_mul[5]);


shiftleft48 s6(temp_in1&{48{in2[6]}}, 6, temp_mul[6]);


shiftleft48 s7(temp_in1&{48{in2[7]}}, 7, temp_mul[7]);


shiftleft48 s8(temp_in1&{48{in2[8]}}, 8, temp_mul[8]);


shiftleft48 s9(temp_in1&{48{in2[9]}}, 9, temp_mul[9]);


shiftleft48 s10(temp_in1&{48{in2[10]}}, 10, temp_mul[10]);

shiftleft48 s11(temp_in1&{48{in2[11]}}, 11, temp_mul[11]);


shiftleft48 s12(temp_in1&{48{in2[12]}}, 12, temp_mul[12]);


shiftleft48 s13(temp_in1&{48{in2[13]}}, 13, temp_mul[13]);


shiftleft48 s14(temp_in1&{48{in2[14]}}, 14, temp_mul[14]);


shiftleft48 s15(temp_in1&{48{in2[15]}}, 15, temp_mul[15]);


shiftleft48 s16(temp_in1&{48{in2[16]}}, 16, temp_mul[16]);


shiftleft48 s17(temp_in1&{48{in2[17]}}, 17, temp_mul[17]);


shiftleft48 s18(temp_in1&{48{in2[18]}}, 18, temp_mul[18]);


shiftleft48 s19(temp_in1&{48{in2[19]}}, 19, temp_mul[19]);


shiftleft48 s20(temp_in1&{48{in2[20]}}, 20, temp_mul[20]);


shiftleft48 s21(temp_in1&{48{in2[21]}}, 21, temp_mul[21]);


shiftleft48 s22(temp_in1&{48{in2[22]}}, 22, temp_mul[22]);

shiftleft48 s23(temp_in1&{48{in2[23]}}, 23, temp_mul[23]);

adder_48bit adder_48bit1(temp_mul[0], temp_mul[1], mul[1]);
adder_48bit adder_48bit2(mul[1],temp_mul[2],mul[2]);
adder_48bit adder_48bit3(mul[2],temp_mul[3],mul[3]);
adder_48bit adder_48bit4(mul[3],temp_mul[4],mul[4]);
adder_48bit adder_48bit5(mul[4],temp_mul[5],mul[5]);
adder_48bit adder_48bit6(mul[5],temp_mul[6],mul[6]);
adder_48bit adder_48bit7(mul[6],temp_mul[7],mul[7]);
adder_48bit adder_48bit8(mul[7],temp_mul[8],mul[8]);
adder_48bit adder_48bit9(mul[8],temp_mul[9],mul[9]);
adder_48bit adder_48bit10(mul[9],temp_mul[10],mul[10]);
adder_48bit adder_48bit11(mul[10],temp_mul[11],mul[11]);
adder_48bit adder_48bit12(mul[11],temp_mul[12],mul[12]);
adder_48bit adder_48bit13(mul[12],temp_mul[13],mul[13]);
adder_48bit adder_48bit14(mul[13],temp_mul[14],mul[14]);
adder_48bit adder_48bit15(mul[14],temp_mul[15],mul[15]);
adder_48bit adder_48bit16(mul[15],temp_mul[16],mul[16]);
adder_48bit adder_48bit17(mul[16],temp_mul[17],mul[17]);
adder_48bit adder_48bit18(mul[17],temp_mul[18],mul[18]);
adder_48bit adder_48bit19(mul[18],temp_mul[19],mul[19]);
adder_48bit adder_48bit20(mul[19],temp_mul[20],mul[20]);
adder_48bit adder_48bit21(mul[20],temp_mul[21],mul[21]);
adder_48bit adder_48bit22(mul[21],temp_mul[22],mul[22]);
adder_48bit adder_48bit23(mul[22],temp_mul[23],S);


endmodule
