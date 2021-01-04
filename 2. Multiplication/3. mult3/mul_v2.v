module MUL_v2(in1, in2, out);

input [31:0]in1,in2;
output  [31:0]out;

wire [23:0]exponent_tmp;
wire [23:0]exponent_tmp_sub_128;
wire      exponent_cout; //debug and testbench
wire      exponent_cout_sub_128; //debug and testbench

wire [48 :0] fraction_s; 
//wire [23 :0] fraction_cout;

wire    [31: 0] out_normal, out_special;
wire            check_special;

// Special Case
MUL_special_case     SP_MUL(.a(in1[31:0]), .b(in2[31:0]), .out(out_special[31:0]), .check_special(check_special));

// Normal Case
//FA_48  FRACTION_FA0 (.a(  {{(24 - 0  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[  0]}})            }), .b({48{1'b0}})           , .cin(1'b0),                 .s(fraction_s_tmp[  0]), .cout(fraction_cout[ 0 ]));
//FA_48  FRACTION_FA1 (.a(  {{(24 - 1  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[  1]}}),{  1{1'b0}}}), .b(fraction_s_tmp[ 0 ]), .cin(fraction_cout[ 0 ]), .s(fraction_s_tmp[  1]), .cout(fraction_cout[ 1 ]));
//FA_48  FRACTION_FA2 (.a(  {{(24 - 2  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[  2]}}),{  2{1'b0}}}), .b(fraction_s_tmp[ 1 ]), .cin(fraction_cout[ 1 ]), .s(fraction_s_tmp[  2]), .cout(fraction_cout[ 2 ]));
//FA_48  FRACTION_FA3 (.a(  {{(24 - 3  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[  3]}}),{  3{1'b0}}}), .b(fraction_s_tmp[ 2 ]), .cin(fraction_cout[ 2 ]), .s(fraction_s_tmp[  3]), .cout(fraction_cout[ 3 ]));
//FA_48  FRACTION_FA4 (.a(  {{(24 - 4  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[  4]}}),{  4{1'b0}}}), .b(fraction_s_tmp[ 3 ]), .cin(fraction_cout[ 3 ]), .s(fraction_s_tmp[  4]), .cout(fraction_cout[ 4 ]));
//FA_48  FRACTION_FA5 (.a(  {{(24 - 5  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[  5]}}),{  5{1'b0}}}), .b(fraction_s_tmp[ 4 ]), .cin(fraction_cout[ 4 ]), .s(fraction_s_tmp[  5]), .cout(fraction_cout[ 5 ]));
//FA_48  FRACTION_FA6 (.a(  {{(24 - 6  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[  6]}}),{  6{1'b0}}}), .b(fraction_s_tmp[ 5 ]), .cin(fraction_cout[ 5 ]), .s(fraction_s_tmp[  6]), .cout(fraction_cout[ 6 ]));
//FA_48  FRACTION_FA7 (.a(  {{(24 - 7  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[  7]}}),{  7{1'b0}}}), .b(fraction_s_tmp[ 6 ]), .cin(fraction_cout[ 6 ]), .s(fraction_s_tmp[  7]), .cout(fraction_cout[ 7 ]));
//FA_48  FRACTION_FA8 (.a(  {{(24 - 8  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[  8]}}),{  8{1'b0}}}), .b(fraction_s_tmp[ 7 ]), .cin(fraction_cout[ 7 ]), .s(fraction_s_tmp[  8]), .cout(fraction_cout[ 8 ]));
//FA_48  FRACTION_FA9 (.a(  {{(24 - 9  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[  9]}}),{  9{1'b0}}}), .b(fraction_s_tmp[ 8 ]), .cin(fraction_cout[ 8 ]), .s(fraction_s_tmp[  9]), .cout(fraction_cout[ 9 ]));
//FA_48 FRACTION_FA10 (.a(  {{(24 -10  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 10]}}),{ 10{1'b0}}}), .b(fraction_s_tmp[ 9 ]), .cin(fraction_cout[ 9 ]), .s(fraction_s_tmp[ 10]), .cout(fraction_cout[10 ]));
//FA_48 FRACTION_FA11 (.a(  {{(24 -11  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 11]}}),{ 11{1'b0}}}), .b(fraction_s_tmp[10 ]), .cin(fraction_cout[10 ]), .s(fraction_s_tmp[ 11]), .cout(fraction_cout[11 ]));
//FA_48 FRACTION_FA12 (.a(  {{(24 -12  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 12]}}),{ 12{1'b0}}}), .b(fraction_s_tmp[11 ]), .cin(fraction_cout[11 ]), .s(fraction_s_tmp[ 12]), .cout(fraction_cout[12 ]));
//FA_48 FRACTION_FA13 (.a(  {{(24 -13  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 13]}}),{ 13{1'b0}}}), .b(fraction_s_tmp[12 ]), .cin(fraction_cout[12 ]), .s(fraction_s_tmp[ 13]), .cout(fraction_cout[13 ]));
//FA_48 FRACTION_FA14 (.a(  {{(24 -14  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 14]}}),{ 14{1'b0}}}), .b(fraction_s_tmp[13 ]), .cin(fraction_cout[13 ]), .s(fraction_s_tmp[ 14]), .cout(fraction_cout[14 ]));
//FA_48 FRACTION_FA15 (.a(  {{(24 -15  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 15]}}),{ 15{1'b0}}}), .b(fraction_s_tmp[14 ]), .cin(fraction_cout[14 ]), .s(fraction_s_tmp[ 15]), .cout(fraction_cout[15 ]));
//FA_48 FRACTION_FA16 (.a(  {{(24 -16  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 16]}}),{ 16{1'b0}}}), .b(fraction_s_tmp[15 ]), .cin(fraction_cout[15 ]), .s(fraction_s_tmp[ 16]), .cout(fraction_cout[16 ]));
//FA_48 FRACTION_FA17 (.a(  {{(24 -17  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 17]}}),{ 17{1'b0}}}), .b(fraction_s_tmp[16 ]), .cin(fraction_cout[16 ]), .s(fraction_s_tmp[ 17]), .cout(fraction_cout[17 ]));
//FA_48 FRACTION_FA18 (.a(  {{(24 -18  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 18]}}),{ 18{1'b0}}}), .b(fraction_s_tmp[17 ]), .cin(fraction_cout[17 ]), .s(fraction_s_tmp[ 18]), .cout(fraction_cout[18 ]));
//FA_48 FRACTION_FA19 (.a(  {{(24 -19  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 19]}}),{ 19{1'b0}}}), .b(fraction_s_tmp[18 ]), .cin(fraction_cout[18 ]), .s(fraction_s_tmp[ 19]), .cout(fraction_cout[19 ]));
//FA_48 FRACTION_FA20 (.a(  {{(24 -20  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 20]}}),{ 20{1'b0}}}), .b(fraction_s_tmp[19 ]), .cin(fraction_cout[19 ]), .s(fraction_s_tmp[ 20]), .cout(fraction_cout[20 ]));
//FA_48 FRACTION_FA21 (.a(  {{(24 -21  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 21]}}),{ 21{1'b0}}}), .b(fraction_s_tmp[20 ]), .cin(fraction_cout[20 ]), .s(fraction_s_tmp[ 21]), .cout(fraction_cout[21 ]));
//FA_48 FRACTION_FA22 (.a(  {{(24 -22  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{in2[ 22]}}),{ 22{1'b0}}}), .b(fraction_s_tmp[21 ]), .cin(fraction_cout[21 ]), .s(fraction_s_tmp[ 22]), .cout(fraction_cout[22 ]));
//FA_48 FRACTION_FA23 (.a(  {{(24 -23  ){1'b0}},({{1{1'b1}},in1[22:0]}&{24{1'b1}}    ),{ 23{1'b0}}}), .b(fraction_s_tmp[22 ]), .cin(fraction_cout[22 ]), .s(fraction_s_tmp[ 23]), .cout(fraction_cout[23 ]));

mul_wallace_tree_24 mul(.in1({{1{1'b1}}, {in1[22:0]}}), .in2({{1{1'b1}}, {in2[22:0]}}), .out( fraction_s ));

FA_24  EXPONENT      (.a({ {16{1'b0}},   in1[30:23]}), .b({ {16{1'b0}},   in2[30:23]}), 
.cin(fraction_s[47]), .s(exponent_tmp), .cout(exponent_cout) );
FS_24  EXPONENT_SUB_128 (.a(exponent_tmp), .b(24'd127), .cin(1'b0), .out(exponent_tmp_sub_128), .cout(exponent_cout_sub_128));

assign	out_normal[22:0] = {23{fraction_s[47]}}&fraction_s[46:24] 
							| {23{!fraction_s[47]}}&fraction_s[45:23];
assign	out_normal[30:23] = exponent_tmp_sub_128[7:0];
assign	out_normal[31] = in1[31]^in2[31];

// Result
assign  out = ({32{!check_special}} & (out_normal)) | ({32{check_special}} & (out_special));

endmodule