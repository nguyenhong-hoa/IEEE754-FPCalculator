module mult_sq(A,B,out,enaout,CLK,RST);

input	[23:0]	A,B;
input			CLK,RST;
output	[23:0]	out;
output			enaout;

wire	[4:0]	count;
wire	[47:0]	temp_fracCPA;
wire	[23:0]	temp_add;

reg				temp_and,ena,enaout;
reg		[4:0]	count_out;
reg		[23:0]	out,temp_fracA;
reg		[47:0]	temp_frac;

////////////////////////////////////////

assign temp_add = ({24{temp_and}}&B);

adder_48bit	add_frac(.in1({24'b0,temp_add}), .in2(temp_frac), .S(temp_fracCPA), .Cout());

adder_5bit	add_count(.in1(count_out), .in2(-5'b1), .S(count), .Cout());

always @(posedge CLK or negedge RST)
begin
if (!RST)
	begin
	temp_fracA 	<= A;
	temp_frac 	<= 48'b0;
	temp_and 	<= 1'b0;
	count_out 	<= 5'd24;
	end
else
	begin
	count_out 	<= ena?count:count_out;
	temp_fracA 	<= ena?{temp_fracA[22:0],1'b0}:temp_fracA;
	temp_and 	<= ena?temp_fracA[23]:temp_and;
	temp_frac 	<= ena?{temp_fracCPA[46:0],1'b0}:temp_frac;
	end
end

always @(*)
begin
out = (~(|(count_out)))?temp_fracCPA[46:23]:24'b0;
ena	= (|(count_out));
enaout = ~ena;
end

///////////////////////////////////////////

endmodule