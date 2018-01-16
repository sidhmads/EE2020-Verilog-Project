`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2017 16:39:26
// Design Name: 
// Module Name: clk5
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


module clk_5HZ(
 input CLK,
 output reg clk_5Hz
 );

   reg [23:0] COUNT = 24'b0;
   reg clk_5Hz = 0;
   
   always @ (posedge CLK) begin
       COUNT <= (COUNT == 9999999) ? 24'b0 : COUNT + 1;
       clk_5Hz <= (COUNT == 24'b0) ? ~clk_5Hz : clk_5Hz;
   end
   
endmodule
