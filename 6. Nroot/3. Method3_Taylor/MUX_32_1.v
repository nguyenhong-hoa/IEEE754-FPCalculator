
module MUX_32_1(
	select,
	in,
	out
);

input [4:0] select;
input [31:0] in;
output out;

wire [4:0] select;
wire [31:0] in;
wire [31:0]tmp;
wire [4:0] tceles;

// always @(select,in) begin
assign tmp[0] =  in[0] &(~select[4] )& (~select[3] )& (~select[2] )&(~select[1] )& (~select[0] );
assign tmp[1 ] = in[1 ]&(~select[4] )& (~select[3] )& (~select[2] )&(~select[1] )& ( select[0] );
assign tmp[2 ] = in[2 ]&(~select[4] )& (~select[3] )& (~select[2] )&(select[1] )& (~select[0] );
assign tmp[3 ] = in[3 ]&(~select[4] )& (~select[3] )& (~select[2] )&(select[1] )& ( select[0] );
assign tmp[4 ] = in[4 ]&(~select[4] )& (~select[3] )& (select[2] )&(~select[1] )& (~select[0] );
assign tmp[5 ] = in[5 ]&(~select[4] )& (~select[3] )& (select[2] )&(~select[1] )& ( select[0] );
assign tmp[6 ] = in[6 ]&(~select[4] )& (~select[3] )& (select[2] )&(select[1] )& (~select[0] );
assign tmp[7 ] = in[7 ]&(~select[4] )& (~select[3] )& (select[2] )&(select[1] )& ( select[0] );
assign tmp[8 ] = in[8 ]&(~select[4] )& (select[3] )& (~select[2] )&(~select[1] )& (~select[0] );
assign tmp[9 ] = in[9 ]&(~select[4] )& (select[3] )& (~select[2] )&(~select[1] )& ( select[0] );
assign tmp[10] = in[10]&(~select[4] )& (select[3] )& (~select[2] )&(select[1] )& (~select[0] );
assign tmp[11] = in[11]&(~select[4] )& (select[3] )& (~select[2] )&(select[1] )& ( select[0] );
assign tmp[12] = in[12]&(~select[4] )& (select[3] )& (select[2] )&(~select[1] )& (~select[0] );
assign tmp[13] = in[13]&(~select[4] )& (select[3] )& (select[2] )&(~select[1] )& ( select[0] );
assign tmp[14] = in[14]&(~select[4] )& (select[3] )& (select[2] )&(select[1] )& (~select[0] );
assign tmp[15] = in[15]&(~select[4] )& (select[3] )& (select[2] )&(select[1] )& ( select[0] );
assign tmp[16] = in[16]&(select[4] )& (~select[3] )& (~select[2] )&(~select[1] )& (~select[0] );
assign tmp[17] = in[17]&(select[4] )& (~select[3] )& (~select[2] )&(~select[1] )& ( select[0] );
assign tmp[18] = in[18]&(select[4] )& (~select[3] )& (~select[2] )&(select[1] )& (~select[0] );
assign tmp[19] = in[19]&(select[4] )& (~select[3] )& (~select[2] )&(select[1] )& ( select[0] );
assign tmp[20] = in[20]&(select[4] )& (~select[3] )& (select[2] )&(~select[1] )& (~select[0] );
assign tmp[21] = in[21]&(select[4] )& (~select[3] )& (select[2] )&(~select[1] )& ( select[0] );
assign tmp[22] = in[22]&(select[4] )& (~select[3] )& (select[2] )&(select[1] )& (~select[0] );
assign tmp[23] = in[23]&(select[4] )& (~select[3] )& (select[2] )&(select[1] )& ( select[0] );
assign tmp[24] = in[24]&(select[4] )& (select[3] )& (~select[2] )&(~select[1] )& (~select[0] );
assign tmp[25] = in[25]&(select[4] )& (select[3] )& (~select[2] )&(~select[1] )& ( select[0] );
assign tmp[26] = in[26]&(select[4] )& (select[3] )& (~select[2] )&(select[1] )& (~select[0] );
assign tmp[27] = in[27]&(select[4] )& (select[3] )& (~select[2] )&(select[1] )& ( select[0] );
assign tmp[28] = in[28]&(select[4] )& (select[3] )& (select[2] )&(~select[1] )& (~select[0] );
assign tmp[29] = in[29]&(select[4] )& (select[3] )& (select[2] )&(~select[1] )& ( select[0] );
assign tmp[30] = in[30]&(select[4] )& (select[3] )& (select[2] )&(select[1] )& (~select[0] );
assign tmp[31] = in[31]&(select[4] )& (select[3] )& (select[2] )&(select[1] )& ( select[0] );


assign out = tmp[0]|tmp[1 ]|tmp[2 ]|tmp[3 ]|tmp[4 ]|tmp[5 ]|tmp[6 ]|tmp[7 ]|tmp[8 ]|tmp[9 ]|tmp[10]|tmp[11]|tmp[12]|tmp[13]|tmp[14]|tmp[15]|tmp[16]|tmp[17]|tmp[18]|tmp[19]|tmp[20]|tmp[21]|tmp[22]|tmp[23]|tmp[24]|tmp[25]|tmp[26]|tmp[27]|tmp[28]|tmp[29]|tmp[30]|tmp[31];
// end
endmodule