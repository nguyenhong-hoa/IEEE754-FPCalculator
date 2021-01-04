`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2020 10:12:33 PM
// Design Name: 
// Module Name: HA
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


module HA(
    x,
    y,
    s,
    cout
    );
    
input x, y;
output s, cout;

assign s = x ^ y;
assign cout  = x & y;

endmodule
