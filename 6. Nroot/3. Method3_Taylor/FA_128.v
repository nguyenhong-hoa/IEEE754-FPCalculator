module FA_128(
	a,
	b,
	cin,
	s,
	cout
);

input [127:0]a ;
input [127:0]b ;
input cin;
output [127:0] s;
output cout;

wire [5:0] tmp;

FA_24 F1 (.a(a[23:0 ]), .b(b[23:0 ]), .s(s[23:0 ]), .cin(  1'b0), .cout(tmp[0]));
FA_24 F2 (.a(a[47:24]), .b(b[47:24]), .s(s[47:24]), .cin(tmp[0]), .cout(tmp[1]));
FA_24 F3 (.a(a[71:48]), .b(b[71:48]), .s(s[71:48]), .cin(tmp[1]), .cout(tmp[2]));
FA_24 F4 (.a(a[95:72]), .b(b[95:72]), .s(s[95:72]), .cin(tmp[2]), .cout(tmp[3]));
FA_24 F5 (.a(a[119:96]), .b(b[119:96]), .s(s[119:96]), .cin(tmp[3]), .cout(tmp[4]));
FA_8 F6 (.a(a[127:120]), .b(b[127:120]), .s(s[127:120]), .cin(tmp[4]), .cout(cout));

endmodule

