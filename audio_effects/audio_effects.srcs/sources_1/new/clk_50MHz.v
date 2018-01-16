`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2017 16:02:51
// Design Name: 
// Module Name: clk_50MHz
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


module clk_50MHz(
    input CLK,
    output reg clk_50MHz
    );
    
    reg COUNT = 1'b0;
    reg clk_50MHz = 0;
    
    always @ (posedge CLK) begin
        COUNT <= COUNT + 1;
        clk_50MHz <= (COUNT == 1'b0) ? ~clk_50MHz : clk_50MHz;
    end
    
endmodule
