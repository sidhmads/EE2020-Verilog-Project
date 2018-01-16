`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2017 14:40:04
// Design Name: 
// Module Name: clk_re
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


module clk_re(
    input CLK,
    output reg clkRe
    );
    
    reg [17:0] COUNT = 18'b0;
    reg clkRe = 0;
    
    always @ (posedge CLK) begin
        COUNT <= (COUNT == 170068) ? 18'b0 : COUNT + 1;
        clkRe <= (COUNT == 18'b0) ? ~clkRe : clkRe;
    end
endmodule
