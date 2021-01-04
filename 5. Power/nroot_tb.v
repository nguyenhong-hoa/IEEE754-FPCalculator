`timescale 1ns / 1ns
`include "mult.v"
`include "adder.v"
`include "find1.v"
`include "compliment2.v"
`include "shiftleft.v"
`include "shift_right.v"
`include "export_result.v"
`include "checkspecial.v"
`include "power.v"


module nroot_tb;
   wire [31:0]result;
    wire underflow,overflow;

    reg [31:0]	A;
	reg	[23:0]	B;
	reg			CLK,RST;


    power uut(.A(A),
                .B(B),
				.CLK(CLK),
				.RST(RST),
                .overflow(overflow),
                .underflow(underflow),
                .result(result),
				.enable());

always
begin
#0	CLK = 1'B0;
#25	CLK = 1'B1;
#25;
end

initial
        begin
            A = 32'b01000001010000100000000000000000; //0.5
            B = 24'b0000_0000_0000_0000_0000_0011; //-0.4375
			#0 RST = 1'B1;
			#5 RST = 1'B0;
			#5 RST = 1'B1;
			#100000;
			$finish;
//          #50
//		#0 RST = 1'B1;
//		#5 RST = 1'B0;
//		#5 RST = 1'B1;
//		#1;
////////////////////////////////////////////////////////////////////////////////
//          A=32'h44fc6000; //2019
//		B=32'hc4f9e000; //-1999
//    
//          #50
//		#0 RST = 1'B1;
//		#5 RST = 1'B0;
//		#5 RST = 1'B1;
//		#1;
//////////////////////////////////////////////////////////////////////////////////
//          A = 32'b10111110000000000000000000000000; //-0.125
//          B = 32'b11000001000101100000000000000000; //-9.375
//
//          #50
//////////////////////////////////////////////////////////////////////////////////
//          A = 32'b00000000000000000000000000000000; //0
//          B = 32'b11000001000101100000000000000000; //-9.375
//    
//          #50
//////////////////////////////////////////////////////////////////////////////////
//          A = 32'b01111111100000000000000000000000; //+vo cung
//          B = 32'b11000001000101100000000000000000; //-9.375
//    
//          #50
//////////////////////////////////////////////////////////////////////////////////
//          A = 32'b01111111100000000000000000000000; //+vo cung
//          B = 32'b11111111100000000000000000000000; //-vo cung
//       
//          #50
//////////////////////////////////////////////////////////////////////////////////
//          A = 32'b01111111100000000000000000000000; //+vo cung
//          B = 32'b01111111100000000000000000000000; //+vo cung
//       
//
//          #50
//////////////////////////////////////////////////////////////////////////////////
//          A = 32'b00111000010100011011011100010111; //0.00005
//          B = 32'b01100000101011010111100011101100; //10^20
//  
//
//          #50
//////////////////////////////////////////////////////////////////////////////////
//          A = 32'b00111000010100011011011100010111; //0.00005
//          B = 32'b01100111010100111100001000011100; //10^25
//
//          #50
//////////////////////////////////////////////////////////////////////////////////
//          A = 32'b00000000000000000000000000000000; //0
//          B = 32'b01111111100000000000000000000000; //+vo cung
//    
//      
//          #50
//////////////////////////////////////////////////////////////////////////////////
//          A = 32'b00000000000000000000000000000000; //0
//          B = 32'b11111111100000000000000000000000; //-vo cung
//
//          #50
//////////////////////////////////////////////////////////////////////////////////
//          A = 32'b00111000010100011011011100010111; //0.00005
//          B = 32'b01100111010100111100001000011100; //10^25
      

        end
		
initial
begin
$vcdplusfile("tb2.vpd");
$vcdpluson();
end

endmodule
