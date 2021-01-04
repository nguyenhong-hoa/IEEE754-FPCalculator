`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2020 07:53:15 PM
// Design Name: 
// Module Name: mul_v2
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


module mul_wallace_tree_24(
    in1,
    in2,
    out
    );
    
input [23:0] in1, in2;
output [48:0] out;

wire [48:0] and_stage [23:0];

assign and_stage[00] = {{ (26 - 00){1'b0} },in1[23:0] & {24{in2[00]}}              };
assign and_stage[01] = {{ (26 - 01){1'b0} },in1[23:0] & {24{in2[01]}}, { 01{1'b0} }};
assign and_stage[02] = {{ (26 - 02){1'b0} },in1[23:0] & {24{in2[02]}}, { 02{1'b0} }};
assign and_stage[03] = {{ (26 - 03){1'b0} },in1[23:0] & {24{in2[03]}}, { 03{1'b0} }};
assign and_stage[04] = {{ (26 - 04){1'b0} },in1[23:0] & {24{in2[04]}}, { 04{1'b0} }};
assign and_stage[05] = {{ (26 - 05){1'b0} },in1[23:0] & {24{in2[05]}}, { 05{1'b0} }};
assign and_stage[06] = {{ (26 - 06){1'b0} },in1[23:0] & {24{in2[06]}}, { 06{1'b0} }};
assign and_stage[07] = {{ (26 - 07){1'b0} },in1[23:0] & {24{in2[07]}}, { 07{1'b0} }};
assign and_stage[08] = {{ (26 - 08){1'b0} },in1[23:0] & {24{in2[08]}}, { 08{1'b0} }};
assign and_stage[09] = {{ (26 - 09){1'b0} },in1[23:0] & {24{in2[09]}}, { 09{1'b0} }};
assign and_stage[10] = {{ (26 - 10){1'b0} },in1[23:0] & {24{in2[10]}}, { 10{1'b0} }};
assign and_stage[11] = {{ (26 - 11){1'b0} },in1[23:0] & {24{in2[11]}}, { 11{1'b0} }};
assign and_stage[12] = {{ (26 - 12){1'b0} },in1[23:0] & {24{in2[12]}}, { 12{1'b0} }};
assign and_stage[13] = {{ (26 - 13){1'b0} },in1[23:0] & {24{in2[13]}}, { 13{1'b0} }};
assign and_stage[14] = {{ (26 - 14){1'b0} },in1[23:0] & {24{in2[14]}}, { 14{1'b0} }};
assign and_stage[15] = {{ (26 - 15){1'b0} },in1[23:0] & {24{in2[15]}}, { 15{1'b0} }};
assign and_stage[16] = {{ (26 - 16){1'b0} },in1[23:0] & {24{in2[16]}}, { 16{1'b0} }};
assign and_stage[17] = {{ (26 - 17){1'b0} },in1[23:0] & {24{in2[17]}}, { 17{1'b0} }};
assign and_stage[18] = {{ (26 - 18){1'b0} },in1[23:0] & {24{in2[18]}}, { 18{1'b0} }};
assign and_stage[19] = {{ (26 - 19){1'b0} },in1[23:0] & {24{in2[19]}}, { 19{1'b0} }};
assign and_stage[20] = {{ (26 - 20){1'b0} },in1[23:0] & {24{in2[20]}}, { 20{1'b0} }};
assign and_stage[21] = {{ (26 - 21){1'b0} },in1[23:0] & {24{in2[21]}}, { 21{1'b0} }};
assign and_stage[22] = {{ (26 - 22){1'b0} },in1[23:0] & {24{in2[22]}}, { 22{1'b0} }};
assign and_stage[23] = {{ (26 - 23){1'b0} },in1[23:0] & {24{in2[23]}}, { 23{1'b0} }};

wire [48:0] stage_1 [15:0];

partial_product_16 pp16_0 (.part_0(and_stage[ 0 *3 ][25 + (0*3): 0*3 ]), .part_1(and_stage[ (0 *3) + 1 ][25 + 3*0  : 0*3 ]), .part_2(and_stage[(0 *3) + 2][25 + 3*0 : 3*0 ]), .out_0(stage_1[2*0 ][25 + (3*0 ): 3*0 ]), .out_1(stage_1[2*0  + 1][25 + (3*0 ): 0*3 ]));
partial_product_16 pp16_1 (.part_0(and_stage[ 1 *3 ][25 + (1*3): 1*3 ]), .part_1(and_stage[ (1 *3) + 1 ][25 + 3*1  : 1*3 ]), .part_2(and_stage[(1 *3) + 2][25 + 3*1 : 3*1 ]), .out_0(stage_1[2*1 ][25 + (3*1 ): 3*1 ]), .out_1(stage_1[2*1  + 1][25 + (3*1 ): 1*3 ]));
partial_product_16 pp16_2 (.part_0(and_stage[ 2 *3 ][25 + (2*3): 2*3 ]), .part_1(and_stage[ (2 *3) + 1 ][25 + 3*2  : 2*3 ]), .part_2(and_stage[(2 *3) + 2][25 + 3*2 : 3*2 ]), .out_0(stage_1[2*2 ][25 + (3*2 ): 3*2 ]), .out_1(stage_1[2*2  + 1][25 + (3*2 ): 2*3 ]));
partial_product_16 pp16_3 (.part_0(and_stage[ 3 *3 ][25 + (3*3): 3*3 ]), .part_1(and_stage[ (3 *3) + 1 ][25 + 3*3  : 3*3 ]), .part_2(and_stage[(3 *3) + 2][25 + 3*3 : 3*3 ]), .out_0(stage_1[2*3 ][25 + (3*3 ): 3*3 ]), .out_1(stage_1[2*3  + 1][25 + (3*3 ): 3*3 ]));
partial_product_16 pp16_4 (.part_0(and_stage[ 4 *3 ][25 + (4*3): 4*3 ]), .part_1(and_stage[ (4 *3) + 1 ][25 + 3*4  : 4*3 ]), .part_2(and_stage[(4 *3) + 2][25 + 3*4 : 3*4 ]), .out_0(stage_1[2*4 ][25 + (3*4 ): 3*4 ]), .out_1(stage_1[2*4  + 1][25 + (3*4 ): 4*3 ]));
partial_product_16 pp16_5 (.part_0(and_stage[ 5 *3 ][25 + (5*3): 5*3 ]), .part_1(and_stage[ (5 *3) + 1 ][25 + 3*5  : 5*3 ]), .part_2(and_stage[(5 *3) + 2][25 + 3*5 : 3*5 ]), .out_0(stage_1[2*5 ][25 + (3*5 ): 3*5 ]), .out_1(stage_1[2*5  + 1][25 + (3*5 ): 5*3 ]));
partial_product_16 pp16_6 (.part_0(and_stage[ 6 *3 ][25 + (6*3): 6*3 ]), .part_1(and_stage[ (6 *3) + 1 ][25 + 3*6  : 6*3 ]), .part_2(and_stage[(6 *3) + 2][25 + 3*6 : 3*6 ]), .out_0(stage_1[2*6 ][25 + (3*6 ): 3*6 ]), .out_1(stage_1[2*6  + 1][25 + (3*6 ): 6*3 ]));
partial_product_16 pp16_7 (.part_0(and_stage[ 7 *3 ][25 + (7*3): 7*3 ]), .part_1(and_stage[ (7 *3) + 1 ][25 + 3*7  : 7*3 ]), .part_2(and_stage[(7 *3) + 2][25 + 3*7 : 3*7 ]), .out_0(stage_1[2*7 ][25 + (3*7 ): 3*7 ]), .out_1(stage_1[2*7  + 1][25 + (3*7 ): 7*3 ]));

assign stage_1[2*0][48: 25 + (3*0 ) + 1 ] = {(48 - (25 + (3*0))){1'b0}}; 
assign stage_1[2*1][48: 25 + (3*1 ) + 1 ] = {(48 - (25 + (3*1))){1'b0}}; assign stage_1[2*1][3*1 - 1 : 0 ] = {(3*1){1'b0}};
assign stage_1[2*2][48: 25 + (3*2 ) + 1 ] = {(48 - (25 + (3*2))){1'b0}}; assign stage_1[2*2][3*2 - 1 : 0 ] = {(3*2){1'b0}};
assign stage_1[2*3][48: 25 + (3*3 ) + 1 ] = {(48 - (25 + (3*3))){1'b0}}; assign stage_1[2*3][3*3 - 1 : 0 ] = {(3*3){1'b0}};
assign stage_1[2*4][48: 25 + (3*4 ) + 1 ] = {(48 - (25 + (3*4))){1'b0}}; assign stage_1[2*4][3*4 - 1 : 0 ] = {(3*4){1'b0}};
assign stage_1[2*5][48: 25 + (3*5 ) + 1 ] = {(48 - (25 + (3*5))){1'b0}}; assign stage_1[2*5][3*5 - 1 : 0 ] = {(3*5){1'b0}};
assign stage_1[2*6][48: 25 + (3*6 ) + 1 ] = {(48 - (25 + (3*6))){1'b0}}; assign stage_1[2*6][3*6 - 1 : 0 ] = {(3*6){1'b0}};
assign stage_1[2*7][48: 25 + (3*7 ) + 1 ] = {(48 - (25 + (3*7))){1'b0}}; assign stage_1[2*7][3*7 - 1 : 0 ] = {(3*7){1'b0}};

assign stage_1[2*0 + 1 ][48: 25 + (3*0 ) + 1 ] = {(48 - (25 + (3*0))){1'b0}}; 
assign stage_1[2*1 + 1 ][48: 25 + (3*1 ) + 1 ] = {(48 - (25 + (3*1))){1'b0}}; assign stage_1[2*1 + 1 ][3*1 - 1 : 0 ] = {(3*1){1'b0}};
assign stage_1[2*2 + 1 ][48: 25 + (3*2 ) + 1 ] = {(48 - (25 + (3*2))){1'b0}}; assign stage_1[2*2 + 1 ][3*2 - 1 : 0 ] = {(3*2){1'b0}};
assign stage_1[2*3 + 1 ][48: 25 + (3*3 ) + 1 ] = {(48 - (25 + (3*3))){1'b0}}; assign stage_1[2*3 + 1 ][3*3 - 1 : 0 ] = {(3*3){1'b0}};
assign stage_1[2*4 + 1 ][48: 25 + (3*4 ) + 1 ] = {(48 - (25 + (3*4))){1'b0}}; assign stage_1[2*4 + 1 ][3*4 - 1 : 0 ] = {(3*4){1'b0}};
assign stage_1[2*5 + 1 ][48: 25 + (3*5 ) + 1 ] = {(48 - (25 + (3*5))){1'b0}}; assign stage_1[2*5 + 1 ][3*5 - 1 : 0 ] = {(3*5){1'b0}};
assign stage_1[2*6 + 1 ][48: 25 + (3*6 ) + 1 ] = {(48 - (25 + (3*6))){1'b0}}; assign stage_1[2*6 + 1 ][3*6 - 1 : 0 ] = {(3*6){1'b0}};
assign stage_1[2*7 + 1 ][48: 25 + (3*7 ) + 1 ] = {(48 - (25 + (3*7))){1'b0}}; assign stage_1[2*7 + 1 ][3*7 - 1 : 0 ] = {(3*7){1'b0}};

wire [48:0] stage_2 [10:0];

partial_product_10 pp10_0 (.part_0(stage_1[3*0][ 28: 0]), .part_1(stage_1[3*0 + 1][ 28: 0]), .part_2(stage_1[3*0 + 2][ 28: 0]), .out_0(stage_2[2*0][ 29: 0]), .out_1(stage_2[2*0 + 1][ 29: 0]));
partial_product_10 pp10_1 (.part_0(stage_1[3*1][ 33: 5]), .part_1(stage_1[3*1 + 1][ 33: 5]), .part_2(stage_1[3*1 + 2][ 33: 5]), .out_0(stage_2[2*1][ 34: 5]), .out_1(stage_2[2*1 + 1][ 34: 5]));
partial_product_10 pp10_2 (.part_0(stage_1[3*2][ 37: 9]), .part_1(stage_1[3*2 + 1][ 37: 9]), .part_2(stage_1[3*2 + 2][ 37: 9]), .out_0(stage_2[2*2][ 38: 9]), .out_1(stage_2[2*2 + 1][ 38: 9]));
partial_product_10 pp10_3 (.part_0(stage_1[3*3][ 42:14]), .part_1(stage_1[3*3 + 1][ 42:14]), .part_2(stage_1[3*3 + 2][ 42:14]), .out_0(stage_2[2*3][ 43:14]), .out_1(stage_2[2*3 + 1][ 43:14]));
partial_product_10 pp10_4 (.part_0(stage_1[3*4][ 46:18]), .part_1(stage_1[3*4 + 1][ 46:18]), .part_2(stage_1[3*4 + 2][ 46:18]), .out_0(stage_2[2*4][ 47:18]), .out_1(stage_2[2*4 + 1][ 47:18]));

assign stage_2[2*0][48: 29 + 1 ] = {(48 - 29){1'b0}}; 
assign stage_2[2*1][48: 34 + 1 ] = {(48 - 34){1'b0}}; assign stage_2[2*1][ 5 - 1 : 0 ] = { 5{1'b0}};
assign stage_2[2*2][48: 38 + 1 ] = {(48 - 38){1'b0}}; assign stage_2[2*2][ 9 - 1 : 0 ] = { 9{1'b0}};
assign stage_2[2*3][48: 43 + 1 ] = {(48 - 43){1'b0}}; assign stage_2[2*3][14 - 1 : 0 ] = {14{1'b0}};
assign stage_2[2*4][48: 47 + 1 ] = {(48 - 47){1'b0}}; assign stage_2[2*4][18 - 1 : 0 ] = {18{1'b0}};

assign stage_2[2*0 + 1][48: 29 + 1 ] = {(48 - 29){1'b0}}; 
assign stage_2[2*1 + 1][48: 34 + 1 ] = {(48 - 34){1'b0}}; assign stage_2[2*1 + 1][ 5 - 1 : 0 ] = { 5{1'b0}};
assign stage_2[2*2 + 1][48: 38 + 1 ] = {(48 - 38){1'b0}}; assign stage_2[2*2 + 1][ 9 - 1 : 0 ] = { 9{1'b0}};
assign stage_2[2*3 + 1][48: 43 + 1 ] = {(48 - 43){1'b0}}; assign stage_2[2*3 + 1][14 - 1 : 0 ] = {14{1'b0}};
assign stage_2[2*4 + 1][48: 47 + 1 ] = {(48 - 47){1'b0}}; assign stage_2[2*4 + 1][18 - 1 : 0 ] = {18{1'b0}};

assign stage_2[10] = stage_1[15];

wire [48:0] stage_3 [7:0];

pp8 pp8_0 (.part_0(stage_2[3*0][ 32: 0]), .part_1(stage_2[3*0 + 1][ 32: 0]), .part_2(stage_2[3*0 + 2][ 32: 0]), .out_0(stage_3[2*0][ 33: 0]), .out_1(stage_3[2*0 + 1][ 33: 0]));
pp8 pp8_1 (.part_0(stage_2[3*1][ 40: 8]), .part_1(stage_2[3*1 + 1][ 40: 8]), .part_2(stage_2[3*1 + 2][ 40: 8]), .out_0(stage_3[2*1][ 41: 8]), .out_1(stage_3[2*1 + 1][ 41: 8]));
pp8 pp8_2 (.part_0(stage_2[3*2][ 46:14]), .part_1(stage_2[3*2 + 1][ 46:14]), .part_2(stage_2[3*2 + 2][ 46:14]), .out_0(stage_3[2*2][ 47:14]), .out_1(stage_3[2*2 + 1][ 47:14]));

assign stage_3[2*0][48: 33 + 1 ] = stage_2[3*0 + 1][48: 33 + 1];
assign stage_3[2*1][48: 41 + 1 ] = stage_2[3*1 + 1][48: 41 + 1]; assign stage_3[2*1][ 8 - 1 : 0 ] = { 8{1'b0}};
assign stage_3[2*2][48: 47 + 1 ] = stage_2[3*2 + 1][48: 47 + 1]; assign stage_3[2*2][14 - 1 : 0 ] = {14{1'b0}};

assign stage_3[2*0 + 1][48: 33 + 1 ] = stage_2[3*0 + 2][48: 33 + 1]; 
assign stage_3[2*1 + 1][48: 41 + 1 ] = stage_2[3*1 + 2][48: 41 + 1]; assign stage_3[2*1 + 1][ 8 - 1 : 0 ] = { 8{1'b0}};
assign stage_3[2*2 + 1][48: 47 + 1 ] = stage_2[3*2 + 2][48: 47 + 1]; assign stage_3[2*2 + 1][14 - 1 : 0 ] = {14{1'b0}};

assign stage_3[7] = stage_2[10];
assign stage_3[6] = stage_2[9];

wire [48:0] stage_4 [5:0];

pp6 pp6_0 (.part_0(stage_3[3*0][ 36: 0]), .part_1(stage_3[3*0 + 1][ 36: 0]), .part_2(stage_3[3*0 + 2][ 36: 0]), .out_0(stage_4[2*0][ 37: 0]), .out_1(stage_4[2*0 + 1][ 37: 0]));
pp6 pp6_1 (.part_0(stage_3[3*1][ 46:10]), .part_1(stage_3[3*1 + 1][ 46:10]), .part_2(stage_3[3*1 + 2][ 46:10]), .out_0(stage_4[2*1][ 47:10]), .out_1(stage_4[2*1 + 1][ 47:10]));

assign stage_4[2*0][48: 37 + 1 ] = stage_3[3*0 + 1][48: 37 + 1 ];
assign stage_4[2*1][48: 47 + 1 ] = stage_3[3*1 + 1][48: 47 + 1 ]; assign stage_4[2*1][10 - 1 : 0 ] = {10{1'b0}};
assign stage_4[2*0 + 1][48: 37 + 1 ] = stage_3[3*0 + 2][48: 37 + 1 ];
assign stage_4[2*1 + 1][48: 47 + 1 ] = stage_3[3*1 + 2][48: 47 + 1 ]; assign stage_4[2*1 + 1][10 - 1 : 0 ] = {10{1'b0}};
assign stage_4[5] = stage_3[7];
assign stage_4[4] = stage_3[6];

/*  */

wire [48:0] stage_5 [3:0];

assign stage_5[1][5:0] = 6'b0;
assign stage_5[0][4:0] = stage_4[0][4:0];

//HA HA50_05(.x(stage_4[0][05]), .y(stage_4[1][05]), .s(stage_5[0][05]), .cout(stage_5[1][06]));
//HA HA50_06(.x(stage_4[0][06]), .y(stage_4[1][06]), .s(stage_5[0][06]), .cout(stage_5[1][07]));
//HA HA50_07(.x(stage_4[0][07]), .y(stage_4[1][07]), .s(stage_5[0][07]), .cout(stage_5[1][08]));
//HA HA50_08(.x(stage_4[0][08]), .y(stage_4[1][08]), .s(stage_5[0][08]), .cout(stage_5[1][09]));
//HA HA50_09(.x(stage_4[0][09]), .y(stage_4[1][09]), .s(stage_5[0][09]), .cout(stage_5[1][10]));
FA FA50_05(.x(stage_4[0][05]), .y(stage_4[1][05]), .cin(stage_4[2][05]), .s(stage_5[0][05]), .cout(stage_5[1][06]));
FA FA50_06(.x(stage_4[0][06]), .y(stage_4[1][06]), .cin(stage_4[2][06]), .s(stage_5[0][06]), .cout(stage_5[1][07]));
FA FA50_07(.x(stage_4[0][07]), .y(stage_4[1][07]), .cin(stage_4[2][07]), .s(stage_5[0][07]), .cout(stage_5[1][08]));
FA FA50_08(.x(stage_4[0][08]), .y(stage_4[1][08]), .cin(stage_4[2][08]), .s(stage_5[0][08]), .cout(stage_5[1][09]));
FA FA50_09(.x(stage_4[0][09]), .y(stage_4[1][09]), .cin(stage_4[2][09]), .s(stage_5[0][09]), .cout(stage_5[1][10]));

FA FA50_10(.x(stage_4[0][10]), .y(stage_4[1][10]), .cin(stage_4[2][10]), .s(stage_5[0][10]), .cout(stage_5[1][11]));
FA FA50_11(.x(stage_4[0][11]), .y(stage_4[1][11]), .cin(stage_4[2][11]), .s(stage_5[0][11]), .cout(stage_5[1][12]));
FA FA50_12(.x(stage_4[0][12]), .y(stage_4[1][12]), .cin(stage_4[2][12]), .s(stage_5[0][12]), .cout(stage_5[1][13]));
FA FA50_13(.x(stage_4[0][13]), .y(stage_4[1][13]), .cin(stage_4[2][13]), .s(stage_5[0][13]), .cout(stage_5[1][14]));
FA FA50_14(.x(stage_4[0][14]), .y(stage_4[1][14]), .cin(stage_4[2][14]), .s(stage_5[0][14]), .cout(stage_5[1][15]));
FA FA50_15(.x(stage_4[0][15]), .y(stage_4[1][15]), .cin(stage_4[2][15]), .s(stage_5[0][15]), .cout(stage_5[1][16]));
FA FA50_16(.x(stage_4[0][16]), .y(stage_4[1][16]), .cin(stage_4[2][16]), .s(stage_5[0][16]), .cout(stage_5[1][17]));
FA FA50_17(.x(stage_4[0][17]), .y(stage_4[1][17]), .cin(stage_4[2][17]), .s(stage_5[0][17]), .cout(stage_5[1][18]));
FA FA50_18(.x(stage_4[0][18]), .y(stage_4[1][18]), .cin(stage_4[2][18]), .s(stage_5[0][18]), .cout(stage_5[1][19]));
FA FA50_19(.x(stage_4[0][19]), .y(stage_4[1][19]), .cin(stage_4[2][19]), .s(stage_5[0][19]), .cout(stage_5[1][20]));
FA FA50_20(.x(stage_4[0][20]), .y(stage_4[1][20]), .cin(stage_4[2][20]), .s(stage_5[0][20]), .cout(stage_5[1][21]));
FA FA50_21(.x(stage_4[0][21]), .y(stage_4[1][21]), .cin(stage_4[2][21]), .s(stage_5[0][21]), .cout(stage_5[1][22]));
FA FA50_22(.x(stage_4[0][22]), .y(stage_4[1][22]), .cin(stage_4[2][22]), .s(stage_5[0][22]), .cout(stage_5[1][23]));
FA FA50_23(.x(stage_4[0][23]), .y(stage_4[1][23]), .cin(stage_4[2][23]), .s(stage_5[0][23]), .cout(stage_5[1][24]));
FA FA50_24(.x(stage_4[0][24]), .y(stage_4[1][24]), .cin(stage_4[2][24]), .s(stage_5[0][24]), .cout(stage_5[1][25]));
FA FA50_25(.x(stage_4[0][25]), .y(stage_4[1][25]), .cin(stage_4[2][25]), .s(stage_5[0][25]), .cout(stage_5[1][26]));
FA FA50_26(.x(stage_4[0][26]), .y(stage_4[1][26]), .cin(stage_4[2][26]), .s(stage_5[0][26]), .cout(stage_5[1][27]));
FA FA50_27(.x(stage_4[0][27]), .y(stage_4[1][27]), .cin(stage_4[2][27]), .s(stage_5[0][27]), .cout(stage_5[1][28]));
FA FA50_28(.x(stage_4[0][28]), .y(stage_4[1][28]), .cin(stage_4[2][28]), .s(stage_5[0][28]), .cout(stage_5[1][29]));
FA FA50_29(.x(stage_4[0][29]), .y(stage_4[1][29]), .cin(stage_4[2][29]), .s(stage_5[0][29]), .cout(stage_5[1][30]));
FA FA50_30(.x(stage_4[0][30]), .y(stage_4[1][30]), .cin(stage_4[2][30]), .s(stage_5[0][30]), .cout(stage_5[1][31]));
FA FA50_31(.x(stage_4[0][31]), .y(stage_4[1][31]), .cin(stage_4[2][31]), .s(stage_5[0][31]), .cout(stage_5[1][32]));
FA FA50_32(.x(stage_4[0][32]), .y(stage_4[1][32]), .cin(stage_4[2][32]), .s(stage_5[0][32]), .cout(stage_5[1][33]));
FA FA50_33(.x(stage_4[0][33]), .y(stage_4[1][33]), .cin(stage_4[2][33]), .s(stage_5[0][33]), .cout(stage_5[1][34]));
FA FA50_34(.x(stage_4[0][34]), .y(stage_4[1][34]), .cin(stage_4[2][34]), .s(stage_5[0][34]), .cout(stage_5[1][35]));
FA FA50_35(.x(stage_4[0][35]), .y(stage_4[1][35]), .cin(stage_4[2][35]), .s(stage_5[0][35]), .cout(stage_5[1][36]));
FA FA50_36(.x(stage_4[0][36]), .y(stage_4[1][36]), .cin(stage_4[2][36]), .s(stage_5[0][36]), .cout(stage_5[1][37]));
//HA HA50_33(.x(stage_4[1][33]), .y(stage_4[2][33]), .s(stage_5[0][33]), .cout(stage_5[1][34]));
//HA HA50_34(.x(stage_4[1][34]), .y(stage_4[2][34]), .s(stage_5[0][34]), .cout(stage_5[1][35]));
//HA HA50_35(.x(stage_4[1][35]), .y(stage_4[2][35]), .s(stage_5[0][35]), .cout(stage_5[1][36]));
//HA HA50_36(.x(stage_4[1][36]), .y(stage_4[2][36]), .s(stage_5[0][36]), .cout(stage_5[1][37]));

assign stage_5[0][37] = stage_4[2][37];
assign stage_5[1][48:38] = stage_4[2][48:38];
assign stage_5[0][48:38] = 11'd0;

///////
assign stage_5[3][21:0] = 22'b0;
assign stage_5[2][14:0] = 15'b0;

assign stage_5[2][20:15] = stage_4[3][20:15];
HA HA51_21(.x(stage_4[3][21]), .y(stage_4[4][21]), .s(stage_5[2][21]), .cout(stage_5[3][22]));
HA HA51_22(.x(stage_4[3][22]), .y(stage_4[4][22]), .s(stage_5[2][22]), .cout(stage_5[3][23]));
FA FA51_23(.x(stage_4[3][23]), .y(stage_4[4][23]), .cin(stage_4[5][23]), .s(stage_5[2][23]), .cout(stage_5[3][24]));
FA FA51_24(.x(stage_4[3][24]), .y(stage_4[4][24]), .cin(stage_4[5][24]), .s(stage_5[2][24]), .cout(stage_5[3][25]));
FA FA51_25(.x(stage_4[3][25]), .y(stage_4[4][25]), .cin(stage_4[5][25]), .s(stage_5[2][25]), .cout(stage_5[3][26]));
FA FA51_26(.x(stage_4[3][26]), .y(stage_4[4][26]), .cin(stage_4[5][26]), .s(stage_5[2][26]), .cout(stage_5[3][27]));
FA FA51_27(.x(stage_4[3][27]), .y(stage_4[4][27]), .cin(stage_4[5][27]), .s(stage_5[2][27]), .cout(stage_5[3][28]));
FA FA51_28(.x(stage_4[3][28]), .y(stage_4[4][28]), .cin(stage_4[5][28]), .s(stage_5[2][28]), .cout(stage_5[3][29]));
FA FA51_29(.x(stage_4[3][29]), .y(stage_4[4][29]), .cin(stage_4[5][29]), .s(stage_5[2][29]), .cout(stage_5[3][30]));
FA FA51_30(.x(stage_4[3][30]), .y(stage_4[4][30]), .cin(stage_4[5][30]), .s(stage_5[2][30]), .cout(stage_5[3][31]));
FA FA51_31(.x(stage_4[3][31]), .y(stage_4[4][31]), .cin(stage_4[5][31]), .s(stage_5[2][31]), .cout(stage_5[3][32]));
FA FA51_32(.x(stage_4[3][32]), .y(stage_4[4][32]), .cin(stage_4[5][32]), .s(stage_5[2][32]), .cout(stage_5[3][33]));
FA FA51_33(.x(stage_4[3][33]), .y(stage_4[4][33]), .cin(stage_4[5][33]), .s(stage_5[2][33]), .cout(stage_5[3][34]));
FA FA51_34(.x(stage_4[3][34]), .y(stage_4[4][34]), .cin(stage_4[5][34]), .s(stage_5[2][34]), .cout(stage_5[3][35]));
FA FA51_35(.x(stage_4[3][35]), .y(stage_4[4][35]), .cin(stage_4[5][35]), .s(stage_5[2][35]), .cout(stage_5[3][36]));
FA FA51_36(.x(stage_4[3][36]), .y(stage_4[4][36]), .cin(stage_4[5][36]), .s(stage_5[2][36]), .cout(stage_5[3][37]));
FA FA51_37(.x(stage_4[3][37]), .y(stage_4[4][37]), .cin(stage_4[5][37]), .s(stage_5[2][37]), .cout(stage_5[3][38]));
FA FA51_38(.x(stage_4[3][38]), .y(stage_4[4][38]), .cin(stage_4[5][38]), .s(stage_5[2][38]), .cout(stage_5[3][39]));
FA FA51_39(.x(stage_4[3][39]), .y(stage_4[4][39]), .cin(stage_4[5][39]), .s(stage_5[2][39]), .cout(stage_5[3][40]));
FA FA51_40(.x(stage_4[3][40]), .y(stage_4[4][40]), .cin(stage_4[5][40]), .s(stage_5[2][40]), .cout(stage_5[3][41]));
FA FA51_41(.x(stage_4[3][41]), .y(stage_4[4][41]), .cin(stage_4[5][41]), .s(stage_5[2][41]), .cout(stage_5[3][42]));
FA FA51_42(.x(stage_4[3][42]), .y(stage_4[4][42]), .cin(stage_4[5][42]), .s(stage_5[2][42]), .cout(stage_5[3][43]));
FA FA51_43(.x(stage_4[3][43]), .y(stage_4[4][43]), .cin(stage_4[5][43]), .s(stage_5[2][43]), .cout(stage_5[3][44]));
FA FA51_44(.x(stage_4[3][44]), .y(stage_4[4][44]), .cin(stage_4[5][44]), .s(stage_5[2][44]), .cout(stage_5[3][45]));
FA FA51_45(.x(stage_4[3][45]), .y(stage_4[4][45]), .cin(stage_4[5][45]), .s(stage_5[2][45]), .cout(stage_5[3][46]));
FA FA51_46(.x(stage_4[3][46]), .y(stage_4[4][46]), .cin(stage_4[5][46]), .s(stage_5[2][46]), .cout(stage_5[3][47]));
FA FA51_47(.x(stage_4[3][47]), .y(stage_4[4][47]), .cin(stage_4[5][47]), .s(stage_5[2][47]), .cout(stage_5[3][48]));

//HA HA51_45(.x(stage_4[4][45]), .y(stage_4[5][45]), .s(stage_5[2][45]), .cout(stage_5[3][46]));
//HA HA51_46(.x(stage_4[4][46]), .y(stage_4[5][46]), .s(stage_5[2][46]), .cout(stage_5[3][47]));

assign stage_5[2][48] = 1'h0;
//assign stage_5[3][48] = 1'b0;

///////////////////
wire [48:0] stage_6 [2:0];
assign stage_6[2] = stage_5[3];

assign stage_6[0][5:0] = stage_5[0][5:0];
assign stage_6[1][6:0] = 7'd0;

HA HA60_06(.x(stage_5[0][06]), .y(stage_5[1][06]), .s(stage_6[0][06]), .cout(stage_6[1][07]));
HA HA60_07(.x(stage_5[0][07]), .y(stage_5[1][07]), .s(stage_6[0][07]), .cout(stage_6[1][08]));
HA HA60_08(.x(stage_5[0][08]), .y(stage_5[1][08]), .s(stage_6[0][08]), .cout(stage_6[1][09]));
HA HA60_09(.x(stage_5[0][09]), .y(stage_5[1][09]), .s(stage_6[0][09]), .cout(stage_6[1][10]));
HA HA60_10(.x(stage_5[0][10]), .y(stage_5[1][10]), .s(stage_6[0][10]), .cout(stage_6[1][11]));
HA HA60_11(.x(stage_5[0][11]), .y(stage_5[1][11]), .s(stage_6[0][11]), .cout(stage_6[1][12]));
HA HA60_12(.x(stage_5[0][12]), .y(stage_5[1][12]), .s(stage_6[0][12]), .cout(stage_6[1][13]));
HA HA60_13(.x(stage_5[0][13]), .y(stage_5[1][13]), .s(stage_6[0][13]), .cout(stage_6[1][14]));
HA HA60_14(.x(stage_5[0][14]), .y(stage_5[1][14]), .s(stage_6[0][14]), .cout(stage_6[1][15]));

FA FA60_15(.x(stage_5[0][15]), .y(stage_5[1][15]), .cin(stage_5[2][15]), .s(stage_6[0][15]), .cout(stage_6[1][16]));
FA FA60_16(.x(stage_5[0][16]), .y(stage_5[1][16]), .cin(stage_5[2][16]), .s(stage_6[0][16]), .cout(stage_6[1][17]));
FA FA60_17(.x(stage_5[0][17]), .y(stage_5[1][17]), .cin(stage_5[2][17]), .s(stage_6[0][17]), .cout(stage_6[1][18]));
FA FA60_18(.x(stage_5[0][18]), .y(stage_5[1][18]), .cin(stage_5[2][18]), .s(stage_6[0][18]), .cout(stage_6[1][19]));
FA FA60_19(.x(stage_5[0][19]), .y(stage_5[1][19]), .cin(stage_5[2][19]), .s(stage_6[0][19]), .cout(stage_6[1][20]));
FA FA60_20(.x(stage_5[0][20]), .y(stage_5[1][20]), .cin(stage_5[2][20]), .s(stage_6[0][20]), .cout(stage_6[1][21]));
FA FA60_21(.x(stage_5[0][21]), .y(stage_5[1][21]), .cin(stage_5[2][21]), .s(stage_6[0][21]), .cout(stage_6[1][22]));
FA FA60_22(.x(stage_5[0][22]), .y(stage_5[1][22]), .cin(stage_5[2][22]), .s(stage_6[0][22]), .cout(stage_6[1][23]));
FA FA60_23(.x(stage_5[0][23]), .y(stage_5[1][23]), .cin(stage_5[2][23]), .s(stage_6[0][23]), .cout(stage_6[1][24]));
FA FA60_24(.x(stage_5[0][24]), .y(stage_5[1][24]), .cin(stage_5[2][24]), .s(stage_6[0][24]), .cout(stage_6[1][25]));
FA FA60_25(.x(stage_5[0][25]), .y(stage_5[1][25]), .cin(stage_5[2][25]), .s(stage_6[0][25]), .cout(stage_6[1][26]));
FA FA60_26(.x(stage_5[0][26]), .y(stage_5[1][26]), .cin(stage_5[2][26]), .s(stage_6[0][26]), .cout(stage_6[1][27]));
FA FA60_27(.x(stage_5[0][27]), .y(stage_5[1][27]), .cin(stage_5[2][27]), .s(stage_6[0][27]), .cout(stage_6[1][28]));
FA FA60_28(.x(stage_5[0][28]), .y(stage_5[1][28]), .cin(stage_5[2][28]), .s(stage_6[0][28]), .cout(stage_6[1][29]));
FA FA60_29(.x(stage_5[0][29]), .y(stage_5[1][29]), .cin(stage_5[2][29]), .s(stage_6[0][29]), .cout(stage_6[1][30]));
FA FA60_30(.x(stage_5[0][30]), .y(stage_5[1][30]), .cin(stage_5[2][30]), .s(stage_6[0][30]), .cout(stage_6[1][31]));
FA FA60_31(.x(stage_5[0][31]), .y(stage_5[1][31]), .cin(stage_5[2][31]), .s(stage_6[0][31]), .cout(stage_6[1][32]));
FA FA60_32(.x(stage_5[0][32]), .y(stage_5[1][32]), .cin(stage_5[2][32]), .s(stage_6[0][32]), .cout(stage_6[1][33]));
FA FA60_33(.x(stage_5[0][33]), .y(stage_5[1][33]), .cin(stage_5[2][33]), .s(stage_6[0][33]), .cout(stage_6[1][34]));
FA FA60_34(.x(stage_5[0][34]), .y(stage_5[1][34]), .cin(stage_5[2][34]), .s(stage_6[0][34]), .cout(stage_6[1][35]));
FA FA60_35(.x(stage_5[0][35]), .y(stage_5[1][35]), .cin(stage_5[2][35]), .s(stage_6[0][35]), .cout(stage_6[1][36]));
FA FA60_36(.x(stage_5[0][36]), .y(stage_5[1][36]), .cin(stage_5[2][36]), .s(stage_6[0][36]), .cout(stage_6[1][37]));
FA FA60_37(.x(stage_5[0][37]), .y(stage_5[1][37]), .cin(stage_5[2][37]), .s(stage_6[0][37]), .cout(stage_6[1][38]));

FA FA60_38(.x(stage_5[0][38]), .y(stage_5[1][38]), .cin(stage_5[2][38]), .s(stage_6[0][38]), .cout(stage_6[1][39]));
FA FA60_39(.x(stage_5[0][39]), .y(stage_5[1][39]), .cin(stage_5[2][39]), .s(stage_6[0][39]), .cout(stage_6[1][40]));
FA FA60_40(.x(stage_5[0][40]), .y(stage_5[1][40]), .cin(stage_5[2][40]), .s(stage_6[0][40]), .cout(stage_6[1][41]));
FA FA60_41(.x(stage_5[0][41]), .y(stage_5[1][41]), .cin(stage_5[2][41]), .s(stage_6[0][41]), .cout(stage_6[1][42]));
FA FA60_42(.x(stage_5[0][42]), .y(stage_5[1][42]), .cin(stage_5[2][42]), .s(stage_6[0][42]), .cout(stage_6[1][43]));
FA FA60_43(.x(stage_5[0][43]), .y(stage_5[1][43]), .cin(stage_5[2][43]), .s(stage_6[0][43]), .cout(stage_6[1][44]));
FA FA60_44(.x(stage_5[0][44]), .y(stage_5[1][44]), .cin(stage_5[2][44]), .s(stage_6[0][44]), .cout(stage_6[1][45]));
FA FA60_45(.x(stage_5[0][45]), .y(stage_5[1][45]), .cin(stage_5[2][45]), .s(stage_6[0][45]), .cout(stage_6[1][46]));
FA FA60_46(.x(stage_5[0][46]), .y(stage_5[1][46]), .cin(stage_5[2][46]), .s(stage_6[0][46]), .cout(stage_6[1][47]));
FA FA60_47(.x(stage_5[0][47]), .y(stage_5[1][47]), .cin(stage_5[2][47]), .s(stage_6[0][47]), .cout(stage_6[1][48]));
//HA HA60_38(.x(stage_5[1][38]), .y(stage_5[2][38]), .s(stage_6[0][38]), .cout(stage_6[1][39]));
//HA HA60_39(.x(stage_5[1][39]), .y(stage_5[2][39]), .s(stage_6[0][39]), .cout(stage_6[1][40]));
//HA HA60_40(.x(stage_5[1][40]), .y(stage_5[2][40]), .s(stage_6[0][40]), .cout(stage_6[1][41]));
//HA HA60_41(.x(stage_5[1][41]), .y(stage_5[2][41]), .s(stage_6[0][41]), .cout(stage_6[1][42]));
//HA HA60_42(.x(stage_5[1][42]), .y(stage_5[2][42]), .s(stage_6[0][42]), .cout(stage_6[1][43]));
//HA HA60_43(.x(stage_5[1][43]), .y(stage_5[2][43]), .s(stage_6[0][43]), .cout(stage_6[1][44]));

assign stage_6[0][48] = 1'd0;
////////////////////

wire [48:0] stage_7 [1:0];

assign stage_7[0][6:0] = stage_6[0][6:0];
assign stage_7[1][7:0] = 8'd0;

HA HA70_07(.x(stage_6[0][07]), .y(stage_6[1][07]), .s(stage_7[0][07]), .cout(stage_7[1][08]));
HA HA70_08(.x(stage_6[0][08]), .y(stage_6[1][08]), .s(stage_7[0][08]), .cout(stage_7[1][09]));
HA HA70_09(.x(stage_6[0][09]), .y(stage_6[1][09]), .s(stage_7[0][09]), .cout(stage_7[1][10]));
HA HA70_10(.x(stage_6[0][10]), .y(stage_6[1][10]), .s(stage_7[0][10]), .cout(stage_7[1][11]));
HA HA70_11(.x(stage_6[0][11]), .y(stage_6[1][11]), .s(stage_7[0][11]), .cout(stage_7[1][12]));
HA HA70_12(.x(stage_6[0][12]), .y(stage_6[1][12]), .s(stage_7[0][12]), .cout(stage_7[1][13]));
HA HA70_13(.x(stage_6[0][13]), .y(stage_6[1][13]), .s(stage_7[0][13]), .cout(stage_7[1][14]));
HA HA70_14(.x(stage_6[0][14]), .y(stage_6[1][14]), .s(stage_7[0][14]), .cout(stage_7[1][15]));
HA HA70_15(.x(stage_6[0][15]), .y(stage_6[1][15]), .s(stage_7[0][15]), .cout(stage_7[1][16]));
HA HA70_16(.x(stage_6[0][16]), .y(stage_6[1][16]), .s(stage_7[0][16]), .cout(stage_7[1][17]));
HA HA70_17(.x(stage_6[0][17]), .y(stage_6[1][17]), .s(stage_7[0][17]), .cout(stage_7[1][18]));
HA HA70_18(.x(stage_6[0][18]), .y(stage_6[1][18]), .s(stage_7[0][18]), .cout(stage_7[1][19]));
HA HA70_19(.x(stage_6[0][19]), .y(stage_6[1][19]), .s(stage_7[0][19]), .cout(stage_7[1][20]));
HA HA70_20(.x(stage_6[0][20]), .y(stage_6[1][20]), .s(stage_7[0][20]), .cout(stage_7[1][21]));
HA HA70_21(.x(stage_6[0][21]), .y(stage_6[1][21]), .s(stage_7[0][21]), .cout(stage_7[1][22]));

FA FA70_22(.x(stage_6[0][22]), .y(stage_6[1][22]), .cin(stage_6[2][22]), .s(stage_7[0][22]), .cout(stage_7[1][23]));
FA FA70_23(.x(stage_6[0][23]), .y(stage_6[1][23]), .cin(stage_6[2][23]), .s(stage_7[0][23]), .cout(stage_7[1][24]));
FA FA70_24(.x(stage_6[0][24]), .y(stage_6[1][24]), .cin(stage_6[2][24]), .s(stage_7[0][24]), .cout(stage_7[1][25]));
FA FA70_25(.x(stage_6[0][25]), .y(stage_6[1][25]), .cin(stage_6[2][25]), .s(stage_7[0][25]), .cout(stage_7[1][26]));
FA FA70_26(.x(stage_6[0][26]), .y(stage_6[1][26]), .cin(stage_6[2][26]), .s(stage_7[0][26]), .cout(stage_7[1][27]));
FA FA70_27(.x(stage_6[0][27]), .y(stage_6[1][27]), .cin(stage_6[2][27]), .s(stage_7[0][27]), .cout(stage_7[1][28]));
FA FA70_28(.x(stage_6[0][28]), .y(stage_6[1][28]), .cin(stage_6[2][28]), .s(stage_7[0][28]), .cout(stage_7[1][29]));
FA FA70_29(.x(stage_6[0][29]), .y(stage_6[1][29]), .cin(stage_6[2][29]), .s(stage_7[0][29]), .cout(stage_7[1][30]));
FA FA70_30(.x(stage_6[0][30]), .y(stage_6[1][30]), .cin(stage_6[2][30]), .s(stage_7[0][30]), .cout(stage_7[1][31]));
FA FA70_31(.x(stage_6[0][31]), .y(stage_6[1][31]), .cin(stage_6[2][31]), .s(stage_7[0][31]), .cout(stage_7[1][32]));
FA FA70_32(.x(stage_6[0][32]), .y(stage_6[1][32]), .cin(stage_6[2][32]), .s(stage_7[0][32]), .cout(stage_7[1][33]));
FA FA70_33(.x(stage_6[0][33]), .y(stage_6[1][33]), .cin(stage_6[2][33]), .s(stage_7[0][33]), .cout(stage_7[1][34]));
FA FA70_34(.x(stage_6[0][34]), .y(stage_6[1][34]), .cin(stage_6[2][34]), .s(stage_7[0][34]), .cout(stage_7[1][35]));
FA FA70_35(.x(stage_6[0][35]), .y(stage_6[1][35]), .cin(stage_6[2][35]), .s(stage_7[0][35]), .cout(stage_7[1][36]));
FA FA70_36(.x(stage_6[0][36]), .y(stage_6[1][36]), .cin(stage_6[2][36]), .s(stage_7[0][36]), .cout(stage_7[1][37]));
FA FA70_37(.x(stage_6[0][37]), .y(stage_6[1][37]), .cin(stage_6[2][37]), .s(stage_7[0][37]), .cout(stage_7[1][38]));
FA FA70_38(.x(stage_6[0][38]), .y(stage_6[1][38]), .cin(stage_6[2][38]), .s(stage_7[0][38]), .cout(stage_7[1][39]));
FA FA70_39(.x(stage_6[0][39]), .y(stage_6[1][39]), .cin(stage_6[2][39]), .s(stage_7[0][39]), .cout(stage_7[1][40]));
FA FA70_40(.x(stage_6[0][40]), .y(stage_6[1][40]), .cin(stage_6[2][40]), .s(stage_7[0][40]), .cout(stage_7[1][41]));
FA FA70_41(.x(stage_6[0][41]), .y(stage_6[1][41]), .cin(stage_6[2][41]), .s(stage_7[0][41]), .cout(stage_7[1][42]));
FA FA70_42(.x(stage_6[0][42]), .y(stage_6[1][42]), .cin(stage_6[2][42]), .s(stage_7[0][42]), .cout(stage_7[1][43]));
FA FA70_43(.x(stage_6[0][43]), .y(stage_6[1][43]), .cin(stage_6[2][43]), .s(stage_7[0][43]), .cout(stage_7[1][44]));
FA FA70_44(.x(stage_6[0][44]), .y(stage_6[1][44]), .cin(stage_6[2][44]), .s(stage_7[0][44]), .cout(stage_7[1][45]));
FA FA70_45(.x(stage_6[0][45]), .y(stage_6[1][45]), .cin(stage_6[2][45]), .s(stage_7[0][45]), .cout(stage_7[1][46]));
FA FA70_46(.x(stage_6[0][46]), .y(stage_6[1][46]), .cin(stage_6[2][46]), .s(stage_7[0][46]), .cout(stage_7[1][47]));
FA FA70_47(.x(stage_6[0][47]), .y(stage_6[1][47]), .cin(stage_6[2][47]), .s(stage_7[0][47]), .cout(stage_7[1][48]));

//HA HA70_45(.x(stage_6[1][45]), .y(stage_6[2][45]), .s(stage_7[0][45]), .cout(stage_7[1][46]));
//HA HA70_46(.x(stage_6[1][46]), .y(stage_6[2][46]), .s(stage_7[0][46]), .cout(stage_7[1][47]));

assign stage_7[0][48] = stage_6[1][48];

////////////////////////////
wire [48:0] stage_8;

FA_48 F0(.a(stage_7[0][47:0]), .b(stage_7[1][47:0]), .cin(1'b0), .cout(stage_8[48]), .s(stage_8[47:0]));

assign out = stage_8;

endmodule
