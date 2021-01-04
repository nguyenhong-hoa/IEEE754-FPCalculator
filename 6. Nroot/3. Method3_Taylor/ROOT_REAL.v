`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2020 11:11:42 PM
// Design Name: 
// Module Name: ROOT_REAL
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


module ROOT_REAL(
    base,
    root,
    out
    );
input [31:0] base;
input [31:0] root;
output [31:0] out;

wire [31:0] base_root;
wire [31:0] one_on_root;
wire [31:0] out_normal;
wire check_NaN, check_inf;
parameter NaN = {{1'b0}, {31{1'd1}}};
parameter inf = {{8'hFF}, {23{1'b0}}};
// Calculate 1/ root
DIV ONE_ON_ROOT(.in1(32'b00111111100000000000000000000000), .in2(root), .out(one_on_root));
// Calculate base ^ (1/root)
EXP_REAL ROOT_REAL(.base(base), .exp(one_on_root), .out(out_normal));
assign check_NaN = (base == NaN) | (root == NaN);
assign check_inf = base[30:0] == inf;
assign out = (check_NaN == 1'b1) ? NaN :
             (check_inf == 1'b1) ? {1'b0, inf} :
             ((base[31] == 1'b1) ? NaN : out_normal);

endmodule
