`timescale 1ns / 1ps
`include "add_sub.sv"

module add_sub_tb;
	logic	[31:0]	result;
	logic 			underflag,overflag;

	logic 	[31:0]	A,B;
	logic				add_or_sub;


	add_sub uut(.A(A),
				.B(B),
				.checkequation(add_or_sub),
				.overflow(overflag),
				.underflow(underflag),
				.result(result));

	initial
		begin
				add_or_sub = 1;
				
			A = 32'hCBFF95B0;
			B = 32'hD00F0D18;
			#50    
				   
			A = 32'h4EA0EEBB;
			B = 32'hD04AA7E2;
			#50
				
			A = 32'h00000000;
			B = 32'h00000000;
			#50
				
			A = 32'h7F800000;
			B = 32'h00000000;
			#50
				
			A = 32'h00000000;
			B = 32'h7F800000;
			#50    
				   
			A = 32'h7F800000;
			B = 32'h7F800000;
			#50   
				  
			A = 32'h404CAC08;
			B = 32'hFFFFFFFF;
			#50
			
			$finish;
		end
		
initial
begin
$vcdplusfile("tb.vpd");
$vcdpluson();
end

endmodule
