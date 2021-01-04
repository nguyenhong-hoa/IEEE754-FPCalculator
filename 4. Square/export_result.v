module export_result(in1,negcheck,temp_result,result);
	input   [31:0]	in1,temp_result;
	input			negcheck;
	output	[31:0]	result;
	reg		[31:0]	result;

	wire	flagNaNin1,flagInfin1,flagZeroin1;

	checkspecial	check_in1(.I(in1),.flagInf(flagInfin1),.flagNaN(flagNaNin1),.flagZero(flagZeroin1));

	always@(in1 or temp_result)
		begin
			if (negcheck)
				result = 32'h7FFFFFFF;
			else
			begin
			case ({flagZeroin1,flagInfin1,flagNaNin1})
				3'b100: result= 32'h00000000;
				3'b010: result= 32'h7F800000;
				3'b001: result= 32'h7FFFFFFF;
				3'b000: result= temp_result;
			endcase
			end
		end
endmodule