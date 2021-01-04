module FA_24(
	a,
	b,
	cin,
	s,
	cout
);
parameter DATA_WIDTH = 24;

input [DATA_WIDTH - 1: 0]a;
input [DATA_WIDTH - 1: 0]b;
input cin;
output [DATA_WIDTH -1 :0]s;
output cout;

wire [1:0] tmp;



FA_8 FA_24_0(.a(a[7:0]), .b (b[7:0]), .cin(cin),       .s(s[7:0]), .cout(tmp[0]));
FA_8 FA_24_1(.a(a[15:8]), .b (b[15:8]), .cin(tmp[0]),    .s(s[15:8]), .cout(tmp[1]));
FA_8 FA_24_2(.a(a[23:16]), .b (b[23:16]), .cin(tmp[1]),    .s(s[23:16]), .cout(cout));

endmodule