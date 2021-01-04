module FA_4 (
	a,
	b,
	cin,
	s,
	cout
);
parameter DATA_WIDTH = 4;

input [DATA_WIDTH - 1: 0]a;
input [DATA_WIDTH - 1: 0]b;
input cin;
output [DATA_WIDTH -1 :0]s;
output cout;

wire [DATA_WIDTH - 1: 0]tmp;

FA FA_0(.x(a[0]), .y (b[0]), .cin(cin),       .s(s[0]), .cout(tmp[0]));
FA FA_1(.x(a[1]), .y (b[1]), .cin(tmp[0]),    .s(s[1]), .cout(tmp[1]));
FA FA_2(.x(a[2]), .y (b[2]), .cin(tmp[1]),    .s(s[2]), .cout(tmp[2]));
FA FA_3(.x(a[3]), .y (b[3]), .cin(tmp[2]),    .s(s[3]), .cout(cout));

endmodule
