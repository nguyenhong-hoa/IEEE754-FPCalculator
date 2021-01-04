module FA_25_tb();


reg [24:0]a;
reg [24:0]b;
wire [24:0]s;
reg cin;
wire cout;

FA_25 FA_25_0(.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

initial 
begin

	a = 0;
	b = 0;
	cin = 0;
	#50;
	a = 10;
	b = 20;
	cin = 0;
	#50;
	a = 10;
	b = 20;
	cin = 1;
	#50;
	a = 20;
	b = 10;
	cin = 1;
	#50;
	a = 20;
	b = 10;
	cin = 0;
	#50;
end
endmodule
