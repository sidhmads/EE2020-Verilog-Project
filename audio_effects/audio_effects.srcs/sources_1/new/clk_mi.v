`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2017 14:41:34
// Design Name: 
// Module Name: clk_mi
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


module clk_mi(
    input CLK,
    output reg clkMi
    );
    
    reg [17:0] COUNT = 187'b0;
    reg clkMi = 0;
    
    always @ (posedge CLK) begin
        COUNT <= (COUNT == 151515) ? 18'b0 : COUNT + 1;
        clkMi <= (COUNT == 18'b0) ? ~clkMi : clkMi;
    end
endmodule
