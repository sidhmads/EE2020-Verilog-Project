`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2017 19:22:30
// Design Name: 
// Module Name: VoiceCountdown
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


module VoiceCountdown(
    input CLK,
    input [2:0] start,
    input toggleCD,
    output [11:0] countDown,
    output reg [15:0] led,
    output reg [2:0] current_count
    );
    
    reg [15:0] COUNT;
    reg [3:0] currentStart = 4'b0;
    reg change = 0;
    wire clk_8k;
    wire current_clk;
    
    clk_8kHz clk8k (CLK, clk_8k);
    
    assign current_clk = (toggleCD == 1 || start != currentStart) ? clk_8k : ((COUNT != 38399) ? clk_8k : 0);
    
    always @ (posedge current_clk) begin
        if (start != currentStart) begin
            change = ~change;
            currentStart = start;
        end
        if (change) begin
            if (start >= 5)
               COUNT = 0;
            else
                COUNT = (5 - start) * 6400;
            change = ~change;
        end
        if (COUNT != 38399) begin
            COUNT <= COUNT + 1;
        end
        
        if (!toggleCD && COUNT == 38399)
            currentStart = 0;
            
        if (COUNT == 38399)
            COUNT <= 16'b0;
            
        if (COUNT >= 0 && COUNT < 6400) begin
            current_count = 5;
            led = 16'b00000000000000101;
        end 
        else if (COUNT >= 6400 && COUNT < 12800) begin
            current_count = 4;
            led = 16'b00000000000000100;
        end
        else if (COUNT >= 12800 && COUNT < 19200) begin
            current_count = 3;
            led = 16'b00000000000000011;
        end
        else if (COUNT >= 19200 && COUNT < 25600) begin
            current_count = 2;
            led = 16'b00000000000000010;
        end
        else if (COUNT >= 25600 && COUNT < 32000) begin
            current_count = 1;
            led = 16'b00000000000000001;
        end
        else if (COUNT >= 32000 && COUNT < 38400) begin
            current_count = 0;
            led = 16'b00000000000000000;
        end
    end
    
    dist_mem_gen_1 dmg1 (COUNT, countDown);  
endmodule
 
