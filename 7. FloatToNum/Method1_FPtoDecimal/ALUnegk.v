module ALUnegk(CLK,RST,frac,exp,nguyen,le,lt);

input 	[27:0]	frac;
input	[8:0]	exp;
input			CLK,RST;
output	[19:0]	le;
output	[4:0]	nguyen;
output	[8:0]	lt;

wire	[42:0]	le_temp,le_10;
wire	[27:0]	frac_temp_out,frac2;
wire	[8:0]	count_out;
wire	[8:0]	mu_out,exp_1;
wire	[2:0]	count_out2;
wire	[1:0]	rst_2;
wire			CLK2;

reg		[42:0]	temp_10;
reg		[27:0]	frac_temp,frac1;
reg		[8:0]	count;
reg		[8:0]	mu;
reg		[2:0]	count2;
reg		[1:0]	count_rst2;
reg				ena,enable,RST2,ena2,ena4,enable4;

adder_9bit countup(.in1(exp), .in2(9'd2), .S(exp_1), .Cout());

nhan10_28bit nhan10data(.in(frac_temp), .out(frac_temp_out));	

adder_9bit count_up_mu(.in1(mu), .in2(-9'd1), .S(mu_out), .Cout());

adder_9bit countdown(.in1(count), .in2(-9'd1), .S(count_out), .Cout());

assign frac2 = (|frac1[27:24])?{1'b0,frac1[27:1]}:{1'b0,frac_temp_out[27:1]};

always @(posedge CLK or negedge RST)
begin
	if (~RST)
		begin
			frac_temp 	<= frac;
			mu 			<= 9'd0;
			count 		<= exp_1;		
			frac1 		<= 28'b0;
		end
	else
		begin
		if (ena)
			begin
				count <= count_out;
				frac1 <= frac2;
				frac_temp <= (|frac2[27:24])?frac_temp:frac1;
				mu 		  <= (|frac2[27:24])?mu:mu_out;
			end
		else
			begin
				frac_temp 	<= frac_temp;	
				mu 			<= mu;		
				count 		<= count; 			
				frac1 		<= frac1 ;
			end
		end
end

always @(*)
begin
	ena = |count;
	enable = ~ena;
end

assign nguyen = enable?frac1[27:23]:5'b0;

assign lt = enable?mu:9'b0;

assign le_temp = enable?{20'b0,frac1[22:0]}:43'b0;

assign CLK2 = CLK & enable;

			//////// RESET for SENCOND
			adder_2bit RST_SECOND(.in1(count_rst2), .in2(-2'd1), .S(rst_2), .Cout());

			always @(posedge CLK2 or negedge RST)
			begin
				if (~RST)
				begin
					count_rst2 <= 2'b10;
					RST2 <= 1'b1;
				end
				else
				begin
					count_rst2 <= ena2?(rst_2):(count_rst2);
					RST2 <= |rst_2;
				end
			end

			always @(*)
			begin
				ena2 = ~(&(count_rst2));
			end
			///////////////////////////////////////

nhan10_43bit nhan10le(.in(temp_10), .out(le_10));									//43bit
adder_3bit countdown2(.in1(count2), .in2(-3'd1), .S(count_out2), .Cout());

always @(posedge CLK2 or negedge RST2)
begin
	if (~RST2)
		begin
		temp_10 <= le_temp;
		count2 <= 3'd6; 
		end
	else
		begin
		temp_10 <= ena4?le_10:temp_10;
		count2 <= ena4?count_out2:count2;
		end
end

always @(*)
begin
ena4 = |count2;
enable4 = ~ena4;
end

assign le = temp_10[42:23];

endmodule