module export_result_mult(in1,in2,temp_result,result);
	input   [31:0]in1,in2,temp_result;
	output	[31:0]result;
	reg	[31:0]result;

	wire	flagNaNin1,flagInfin1,flagZeroin1,flagNaNin2,flagInfin2,flagZeroin2;

	checkspecial	check_in1(.I(in1),.flagInf(flagInfin1),.flagNaN(flagNaNin1),.flagZero(flagZeroin1));
	checkspecial	check_in2(.I(in2),.flagInf(flagInfin2),.flagNaN(flagNaNin2),.flagZero(flagZeroin2));

	always@(in1 or in2 or temp_result)
		begin
			case ({flagZeroin1,flagInfin1,flagNaNin1,flagZeroin2,flagInfin2,flagNaNin2})
				6'b100_100: result=32'h00000000;
				6'b100_010: result=32'h7FFFFFFF;
				6'b100_001: result=32'h7FFFFFFF;
				6'b100_000: result=32'h00000000;

				6'b010_100: result=32'h7FFFFFFF;
				6'b010_010: result={temp_result[31],31'h7f800000};	
				6'b010_001:	result=32'h7FFFFFFF;
				6'b010_000: result={temp_result[31],31'h7f800000};

				6'b001_100, 6'b001_010, 6'b001_001, 6'b001_000:	result=32'h7FFFFFFF;

				6'b000_100: result=32'h00000000;
				6'b000_010: result={temp_result[31],31'h7f800000};
				6'b000_001:	result=32'h7FFFFFFF;
				6'b000_000:	result=temp_result;		
				
			endcase
		end
endmodule