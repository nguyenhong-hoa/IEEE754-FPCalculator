
module SHIFT_LEFT(
	in,
	out,
	shift_num
);

parameter DATA_WIDTH = 32;
parameter SELECT_WIDTH = 5;

input [DATA_WIDTH - 1:0]in;
input [SELECT_WIDTH -1:0]shift_num;
output [DATA_WIDTH - 1:0]out;

wire [DATA_WIDTH*2 - 1:0] tmp;
wire [7: 0] shift_num_left;
wire cout;
wire [31: 0] out_tmp;

assign tmp[DATA_WIDTH*2 -1:DATA_WIDTH] = in;
assign tmp[DATA_WIDTH-1:0] = 0;

FS_8    FS_8_shift_left(.a(8'b00100000),   .b({3'b0, shift_num}),   .cin(1'b0),
                        .out(shift_num_left), .cout(cout));

MUX_32_1 MUX_32_1_0 (.in( tmp[ DATA_WIDTH + 0  -     1: 0 ] ), .out(out_tmp[0 ]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_1 (.in( tmp[ DATA_WIDTH + 1  -     1: 1 ] ), .out(out_tmp[1 ]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_2 (.in( tmp[ DATA_WIDTH + 2  -     1: 2 ] ), .out(out_tmp[2 ]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_3 (.in( tmp[ DATA_WIDTH + 3  -     1: 3 ] ), .out(out_tmp[3 ]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_4 (.in( tmp[ DATA_WIDTH + 4  -     1: 4 ] ), .out(out_tmp[4 ]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_5 (.in( tmp[ DATA_WIDTH + 5  -     1: 5 ] ), .out(out_tmp[5 ]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_6 (.in( tmp[ DATA_WIDTH + 6  -     1: 6 ] ), .out(out_tmp[6 ]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_7 (.in( tmp[ DATA_WIDTH + 7  -     1: 7 ] ), .out(out_tmp[7 ]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_8 (.in( tmp[ DATA_WIDTH + 8  -     1: 8 ] ), .out(out_tmp[8 ]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_9 (.in( tmp[ DATA_WIDTH + 9  -     1: 9 ] ), .out(out_tmp[9 ]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_10(.in( tmp[ DATA_WIDTH + 10 -     1: 10] ), .out(out_tmp[10]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_11(.in( tmp[ DATA_WIDTH + 11 -     1: 11] ), .out(out_tmp[11]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_12(.in( tmp[ DATA_WIDTH + 12 -     1: 12] ), .out(out_tmp[12]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_13(.in( tmp[ DATA_WIDTH + 13 -     1: 13] ), .out(out_tmp[13]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_14(.in( tmp[ DATA_WIDTH + 14 -     1: 14] ), .out(out_tmp[14]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_15(.in( tmp[ DATA_WIDTH + 15 -     1: 15] ), .out(out_tmp[15]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_16(.in( tmp[ DATA_WIDTH + 16 -     1: 16] ), .out(out_tmp[16]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_17(.in( tmp[ DATA_WIDTH + 17 -     1: 17] ), .out(out_tmp[17]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_18(.in( tmp[ DATA_WIDTH + 18 -     1: 18] ), .out(out_tmp[18]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_19(.in( tmp[ DATA_WIDTH + 19 -     1: 19] ), .out(out_tmp[19]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_20(.in( tmp[ DATA_WIDTH + 20 -     1: 20] ), .out(out_tmp[20]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_21(.in( tmp[ DATA_WIDTH + 21 -     1: 21] ), .out(out_tmp[21]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_22(.in( tmp[ DATA_WIDTH + 22 -     1: 22] ), .out(out_tmp[22]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_23(.in( tmp[ DATA_WIDTH + 23 -     1: 23] ), .out(out_tmp[23]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_24(.in( tmp[ DATA_WIDTH + 24 -     1: 24] ), .out(out_tmp[24]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_25(.in( tmp[ DATA_WIDTH + 25 -     1: 25] ), .out(out_tmp[25]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_26(.in( tmp[ DATA_WIDTH + 26 -     1: 26] ), .out(out_tmp[26]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_27(.in( tmp[ DATA_WIDTH + 27 -     1: 27] ), .out(out_tmp[27]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_28(.in( tmp[ DATA_WIDTH + 28 -     1: 28] ), .out(out_tmp[28]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_29(.in( tmp[ DATA_WIDTH + 29 -     1: 29] ), .out(out_tmp[29]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_30(.in( tmp[ DATA_WIDTH + 30 -     1: 30] ), .out(out_tmp[30]), .select(shift_num_left[4:0]));
MUX_32_1 MUX_32_1_31(.in( tmp[ DATA_WIDTH + 31 -     1: 31] ), .out(out_tmp[31]), .select(shift_num_left[4:0]));

assign out = ({32{!shift_num_left[5]}} & out_tmp) | ({32{shift_num_left[5]}} & in);

endmodule
