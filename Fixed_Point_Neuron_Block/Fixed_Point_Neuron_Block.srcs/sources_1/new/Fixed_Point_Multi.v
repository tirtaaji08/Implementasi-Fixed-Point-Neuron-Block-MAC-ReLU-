`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2026 11:02:40 PM
// Design Name: 
// Module Name: Fixed_Point_Multi
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


module Fixed_Point_Multi(
    input wire [15:0] a ,
    input wire [15:0] b,
    output wire [31:0]result
    );
    
    wire [31:0] temp_result;
    assign temp_result = $signed (a) * $signed (b);     
    assign result = temp_result [23:8];
      
endmodule
