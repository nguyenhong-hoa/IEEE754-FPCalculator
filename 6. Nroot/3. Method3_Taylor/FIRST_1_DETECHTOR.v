
module FIRST_1_DETECTOR(
	in,
	out
);

parameter WIDTH = 32;
parameter OUT_W = 5;

input [WIDTH - 1:0] in;
output [OUT_W -1:0] out;

wire [WIDTH-1:0] tmp;
wire [WIDTH-1:0] tmp_xor;
assign tmp[31:25] = 0;
assign tmp_xor[31:25] = 0;

assign tmp[24] = in[24]	| 0;
assign tmp[23] = tmp[24] | in[23];
assign tmp[22] = tmp[23] | in[22];
assign tmp[21] = tmp[22] | in[21];
assign tmp[20] = tmp[21] | in[20];
assign tmp[19] = tmp[20] | in[19];
assign tmp[18] = tmp[19] | in[18];
assign tmp[17] = tmp[18] | in[17];
assign tmp[16] = tmp[17] | in[16];
assign tmp[15] = tmp[16] | in[15];
assign tmp[14] = tmp[15] | in[14];
assign tmp[13] = tmp[14] | in[13];
assign tmp[12] = tmp[13] | in[12];
assign tmp[11] = tmp[12] | in[11];
assign tmp[10] = tmp[11] | in[10];
assign tmp[09] = tmp[10] | in[09];
assign tmp[08] = tmp[09] | in[08];
assign tmp[07] = tmp[08] | in[07];
assign tmp[06] = tmp[07] | in[06];
assign tmp[05] = tmp[06] | in[05];
assign tmp[04] = tmp[05] | in[04];
assign tmp[03] = tmp[04] | in[03];
assign tmp[02] = tmp[03] | in[02];
assign tmp[01] = tmp[02] | in[01];
assign tmp[00] = tmp[01] | in[00];

assign tmp_xor[24] = tmp[24] ^ 0;
assign tmp_xor[23] = tmp[23] ^ tmp[24] ;
assign tmp_xor[22] = tmp[22] ^ tmp[23] ;
assign tmp_xor[21] = tmp[21] ^ tmp[22] ;
assign tmp_xor[20] = tmp[20] ^ tmp[21] ;
assign tmp_xor[19] = tmp[19] ^ tmp[20] ;
assign tmp_xor[18] = tmp[18] ^ tmp[19] ;
assign tmp_xor[17] = tmp[17] ^ tmp[18] ;
assign tmp_xor[16] = tmp[16] ^ tmp[17] ;
assign tmp_xor[15] = tmp[15] ^ tmp[16] ;
assign tmp_xor[14] = tmp[14] ^ tmp[15] ;
assign tmp_xor[13] = tmp[13] ^ tmp[14] ;
assign tmp_xor[12] = tmp[12] ^ tmp[13] ;
assign tmp_xor[11] = tmp[11] ^ tmp[12] ;
assign tmp_xor[10] = tmp[10] ^ tmp[11] ;
assign tmp_xor[09] = tmp[09] ^ tmp[10] ;
assign tmp_xor[08] = tmp[08] ^ tmp[09] ;
assign tmp_xor[07] = tmp[07] ^ tmp[08] ;
assign tmp_xor[06] = tmp[06] ^ tmp[07] ;
assign tmp_xor[05] = tmp[05] ^ tmp[06] ;
assign tmp_xor[04] = tmp[04] ^ tmp[05] ;
assign tmp_xor[03] = tmp[03] ^ tmp[04] ;
assign tmp_xor[02] = tmp[02] ^ tmp[03] ;
assign tmp_xor[01] = tmp[01] ^ tmp[02] ;
assign tmp_xor[00] = tmp[00] ^ tmp[01] ;

LINE_2_BI LINE_2_BI_0(.in(tmp_xor),.out(out));


endmodule
