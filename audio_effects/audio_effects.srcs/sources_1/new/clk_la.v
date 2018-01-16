`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2017 14:44:19
// Design Name: 
// Module Name: clk_la
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


module clk_la(
    input CLK,
    output reg clkLa
    );
    
    reg [16:0] COUNT = 17'b0;
    reg clkLa = 0;
    
    always @ (posedge CLK) begin
        COUNT <= (COUNT == 113636) ? 17'b0 : COUNT + 1;
        clkLa <= (COUNT == 17'b0) ? ~clkLa : clkLa;
    end
endmodule
