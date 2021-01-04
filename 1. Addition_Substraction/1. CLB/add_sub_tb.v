`timescale 1ns / 1ps
`include "add_sub.v"

module add_sub_tb;
	wire	[31:0]	result;
	wire 			underflag,overflag;

	reg 	[31:0]	A,B;
	reg				add_or_sub;


	add_sub uut(.A(A),
				.B(B),
				.checkequation(add_or_sub),
				.overflow(overflag),
				.underflow(underflag),
				.result(result));

	initial
		begin
			A = 32'b00111111000000000000000000000000; //0.5		
			B = 32'b00111111000000000000000000000000; //0.4375
			add_or_sub = 0;

			#50
			$finish;
		end
		
initial
begin
$vcdplusfile("tb.vpd");
$vcdpluson();
end

endmodule
