`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2020 11:32:07 PM
// Design Name: 
// Module Name: FA_48
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FA_48(
	a,
    b,
    cin,
    s,
    cout
);
parameter DATA_WIDTH = 48;

input [DATA_WIDTH - 1: 0]a;
input [DATA_WIDTH - 1: 0]b;
input cin;
output [DATA_WIDTH -1 :0]s;
output cout;

wire tmp;



FA_24 FA_24_0(.a(a[23:0]), .b (b[23:0]), .cin(cin),       .s(s[23:0]), .cout(tmp));
FA_24 FA_24_1(.a(a[47:24]), .b (b[47:24]), .cin(tmp),    .s(s[47:24]), .cout(cout));

endmodule
