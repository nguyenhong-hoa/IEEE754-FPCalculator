
module FA_8_tb();

parameter DATA_WIDTH = 8;
reg [DATA_WIDTH-1:0]t_a;
reg [DATA_WIDTH-1:0]t_b;
reg t_cin;
wire cout;

wire [DATA_WIDTH-1:0]t_s;

FA_8 FA_8_0(.a(t_a),.b(t_b),.cin(t_cin),.s(t_s), .cout(cout));

initial begin
#0
t_a = 8'b0000000;
t_b = 8'b00000000;
t_cin = 1'b0;
#50
t_a = 8'b00000000;
t_b = 8'b00010000;
#50
t_a = 8'b00000000;
t_b = 8'b00100000;
#50
t_a = 8'b00000000;
t_b = 8'b01000000;
#50
t_a = 8'b00100000;
t_b = 8'b01100000;
#50
t_a = 8'b00000000;
t_b = 8'b10010000;
#50
t_a = 8'b00010000;
t_b = 8'b00110000;
#50
t_a = 8'b00100000;
t_b = 8'b10100000;
#50
t_a = 8'b00100000;
t_b = 8'b00100000;
#50
t_a = 8'b00100001;
t_b = 8'b01100001;

#100 $finish;
end
endmodule