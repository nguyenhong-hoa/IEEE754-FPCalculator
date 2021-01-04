`timescale 1ns / 1ns
`include "mult.v"
`include "square.v"
`include "adder.v"
`include "find1.v"
`include "compliment2.v"
`include "shiftleft.v"
`include "export_result.v"
`include "checkspecial.v"

module square_tb;
   wire [31:0]result;
    wire underflow,overflow,enable;

    reg [31:0]A;
	reg			CLK,RST;


    square uut(.A(A),
                .CLK(CLK),
				.RST(RST),
                .overflow(overflow),
                .underflow(underflow),
                .result(result),
				.enable(enable));

always
begin
#0	CLK = 1'B0;
#25	CLK = 1'B1;
#25;
end

    initial
        begin
            A = 32'h3FB504F3;
			#0 RST = 1'B1;
			#5 RST = 1'B0;
			#5 RST = 1'B1;
			#10000;
			A = 32'h3FB504F3;
			#10000;
			$finish;
        end

initial
begin
$vcdplusfile("tb.vpd");
$vcdpluson();
end

endmodule
