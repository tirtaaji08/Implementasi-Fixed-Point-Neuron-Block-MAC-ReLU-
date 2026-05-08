`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2026 02:26:18 PM
// Design Name: 
// Module Name: tb_neuron_block
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


module tb_neuron_block();

    reg clk;
    reg rst;
    reg [15:0] data_in;
    reg [15:0] weight;
    reg valid_in;
    wire [15:0] out_logic;

    neuron_block uut (
        .clk(clk),
        .rst(rst),
        .valid_input(valid_in),
        .data_in(data_in),
        .weight(weight),
        .out_logic(out_logic)
    );
   // assign out_logic =0;
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        valid_in = 0;
        data_in = 0;
        weight = 0;
        
        // Reset sistem
        #20 rst = 0;
        #10;

        // --- SKENARIO 1: Akumulasi Positif ---
        // Input 1: 2.0 * 1.5 = 3.0
        data_in = 16'h0200; weight = 16'h0180; valid_in = 1;
        #10; 
        
        // Input 2: 1.0 * 1.0 = 1.0
        // Total akumulasi sementara: 3.0 + 1.0 = 4.0
        data_in = 16'h0100; weight = 16'h0100;
        #10;
        valid_in = 0;
        #20;

        // Reset akumulator dulu
        rst = 1; #10; rst = 0; #10;
        
        // Input: 2.0 * -1.0 = -2.0
        // -1.0 dalam Q8.8adalah 16'hFF00
        data_in = 16'h0200; weight = 16'hFF00; valid_in = 1;
        #10;
        valid_in = 0;
        
        // Cek hasil: out_logic harus 0 karena hasil perkalian negatif
        #30;
        
    end
endmodule
