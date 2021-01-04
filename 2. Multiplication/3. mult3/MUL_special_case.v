module MUL_special_case(
    a,
    b,
    out,
    check_special
);

parameter Inf_abs = 31'b1111111100000000000000000000000;
parameter NaN_num = 32'b11111111100000000000000000000001;
parameter Zero_num = 32'b0;

parameter   Zero = 3'b000;
parameter   Normal = 3'b001;
parameter   Inf_pos = 3'b010;
parameter   Inf_neg = 3'b011;
parameter   NaN = 3'b100;

input   [31: 0] a, b;
output  [31: 0] out;
output          check_special;

reg     [31: 0] out;
wire             check_special;

wire    [2: 0] out_a, out_b;
wire            check_a, check_b;

SepcialNum  SP_a(.in(a), .out(out_a), .check_out(check_a));
SepcialNum  SP_b(.in(b), .out(out_b), .check_out(check_b));

assign  check_special = check_a | check_b;

always @(out_a, out_b)
begin
            // Zero
            if  (((out_a == Zero) && (out_b == Normal))
                 || ((out_a == Normal) && (out_b == Zero))
                 || ((out_a == Zero) && (out_b == Zero)))                                                
                assign out = Zero_num;
            // NaN          
            else if  (((out_a == Zero) && (out_b == Inf_pos))
                 || ((out_a == Zero) && (out_b == Inf_neg))
                 || ((out_a == Inf_pos) && (out_b == Zero))
                 || ((out_a == Inf_neg) && (out_b == Zero))
                 || (out_a == NaN)
                 || (out_b == NaN))                                                 
                assign out = NaN_num; 
            // inf               
            // else if (((out_a == Inf_pos) && (out_b != Zero) && (out_b != NaN))
            //         ||((out_a == Inf_neg) && (out_b != Zero) && (out_b != NaN))
            //         ||((out_a != Zero) && (out_b == Inf_pos) && (out_a != NaN))
            //         ||((out_a != Zero) && (out_b == Inf_neg) && (out_a != NaN)))
            else                          
                assign out = {a[31]^b[31], Inf_abs};                                    
end

endmodule