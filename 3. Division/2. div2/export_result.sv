`include "checkspecial.sv"

module export_result_addsub(in1,in2,temp_result,toobig,result);
	input   [31:0]in1,in2,temp_result;
	input	[1:0]	toobig;
	output	[31:0]result;
	logic 	[31:0]result;

	logic 	flagNaNin1,flagInfin1,flagZeroin1,flagNaNin2,flagInfin2,flagZeroin2;
	//Kiểm tra trường hợp đặc biệt của số hạng đầu tiên
	checkspecial	check_in1(.I(in1),.flagInf(flagInfin1),.flagNaN(flagNaNin1),.flagZero(flagZeroin1));
	//Kiểm tra số hạng thứ 2
	checkspecial	check_in2(.I(in2),.flagInf(flagInfin2),.flagNaN(flagNaNin2),.flagZero(flagZeroin2));
		
	always@(in1 or in2 or temp_result)
	begin
		if (toobig[0])
			begin
				if (toobig[1])
					result = in2;
				else
					result = in1;
			end
		else
		case ({flagZeroin1,flagInfin1,flagNaNin1,flagZeroin2,flagInfin2,flagNaNin2})
				6'b100_100: result=32'h00000000; //Cả 2 số đều là Zero 
				6'b100_010: result={in2[31],31'h7f800000}; //A là zero, B là vô cùng --> vô cùng
				6'b100_001: result=32'h7FFFFFFF; //Khong tồn tại
				6'b100_000: result=in2; //A là zero

				6'b010_100: result=in1; //B là zero
				6'b010_010: result=(in2[31]^in1[31])?32'h7FFFFFFF:{in1[31],31'h7f800000}; //Cùng dấu là vô cùng, khác dấu là NaN
				6'b010_001:	result=32'h7FFFFFFF; //NaN
				6'b010_000: result={in1[31],31'h7f800000}; //Vô cùng

				6'b001_100, 6'b001_010, 6'b001_001, 6'b001_000:	result=32'h7FFFFFFF; //NaN

				6'b000_100: result=in1; //B =0
				6'b000_010: result={in2[31],31'h7f800000}; //B là vô cùng
				6'b000_001:	result=32'h7FFFFFFF; //NaN
				6'b000_000:	result=temp_result;	//Kết quả nếu không có trường hợp đặc biệt
		endcase
	end
endmodule


/////////////////////////////////////////////////////

module export_result_multiple(in1,in2,temp_result,result);
	input   [31:0]in1,in2,temp_result;
	output	[31:0]result;
	logic	[31:0]result;

	logic	flagNaNin1,flagInfin1,flagZeroin1,flagNaNin2,flagInfin2,flagZeroin2;

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

/////////////////////////////////////////////////////

module export_result_division(in1,in2,temp_result,result);
	input   [31:0]in1,in2,temp_result;
	output	[31:0]result;
	logic	[31:0]result;

	logic	flagNaNin1,flagInfin1,flagZeroin1,flagNaNin2,flagInfin2,flagZeroin2;

	checkspecial	check_in1(.I(in1),.flagInf(flagInfin1),.flagNaN(flagNaNin1),.flagZero(flagZeroin1));
	checkspecial	check_in2(.I(in2),.flagInf(flagInfin2),.flagNaN(flagNaNin2),.flagZero(flagZeroin2));

	always@(in1 or in2 or temp_result)
		begin
			case ({flagZeroin1,flagInfin1,flagNaNin1,flagZeroin2,flagInfin2,flagNaNin2})
				6'b100_100: result=32'h7FFFFFFF;
				6'b100_010: result=32'h00000000;
				6'b100_001: result=32'h7FFFFFFF;
				6'b100_000: result=32'h00000000;

				6'b010_100: result={temp_result[31],31'h7f800000};
				6'b010_010: result=32'h7FFFFFFF;	
				6'b010_001:	result=32'h7FFFFFFF;
				6'b010_000: result={temp_result[31],31'h7f800000};

				6'b001_100, 6'b001_010, 6'b001_001, 6'b001_000:	result=32'h7FFFFFFF;

				6'b000_100: result={temp_result[31],31'h7f800000};
				6'b000_010: result=32'h00000000;
				6'b000_001:	result=32'h7FFFFFFF;
				6'b000_000:	result=temp_result;		
				
			endcase
		end
endmodule