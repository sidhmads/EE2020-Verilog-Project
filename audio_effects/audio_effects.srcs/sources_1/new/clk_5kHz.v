`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2017 14:52:05
// Design Name: 
// Module Name: clk_5kHz
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


module clk_5kHz(
     input CLK,
     output reg clk_5Hz
    );
    
    reg [13:0] COUNT = 14'b0;
    reg clk_5kHz = 0;
    
    always @ (posedge CLK) begin
        COUNT <= (COUNT == 9999) ? 14'b0 : COUNT + 1;
        clk_5kHz <= (COUNT == 24'b0) ? ~clk_5kHz : clk_5kHz;
    end
    
endmodule
