`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2017 21:28:05
// Design Name: 
// Module Name: clk_1Hz
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


module clk_1Hz(
 input CLK,
 output reg clk_1Hz
 );

   reg [25:0] COUNT = 26'b0;
   reg clk_1Hz = 0;
   
   always @ (posedge CLK) begin
       COUNT <= (COUNT == 49999999) ? 26'b0 : COUNT + 1;
       clk_1Hz <= (COUNT == 26'b0) ? ~clk_1Hz : clk_1Hz;
   end
   
endmodule