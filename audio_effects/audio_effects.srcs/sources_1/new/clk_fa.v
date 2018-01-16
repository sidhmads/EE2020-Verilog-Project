`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2017 14:44:19
// Design Name: 
// Module Name: clk_fa
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


module clk_fa(
    input CLK,
    output reg clkFa
    );
    
    reg [17:0] COUNT = 18'b0;
    reg clkFa = 0;
    
    always @ (posedge CLK) begin
        COUNT <= (COUNT == 143266) ? 18'b0 : COUNT + 1;
        clkFa <= (COUNT == 18'b0) ? ~clkFa : clkFa;
    end
endmodule
