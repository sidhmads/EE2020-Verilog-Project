`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2017 14:37:46
// Design Name: 
// Module Name: clk_do
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


module clk_do(
    input CLK,
    output reg clkDo
    );
    
    reg [17:0] COUNT = 18'b0;
    reg clkDo = 0;
    
    always @ (posedge CLK) begin
        COUNT <= (COUNT == 190839) ? 18'b0 : COUNT + 1;
        clkDo <= (COUNT == 18'b0) ? ~clkDo : clkDo;
    end
endmodule
