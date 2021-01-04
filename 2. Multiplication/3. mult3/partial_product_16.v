`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2020 10:17:48 PM
// Design Name: 
// Module Name: partial_product_16
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


module partial_product_16(
    part_0,
    part_1,
    part_2,
    out_0,
    out_1
    );
    
input [25:0] part_0, part_1, part_2;
output [25:0] out_0, out_1;

assign out_0[0] = part_0[0];
assign out_0[25] = part_2[25];

assign out_1[1:0] = 2'd0;

HA H01(.x(part_0[1]), .y(part_1[1]), .s(out_0[1]), .cout(out_1[2]));
HA H02(.x(part_1[24]), .y(part_2[24]), .s(out_0[24]), .cout(out_1[25]));

FA F02(.x(part_0[02]), .y(part_1[02]), .cin(part_2[02]), .s(out_0[02]), .cout(out_1[03]));
FA F03(.x(part_0[03]), .y(part_1[03]), .cin(part_2[03]), .s(out_0[03]), .cout(out_1[04]));
FA F04(.x(part_0[04]), .y(part_1[04]), .cin(part_2[04]), .s(out_0[04]), .cout(out_1[05]));
FA F05(.x(part_0[05]), .y(part_1[05]), .cin(part_2[05]), .s(out_0[05]), .cout(out_1[06]));
FA F06(.x(part_0[06]), .y(part_1[06]), .cin(part_2[06]), .s(out_0[06]), .cout(out_1[07]));
FA F07(.x(part_0[07]), .y(part_1[07]), .cin(part_2[07]), .s(out_0[07]), .cout(out_1[08]));
FA F08(.x(part_0[08]), .y(part_1[08]), .cin(part_2[08]), .s(out_0[08]), .cout(out_1[09]));
FA F09(.x(part_0[09]), .y(part_1[09]), .cin(part_2[09]), .s(out_0[09]), .cout(out_1[10]));
FA F10(.x(part_0[10]), .y(part_1[10]), .cin(part_2[10]), .s(out_0[10]), .cout(out_1[11]));
FA F11(.x(part_0[11]), .y(part_1[11]), .cin(part_2[11]), .s(out_0[11]), .cout(out_1[12]));
FA F12(.x(part_0[12]), .y(part_1[12]), .cin(part_2[12]), .s(out_0[12]), .cout(out_1[13]));
FA F13(.x(part_0[13]), .y(part_1[13]), .cin(part_2[13]), .s(out_0[13]), .cout(out_1[14]));
FA F14(.x(part_0[14]), .y(part_1[14]), .cin(part_2[14]), .s(out_0[14]), .cout(out_1[15]));
FA F15(.x(part_0[15]), .y(part_1[15]), .cin(part_2[15]), .s(out_0[15]), .cout(out_1[16]));
FA F16(.x(part_0[16]), .y(part_1[16]), .cin(part_2[16]), .s(out_0[16]), .cout(out_1[17]));
FA F17(.x(part_0[17]), .y(part_1[17]), .cin(part_2[17]), .s(out_0[17]), .cout(out_1[18]));
FA F18(.x(part_0[18]), .y(part_1[18]), .cin(part_2[18]), .s(out_0[18]), .cout(out_1[19]));
FA F19(.x(part_0[19]), .y(part_1[19]), .cin(part_2[19]), .s(out_0[19]), .cout(out_1[20]));
FA F20(.x(part_0[20]), .y(part_1[20]), .cin(part_2[20]), .s(out_0[20]), .cout(out_1[21]));
FA F21(.x(part_0[21]), .y(part_1[21]), .cin(part_2[21]), .s(out_0[21]), .cout(out_1[22]));
FA F22(.x(part_0[22]), .y(part_1[22]), .cin(part_2[22]), .s(out_0[22]), .cout(out_1[23]));
FA F23(.x(part_0[23]), .y(part_1[23]), .cin(part_2[23]), .s(out_0[23]), .cout(out_1[24]));

endmodule
