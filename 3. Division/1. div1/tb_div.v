`timescale 1ns / 1ns
`include "div.v"
`include "adder.v"
`include "find1.v"
`include "compliment2.v"
`include "shiftleft.v"
`include "export_result.v"
`include "checkspecial.v"


module division_tb;
   wire [31:0]result;
    wire underflow,overflow;

    reg [31:0]A,B;
	reg			CLK,RST;


    div uut(.A(A),
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
            A = 32'b11110010010001001110011001010010; 
            B = 32'b00110000110011100010100010001111; 
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
