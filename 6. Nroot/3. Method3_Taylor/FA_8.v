module FA_8 (
	a,
	b,
	cin,
	s,
	cout
);
parameter DATA_WIDTH = 8;

input [DATA_WIDTH - 1: 0]a;
input [DATA_WIDTH - 1: 0]b;
input cin;
output [DATA_WIDTH -1 :0]s;
output cout;

wire tmp;

FA_4 FA_0(.a(a[3:0]), .b (b[3:0]), .cin(cin),       .s(s[3:0]), .cout(tmp));
FA_4 FA_1(.a(a[7:4]), .b (b[7:4]), .cin(tmp),    .s(s[7:4]), .cout(cout));


endmodule