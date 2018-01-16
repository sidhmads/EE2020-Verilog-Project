`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2017 12:05:43
// Design Name: 
// Module Name: clk_8kHz
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


module clk_8kHz(
    input CLK,
    output reg clk_8kHz
    );
    
    reg [12:0] COUNT = 13'b0;
    reg clk_20kHz = 0;
    
    always @ (posedge CLK) begin
        COUNT <= (COUNT == 6249) ? 13'b0 : COUNT + 1;
        clk_8kHz <= (COUNT == 13'b0) ? ~clk_8kHz : clk_8kHz;
    end

endmodule
