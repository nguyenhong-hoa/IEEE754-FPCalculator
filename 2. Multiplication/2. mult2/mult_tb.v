`timescale 1ns / 1ns
`include "mult.v"
`include "adder.v"
`include "find1.v"
`include "compliment2.v"
`include "shiftleft.v"
`include "shift_right.v"
`include "export_result.v"
`include "checkspecial.v"


module multiplier_tb;
   wire [31:0]result;
    wire underflow,overflow;

    reg [31:0]A,B;
	reg			CLK,RST;


    mult uut(.A(A),
                .B(B),
				.CLK(CLK),
				.RST(RST),
                .overflow(overflow),
                .underflow(underflow),
                .result(result));

always
begin
#0	CLK = 1'B0;
#25	CLK = 1'B1;
#25;
end

initial
        begin
            A = 32'b01010101010000001110001010111001; //0.5
            B = 32'b00111100110011001100110011001101; //-0.4375
			#0 RST = 1'B1;
			#5 RST = 1'B0;
			#5 RST = 1'B1;
			#100000;
			$finish;
        end
		
initial
begin
$vcdplusfile("tb2.vpd");
$vcdpluson();
end

endmodule
