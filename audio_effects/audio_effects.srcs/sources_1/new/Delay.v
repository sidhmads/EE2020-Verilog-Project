`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2017 14:53:47
// Design Name: 
// Module Name: Delay
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


module Delay(
    input clk_20k,
    input fasterPitch,
    input [11:0] MIC_IN,
    output reg [11:0] speaker
    );
   
    reg [12:0] counter = 0;
    reg [12:0] offset = 0;
    reg [11:0] memory [0:4999];
    
    always @ (posedge clk_20k) begin 
      memory[0] <= MIC_IN;
      for(counter=0;counter<4999;counter=counter+1) begin
        memory[counter+1] <= memory[counter];
      end
      if(!fasterPitch) begin
        speaker <= memory[4999];
      end
      else begin
        offset = (offset == 0) ? 4999 : offset - 1;
        speaker <= memory[offset];
      end
    end
 
endmodule
