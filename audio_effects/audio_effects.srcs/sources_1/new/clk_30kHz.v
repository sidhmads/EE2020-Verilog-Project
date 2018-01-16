`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2017 02:34:56
// Design Name: 
// Module Name: clk_30kHz
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


module clk_30kHz(
input CLK,
    output reg clk_30kHz
    );
    
    reg [10:0] COUNT = 11'b0;
    reg clk_30kHz = 0;
    
    always @ (posedge CLK) begin
        COUNT <= (COUNT == 1666) ? 11'b0 : COUNT + 1;
        clk_30kHz <= (COUNT == 11'b0) ? ~clk_30kHz : clk_30kHz;
    end
    
endmodule
