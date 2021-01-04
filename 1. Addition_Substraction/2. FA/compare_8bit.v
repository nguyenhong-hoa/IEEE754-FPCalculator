module compare_8bit(in1, in2, nshift, in1_ST_in2, checktoobig);

input	[7:0]	in1,in2;
output	[4:0]	nshift;
output			in1_ST_in2,checktoobig;

wire	[8:0]	temp1,temp2,temp3,temp4;
wire	[7:0]	temp5,temp6;

assign	temp1 = {1'b0,in1};
assign	temp2 = {1'b0,in2};

compliment2_9bit compare_2exp(.in(temp2), .out(temp3));
adder_9bit	subtract_9bit(.in1(temp1), .in2(temp3), .S(temp4), .Cout());
compliment2_8bit change_exp(.in(temp4[7:0]), .out(temp5));

assign in1_ST_in2 = temp4[8];
assign temp6 = temp4[8]?temp5:temp4[7:0];

//Nếu data >24 thì số cộng quá lớn
assign checktoobig = temp6[7]|temp6[6]|temp6[5]|(temp6[4]&temp6[3]&(|temp6[2:0]));

assign nshift = checktoobig? 5'd0:temp6[4:0];

endmodule