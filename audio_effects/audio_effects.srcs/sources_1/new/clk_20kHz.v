`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2017 15:20:31
// Design Name: 
// Module Name: clk_20kHz
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


module clk_20kHz(
    input CLK,
    output reg clk_20kHz
    );
    
    reg [11:0] COUNT = 12'b0;
    reg clk_20kHz = 0;
    
    always @ (posedge CLK) begin
        COUNT <= (COUNT == 2499) ? 12'b0 : COUNT + 1;
        clk_20kHz <= (COUNT == 12'b0) ? ~clk_20kHz : clk_20kHz;
    end
    
endmodule
