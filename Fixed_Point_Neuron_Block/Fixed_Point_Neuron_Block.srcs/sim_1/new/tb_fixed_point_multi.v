`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2026 11:14:52 PM
// Design Name: 
// Module Name: tb_fixed_point_multi
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


module tb_fixed_point_multi();
reg [15:0] a;
reg [15:0] b;
wire [15:0] result;

Fixed_Point_Multi uut(.a(a),
.b(b),
.result(result));

initial begin
a = 16'h0280; b = 16'h0200;
        #10;
a = 16'h0140; b = 16'h0080;
        #10;
$stop;
end

    
endmodule
