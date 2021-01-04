`timescale 1ns / 1ps
`include "FPchange.v"
`include "ALUnegk.v"
`include "adder.v"
`include "compliment2.v"
`include "nhan10.v"
`include "ALUposk.v"
`include "power.v"
`include "mult.v"
`include "find1.v"
`include "shiftleft_mult.v"
`include "shift_right_mult.v"
`include "checkspecial.v"
`include "export_result.v"

module tb_fpchange;

wire	[19:0]	le;
wire	[4:0]	nguyen;
wire	[8:0]	lt;

reg [31:0]	A;
reg			CLK,RST;

FPchange	uut(.CLK(CLK), .RST(RST), .in(A), .nguyen(nguyen), .le(le), .lt(lt));
  
always
begin
#0	CLK = 1'B0;
#2	CLK = 1'B1;
#2;
end

initial
        begin
	/////////////////////////////////////////////////////////////////////
	
			A = 32'b01000001110011001110000101001000;//16.2
			#1 RST = 1'B1;
			#5 RST = 1'B0;
			#5 RST = 1'B1;
			#12000;
			
	/////////////////////////////////////////////////////////////////////	
			$finish;
        end
		
initial
begin
$vcdplusfile("tb_fpchange.vpd");
$vcdpluson();
end

endmodule
