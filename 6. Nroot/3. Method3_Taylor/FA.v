module FA(
	x,
	y,
	cin,
	s,
	cout
);

input x, y, cin;
output s, cout;

wire x, y, cin;
reg s, cout;

initial 
begin
	assign s = x ^ y ^ cin;
	assign cout = (x & y) | (cin & (x ^ y));
end

endmodule
