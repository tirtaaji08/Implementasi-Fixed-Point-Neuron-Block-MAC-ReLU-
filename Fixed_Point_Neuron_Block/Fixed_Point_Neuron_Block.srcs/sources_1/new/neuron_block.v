`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2026 09:54:33 AM
// Design Name: 
// Module Name: neuron_block
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


module neuron_block(
    input wire clk,
    input wire rst,
    input wire valid_input,
    input wire [15:0] data_in,   // Input (Q8.8)
    input wire [15:0] weight,    // Weight (Q8.8)
    output reg [15:0] out_logic  //output data setelah logic
    );
  wire [15:0] out_multi;
  reg [15:0] accumulator;
  Fixed_Point_Multi multiplier(.a(data_in),
                               .b(weight),
                               .result(out_multi));
  // --- LOGIKA ACCUMULATOR ---
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            accumulator <= 16'd0;
        end else if (valid_input) begin
            accumulator <= accumulator + $signed(out_multi);
        end
    end

    // --- LOGIKA ReLU ---
    always @(*) begin
        if (accumulator[15] == 1'b1) begin 
            out_logic = 16'h0000;
        end else begin
            out_logic = accumulator[15:0];
        end
    end
   
endmodule