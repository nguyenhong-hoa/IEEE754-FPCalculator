module FA_tb();

parameter DATA_WIDTH = 4;
reg [DATA_WIDTH-1:0]t_a;
reg [DATA_WIDTH-1:0]t_b;
reg t_cin;
wire cout;

wire [DATA_WIDTH-1:0]t_s;

FA_4 FA_4_0(.a(t_a),.b(t_b),.cin(t_cin),.s(t_s), .cout(cout));

initial begin
#0
t_a = 4'b0000;
t_b = 4'b0000;
t_cin = 1'b0;
#50
t_a = 4'b0000;
t_b = 4'b0001;
#50
t_a = 4'b0000;
t_b = 4'b0010;
#50
t_a = 4'b0000;
t_b = 4'b0100;
#50
t_a = 4'b0010;
t_b = 4'b0110;
#50
t_a = 4'b0000;
t_b = 4'b1001;
#50
t_a = 4'b0001;
t_b = 4'b0011;
#50
t_a = 4'b0010;
t_b = 4'b1010;
#50
t_a = 4'b0010;
t_b = 4'b0010;
#50
t_a = 4'b0011;
t_b = 4'b0111;
#50
t_a = 4'b1010;
t_b = 4'b1011;
#50
t_a = 4'b1111;
t_b = 4'b0001;
#50
t_a = 4'b1000;
t_b = 4'b1001;
#50
t_a = 4'b0101;
t_b = 4'b0110;
#50
t_a = 4'b0010;
t_b = 4'b1011;
#50
t_a = 4'b0110;
t_b = 4'b1110;
#50
t_a = 4'b0111;
t_b = 4'b0001;
#50
t_a = 4'b0010;
t_b = 4'b1010;
#50
t_a = 4'b1110;
t_b = 4'b1101;
#50
t_a = 4'b0100;
t_b = 4'b0011;
#1000
t_a = 4'b1001;
t_b = 4'b1100;
#50
t_a = 4'b1010;
t_b = 4'b1110;
#100 $finish;
end
endmodule