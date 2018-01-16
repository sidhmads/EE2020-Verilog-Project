`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2017 14:44:19
// Design Name: 
// Module Name: clk_so
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


module clk_so(
    input CLK,
    output reg clkSo
    );
    
    reg [16:0] COUNT = 17'b0;
    reg clkSo = 0;
    
    always @ (posedge CLK) begin
        COUNT <= (COUNT == 127550) ? 17'b0 : COUNT + 1;
        clkSo <= (COUNT == 17'b0) ? ~clkSo : clkSo;
    end
endmodule
