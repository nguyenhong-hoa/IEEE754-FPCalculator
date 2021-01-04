module FPchange(CLK,RST,in,sign,nguyen,le,lt);

input 	[31:0]	in;
input			CLK,RST;

output	[19:0]	le;
output	[4:0]	nguyen;
output	[8:0]	lt;
output			sign;

reg		[19:0]	le;	
reg		[4:0]	nguyen;
reg		[8:0]	lt;

wire	[4:0]	nguyen1,nguyen2;
wire	[7:0]	exp;
wire	[8:0]	exp_temp,exp_out,lt1,lt2;
wire	[19:0]	le1,le2;
wire	[27:0]	frac;

assign sign = in[31];

assign exp  = in[30:23];
assign frac = {5'b00001,in[22:0]};

adder_9bit tinh_exp(.in1({1'b0,exp}), .in2(-9'd127), .S(exp_temp), .Cout());
compliment2_9bit dao_exp(.in(exp_temp), .out(exp_out));

ALUnegk ALU1(.CLK(CLK), .RST(RST), .frac(frac), .exp(exp_out), .nguyen(nguyen1), .le(le1), .lt(lt1));

ALUposk ALU2(.CLK(CLK), .RST(RST), .frac(in[22:0]), .exp(exp_temp),.nguyen(nguyen2), .le(le2), .lt(lt2));

always @(*)
begin
	if (exp_temp[8])
		begin
		nguyen = nguyen1;
		le = le1;
		lt = lt1;
		end
	else
		begin
		nguyen = nguyen2;
		le = le2;
		lt = lt2;
		end
end

endmodule